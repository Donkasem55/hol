import sys, subprocess, os

BOOLARGS = {"core", "default"}
arglist = {i:False for i in BOOLARGS}

if len(sys.argv) == 1:
	args = ["default"]
else:
	args = sys.argv[1:]

for i in args:
	if i in BOOLARGS:
		arglist[i] = True


if arglist["default"] == True:
	arglist["core"] = True


if "build" not in os.listdir():
	os.mkdir("build")

CORE = "sh/core.ps1"

if arglist["core"] == True:
	output = subprocess.run(["powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", CORE])


