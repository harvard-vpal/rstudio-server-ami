#!/bin/bash

set -Eeuxo pipefail

# set instance ID as temporary password
curl -s http://169.254.169.254/latest/meta-data/instance-id | passwd rstudio --stdin
