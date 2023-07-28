FROM ubuntu:jammy
ARG SD_BRANCH="rocm5.5"
SHELL ["/bin/bash", "-c"]  
ENV PORT=7860 \
    DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    REQS_FILE='requirements.txt' \
    COMMANDLINE_ARGS='' 

WORKDIR /opt

RUN apt -y update

RUN apt-get install -y --no-install-recommends libstdc++-12-dev ca-certificates wget gnupg2 gawk curl git libglib2.0-0 apt-utils python3.10-venv python3-pip

RUN wget https://repo.radeon.com/amdgpu-install/5.5/ubuntu/jammy/amdgpu-install_5.5.50500-1_all.deb

RUN apt-get install -y ./amdgpu-install_5.5.50500-1_all.deb

RUN amdgpu-install -y --usecase=rocm --no-dkms

RUN git clone -b $SD_BRANCH https://github.com/hydrian/stable-diffusion-webui.git /sd

WORKDIR /sd

RUN 	apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf /var/lib/apt/lists/* && \
	python3 -m venv venv && \
	source venv/bin/activate && \
	ln -s /usr/bin/python3 /usr/bin/python && \
	python3 -m pip install --upgrade pip wheel
	


 
EXPOSE ${PORT}

VOLUME [ "/sd/configs","/sd/models", "/sd/outputs","/sd/extensions", "/sd/plugins"]
ENTRYPOINT python -d launch.py --port "${PORT}"

	
	
	
	
	
	



