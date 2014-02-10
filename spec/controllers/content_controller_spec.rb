require 'spec_helper'

describe ContentController do

  describe "Authorization" do

    describe "Unauthorized" do
      it "returns a 401" do
        allow(controller.current_permission).to receive(:allow?).and_return(false)
        expect {
          get :index
        }.to raise_error ApplicationController::Unauthorized
      end
    end

  end


end
