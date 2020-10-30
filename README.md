# RStudio Server AMI

This Packer template builds an Amazon Machine Image based on the latest Amazon Linux 2 distribution and includes the following dpendencies for R and some commonly-installed packages:

* C and C++ compilers
* Java
* curl
* readline
* various image processing libraries (libpng, cairo, pango)
* pandoc
* OpenBLAS
* PostgreSQL
* zeroMQ
* git

R 3.6.3 is compiled with OpenBLAS and then RStudio Server is installed.

To build:

```sh
packer build \
    -var 'subnet_id=subnet-abcd0123' \
    -var 'ssh_keypair_name=foo' \
    -var 'ssh_private_key_file=~/.ssh/foo.pem' \
    -var 'instance_type=t2.small' \
    rstudio-server-ami.json
```

## Launching instances with the AMI

The first time an instance is launched, you can log in to RStudio with `rstudio` as the username and the instance ID as the password. Note that the password might not work immediately as it is set shortly after the first launch. The R file that is initially open will ask you to set a new password.

To use compile Markdown documents into PDF, use the [tinytex package](https://yihui.name/tinytex).
