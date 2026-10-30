<table align="center">
    <tr>
        <td align="center" width="25%">
            <img src="https://raw.githubusercontent.com/gruke-build/src/refs/heads/develop/images/icon-social.png" alt="gruke" >
        </td>
        <td align="center" width="75%">
          
# Custom Ubuntu OCI images

A set of custom Ubuntu OCI images,<br/>primarily for use with [Forgejo Actions](https://forgejo.org/docs/latest/user/actions/overview/) on [Forgejo Runner](https://code.forgejo.org/forgejo/runner/).

[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/gruke-build/oci/build-ubuntu.yml?style=for-the-badge&logo=github&label=Build%20Images&labelColor=black)
](https://github.com/gruke-build/oci/actions)
<br>
[![Discord](https://img.shields.io/discord/405806471578648588?color=5865F2&label=Greem%27s%20Projects&logo=discord&logoColor=white&style=for-the-badge)](https://discord.gg/H8bcFr2)
        </td>
    </tr>
</table>

<p align="center">
  This is a fork of <a target="_blank" href="https://github.com/catthehacker/docker_images">catthehacker/docker_images</a>; used to create the <code>ghcr.io/catthehacker/ubuntu</code> images.<br/>
  We have been using these docker images for some time, and they work well.<br/>
  However, there's some tools we'd like to have in them pre-installed to save workflow time,<br/>bandwidth usage, and reduce reliance on Canonical server stability.
</p>

Notable modifications from the original `catthehacker` Docker images are:
- Inclusion of [`gli`](https://github.com/GreemDev/GLI).
  - This is my personal CLI tool that I add things I find useful to.
- Pre-installation of [AppImageTool](https://github.com/AppImage/appimagetool) and required dependencies:
  - `zsync`
  - `desktop-file-utils`
  - `appstream`
  - `libfuse2t64`
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
  - `ghcr.io/gruke-build/ubuntu:act-24.04`
  - `ghcr.io/gruke-build/ubuntu:act-26.04`
  - `ghcr.io/gruke-build/ubuntu:act-latest` (aka `act-26.04`)
- [`/linux/ubuntu/runner`](./linux/ubuntu/scripts/runner.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with `runner` as user instead of `root`
  - `ghcr.io/gruke-build/ubuntu:runner-24.04`
  - `ghcr.io/gruke-build/ubuntu:runner-26.04`
  - `ghcr.io/gruke-build/ubuntu:runner-latest` (aka `runner-26.04`)
- [`/linux/ubuntu/js`](./linux/ubuntu/scripts/js.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with `js` tools installed (`yarn`, `nvm`, `node` v20/v24, `pnpm`, `grunt`, etc.)
  - `ghcr.io/gruke-build/ubuntu:js-24.04`
  - `ghcr.io/gruke-build/ubuntu:js-26.04`
  - `ghcr.io/gruke-build/ubuntu:js-latest` (aka `js-26.04`)
<!---
- [`/linux/ubuntu/rust`](./linux/ubuntu/scripts/rust.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with `rust` tools installed (`rustfmt`, `clippy`, `cbindgen`, etc.)
  - `ghcr.io/gruke-build/ubuntu:rust-24.04`
  - `ghcr.io/gruke-build/ubuntu:rust-26.04`
  - `ghcr.io/gruke-build/ubuntu:rust-latest` (aka `act-26.04`)
-->
- [`/linux/ubuntu/pwsh`](./linux/ubuntu/scripts/pwsh.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with `pwsh` tools and modules installed
  - `ghcr.io/gruke-build/ubuntu:pwsh-24.04`
  - `ghcr.io/gruke-build/ubuntu:pwsh-26.04`
  - `ghcr.io/gruke-build/ubuntu:pwsh-latest` (aka `pwsh-26.04`)
- [`/linux/ubuntu/go`](./linux/ubuntu/scripts/go.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with `go` tools installed
  - `ghcr.io/gruke-build/ubuntu:go-24.04`
  - `ghcr.io/gruke-build/ubuntu:go-26.04`
  - `ghcr.io/gruke-build/ubuntu:go-latest` (aka `go-26.04`)
- [`/linux/ubuntu/dotnet`](./linux/ubuntu/scripts/dotnet.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with `.NET` tools installed
  - `ghcr.io/gruke-build/ubuntu:dotnet-24.04`
  - `ghcr.io/gruke-build/ubuntu:dotnet-26.04`
  - `ghcr.io/gruke-build/ubuntu:dotnet-latest` (aka `dotnet-26.04`)
- [`/linux/ubuntu/java-tools`](./linux/ubuntu/scripts/java-tools.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with Java tools installed
  - `ghcr.io/gruke-build/ubuntu:java-tools-24.04`
  - `ghcr.io/gruke-build/ubuntu:java-tools-26.04`
  - `ghcr.io/gruke-build/ubuntu:java-tools-latest` (aka `java-tools-26.04`)
- [`/linux/ubuntu/gh`](./linux/ubuntu/scripts/gh.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with GitHub CLI tools installed
  - `ghcr.io/gruke-build/ubuntu:gh-24.04`
  - `ghcr.io/gruke-build/ubuntu:gh-26.04`
  - `ghcr.io/gruke-build/ubuntu:gh-latest` (aka `gh-26.04`)
<!---
- [`/linux/ubuntu/custom`](./linux/ubuntu/scripts/custom.sh) - `ghcr.io/gruke-build/ubuntu:act-*` but with custom tools installed
  - `ghcr.io/gruke-build/ubuntu:custom-24.04`
  - `ghcr.io/gruke-build/ubuntu:custom-26.04`
  - `ghcr.io/gruke-build/ubuntu:custom-latest` (aka `custom-26.04`)
-->
