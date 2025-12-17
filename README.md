*This project has been created as part of the 42 curriculum by daniviei*

# Description:

	  Born2beroot is a project aimed at creating a server within a virtual machine.
	Therefore, we will not use graphical interface.

	In this project, I used Debian OS and did all the memory partitioning manually,
		using LVM (Logical Volume Manager).
	In it, i also configure the superuser (sudo), add a strong password
		policy, change the ssh port and activate it, and also configure the firewall
		using UFW.
	In addition, I also create a bash script to show some machine settings to all users
		and use crontab to display this configuration every 10 minutes.

*preciso colocar as comparaçoes e oq instalei como dito na ultima parte da descriçao do PDF.

# instructions:

	Create Machine:
	   For create the machine, download the ISO of the most current and stable version of
		Debian at https://www.debian.org/distrib/netinst and click on amd64 (standard
		architecture for PCs, notebooks, and servers).
	- Download or open VirtualBox (software for creating virtual machines).
	- Click ‘new’ to add a new machine.
	- Click on expertMode.
	- Set a name for the machine, the location to store it, and place the ISO you downloaded.
	- Click on hardware and set the memory to 2048 and the CPU to 4.
	- Click on ‘HardDisk’, then ‘Create a virtual hard disk now’, edit the ‘hard disk file
		location: debian_server.vdi’, change it to 30 GB and click on finish.

    Starting the machine:
        When starting the machine, select ‘install’ and continue.
    - Select the language, country, locale, and keyboard layout.
    - After installation, on the 'hostname' screen, enter the hostname for the machine.
    - On the 'domain' screen, unless you are trying to set a domain for this machine, you can
        leave it blank.
    - Create a password for ROOT (the system administrator). To view it, simply go to 
        ‘show password’ and select it with the ‘space’ key.
    - Create a username and then a password for this user.
    - Set the time based on your location.
    
     Partition disks:
        In this section, select Manual to partition the disk manually.
        Set the size for each partition.
    
    Encrypt volumes:
        After creating the partitions,
    - select ‘Configure encrypted volumes’ to encrypt the created partitions, and select yes.
    - Select ‘Create encrypted volume’.
    - Select ‘/dev/sda2’ (which has 31.7 GB after the partitions are created) using the 'space',
        then ‘done setting’ and finally ‘Finish’.
     - Select yes for the message.
    - Now we will set the password for partition encryption.
        Confirm that you have typed it correctly by checking ‘show password’ and confirm.


# Resources:
