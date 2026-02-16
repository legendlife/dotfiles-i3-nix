#                                      _
#   __  __________  __________  ____  (_)  __
#  / / / / ___/ _ \/ ___/ ___/ / __ \/ / |/_/
# / /_/ (__  )  __/ /  (__  ) / / / / />  <
# \__,_/____/\___/_/  /____(_)_/ /_/_/_/|_|

{ config, pkgs, ... }:

{

# Defining user 'kintama'
users.users.kintama = {
    isNormalUser = true;
    description = "A";
    extraGroups = [ "docker" "audio" "networkmanager" "wheel" "wireshark" "adbusers" ];
    createHome = true;
    useDefaultShell = true;
};

services.getty.autologinUser = "kintama";


# Removing need for user "kintama" to type password after sudo
# Add your username here in place of "kintama"
security.sudo.extraRules= [
    {users = [ "kintama" ];
        commands = [
            { command = "ALL" ;
                options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
            }
        ];
    }
];

# The following could maybe replace the above settings?
#   security.sudo.wheelNeedsPassword = false;

}
