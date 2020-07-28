#!/bin/sh -x
# Put any cloud-init configs into place that we want in the base AMI

# Basic /etc/cloud/cloud.cfg
if [ -f /var/tmp/cloud.cfg ] && [ -d /etc/cloud ]; then
    /bin/cp -f /var/tmp/cloud.cfg /etc/cloud/cloud.cfg
    chown root:root /etc/cloud/cloud.cfg
    chmod 664 /etc/cloud/cloud.cfg
    rm -f /var/tmp/cloud.cfg
fi

# Growpart will expand the root vol automagically
if [ -f /var/tmp/10-growpart.cfg ] && [ -d /etc/cloud/cloud.cfg.d ]; then
    /bin/cp -f /var/tmp/10-growpart.cfg /etc/cloud/cloud.cfg.d/10-growpart.cfg
    chown root:root /etc/cloud/cloud.cfg.d/10-growpart.cfg
    chmod 644 /etc/cloud/cloud.cfg.d/10-growpart.cfg
    rm -f /var/tmp/10-growpart.cfg
fi
