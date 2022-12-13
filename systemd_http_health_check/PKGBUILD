# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=systemd_http_health_check
pkgver=0.1.1
pkgrel=1
pkgdesc="A companion daemon to notify systemd about the health of a HTTP server" 
arch=('x86_64')
url="http://github.com/jhass/systemd_http_health_check"
license=('BSD')
depends=('systemd-libs' 'gc' 'libevent' 'pcre')
makedepends=('crystal' 'shards')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jhass/systemd_http_health_check/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "$pkgname-$pkgver"
  shards install
}

build() {
  cd "$pkgname-$pkgver"
  shards build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('1f63891a22a22f82df7ac9609891e374ee5b4c21aefcccd1fcbd1f172340bc52')
