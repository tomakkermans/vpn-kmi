Authors: Tom Akkermans and Johan Moreels, 9/12/2019

- Preparation(0): request VPN account, create .ovpn file, install Networkmanager, import .ovpn file in Networkmanager, configure it and supply correct passwords.

    sudo apt-get install openvpn network-manager-openvpn network-manager-openvpn-gnome
    sudo service network-manager restart

- Preparation(1): Create folder called 'VPN' in home folder, e.g: tomakker@soot-p:~> mkdir VPN

- Preparation(2): Copy the necessary contents into this folder ("script_vpn_kmi.sh", "client.ovpn", folder "/scripts_for_desktop/"):

    tomakker@soot-p:~/VPN> ls -lah
    total 36K
    drwxr-xr-x  3 tomakker users  177  5 dec 20:19 .
    drwxr-xr-x 69 tomakker users 4,0K  5 dec 19:38 ..
    -rw-------  1 tomakker users  13K 20 dec  2018 client.ovpn
    drwxrwxr-x  2 tomakker users  105  5 dec 20:17 scripts_for_desktop
    -rw-r--r--  1 tomakker users 1,3K  5 dec 20:19 script_vpn_kmi_README.txt
    -rwxr-xr-x  1 tomakker users  442  5 dec 20:00 script_vpn_kmi.sh
    tomakker@soot-p:~/VPN> 

- Preparation(3): Copy the relevant (Gnome or KDE) scripts from folder "/scripts_for_desktop/" to the desktop:

    tomakker@soot-p:~/VPN/scripts_for_desktop$ ls -lah
    total 20K
    drwxrwxr-x 2 tom tom 4,0K dec  5 20:26 .
    drwxrwxrwx 3 tom tom 4,0K dec  5 20:26 ..
    -rwxrwxrwx 1 tom tom   40 dec  5 20:03 VPN_RMIB_gnome_newscreen.sh
    -rwxrwxrwx 1 tom tom   50 dec  5 20:03 VPN_RMIB_gnome.sh
    -rwxr-xr-x 1 tom tom   48 dec  5 20:09 VPN_RMIB_kde.sh
    tomakker@soot-p:~/VPN/scripts_for_desktop$ cp VPN_RMIB_kde.sh /home/tomakker/Desktop/

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
