# appplant/mruby-cli
Docker image to build mruby-cli based binaries against glibc-2.12 (or older), glibc-2.14 (or newer) and musl.

The public images can be found [here][repo] on Docker Hub.


## How to use

For cross-compilation against glibc-2.12:

    $ docker pull appplant/mruby-cli:glibc-2.12

To compile against glibc-2.14:

    $ docker pull appplant/mruby-cli:glibc-2.14

To compile against musl:

    $ docker pull appplant/mruby-cli:musl


## Development

A copy of an MacOSX SDK is required for the cross-build image _Dockerfile.glibc-2.14_.
The SDKs are available from [here][osx].

Build each docker image:

    $ docker build -f Dockerfile.[glibc-2.12|glibc-2.14|musl] -t appplant/mruby-cli:[glibc-2.12|glibc-2.14|musl] .

Open a shell to see if all works fine:

    $ docker run -ti appplant/mruby-cli:[glibc-2.12|glibc-2.14|musl] /bin/sh -l

Finally upload the images:

    $ docker push appplant/mruby-cli:[glibc-2.12|glibc-2.14|musl]

See the build tasks:

    $ rake -T


## License

The code is available as open source under the terms of the [MIT License][license].

Made with :yum: from Leipzig

© 2017 [appPlant GmbH][appplant]

[repo]: https://hub.docker.com/r/appplant/mruby-cli/
[osx]: https://github.com/phracker/MacOSX-SDKs/releases
[license]: https://opensource.org/licenses/MIT
[appplant]: www.appplant.de
