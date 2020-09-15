# lib/tasks/cronjobs.rake
require 'plicbd'

namespace :cronjobs do
  desc "Synchronize data with system PLICBD"
  task plicbd_sync: :environment do
    PlicbdModule::load_data_from_plicbd
  end

end