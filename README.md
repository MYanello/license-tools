# Goal
The purpose of this tool is to provide pods that enable licensing functionality such as checking availability, proxying, VPN, and hostname resolution of license server hostnames.
# Needs
1. Hostname resolution - dns
    - Programmatic hostname addition
    - check_avail container respecting dns server
# Sources
[This](https://kubernetes.io/docs/tasks/network/customize-hosts-file-for-pods/) looks like a good place to start for pod dns.