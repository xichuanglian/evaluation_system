class User < ActiveRecord::Base
  def self.verify(username, password)
    return self.first
  end
end
