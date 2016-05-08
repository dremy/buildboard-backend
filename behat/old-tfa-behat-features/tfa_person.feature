Feature: Content Type: Person
  As an author
  I want to publish a bio about a person
  So that a site visitor can read about how that person has made a positive impact by working with TFA.

  @api @tfa @tfa-content @tfa-person
  Scenario: Create a Person node
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/person"
    Then I should see the heading "Create Person"
    And I fill in the following:
      | Name       | Stephanie Crisp-Diaz |
      | Short Bio  | Let me share my experiences |
    And I add a Bio of "In my first year in the classroom, a group of students and I founded the College Readiness Club, aimed at exposing my students to the resources and opportunities that could make college real for them."
    And I press "Save"
    Then I should see "Stephanie Crisp-Diaz"
    Then I should see "In my first year in the classroom"
