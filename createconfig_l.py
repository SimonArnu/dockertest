from notebook.auth import passwd
outfile = open("./jupyter_notebook_config.py", "w")
outfile.write("c.NotebookApp.password = u\"%s\"" % passwd(open("my_secret.txt", "r").read()))
outfile.close()