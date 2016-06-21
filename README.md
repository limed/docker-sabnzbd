Docker deployment of sabnzbd which uses the linuxserver/sabnzbd image.

If we choose to deploy our own image we need to create a Dockerfile on the root of this folder and then run the following command:

```bash
# docker build -t sabnzbd .
# docker push yourusername/nameofimage
```

After that just make sure you edit the name of the image in ansible and run the following command:

```bash
# ansible-playbook -i ansible/sabnzbd.yml
```
