require 'rails_helper'

describe Physical::Season, type: :model do

  subject { described_class.new  }

  it { is_expected.to respond_to :id  }
  it { is_expected.to respond_to :created_at }
  it { is_expected.to respond_to :updated_at }
  it { is_expected.to respond_to :year }

  it { is_expected.to validate_presence_of(:year) }

  context 'using the factory' do
    subject { FactoryGirl.build(:season) }

    it { is_expected.to validate_uniqueness_of(:year).case_insensitive }

    it { is_expected.to be_valid }
  end
end
