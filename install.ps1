# Steve Dower suggested that using a venv might make things faster on Azure,
# so we'll try it both ways.
# https://twitter.com/zooba/status/1078548597195497472
param([switch] $UseVenv)

#Set-PSDebug -Trace 1

# None of this seems to help, alas:
# Get-MpPreference
# # https://superuser.com/a/1026449
# Set-MpPreference -DisableRealtimeMonitoring $true
# Set-MpPreference -DisableRealtimeMonitoring $false
# Get-MpPreference
# # Get-Service WinDefend | stop-service

mkdir tmp
mkdir cache
Set-Item -Path Env:TMPDIR -Value (Get-Item -Path tmp).FullName
Set-Item -Path Env:TMP -Value (Get-Item -Path tmp).FullName
Set-Item -Path Env:TEMP -Value (Get-Item -Path tmp).FullName
Set-Item -Path Env:PIP_CACHE_DIR -Value (Get-Item -Path cache).FullName

Get-Item -Path Env:P*

if ($UseVenv) {
    python -m venv myenv
    myenv\Scripts\activate.ps1
}

python -m pip install -U pip

python --version
python -c "import struct; print(struct.calcsize('P') * 8, 'bits')"
pip --version

Measure-Command {pip install --verbose -r requirements.txt}
pip list
