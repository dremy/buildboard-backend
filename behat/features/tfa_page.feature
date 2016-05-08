Feature: TFA page
  The TFA page bundle should behave per specification.

  @api @tfa @tfa-page @tfa-pathauto
  Scenario: Ensure the page url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_page_pattern" field should contain "[node:title]"

  @api @tfa @tfa-page @tfa-bundle-settings
  Scenario: Verify page node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/page"

    # Check the stated of checkboxes.
    Then the "name" field should contain "page"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should not be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked

 #  @api @tfa @tfa-page @tfa-content
 #  Scenario: Create a page node and view it as role "post editor"
 #    Given I am logged in as a user with the "post editor" role
 #    When I visit "/node/add/page"
 #    
 #    # Check for expected form elements.
 #    Then I should see an "#edit-title" element
 #    Then I should see an "#edit-body" element
 #    Then I should see an "#edit-field-governance" element
 #
 #    # Create a page. 
 #    Then I should see the heading "Create Page"
 #    And I fill in the following:
 #      | Title *       | A Typical Page [autotest] |
 #      | Body        | Aliquam placerat mauris sed pharetra eleifend. |
 #  
 #    When I press "Save"
 #
 #    # Check output of page.
 #    Then I should see "A Typical Page [autotest]"
 #    Then I should see "Aliquam placerat mauris sed pharetra eleifend."

  @api @tfa @tfa-page @tfa-content
  Scenario: Create a page node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/page"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-governance" element

    # Create a page. 
    Then I should see the heading "Create Page"
    And I fill in the following:
      | Title *       | A Typical Page [autotest] |
      | Body        | Aliquam placerat mauris sed pharetra eleifend. |
  
    When I press "Save"

    # Check output of page.
    Then I should see "A Typical Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    Then I should see the link "Moderate"
    When I click "Moderate"
    Then I should see "This is the current revision. The current state is Draft."
    When I select "published" from "state"
    And I press "Apply"
    And I should see "This is the published revision."
