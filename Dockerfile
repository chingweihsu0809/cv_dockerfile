# update on 2022/08/02
# the version of ubuntu is 20.04
FROM nvcr.io/nvidia/tensorrt:22.04-py3 
ADD requirements.txt .
RUN apt-get update -y
# TODO: specify the version for packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install --quiet -y software-properties-common python3-pip ffmpeg libsm6 libxext6 vim 
# We can display and decode chinese character by add the below line
RUN echo 'export LC_ALL="C.UTF-8"' >> /etc/bash.bashrc && ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime 

# We need to specify the wheel file address for pytorh (it sucks)
RUN pip3 install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu116
# The requirement file could be pruned in future
RUN pip3 install -r requirements.txt

WORKDIR /root