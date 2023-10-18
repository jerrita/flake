{ config, pkgs, ... }:
{
    # https://nixos.wiki/wiki/Nvidia

    # specialisation = {
    #     on-the-go.configuration = {
    #         system.nixos.tags = [ "on-the-go" ];
    #         hardware.nvidia = {
    #             prime.offload.enable = lib.mkForce true;
    #             prime.offload.enableOffloadCmd = lib.mkForce true;
    #             prime.sync.enable = lib.mkForce false;
    #         };
    #     };
    # };

    hardware.nvidia.prime = {
        offload = {
            enable = true;
            enableOffloadCmd = true;
        };
        # sync.enable = true;
        
        # use lshw to find the bus id
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:14:0:0";
	};
}