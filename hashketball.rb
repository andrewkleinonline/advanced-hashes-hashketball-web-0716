# Write your code here!

require 'pry'

def game_hash()

game_hash = {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
    }
  }
}

end


def num_points_scored(player)
  players_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_item, stats|
          if player_item == player
            players_points = data[player_item][:points]
          end
        end 
      end
    end
  end
  players_points
end


def shoe_size(player)
  players_shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_item, stats|
          if player_item == player
            players_shoe = data[player_item][:shoe]
          end
        end 
      end
    end
  end
  players_shoe
end


def team_colors(team)
  team_colors = []
  game_hash.select do |location, team_data|
    if game_hash[location][:team_name] == team
      team_colors = game_hash[location][:colors]
    end
  end
  team_colors
end


def team_names()
  team_names = []
  game_hash.each do |location, team_data|
    team_names << game_hash[location][:team_name]
  end
  team_names
end


def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team
      team_data[:players].each do |player, attributes|
        jersey_numbers << team_data[:players][player][:number]
      end
    end
  end
  jersey_numbers
end


def player_stats(player)
  player_stats = {}
  game_hash.each do |location, team_data|
    if game_hash[location][:players].include?(player)
      player_stats = game_hash[location][:players][player]
    end
  end
  player_stats
end


def big_shoe_rebounds
  biggest_shoe = 0
  biggest_shoe_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      if attributes[:shoe] > biggest_shoe
        biggest_shoe = attributes[:shoe]
        biggest_shoe_rebounds = attributes[:rebounds]
      end
    end
  end
  biggest_shoe_rebounds
end


def most_points_scored()
  most_points_player = ""
  most_points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      if attributes[:points] > most_points
        most_points = attributes[:points]
        most_points_player = player
      end
    end
  end
  most_points_player
end


def winning_team()
  winning_team = ""
  team_points = 0
  prev_team_points = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      team_points += team_data[:players][player][:points]
    end
    #binding.pry
    if team_points > prev_team_points
      winning_team = team_data[:team_name]
    end
    prev_team_points = team_points
    team_points = 0
  end

  winning_team
end


def player_with_longest_name()
  longest_name_player = ""
  longest_name_length = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      #binding.pry
      if player.length > longest_name_length
        #binding.pry
        longest_name_length = player.length
        longest_name_player = player
      end
    end
  end

  longest_name_player
end


def long_name_steals_a_ton?()
  longest_name_player = player_with_longest_name()

  most_steals_player = ""
  most_steals = 0

#binding.pry
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      #binding.pry
      if attributes[:steals] > most_steals
        most_steals = attributes[:steals]
        most_steals_player = player
      end
    end
  end

  most_steals_player == longest_name_player
end