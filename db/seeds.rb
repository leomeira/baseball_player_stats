file = File.read("/Users/leomeira/Workspace/baseball_player_stats/public/all_stats.json")
data_hash = JSON.parse(file)

ActiveRecord::Base.transaction do
  begin
    s = data_hash['SEASON']
    season = Physical::Season.find_or_create_by(year: s['YEAR'])

    leagues = s['LEAGUE']
    divisions = []

    leagues.each do |l|
      league = Physical::League.find_or_create_by(name: l['LEAGUE_NAME'])

      Physical::SeasonsLeague.find_or_create_by(season_id: season.id, league_id: league.id)

      l['DIVISION'].each do |d|
        division = Physical::Division.find_or_create_by(
          name: d['DIVISION_NAME'],
          league_id: league.id
        )

        d['TEAM'].each do |t|
          team = Physical::Team.find_or_create_by(
            city: t['TEAM_CITY'],
            name: t['TEAM_NAME'],
            division_id: division.id
          )

          t['PLAYER'].each do |p|
            begin
              player = Physical::Player.find_or_initialize_by(
                team_id: team.id,
                given_name: p["GIVEN_NAME"],
                surname: p["SURNAME"]
              )

              if player.new_record?
                at_bats = p["AT_BATS"].to_i
                caught_stealing = p["CAUGHT_STEALING"].to_i
                doubles = p["DOUBLES"].to_i
                games = p["GAMES"].to_i
                games_started = p["GAMES_STARTED"].to_i
                hit_by_pitch = p["HIT_BY_PITCH"].to_i
                hits = p["HITS"].to_i
                home_runs = p["HOME_RUNS"].to_i
                pb = p["PB"].to_i
                player_errors = p["ERRORS"].to_i
                position = p["POSITION"].to_i
                rbi = p["RBI"].to_i
                runs = p["RUNS"].to_i
                sacrifice_hits = p["SACRIFICE_HITS"].to_i
                sacrifice_flies = p["SACRIFICE_FLIES"].to_i
                steals = p["STEALS"].to_i
                struck_out = p["STRUCK_OUT"].to_i
                triples = p["TRIPLES"].to_i
                walks = p["WALKS"].to_i

                # Compute AVG
                avg = at_bats == 0 ? 0 : (hits / (at_bats * 1.0))

                # Compute OPS
                numerator = hits + hit_by_pitch + walks
                denominator = at_bats + walks + sacrifice_flies + hit_by_pitch * 1.0
                if denominator > 0
                  obp = numerator / denominator
                  total_bases = doubles + triples + home_runs + (hits - struck_out)
                  slg = total_bases + at_bats
                  ops = obp + slg
                else
                  ops = 0
                end

                player.update_attributes(
                  at_bats: at_bats,
                  avg: avg.round(2),
                  caught_stealing: caught_stealing,
                  doubles: doubles,
                  games: games,
                  games_started: games_started,
                  hit_by_pitch: hit_by_pitch,
                  hits: hits,
                  home_runs: home_runs,
                  ops: ops.round(2),
                  pb: pb,
                  player_errors: player_errors,
                  position: position,
                  rbi: rbi,
                  runs: runs,
                  sacrifice_hits: sacrifice_hits,
                  sacrifice_flies: sacrifice_flies,
                  steals: steals,
                  struck_out: struck_out,
                  triples: triples,
                  walks: walks
                )
              end

            rescue => e
              puts e.message
            end
          end

        end

      end
    end
  rescue => e
    puts e.message
    raise ActiveRecord::Rollback
  end
end
