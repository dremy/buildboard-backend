Feature: TFA Press Release
  The TFA Press Release bundle should behave per specification.

  @api @tfa @tfa-press-release @tfa-pathauto
  Scenario: Ensure the press release url pattern has not changed.
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/search/path/patterns"
    Then the "pathauto_node_press_release_pattern" field should contain "about-us/media-resources/news-releases/[node:title]"

  @api @tfa @tfa-press-release @tfa-bundle-settings
  Scenario: Verify press release node type settings
    Given I am logged in as a user with the "administrator" role
    When I go to "admin/structure/types/manage/press_release"

    # Check the state of checkboxes.
    Then the "name" field should contain "Press Release"
    And the "title_label" field should contain "Title"
    Then the "node_options[status]" checkbox should not be checked
    Then the "node_options[promote]" checkbox should not be checked
    Then the "node_options[sticky]" checkbox should not be checked
    Then the "node_options[revision]" checkbox should be checked
    Then the "node_submitted" checkbox should not be checked

 @api @tfa @tfa-press-release @tfa-content
 Scenario: Create a press release node and view it as role "communications editor"
   Given I am logged in as a user with the "communications editor" role
   When I visit "/node/add/press-release"
   
   # Check for expected form elements.
   Then I should see an "#edit-title" element
   Then I should see an "#edit-field-teaser" element
   Then I should see an "#edit-body" element
   Then I should see an "#edit-field-subhead" element
   Then I should see an "#edit-field-boilerplate" element
   Then I should see an "#edit-field-date" element
   Then I should see an "#edit-field-contact-press-release" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-name-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-phone-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-email-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-company-pr-contact" element
   Then I should see an "#edit-field-city" element
   Then I should see an "#edit-field-state" element
   Then I should see an "#edit-field-additional-regions" element
   Then I should see an "#edit-field-attachment" element
   Then I should see an "#edit-field-author" element

   # Create a press release. 
   Then I should see the heading "Create Press Release"
   And I fill in the following:
     | Title *       | A Typical press release [autotest] |
     | Summary       | Aliquam placerat mauris sed |
     | Body          | <p>Aliquam placerat mauris sed pharetra eleifend.</p> |
     | Subhead       | subhead |
     | Name          | Morris |
     | Phone         | 1234567890 |
     | Email         | m@test.com |
     | Company       | TFA |
     | City *        | DC |

   And I fill in "field_additional_regions[und]" with "Alabama, Colorado, Connecticut"
   And I fill in "field_author[und][0][target_id]" with "Test Person"

   When I press "Save"
   
   # Check output of press release.
   Then I should see "A Typical press release [autotest]"
   Then I should see "Aliquam placerat mauris sed pharetra eleifend."
   Then I should see "subhead"
   Then I should see "Morris"
   Then I should see "1234567890"
   Then I should see "m@test.com"
   Then I should see "TFA"
   Then I should see "DC"
   Then I should see "About Teach For America"

 @api @tfa @tfa-press-release @tfa-content
 Scenario: Create a press release node and view it as role "super editor"
   Given I am logged in as a user with the "super editor" role
   When I visit "/node/add/press-release"
   
   # Check for expected form elements.
   Then I should see an "#edit-title" element
   Then I should see an "#edit-field-teaser" element
   Then I should see an "#edit-body" element
   Then I should see an "#edit-field-subhead" element
   Then I should see an "#edit-field-boilerplate" element
   Then I should see an "#edit-field-date" element
   Then I should see an "#edit-field-contact-press-release" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-name-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-phone-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-email-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-company-pr-contact" element
   Then I should see an "#edit-field-city" element
   Then I should see an "#edit-field-state" element
   Then I should see an "#edit-field-additional-regions" element
   Then I should see an "#edit-field-attachment" element
   Then I should see an "#edit-field-author" element

   # Create a press release. 
   Then I should see the heading "Create Press Release"
   And I fill in the following:
     | Title *       | A Typical press release [autotest] |
     | City *        | DC |
 
   And I fill in "field_additional_regions[und]" with "Alabama, Colorado, Connecticut"
   And I fill in "field_author[und][0][target_id]" with "Test Person"

   When I press "Save"
   
   # Check output of press release.
   Then I should see "A Typical press release [autotest]"
   Then I should see "DC"
 
 @api @tfa @tfa-press-release @tfa-content
 Scenario: Create a press release node and view it as role "administrator"
   Given I am logged in as a user with the "administrator" role
   When I visit "/node/add/press-release"
   
   # Check for expected form elements.
   Then I should see an "#edit-title" element
   Then I should see an "#edit-field-teaser" element
   Then I should see an "#edit-body" element
   Then I should see an "#edit-field-subhead" element
   Then I should see an "#edit-field-boilerplate" element
   Then I should see an "#edit-field-date" element
   Then I should see an "#edit-field-contact-press-release" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-name-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-phone-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-email-pr-contact" element
   Then I should see an "#edit-field-contact-press-release-und-0-field-company-pr-contact" element
   Then I should see an "#edit-field-city" element
   Then I should see an "#edit-field-state" element
   Then I should see an "#edit-field-additional-regions" element
   Then I should see an "#edit-field-attachment" element
   Then I should see an "#edit-field-author" element

   # Create a press release. 
   Then I should see the heading "Create Press Release"
   And I fill in the following:
     | Title *       | A Typical press release [autotest] |
     | City *        | DC |
 
   And I fill in "field_additional_regions[und]" with "Alabama, Colorado, Connecticut"
   And I fill in "field_author[und][0][target_id]" with "Test Person"

   When I press "Save"
   
   # Check output of press release.
   Then I should see "A Typical press release [autotest]"
   Then I should see "DC"
   Then I should see the link "Moderate"
   When I click "Moderate"
   Then I should see "This is the current revision. The current state is Draft."
   When I select "published" from "state"
   And I press "Apply"
   And I should see "This is the published revision."
