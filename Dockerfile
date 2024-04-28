FROM ruby:3.0.0
LABEL maintainer="lesha2003 Git"
ENV BUNDLER_VERSION=2.4.22
USER root
RUN mkdir ror_app
COPY First_RoR_proj/ ror_app
COPY First_RoR_proj/Gemfile .
COPY First_RoR_proj/Gemfile.lock .

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN apt-get -y update
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install curl
RUN apt-get -y install openssl
RUN apt-get -y install yarn
RUN apt-get -y install sqlite3

RUN gem install bundler -v 2.4.22
RUN bundle install


CMD [ "./entrypoint.sh" ]
EXPOSE 5000
