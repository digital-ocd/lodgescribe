# LodgeScribe

## Ruby version

* Ruby 2.1.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)


## Development Instructions

Clone the repository onto your machine.

```
$ git clone git@github.com:digital-ocd/lodgescribe.git
```

Configure git-flow for your local LodgeScribe repository.

```
$ cd lodgescribe
$ git flow init -d
```

Copy and configure secrets.yml

Copy and configure the database.yml

```
$ cp config/database.yml.example config/database.yml
```

Change the `username` to your local postgres user and then create databases:

```
$ bundle exec rake db:create:all
```