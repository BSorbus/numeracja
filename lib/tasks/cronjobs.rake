# lib/tasks/cronjobs.rake
require 'plicbd'

namespace :cronjobs do
  desc "Synchronize data with system PLICBD"
  task plicbd_sync: :environment do
    PlicbdModule::load_data_from_plicbd
  end

  desc "Synchronize data without system PLICBD"
  task other_csv_sync: :environment do
    OrvcTable.load_data_from_csv_file
  end

end