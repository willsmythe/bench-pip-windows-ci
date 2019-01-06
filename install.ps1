# Steve Dower suggested that using a venv might make things faster on Azure,
# so we'll try it both ways.
# https://twitter.com/zooba/status/1078548597195497472
param([switch] $UseVenv)

Set-PSDebug -Trace 1

# https://superuser.com/a/1026449
Set-MpPreference -DisableRealtimeMonitoring $true

if ($UseVenv) {
    python -m venv myenv
    myenv\Scripts\activate
}

python -m pip install -U pip

python --version
python -c "import struct; print(struct.calcsize('P') * 8, 'bits')"
pip --version

Measure-Command {pip install -r requirements.txt}
pip list
