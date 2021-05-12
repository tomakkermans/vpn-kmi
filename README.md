Authors: Tom Akkermans and Johan Moreels, 9/12/2019

- Preparation(0): request VPN account, create .ovpn file, install Networkmanager, import .ovpn file in Networkmanager, configure it and supply correct passwords.

    sudo apt-get install openvpn network-manager-openvpn network-manager-openvpn-gnome
    sudo service network-manager restart

- Preparation(1): Create folder called 'VPN' in home folder, e.g: tomakker@soot-p:~> mkdir VPN

- Preparation(2): Copy the necessary contents into this folder ("script_vpn_kmi.sh", "client.ovpn", folder "/scripts_for_desktop/"):

    tomakker@soot-p:~> ls -lah
    -rw-rw-r--  1 tom tom  21K Mär 28 20:01 client.ovpn
    drwxrwxr-x  8 tom tom 4,0K Mai 12 21:13 .git
    -rw-r--r--  1 tom tom 2,7K Mär  6  2020 README.md
    drwxrwxr-x  2 tom tom 4,0K Mai 12 21:11 scripts_for_desktop
    -rwxrwxrwx  1 tom tom  445 Mär 28 22:09 script_vpn_kmi.sh
    -rwxr-xr-x  1 tom tom   50 Mär 11  2020 VPN_RMIB_gnome_newscreen.sh
    -rwxr-xr-x  1 tom tom   54 Mai 12 21:10 VPN_RMIB_gnome.sh
    -rwxr-xr-x  1 tom tom   55 Mär 28 22:05 VPN_RMIB_kde_newscreen.sh
    -rwxrwxrwx  1 tom tom   59 Mai 12 21:10 VPN_RMIB_kde.sh

- Preparation(3): Copy the relevant (Gnome or KDE) scripts from folder "/scripts_for_desktop/" to the desktop:

    tomakker@soot-p:~> cp VPN_RMIB_kde.sh /home/tomakker/Desktop/

- on personal laptop terminal, make new id_rsa WITHOUT password, and with default name id_rsa (first remove already existing)
  tomakker@soot-p:~> ssh-keygen

- make sure that VPN connection is correctly made (do this with networkmanager directly); this allows the use of "thefly" directly;

- then copy this info to the "authorized_keys" list on remote machine (and type password of thefly):
  tomakker@soot-p:~> ssh-copy-id -i id_rsa thefly
  tom@tom-linux:~> ssh-copy-id -i id_rsa tomakker@thefly
  
- normally, you should be able to directly: ssh tomakker@thefly (when vpn is open);


- using sudo, make directory on personal pc /mnt/thefly_remote
    tomakker@soot-p:/mnt> sudo mkdir thefly_remote
    tom@tom-linux:/mnt$ sudo mkdir thefly_remote

- and modify its ownership:
    tomakker@soot-p:/mnt> chown tomakker:users thefly_remote/
    tom@tom-linux:/mnt$ sudo chown tom:users thefly_remote/

- use this as mount point for sshfs, in that way it is not needed anymore to use SUDO to create this dir


in this way, the vpn script can be adapted without using passwords anymore !
