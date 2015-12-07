workers Integer(ENV['WORKERS']) if ENV.key?('WORKERS')
threads_count = Integer(ENV['THREADS'])
threads threads_count, threads_count

port ENV['PORT']
environment ENV['RAILS_ENV']

preload_app!
