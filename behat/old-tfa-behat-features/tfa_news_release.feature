Feature: TFA News Release
  As an author,
  I want to create a news release
  So that a site visitor can read about a news release from Teach for America

  @api @tfa @tfa-content @tfa-news-release
  Scenario: Create a news release node and view it
    Given I am logged in as a user with the "communications editor" role
    When I visit "/node/add/news-release"
    Then I should see the heading "Create News Release"
    And I fill in the following:
      | Title               | A Typical News Release |
      | City                | Alexandria |
      | Body                | Nam nibh urna, porta vitae massa vel, semper facilisis velit. |
      | Date                | 05/21/2015 |
      | Contact Information | Rachel Tannenbaum |
      | Subhead             | Nam nibh urna, porta vitae massa vel, semper facilisis velit. |
    And I attach the file "placeholder.pdf" to "files[field_attachment_und_0]"
    And I select "Virginia" from "State"
    When I press "Save"
    Then I should see "A Typical News Release"
    Then I should see "Nam nibh urna, porta vitae massa vel, semper facilisis velit."
    Then I should see "Alexandria"
    Then I should see "Va.,"
    Then I should see "About Teach For America"