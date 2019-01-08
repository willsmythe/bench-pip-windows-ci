Set-PSDebug -Trace 1

mkdir scratch

mkdir scratch\tmp
mkdir scratch\cache
Set-Item -Path Env:TMPDIR -Value (Get-Item -Path scratch\tmp).FullName
Set-Item -Path Env:TMP -Value (Get-Item -Path scratch\tmp).FullName
Set-Item -Path Env:TEMP -Value (Get-Item -Path scratch\tmp).FullName
Set-Item -Path Env:PIP_CACHE_DIR -Value (Get-Item -Path scratch\cache).FullName

# https://docs.python.org/3/using/windows.html#windows-nuget
Install-Package python -ExcludeVersion

ls
ls python
python\tools\python.exe -V
ls scratch\python
ls scratch\python\tools
scratch\python\tools\python.exe -V
