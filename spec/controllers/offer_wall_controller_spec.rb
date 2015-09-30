require "rails_helper"

describe OfferWallController do
  describe "form" do
    let(:new_form_object) { double }

    before :each do
      allow(OfferWall).to receive(:new).and_return(new_form_object)
      get :form
    end

    it "renders the /offer_wall/form - template" do
      expect(response).to render_template(:form)
    end

    it "assigns a new form object" do
      expect(assigns(:form)).to eq(new_form_object)
    end
  end

  describe "list" do
    context "search valid" do
      let(:params) {{ offer_wall: { "page" => "", "pub0" => "", "uid" => "player1"}} }
      let(:api_options) { OfferWallController::OFFERWALL_OPTIONS.merge(params[:offer_wall]) }
      let(:api_response) { double }

      before(:each) do
        allow_any_instance_of(OfferWall).to receive(:valid?).and_return(true)
        allow(Fyber::Client).to receive(:offer_wall).with(api_options).and_return(api_response)

        post :list, params
      end

      it "renders the list-template" do
        expect(response).to render_template(:list)
      end

      it "gets the offers from the api" do
        expect(assigns(:offers)).to eq(api_response)
      end
    end

    context "search invalid" do
      it "re-renders the form template" do
        allow_any_instance_of(OfferWall).to receive(:valid?).and_return(false)
        post :list

        expect(response).to render_template(:form)
      end
    end
  end
end
