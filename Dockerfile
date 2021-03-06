FROM governmentpaas/cf-cli

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock .ruby-version ./

RUN apk --update add g++ musl-dev make git nodejs
RUN bundle install

COPY . .

EXPOSE 4567

RUN bundle exec middleman build
