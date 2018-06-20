Gitchain
========
Decentralized P2P Git Network

[![Build Status](https://secure.travis-ci.org/gitchain/gitchain.png)](http://travis-ci.org/gitchain/gitchain)


To quote from git's own description:

> Git is a free and open source distributed version control system designed to handle everything
> from small to very large projects with speed and efficiency.

Gitchain is an application of ideas behind Bitcoin, Namecoin and DHT applied to Git hosting. Once you install it, it acts as a local proxy to the entire Gitchain P2P network.

[Support the project on Kickstarter](https://www.kickstarter.com/projects/612530753/gitchain)

Build Instructions
------------------

Make sure you have atleast go1.4.3 installed and your GOPATH variable is pointing to a user-writeable directory.

```shell
$ make prepare # (only first time or whenever Godeps file is updated)
$ make
```

Docker
------

```shell
$ docker build . -t gitchain:latest 
$ docker run --name gitchain -d -v gitchain:/data -p 3000:3000 -p 31000:31000 --restart unless-stopped gitchain
```