# Maintainer: Jonne Haß <me@jhass.eu>

_gemname=faraday-detailed_logger
pkgname=ruby-$_gemname
pkgver=2.3.0
pkgrel=1
pkgdesc='A detailed request and response logger for Faraday.'
arch=(any)
url='https://github.com/envylabs/faraday-detailed_logger'
license=(MIT)
depends=(ruby ruby-faraday)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('3799d0356f715535e0fa76eb24293c82770f7fab')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
