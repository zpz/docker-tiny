# docker-tiny

This repo defines a tiny Docker image that contains a few basic shell sripts and commands used in my Docker workflow.

For internal projects that constantly, continuously evolve, the best versioning scheme is auto-generated, trivially sortable versions. To this end, datetime-based fixed-length versions are the most obvious choice.

This repo contains two types of commands. The first type of commands reside in [bin/](./bin). These commands run within a container based on this image, because all their dependencies are satisfied by the base image [`busybox`](https://hub.docker.com/_/busybox). Example usage:

```
$ docker run --rm zppz/tiny:21.01.02 make-date-version
```

The second type of commands reside in [tools/](./tools). These commands can not run directly in a container based on this image, because their dependencies go beyond `busybox`. The intended way to use them is to print out their code, capture the printout outside of the container, and then run it outside of the container. For example,

```
$ cmd="$(docker run --rm zppz/tiny:21.01.02 cat /usr/tools/find-image)"
$ bash -c "${cmd}" -- [args]
```

This repo should be fairly stable so that other scripts simply use a particular version of this image, and rarely need to revise the hard-coded version.

Please see [docker](https://github.com/zpz/docker) for more info.
