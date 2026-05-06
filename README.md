<table align="center">
    <tr>
        <td align="center" width="25%">
            <img src="https://raw.githubusercontent.com/Ryubing/Assets/refs/heads/main/RyujinxApp_1024.png" alt="Ryujinx" >
        </td>
        <td align="center" width="75%">
          
# Custom Ubuntu OCI images

A set of custom Ubuntu OCI images, primary for use with [Forgejo Actions](https://forgejo.org/docs/latest/user/actions/overview/) on [Forgejo Runner](https://code.forgejo.org/forgejo/runner/).

[![Scheduled build (Ubuntu)](https://github.com/Ryubing/oci/actions/workflows/build-ubuntu.yml/badge.svg)](https://github.com/Ryubing/oci/actions/workflows/build-ubuntu.yml)
<br>
[![Discord](https://img.shields.io/discord/1294443224030511104?color=5865F2&label=Ryubing&logo=discord&logoColor=white)](https://discord.gg/PEuzjrFXUA)
        </td>
    </tr>
</table>

This is a fork of [catthehacker/docker_images](https://github.com/catthehacker/docker_images); used to create the `ghcr.io/catthehacker/ubuntu` images.<br/>
We have been using these docker images for some time, and they work well. However, there's some tools we'd like to have in them pre-installed to save workflow time.


Notable modifications from the original `catthehacker` Docker images are:
- Inclusion of [`gli`](https://github.com/GreemDev/GLI), a tool used in the CI of Ryubing for determining version numbers from the [Update Server](https://github.com/Ryubing/UpdateServer/).
- Pre-installation of [AppImageTool](https://github.com/AppImage/appimagetool) and required dependencies:
  - `zsync`
  - `desktop-file-utils`
  - `appstream`
  - `libfuse2` (22.04) OR `libfuse2t64` (24.04)
- Automatic inclusion of `git.ryujinx.app` into SSH known hosts.
- Pre-installation of `7zip` via `apt`.
- Ubuntu 20.04 as well as 32-bit ARM images are not created.
- We do not automatically create the `custom` or `rust` build flavors.
  - They (mostly Rust) take way too long to make, and we don't even use Rust in any project.
- We do not automatically create the `gh` build flavor.
  - These images are not meant for use via GitHub, so no need to have a build variant specific to its CLI utility.
  - `gli` can replace the primary function for using `gh` in CI, [downloading releases matching a file pattern](https://github.com/GreemDev/GLI/blob/v3/src/Cli/Commands/GitHubReleaseCommand.cs).


> [!IMPORTANT]
> ## When updates will be applied to images
> - A package that will be required for action(s) to work properly might be added/removed/changed
> - Any maintenance that will be required due to:
>   - GitHub Container Registry
>   - GitHub Actions
>   - [nektos/act](https://github.com/nektos/act)
> - Performance and/or disk space improvements 

## Images available
- [`/linux/ubuntu/act`](./linux/ubuntu/scripts/act.sh) - image used in [nektos/act](https://github.com/nektos/act) as medium size image retaining compatibility with most actions, with a small size
  - `ghcr.io/ryubing/ubuntu:act-22.04`
  - `ghcr.io/ryubing/ubuntu:act-24.04`
  - `ghcr.io/ryubing/ubuntu:act-latest` (aka `act-24.04`)
- [`/linux/ubuntu/runner`](./linux/ubuntu/scripts/runner.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `runner` as user instead of `root`
  - `ghcr.io/ryubing/ubuntu:runner-22.04`
  - `ghcr.io/ryubing/ubuntu:runner-24.04`
  - `ghcr.io/ryubing/ubuntu:runner-latest` (aka `runner-24.04`)
- [`/linux/ubuntu/js`](./linux/ubuntu/scripts/js.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `js` tools installed (`yarn`, `nvm`, `node` v20/v24, `pnpm`, `grunt`, etc.)
  - `ghcr.io/ryubing/ubuntu:js-22.04`
  - `ghcr.io/ryubing/ubuntu:js-24.04`
  - `ghcr.io/ryubing/ubuntu:js-latest` (aka `js-24.04`)
<!---
- [`/linux/ubuntu/rust`](./linux/ubuntu/scripts/rust.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `rust` tools installed (`rustfmt`, `clippy`, `cbindgen`, etc.)
  - `ghcr.io/ryubing/ubuntu:rust-22.04`
  - `ghcr.io/ryubing/ubuntu:rust-24.04`
  - `ghcr.io/ryubing/ubuntu:rust-latest` (aka `act-24.04`)
-->
- [`/linux/ubuntu/pwsh`](./linux/ubuntu/scripts/pwsh.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `pwsh` tools and modules installed
  - `ghcr.io/ryubing/ubuntu:pwsh-22.04`
  - `ghcr.io/ryubing/ubuntu:pwsh-24.04`
  - `ghcr.io/ryubing/ubuntu:pwsh-latest` (aka `pwsh-24.04`)
- [`/linux/ubuntu/go`](./linux/ubuntu/scripts/go.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `go` tools installed
  - `ghcr.io/ryubing/ubuntu:go-22.04`
  - `ghcr.io/ryubing/ubuntu:go-24.04`
  - `ghcr.io/ryubing/ubuntu:go-latest` (aka `go-24.04`)
- [`/linux/ubuntu/dotnet`](./linux/ubuntu/scripts/dotnet.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with `.NET` tools installed
  - `ghcr.io/ryubing/ubuntu:dotnet-22.04`
  - `ghcr.io/ryubing/ubuntu:dotnet-24.04`
  - `ghcr.io/ryubing/ubuntu:dotnet-latest` (aka `dotnet-24.04`)
- [`/linux/ubuntu/java-tools`](./linux/ubuntu/scripts/java-tools.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with Java tools installed
  - `ghcr.io/ryubing/ubuntu:java-tools-22.04`
  - `ghcr.io/ryubing/ubuntu:java-tools-24.04`
  - `ghcr.io/ryubing/ubuntu:java-tools-latest` (aka `java-tools-24.04`)
- [`/linux/ubuntu/gh`](./linux/ubuntu/scripts/gh.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with GitHub CLI tools installed
  - `ghcr.io/ryubing/ubuntu:gh-22.04`
  - `ghcr.io/ryubing/ubuntu:gh-24.04`
  - `ghcr.io/ryubing/ubuntu:gh-latest` (aka `gh-24.04`)
<!---
- [`/linux/ubuntu/custom`](./linux/ubuntu/scripts/custom.sh) - `ghcr.io/ryubing/ubuntu:act-*` but with custom tools installed
  - `ghcr.io/ryubing/ubuntu:custom-22.04`
  - `ghcr.io/ryubing/ubuntu:custom-24.04`
  - `ghcr.io/ryubing/ubuntu:custom-latest` (aka `custom-24.04`)
-->
