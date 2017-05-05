Feature: Admin booking page
  As an administrator
  In order to sett up roles for booking a facilities
  I would like to be able to manage the facilities booking settings.

  Scenario: Create booking schedule for a facility
    Given there is a facility named "Laundry Room"
    And I am on the facility index page
    And I click link "Mange time slots"
    And I select "9" from "start_time"
    And I select "5" from "time_slot"
    And I select "3" from "hours"
    And I click "Set schedule"
    Then I should see "schedule created"
    And I am on the facility index page
    And I click link "Mange time slots"
    Then I should see "09:00:00 12:00:00"
    And I should see "12:00:00 15:00:00"
    And I should see "15:00:00 18:00:00"
    And I should see "18:00:00 21:00:00"
    And I should see "21:00:00 00:00:00"
