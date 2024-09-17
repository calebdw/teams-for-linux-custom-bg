# teams-for-linux custom backgrounds

This servers custom images for the [teams-for-linux](https://github.com/IsmaelMartinez/teams-for-linux/tree/develop) client using Docker (or Podman) and Nginx.

## Installation

See the [docs](https://github.com/IsmaelMartinez/teams-for-linux/tree/develop/app/config#custom-backgrounds) for reference.

### Adding Backgrounds

First add your custom backgrounds to the `backgrounds` directory, you will also need a separate thumbnail for each background.
Then copy the example config file to `config.json`:

```bash
cp backgrounds/config.json.v2.example backgrounds/config.json
```

And update the `config.json` file with the correct paths for the backgrounds and thumbnails.
Refer to the [docs](https://github.com/IsmaelMartinez/teams-for-linux/tree/develop/app/config#configuring-list-of-images) for more information.

### Setup SSL Certificates

[mkcert](https://github.com/FiloSottile/mkcert) is used to setup SSL certs for local development.

To use, execute the following commands:

```bash
sudo apt install mkcert libnss3-tools
mkcert -install
mkcert -cert-file ./certs/local.crt -key-file ./certs/local.key "teams-backgrounds.test"
```

### Add site to system host file

Add the following websites to the system host file (`/etc/hosts`):

```conf
127.0.0.1 teams-backgrounds.test
```

### Configure Teams

To configure the `teams-for-linux` client to use the custom backgrounds, add the following to the Teams config file:

- `~/.var/app/com.github.IsmaelMartinez.teams_for_linux/config/teams-for-linux/config.json`

```json
{
    "isCustomBackgroundEnabled": true,
    "customBGServiceBaseUrl": "https://teams-backgrounds.test:8081/images",
}
```

### Start the container

To start the container, simply run `make`, to stop run `make clean`.
