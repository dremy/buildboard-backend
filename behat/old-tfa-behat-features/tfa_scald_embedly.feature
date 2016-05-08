Feature: TFA Embed.ly
  As an author
  I want to embed rich media from another provider
  so that I can author a richer experience for the reader and more strongly convey TFA's feelings regarding a subject.

  @api @javascript @tfa @tfa-scald
  Scenario: Add a third-party video to the site.
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/article"
    Then I should see the heading "Create Article"
    And I click "embed"
    And I fill in "Media URL" with "https://www.youtube.com/watch?v=tpl-IkGg3tI"
    And I press "Continue"
    And I press "Finish"
    And I select "Plain text" from "Text format"
    And I fill in the following:
      | Title       | A Typical Page   |
      | Body        | I love puppies!  |
    And I select "Full HTML" from "Text format"
    And I "open" the scald browser
    And I click "Insert" in the "Scald Library" region
    And I "close" the scald browser
    When I press "Save"
    Then I should see "A Typical Page"
    And I should see "Funniest Cute Puppies Compilation"
    And I should see "I love puppies!"
