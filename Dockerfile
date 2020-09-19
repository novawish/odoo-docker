FROM python:3.8.2

WORKDIR /opt/odoo

RUN apt-get update && apt-get install -y curl wget git build-essential python-dev python3-dev libldap2-dev libsasl2-dev libssl-dev nano libxml2-dev libxslt1-dev zsh postgresql virtualenv gitpython

# Install oh-my-zsh
ENV ZSH_THEME risto
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
# docker exec -it <container_id> /bin/zsh

# Install Odoo dependencies
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb \
&& apt-get install -y ./wkhtmltox_0.12.5-1.buster_amd64.deb
# RUN apt-get install -y npm && npm install -g less

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

EXPOSE 22 8069

ENTRYPOINT ["tail", "-f", "/dev/null"]

