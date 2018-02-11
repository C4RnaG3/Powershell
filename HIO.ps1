$ErrorActionPreference = 'SilentlyContinue' #Makes errors not display

function Menu #Main menu
{
    param (
            [string]$Title = "Welcome to HASH IT OUT!!"
    )
                    
    cls
    Write-Host "===========$Title==========="
                                
    Write-Host "1:SHA1"
    Write-Host "2:SHA256"
    Write-Host "3:SHA384"
    Write-Host "4:SHA512"
    Write-Host "5:MACTripleDES"
    Write-Host "6:MD5"
    Write-Host "7:RIPEMD160"
    Write-Host "8:QUIT"
}

do
{
Menu #Calls menu function

$hash = Read-Host "Which Hashing Algorithm?" #Determines hashing algorithm to use
$dir = Read-Host "Which Directory?" #Gets certain directory to hash
switch ($hash)
<# Hashes EVERYTHING in the specified directory,
   including hidden files and sub-directories#>
 {
  '1'{
      dir -force $dir * -Recurse | Get-FileHash -Algorithm SHA1 | Format-List | Out-File C:\SHA1.txt
  } '2' {
      dir -force $dir * -Recurse | Get-FileHash -Algorithm SHA256 | Format-List | Out-File C:\SHA256.txt
  } '3' {
      dir -force $dir * -Recurse | Get-FileHash -Algorithm SHA384 | Format-List | Out-File C:\SHA384.txt
  } '4' {
      dir -force $dir * -Recurse | Get-FileHash -Algorithm SHA512 | Format-List | Out-File C:\SHA512.txt
  } '5' {
      dir -force $dir * -Recurse | Get-FileHash -Algorithm MACTripleDES | Format-List | Out-File C:\MAC3DES.txt
  } '6' {
      dir -force $dir * -Recurse | Get-FileHash -Algorithm MD5 | Format-List | Out-File C:\MD5.txt
  } '7' {
      dir -force $dir * -Recurse | Get-FileHash -Algorithm RIPEMD160 | Format-List | Out-File C:\RIPE.txt
  }
 }
}
until ($hash -eq '8') #Keeps loop going until user hits the 8 key