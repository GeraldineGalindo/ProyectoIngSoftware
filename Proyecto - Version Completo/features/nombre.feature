Feature: 
    Como jugador
    Quiero ver un mensaje de bienvenida como Bienvenido Diego cuando ingrese mi nombre
    Para sentirme identificado
Scenario:
    Given visito la pagina principal
    When ingreso "Diego" en el campo "nombre"
    Then visito otra pagina
    And debería ver un mensaje "Bienvenido Diego"