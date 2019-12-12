Given("visito la pagina principal") do
  visit '/'
end

Then("debería ver un mensaje {string}") do |message|
  last_response.body.should =~ /#{message}/m
end