#env :GEM_PATH, ENV['GEM_PATH']

require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/../lib/plicbd")

env :PATH, ENV['PATH']
set :bundle_command, "/home/deploy/.rbenv/shims/bundle exec"


set :environment, :production
set :output, "#{Rails.root}/log/cron_log.log"


every '10 18 * * 1-6' do
  rake "cronjobs:plicbd_sync"
end
