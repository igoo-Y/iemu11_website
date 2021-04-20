json.extract! table, :id, :rank, :team_name, :match_count, :point, :win_count, :draw_count, :lose_count, :score_count, :lost_count, :created_at, :updated_at
json.url table_url(table, format: :json)
