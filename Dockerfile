#FROM ruby:2.3.1-alpine  
#ADD Gemfile /home/vagrant/ROR_MongoDB/app  
#ADD Gemfile.lock /home/vagrant/ROR_MongoDB/app  
#RUN apk --update add --virtual build-dependencies ruby-dev build-base && \  
#    gem install bundler --no-ri --no-rdoc && \
#    cd /home/vagrant/ROR_MongoDB/app ; bundle install --without development test && \
#    apk del build-dependencies
#ADD . /home/vagrant/ROR_MongoDB/app  
#RUN chown -R nobody:nogroup /home/vagrant/ROR_MongoDB/app  
#USER nobody  
#ENV RACK_ENV production  
#EXPOSE 9292  
#WORKDIR /home/vagrant/ROR_MongoDB/app  


FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
