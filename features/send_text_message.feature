Feature: Send text message
  In order to communicate with friends
  As a user
  I want to send test messages
  
  Scenario: Send using phone number
    Given I am on the send message page
    And I fill in "message_recipient" with "+447807922168"
    And I fill in "message_message" with "Hello World"
    When I press "send"
    # Then the message should have been delivered
    And I am on the send message page
    
  
  
  

  
