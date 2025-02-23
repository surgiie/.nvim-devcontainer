FROM alpine:latest
ARG UID=1000
ARG GID=1000
# Create user and group with UID/GID
RUN addgroup -g $GID devcontainer && \
    adduser -D -u $UID -G devcontainer devcontainer && \
    apk update && \
    apk add --no-cache \
        sudo \
        curl \
        bash \
        fzf \
        zsh \
        wget \
        neovim \
        git \
        htop \
        ripgrep \
        build-base \
        shadow  # Needed for usermod

# Grant sudo access to devcontainer user
RUN echo "devcontainer ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/devcontainer && \
    chmod 0440 /etc/sudoers.d/devcontainer

# Fix ownership for home directory
RUN chown -R devcontainer:devcontainer /home/devcontainer

# Switch to non-root user
USER devcontainer

# Create necessary directories
RUN mkdir -p $HOME/devcontainer/.local/bin && mkdir -p $HOME/.config && mkdir -p $HOME/workspaces

# Copy scripts and config files
COPY ./scripts /home/devcontainer/.scripts/
COPY ./.zshrc /home/devcontainer/.zshrc

WORKDIR /home/devcontainer

