Set-PSDebug -Trace 1

# Use 3.7.1, because 3.7.2 is broken: https://bugs.python.org/issue35596
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.7.1/python-3.7.1-embed-amd64.zip" -OutFile python.zip

# The official python-*.zip files from python.org have *two* copies of
# vcruntime140.dll in them, for some reason. This annoys Expand-Archive, and
# you have to use -Force to get past that.
Expand-Archive python.zip -Force -DestinationPath python-dir

ls python-dir

$pydir = (Get-Item -Path python-dir).FullName

$Env:PATH = ($pydir + ";" + $pydir + "\scripts" + ";" + $Env:PATH)
$Env:PYTHONPATH = $pydir + "\lib\site-packages"

python -V

Invoke-WebRequest -Uri "https://bootstrap.pypa.io/get-pip.py" -OutFile get-pip.py
python get-pip.py -v

ls python-dir
ls python-dir\scripts
ls python-dir\lib
ls python-dir\lib\site-packages

pip --version
python -m pip --version

python -m pip install -U pip
python -m pip --version

python -m pip install -r requirements.txt
