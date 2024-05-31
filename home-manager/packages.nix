{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    python3
    neofetch
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
    poetry
    lmms
    gimp
    inkscape
    kdenlive
    obs-studio
    anki-bin
    calibre
    libreoffice
    fuzzel
    nsxiv
    xournalpp
    todo-txt-cli
    qbittorrent
    superTuxKart
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

  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";

        font = "FiraMono Nerd Font:size=17";
      };

      colors = {
        alpha = 0.85;
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}

