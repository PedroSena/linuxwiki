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

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
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