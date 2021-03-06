# Home assistant add-on: Joal
![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield]

## About

An open source command line RatioMaster with WebUI.
This addon is based on the [docker image](https://hub.docker.com/r/anthonyraymond/joal) from Anthony Raymond.
All credits for the app go to Anthony Raymond, please visit his repository here : https://github.com/anthonyraymond/joal

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Hass.io add-on.

1. [Add my Hass.io add-ons repository][repository] to your Hass.io instance.
1. Install this add-on.
1. Click the `Save` button to store your configuration.
1. Make sure that the two ports are open on your router
1. Start the add-on.
1. Check the logs of the add-on to see if everything went well.
1. Carefully configure the add-on to your preferences, see the official documentation for for that.

## Configuration

Webui can be found at `<your-ip>:8081/joal/ui`, or through Ingress in the app
You'll need to open the options and encode the secret token lrMY24Byhx (or modify it)
```yaml
secret_token: lrMY24Byhx #you can encode your own token here that will be used to identify in the app
ui_path: joal #the path where Joal will be accessible
run_duration: 12h #for how long should the addon run. Must be formatted as number + time unit (ex : 5s, or 2m, or 12h, or 5d...)
```

Ingress connection :
Server Address : YOURIP/api/hassio_ingress/INGRESSURL/ (example : 192.168.178.23:8123/api/hassio_ingress/qG_eJSO51uoHqkxiZzgzi9s5ZeNn5CVxBJH7ymrhW6c/)
Server port : 8123
Path prefix : YOURPATH (see addon option)
Secret token : YOURTOKEN (see addon option)

## Support
For HA : create an issue on github
For Joal : see the upstream repo here https://github.com/anthonyraymond/joal

## Illustration

![image](https://user-images.githubusercontent.com/44178713/117990142-29c3b200-b33d-11eb-86c8-a3007d73c3da.png)

[repository]: https://github.com/alexbelgium/hassio-addons
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
