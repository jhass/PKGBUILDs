require "erb"
require "pathname"
require "fileutils"

include FileUtils

VERSION = "0.9.0.0"
PACKAGES = [
  {
    ruby_version: nil, # Main package, Ruby 3.3
    db: "mysql",
    db_service: "mariadb.service",
    git: false,
    additional_description: "(MariaDB/MySQL)",
    additional_depends: "'libmariadbclient'",
    additional_optdepends: "'mariadb: Database server'",
    source: "diaspora-${pkgver}.tar.gz::https://github.com/diaspora/diaspora/archive/v${pkgver}.tar.gz",
    source_dir: "diaspora-#{VERSION}"
  },
  {
    ruby_version: nil, # Main package, Ruby 3.3
    db: "postgresql",
    db_service: "postgresql.service",
    git: false,
    additional_description: "(PostgreSQL)",
    additional_depends: "'postgresql-libs'",
    additional_optdepends: "'postgresql: Database server'",
    source: "diaspora-${pkgver}.tar.gz::https://github.com/diaspora/diaspora/archive/v${pkgver}.tar.gz",
    source_dir: "diaspora-#{VERSION}"
  },
  {
    ruby_version: nil, # Main package, Ruby 3.3
    db: "mysql",
    db_service: "mariadb.service",
    git: true,
    additional_description: "(development head) (MySQL)",
    additional_depends: "'libmariadbclient'",
    additional_optdepends: "'mariadb: Database server'",
    source: "git+https://github.com/diaspora/diaspora.git#branch=develop",
    source_dir: "diaspora"
  },
  {
    ruby_version: nil, # Main package, Ruby 3.3
    db: "postgresql",
    db_service: "postgresql.service",
    git: true,
    additional_description: "(development head) (PostgreSQL)",
    additional_depends: "'postgresql-libs'",
    additional_optdepends: "'postgresql: Database server'",
    source: "git+https://github.com/diaspora/diaspora.git#branch=develop",
    source_dir: "diaspora"
  }
]

def render_pkgbuild(package)
  db, git, additional_description, additional_depends, additional_optdepends, source, source_dir, ruby_version, =
    package.values_at(:db, :git, :additional_description, :additional_depends, :additional_optdepends, :source, :source_dir, :ruby_version)
  additional_makedepends = "'git'" if git
  version = VERSION
  package_name = "diaspora-#{db}#{"-git" if git}"
  ruby_suffix = "-#{ruby_version}" if ruby_version
  ERB.new(File.read("PKGBUILD.erb")).result(binding)
end

def render_service(package)
  db = package[:db_service]

  ERB.new(File.read("diaspora.service.erb")).result(binding)
end


PACKAGES.each do |package|
  package_name = "diaspora-#{package[:db]}#{"-git" if package[:git]}"
  root_path = Pathname.new("..").expand_path.join(package_name)
  File.write root_path.join("PKGBUILD"), render_pkgbuild(package)
  File.write root_path.join("diaspora.service"), render_service(package)
  cp "diaspora.install", root_path.join("diaspora.install")
  cp "diaspora.bash_profile", root_path.join("diaspora.bash_profile")
  cp "diaspora.bashrc", root_path.join("diaspora.bashrc")
  cp "diaspora.tmpfiles.d.conf", root_path.join("diaspora.tmpfiles.d.conf")
  Dir.chdir(root_path) do
    system "updpkgsums"
    system "makepkg -sfc#{'o' unless ARGV.include?('-f')}"
    system "makepkg --printsrcinfo > .SRCINFO"
    system "git add ."
  end
end
