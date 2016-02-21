from ubuntu:15.04

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get install -y wget
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y elixir postgresql git make rebar esl-erlang

COPY politi-kart /app
WORKDIR /app

RUN rm mix.lock

RUN MIX_ENV=prod /usr/local/bin/mix local.hex --force && \
    MIX_ENV=prod /usr/local/bin/mix clean --all && \
    MIX_ENV=prod /usr/local/bin/mix deps.clean --all && \
    MIX_ENV=prod /usr/local/bin/mix deps.get && \
    MIX_ENV=prod /usr/local/bin/mix deps.update gettext && \
    MIX_ENV=prod /usr/local/bin/mix compile && \
    MIX_ENV=prod /usr/local/bin/mix phoenix.digest


RUN apt-get autoremove && apt-get autoclean

ADD bootstrap.sh /usr/bin/bootstrap.sh
RUN chmod +x /usr/bin/bootstrap.sh
EXPOSE 4000

ENTRYPOINT ["/usr/bin/bootstrap.sh"]

