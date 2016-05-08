Feature: TFA Media Coverage
  The TFA Media Coverage bundle should behave per specification.

  @api @tfa @tfa-media-coverage @tfa-pathauto
  Scenario: Ensure the media coverage url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_media_coverage_pattern" field should contain "about-us/tfa-on-the-record/[node:title]"

  @api @tfa @tfa-media-coverage @tfa-bundle-settings
  Scenario: Verify media coverage node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/media-coverage"

    # Check the stated of checkboxes.
    Then the "name" field should contain "Media Coverage"
      And the "node_options[status]" checkbox should not be checked
      And the "node_options[promote]" checkbox should not be checked
      And the "node_options[sticky]" checkbox should not be checked
      And the "node_options[revision]" checkbox should be checked
      And the "node_submitted" checkbox should not be checked
      And the "edit-ant-0" field should contain "0"   
      And "edit-ant-0" checkbox should be checked
      And the "simplify_nodes[author]" checkbox should not be checked
      And the "simplify_nodes[format]" checkbox should not be checked
      And the "simplify_nodes[options]" checkbox should not be checked
      And the "simplify_nodes[revision]" checkbox should not be checked
      And the "simplify_nodes[comment]" checkbox should not be checked
      And the "simplify_nodes[menu]" checkbox should not be checked
      And the "simplify_nodes[path]" checkbox should not be checked
      And the "simplify_nodes[metatag]" checkbox should not be checked
      And the "simplify_nodes[redirect]" checkbox should not be checked
      And the "panelizer[status]" checkbox should not be checked
      And the "webform_node" checkbox should not be checked

  @api @tfa @tfa-media-coverage @tfa-content
  Scenario: Create a media coverage node and view it as role "post editor"
    Given I am logged in as a user with the "post editor" role
    When I visit "node/add"
    Then I should see the link "Media Coverage"
    Then I click "Media Coverage"


    # Check for expected form elements.
    Then I should see an "#edit-title" element
      And I should see an "#edit-field-coverage-type-und" element
      And I should see an "#edit-field-teaser-und-0-value" element
      And I should see an "#edit-body-und-0-value" element
      And I should see an "#edit-field-media-url-und-0-title" element
      And I should see an "#edit-field-published-date-und-0-value-datepicker-popup-0" element
      And I should see an "#edit-field-publication-und-0-value" element
      And I should see an "#edit-field-source-url-und-0-title" element
      And I should see an "#edit-field-additional-regions-und" element

    # Create the media coverage node.
    Then I should see the heading "Create Media Coverage"
      And I fill in the following:
        | Title *     | A Typical Media Coverage [autotest] |
        | Body        | Aliquam placerat mauris sed pharetra eleifend. |
        | Date | 1/1/2015 |
        | Publication | Media-Coverage-Publication |
      
      And I drag the image atom "placeholder_scald.png" to "edit-field-scald-image-und-0-sid"      
      And I fill in "field_media_url[und][0][title]" with "Ode to the Brain! by Symphony of Science"
      And I fill in "field_media_url[und][0][url]" with "https://www.youtube.com/watch?v=JB7jSFeVz1U"

      And I fill in "field_source_url[und][0][title]" with "Google"
      And I fill in "field_source_url[und][0][url]" with "http://www.google.com"
      And I select "coverage" from "field_coverage_type[und]"
      And I fill in "field_publication[und][0][value]" with "Arkansas, Detroit, Sacramento"

     When I press "Save"
     Then I should see "A Typical Media Coverage [autotest]"
      And I should see "Aliquam placerat mauris sed pharetra eleifend."
      And I should see an ".field-name-field-scald-image" element
      And I should not see the link "Moderate"
       
  @api @tfa @tfa-media-coverage @tfa-content
  Scenario: Create a media coverage node and view it as role "super editor"
    Given I am logged in as a user with the "super editor" role
    When I visit "node/add"
    Then I should see the link "Media Coverage"
    Then I click "Media Coverage"

    # Check for expected form elements.
    Then I should see an "#edit-title" element
      And I should see an "#edit-field-coverage-type-und" element
      And I should see an "#edit-field-teaser-und-0-value" element
      And I should see an "#edit-body-und-0-value" element
      And I should see an "#edit-field-media-url-und-0-title" element
      And I should see an "#edit-field-published-date-und-0-value-datepicker-popup-0" element
      And I should see an "#edit-field-publication-und-0-value" element
      And I should see an "#edit-field-source-url-und-0-title" element
      And I should see an "#edit-field-additional-regions-und" element

    # Create the media coverage node.
    Then I should see the heading "Create Media Coverage"
      And I fill in the following:
        | Title *     | A Typical Media Coverage [autotest] |
        | Body        | Aliquam placerat mauris sed pharetra eleifend. |
        | Date | 1/1/2015 |
        | Publication | Media-Coverage-Publication |
            
      And I fill in "field_media_url[und][0][title]" with "Ode to the Brain! by Symphony of Science"
      And I fill in "field_media_url[und][0][url]" with "https://www.youtube.com/watch?v=JB7jSFeVz1U"

      And I fill in "field_source_url[und][0][title]" with "Google"
      And I fill in "field_source_url[und][0][url]" with "http://www.google.com"
      And I select "coverage" from "field_coverage_type[und]"
      And I fill in "field_publication[und][0][value]" with "Arkansas, Detroit, Sacramento"

     When I press "Save"
     
     Then I should see "A Typical Media Coverage [autotest]"
      And I should see "Aliquam placerat mauris sed pharetra eleifend."
      And I should see "Revision state: Draft"
      And I should see "Most recent revision: Yes"
       
  @api @tfa @tfa-media-coverage @tfa-content
  Scenario: Create a media coverage node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add"
    Then I should see the link "Media Coverage"
    Then I click "Media Coverage"


    # Check for expected form elements.
    Then I should see an "#edit-title" element
      And I should see an "#edit-field-coverage-type-und" element
      And I should see an "#edit-field-teaser-und-0-value" element
      And I should see an "#edit-body-und-0-value" element
      And I should see an "#edit-field-media-url-und-0-title" element
      And I should see an "#edit-field-published-date-und-0-value-datepicker-popup-0" element
      And I should see an "#edit-field-publication-und-0-value" element
      And I should see an "#edit-field-source-url-und-0-title" element
      And I should see an "#edit-field-additional-regions-und" element

    # Create the media coverage node.
    Then I should see the heading "Create Media Coverage"
      And I fill in the following:
        | Title *     | A Typical Media Coverage [autotest] |
        | Body        | Aliquam placerat mauris sed pharetra eleifend. |
        | Date | 1/1/2015 |
        | Publication | Media-Coverage-Publication |
            
      And I fill in "field_media_url[und][0][title]" with "Ode to the Brain! by Symphony of Science"
      And I fill in "field_media_url[und][0][url]" with "https://www.youtube.com/watch?v=JB7jSFeVz1U"

      And I fill in "field_source_url[und][0][title]" with "Google"
      And I fill in "field_source_url[und][0][url]" with "http://www.google.com"
      And I select "coverage" from "field_coverage_type[und]"
      And I fill in "field_publication[und][0][value]" with "Arkansas, Detroit, Sacramento"

     When I press "Save"
     Then I should see "A Typical Media Coverage [autotest]"
      And I should see "Aliquam placerat mauris sed pharetra eleifend."
 
      # Check workflow.
      And I should see "Revision state: Draft"
      And I should see "Most recent revision: Yes"
     Then I select "published" from "state"
     Then I press "Apply"
      And I should see "Revision state: Published"
      And I should see "Most recent revision: Yes"
