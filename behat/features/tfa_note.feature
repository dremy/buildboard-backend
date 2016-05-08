Feature: TFA One Day Note
  The TFA One Day Note bundle should behave per specification.

  @api @tfa @tfa-note @tfa-note-pathauto
  Scenario: Ensure the One Day Note url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_note_pattern" field should contain "one-day-magazine/alumni-notes/[node:title]"

  @api @tfa @tfa-note @tfa-note-bundle-settings
  Scenario: Verify One Day Note node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/note"

   # Check the status of checkboxes.
    Then the "name" field should contain "One Day Note"
    And the "title_label" field should contain "Title"
    And the "node_options[status]" checkbox should not be checked
    And the "node_options[promote]" checkbox should not be checked
    And the "node_options[sticky]" checkbox should not be checked
    And the "node_options[revision]" checkbox should be checked
    And the "node_options[moderation]" checkbox should be checked
    And the "node_submitted" checkbox should not be checked


  @api @tfa @tfa-note @tfa-content
  Scenario: Create a One Day Note node and view it as role "one day editor"
    Given I am logged in as a user with the "one day editor" role
    When I visit "/node/add"
    Then I should see the link "One Day Note"

    When I click "One Day Note"
    Then I should see the heading "Create One Day Note"

    # Check for expected form elements.
    And I should see an "#edit-title" element
    And I should see an "#edit-body-und-0-value" element
    And I should see an "#edit-field-person-name-und-0-title" element
    And I should see an "#edit-field-person-name-und-0-given" element
    And I should see an "#edit-field-person-name-und-0-middle" element
    And I should see an "#edit-field-person-name-und-0-family" element
    And I should see an "#edit-field-person-name-und-0-generational" element
    And I should see an "#edit-field-person-name-und-0-credentials" element
    And I should see an "#edit-field-email-und-0-value" element
    And I should see an "#edit-field-gender-und-none" element
    And I should see an "#edit-field-gender-und-male" element
    And I should see an "#edit-field-gender-und-female" element
    And I should see an "#edit-field-scald-image-und-0-sid" element
    And I should see an "#edit-field-oneday-edition-und-0-target-id" element
    And I should see an "#edit-field-represented-regions-und" element
    And I should see an "#edit-field-tags-und" element
    And I should see an "#edit-field-additional-regions-und" element
    And I should see an "#edit-field-corps-regions-und" element
    And I should see an "#edit-field-corps-year-und-0-value-year" element

    # Create Note.
    Then I should see the heading "Create One Day Note"

    And I fill in the following:
      | Title *       | One Day Note [autotest] |
      | Body          | One Day Body |
      | field_email[und][0][value]         | email@domain.tld |
      | First Name    | First Name     |
      | Middle name(s)| Middle         |
      | Last Name     | Last           |
      | Credentials   | Credentials    |

    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
    And I select "Dr." from "edit-field-person-name-und-0-title"
    And I select "IV" from "edit-field-person-name-und-0-generational"
    And I select "Male" from "field_gender[und]"
    And I select "-Appalachia" from "edit-field-corps-regions-und"

    And I fill in "field_oneday_edition[und][0][target_id]" with "Winter 2016 - The 25th Anniversary Issue"
    And I fill in "field_represented_regions[und]" with "Chicago-Northwest Indiana"
    And I fill in "field_tags[und]" with "14 Inspiring TV Teachers and Why We Love Them"

    When I press "Save"

    Then I should see "One Day Note [autotest]"
    And I should see "One Day Body"
    And I should see "Dr. First Name Middle Last IV, credentials"
    And I should see "Appalachia"
    And I should see "2016"
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-note @tfa-content
  Scenario: Create a One Day Note node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add"
    Then I should see the link "One Day Note"

    When I click "One Day Note"
    Then I should see the heading "Create One Day Note"

    # Check for expected form elements.
    And I should see an "#edit-title" element
    And I should see an "#edit-body-und-0-value" element
    And I should see an "#edit-field-person-name-und-0-title" element
    And I should see an "#edit-field-person-name-und-0-given" element
    And I should see an "#edit-field-person-name-und-0-middle" element
    And I should see an "#edit-field-person-name-und-0-family" element
    And I should see an "#edit-field-person-name-und-0-generational" element
    And I should see an "#edit-field-person-name-und-0-credentials" element
    And I should see an "#edit-field-email-und-0-value" element
    And I should see an "#edit-field-gender-und-none" element
    And I should see an "#edit-field-gender-und-male" element
    And I should see an "#edit-field-gender-und-female" element
    And I should see an "#edit-field-scald-image-und-0-sid" element
    And I should see an "#edit-field-oneday-edition-und-0-target-id" element
    And I should see an "#edit-field-represented-regions-und" element
    And I should see an "#edit-field-tags-und" element
    And I should see an "#edit-field-additional-regions-und" element
    And I should see an "#edit-field-corps-regions-und" element
    And I should see an "#edit-field-corps-year-und-0-value-year" element

    # Create Note.
    Then I should see the heading "Create One Day Note"

    And I fill in the following:
      | Title *       | One Day Note [autotest] |
      | Body          | One Day Body |
      | field_email[und][0][value]         | email@domain.tld |
      | First Name    | First Name     |
      | Middle name(s)| Middle         |
      | Last Name     | Last           |
      | Credentials   | Credentials    |



    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
    And I select "Dr." from "edit-field-person-name-und-0-title"
    And I select "IV" from "edit-field-person-name-und-0-generational"
    And I select "Male" from "field_gender[und]"
    And I select "-Appalachia" from "edit-field-corps-regions-und"

    And I fill in "field_oneday_edition[und][0][target_id]" with "Winter 2016 - The 25th Anniversary Issue"
    And I fill in "field_represented_regions[und]" with "Chicago-Northwest Indiana"
    And I fill in "field_tags[und]" with "14 Inspiring TV Teachers and Why We Love Them"

    When I press "Save"

    Then I should see "One Day Note [autotest]"
    And I should see "One Day Body"
    And I should see "Dr. First Name Middle Last IV, Credentials"
    And I should see "Appalachia"
    And I should see "2016"

    And I should see the link "Moderate"
    When I click "Moderate"
    Then I should see "This is the current revision. The current state is draft."
    When I select "published" from "state"
    And I press "Apply"
    Then I should see "This is the published revision"
