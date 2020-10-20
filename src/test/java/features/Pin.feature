Feature: Pin change
  As soon as the bank issues new cards to the customers, they are supplied with a personal identification number (PIN)
  that is randomly generated by the system

  In order to be able to change it to something they can easily remember, customers with new bank
  cards need to be able to change their PIN using the ATM


  Background:
    Given New credit card issued by the bank with pin 1234
    And Inserting card to ATM
    And  Move on "pin enter" section


  Scenario: check that login successful
    When Login with pin 1234
    Then Get massage "You've  been successfully logged"

  Scenario: check successful pin change
    When Login with pin 1234
    And Move on "pin change" section
    When Set the pin to 9999
    And  Click apply button
    Then Get massage "Your Pin Successfully changed"
    And Check pin is 9999

  Scenario Outline: check values that can't be entered for PIN
    When Login with pin 1234
    And Move on "pin change" section
    When Set the pin to <newPin>
    And  Click apply button
    Then Get massage "<errorText>"
    And Check pin is 1234

    Examples:
      | newPin | errorText                                                             |
      | 1234   | new pin must be different from original that you are trying to change |
      | 111    | Pin must be four characters long                                      |
      | 11111  | Pin must be four characters long                                      |


  Scenario Outline: check that can't change pin more that twice a day
    When Login with pin <expectedPin>
    And Move on "pin change" section
    When Set the pin to <newPin>
    And  Click apply button
    Then Get massage "<getMassage>"

    Examples:
      | expectedPin | newPin | getMassage                                   |
      | 1234        | 7777   | Your Pin Successfully changed                |
      | 7777        | 6666   | Your Pin Successfully changed                |
      | 6666        | 5555   | Can't change pin more ofter that twice a day |


  Scenario Outline: check that account lock after three times wrong pin enter attempts
    When Login with pin <pins>
    Then Get massage "<errorText>"
    Examples:
      | pins | errorText                                                    |
      | 1111 | wrong pin number provided                                    |
      | 2222 | wrong pin number provided                                    |
      | 3333 | wrong pin number provided                                    |
      | 4444 | your account has been blocked due to too many wrong attempts |




