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

$Env:PATH = ((Get-Item -Path scratch\python\tools).FullName + ";"
             (Get-Item -Path scratch\python\tools\scripts).FullName + ";"
             + $Env:PATH)
python -V

# This installer has no 'pip' script that I can find, or ensurepip, but it
# does have a pip module. So you *have* to use python -m pip. Weird.
python -m pip --version
python -m pip install -vv -U pip
python -m pip --version

python -m pip install -vv -r requirements.txt
