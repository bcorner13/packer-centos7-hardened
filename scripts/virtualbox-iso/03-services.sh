#!/bin/sh -x
#
# Enable necessary services
systemctl -q enable rsyslog
systemctl -q enable sshd
systemctl -q enable tuned
systemctl -q enable auditd
systemctl -q enable chronyd
systemctl -q enable NetworkManager

systemctl -q disable kdump
systemctl stop firewalld
systemctl stop tuned
