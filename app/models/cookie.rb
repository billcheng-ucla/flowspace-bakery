class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true
  
  validates :storage, presence: true

  def ready?
    Time.now - created_at > BAKING_TIME["cookie"]
  end
end
