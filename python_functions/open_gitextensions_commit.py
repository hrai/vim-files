try:
    import vim
    import subprocess

    current_dir = vim.eval("expand('<sfile>:p:h')")

    subprocess.Popen(["C:\Program Files (x86)\GitExtensions\GitExtensions.exe", "commit", current_dir])
    print ("Opening GitExtensions commit window in " + current_dir)

except ImportError:
    print ("Shell not installed")
