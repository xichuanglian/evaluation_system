class User < ActiveRecord::Base
  def self.verify(username, password)
    return self.find_by jobid: username
  end
end
