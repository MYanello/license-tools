FROM python:3.12.0-bookworm
LABEL maintainer="Marcus Yanello <myanello@rescale.com>"

WORKDIR /opt/
ADD ./license_utils/*-latest /usr/local/bin
ADD ./app/ /opt/

RUN apt update
RUN apt install lsb-release
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install -r app/requirements.txt

RUN useradd -m vns3-user
USER vns3-user
RUN chown vns3-user:vns3-user /etc/hosts

EXPOSE 5001
CMD ["python3", "main.py"]
