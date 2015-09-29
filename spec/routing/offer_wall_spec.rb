require 'rails_helper'

describe "routing to offer wall" do
  it "routes the rooot to the form action" do
    expect(get: '/').to route_to(controller: 'offer_wall', action: 'form')
  end
end
