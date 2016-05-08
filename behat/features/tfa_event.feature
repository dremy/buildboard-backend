Feature: TFA event
  The TFA event bundle should behave per specification.

  @api @tfa @tfa-event @tfa-pathauto
  Scenario: Ensure the event url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_event_pattern" field should contain "get-involved/events/[node:title]"

  @api @tfa @tfa-event @tfa-bundle-settings
  Scenario: Verify event node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/event"

    # Check the stated of checkboxes.
    Then the "name" field should contain "Event"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should not be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked

  @api @tfa @tfa-event @tfa-content
  Scenario: Create a event node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/event"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-event-type" element
    Then I should see an "#edit-field-event-status" element
    Then I should see an "#edit-field-event-date" element
    Then I should see an "#edit-field-full-bleed-background-imag" element
    Then I should see an "#edit-field-cta" element
    Then I should see an "#edit-field-host-name" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-telephone" element
    Then I should see an "#edit-field-email" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-link-id" element

    # Create a event. 
    Then I should see the heading "Create Event"
    And I fill in the following:
      | Title *       | A Typical Event [autotest] |
      | Teaser *        | Aliquam placerat mauris sed pharetra eleifend. |
      | Description        | Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra. |
    And I check the box "edit-field-event-type-und-25"
    And I select "22" from "field_event_status[und]"
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"

    When I press "Save"

    # Check output of event.
    Then I should see "A Typical Event [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra."
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-event @tfa-content
  Scenario: Create a event node and view it as role "event editor"
    Given I am logged in as a user with the "event editor" role
    When I visit "/node/add/event"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser" element
    Then I should see an "#edit-body" element
    Then I should see an "#edit-field-event-type" element
    Then I should see an "#edit-field-event-status" element
    Then I should see an "#edit-field-event-date" element
    Then I should see an "#edit-field-full-bleed-background-imag" element
    Then I should see an "#edit-field-cta" element
    Then I should see an "#edit-field-host-name" element
    Then I should see an "#edit-field-scald-image" element
    Then I should see an "#edit-field-telephone" element
    Then I should see an "#edit-field-email" element
    Then I should see an "#edit-field-website" element
    Then I should see an "#edit-field-link-id" element

    # Create a event. 
    Then I should see the heading "Create Event"
    And I fill in the following:
      | Title *       | A Typical Event [autotest] |
      | Teaser *        | Aliquam placerat mauris sed pharetra eleifend. |
      | Description        | Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra. |
    And I check the box "edit-field-event-type-und-25"
    And I select "22" from "field_event_status[und]"

    When I press "Save"

    # Check output of event.
    Then I should see "A Typical Event [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend mauris sed pharetra."
    And I should not see the link "Moderate"
