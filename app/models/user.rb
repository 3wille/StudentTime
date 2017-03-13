class User < ActiveRecord::Base
  has_many :authorizations
  has_many :time_entries

  def self.from_omniauth!(hash)
    user = create(name: hash["info"]["name"])
    user.save!
    user
  end
end
