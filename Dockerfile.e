ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}

ARG USERNAME=rotem
ARG PASSWORD=81

ENV WORKDIR=/app
ENV VENV_PATH=/opt/venv

RUN apt-get update && apt-get install -y openssh-server 

RUN python -m venv ${VENV_PATH}
ENV PATH="${VENV_PATH}/bin:$PATH"

WORKDIR ${WORKDIR}
COPY . ${WORKDIR}

RUN pip install --upgrade pip && pip install -r requirements.txt

RUN mkdir -p /var/run/sshd && useradd -m -s /bin/bash ${USERNAME} && echo "${USERNAME}:${PASSWORD}" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
