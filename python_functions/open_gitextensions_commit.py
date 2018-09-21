try:
    import vim
    import subprocess

    current_dir = vim.eval("expand('<sfile>:p:h')")
    

    subprocess.Popen(["C:\Program Files (x86)\GitExtensions\GitExtensions.exe", "commit", current_dir])
    print ("Opened GitExtensions commit window" + current_dir)

except ImportError:
    print ("Shell not installed")
