Feature: TFA Embed.ly
  As an author
  I want to embed rich media from another provider
  so that I can author a richer experience for the reader and more strongly convey TFA's feelings regarding a subject.

  Background:
    Given I am logged in as a user with the "system administrator" role
    Given "image" atoms:
      | title          | scald_thumbnail |
      | Placeholder    | placeholder.png |

  @api @tfa @tfa-scald
  Scenario: View a list of Atoms.
    When I visit "/admin/content/atoms"
    And I click "Scald ID"
    And I click "Scald ID"
    Then I should see the text "Placeholder"

  @api @tfa @tfa-scald @javascript
  Scenario: See usage of Atoms.
    When I visit "/node/add/article"
    And I fill in "Example content" for "title"
    And I select "Plain text" from "Text format"
    And I fill in "Example text" for "Body"
    And I select "Full HTML" from "Text format"
    And I "open" the scald browser
    And I click "Insert" in the "Scald Library" region
    And I "close" the scald browser
    When I press "Save"
    Then I should see "Placeholder"
    When I visit "/admin/content/atoms"
    And I click "Scald ID"
    And I click "Scald ID"
    And I visit the "View" link in the "Scald Admin" region
    Then I should see "Placeholder"
    And I click "Usage" in the "Main tabs" region
    Then I should see "Example content"
    Then I should not see "No such item"
