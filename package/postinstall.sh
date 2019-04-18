# nfpm example config file
name: "stenographer"
arch: "amd64"
platform: "linux"
version: "v1.0.1"
section: "default"
priority: "extra"
replaces:
- stenographer
provides:
- stenographer
depends:
- libcap2-bin
- jq
- curl
# recommends on rpm packages requires rpmbuild >= 4.13
recommends:
- openssl
# suggests on rpm packages requires rpmbuild >= 4.13
maintainer: "Lorenzo Mangani <lorenzo.mangani@gmail.com>"
description: |
  Stenographer is a packet capture solution which aims to quickly spool all packets to disk, then provide simple, fast access to subsets of those packets.
vendor: "Google"
homepage: "http://github.com/google/stenographer"
license: "MIT"
bindir: "/usr/local/bin"
files:
  ./stenographer: "/usr/bin/stenographer"
  ./stenotype/stenotype: "/usr/bin/stenotype"
  ./stenoread: "/usr/bin/stenoread"
  ./stenoraw: "/usr/bin/stenoraw"
  ./stenortp: "/usr/bin/stenortp"
  ./stenocurl: "/usr/bin/stenocurl"
  /etc/init/stenographer.conf: "/etc/init/stenographer.conf"
  /etc/security/limits.d/stenographer.conf: "/etc/security/limits.d/stenographer.conf"
  /lib/systemd/system/stenographer.service: "/lib/systemd/system/stenographer.service"
  /etc/stenographer/certs/**/*: "/etc/stenographer/certs"
  /etc/stenographer/config: "/etc/stenographer/config"
config_files:
  /etc/stenographer/config: "/etc/stenographer/config"
overrides:
  rpm:
    scripts:
      preinstall: ./scripts/preinstall.sh
#      postremove: ./scripts/postremove.sh
  deb:
    scripts:
      postinstall: ./postinstall.sh
#      preremove: ./scripts/preremove.sh
