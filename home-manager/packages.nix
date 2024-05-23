{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    neofetch
    neovim
    bat
    eza
    emacs
    ripgrep
    coreutils
    fd
    clang
    telegram-desktop
    zathura
    jetbrains.pycharm-community
    mpv
    vivaldi
    gnome.adwaita-icon-theme
    conda
    htop
    gh
  ];

  programs.firefox.enable = true;

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
      ms-toolsai.jupyter
      vscode-icons-team.vscode-icons
      ms-azuretools.vscode-docker
      ms-python.python
      ms-python.vscode-pylance
      njpwerner.autodocstring
      ms-python.isort
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    userName  = "g";
    userEmail = "zzu1u@list.ru";
  };
}

