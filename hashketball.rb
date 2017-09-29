def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors =>["Black", "White"],
      :players => {
        :alan_anderson => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        :reggie_evans => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        :brook_lopez => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        :mason_plumlee => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        :jason_terry => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players => {
        :jeff_adrien => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        :bismak_biyombo => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        :desagna_diop => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        :ben_gordon => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        :brendan_haywood => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals =>22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def fetch_player_value_from_game_hash(name, value)
  split_name = name.split(" ").map { |name| name.downcase }.join('_').to_sym

  if game_hash[:away][:players][split_name]
    return game_hash[:away][:players][split_name][value.to_sym]
  elsif game_hash[:home][:players][split_name]
    return game_hash[:home][:players][split_name][value.to_sym]
  end
end

def num_points_scored(name)
  return fetch_player_value_from_game_hash(name, 'points')
end

def shoe_size(name)
  return fetch_player_value_from_game_hash(name, 'shoe')
end

def team_colors(team_name)
  if game_hash[:away][:team_name] == team_name
    return game_hash[:away][:colors]
  elsif game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  end
end

def team_names
  return [].push(game_hash[:away][:team_name]).push(game_hash[:home][:team_name])
end

def numbers_from_players(players)
  numbers = []
  players.keys.each do |player_name|
    numbers << players[player_name][:number]
  end

  numbers
end

def player_numbers(team_name)
  if game_hash[:away][:team_name] == team_name
    numbers = numbers_from_players(game_hash[:away][:players])
  elsif game_hash[:home][:team_name] == team_name
    numbers = numbers_from_players(game_hash[:home][:players])
  end

  return numbers
end

def player_stats(name)
  split_name = name.split(" ").map { |name| name.downcase }.join('_').to_sym

  if game_hash[:away][:players][split_name]
    return game_hash[:away][:players][split_name]
  elsif game_hash[:home][:players][split_name]
    return game_hash[:home][:players][split_name]
  end
end

def big_shoe_rebounds
  players = game_hash[:away][:players].merge(game_hash[:home][:players])
  largest_shoe_size = 0
  largest_player = ''

  players.keys.each do |player_name|
    shoe_size = players[player_name][:shoe]
    if shoe_size > largest_shoe_size
      largest_shoe_size = shoe_size
      largest_player = player_name
    end
  end

  players[largest_player][:rebounds]
end
