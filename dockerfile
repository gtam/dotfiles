allinone:
    pid: host
    image: neuvector/allinone
    container_name: neuvector.allinone
    cap_add:
        - SYS_ADMIN
        - NET_ADMIN
        - SYS_PTRACE
        - IPC_LOCK
    security_opt:
        - apparmor=unconfined
        - seccomp=unconfined
        - label=disable
    environment:
        - CLUSTER_JOIN_ADDR=127.0.0.1
        - NV_PLATFORM_INFO=platform=Docker
    ports:
        - 18300:18300
        - 18301:18301
        - 18400:18400
        - 18401:18401
        - 18301:18301/udp
        - 8443:8443
    volumes:
        - /lib/modules:/lib/modules:ro
        - /var/run/docker.sock:/var/run/docker.sock:ro
        - /proc:/host/proc:ro
        - /sys/fs/cgroup:/host/cgroup:ro
        - /var/neuvector:/var/neuvector
