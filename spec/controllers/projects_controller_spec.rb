require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe 'GET index' do
    it 'returns a message when there are none available' do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)
    end
  end
end
