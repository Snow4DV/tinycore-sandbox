# Tinycore Sandbox

This is a small sandbox based on latest TinyCore linux with compiletc package installed. 

## Default behaviour
It compiles main.c and main.cpp files [in c/ and c++/ directories] with mathlib linked and runs it inside the qemu VM.

P.S. -monitor stdio can be used to ignore boot messages


## Purpose
Script dynamically creates modified tinycore livecd image that can be booted inside qemu. 

## What can you do? 
* Edit data/rootfs/etc/inittab to change script that will be launched after system startup. By default data/rootfs/usr/bin/autocompile is being launched by root
* Edit data/rootfs/etc/init.d/tc-config to change behaviour before system initialization 
* Edit data/rootiso/boot/isolinux/isolinux.cfg to change boot behavior. 


# Tinycore boot arguments
 You can use these arguments to start TinyCore in different way in data/rootiso/boot/isolinux/isolinux.cfg:

 tce={hda1|sda1}            Specify restore TCE apps directory
 restore={hda1|sda1|floppy} Specify saved configuration location
 waitusb=X                  Wait X seconds for slow USB devices
 swapfile{=hda1}            Scan or specify swapfile
 home={hda1|sda1}           Specify persistent home directory
 opt={hda1|sda1}            Specify persistent opt directory
 lst=yyy.lst                Load alternate static yyy.lst on boot
 base                       Do not load any extensions
 norestore                  Turn off the automatic restore
 safebackup                 Saves a backup copy (mydatabk.tgz)
 showapps                   Display application names when booting
 iso=sdb1                   Boot directly from iso file at sdb1
 iso==/mnt/sdb1/multiboot/ISOS/TinyCore-4.4.iso		
 
 Color            640x480     800x600      1024x768     1280x1024
   256    8 bit     769         771           773          775
 32000   15 bit     784         787           790          793
 65000   16 bit     785         788           791          794
 16.7M   24 bit     786         789           792          795

 vga=7xx                    7xx from table above
 xsetup                     Prompt user for Xvesa setup
 lang=en                    C only unless getlocale.tcz is installed
 kmap=us                    US only unless kmaps.tcz is installed
 text                       Textmode
 superuser                  Textmode as user root
 noicons                    Do not display icons
 noicons=ondemand           Do not display ondemand icons
 noswap                     Do not use swap partition
 nodhcp                     Skip the dhcp request at boot
 noutc                      BIOS is using localtime
 pause                      Pause at completion of boot messages

 {cron|syslog}              Start various daemons at boot
 host=xxxx                  Set hostname to xxxx
 secure                     Set password
 protect                    Password encrypted backup
 noautologin                Skip automatic login
 tz=GMT+8                   Timezone tz=PST+8PDT,M3.2.0/2,M11.1.0/2
 user=abc                   Specify alternate user
 desktop=yyy                Specify alternate window manager
 laptop                     Force load laptop related modules
 noembed                    Unpack initramfs to tmpfs
 nozswap                    Skip compressed swap in ram
 xvesa=800x600x32           Set Xvesa default screen resolution
 mydata=yyy                 Specify alternate backup file name
 blacklist=ssb              Blacklist a single module
 multivt                    Allows for multiple virtual terminals
