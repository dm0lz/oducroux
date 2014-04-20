require "bundler/capistrano"
require "rvm/capistrano"

load "config/recipes/base"
load "config/recipes/node"
load "config/recipes/nginx_puma"
load "config/recipes/puma"
load "config/recipes/mysql"
load "config/recipes/rvm"

server "146.185.176.72", :web, :app, :db, :primary => true

set :site_url, "oducroux.com"
set :application, "oducroux"
set :user, "deployer"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false

set :shared_children, shared_children + %w{public/uploads}

set :scm, "git"
set :repository,  "https://github.com/oducroux/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

#default_run_options[:shell] = '/bin/bash --login'


after "deploy", "deploy:cleanup" # keep only the last 5 releases

after "deploy", "puma:start"

