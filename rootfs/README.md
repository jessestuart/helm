# RootFS

This directory stores all files that should be copied to the rootfs of a Docker
container. The files should be stored according to the correct directory
structure of the destination container. For example:

```
rootfs/bin -> /bin
rootfs/usr/local/share -> /usr/local/share
```

## Dockerfile

A Dockerfile in the rootfs is used to build the image.

Example:

```Dockerfile
FROM alpine:3.2

COPY . /

ENTRYPOINT ["/usr/local/bin/boot"]
```
