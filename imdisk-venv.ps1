Set-PSDebug -Trace 1

gci env:

imdisk -a -t vm -m r: -s 200m -p "/fs:ntfs /q /y"

Add-MpPreference -ExclusionPath "r:\"

mkdir r:\tmp
mkdir r:\cache

Set-Item -Path Env:TMPDIR -Value r:\tmp
Set-Item -Path Env:PIP_CACHE_DIR -Value r:\cache

gci env:

python -m venv r:\myenv
r:\myenv\Scripts\activate

python -m pip install -U pip

python --version
python -c "import struct; print(struct.calcsize('P') * 8, 'bits')"
pip --version

pip install -r requirements.txt
