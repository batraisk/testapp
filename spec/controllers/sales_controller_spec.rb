require 'rails_helper'

RSpec.describe SalesController, type: :controller do

  describe "GET #index" do
    it "should be 422" do
      get :index
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns http success" do
      get :index, params: {to: '11.04.2014', from: '11.11.2017'}
      expect(response).to have_http_status(:success)
    end
  end

end
