# Custom Docker images

> Intended for use with Forgejo Runner & Forgejo Actions. Not required to be used under those circumstances.

[![Scheduled build (Ubuntu)](https://github.com/Ryubing/oci/actions/workflows/build-ubuntu.yml/badge.svg)](https://github.com/Ryubing/oci/actions/workflows/build-ubuntu.yml)

## When updates will be applied to images

- A package that will be required for action(s) to work properly might be added/removed/changed
- Any maintenance that will be required due to:
  - GitHub Container Registry
  - GitHub Actions
  - Act
- Performance and/or disk space improvements

## Images available

- [ChristopherHX/runner-image-blobs](https://github.com/ChristopherHX/runner-image-blobs) GitHub Actions Hosted runner image copy containing almost all possible tools (image is extremely big, 20GB compressed, ~60GB extracted)
  - A tar backup of the GitHub Hosted Runners are uploaded once a week via a custom docker image upload script in runner-image-blobs repository
  - Synced by cron job `.github/workflows/copy-full-image.yml` to the following tags
  - You can verify if the Image is still updated regulary by inspecting the dates in `docker buildx imagetools inspect ryubing/ubuntu:full-latest --format "{{ json . }}"`
    - The friendly tag name version in the output can be looked up [here](https://github.com/actions/runner-images/releases) to find out more about the sources
  - available tags are
    - `ghcr.io/ryubing/ubuntu:full-latest` (aka `full-24.04`)
    - `ghcr.io/ryubing/ubuntu:full-24.04`
    - `ghcr.io/ryubing/ubuntu:full-22.04`

- [`/linux/ubuntu/act`](./linux/ubuntu/scripts/act.sh) - image used in [github.com/nektos/act][nektos/act] as medium size image retaining compatibility with most actions while maintaining small size
  - `ghcr.io/ryubing/ubuntu:act-22.04`
  - `ghcr.io/ryubing/ubuntu:act-24.04`
  - `ghcr.io/ryubing/ubuntu:act-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:act-latest` (aka `act-24.04`)
- [`/linux/ubuntu/runner`](./linux/ubuntu/scripts/runner.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `runner` as user instead of `root`
  - `ghcr.io/ryubing/ubuntu:runner-22.04`
  - `ghcr.io/ryubing/ubuntu:runner-24.04`
  - `ghcr.io/ryubing/ubuntu:runner-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:runner-latest` (aka `runner-24.04`)
- [`/linux/ubuntu/js`](./linux/ubuntu/scripts/js.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `js` tools installed (`yarn`, `nvm`, `node` v20/v24, `pnpm`, `grunt`, etc.)
  - `ghcr.io/ryubing/ubuntu:js-22.04`
  - `ghcr.io/ryubing/ubuntu:js-24.04`
  - `ghcr.io/ryubing/ubuntu:js-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:js-latest` (aka `js-24.04`)
- [`/linux/ubuntu/rust`](./linux/ubuntu/scripts/rust.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `rust` tools installed (`rustfmt`, `clippy`, `cbindgen`, etc.)
  - `ghcr.io/ryubing/ubuntu:rust-22.04`
  - `ghcr.io/ryubing/ubuntu:rust-24.04`
  - `ghcr.io/ryubing/ubuntu:rust-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:rust-latest` (aka `act-24.04`)
- [`/linux/ubuntu/pwsh`](./linux/ubuntu/scripts/pwsh.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `pwsh` tools and modules installed
  - `ghcr.io/ryubing/ubuntu:pwsh-22.04`
  - `ghcr.io/ryubing/ubuntu:pwsh-24.04`
  - `ghcr.io/ryubing/ubuntu:pwsh-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:pwsh-latest` (aka `pwsh-24.04`)
- [`/linux/ubuntu/go`](./linux/ubuntu/scripts/go.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `go` tools installed
  - `ghcr.io/ryubing/ubuntu:go-22.04`
  - `ghcr.io/ryubing/ubuntu:go-24.04`
  - `ghcr.io/ryubing/ubuntu:go-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:go-latest` (aka `go-24.04`)
- [`/linux/ubuntu/dotnet`](./linux/ubuntu/scripts/dotnet.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `.NET` tools installed
  - `ghcr.io/ryubing/ubuntu:dotnet-22.04`
  - `ghcr.io/ryubing/ubuntu:dotnet-24.04`
  - `ghcr.io/ryubing/ubuntu:dotnet-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:dotnet-latest` (aka `dotnet-24.04`)
- [`/linux/ubuntu/java-tools`](./linux/ubuntu/scripts/java-tools.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with Java tools installed
  - `ghcr.io/ryubing/ubuntu:java-tools-22.04`
  - `ghcr.io/ryubing/ubuntu:java-tools-24.04`
  - `ghcr.io/ryubing/ubuntu:java-tools-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:java-tools-latest` (aka `java-tools-24.04`)
- [`/linux/ubuntu/gh`](./linux/ubuntu/scripts/gh.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with GitHub CLI tools installed
  - `ghcr.io/ryubing/ubuntu:gh-22.04`
  - `ghcr.io/ryubing/ubuntu:gh-24.04`
  - `ghcr.io/ryubing/ubuntu:gh-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:gh-latest` (aka `gh-24.04`)
- [`/linux/ubuntu/custom`](./linux/ubuntu/scripts/custom.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with custom tools installed
  - `ghcr.io/ryubing/ubuntu:custom-22.04`
  - `ghcr.io/ryubing/ubuntu:custom-24.04`
  - `ghcr.io/ryubing/ubuntu:custom-26.04` (beta image)
  - `ghcr.io/ryubing/ubuntu:custom-latest` (aka `custom-24.04`)

## Repository contains parts of [`actions/virtual-environments`][actions/virtual-environments] which is licenced under ["MIT License"](https://github.com/actions/virtual-environments/blob/main/LICENSE)

[nektos/act]: https://github.com/nektos/act
[actions/virtual-environments]: https://github.com/actions/virtual-environments
[catthehacker/virtual-environments-fork]: https://github.com/catthehacker/virtual-environments-fork/tree/master/images/linux
[forgejo/runner]: https://code.forgejo.org/forgejo/runner/