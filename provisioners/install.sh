#!/bin/bash

set -Eeuxo pipefail

yum update -y

amazon-linux-extras install -y epel

# miscellaneous dependencies for R and common packages
yum install -y gcc gcc-gfortran gcc-c++ java-devel libcurl-devel readline-devel pcre-devel \
	bzip2-devel libpng-devel cairo-devel pango-devel libxml2-devel openssl-devel openblas-devel \
	postgresql-devel zeromq-devel

# pandoc (for R Markdown)
cd /tmp
wget https://github.com/jgm/pandoc/releases/download/2.11.0.4/pandoc-2.11.0.4-linux-amd64.tar.gz
tar xvzf pandoc-2.11.0.4-linux-amd64.tar.gz --strip-components 1 -C /usr/local

# R
cd /tmp
curl -O https://cran.r-project.org/src/base/R-3/R-3.6.3.tar.gz
tar xvf R-3.6.3.tar.gz
cd R-3.6.3
./configure --with-x=no --enable-R-shlib --with-blas="-lopenblas" --without-recommended-packages
make -j 2
make install

# R defaults
echo 'options(repos = c(CRAN="https://cran.r-project.org/"))' >> /usr/local/lib64/R/etc/Rprofile.site
/usr/local/bin/R CMD javareconf

# RStudio Server
yum install -y https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.3.1093-x86_64.rpm

# create user
adduser rstudio

# run server on port 80
echo 'www-port=80' >> /etc/rstudio/rserver.conf
