{ pkgs, droid, ... }: {
    home.file.".config/wayfire.sh".text = ''
    #!/bin/sh
    wayfire &
    export DISPLAY=:1
    sleep 5
    waydroid show-full-ui
    '';
    
    home.file.".local/share/applications/wayfire.desktop".text = ''
    [Desktop Entry] 
    Name=waydroid on Wayfire 
    Comment=Android OS in a container 
    Exec=/usr/bin/wayfire-session.sh
    Type=Application
    '';
}