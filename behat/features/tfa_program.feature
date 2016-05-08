Feature: TFA Program
  The TFA Program bundle should behave per specification.

  @api @tfa @tfa-program @tfa-pathauto
  Scenario: Ensure the program url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_program_pattern" field should contain "no-display/[node:title]"

  @api @tfa @tfa-program @tfa-bundle-settings
  Scenario: Verify program node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/program"

    # Check the state of checkboxes.
    Then the "name" field should contain "Program"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should not be checked
    Then the "node_submitted" checkbox should be checked

  @api @tfa @tfa-program @tfa-content
  Scenario: Create a program node and view it as role "program editor"
    Given I am logged in as a user with the "program editor" role
    When I visit "/node/add/program"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-program-region" element
    Then I should see an "#edit-field-program-type" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-scald-image" element

    # Create a program. 
    Then I should see the heading "Create Program"
    And I fill in the following:
      | Title *       | A Typical program [autotest] |
      | Body       | Aliquam placerat mauris sed pharetra eleifend. |

    And I fill in "field_website[und][0][url]" with "http://google.com"
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"

    When I press "Save"

    # Check output of program.
    Then I should see "A Typical program [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-program @tfa-content
  Scenario: Create a program node and view it as role "super editor"
    Given I am logged in as a user with the "super editor" role
    When I visit "/node/add/program"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-program-region" element
    Then I should see an "#edit-field-program-type" element
    Then I should see an "#edit-field-scald-image" element

    # Create a program. 
    Then I should see the heading "Create Program"
    And I fill in the following:
      | Title *       | A Typical program [autotest] |
      | Body       | Aliquam placerat mauris |

    When I press "Save"

    # Check output of program.
    Then I should see "A Typical program [autotest]"
    Then I should see "Aliquam placerat mauris"
    And I should not see the link "Moderate"

  @api @tfa @tfa-program @tfa-content
  Scenario: Create a program node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/program"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-program-region" element
    Then I should see an "#edit-field-program-type" element
    Then I should see an "#edit-field-scald-image" element

    # Create a program. 
    Then I should see the heading "Create Program"
    And I fill in the following:
      | Title *       | A Typical program [autotest] |
      | Body       | Aliquam placerat mauris |

    When I press "Save"

    # Check output of program.
    Then I should see "A Typical program [autotest]"
    Then I should see "Aliquam placerat mauris"
    And I should not see the link "Moderate"
