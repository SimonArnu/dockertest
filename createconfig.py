from notebook.auth import passwd
try:
	outfile = open("/.jupyter/jupyter_notebook_config.py", "w")
	outfile.write("c.NotebookApp.password = u\"%s\"" % passwd(open("/run/secrets/jupyter_secret", "r").read()))
	outfile.close()
except Exception as e:
	print e
