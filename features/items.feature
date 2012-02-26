Feature: Item listing

  As a customer
  I want to see the list of items available for ordering
  So that I can check pricing, review availability, and place orders

  Scenario: View a list of items for sale
    Given the following items exist:
     | name | price | is_stocked |
     | meat | 1.0   | true       |
     | milk | 2.0   | false      |
    When I go to the items page
    Then I should see "meat"
    And I should see "milk"
    And I should see "$1.00"
    And I should see "$2.00"
    And I should not see "Edit"
    And I should not see "Delete"
