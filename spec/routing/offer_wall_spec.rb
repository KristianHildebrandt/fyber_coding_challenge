require 'rails_helper'

describe "routing to offer wall" do
  it "routes the root to the form action" do
    expect(get: '/').to route_to(controller: 'offer_wall', action: 'form')
  end

  it "routes the /list route to the list action" do
    expect(post: '/list').to route_to(controller: 'offer_wall', action: 'list')
  end
end
