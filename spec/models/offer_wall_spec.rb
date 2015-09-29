require "rails_helper"

describe OfferWall do
  %i(uid pub0 page).each do |attr|
    it { is_expected.to respond_to(attr) }
  end

  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_numericality_of(:page).only_integer }
  it { should allow_value("", nil).for(:page) }
end
