Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  @messenger = StringIO.new
  game = Codebreaker::Game.new(@messenger)
  game.start('1234')
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(@messenger.string.split("\n")).to include(message)
end

Given(/^the secret code is "([^"]*)"$/) do |code|
  @messenger = StringIO.new
  @game = Codebreaker::Game.new(@messenger)
  @game.start(code)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess) || @messenger.puts('👋') 
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  expect(@messenger.string.split("\n")).to include(mark)
end