### Docker sabnzbd
Docker deployment of sabnzbd which uses the linuxserver/sabnzbd image. You must be in the base folder of this project

#### Building docker image
Building your image
```bash
$ docker build -t yourusername/sabnzbd .
```

Push image to hub:

```bash
$ docker push yourusername/sabnzbd
```

#### Starting container
Note you must be in the base folder of this project otherwise it will not work

```bash
$ ansible-playbook ansible/sabnzbd.yml
```

If you don't want to do it via ansible you can do this

```bash
$ docker pull yourusername/sabnzbd
$ docker run -d \
    -v /* your config location */:/config \
    -v /* your download location */:/data/sabnzbd/downloads \
    -v /* your nzb location */: /data/sabnzbd/nzb \
    -p 127.0.0.1:8080:8080 \
    --restart=always \
    --name sabnzbd
    yourusername/sabnzbd
```
