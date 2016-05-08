Feature: TFA Media Coverage
  As an author,
  I want to be able to post a media coverage (link to another media outlet covering TFA)
  So that a site visitor can read how the media covers Teach for America.

  @api @tfa @tfa-content @tfa-media-coverage
  Scenario: Create a media coverage node and view it
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/media-coverage"
    Then I should see the heading "Create Media Coverage"
    And I fill in the following:
      | Administrative title | An example of Press |
      | Title                | Teach for America emphasizes quality |
      | URL                  | http://members.jacksonville.com/opinion/editorials/2014-07-31/story/teach-america-emphasizes-quality |
      | Date                 | 08/01/2014 |
    When I press "Save"
    Then I should see "Teach for America emphasizes quality"
    Then I should see "August 1, 2014"
    Then the link "Teach for America emphasizes quality" in the "Main Content" region should go to "http://members.jacksonville.com/opinion/editorials/2014-07-31/story/teach-america-emphasizes-quality"
    And the link "Teach for America emphasizes quality" should open in a new window

  @api @tfa @tfa-content @tfa-media-coverage
  Scenario: View a list of recent media coverage in order of newest to oldest
    Given "media_coverage" nodes:
      | title                | link field      | link title | link url | field_published_date | status |
      | Example media old    | field_media_url | Generic title | http://google.com  | 2013-08-01 00:00:00  | 1 |
      | Example media new    | field_media_url | Generic title | http://example.com | 2014-11-20 00:00:00  | 1 |
    When I visit "/media-coverage/new"
    And I should not see "Example media old"
    Then I should see "Generic title"
    Then the link "Generic title" in the "Main Content" region should go to "http://example.com"
    And the link "Generic title" should open in a new window
