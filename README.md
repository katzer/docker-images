# appplant/mruby-cli
Docker image to build mruby-cli based binaries against glibc-2.12 (or older) and glibc-2.14 (or newer).

The public images can be found [here][repo] on Docker Hub.


## How to use
For cross-compilation against glibc-2.12:

	$ docker pull appplant/mruby-cli:glibc-2.12

To compile against glibc-2.14:

	$ docker pull appplant/mruby-cli:glibc-2.14


## License

The code is available as open source under the terms of the [MIT License][license].

Made with :yum: from Leipzig

© 2017 [appPlant GmbH][appplant]

[repo]: https://hub.docker.com/r/appplant/mruby-cli/
[license]: https://opensource.org/licenses/MIT
[appplant]: www.appplant.de
