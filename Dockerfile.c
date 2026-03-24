FROM python:3.12

WORKDIR /app

RUN apt-get update && apt-get install -y openssh-server 

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY . /app

RUN pip install -r requirements.txt

RUN mkdir -p /var/run/sshd && useradd -m -s /bin/bash rotem && echo "rotem:81" | chpasswd && echo "root:81" | chpasswd


EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
