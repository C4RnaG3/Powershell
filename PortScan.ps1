<# 
    Author: C4RnaG3

    Script: PortScan.ps1

    Date: 2/12/2018

    Purpose: This is a crude, and simple portscanner
    only able to hit one port on a single system.
    This is mainly meant to continuously
    test to make sure that a port is staying open


#>

$ErrorActionPreference = 'SilentlyContinue' #Makes errors not display

$port = Read-Host "What port do you want to scan for?" #Gets target port

$ip = Read-Host "What IP address" #Gets target IP address

$time = Read-Host "How long (in SECONDS), between each test" #Gets sleep time

$count = '1'

do
{

Test-Connection -BufferSize 32 -Count 1 -Quiet -ComputerName $ip #Sees if target system is up

$socket = new-object System.Net.Sockets.TcpClient($ip, $port) #Builds the socket

IF($socket.Connected) #Tests for socket connection
{
    Write-Host "$ip listening on port $port"
    $socket.Close()
}
ELSE
{
    Write-Host "$ip not listening on port $port!!"
    $socket.Close()
}
Start-Sleep -s $time #Time before testing again
}
While ($count -eq '1')
