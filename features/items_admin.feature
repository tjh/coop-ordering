Feature: Item management

  As an administrator
  I want to manage the list of items available for ordering
  So that the item date is accurate and complete

  Scenario: View a list of items for sale
    Given I am logged in as an admin
    And the following items exist:
     | name | price | is_stocked |
     | meat | 1.0   | true       |
     | milk | 2.0   | false      |
    When I go to the items page
    Then I should see "meat"
    And I should see "milk"
    And I should see "$1.00"
    And I should see "$2.00"
    And I should see "Edit"
    And I should see "Delete"
