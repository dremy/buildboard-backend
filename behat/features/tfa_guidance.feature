Feature: TFA guidance
  The TFA guidance bundle should behave per specification.

  @api @tfa @tfa-guidance @tfa-pathauto
  Scenario: Ensure the Guidance url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_guidance_pattern" field should contain "no-display/[node:title]"

  @api @tfa @tfa-guidance @tfa-bundle-settings
  Scenario: Verify Guidance node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/guidance"

    # Check the status of checkboxes.
    Then the "name" field should contain "Guidance"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should not be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked

   @api @tfa @tfa-guidance @tfa-content 
   Scenario: Create a Guidance node and view it as role "guidance editor"
     Given I am logged in as a user with the "guidance editor" role
     When I visit "/node/add/guidance"
 
    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-cta-und-0-title" element
    Then I should see an "#edit-field-cta-und-0-url" element
 
    # Create an guidance. 
    Then I should see the heading "Create Guidance"
    And I fill in the following:
      | Title *      | A Typical Guidance Page [autotest] |
      | Teaser        | Aliquam placerat mauris sed pharetra eleifend. |

    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
  
    When I press "Save"
 
    # Check output of guidance.
    Then I should see "A Typical guidance Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-guidance @tfa-content
  Scenario: Create a guidance node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/guidance"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-cta-und-0-title" element
    Then I should see an "#edit-field-cta-und-0-url" element

    # Create an guidance. 
    Then I should see the heading "Create Guidance"
    And I fill in the following:
      | Title *      | A Typical Guidance Page [autotest] |
      | Teaser        | Aliquam placerat mauris sed pharetra eleifend. |
  
    When I press "Save"

    # Check output of guidance.
    Then I should see "A Typical Guidance Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    Then I should see the link "Moderate"
    When I click "Moderate"
    Then I should see "This is the current revision. The current state is Draft."
    When I select "published" from "state"
    And I press "Apply"
    And I should see "This is the published revision."
