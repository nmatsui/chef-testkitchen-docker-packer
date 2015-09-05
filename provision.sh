#!/bin/bash

set -x

knife zero chef_client 'name:ip-10-0-0-12.eu-central-1.compute.internal' -x ubuntu -i ~/.ssh/aws_frankfurt.pem --sudo
