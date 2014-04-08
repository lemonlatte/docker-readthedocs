## docker-readthedocs

readthedocs (RTD) in docker

### Build

``` bash
$ docker build -t docker-readthedocs .
```

### Setup project on a share volume

If you want to save project files on a share volume, you need to initiate it by:

``` bash
$ docker run -i -t -v /path/to/readthedocs:/app docker-readthedocs \
> sh /bin/rtd-reinstall.sh
```

### Run server

``` bash
$ docker run -d -v /path/to/readthedocs:/app -p 8000:8000 docker-readthedocs
```
