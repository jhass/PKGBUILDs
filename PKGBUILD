# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=public_suffix_list
pkgver=20151125
pkgrel=1
pkgdesc='List of "public suffixes" under which Internet users can (or historically could) directly register names'
arch=('any')
url="https://publicsuffix.org/"
license=('MPL')
source=("https://publicsuffix.org/list/public_suffix_list.dat")

package() {
  cd "$srcdir"
  install -Dm644 public_suffix_list.dat "$pkgdir/usr/share/publicsuffix/effective_tld_names.dat"
}
sha256sums=('f150911ddb65d7ce583d38344a393fd8e120db5941a51b0fda73dded18d1fa73')
