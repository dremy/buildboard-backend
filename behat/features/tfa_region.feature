Feature: TFA Region
  The TFA Region bundle should behave per specification.

  @api @tfa @tfa-region @tfa-region-pathauto
  Scenario: Ensure the region url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_region_pattern" field should contain "no-display/[node:title]"

  @api @tfa @tfa-region @tfa-region-bundle-settings
  Scenario: Verify region node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/region"

    # Check the status of checkboxes.
    Then the "name" field should contain "Region"
    And the "title_label" field should contain "Name"
    And the "node_options[status]" checkbox should not be checked
    And the "node_options[promote]" checkbox should be checked
    And the "node_options[sticky]" checkbox should not be checked
    And the "node_options[revision]" checkbox should be checked
    And the "node_submitted" checkbox should not be checked
    And the "node_options[moderation]" checkbox should be checked
    And the "node_submitted" checkbox should not be checked

    And the "panelizer[status]" checkbox should be checked
    And the "panelizer[view modes][page_manager][status]" checkbox should be checked
    And the "panelizer[view modes][page_manager][default]" checkbox should be checked
    And the "panelizer[view modes][page_manager][default revert]" checkbox should not be checked
    And the "panelizer[view modes][page_manager][choice]" checkbox should not be checked
    And the "panelizer[view modes][default][status]" checkbox should be checked
    And the "panelizer[view modes][default][default]" checkbox should be checked
    And the "panelizer[view modes][default][default revert]" checkbox should not be checked
    And the "panelizer[view modes][default][choice]" checkbox should not be checked
    And the "panelizer[view modes][teaser][status]" checkbox should be checked
    And the "panelizer[view modes][teaser][default]" checkbox should be checked
    And the "panelizer[view modes][teaser][default revert]" checkbox should not be checked
    And the "panelizer[view modes][teaser][choice]" checkbox should not be checked

  @api @tfa @tfa-region @tfa-content
  Scenario: Create a region node and view it as role "region editor"
    Given I am logged in as a user with the "region editor" role
    When I visit "node/add/region"

    Then I should see the heading "Create Region"
    Then I should see "New content: Your draft will be placed in moderation."

    # Check for expected form elements.
    Then I should see an "#edit-title" element
      And I should see an "#edit-field-description-und-0-value" element
      And I should see an "#edit-field-region-x-value-und-0-value" element
      And I should see an "#edit-field-region-y-value-und-0-value" element
      And I should see an "#edit-field-geographical-area-und" element
      And I should see an "#edit-field-scald-image" element
      And I should see an "#edit-field-website-und-0-url" element
      And I should see an "#edit-field-high-need-und" element
      And I should see an "#edit-field-address-und-0-value" element
      And I should see an "#edit-field-executive-director-und-0-target-id" element
      And I should see an "#edit-field-executive-director-er-und-0-target-id" element
      And I should see an "#edit-field-fun-fact-und-0-value" element
      And I should see an "#edit-field-active-corps-members-und-0-value" element
      And I should see an "#edit-field-alumni-und-0-value" element
      And I should see an "#edit-field-masters-degree-und" element
      And I should see an "#edit-field-masters-duration-und-0-value" element
      And I should see an "#edit-field-certification-und-0-value" element
      And I should see an "#edit-field-monthly-salary-und-0-value" element
      And I should see an "#edit-field-monthly-expenses-und-0-value" element
      And I should see an "#edit-field-gpa-min-und-0-value" element
      And I should see an "#edit-field-lgbtq-und" element
      And I should see an "#edit-field-lgbtq-protections-und-0-value" element

    # Create Region.      
    Then I fill in the following:
        | Name *       | Region [autotest] |
        | Description | Aliquam placerat mauris sed pharetra eleifend. |
        | Address * | 123 Test Rd., Alexandria, VA 22222 |
        | Position X | 5120196 |
        | Position Y | 1031182 |
        | Corps Members | 520000001 |
        | Alumni | 294930001 |
        | Certification | 36 |
        | GPA Minimum | 3.5 | 

    And I check the box "field_high_need[und]" 
    Then I select "Required" from "field_masters_degree[und]"
    And I check the box "field_lgbtq[und]"

    And I fill in "field_monthly_salary[und][0][value]" with "100000"
    And I fill in "field_monthly_expenses[und][0][value]" with "89000"
    And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"

    And I press "Save unpublished draft"
    Then I should see "Region [autotest]"
      And I should see "Description:"
      And I should see "Aliquam placerat mauris sed pharetra eleifend."
      And I should see an ".field-name-field-scald-image" element

  @api @tfa @tfa-region @tfa-content
  Scenario: Create a region node and view it as role "super editor"
    Given I am logged in as a user with the "super editor" role
    When I visit "/node/add"
    Then I should see the link "Region"

    When I click "Region"
    Then I should see the heading "Create Region"
    Then I should see "New content: Your draft will be placed in moderation."

    # Check for expected form elements.
    Then I should see an "#edit-title" element
      And I should see an "#edit-field-description-und-0-value" element
      And I should see an "#edit-field-region-x-value-und-0-value" element
      And I should see an "#edit-field-region-y-value-und-0-value" element
      And I should see an "#edit-field-geographical-area-und" element
      And I should see an "#edit-field-website-und-0-url" element
      And I should see an "#edit-field-high-need-und" element
      And I should see an "#edit-field-address-und-0-value" element
      And I should see an "#edit-field-executive-director-und-0-target-id" element
      And I should see an "#edit-field-executive-director-er-und-0-target-id" element
      And I should see an "#edit-field-fun-fact-und-0-value" element
      And I should see an "#edit-field-active-corps-members-und-0-value" element
      And I should see an "#edit-field-alumni-und-0-value" element
      And I should see an "#edit-field-masters-degree-und" element
      And I should see an "#edit-field-masters-duration-und-0-value" element
      And I should see an "#edit-field-certification-und-0-value" element
      And I should see an "#edit-field-monthly-salary-und-0-value" element
      And I should see an "#edit-field-monthly-expenses-und-0-value" element
      And I should see an "#edit-field-gpa-min-und-0-value" element
      And I should see an "#edit-field-lgbtq-und" element
      And I should see an "#edit-field-lgbtq-protections-und-0-value" element

    # Create Region.      
    Then I fill in the following:
        | Name *       | Region [autotest] |
        | Description | Aliquam placerat mauris sed pharetra eleifend. |
        | Address * | 123 Test Rd., Alexandria, VA 22222 |
        | Position X | 5120196 |
        | Position Y | 1031182 |
        | Corps Members | 520000001 |
        | Alumni | 294930001 |
        | Certification | 36 |
        | GPA Minimum | 3.5 | 

    And I check the box "field_high_need[und]" 
    Then I select "Required" from "field_masters_degree[und]"
    And I check the box "field_lgbtq[und]"

    And I fill in "field_monthly_salary[und][0][value]" with "100000"
    And I fill in "field_monthly_expenses[und][0][value]" with "89000"

    And I press "Save unpublished draft"
    Then I should see "Region [autotest]"
      And I should see "Description:"
      And I should see "Aliquam placerat mauris sed pharetra eleifend."

  @api @tfa @tfa-region @tfa-content
  Scenario: Create a region node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add"
    Then I should see the link "Region"

    When I click "Region"
    Then I should see the heading "Create Region"
    Then I should see "New content: Your draft will be placed in moderation."

    # Check for expected form elements.
    Then I should see an "#edit-title" element
      And I should see an "#edit-field-description-und-0-value" element
      And I should see an "#edit-field-region-x-value-und-0-value" element
      And I should see an "#edit-field-region-y-value-und-0-value" element
      And I should see an "#edit-field-geographical-area-und" element
      And I should see an "#edit-field-website-und-0-url" element
      And I should see an "#edit-field-high-need-und" element
      And I should see an "#edit-field-address-und-0-value" element
      And I should see an "#edit-field-executive-director-und-0-target-id" element
      And I should see an "#edit-field-executive-director-er-und-0-target-id" element
      And I should see an "#edit-field-fun-fact-und-0-value" element
      And I should see an "#edit-field-active-corps-members-und-0-value" element
      And I should see an "#edit-field-alumni-und-0-value" element
      And I should see an "#edit-field-masters-degree-und" element
      And I should see an "#edit-field-masters-duration-und-0-value" element
      And I should see an "#edit-field-certification-und-0-value" element
      And I should see an "#edit-field-monthly-salary-und-0-value" element
      And I should see an "#edit-field-monthly-expenses-und-0-value" element
      And I should see an "#edit-field-gpa-min-und-0-value" element
      And I should see an "#edit-field-lgbtq-und" element
      And I should see an "#edit-field-lgbtq-protections-und-0-value" element

    # Create Region.      
    Then I fill in the following:
        | Name *       | Region [autotest] |
        | Description | Aliquam placerat mauris sed pharetra eleifend. |
        | Address * | 123 Test Rd., Alexandria, VA 22222 |
        | Position X | 5120196 |
        | Position Y | 1031182 |
        | Corps Members | 520000001 |
        | Alumni | 294930001 |
        | Certification | 36 |
        | GPA Minimum | 3.5 | 

    And I check the box "field_high_need[und]" 
    Then I select "Required" from "field_masters_degree[und]"
    And I check the box "field_lgbtq[und]"

    And I fill in "field_monthly_salary[und][0][value]" with "100000"
    And I fill in "field_monthly_expenses[und][0][value]" with "89000"

    And I press "Save unpublished draft"
    Then I should see "Region [autotest]"
      And I should see "Description:"
      And I should see "Aliquam placerat mauris sed pharetra eleifend."
    Then I should see the link "Moderate"
    When I click "Moderate"
    Then I should see "This is the current revision. The current state is Draft."
    When I select "published" from "state"
      And I press "Apply"
      And I should see "This is the published revision."
