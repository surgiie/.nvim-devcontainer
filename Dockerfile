FROM alpine:latest

# Create user and group with UID/GID 1001
RUN addgroup -g 1001 devcontainer && \
    adduser -D -u 1001 -G devcontainer devcontainer && \
    apk update && \
    apk add --no-cache \
        sudo \
        curl \
        bash \
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
RUN mkdir -p /home/devcontainer/.config

# Copy scripts and config files
COPY ./scripts /home/devcontainer/.scripts/
COPY ./nvim /home/devcontainer/.config/nvim/
COPY ./.bashrc /home/devcontainer/.bashrc

WORKDIR /home/devcontainer

