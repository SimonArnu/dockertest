FROM ubuntu:latest


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends python-pip wget curl locales build-essential python-dev python-six
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
RUN pip install --upgrade pip

RUN pip install --user setuptools
#RUN apt-get install -y build-essential python-dev  python-six
RUN pip install jupyter
#RUN apt-get install python-six

RUN mkdir /.jupyter
RUN chown 1000:1000 -R /.jupyter
RUN mkdir /.local
RUN chown 1000:1000 -R /.local

RUN mkdir /notebooks
RUN chown 1000:1000 -R /notebooks

ADD createconfig.py /
ADD startup.sh /
#ADD jupyter_notebook_config.py /.jupyter/

EXPOSE 8888

ENTRYPOINT /bin/bash startup.sh

#CMD jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --notebook-dir='/notebooks'
#ENTRYPOINT python createconfig.py && jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --notebook-dir='/notebooks'
#ENTRYPOINT ["jupyter", "notebook", "--port=8888", "--ip=0.0.0.0", "--no-browser", "--notebook-dir='/notebooks'"]