Feature: TFA department
  The TFA department bundle should behave per specification.

  @api @tfa @tfa-department @tfa-pathauto
  Scenario: Ensnure the department url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_departments_pattern" field should contain "no-display/[node:title]"

  @api @tfa @tfa-department @tfa-bundle-settings
  Scenario: Verify department node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/departments"

    # Check the stated of checkboxes.
    Then the "name" field should contain "Departments"
    And the "title_label" field should contain "Name"
    Then the "node_options[status]" checkbox should not be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked

  @api @tfa @tfa-department @tfa-content
  Scenario: Create a department node and view it as role "super editor"
    Given I am logged in as a user with the "super editor" role
    When I visit "/node/add/departments"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-description" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-address" element
    Then I should see an "#edit-field-telephone" element
    Then I should see an "#edit-field-fax" element
    Then I should see an "#edit-field-email" element
    
    # Create a department. 
    Then I should see the heading "Create Departments"
    And I fill in the following:
      | Name *       | A Typical department [autotest] |
      | Description *       | Aliquam placerat mauris sed pharetra eleifend." |
    
    When I press "Save"

    # Check output of department.
    Then I should see "A Typical department [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see the link "Moderate"
  
  @api @tfa @tfa-department @tfa-content
  Scenario: Create a department node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/departments"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-description" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-address" element
    Then I should see an "#edit-field-telephone" element
    Then I should see an "#edit-field-fax" element
    Then I should see an "#edit-field-email" element
    
    # Create a department. 
    Then I should see the heading "Create Departments"
    And I fill in the following:
      | Name *       | A Typical department [autotest] |
      | Description *       | Aliquam placerat mauris sed pharetra eleifend." |
    
    When I press "Save"

    # Check output of department.
    Then I should see "A Typical department [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    Then I should see the link "Moderate"
    When I click "Moderate"
    Then I should see "This is the current revision. The current state is Draft."
    When I select "published" from "state"
    And I press "Apply"
    And I should see "This is the published revision."
