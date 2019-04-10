## Redis Sidekiq
###### http://blog.magmalabs.io/2018/09/25/dealing-first-scheduled-background-job.html
create rails app

```

rails new rails-sidekiq-redis

```

THEN add gem to gemfile,
```

gem 'redis-rails'
gem 'sidekiq'

```
THEN bundle install


ADD to config/application.rb
```

config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }

```

ADD to routes,

```


require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
end


```

THEN , See the Sidekiq Dashboard,

```

http://localhost:3000/sidekiq

```

THEN create worker,

sample is worker name,
```

rails g sidekiq:worker sample

```

THEN see the workers/sample_worker.rb
```

class SampleWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "Am Ruby and Elixir Watcher"
  end
end


```

BEFORE start redis server,

```

redis-server

```

THEN RUN your job into rails console,
```

SampleWorker.perform_async

```





