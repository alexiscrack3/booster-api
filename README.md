# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

Installing `pg` gem on Mac computers with Apple silicon

If you're trying to install the postgresql gem `pg` and it is failing with the following error message:

```sh
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
```

The following will resolve the issue without having to install the entire postgresql.

```sh
brew install libpq
bin/bundle config build.pg --with-pg-config=/opt/homebrew/opt/libpq/bin/pg_config
bin/bundle
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...