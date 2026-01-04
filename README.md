# WireGuard Health Check

Lightweight health-check script for WireGuard clients. It checks
connectivity for one or more `wgN` interfaces using `ping`, and automatically
restarts the interface when the connection times out.

This is useful when a client is behind NAT and the ISP periodically changes the
public IP, causing the tunnel to become temporarily unreachable.

## What & Why

- What does this script do?  
    Periodically pings a configured target IP via each WireGuard interface
    (`ping -I wgN ...`).  
    If the ping timeout, it restarts the corresponding WireGuard interface to
    force reconnection.  
- Wireguard already have the `PersistentKeepalive`, why not just use this?  
    In some situaions (unstable NAT, ISP public IP changes, etc.),
    the tunnel may still become unreachable with keepalive enabled.  
- Note: This script is not a replacement for WireGuard `PersistentKeepalive`.  
- Issues and PRs are welcome if you have any suggestions.  

## Installation

For Arch Linux, you can install from [AUR](https://aur.archlinux.org/packages/wg-healthcheck).

```bash
paru -S wg-healthcheck
```

---

Install from source code.

```bash
git clone https://github.com/STARRY-S/wg-healthcheck.git && cd wg-healthcheck
sudo ./install.sh
sudo systemctl daemon-reload
```

## Usage

```bash
# Modify configuration.
sudo cp /etc/wg-healthcheck/config.example.env /etc/wg-healthcheck/config.env
sudo vim /etc/wg-healthcheck/config.env

# Enable periodic checks via systemd timer
sudo systemctl enable --now wg-healthcheck.timer
```

## License

MIT License

Copyright (c) 2026 STARRY-S

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
