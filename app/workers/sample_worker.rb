class SampleWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "Am Ruby and Elixir Watcher"
  end
end
