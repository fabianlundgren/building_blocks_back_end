Feature: Show workorder
  As an  janitor
  In order to see my work orders
  I would like to see work orders on an janitor index page

  Background:
   Given the following work orders messages exist
    | title   | message        | urgent | location  |
    | Fabian  | Pants are gone | true   | Västervik |

  Scenario: I create and send a work order
    Given I am on the work orders index page
    Then I should see "Work order"
    And I should see "Fabian"
    And I should see "Pants are gone"
    And I should see "Västervik"
  
