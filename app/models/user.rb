class User < ActiveRecord::Base
  has_many :authorizations

  def self.from_omniauth!(hash)
    user = create(name: hash["info"]["name"])
    user.save!
    user
  end
end
