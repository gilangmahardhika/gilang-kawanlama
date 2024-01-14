## Kawanlama Assesment Test

### Dependencies
```
ruby 3.3.0
kafka
imagemagick
postgresql
docker (optional)
```

### ENV Vars
```
config/database.yml

default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV.fetch("KL_DB_HOST") { "127.0.0.1" } %>
  port: <%= ENV.fetch("KL_DB_PORT") { 5432 } %>
  password: <%= ENV.fetch("KL_DB_PASSWORD")%>
  username: <%= ENV.fetch("KL_DB_USERNAME") { "postgres" } %>

development:
  <<: *default
  database: <%= ENV.fetch("KL_DB_DEV") { "kawanlama_development" } %>
  

test:
  <<: *default
  database: <%= ENV.fetch("KL_DB_TEST") { "kawanlama_test" } %>
```

```
karafka.rb

config.kafka = { 'bootstrap.servers': ENV.fetch("KAFKA_URL") { '127.0.0.1:9092' } }
```

### Setup
```
bundle install
rails db:migrate
rails db:seed
```

if kafka installer on machine just make sure it's running well, if no can use this
```
git clone git@github.com:karafka/karafka.git
cd karafka
docker-compose up
```

### Run Test
`rspec`

### Run The App
`bin/dev`
on separate terminal run `bundle exec karafka server`

### Live App
[Click Here](https://gilang-kawanlama-02ecbe03e798.herokuapp.com/)
