pkg_name=libiconv
pkg_version=1.14
pkg_derivation=chef
pkg_license=('gplv2')
pkg_maintainer="The Bldr Maintainers <bldr@chef.io>"
pkg_source=http://ftp.gnu.org/pub/gnu/${pkg_name}/${pkg_name}-${pkg_version}.tar.gz
pkg_filename=${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=72b24ded17d687193c3366d0ebe7cde1e6b18f0df8c55438ac95be39e8a30613
pkg_gpg_key=3853DA6B
pkg_deps=(chef/glibc)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
    patch -p1 -i $PLAN_CONTEXT/patches/libiconv-1.14_srclib_stdio.in.h-remove-gets-declarations.patch
    ./configure --prefix=${pkg_prefix}
    make
}