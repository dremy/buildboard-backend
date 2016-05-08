Feature: TFA organization
  The TFA organization bundle should behave per specification.

  @api @tfa @tfa-organization @tfa-pathauto
  Scenario: Ensure the Organization url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_organization_pattern" field should contain "organizations/[node:title]"

  @api @tfa @tfa-organization @tfa-bundle-settings
  Scenario: Verify Organization node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/organization"

    # Check the status of checkboxes.
    Then the "name" field should contain "Organization"
    And the "title_label" field should contain "Name"
    Then the "node_options[status]" checkbox should be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked
 
   @api @tfa @tfa-organization @tfa-content 
   Scenario: Create an Organization node and view it as role "organization editor"
    Given I am logged in as a user with the "organization editor" role
    When I visit "/node/add/organization"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-ph-field-partner-type" element
    Then I should see an "#edit-field-ph-field-partner-info" element
    Then I should see an "#edit-field-ph-field-org-type" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-organization-type" element
    Then I should see an "#edit-field-involvement" element
    Then I should see an "#edit-field-address" element
    Then I should see an "#edit-field-telephone" element
    Then I should see an "#edit-field-email" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-facebook" element
    Then I should see an "#edit-field-twitter" element
    Then I should see an "#edit-field-temp-tid" element

    # Create an organization. 
    Then I should see the heading "Create Organization"
    And I fill in the following:
      | Name *      | A Typical Organization Page [autotest] |
      | Teaser        | Aliquam placerat mauris sed pharetra eleifend. |
      | Description        | Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra. |
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
 
    When I press "Save"

    # Check output of organization.
    Then I should see "A Typical Organization Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra."
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-organization @tfa-content
  Scenario: Create an organization node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/organization"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-ph-field-partner-type" element
    Then I should see an "#edit-field-ph-field-partner-info" element
    Then I should see an "#edit-field-ph-field-org-type" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-organization-type" element
    Then I should see an "#edit-field-involvement" element
    Then I should see an "#edit-field-address" element
    Then I should see an "#edit-field-telephone" element
    Then I should see an "#edit-field-email" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-facebook" element
    Then I should see an "#edit-field-twitter" element
    Then I should see an "#edit-field-temp-tid" element

    # Create an organization. 
    Then I should see the heading "Create Organization"
    And I fill in the following:
      | Name *      | A Typical Organization Page [autotest] |
      | Teaser        | Aliquam placerat mauris sed pharetra eleifend. |
      | Description        | Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra. |
 
    When I press "Save"

    # Check output of organization.
    Then I should see "A Typical Organization Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra."
    And I should not see the link "Moderate"
