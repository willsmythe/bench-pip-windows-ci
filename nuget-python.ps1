Set-PSDebug -Trace 1

mkdir scratch

mkdir scratch\tmp
mkdir scratch\cache
$Env:TMPDIR = (Get-Item -Path scratch\tmp).FullName
$Env:TMP = (Get-Item -Path scratch\tmp).FullName
$Env:TEMP = (Get-Item -Path scratch\tmp).FullName
$Env:PIP_CACHE_DIR = (Get-Item -Path scratch\cache).FullName

# https://docs.python.org/3/using/windows.html#windows-nuget
nuget.exe install python -ExcludeVersion -OutputDirectory scratch

scratch\python\tools\python.exe -V

ls scratch\python\tools
ls scratch\python\tools\tools

$Env:PATH = ((Get-Item -Path scratch\python\tools).FullName + ";" + $Env:PATH)
python -V

python -m ensurepip

ls scratch\python\tools

pip --version
python -m pip install -U pip
pip --version

pip install -r requirements.txt
