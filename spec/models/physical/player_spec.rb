require 'rails_helper'

describe Physical::Player, type: :model do

  subject { described_class.new  }

  it { is_expected.to respond_to :id  }
  it { is_expected.to respond_to :created_at }
  it { is_expected.to respond_to :updated_at }
  it { is_expected.to respond_to :team_id }
  it { is_expected.to respond_to :avg }
  it { is_expected.to respond_to :at_bats }
  it { is_expected.to respond_to :caught_stealing }
  it { is_expected.to respond_to :doubles }
  it { is_expected.to respond_to :games }
  it { is_expected.to respond_to :games_started }
  it { is_expected.to respond_to :given_name }
  it { is_expected.to respond_to :hit_by_pitch }
  it { is_expected.to respond_to :hits }
  it { is_expected.to respond_to :home_runs }
  it { is_expected.to respond_to :ops }
  it { is_expected.to respond_to :pb }
  it { is_expected.to respond_to :player_errors }
  it { is_expected.to respond_to :position }
  it { is_expected.to respond_to :rbi }
  it { is_expected.to respond_to :runs }
  it { is_expected.to respond_to :sacrifice_flies }
  it { is_expected.to respond_to :sacrifice_hits }
  it { is_expected.to respond_to :steals }
  it { is_expected.to respond_to :struck_out }
  it { is_expected.to respond_to :surname }
  it { is_expected.to respond_to :triples }
  it { is_expected.to respond_to :walks }

  it { is_expected.to belong_to(:team) }

  it { is_expected.to validate_presence_of(:team_id) }
  it { is_expected.to validate_presence_of(:avg) }
  it { is_expected.to validate_presence_of(:at_bats) }
  it { is_expected.to validate_presence_of(:caught_stealing) }
  it { is_expected.to validate_presence_of(:doubles) }
  it { is_expected.to validate_presence_of(:at_bats) }
  it { is_expected.to validate_presence_of(:games) }
  it { is_expected.to validate_presence_of(:games_started) }
  it { is_expected.to validate_presence_of(:given_name) }
  it { is_expected.to validate_presence_of(:hit_by_pitch) }
  it { is_expected.to validate_presence_of(:hits) }
  it { is_expected.to validate_presence_of(:home_runs) }
  it { is_expected.to validate_presence_of(:ops) }
  it { is_expected.to validate_presence_of(:pb) }
  it { is_expected.to validate_presence_of(:player_errors) }
  it { is_expected.to validate_presence_of(:position) }
  it { is_expected.to validate_presence_of(:rbi) }
  it { is_expected.to validate_presence_of(:runs) }
  it { is_expected.to validate_presence_of(:sacrifice_flies) }
  it { is_expected.to validate_presence_of(:sacrifice_hits) }
  it { is_expected.to validate_presence_of(:steals) }
  it { is_expected.to validate_presence_of(:struck_out) }
  it { is_expected.to validate_presence_of(:surname) }
  it { is_expected.to validate_presence_of(:triples) }
  it { is_expected.to validate_presence_of(:walks) }

  context 'using the factory' do
    subject { FactoryGirl.build(:player) }

    it { is_expected.to validate_uniqueness_of(:surname).scoped_to([:given_name, :team_id]).case_insensitive }

    it { is_expected.to be_valid }
  end
end
