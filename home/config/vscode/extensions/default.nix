{
  pkgs,
  ...
}:

{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    hashicorp.hcl
    redhat.ansible
    vscjava.vscode-java-pack
    visualstudioexptteam.vscodeintellicode
    visualstudioexptteam.intellicode-api-usage-examples
    ms-vscode.cpptools-extension-pack
    stylelint.vscode-stylelint
    reloadedextensions.reloaded-cpp
    mathiasfrohlich.kotlin
    hediet.vscode-drawio
    hars.cppsnippets
    firsttris.vscode-jest-runner
    cweijan.dbclient-jdbc
    vscjava.vscode-java-debug
    ms-azuretools.vscode-docker
    dbaeumer.vscode-eslint
    gitlab.gitlab-workflow
    eamodio.gitlens
    golang.go
    hashicorp.terraform
    ms-python.isort
    wholroyd.jinja
    ms-toolsai.jupyter
    ms-toolsai.vscode-jupyter-cell-tags
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-toolsai.vscode-jupyter-slideshow
    redhat.java
    ritwickdey.liveserver
    vscjava.vscode-maven
    bbenoist.nix
    esbenp.prettier-vscode
    vscjava.vscode-java-dependency
    ms-python.python
    vscjava.vscode-java-test
    gruntfuggly.todo-tree
    xadillax.viml
    redhat.vscode-yaml
  ];
}