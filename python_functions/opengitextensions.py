try:
    import vim
    import subprocess

    subprocess.Popen([r"C:\Program Files (x86)\GitExtensions\GitExtensions.exe"])
    print ("Opened GitExtensions")

except ImportError:
    print ("Shell not installed")
