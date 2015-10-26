FROM ruby:2

RUN apt-get update -yq && apt-get install -yq build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3

ENV BOSH_INIT_VERSION 0.0.77
ADD https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-$BOSH_INIT_VERSION-linux-amd64 /usr/local/bin/bosh-init
RUN chmod +x /usr/local/bin/bosh-init

ENTRYPOINT ["/usr/local/bin/bosh-init"]
