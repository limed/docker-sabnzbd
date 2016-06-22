Docker deployment of sabnzbd which uses the linuxserver/sabnzbd image. You must be in the base folder of this project

#### Building docker image
Make sure you are logged in to docker hub:

```bash
$ docker login
```

Build your image:

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
docker run -d \
    -v /* your config location */:/config \
    -v /* your download location */:/downloads \
    -v /* your nzb location */: /nzb \
    -p 8080:8080 \
    --restart=always \
    sabnzbd
```
