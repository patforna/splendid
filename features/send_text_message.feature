Feature: Send text message
  In order to communicate with friends
  As a user
  I want to send test messages
  
  Scenario: Send using phone number
    Given I am on the send message page
    Given I fill in the phone number
    Given I fill in the message
    When I press send
    Then the message should be sent to the recipient
    
  
  
  

  
