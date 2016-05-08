Feature: TFA Fact
  As an author,
  I want to create a fact
  So that a site visitor can read about a fact from Teach for America

  @api @tfa @tfa-content @tfa-fact
  Scenario: Create a fact node and view it
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/fact"
    Then I should see the heading "Create Fact"
    And I fill in the following:
      | Title       | A Crazy Event |
      | Body        | Fusce elit mi, feugiat vitae libero nec, malesuada semper nibh. |
      | Source      | http://en.wikipedia.org/wiki/Dalhousie_District                 |
      | Keywords    | FactKeyword1 FactKeyword2 FactKeyword3                          |
    And I drag the image atom "placeholder.png" to "edit-field-scald-image-und-0-sid" 
    When I press "Save"
    Then I should see "A Crazy Event"
    Then I should see "Fusce elit mi, feugiat vitae libero nec, malesuada semper nibh."
    Then I should see "http://en.wikipedia.org/wiki/Dalhousie_District"
    