Feature: TFA News
  As an author,
  I want to create a news article
  So that a site visitor can read the latest developments from Teach for America

  @api @tfa @tfa-content @tfa-news
  Scenario: Create a news node and view it
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/news"
    Then I should see the heading "Create News Post"
    And I fill in the following:
      | Title       | A Typical News Post |
      | Body        | Integer vitae lobortis dolor, non placerat lectus. |
    And I drag the image atom "placeholder.png" to "edit-field-scald-image-und-0-sid"
    And I attach the file "placeholder.png" to "files[field_attachment_und_0]"
    When I press "Save"
    Then I should see "A Typical News Post"
    Then I should see "Integer vitae lobortis dolor, non placerat lectus."
