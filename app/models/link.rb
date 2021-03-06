class Link < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true, :inverse_of => :links

  LINK_TYPES = %w(website github facebook twitter linkedin gplus pinterest)
  LINK_TYPE_FA_LOOKUP = Hash[LINK_TYPES.zip(%w(fa-external-link-square fa-github fa-facebook fa-twitter fa-linkedin fa-google-plus fa-pinterest))]

  validates :url, :presence => true
  validates :link_type, :inclusion => { :in => LINK_TYPES }, :presence => true

  def link_type_enum
    LINK_TYPES
  end
end
