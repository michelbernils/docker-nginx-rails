FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /rails_app
WORKDIR /rails_app
COPY rails_app/Gemfile /rails_app/Gemfile
COPY rails_app/Gemfile.lock /rails_app/Gemfile.lock
RUN bundle install
COPY rails_app /rails_app
EXPOSE 3000

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# Configure the main process to run when running the image
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]