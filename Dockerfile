FROM node:alpine AS setup

ENV WORK_PATH=/usr/src/app
ENV HOME_PATH=/root
ENV NPM_PATH=/usr/local/lib/node_modules
ENV ZSH_CUSTOM=${HOME_PATH}/.oh-my-zsh/custom
ENV NVIM_PATH=${HOME_PATH}/.config/nvim

ENV BAT_THEME=Dracula
ENV DOCKER_CONTENT_TRUST=true

WORKDIR ${WORK_PATH}

# chezmoi - Dotfiles Management
# RUN sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply $GITHUB_USERNAME

# Basic alpine commands
RUN apk update && apk add --no-cache coreutils util-linux grep sudo && apk upgrade

# Bash for dependency issues
RUN apk update && apk add --no-cache bash && apk upgrade

# ZSH & Plugins
RUN apk update && apk add --no-cache git curl zsh vim expect && apk upgrade
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink all of the dotfiles to our workdir for on-the-fly editing
RUN mkdir -p ${HOME_PATH}/.oh-my-zsh ${HOME_PATH}/.config ${HOME_PATH}/.config/gh
RUN ln -sf ${WORK_PATH}/.devcontainer/zsh/.zshrc ${HOME_PATH}/.zshrc
RUN ln -sf ${WORK_PATH}/.devcontainer/zsh/.zsh-autocomplete.zsh ${HOME_PATH}/.zsh-autocomplete.zsh
RUN ln -sf ${WORK_PATH}/.devcontainer/starship/.starship.toml ${HOME_PATH}/.config/starship.toml
RUN ln -sf ${WORK_PATH}/.devcontainer/nvim/init.lua ${HOME_PATH}/init.lua
RUN ln -sf ${WORK_PATH}/.devcontainer/nvim/chadrc.lua ${HOME_PATH}/chadrc.lua
RUN ln -sf ${WORK_PATH}/.devcontainer/misc/.tldrrc ${HOME_PATH}/.tldrrc
RUN ln -sf ${WORK_PATH}/.devcontainer/misc/.tmux.conf ${HOME_PATH}/.tmux.conf

COPY .devcontainer/misc/hosts.template.yml .devcontainer/misc/hosts.yml
RUN ln -sf ${WORK_PATH}/.devcontainer/misc/hosts.yml ${HOME_PATH}/.config/gh/hosts.yml

COPY .devcontainer/misc/.gitconfig.template .devcontainer/misc/.gitconfig
RUN ln -sf ${WORK_PATH}/.devcontainer/misc/.gitconfig ${HOME_PATH}/.gitconfig

# Node Toolchain
# RUN apk update && apk add --no-cache nodejs npm && apk upgrade

# Python Toolchain
# RUN apk update && apk add --no-cache python3 py3-pip && apk upgrade

# replace this with your application's default port
EXPOSE 3000

# VOLUME [ "/usr/src/app" ]

CMD [ "/bin/zsh" ]
