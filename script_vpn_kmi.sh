#!/bin/bash
#Authors: Tom Akkermans and Johan Moreels, 5/12/2019

fusermount -qu /mnt/thefly_remote
echo Opening_VPN_connection...
nmcli con up id client
echo Opening_SSHFS...
cd
sshfs tomakker@thefly.oma.be:/ /mnt/thefly_remote
echo Opening_SSH_connection...close_using_exit
ssh -X tomakker@thefly.oma.be
echo Closing_SSHFS...
fusermount -qu /mnt/thefly_remote
echo Closing_VPN_connection...
nmcli con down id client
echo Exiting_terminal...


