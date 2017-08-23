Feature: Show help request for admin
  As an admin
  In order to see tenants help request messages
  I would like to able to see  tenants message on a show page

  Background:
  Given the following users exist
    | email           | password  | password_confirmation | role  |
    | nubbe@nubbe.com | 12345678  | 12345678              | admin |
  And the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |
   Given the following help request messages exist
    | title   | message           |
    | Johan   | Pants are burning |
    | Casper  | Stuck in toilet   |

  Scenario: Call for help messages are displayed
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Given I am on the show help request page
    Then I should see "Help request messages"
    And I should see "Johan"
    And I should see "Pants are burning"
    And I should see "Casper"
    Then I should see "Stuck in toilet"
