{ pkgs, ... }:
{
    networking.firewall.allowedTCPPorts = [ 6443 ];
    systemd.tmpfiles.rules = [
      "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
    ];
    services.k3s = {
        enable = true;
        package = pkgs.k3s;  # 1.27.6+k3s1
        extraFlags = ''
            --data-dir=/opt/rancher \
            --cluster-cidr="10.42.0.0/16,2001:cafe:42::/56" \
            --service-cidr="10.43.0.0/16,2001:cafe:43::/112" \
            --kubelet-arg="node-ip=::"
            --flannel-backend="wireguard-native"
        '';
    };
    boot.kernel.sysctl = {
        "net.ipv4.ip_forward" = "1";
        "net.ipv6.conf.all.forwarding" = "1";
    };
}
