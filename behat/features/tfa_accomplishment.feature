Feature: TFA Accomplishment
  The TFA Accomplishment bundle should behave per specification.

  @api @tfa @tfa-accomplishment @tfa-pathauto
  Scenario: Ensnure the accomplishment url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_accomplishments_pattern" field should contain "[node:field_accomplishment_type]/[node:title]"

  @api @tfa @tfa-accomplishment @tfa-bundle-settings
  Scenario: Verify accomplishment node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/accomplishments"

    # Check the stated of checkboxes.
    Then the "name" field should contain "Accomplishment"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should not be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked

  @api @tfa @tfa-accomplishment @tfa-content
  Scenario: Create an accomplishment node and view it as role "accomplishment editor"
    Given I am logged in as a user with the "accomplishment editor" role
    When I visit "/node/add/accomplishments"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-accomplishment-type" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-application-period" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-email" element

    # Create an accomplishment. 
    Then I should see the heading "Create Accomplishment"
    And I fill in the following:
      | Title *       | A Typical accomplishment [autotest] |
      | Teaser       | Aliquam placerat maurisTeaser
      | Description        | Aliquam placerat mauris sed pharetra eleifend. |
    And I select "2574" from "field_accomplishment_type[und]"
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
    
    When I press "Save"

    # Check output of accomplishment.
    Then I should see "A Typical accomplishment [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see the link "Moderate"

  @api @tfa @tfa-accomplishment @tfa-content
  Scenario: Create a accomplishment node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/accomplishments"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-accomplishment-type" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-application-period" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-email" element

    # Create an accomplishment. 
    Then I should see the heading "Create Accomplishment"
    And I fill in the following:
      | Title *       | A Typical accomplishment [autotest] |
      | Teaser       | Aliquam placerat maurisTeaser
      | Description        | Aliquam placerat mauris sed pharetra eleifend. |
    And I select "2574" from "field_accomplishment_type[und]"
    
    When I press "Save"

    # Check output of accomplishment.
    Then I should see "A Typical accomplishment [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see the link "Moderate"
