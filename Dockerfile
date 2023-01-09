FROM ruby:3.2.0 

RUN apt-get update
RUN apt-get install -y telnet
RUN apt-get install -y vim

RUN gem install byebug