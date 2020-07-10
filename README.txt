# Kitty
# Kitty ZYX
# ZYX Kitty
# zyx-kit

====================================================================
>>To start a session simply double click "start.cmd"
======================================

>>Before you click on start.cmd :

> edit the "login.conf file"
> And Specify the username, password/key, host and port to connect to.

(Optionally specify the title to Display on top of the window, and the name of the .ktx file [usually for theming purposes] to be used upon launch.)



------------------------------------
SAMPLE CONFIGURATION of login.txt:
------------------------------------
host=192.168.43.1
username=zyx
authtype=pw
keyname=
password=myVERYsecureP@55w0rd
port=5678
ktxfilename=Matrix
windowtitle=When life leaves us blind, love keeps us kind.
deployzyxtools=no

host=myawesomedomain.net
username=zyx
authtype=key
keyname=privkeyname
password=
port=22
ktxfilename=Matrix
windowtitle=Not everything that counts can be counted, and not everything that can be counted counts.
deployzyxtools=no
------------------------------------














***********************************
NOTEZ!:
***********************************
> The script will only accept 'pw' and 'key' for 'authtype'.
> Keys should be '.ppk', and you do not need to include the file extension when adding value to 'keyname'.
> Keep all the lines of login.conf file. Do not remove/add more lines.
> On login.conf, add the values after '=' , the script cannot work  with multi-line strings.
> Invalid string or blank string after 'deployzyxtools=' will cause the script to fail, valid values: no / yes
> There are 2 'themes' availble: Matrix (black bg green fg) and Sharingan (black bg red fg)

> WARNING! DO NOT SET 'deployzyxtools' to 'yes' 
    -If your user is not allowed to download in the /tmp directory
    -If your user cannot chmod files in /tmp directory
    -If your user cannot execute scripts in /tmp directory
    -And if your user cannot declare a directory inside /tmp as part of your user's '$PATH'


>Setting 'deployzyxtools' to 'yes' will deploy/update tools on your host's /tmp directory. Usage and description about the tools are as follows:

Tool #1: the 'z' command 
This is a special domain check tool, the tool is basically the command line version of the 'dip.zyx' script from my other repo https://github.com/zyxrhythm/zyxw.

        To perform a simple domain check, the syntax is as follows:

        z github.com

        For full domain check:

        z github.com -f


Tool #2: the 'prm' command
This script is basically orbiting the 'stat' command. The script shows files and folders permission on 'octal number' format.

You can use it by simply typing 'prm' followed by the path to the file/directory. Typing 'prm -h' adds hidden files/folders that starts with '.' on the results. And 'prm -x' shall include the owner of the file/folder in the result. If you do not include a path to file/folder the script will be executed on your current working directory.

    sample syntax is as follows:

    prm /path/to/dirorfile
    prm -h /path/to/dir
    prm -x /path/to/dirorfile
        

Tool #3: the 'fprm' command

Fix permissions of files and folders

This script is based on the following blog: 
https://odd.blog/2013/11/05/fix-file-644-directory-775-permissions-linux-easily/

$1 = directory permission 
     if blank, default value: 755 
     use 'x' to prevent the script from modifying directory permissions
	 
$2 = file permission
     if blank, default value: 644, 
     use x to to prevent the script from modifying file permissions.
	 
$3 = recursive switch
     if 'r' is added as 3rd parameter the script will do a recursive file and dir perm fix on the current dir, 
     if a valid directtory is used as 3rd parameter, the script will update permissions on that directory.
     if left blank the script will do a non-recursive file and dir perm fix on the current dir


Tool #4: the 'c' command 
Ultimate clear screen ;)


Tool #5: the 'd' command 
A shortcut/alias for the 'dig' command (Use it as you use the actual dig command).


Tool #6: the 'ws' command 
A shortcut/alias for the  'whois' command (Use it as you use the actual whois command).


Tool #7: the 'h' command 
A shortcut/alias for the  'host' command (Use it as you use the actual host  command).


Tool #8: the 'p' command 
A shortcut/alias for the  'ping' command(Use it as you use the actual ping  command).

***********************************
======================================




























=========================================
MORE NOTEZ:
========================================= 
If you want to change "how kitty looks", tweak it a bit, on how it should behave upon launch using .ktx files.

You can put your .ktx files at /etc/ktx/, then add the name of the file on login.conf.
or
You can directly edit the "Default%20Settings" file at /etc/ktx/default directory.




If you know how to write scripts for your shell, 
and you want to execute your own startup commands
edit /etc/ini/run.txt





-----------------------------------------
The repo/zip Contains:

1.) KITTY.exe from (http://www.9bis.net/kitty/)
  
  For license and copyright of Kitty try visiting their webpage.

2.) Some customized scripts and stuffs by https://github.com/zyxrhythm/
-----------------------------------------
=========================================




  MIT License
  Copyright (c) 2017 Zyx Rhythm https://github.com/zyxrhythm
