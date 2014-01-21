# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'linuxwiki.info'
set :repo_url, 'git@github.com:PedroSena/linuxwiki.git'
set :scm, :git
set :branch, 'master'
set :deploy_to, '/srv'
set :deploy_via, :copy
set :rvm_type, :user
set :rvm_ruby_version, '2.0.0@linuxwiki.info'
set :tmp_dir, '/opt/nginx/tmp'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :copy_shared_files do
    on roles(:app) do
      execute "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      execute "cp #{shared_path}/config/initializers/omniauth.rb #{release_path}/config/initializers/omniauth.rb"
      execute "cp #{shared_path}/config/initializers/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
    end
  end

end
before 'deploy:restart','deploy:copy_shared_files'