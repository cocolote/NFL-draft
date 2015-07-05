namespace :ud do
  require 'csv'

  desc "upload players"

  task :players => :environment do
    CSV.foreach("./players.csv", headers: true, header_converters: :symbol) do |p|
      position = Position.find_or_create_by(name: p[:position])
      Player.find_or_create_by(name: p[:player_name], position: position)
    end
  end

  desc "upload teams"

  task :teams => :environment do
    CSV.foreach("./teams.csv", headers: true, header_converters: :symbol) do |t|
      division = Division. find_or_create_by(name: t[:division])
      logo_url = "#{t[:team_name].downcase.split.join("-")}.png"
      Team.find_or_create_by(name: t[:team_name].rstrip!,
                             logo: logo_url,
                             division: division)
    end
  end

  desc "upload turns"

  task :turns => :environment do
    CSV.foreach("./order.csv", headers: true, header_converters: :symbol) do |line|
      line[:team_name].gsub!(/^NY/, "New York") if line[:team_name] =~ /^NY/
      team = Team.find_by(name: line[:team_name])
      Turn.create!(round: line[:round],turn: line[:pick], team: team)
    end
  end
end
