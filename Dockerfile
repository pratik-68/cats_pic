FROM ruby:3.2

# Working directory
WORKDIR /app

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

EXPOSE 3000

CMD ["./bin/rails", "server"]
