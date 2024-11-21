FROM archlinux:latest

# 安裝基本工具
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    git \
    zsh \
    tmux \
    neovim \
    curl \
    wget \
    sudo \
    base-devel

# 創建測試用戶
RUN useradd -m -G wheel -s /bin/zsh testuser && \
    echo "testuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# 切換到測試用戶
USER testuser
WORKDIR /home/testuser

# 安裝 chezmoi
RUN sh -c "$(curl -fsLS get.chezmoi.io)"

# 設置 ZSH 為默認 shell
ENV SHELL /bin/zsh

# 啟動 ZSH
CMD [ "zsh" ]
