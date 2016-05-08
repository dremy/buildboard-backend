Feature: Workflow
  As an author,
  I want to ensure all nodes go through a workflow
  So that end users see clean, professional copy

  @api @tfa @tfa-content
  Scenario: Publish any content type
    Given I am logged in as a user with the "content creator" role
    And the "Submit changes for approval" button should be available on all content types but the following:
      | Content type  |

  @api @tfa @tfa-content
  Scenario: Publish any content type
    Given I am logged in as a user with the "system administrator" role
    And the "Publish" button should be available on all content types but the following:
      | Content type  |
