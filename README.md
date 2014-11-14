Virtual Builder
===============

It's a little tool which allow to build a virtual machine. This VM contain:
- php 7
- composer
- Hoa
- atoum (and extension atoum-praspel)

Usage
=====

You _MUST_ run make to create a VM, all files available are template used for
create the real `debian.json` file and `preseed.cfg` file. The default
configuration will used `ash` as login and password.

```sh
make debian
```

If you want to overwrite the default login and password you can write

```sh
make debian username=mybetterusername
```

/!\ For now the username and the password are the same value

Requirements
============

- Packer >= v0.7.1
- Virtualbox  >= v4.3.18

Todo
====

- Allow to change password
- Complete build with postgresql-9.3
- Provide VM for Vagrant
- Allow to build a VM based on Ubuntu
- Use Ansible to provide a VM for specific usage

