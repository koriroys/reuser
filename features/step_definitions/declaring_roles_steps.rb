Given /^the following class:$/ do |class_code|
  eval class_code, binding
end

When /^I access "([^"]*)"$/ do |access_code|
  @expected = eval access_code
end

Then /^I should have an array of (\d+ ReUser::Roles?)$/ do |role_count|
  @expected.should have(role_count).items
  @expected.all? do |item|
    item.should be_instance_of ReUser::Role
  end
end

Transform /(\d+) ReUser::Roles+/ do |role_count|
  Integer(role_count)
end
