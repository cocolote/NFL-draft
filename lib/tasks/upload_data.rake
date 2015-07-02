namespace :upload_data do
  require 'csv'

  desc "upload players"

  task :players => :environment do
    CSV.foreach("./players.csv", headers: true, header_converters: :symbol) do |p|
      position = Position.find_or_create_by(name: p[:position])
      Player.find_or_create_by(name: p[:player_name], position: position)
    end
  end
end
