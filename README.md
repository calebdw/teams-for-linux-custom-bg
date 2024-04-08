# teams-for-linux custom backgrounds

This servers custom images for the [teams-for-linux](https://github.com/IsmaelMartinez/teams-for-linux/tree/develop) client using Docker (or Podman) and Nginx.

## Installation

See the [docs](https://github.com/IsmaelMartinez/teams-for-linux/tree/develop/app/config#custom-backgrounds) for instructions.

To start the container, simply run `make`, to stop run `make clean`.

### Setup SSL Certificates

[mkcert](https://github.com/FiloSottile/mkcert) is used to setup SSL certs for local development.

To use, execute the following commands:

```bash
sudo apt install mkcert libnss3-tools
mkcert -install
mkcert -cert-file ./certs/local.crt -key-file ./certs/local.key \
    "teams-backgrounds.test"
```

### Add sites to system host file

Add the following websites to the system host file (MacOS & Linux: `/etc/hosts`;
Windows: `C:\Windows\System32\drivers\etc\hosts`):

```conf
127.0.0.1 teams-backgrounds.test
```
