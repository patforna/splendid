Feature: New User Registration
  In order to use the system
  As a user
  I want to be able to register
  
Scenario: Successful registration
  Given I am on the new user page
  And I fill in "user_username" with "patforna"
  And I fill in "user_userkey" with "foobar"
  When I press "register"
  Then a user with username "patforna" and userkey "foobar" should have been created 



