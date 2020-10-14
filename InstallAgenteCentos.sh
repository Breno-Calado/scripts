#!/bin/bash

mysqlPassword=$1

sudo rpm -Uvh https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/zabbix-release-4.4-1.el7.noarch.rpm
sudo yum install zabbix-agent -y

sudo echo PidFile=/var/run/zabbix/zabbix_agentd.pid > /etc/zabbix/zabbix_agentd.conf
sudo echo LogFile=/var/log/zabbix/zabbix_agentd.log >> /etc/zabbix/zabbix_agentd.conf
sudo echo LogFileSize=0 >> /etc/zabbix/zabbix_agentd.conf
sudo echo Server=$mysqlPassword >> /etc/zabbix/zabbix_agentd.conf
sudo echo Hostname=hostName >> /etc/zabbix/zabbix_agentd.conf
sudo systemctl enable zabbix-agent
sudo systemctl start zabbix-agent
sudo systemctl status zabbix-agent 
