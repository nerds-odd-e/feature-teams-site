FROM sesteva/nginx-jekyll-blog

RUN \
    jekyll build && \
    mv /_site /srv/www
