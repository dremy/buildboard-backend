Feature: TFA Couple
  The TFA Couple bundle should behave per specification.

  @api @tfa @tfa-couple @tfa-pathauto
  Scenario: Ensnure the couple url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_couple_pattern" field should contain ""

  @api @tfa @tfa-couple @tfa-bundle-settings
  Scenario: Verify couple node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/couple"

    # Check the state of checkboxes.
    Then the "name" field should contain "Couple"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should be checked
    Then the "node_options[promote]" checkbox should be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should not be checked
    Then the "node_submitted" checkbox should be checked

  @api @tfa @tfa-couple @tfa-content
  Scenario: Create a couple node and view it as role "person editor"
    Given I am logged in as a user with the "person editor" role
    When I visit "/node/add/couple"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-body-und-0-summary" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-donor" element
    Then I should see an "#edit-field-donor-und-0-field-donor-category" element
    Then I should see an "#edit-field-donor-und-0-field-donor-year-und-0-value" element
    Then I should see an "#edit-field-donor-und-0-field-donor-in-honor-of" element

    # Create a couple. 
    Then I should see the heading "Create Couple"
    And I fill in the following:
      | Title *       | A Typical couple [autotest] |
      | Summary       | Aliquam placerat maurisTeaser
      | Body        | Aliquam placerat mauris sed pharetra eleifend. |
    
    When I press "Save"

    # Check output of couple.
    Then I should see "A Typical couple [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see the link "Moderate"

  @api @tfa @tfa-couple @tfa-content
  Scenario: Create a couple node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/couple"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-body-und-0-summary" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-donor" element
    Then I should see an "#edit-field-donor-und-0-field-donor-category" element
    Then I should see an "#edit-field-donor-und-0-field-donor-year-und-0-value" element
    Then I should see an "#edit-field-donor-und-0-field-donor-in-honor-of" element

    # Create a couple. 
    Then I should see the heading "Create Couple"
    And I fill in the following:
      | Title *       | A Typical couple [autotest] |
      | Summary       | Aliquam placerat maurisTeaser
      | Body        | Aliquam placerat mauris sed pharetra eleifend. |
    
    When I press "Save"

    # Check output of couple.
    Then I should see "A Typical couple [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see the link "Moderate"
