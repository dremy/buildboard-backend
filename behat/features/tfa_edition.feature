Feature: TFA One Day Edition
  The TFA One Day Edition bundle should behave per specification.

  @api @tfa @tfa-edition @tfa-edition-pathauto
  Scenario: Ensure the One Day Edition url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_edition_pattern" field should contain "one-day-magazine/[node:field_season]-[node:field-date:year]"

  @api @tfa @tfa-edition @tfa-edition-bundle-settings
  Scenario: Verify One Day Edition node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/edition"

   # Check the status of checkboxes.
    Then the "name" field should contain "One Day Edition"
    And the "title_label" field should contain "Title"
    And the "node_options[status]" checkbox should not be checked
    And the "node_options[promote]" checkbox should not be checked
    And the "node_options[sticky]" checkbox should not be checked
    And the "node_options[revision]" checkbox should be checked
    And the "node_options[moderation]" checkbox should be checked
    And the "node_submitted" checkbox should not be checked


  @api @tfa @tfa-edition @tfa-content
  Scenario: Create a One Day Edition node and view it as role "one day editor"
    Given I am logged in as a user with the "one day editor" role
    When I visit "/node/add"
    Then I should see the link "One Day Edition"

    When I click "One Day Edition"
    Then I should see the heading "Create One Day Edition"

    # Check for expected form elements.
    And I should see an "#edit-field-subhead-und-0-value" element
    And I should see an "#edit-field-full-bleed-background-imag" element
    And I should see an "#edit-field-season-und" element
    And I should see an "#edit-field-date-und-0-value-year" element
    And I should see an "#edit-field-attachment-und-0-ajax-wrapper" element
    And I should see an "#edit-field-scald-image-und-0-sid" element

    # Create One Day Edition.
    Then I should see the heading "Create One Day Edition"
    Then I select "Spring" from "edit-field-season-und"
    Then I select "2016" from "edit-field-date-und-0-value-year"

    And I fill in the following:
      | Magazine Dek       | One Day Edition [autotest]|

    And I drag the image atom "placeholder_scald.png" to "edit-field-full-bleed-background-imag-und-0-sid"
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"

    When I press "Save"

    Then I should see "One Day Edition [autotest]"
    And I should see "2016"

    And I should not see the link "Moderate"

  @api @tfa @tfa-edition @tfa-content
  Scenario: Create a One Day Edition node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add"
    Then I should see the link "One Day Edition"

    When I click "One Day Edition"
    Then I should see the heading "Create One Day Edition"

    # Check for expected form elements.
    And I should see an "#edit-field-subhead-und-0-value" element
    And I should see an "#edit-field-full-bleed-background-imag" element
    And I should see an "#edit-field-season-und" element
    And I should see an "#edit-field-date-und-0-value-year" element
    And I should see an "#edit-field-attachment-und-0-ajax-wrapper" element
    And I should see an "#edit-field-scald-image-und-0-sid" element

    # Create One Day Edition.
    Then I should see the heading "Create One Day Edition"
    Then I select "Spring" from "edit-field-season-und"
    Then I select "2016" from "edit-field-date-und-0-value-year"

    And I fill in the following:
      | Magazine Dek       | One Day Edition [autotest]|

    And I drag the image atom "placeholder_scald.png" to "edit-field-full-bleed-background-imag-und-0-sid"
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"

    When I press "Save"

    Then I should see "One Day Edition [autotest]"
    And I should see "2016"
    And I should see an ".field-name-field-full-bleed-background-imag" element

    Then I should see the link "Moderate"
    When I click "Moderate"
    Then I should see "This is the current revision. The current state is Draft."
    When I select "published" from "state"
    And I press "Apply"
    And I should see "This is the published revision."
