try:
    import vim
    import subprocess

    subprocess.Popen([r"C:\Program Files\Git\bin\sh.exe"])
    print ("Opened shell")

except ImportError:
    print ("Shell not installed")
