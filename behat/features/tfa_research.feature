Feature: TFA Research
  The TFA Research bundle should behave per specification.

  @api @tfa @tfa-research @tfa-pathauto
  Scenario: Ensure the research url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_research_pattern" field should contain "[node:title]"

  @api @tfa @tfa-research @tfa-bundle-settings
  Scenario: Verify research node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/research"

   # Check the status of checkboxes.
    Then the "name" field should contain "Research"
    And the "title_label" field should contain "Title"
    And the "node_options[status]" checkbox should not be checked
    And the "node_options[promote]" checkbox should not be checked
    And the "node_options[sticky]" checkbox should not be checked
    And the "node_options[revision]" checkbox should be checked
    And the "node_options[moderation]" checkbox should be checked
    And the "node_submitted" checkbox should not be checked

  @api @tfa @tfa-research @tfa-content
  Scenario: Create a research node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add"
    Then I should see the link "Research"

    When I click "Research"
    Then I should see the heading "Create Research"

    # Check for expected form elements.
    And I should see an "#edit-title" element
    And I should see an "#edit-body-und-0-summary" element
    And I should see an "#edit-body-und-0-value" element
    And I should see an "#edit-field-scald-image-und-0-sid" element
    And I should see an "#edit-field-attachment-und-0-upload" element

    # Create Person.
    Then I should see the heading "Create Research"

    And I fill in the following:
      | Title *       | Title [autotest] |
      | Summary       | A typical Summary |
      | Body       | A typical Body |

    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
    When I press "Save"

    Then I should see "Title [autotest]"
    And I should see "A typical Body"
    And I should see an ".field-name-field-scald-image" element
    And I should see the link "Moderate"
    When I follow "Moderate"
    Then I should see "This is the current revision. The current state is Draft."
    When I select "published" from "state"
    And I press "Apply"
    And I should see "This is the published revision."

  @api @tfa @tfa-research @tfa-content
  Scenario: Create a person node and view it as role "super editor"
    Given I am logged in as a user with the "super editor" role
    When I visit "/node/add/"
    Then I should see the link "Research"

    When I click "Research"
    Then I should see the heading "Create Research"

    # Check for expected form elements.
    And I should see an "#edit-title" element
    And I should see an "#edit-body-und-0-summary" element
    And I should see an "#edit-body-und-0-value" element
    And I should see an "#edit-field-scald-image-und-0-sid" element
    And I should see an "#edit-field-attachment-und-0-upload" element

    # Create Person.
    Then I should see the heading "Create Research"

    And I fill in the following:
      | Title *       | Title [autotest] |
      | Summary       | A typical Summary |
      | Body       | A typical Body |

    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
    When I press "Save"

    Then I should see "Title [autotest]"
    And I should see "A typical Body"
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-research @tfa-content
  Scenario: Create a person node and view it as "research editor"
    Given I am logged in as a user with the "research editor" role
    When I visit "/node/add/research"
    Then I should see the heading "Create Research"

    # Check for expected form elements.
    And I should see an "#edit-title" element
    And I should see an "#edit-body-und-0-summary" element
    And I should see an "#edit-body-und-0-value" element
    And I should see an "#edit-field-scald-image-und-0-sid" element
    And I should see an "#edit-field-attachment-und-0-upload" element

    # Create Person.
    Then I should see the heading "Create Research"

    And I fill in the following:
      | Title *       | Title [autotest] |
      | Summary       | A typical Summary |
      | Body       | A typical Body |

    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
    When I press "Save"

    Then I should see "Title [autotest]"
    And I should see "A typical Body"
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"
