pkg_name=bitcoin
pkg_origin=misthosio
pkg_version="0.14.2"
# pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
# pkg_license=('Apache-2.0')
pkg_source="https://github.com/bitcoin/bitcoin/archive/v${pkg_version}.tar.gz"
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="e0ac23f01a953fcc6290c96799deeffb32aa76ca8e216c564d20c18e75a25219"
pkg_deps=(
  core/db
  core/coreutils
  core/glibc
  core/gcc-libs
  core/libressl
  core/boost
  core/libevent
)
pkg_build_deps=(
  core/busybox
  core/make
  core/gcc
  core/autoconf
  core/automake
  core/which
  core/libtool
  core/pkg-config
)
pkg_bin_dirs=(bin)
# pkg_exposes=(port ssl-port)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"

do_build() {
  export ACLOCAL_PATH="$(pkg_path_for core/pkg-config)/share/aclocal:$(pkg_path_for core/libtool)/share/aclocal"
  ./autogen.sh
  ./configure --prefix="$pkg_prefix" --with-incompatible-bdb --with-boost-libdir="$(pkg_path_for core/boost)/lib"
  make
}