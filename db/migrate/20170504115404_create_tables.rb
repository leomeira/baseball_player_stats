class CreateTables < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.timestamps
      t.string :year, null: false
    end

    create_table :seasons_leagues do |t|
      t.timestamps
      t.references :season
      t.references :league
    end

    create_table :leagues do |t|
      t.timestamps
      t.text :name, null: false
    end

    create_table :divisions do |t|
      t.timestamps
      t.references :league
      t.text :name, null: false, unique: true
    end

    create_table :teams do |t|
      t.timestamps
      t.references :division
      t.text :name, null: false
      t.text :city, null: false
    end

    create_table :players do |t|
      t.timestamps
      t.references :team
      t.float :avg, null: false, default: 0.0
      t.integer :at_bats, null: false, default: 0
      t.integer :caught_stealing, null: false, default: 0
      t.integer :doubles, null: false, default: 0
      t.integer :games, null: false, default: 0
      t.integer :games_started, null: false, default: 0
      t.text :given_name, null: false
      t.integer :hit_by_pitch, null: false, default: 0
      t.integer :hits, null: false, default: 0
      t.integer :home_runs, null: false, default: 0
      t.float :ops, null: false, default: 0.0
      t.integer :pb, null: false, default: 0
      t.integer :player_errors, null: false, default: 0
      t.integer :position, null: false, default: 0
      t.integer :rbi, null: false, default: 0
      t.integer :runs, null: false, default: 0
      t.integer :sacrifice_flies, null: false, default: 0
      t.integer :sacrifice_hits, null: false, default: 0
      t.integer :steals, null: false, default: 0
      t.integer :struck_out, null: false, default: 0
      t.text :surname, null: false
      t.integer :triples, null: false, default: 0
      t.integer :walks, null: false, default: 0
    end

    add_index :seasons, :year, unique: true
    add_index :seasons_leagues, [:season_id, :league_id], unique: true
    add_index :leagues, :name, unique: true
    add_index :divisions, [:name, :league_id], unique: true
    add_index :teams, :name, unique: true
    add_index :players, [:surname, :given_name, :team_id], unique: true
  end
end
