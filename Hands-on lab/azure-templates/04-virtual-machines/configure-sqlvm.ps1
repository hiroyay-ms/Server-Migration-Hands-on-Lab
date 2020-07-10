# Disable Internet Explorer Enhanced Security Configuration
function Disable-InternetExplorerESC {
    $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
    $UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
    Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 -Force
    Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 -Force
    Stop-Process -Name Explorer -Force
    Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green
}

# Disable IE ESC
Disable-InternetExplorerESC

Invoke-WebRequest 'https://raw.githubusercontent.com/hiroyay-ms/Server-Migration-Hands-on-Lab/master/Hands-on%20lab/src/ContosoInsurance.zip' -OutFile 'C:\ContosoInsurance.zip'
Expand-Archive -LiteralPath 'C:\ContosoInsurance.zip' -DestinationPath 'C:\ContosoInsurance' -Force
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory('C:\ContosoInsurance.zip','C:\ContosoInsurance')

Copy-Item 'C:\ContosoInsurance\*' -Destination 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA' -Recurse

# Attach ContosoInsurance Database
function Attach-SqlDatabase {
    #Add snap-in
    Add-PSSnapin SqlServerCmdletSnapin* -ErrorAction SilentlyContinue

    $ServerName = 'SQL-SVR'
    $DatabaseName = 'ContosoInsurance'
    $FilePath = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\'
    $MdfFileName = $FilePath + 'ContosoInsurance.mdf'
    $LdfFileName = $FilePath + 'ContosoInsurance_log.ldf'

    $AttachCmd = "CREATE DATABASE [" + $DatabaseName + "] ON (FILENAME = '" + $MdfFileName + "'), (FILENAME = '" + $LdfFileName + "') for ATTACH"

    Invoke-Sqlcmd -ServerInstance $ServerName -Query $AttachCmd
}

Attach-SqlDatabase

# Time Zone settings
Set-TimeZone -Id "Tokyo Standard Time"