# dnsmasq [![DockerHub](https://img.shields.io/badge/docker-hub-brightgreen.svg?style=flat)](https://hub.docker.com/r/eexit/dnsmasq)

Run [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html) as a persistent Docker container.  
Shamelessly copied from my co-worker @sakai135.

## Quick start

    $ docker-compose up -d
    $ sudo mkdir /etc/resolver
    $ echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/dev

Once you did that, the container will start automatically with the Docker daemon so you won't have to take care of it anymore.

Test:

    $ dig foo-bar.dev @127.0.0.1
    ; <<>> DiG 9.8.3-P1 <<>> foo-bar.dev @127.0.0.1
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 55047
    ;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

    ;; QUESTION SECTION:
    ;foo-bar.dev.           IN  A

    ;; ANSWER SECTION:
    foo-bar.dev.        0   IN  A   127.0.0.1

    ;; Query time: 1 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Fri Oct  7 00:46:02 2016
    ;; MSG SIZE  rcvd: 45

If you need to resolve other TLD (e.g. `.local`):

    $ echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/local

If you don't use docker-compose:

    $ docker run --name=dnsmasq --restart=always -d -p 0.0.0.0:53:53 -p 0.0.0.0:53:53/udp eexit/dnsmasq --address=/dev/127.0.0.1

## Resources

- [dnsmasq doc](http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html)
- [Using Dnsmasq for local development on OS X](https://passingcuriosity.com/2013/dnsmasq-dev-osx/)
