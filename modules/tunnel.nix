# for proxy
{ config, pkgs, ... }:
{
    networking.proxy.default = {
        enable = true;
        socksProxy = "socks5://127.0.0.1:1080";
        networking.proxy.noProxy = "127.0.0.1,localhost,*.local,internal.domain,*.edge.ka5umi.eu.org,*.cqupt.edu.cn";
    };

    services.xray = {
        enable = true;
        settings = {
            inbounds = [
                {
                    listen = "127.0.0.1";
                    port = 1080;
                    protocol = "socks";
                    settings = { udp = true; };
                }
            ];
            outbounds = [
                {
                    protocol = "vless";
                    settings = {
                        vnext = [
                            {
                                address = "jp01-v6.edge.ka5umi.eu.org";
                                port = 443;
                                users = [{
                                    id = "51eaf408-63ed-4bf7-af13-d972d3008f77";
                                    encryption = "none";
                                    flow = "xtls-rprx-vision";
                                }];
                            }
                        ];
                    };
                    streamSettings = {
                        network = "tcp";
                        security = "reality";
                        realitySettings = {
                            fingerprint = "safari";
                            serverName = "images.apple.com";
                            publicKey = "LBVIXglKFntQhQOcThtmu1XQvaVdGb56eZFg2Gd8nFE";
                            spiderX = "";
                            shortId = "";
                        };
                    };
                    tag = "proxy";
                }
                {
                    protocol = "freedom";
                    tag = "direct";
                }
            ];
            routing = {
                domainStrategy = "IPOnDemand";
                rules = [
                    {
                        type = "field";
                        ip = [
                            "geoip:private"
                            "geoip:cn"
                        ];
                        outboundTag = "direct";
                    }
                ];
            };
        };
    };
}