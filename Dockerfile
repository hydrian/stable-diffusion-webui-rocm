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

RUN apt-get install -y --no-install-recommends libstdc++-12-dev ca-certificates wget gnupg2 gawk curl git libglib2.0-0 apt-utils python3.10-venv python3-pip libxml2-utils

# Install AMD Driver
RUN FILENAME=$(curl https://repo.radeon.com/amdgpu-install/latest/ubuntu/jammy/ | grep deb | xmllint --html --format --xpath "string(//a/@href)" - ) \
    && TEMP_DEB="$(mktemp)" \
    && wget -O "$TEMP_DEB" https://repo.radeon.com/amdgpu-install/latest/ubuntu/jammy/"$FILENAME" \
    && dpkg -i "$TEMP_DEB" \
    && rm -f "$TEMP_DEB"

RUN amdgpu-install -y --usecase=rocm

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

	
	
	
	
	
	



