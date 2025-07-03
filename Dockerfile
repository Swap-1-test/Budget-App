# Use Ruby 3.1.2 to match the Gemfile
FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.3.6
RUN bundle _2.3.6_ install

COPY . .

RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
