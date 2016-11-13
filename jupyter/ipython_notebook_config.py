# http://stackoverflow.com/questions/22665809/how-to-configure-ipython-behind-nginx-in-a-subpath
c.NotebookApp.base_project_url = '/jupyter/'
c.NotebookApp.base_kernel_url = '/jupyter/'
c.NotebookApp.port = 8888
c.NotebookApp.ip = '*'
c.NotebookApp.trust_xheaders = True
c.NotebookApp.webapp_settings = {'static_url_prefix': '/jupyter/static/'}
