# config valid only for current version of Capistrano
lock "3.10.0"

set :application, "m"
set :repo_url, "git@gitlab.com:malekmfs/sample_app.git"

# set :puma_threads,    [4, 16]
# set :puma_workers,    1
# set :puma_bind,       "unix:///tmp/m.sock"
# set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
# set :puma_access_log, "#{release_path}/log/puma.error.log"
# set :puma_error_log,  "#{release_path}/log/puma.access.log"
# set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
# set :puma_preload_app, true
# set :puma_worker_timeout, nil
# set :puma_init_active_record, true  # Change to false when not using ActiveRecord

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy _to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/m"

# Default value for :format is :airbrussh.
# set :format, :airbrussh
# You can configure the Airbrussh format using :format_options.

## Defaults:
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5
## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# namespace :puma do
#   desc 'Create Directories for Puma Pids and Socket'
#   task :make_dirs do
#     on roles(:app) do
#       execute "mkdir #{shared_path}/tmp/sockets -p"
#       execute "mkdir #{shared_path}/tmp/pids -p"
#     end
#   end

#   before :start, :make_dirs
# end

# namespace :deploy do
#   desc "Make sure local git is in sync with remote."
#   task :check_revision do
#     on roles(:app) do
#       unless `git rev-parse HEAD` == `git rev-parse origin/master`
#         puts "WARNING: HEAD is not the same as origin/master"
#         puts "Run `git push` to sync changes."
#         exit
#       end
#     end
#   end

#   desc 'Initial Deploy'
#   task :initial do
#     on roles(:app) do
#       before 'deploy:restart', 'puma:start'
#       invoke 'deploy'
#     end
#   end

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       invoke 'puma:restart'
#     end
#   end

#   before :starting,     :check_revision
#   after  :finishing,    :compile_assets
#   after  :finishing,    :cleanup
#   after  :finishing,    :restart
# end
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
