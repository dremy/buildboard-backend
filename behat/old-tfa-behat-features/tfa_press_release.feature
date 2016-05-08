Feature: TFA Press Release
  As an author,
  I want to create a press release
  So that a site visitor can read about a press release from Teach for America

  @api @tfa @tfa-content @tfa-press-release
  Scenario: Create a press release node and view it
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/press-release"
    Then I should see the heading "Create Press Release"
    And I fill in the following:
      | Title       | A Typical Press Release |
      | City        | Alexandria |
      | Body        | Nam nibh urna, porta vitae massa vel, semper facilisis velit. |
    And I attach the file "placeholder.pdf" to "files[field_attachment_und_0]"
    And I select "Virginia" from "State"
    When I press "Save"
    Then I should see "A Typical Press Release"
    Then I should see "Nam nibh urna, porta vitae massa vel, semper facilisis velit."
    Then I should see "Alexandria"
    Then I should see "VA"
    Then I should see "About Teach For America"

