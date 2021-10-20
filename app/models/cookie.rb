class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true
  
  validates :storage, presence: true

  attr_accessor :quantity

  def ready?
    true
  end
end
