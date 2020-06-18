[![Build Status](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_apis/build/status/chef-base-plans.docker?branchName=master)](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_build/latest?definitionId=69&branchName=master)

# docker

The Docker Engine

## Maintainers

* The Core Planners: <chef-core-planners@chef.io>

## Type of Package

Binary package

### Use as Dependency

Binary packages can be set as runtime or build time dependencies. See [Defining your dependencies](https://www.habitat.sh/docs/developing-packages/developing-packages/#sts=Define%20Your%20Dependencies) for more information.

The docker plan _only_ provides users access to the standalone [docker binaries](https://docs.docker.com/engine/installation/binaries/). It is provided with the intention that any user's who need to run docker will write their own plan that depends on this package and provide their own runtime management.

Docker is a complex piece of software with multiple ways in which it can be configured to run. As such we provide this package to enable you to wrap and automate your preferred deployment style.

To add core/docker as a depdendency, you can add one of the following to your plan file.

##### Buildtime Dependency

> pkg_build_deps=(core/docker)

##### Runtime Dependency

> pkg_deps=(core/docker)

### Use as Tool

#### Installation

To install this plan, you should run the following commands to first install, and then link the binaries this plan creates.

``hab pkg install core/docker --binlink``

will add the following binaries to the PATH:

* /bin/containerd-shim
* /bin/docker-init
* /bin/dockerd
* /bin/docker-proxy
* /bin/ctr
* /bin/docker
* /bin/containerd
* /bin/runc

#### Using an example binary

You can now use the binary as normal.  For example:

``/bin/docker --help`` or ``docker --help``

```bash
$ docker --help

Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config
                           files (default "/root/.docker")
  -c, --context string     Name of the context to use to
                           connect to the daemon
...
...
```
