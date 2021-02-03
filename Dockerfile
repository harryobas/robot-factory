FROM ruby:2.5

RUN apt-get update -yqq
COPY robot-factory.gemspec /usr/scr/robot-factory/
COPY Gemfile* /usr/src/robot-factory/

COPY . /usr/src/robot-factory/


WORKDIR /usr/src/robot-factory/

RUN gem install bundler -v 2.0.2
RUN bundle _2.0.2_ install

CMD ["/bin/bash"]