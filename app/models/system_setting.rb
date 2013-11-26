class SystemSetting < ActiveRecord::Base
  serialize :value, JSON
end
