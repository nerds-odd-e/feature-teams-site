FROM jekyll/builder AS builder

WORKDIR /srv/jekyll

COPY Gemfile Gemfile*.lock ./

RUN bundle install

COPY . .

ENV JEKYLL_ENV=production
RUN jekyll build && cp -r ./_site /build

FROM nginx:alpine AS serv

COPY --from=builder /build /usr/share/nginx/html
