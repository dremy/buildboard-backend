Feature: TFA Blog
  As an author,
  I want to create a blog post
  So that a site visitor can read about an update from Teach for America

  @api @tfa @tfa-content @tfa-blog
  Scenario: Create a blog post node and view it
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/blog"
    Then I should see the heading "Create Blog Post"
    And I fill in the following:
      | Title       | A Typical Blog Post |
      | Body        | Fusce elit mi, feugiat vitae libero nec, malesuada semper nibh. |
    And I drag the image atom "placeholder.png" to "edit-field-scald-image-und-0-sid"
    And I attach the file "placeholder.png" to "files[field_attachment_und_0]"
    When I press "Save"
    Then I should see "A Typical Blog Post"
    Then I should see "Fusce elit mi, feugiat vitae libero nec, malesuada semper nibh."

