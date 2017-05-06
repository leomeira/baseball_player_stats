require 'rails_helper'

describe StatsController, type: :controller do
  shared_examples 'returns correct data' do |num_records, num_displayed, num_total|
    subject { (JSON.parse response.body) }

    it 'returns records' do
      expect(subject['aaData'].length).to eq(num_records)
    end

    it 'returns number of displayed records' do
      expect(subject['iTotalDisplayRecords']).to eq(num_displayed)
    end

    it 'returns total number of records' do
      expect(subject['iTotalRecords']).to eq(num_total)
    end
  end

  describe 'GET index' do
    let(:params) do
      {
        format: :json,
        start: 0,
        length: 1,
        order: {
          '0': {
            column: 2,
            dir: 'desc'
          }
        }
      }
    end

    context 'Zero players' do
      before do
        get :index, params
      end

      it_behaves_like 'returns correct data', 0, 0, 0
    end

    context 'One player' do
      before do
        FactoryGirl.create(:player, :with_stats)

        get :index, params
      end

      it_behaves_like 'returns correct data', 1, 1, 1
    end

    context 'Two players' do
      before do
        FactoryGirl.create_list(:player, 2, :with_stats)

        get :index, params
      end

      it_behaves_like 'returns correct data', 1, 2, 2
    end
  end
end
