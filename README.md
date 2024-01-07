# Goal
The purpose of this tool is to provide pods that enable licensing functionality such as checking availability, proxying, VPN, and hostname resolution of license server hostnames.
# Todo
- [ ] Hostname resolution - dns
    - [ ] Programmatic hostname addition
    - [ ] check_avail container respecting dns server
    - Maybe the nebula stuff can be required for all networks and that can handle dns?
- [ ] SQS Queue was rec'd for processing the requests 
- [ ] Nebula pod for vpn
    - [ ] Basic pod nebula pod created
    - [ ] Separate cert pod to handle creating certificates
        - [X] Separate cert container created
        - [ ] How to handle encrypted volume shared with nebula-cert and nebula pod?
        - [ ] set this pod as a job
- [ ] License availability tools

# Sources
[This](https://kubernetes.io/docs/tasks/network/customize-hosts-file-for-pods/) looks like a good place to start for pod dns.