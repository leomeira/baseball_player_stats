require 'rails_helper'

describe Physical::Division, type: :model do

  subject { described_class.new  }

  it { is_expected.to respond_to :id  }
  it { is_expected.to respond_to :created_at }
  it { is_expected.to respond_to :updated_at }
  it { is_expected.to respond_to :league_id }
  it { is_expected.to respond_to :name }

  it { is_expected.to belong_to(:league) }

  it { is_expected.to validate_presence_of(:league_id) }
  it { is_expected.to validate_presence_of(:name) }

  context 'using the factory' do
    subject { FactoryGirl.build(:division) }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:league_id).case_insensitive }

    it { is_expected.to be_valid }
  end
end
