# Comparison of `pip install` speed on different Windows CI platforms

I noticed that when I run `pip install` on Appveyor, it's like, 3x or
4x faster than when I run the same command on Azure Pipelines (both
using Windows). This has a *very* significant effect on how quickly
Azure can report test results, e.g. in my experiments with Trio,
Appveyor's total end-to-end time for a single job is ~1:40 on average,
while for Azure it's ~3:40.

This slowdown only seems to affect Azure's Windows agents; Azure's
Linux and macOS jobs seem to have similar speed to what we see on
Appveyor or Travis.

This repository is a minimal reproducer to demonstrate the issue.

`requirements.txt` is an arbitrary requirements file. It happens to be
the one we [use in
Trio](https://github.com/python-trio/trio/blob/master/test-requirements.txt).

[Example appveyor
build](https://ci.appveyor.com/project/njsmith/bench-pip-windows-ci/builds/21278811):
in this build `pip install -r requirements.txt` completes in 33.1 seconds.

[Example Azure
build](https://dev.azure.com/njs0835/bench-pip-windows-ci/_build/results?buildId=16).
There are two jobs here. (Click on the powershell task to see the
relevant logs):

* One that runs plain `pip install -r requirements.txt`, which
  completes in 100.6 seconds.
  
* One that sets up a venv, and then runs `pip install -r
  requirements.txt` inside the venv, [following a suggestion from
  Steve Dower](https://twitter.com/zooba/status/1078548597195497472).
  Here the `pip install` command finishes in 64.0 seconds, but if you
  look at the timestamps you can see the venv setup took ~41 seconds,
  so there's no real net improvement. (The venv setup starts on log
  line 13, and runs until log line 42.)

Twitter thread: https://twitter.com/vorpalsmith/status/1078546817409662976
