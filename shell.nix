{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs_22
    lua
    stylua
    nixd
    nixfmt-rfc-style
    nil
    cargo
    tailwindcss
    lua-language-server
  ];
  shellHook = ''
    echo "Welcome to your config"
  '';
}
