dankAlerts is powered by Sysmon and Memes.  Would you really notice if a suspicious process was recorded in the event log of your small or medium size network? Not likely. dankAlerts presents anomalies to you in text written into meme images and guides you in order to reduce false positives.  Alerts from other systems can be sent to your workstatation via Base64encoded secure get requests to a python HTTPS enabled SimpleHTTPServer module. This method is used to strickly limit write access between systems.

![dankAlert](dankAlerts.jpg)

**Setup instructions**

1- Install and configure Sysmon.

There are several guides online. These are both solid guides.

https://community.sophos.com/kb/en-us/134205

https://www.blackhillsinfosec.com/getting-started-with-sysmon/

2- Install Awk for Windows  
**Google -->windows install awk<-- to find the sourceforge.net download site**

This is a very old version of awk for windows and it works perfectly for our needs.

Screenshot of the awk page that will take you to sourceforge https://github.com/firstoctet/dankAlerts/blob/master/awk1.PNG

3- If you don't want to use our pyinstaller created exe file (dankAlertMemGenerator.exe) install the following
  - python3 and pip
  - pip install pillow
  - pip install pyinstaller
  - Generate your own exe by running pyinstaller --onefile .\dankAlertMemGenerator.py
