## Stenographer Packager using [nfpm](https://github.com/goreleaser/nfpm)

### Requirements
* [nfpm](https://github.com/goreleaser/nfpm) a simple deb and rpm packager written in Go

### Usage
#### DEB
```
nfpm pkg --config ./package/nfpm.yml --target /tmp/stenographer.deb
```
#### RPM
```
nfpm pkg --config ./package/nfpm.yml --target /tmp/stenographer.rpm
```

