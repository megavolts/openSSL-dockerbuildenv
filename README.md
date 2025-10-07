OpenSSL Build Environment for docker
====================================

[![Current OpenSSL release](https://img.shields.io/github/v/tag/openssl/openssl?label=Current%20OpenSSL%20release&style=for-the-badge)](https://github.com/openssl/openssl/tags) 

[![OpenSSL Build Environment](https://img.shields.io/github/v/release/megavolts/openssl-dockerbuildenv?include_prereleases&label=megavolts/openssl-dockerbuildenv%20release&style=for-the-badge)](https://github.com/megavolts/openssl-dockerbuildenv/releases)
![Build Status](https://img.shields.io/github/actions/workflow/status/megavolts/openssl-dockerbuildenv/CD-30-tag_and_release.yaml?branch=main&style=for-the-badge&label=Build%20Status)
![Security Scan Status](https://img.shields.io/github/actions/workflow/status/megavolts/openssl-dockerbuildenv/CD-90-security_scan.yaml?branch=main&style=for-the-badge&label=Security%20Scan)

<details> 
    
  <summary>Build status</summary><br>
  <!-- https://img.shields.io/badges/git-hub-actions-workflow-status -->

![CD Unbound Release Check](https://img.shields.io/github/actions/workflow/status/megavolts/openssl-dockerbuildenv/CD-10-upstream_release_check.yaml?branch=main&style=for-the-badge&label=CD%20Upstream%20Release%20Check)

![CD Build Docker Image](https://img.shields.io/github/actions/workflow/status/megavolts/openssl-dockerbuildenv/CD-20-build_openssl.yaml?branch=main&style=for-the-badge&label=CD%20Build%20Docker%20Image)

![CD Release Tag](https://img.shields.io/github/actions/workflow/status/megavolts/openssl-dockerbuildenv/CD-30-tag_and_release.yaml?branch=main&style=for-the-badge&label=CD%20Release%20latest%20tag)

</details>

This is an alpine based OpenSSL build environment used by [`megavolts/unbound-docker`](https://github.com/megavolts/unbound-docker/), [`megavolts/adguard_unbdound-docker`](https://github.com/megavolts/adguard_unbound-docker/) and MegaVolts' addons `unbound` and `adguard_unbound` for Home Assistant [`megavolts/hassio-addons`](https://github.com.com/megavolts/hassio-addons)

This docker build environment only contains the OpenSSL libraries to build and run Unbound.

## Changes
Upstream release of OpenSSL triggers new releases of the OpenSSL build environment.

You can see the changes in the [Releases](https://github.com/megavolts/openSSL-dockerbuildenv/releases) section.

## Issues
If you have any problems with or questions about this image, please contact me
through a [GitHub issue](https://github.com/megavolts/openssl-dockerbuildenv/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small. I
imagine the upstream projects would be equally pleased to receive your
contributions.

## Acknowledgments

Thanks to the many Docker Images who got me inspired, especially [ϺΛDИVTTΛH](https://github.com/madnuttah) and [MatthewVance](https://github.com/MatthewVance).

Credits for upstream project goes to:
- [Alpine Linux](https://www.alpinelinux.org/)
- [Docker](https://www.docker.com/)
- [OpenSSL](https://www.openssl.org/)

## Licenses
### License

Unless otherwise specified, all code is released under the MIT License (MIT).
See the [repository's `LICENSE`
file](https://github.com/megavolts/openssl-dockerbuildenv/blob/master/LICENSE) for
details.

### Licenses for other components

- Docker: [Apache 2.0](https://github.com/docker/docker/blob/master/LICENSE)
- OpenSSL: [Apache-style license](https://www.openssl.org/source/license.html)
