FROM ruby

# Bundle install
RUN bundle config --global frozen 1
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install -r 3 -j 4 --without development test

# Setup
COPY . /usr/src/app
RUN rake assets:precompile assets:clean

# Environment
ENV RAILS_ENV=production
ENV PORT=80

# Run
EXPOSE 80
CMD ["bundle", "exec", "foreman", "start"]
