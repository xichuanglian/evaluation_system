class PublicationInfo < ActiveRecord::Base
  belongs_to :student_profile

  def self.type_list
    ["conference", "journal"]
  end

  def self.form_list
    ["poster", "demo", "short paper", "mini-conf",
     "oral", "award", "invite to a journal"]
  end

  def to_s
    "#{self.title}/#{self.co_authors}/#{self.pub_type}/"\
    "#{self.name}/#{self.year}/#{self.form}/"\
    "#{self.remark}"
  end
end
