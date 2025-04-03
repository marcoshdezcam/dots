{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    lua51Packages.lua
    nixd
    nixfmt-rfc-style
    nil
    cargo
    tailwindcss
    nodejs_22
    nodePackages.prettier
    python313
    lazygit
    fd
    lua51Packages.luarocks-nix
    tree-sitter
  ];
  shellHook = ''
    clear
    echo "Marco's Dots"
  '';
}
