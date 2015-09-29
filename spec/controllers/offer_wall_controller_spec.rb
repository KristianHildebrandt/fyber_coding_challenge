require "rails_helper"

describe OfferWallController do
  render_views

  describe "form" do
    subject { get :form }

    it "renders the /offer_wall/form - template" do
      expect(subject).to render_template(:form)
    end
  end
end
