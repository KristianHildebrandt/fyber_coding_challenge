class OfferWall
  include ActiveModel::Model

  attr_accessor :uid, :pub0, :page

  validates_presence_of :uid
  validates_numericality_of :page, only_integer: true, allow_blank: true
end
