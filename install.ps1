Set-PSDebug -Trace 1

python --version
python -c "import struct; print(struct.calcsize('P') * 8, 'bits')"
pip --version

Measure-Command {pip install -r requirements.txt}
pip list
