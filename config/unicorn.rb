root = "/var/www/railsapp/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.railsapp.sock"
worker_processes 2
preload_app true
timeout 30