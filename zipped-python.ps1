Set-PSDebug -Trace 1

Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.7.2/python-3.7.2-embed-amd64.zip" -OutFile python.zip

Expand-Archive python.zip -DestinationPath python-dir

ls python-dir

$Env:PATH = ((Get-Item -Path python-dir).FullName + ";" + $Env:PATH)

python -V

python -m ensurepip

pip --version

python -m pip install -U pip
pip --version

pip install -r requirements.txt
