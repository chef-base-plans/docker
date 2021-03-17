pkg_name=docker
pkg_description="The Docker Engine"
pkg_origin=core
pkg_version=19.03.9
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('Apache-2')
pkg_source="https://download.docker.com/linux/static/stable/x86_64/${pkg_name}-${pkg_version}.tgz"
pkg_upstream_url=https://docs.docker.com/engine/installation/binaries/
pkg_shasum=1c03c78be198d9085e7dd6806fc5d93264baaf0c7ea17f584d00af48eae508ee
pkg_dirname=docker
pkg_bin_dirs=(bin)

do_build() {
  return 0
}

do_install() {
  for bin in *; do
    install -v -D "${bin}" "${pkg_prefix}/bin/${bin}"
  done
}

# Skip stripping down the Go binaries
do_strip() {
  return 0
}
