imdisk
imdisk -a -t vm -m r: -s 200m -p "/fs:ntfs /q /y"
imdisk -l

Add-MpPreference -ExclusionPath "r:\"

python -m venv r:\myenv
r:\myenv\Scripts\activate

python -m pip install -U pip

python --version
python -c "import struct; print(struct.calcsize('P') * 8, 'bits')"
pip --version

pip install -r requirements.txt
