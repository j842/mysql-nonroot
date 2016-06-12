FROM mysql
MAINTAINER j842

RUN apt-get update \
   && apt-get install -y sudo \
   && rm -rf /var/lib/apt/lists/*

# we use non-root user in the container for security.
RUN groupadd -g 22027 drgroup \
   && adduser --disabled-password --gecos '' -u 22027 --gid 22027 druser

RUN echo "druser ALL= (ALL) NOPASSWD: /var/run/mysqld,/usr/local/bin/docker-entrypoint.sh" > /etc/sudoers.d/druser

USER druser
