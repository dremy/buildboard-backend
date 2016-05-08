Feature: TFA Quote
  The TFA Quote bundle should behave per specification.

  @api @tfa @tfa-quote @tfa-pathauto
  Scenario: Ensure the Quote url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_quotes_pattern" field should contain "no-display/[node:title]"

  @api @tfa @tfa-quote @tfa-bundle-settings
  Scenario: Verify Quote node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/quotes"

    # Check the status of checkboxes.
    Then the "name" field should contain "Quote"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_options[moderation]" checkbox should not be checked
    Then the "node_submitted" checkbox should not be checked

  @api @tfa @tfa-quote @tfa-content
  Scenario: Create a Quote node and view it as an administrator
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add"
    Then I should see the link "Quote"

    When I click "Quote"
    Then I should see the heading "Create Quote"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser-und-0-value" element
    Then I should see an "#edit-body-und-0-value" element
    Then I should see an "#edit-field-attribution-und-0-target-id" element
    Then I should see an "#edit-field-attribution-details-und-0-value" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element
    Then I should see an "#edit-field-date-und-0-value-datepicker-popup-0" element
    Then I should see an "#edit-field-quote-event-und-0-target-id" element

    # Create a quote.
    Then I should see the heading "Create Quote"
    And I fill in the following:
      | Title *       | A Typical Quote Page [autotest] |
      | Full Quote    | Aliquam placerat mauris sed pharetra eleifend. |
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"

    When I press "Save"

    # Check output of quote.
    Then I should see "A Typical Quote Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"

  @api @tfa @tfa-quote @tfa-content
  Scenario: Create a Quote node and view it as a Quote Editor
    Given I am logged in as a user with the "Quote editor" role
    When I visit "/node/add/quotes"
    Then I should see the heading "Create Quote"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser-und-0-value" element
    Then I should see an "#edit-body-und-0-value" element
    Then I should see an "#edit-field-attribution-und-0-target-id" element
    Then I should see an "#edit-field-attribution-details-und-0-value" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element
    Then I should see an "#edit-field-date-und-0-value-datepicker-popup-0" element
    Then I should see an "#edit-field-quote-event-und-0-target-id" element

    # Create a quote.
    Then I should see the heading "Create Quote"
    And I fill in the following:
      | Title *       | A Typical Quote Page [autotest] |
      | Full Quote    | Aliquam placerat mauris sed pharetra eleifend. |

    When I press "Save"

    # Check output of quote.
    Then I should see "A Typical Quote Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see the link "Moderate"

  @api @tfa @tfa-quote @tfa-content
  Scenario: Create a Quote node and view it as a super editor
    Given I am logged in as a user with the "super editor" role
    When I visit "/node/add"
    Then I should see the link "Quote"

    When I click "Quote"
    Then I should see the heading "Create Quote"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
    Then I should see an "#edit-field-teaser-und-0-value" element
    Then I should see an "#edit-body-und-0-value" element
    Then I should see an "#edit-field-attribution-und-0-target-id" element
    Then I should see an "#edit-field-attribution-details-und-0-value" element
    Then I should see an "#edit-field-scald-image-und-0-sid" element
    Then I should see an "#edit-field-date-und-0-value-datepicker-popup-0" element
    Then I should see an "#edit-field-quote-event-und-0-target-id" element

    # Create a quote.
    Then I should see the heading "Create Quote"
    And I fill in the following:
      | Title *       | A Typical Quote Page [autotest] |
      | Full Quote    | Aliquam placerat mauris sed pharetra eleifend. |

    When I press "Save"

    # Check output of quote.
    Then I should see "A Typical Quote Page [autotest]"
    Then I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should not see the link "Moderate"
