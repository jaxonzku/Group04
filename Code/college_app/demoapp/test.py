import subprocess;
process=subprocess.Popen(["powershell","flutter build apk --build-name=1.0.1 --build-number=1"],stdout=subprocess.PIPE);
result=process.communicate()[0]
print (result)