# ws-vscode
Using only VSCode and Rstudio in my Workspace install
```
vscode:
 title: "vscode"
 iconUrl: "/assets/images/workspace-logos/vscode.svg"
 start: [ "/var/opt/workspaces/vscode/start" ]
 httpProxy:
    port: 8888
    requireSubdomain: false
```
```
rstudio:
  title: "RStudio"
  iconUrl: "/assets/images/workspace-logos/Rstudio.svg"
  start: [ "/var/opt/workspaces/rstudio/start" ]
  httpProxy:
    port: 8888
    requireSubdomain: false
```
