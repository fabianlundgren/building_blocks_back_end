Feature: Show buildings
  As an  admin
  In order to see my buildings
  I would like to see my buildings on a showpage

  Background:
   Given the following users exist
    | email           | password  | password_confirmation |
    | nubbe@nubbe.com | 12345678  | 12345678              |
   Given the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |
    | Smallhouse  | smallstreet |

  Scenario: I log in to choose a building
    Given I am logged in as "nubbe@nubbe.com"
    Then I should see "bighouse"
    And I should see "smallhouse"
    Then I click "smallhouse"
    And I should see "smallhouse"
