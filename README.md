# Kibana (Linked Elastic) docker image

<a href="http://the-startup-stack.com">
  ![the-startup-stack](http://aviioblog.s3.amazonaws.com/logo-black.png)
</a>

the-startup-stack project [Read More](https://github.com/the-startup-stack/docs#what-is-the-startup-stack)

## Installation

### Pull and run elasticsearch

Follow instructions [here](https://github.com/the-startup-stack/docker-elasticsearch#pull-and-run-elasticsearch).

### Build and run Kibana

* Run `docker build -t thestartupstack/kibana .`
* Run `docker run -p 8080:80 --link elastic:es -t thestartupstack/kibana`
* Go to `http://localhost:8080`

### Running without Build

* Run `docker pull thestartupstack/kibana`
* Run `docker run -p 8080:80 --link elastic:es -t thestartupstack/kibana`
* Go to `http://localhost:8080`

### Boot2docker

If you are running boot2docker, you need to make sure 8080 is exposed

If the image (boot2docker VM) is already running run this command:

```
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8080,tcp,,8080,,8080"
```

If not, run this command
```
  VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port8080,tcp,,8080,,8080"
```

## Contribution

[Read Here](https://github.com/the-startup-stack/docs#contribution-guide)

## LICENSE

MIT
