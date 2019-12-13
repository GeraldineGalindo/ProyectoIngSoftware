Feature:
    Como jugador
    Quiero establecer mi posición inicial y las instrucciones
    Para poder iniciar el movimiento del robot

Scenario: 
    Given entro al juego
    When lleno el campo "ejex" con el valor "2"
    And lleno el campo "ejey" con el valor "3"
    And lleno el campo "orientation" con el valor "N"
    And lleno el campo "instruccions" con el valor "DAI"
    Then espero que se registre "[3,3,"N"]"

Scenario:
    Given entro al juego
    When hago click en el botón "Establecer"
    Espero que no se muestre nada en pantalla

Scenario:
    Given entro al juego
    When llemo el campo "ejex" con el valor "-1"
    Then espero que se muestre un error "No se aceptan negativos"



