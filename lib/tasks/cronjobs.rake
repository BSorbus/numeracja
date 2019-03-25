# lib/tasks/cronjobs.rake
require 'pwid'

namespace :cronjobs do
  desc "Synchronize data with system PWID-AMATOR"
  task plicbd_sync: :environment do
    PlicbdModule::load_data_from_plicbd
  end

end