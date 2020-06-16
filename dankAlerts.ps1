cls
# The safest way to add authorized programPaths is to go to the exe using explorer
# and copying the path in explorer.  Evil doers have been known to create file paths
# that look like c:\Program Files, but use odd characters that are difficult to see.

# Storing here to prevent modification by low priv evil doers.
$path = "C:\Windows\dankAlerts"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Path $path -Confirm
}

# Storing in C:\Windows\dankAlerts to prevent modification by low priv evil doers.
if (!(Test-Path "$path\AuthorizedProgramPathNames.txt"))
{
   New-Item  -ItemType File -Path $path -Confirm 
}


# Storing in C:\Windows\dankAlerts to prevent modification by low priv evil doers.
if (!(Test-Path "$path\AuthorizedNetworkTalkers.txt"))
{
   New-Item  -ItemType File -Path $path -Confirm 
}

# Storing in C:\Windows\dankAlerts to prevent modification by low priv evil doers.
if (!(Test-Path "$path\AuthorizedNetworkTalkers.txt"))
{
   New-Item  -ItemType File -Path $path -Confirm 
}

<#
# OPTIONAL
# Create a desktop shortcut to the dankAlerts directory
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\dankAlerts.lnk")
$Shortcut.TargetPath = "$path"
$Shortcut.Save()
$WshShell = ""
#>

$Sysmon3 = wevtutil.exe qe Microsoft-Windows-Sysmon/Operational /q:"*[System[(EventID=3) and TimeCreated[timediff(@SystemTime) <= 369900]]]" | 
    ForEach-Object {$_ -replace '<', "`n"} | findstr /i "timecreated image" | 
    awk -F ":" '{if ($0 ~ /TimeCreated/) {printf $1\":MM?:SS?\"} else {print \"~\",$0}}' | 
    Sort-Object | Get-Unique


<#
# OPTIONAL
# minimize all windows to get your attention
#$AuthNetTalkers = Get-Content "$path\AuthorizedNetworkTalkers.txt"
$minWindows = New-Object -ComObject "Shell.Application"
$minWindows.minimizeall()
$minWindows = ""
#>

ForEach ($line in $Sysmon3)
{
    $line = $line.Split("~")
    $timeCreated = $line[0]
    $programPathName = $line[1]
    $programPathName = $programPathName.Split("?=>")[2] 
    #$timeCreated
    $programPathName
    $testIfFound = "not-Found"
    $testIfFound = Get-Content "$path\AuthorizedNetworkTalkers.txt" | Where-Object {$_.Contains($programPathName)}
    if (!($programPathName -eq $testIfFound))
    {
    Start-Process -FilePath "$path\dankAlertMemGenerator.exe" -ArgumentList `""$path\emptyMemes\bart1.jpg`"", `""   
    Sysmon Process Create / EventID 1

    $timeCreated

    ProgramPathName:$programPathName

    **************************************************************************
    If you trust this Program and don't want this alert, add the
    ProgramPathName value to the following file.

    C:\Windows\dankAlerts\Authorized-Programs.txt
    or IF webCheck is enabled..
    https://dankAlerts.local/Authorized-Programs.htm
    **************************************************************************
     `""
    }
    Start-Sleep -Seconds 2
}


#sleep for 15 minutes to 1 hour
