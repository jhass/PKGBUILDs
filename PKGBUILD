# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Jonne Haß <me@jhass.eu>

_gemname=acme-client
pkgname=ruby-$_gemname
pkgver=2.0.5
pkgrel=2
pkgdesc='Client for the ACME protocol.'
arch=(any)
url='http://github.com/unixcharles/acme-client'
license=(MIT)
depends=(ruby ruby-faraday-0.9)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('283b9975e40f4aef0865ba03fa8035f6951d0cea')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
