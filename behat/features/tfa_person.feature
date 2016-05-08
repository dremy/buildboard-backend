Feature: TFA Person
  The TFA Person bundle should behave per specification.

  @api @tfa @tfa-person @tfa-pathauto
  Scenario: Ensure the person url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_person_pattern" field should contain "person/[node:title]"

   @api @tfa @tfa-person @tfa-bundle-settings
   Scenario: Verify person node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/person"
    
    # Check the status of checkboxes.
    Then the "name" field should contain "Person"
      And the "title_label" field should contain "Name"
      And the "node_options[status]" checkbox should be checked
      And the "node_options[promote]" checkbox should not be checked
      And the "node_options[sticky]" checkbox should not be checked
      And the "node_options[revision]" checkbox should be checked
      And the "node_submitted" checkbox should not be checked

  @api @tfa @tfa-person @tfa-content
  Scenario: Create a person node and view it as role "person editor"
    Given I am logged in as a user with the "person editor" role
    When I visit "/node/add"
    Then I should see the link "Person"
    
    When I click "Person"
    Then I should see the heading "Create Person"

    # Check for expected form elements.
    And I should see an "#edit-field-person-name-und-0-title" element
    And I should see an "#edit-field-person-name-und-0-given" element
    And I should see an "#edit-field-person-name-und-0-middle" element
    And I should see an "#edit-field-person-name-und-0-family" element
    And I should see an "#edit-field-person-name-und-0-generational" element

    # Involvement.
    And I should see an "#edit-field-involvement-und-9" element
    And I should see an "#edit-field-involvement-und-10" element
    And I should see an "#edit-field-involvement-und-11" element

    # Informations.
    And I should see an "#edit-field-scald-image" element
    And I should see an "#edit-field-job-title-und-0-value" element
    And I should see an "#edit-field-job-employer-und-0-target-id" element
    And I should see an "#edit-field-continuum-status-und-7" element
    And I should see an "#edit-field-continuum-status-und-6" element
    And I should see an "#edit-field-continuum-status-und-8" element
    And I should see an "#edit-field-telephone-und-0-value" element
    And I should see an "#edit-field-fax-und-0-value" element
    And I should see an "#edit-field-email-und-0-email" element
    And I should see an "#edit-field-website-und-0-url" element
    And I should see an "#edit-field-facebook-und-0-url" element
    And I should see an "#edit-field-twitter-und-0-url" element
    
    # Create Person. 
    Then I should see the heading "Create Person"
    Then I select "Mr." from "field_person_name[und][0][title]"

    And I fill in the following:
      | First Name *       | TFA-firstname |
      | Middle name(s)       | Mi |
      | Last Name       | TFA-lastname |
      | Credentials | TFA-Credentials |
      | Teaser | Teaser Aliquam placerat mauris sed pharetra eleifend. |
      | Bio        | Aliquam placerat mauris sed pharetra eleifend. |
      | Telephone | 212-555-5555 |
      | Fax | 212-555-5555 |
      | Email | editor_email@domain.com |

   And I check the box "field_continuum_status[und][6]"
   And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"
   When I press "Save"

   Then I should see "TFA-firstname"
    And I should see "Mi"
    And I should see "TFA-lastname"
    And I should see "TFA-Credentials"
    And I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should see "212-555-5555"
    And I should see "editor_email@domain.com"
    And I should see an ".field-name-field-scald-image" element
    And I should not see the link "Moderate"
  
  @api @tfa @tfa-person @tfa-content
  Scenario: Create a person node and view it as role "super editor"
    Given I am logged in as a user with the "super editor" role
    When I visit "/node/add"
    Then I should see the link "Person"
    
    When I click "Person"
    Then I should see the heading "Create Person"

    # Check for expected form elements.
    And I should see an "#edit-field-person-name-und-0-title" element
    And I should see an "#edit-field-person-name-und-0-given" element
    And I should see an "#edit-field-person-name-und-0-middle" element
    And I should see an "#edit-field-person-name-und-0-family" element
    And I should see an "#edit-field-person-name-und-0-generational" element

    # Involvement.
    And I should see an "#edit-field-involvement-und-9" element
    And I should see an "#edit-field-involvement-und-10" element
    And I should see an "#edit-field-involvement-und-11" element

    # Informations.
    And I should see an "#edit-field-job-title-und-0-value" element
    And I should see an "#edit-field-job-employer-und-0-target-id" element
    And I should see an "#edit-field-continuum-status-und-7" element
    And I should see an "#edit-field-continuum-status-und-6" element
    And I should see an "#edit-field-continuum-status-und-8" element
    And I should see an "#edit-field-telephone-und-0-value" element
    And I should see an "#edit-field-fax-und-0-value" element
    And I should see an "#edit-field-email-und-0-email" element
    And I should see an "#edit-field-website-und-0-url" element
    And I should see an "#edit-field-facebook-und-0-url" element
    And I should see an "#edit-field-twitter-und-0-url" element
    
    # Create Person. 
    Then I should see the heading "Create Person"
    Then I select "Mr." from "field_person_name[und][0][title]"

    And I fill in the following:
      | First Name *       | TFA-firstname |
      | Middle name(s)       | Mi |
      | Last Name       | TFA-lastname |
      | Credentials | TFA-Credentials |
      | Teaser | Teaser Aliquam placerat mauris sed pharetra eleifend. |
      | Bio        | Aliquam placerat mauris sed pharetra eleifend. |
      | Telephone | 212-555-5555 |
      | Fax | 212-555-5555 |
      | Email | super_editor_email@domain.com |

   And I check the box "field_continuum_status[und][6]"
   When I press "Save"

   Then I should see "TFA-firstname"
    And I should see "Mi"
    And I should see "TFA-lastname"
    And I should see "TFA-Credentials"
    And I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should see "212-555-5555"
    And I should not see the link "Moderate"
  
  @api @tfa @tfa-person @tfa-content
  Scenario: Create a person node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add"
    Then I should see the link "Person"
    
    When I click "Person"
    Then I should see the heading "Create Person"

    # Check for expected form elements.
    And I should see an "#edit-field-person-name-und-0-title" element
    And I should see an "#edit-field-person-name-und-0-given" element
    And I should see an "#edit-field-person-name-und-0-middle" element
    And I should see an "#edit-field-person-name-und-0-family" element
    And I should see an "#edit-field-person-name-und-0-generational" element

    # Involvement.
    And I should see an "#edit-field-involvement-und-9" element
    And I should see an "#edit-field-involvement-und-10" element
    And I should see an "#edit-field-involvement-und-11" element

    # Informations.
    And I should see an "#edit-field-job-title-und-0-value" element
    And I should see an "#edit-field-job-employer-und-0-target-id" element
    And I should see an "#edit-field-continuum-status-und-7" element
    And I should see an "#edit-field-continuum-status-und-6" element
    And I should see an "#edit-field-continuum-status-und-8" element
    And I should see an "#edit-field-telephone-und-0-value" element
    And I should see an "#edit-field-fax-und-0-value" element
    And I should see an "#edit-field-email-und-0-email" element
    And I should see an "#edit-field-website-und-0-url" element
    And I should see an "#edit-field-facebook-und-0-url" element
    And I should see an "#edit-field-twitter-und-0-url" element
    
    # Create Person. 
    Then I should see the heading "Create Person"
    Then I select "Mr." from "field_person_name[und][0][title]"

    And I fill in the following:
      | First Name *       | TFA-firstname |
      | Middle name(s)       | Mi |
      | Last Name       | TFA-lastname |
      | Credentials | TFA-Credentials |
      | Teaser | Teaser Aliquam placerat mauris sed pharetra eleifend. |
      | Bio        | Aliquam placerat mauris sed pharetra eleifend. |
      | Telephone | 212-555-5555 |
      | Fax | 212-555-5555 |
      | Email | admin_email@domain.com |

    And I check the box "field_continuum_status[und][6]"
    When I press "Save"

    Then I should see "TFA-firstname"
    And I should see "Mi"
    And I should see "TFA-lastname"
    And I should see "TFA-Credentials"
    And I should see "Aliquam placerat mauris sed pharetra eleifend."
    And I should see "212-555-5555"
    And I should not see the link "Moderate"
