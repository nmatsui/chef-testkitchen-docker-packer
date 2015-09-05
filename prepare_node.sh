#!/bin/bash

set -x

rm ~/.ssh/known_hosts
knife node delete ip-10-0-0-12.eu-central-1.compute.internal
knife zero bootstrap 10.0.0.12 -x ubuntu -i ~/.ssh/aws_frankfurt.pem --sudo
knife node run_list add ip-10-0-0-12.eu-central-1.compute.internal 'recipe[testweb::default]'
