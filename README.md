# docker-tiny

This repo defines a tiny Docker image, i.e. `zppz/tiny`, that contains a few basic shell sripts and commands used in my Docker workflow.

For internal projects that constantly, continuously evolve, the best versioning scheme is auto-generated, trivially sortable versions. To this end, datetime-based fixed-length versions are the most obvious choice.

This repo contains two types of commands. The first type runs within a container based on this image. They include

- `make-date-version`
- `make-datetime-version`

Usage:

```
$ docker run -it --rm zppz/tiny:21.01.01 make-date-version
```

The second type prints out a Bash script that will be used outside of the container. They include

- `find-image`
- `find-local-image`
- `find-remote-image`

Usage:

```
$ cmd="$(docker run -it --rm zppz/tiny:21.01.01 cat /find-image)"
$ bash -c "${cmd}" -- [args]
```

This repo should be fairly stable so that other scripts simply use a particular version of this image (and rarely need to revise the hard-coded version).
