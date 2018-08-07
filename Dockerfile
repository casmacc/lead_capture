FROM ruby:2.5

MAINTAINER Andy Leak <andy@r210.com>

RUN apt-get update && \
    apt-get install -y net-tools

# Install gems
ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Start server
ENV PORT 4567
EXPOSE 4567
CMD ["ruby", "app.rb"]
