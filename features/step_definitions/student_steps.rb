Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
end

Given /I have logged in as "(.*)"$/ do |student_name|
  user = User.find_by(name: student_name)
  visit(root_path)
  fill_in 'username', :with => user.jobid
  click_button 'Login'
end

Given /"(.*)" have final submitted$/ do |student_name|
  user = User.find_by(name: student_name)
  EvaluationForm.create(student_id: user.jobid, form_submitted: true)
end

When /I am on (.*) page$/ do |page_name|
  page_name = page_name.downcase.sub(/\s+/, '_') << "_path"
  visit(self.send(page_name.to_sym))
end

When /I visit (.*) page$/ do |page_name|
  page_name = page_name.downcase.sub(/\s+/, '_') << "_path"
  visit(self.send(page_name.to_sym))
end

Then /I should see "(.*)" in text field "(.*)"$/ do |text, tf_name|
  find_field(tf_name).value.should == text
end

Then /I filled text field "(.*)" with "(.*)"$/ do |tf_name, text|
  fill_in tf_name, :with => text
end

Then /I press button "(.*)"$/ do |button|
  click_button button
end

Then /I press link "(.*)"$/ do |button|
  click_link button
end

Then /I should be on (.*) page$/ do |page_name|
  uri = URI.parse(current_url)
  page_name = page_name.downcase.sub(/\s+/, '_') << "_path"
  "#{uri.path}".should == self.send(page_name.to_sym)
end

Then /I should be on form page for student (\d+)$/ do |id|
  uri = URI.parse(current_url)
  form = EvaluationForm.find_by(student_id: id)
  "#{uri.path}".should == form_path(form)
end