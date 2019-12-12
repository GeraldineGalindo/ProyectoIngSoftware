Given("visito la pagina principal") do
    visit '/'
  end

  When("lleno en el campo "nombre" el nombre "valor"") do |nombre, value|
    fill_in(nombre, :with => value)
  end

  Then("visito otra pagina") do
    visit '/nombrar'
  end

  Then("debería ver un mensaje Bienvenido {string}") do |message|
    last_response.body.should =~ /#{message}/m
  end
