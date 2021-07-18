# docker-tools-box

![Build Status](https://github.com/Vr00mm/docker-tools-box/actions/workflows/docker-image.yml/badge.svg?branch=master)

## Use it

### Windaub

```shell
docker run --rm --volume "%HOMEDRIVE%\%HOMEPATH%:/root" --volume /var/run/docker.sock:/var/run/docker.sock --privileged -it vr00mm/vr00mm:tools-box bash
```

### Linux

```bash
docker run --rm --volume "${HOME}:/root" --volume /var/run/docker.sock:/var/run/docker.sock --privileged -it vr00mm/vr00mm:tools-box bash
```
