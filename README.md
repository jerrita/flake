# Jerrita's Flake

My nix configurations. Use on your own risk.

## Map

| name  | note    |
| ----- | ------- |
| aris  | PVE LXC |
| cloud | ECS     |

## Scripts

1. LXC Template

```bash
nix run github:nix-community/nixos-generators -- --format proxmox-lxc
```