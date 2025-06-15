{
  pkgs,
  ...
}:

{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    stylelint.vscode-stylelint
    ms-azuretools.vscode-docker
    dbaeumer.vscode-eslint
    eamodio.gitlens
    golang.go
    ms-python.isort
    ritwickdey.liveserver
    k--kato.intellij-idea-keybindings
    bbenoist.nix
    esbenp.prettier-vscode
    ms-python.python
    gruntfuggly.todo-tree
    xadillax.viml
    redhat.vscode-yaml
  ];
}