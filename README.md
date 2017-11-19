# docker-alpine-nsgminer
[nsgminer](https://github.com/ghostlander/nsgminer) in an Alpine Linux Docker container.

Using an [Alpine Linux](https://www.alpinelinux.org/) container gets you a very lightweight image of ~4MB and the benefits of Alpine Linux's security model.

This image is configured to run the miner as a dedicated restricted user. It is also configured to use environment variables as a corresponding parameter values.

## Usage

```bash
export POOL=...
export USER=...
export PASSWORD=...
docker run --restart unless-stopped --read-only -m 50M -c 512 yukoff/docker-alpine-nsgminer --neoscrypt -o ${POOL} -u ${USER} -p ${PASSWORD}
```

### Docker Arguments

`--restart unless-stopped`

In case the miner crashes we want the docker service to restart it.

`--read-only`

This image does not need rw access. If there are bug/exploits in the pool/software you are a little bit more protected.

`-m 50M`

Restricts memory usage to 50MB.

`-c 512`

By default container will use <= half of system cores. Setting a relevant share count will protect you from a runaway process locking your system.

### `nsgminer` Arguments

`--help`

All standard `nsgminer` arguments are supported, using `--help` will list all of them.

```bash
docker run yukoff/docker-alpine-nsgminer --help
```

`-t`

When manually setting threads with `-t` you need to configure the correct CPU shares for docker.

IE if you have 4 cores, each core is worth 256 `(1024 / 4)`, so for miner to use 3 threads CPU shares for Docker must be set to 756:

```bash
docker run -c 756 yukoff/docker-alpine-nsgminer ... -t 3
```

## Donations

* [FTC: 6zN8aHjS7FhdvT2zj5dRE8wjqdnDDyqM9B](feathercoin:6zN8aHjS7FhdvT2zj5dRE8wjqdnDDyqM9B)
* [LTC: LRe98CgeC21KCTRnu2g92ba5oX6E74gRrw](litecoin:LRe98CgeC21KCTRnu2g92ba5oX6E74gRrw)
* [BTC: 1MLovAcXHmDFE9u3Kz1pj7Ru3hGaqZE9Ks](bitcoin:1MLovAcXHmDFE9u3Kz1pj7Ru3hGaqZE9Ks)
