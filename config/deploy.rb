set :user, "yudai"
set :domain, "sinki.cc"

set :application, "asa"
set :repository,  "ssh://#{user}@#{domain}/~/git/#{application}.git"
set :deploy_to, "/home/#{user}/rails/#{application}"

set :scm, :git

# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

require "bundler/capistrano"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "sinki.cc"                          # Your HTTP server, Apache/etc
role :app, "sinki.cc"                          # This may be the same as your `Web` server
role :db,  "sinki.cc", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
default_run_options[:pty]=true
set :use_sudo, false

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", :bundle_install
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end
