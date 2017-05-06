require 'rails_helper'

describe Physical::Team, type: :model do

  subject { described_class.new  }

  it { is_expected.to respond_to :id  }
  it { is_expected.to respond_to :created_at }
  it { is_expected.to respond_to :updated_at }
  it { is_expected.to respond_to :division_id }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :city }

  it { is_expected.to belong_to(:division) }

  it { is_expected.to validate_presence_of(:division_id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:city) }

  context 'using the factory' do
    subject { FactoryGirl.build(:team) }

    it { is_expected.to validate_uniqueness_of(:name) }

    it { is_expected.to be_valid }
  end
end
