<h1 align="center">Realm</h1>

<p align="center">A network relay tool.</p>

<p align="center">
    <a href="https://ghcr.io/akafeng/realm">Container Registry</a> ·
    <a href="https://github.com/zhboner/realm">Project Source</a>
</p>

<p align="center">
    <img src="https://img.shields.io/github/actions/workflow/status/akafeng/docker-realm/push.yml?branch=main" />
    <img src="https://img.shields.io/github/last-commit/akafeng/docker-realm" />
    <img src="https://img.shields.io/github/v/release/akafeng/docker-realm" />
    <img src="https://img.shields.io/github/release-date/akafeng/docker-realm" />
</p>

---

### Pull The Image

```bash
$ docker pull ghcr.io/akafeng/realm
```

### Start Container

```bash
$ docker run -d \
  --network=host \
  --restart=unless-stopped \
  --name=realm \
  ghcr.io/akafeng/realm \
  -l 0.0.0.0:5000 \
  -r 1.1.1.1:443
```
