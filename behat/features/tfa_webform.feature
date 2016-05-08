Feature: TFA webform
  The TFA webform bundle should behave per specification.

  @api @tfa @tfa-webform @tfa-pathauto
  Scenario: Ensure the Webform url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_webform_pattern" field should contain "[node:title]"

  @api @tfa @tfa-webform @tfa-bundle-settings
  Scenario: Verify Webform node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/webform"

    # Check the stated of checkboxes.
    Then the "name" field should contain "Webform"
    And the "description" field should contain "Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users."
    Then the "node_options[status]" checkbox should be checked
    Then the "node_options[promote]" checkbox should be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should not be checked
    Then the "node_options[moderation]" checkbox should not be checked
    Then the "node_submitted" checkbox should not be checked
    
  @api @tfa @tfa-webform @tfa-content
  Scenario: Create a webform node and view it as the "administrator" role
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add"
    Then I should see the link "Webform"

    When I click "Webform"
    Then I should see the heading "Create Webform"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-header-title-und-0-value" element
    Then I should see an "#edit-field-window-title-und-0-value" element
    Then I should see an "#edit-body-und-0-value" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element

    # Create a webform.
    Then I should see the heading "Create Webform"
    And I fill in the following:
      | Title *       | A Typical Webform [autotest] |
      | Body          | Aliquam placerat mauris sed pharetra eleifend. |
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"

    When I press "Save"
    Then I should see the link "View"
    When I visit "typical-webform-autotest"

    # Check output of webform.
    Then I should see "A Typical Webform [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should see an ".field-name-field-scald-image" element

  @api @tfa @tfa-webform @tfa-content
  Scenario: Create a webform node and view it as the "super editor" role
    Given I am logged in as a user with the "super editor" role
    When I visit "/node/add"
    Then I should see the link "Webform"

    When I click "Webform"
    Then I should see the heading "Create Webform"

      # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-header-title-und-0-value" element
    Then I should see an "#edit-field-window-title-und-0-value" element
    Then I should see an "#edit-body-und-0-value" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element

      # Create a webform.
    Then I should see the heading "Create Webform"
    And I fill in the following:
      | Title *       | A Typical Webform [autotest] |
      | Body          | Aliquam placerat mauris sed pharetra eleifend. |

    When I press "Save"
    Then I should see the link "View"
    When I click "View"

      # Check output of webform.
    Then I should see "A Typical Webform [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."

  @api @tfa @tfa-webform @tfa-content
  Scenario: Create a webform node and view it as the "form editor" role
    Given I am logged in as a user with the "form editor" role
    When I visit "/node/add/webform"
    Then I should see the heading "Create Webform"

  # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-header-title-und-0-value" element
    Then I should see an "#edit-field-window-title-und-0-value" element
    Then I should see an "#edit-body-und-0-value" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element

  # Create a webform.
    Then I should see the heading "Create Webform"
    And I fill in the following:
      | Title *       | A Typical Webform [autotest] |
      | Body          | Aliquam placerat mauris sed pharetra eleifend. |

    When I press "Save"
    Then I should see the link "View"
    When I click "View"

  # Check output of webform.
    Then I should see "A Typical Webform [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
