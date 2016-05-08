Feature: TFA Article
  The TFA Article bundle should behave per specification.

  @api @tfa @tfa-article @tfa-pathauto
  Scenario: Ensure the article url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_blog_pattern" field should contain "top-stories/[node:field_section]/[node:title]"

  @api @tfa @tfa-article @tfa-bundle-settings
  Scenario: Verify article node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/blog"

    # Check the stated of checkboxes.
    Then the "name" field should contain "Article"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should not be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked

  @api @tfa @tfa-article @tfa-content
  Scenario: Create an article node and view it as role "post editor"
    Given I am logged in as a user with the "post editor" role
    When I visit "/node/add/blog"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-date-und-0-value-datepicker-popup-0" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element
    Then I should see an "#edit-field-author-und-0-target-id" element
    Then I should see an "#edit-field-tags-und" element
    Then I should see an "#edit-field-section-und" element

    # Create an article. 
    Then I should see the heading "Create Article"
    And I fill in the following:
      | Title       | A Typical Article Page [autotest] |
      | Body        | Aliquam placerat mauris sed pharetra eleifend. |
      | Section     | 2580 |
    
    And I fill in "field_author[und][0][target_id]" with "Test Person" 
    And I fill in "field_tags[und]" with "consequences, 10th grade"
    And I attach the file "placeholder.png" to "files[field_attachment_und_0]"
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
    When I press "Save"

    # Check output of article.
    Then I should see "A Typical Article Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should see an ".field-name-field-page-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-article @tfa-content
  Scenario: Create an article node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/blog"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-date-und-0-value-datepicker-popup-0" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element
    Then I should see an "#edit-field-author-und-0-target-id" element
    Then I should see an "#edit-field-tags-und" element
    Then I should see an "#edit-field-section-und" element

    # Create an article. 
    Then I should see the heading "Create Article"
    And I fill in the following:
      | Title *       | A Typical Article Page Admin [autotest] |
      | Body        | Aliquam placerat mauris sed pharetra eleifend. |
      | Section     | 2580 |  
  
    And I fill in "field_author[und][0][target_id]" with "Test Person" 
    And I fill in "field_tags[und]" with "consequences, 10th grade"
    And I attach the file "placeholder.png" to "files[field_attachment_und_0]"
    When I press "Save"

    # Check output of article.
    Then I should see "A Typical Article Page Admin [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    Then I should see the link "Moderate"
    When I click "Moderate"
    Then I should see "This is the current revision. The current state is Draft."
    When I select "published" from "state"
    And I press "Apply"
    And I should see "This is the published revision."
