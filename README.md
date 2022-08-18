# VSCode Remote Environment Configuration

This is an opinionated environment configuration for VSCode and Docker. It utilizes some of VSCode's built-in functionality (`.devcontainer/devcontainer.json`) to create a headless Alpine Linux development environment for you to use on any OS. This means you can play with any tool you can use in an Unix-based OS. This configuration is mostly geared toward Windows, but could be adapted to any OS and has some configuration for Mac and Linux already.

I make some assumption you want to use NodeJS and NPM, but this could be configured at your lesiure. Later I may provide a CLI to configure this on the fly, but for now it's a manual configuration. It includes some of my preferred extensions, themes and icons.

![IDE Preview](https://i.imgur.com/vqDvNJY.png)

## Features

-   Turn-key Environment, extensions, theme, settings and terminal config all preinstalled
-   NodeJS First & React Friendly
-   Beautiful CLI icons & Dracula Theme
-   [Starship Terminal Prompt](https://starship.rs/)
-   NeoVim with [NvChad](https://nvchad.github.io/) configuration
-   Powerful CLI tools ([bat](https://github.com/sharkdp/bat), [fd](https://github.com/sharkdp/fd), [exa](https://github.com/ogham/exa), [tldr](https://github.com/tldr-pages/tldr), [oh-my-zsh](https://ohmyz.sh/))

---

## Installation

### Prerequisites

-   Nerd Font (this config uses [Victor Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/VictorMono))
-   [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) (Windows Subsystem for Linux)
-   [Docker Desktop](https://www.docker.com/products/docker-desktop/)
-   [VS Code](https://code.visualstudio.com/)

This is meant to be a plug-and-play env for each project, I'd recommend forking the repo with GitHub CLI or you can just clone it per normal in git.

**Fork Method**

_<sub>Note: requires [GH CLI](https://cli.github.com/)</sub>_

```bash
gh repo fork https://github.com/emmafaye/vscode-remote-env-config.git --clone --fork-name <repo-project-name>
```

**Clone Method**

```bash
git clone https://github.com/emmafaye/vscode-remote-env-config.git <project-name>
```

## Running Environment

Once you have the repo folder openned in VS Code, open the folder in a container. This will build the container and install all the extensions and settings.

## Environment Variables

Enviroment variables (`.env`) configuration is built-in, with extension support and template files. There are a handful of preexisting env variables set you can modify.

-   `TZ` - Timezone
-   `NODE_ENV` - Node Enviroment
-   `RUNNING_IN_DOCKER`
-   `host` - Node Host Address
-   `port` - Node Host Port

---

## Authors

-   [@emmafaye](https://www.github.com/emmafaye)
