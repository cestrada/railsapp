require "bundler/capistrano"

# Hay que cambiar la IP del servidor con la IP pública donde será alojada la aplicación.
server "52.4.138.188", :web, :app, :db, :primary => true

set :application, "railsapp"
set :user, "ubuntu"
set :deploy_to, "/var/www/#{application}"

# Opciones de configuración si estás usando keypairs para acceder vía SSH al servidor. Hay que cambiar el nombre de la llave.pem
set :ssh_options, {
  keys: %w(/Users/Carlos/.ssh/Fonacot.pem),
  forward_agent: false,
  auth_methods: %w(publickey password)
}

# Opciones para cargar la aplicación desde el servidor de repositorios GITHUB
set :scm, :git
set :repository,  "git@github.com:cestrada/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    put File.read("config/application.yml"), "#{shared_path}/config/application.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  before "deploy", "deploy:check_revision"

  # If you want to use command line options, for example to start multiple workers,
  # define a Capistrano variable delayed_job_args:
  #
  #   set :delayed_job_args, "-n 2"
end