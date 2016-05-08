Feature: TFA One Day Article (magazine-article)
  The TFA One Day Article bundle should behave per specification.

  @api @tfa @tfa-magazine-article
  Scenario: Create a media coverage node and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"

    Then I should see the heading "Create One Day Article"
    # Check for expected form elements.
    Then I should see an "#edit-title" element
      And I should see an "#edit-field-subhead-und-0-value" element
      And I should see an "#edit-field-scald-image-und-0-sid" element
      And I should see an "#edit-field-teaser-und-0-value" element
      And I should see an "#edit-field-author-und-0-target-id" element
      And I should see an "#edit-field-date-und-0-value-datepicker-popup-0" element
      And I should see an "#edit-field-oneday-article-format-und" element
      And I should see an "#edit-field-additional-regions-und" element
      And I should see an "#edit-field-oneday-edition-und-0-target-id" element
      And I should see an "#edit-field-attachment-und-0-upload" element
      And I should see an "#edit-field-oneday-tags-und" element
      And I should see an "#edit-field-section-und" element

  @api @javascript @tfa @tfa-magazine-article
  Scenario: Checking paragraph fields
    Given I am logged in as a user with the "administrator" role

    # Check the Full Bleed
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"
    
    Then I select "Full Bleed" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-scald-image-und-0-sid" to appear
    Then I should see "Paragraph type: Full Bleed"
      And I should see an "#edit-field-paragraphs-und-0-field-scald-image-und-0-sid" element
      And I should see an "#edit-field-paragraphs-und-0-actions-remove-button" element

    # Check the Selection
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"
    
    Then I select "Selection" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-text-und-0-value" to appear
    Then I should see "Paragraph type: Selection"
      And I should see an "#edit-field-paragraphs-und-0-field-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-title-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-oneday-article-und-0-target-id" element
      And I should see an "#edit-field-paragraphs-und-0-field-pb-selection-alignment-und" element
      And I should see an "#edit-field-paragraphs-und-0-actions-remove-button" element

    # Check the Content List
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"
    
    Then I select "Content list" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-pp-title-und-0-value" to appear
    Then I should see "Paragraph type: Content list"
      And I should see an "#edit-field-paragraphs-und-0-pp-title-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-pp-view-mode-und" element
      And I should see an "#edit-field-paragraphs-und-0-pp-items-node-und-0-target-id" element
      And I should see an "#edit-field-paragraphs-und-0-pp-items-node-und-add-more" element
      And I should see an "#edit-field-paragraphs-und-0-actions-remove-button" element

    # Check The Pull Quote.
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"

    Then I select "Pull Quote" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-text-und-0-value" to appear
    Then I should see "Paragraph type: Pull Quote"
      And I should see an "#edit-field-paragraphs-und-0-field-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-quote-attribution-und-0-value" element
  
    # Check the Taxonomy term list.
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"

    Then I select "Taxonomy term list" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-pp-title-und-0-value" to appear
    Then I should see "Paragraph type: Taxonomy term list"
      And I should see an "#edit-field-paragraphs-und-0-pp-title-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-pp-view-mode-und" element
      And I should see an "#edit-field-paragraphs-und-0-pp-items-taxonomy-term-und-0-target-id" element
      And I should see an "#edit-field-paragraphs-und-0-pp-items-taxonomy-term-und-add-more" element
      And I should see an "#edit-field-paragraphs-und-0-actions-remove-button" element

  # Content Paragraph administrator
  @api @javascript @tfa @tfa-magazine-article
  Scenario: Create a media coverage node with content paragraph and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"
    And I fill in "title" with "One Day Article Content Paragraph [autotest]"
    And I fill in "field_subhead[und][0][value]" with "One Day Article Content Paragraph SubHead [autotest]"
    And I fill in "field_teaser[und][0][value]" with "Teaser-Aliquam placerat mauris sed pharetra eleifend."
    And I fill in "field_author[und][0][target_id]" with "Test Person -- teachforamerica.org(l39310/node/28400)"
    And I fill in "field_date[und][0][value][date]" with "Jan 1 2016"
    And I set "select" "field_oneday_article_category[und]" element visible
    And I select "3314" from "field_oneday_article_category[und]"
    And I set "select" "field_oneday_article_format[und]" element visible
    And I select "Photo" from "field_oneday_article_format[und]"
    And I fill in "field_additional_regions[und]" with "Colorado"
    And I fill in "field_oneday_edition[und][0][target_id]" with "Fall 2013 - The Native Education Issue"
    And I fill in "field_oneday_tags[und]" with "Alternative Education"
    And I press "Add new Paragraph"
    And I wait for the paragraph element "#edit-field-paragraphs-und-0-pp-title-und-0-value" to appear
    Then I should see "Paragraph type: Content"
      And I should see an "#edit-field-paragraphs-und-0-pp-title-und-0-value" element
    Then I fill in "field_paragraphs[und][0][pp_title][und][0][value]" with "Paragraphs [autotest]"
    And I fill in "field_paragraphs[und][0][pp_body][und][0][value]" with "Paragraph-Aliquam placerat mauris sed pharetra eleifend."
    Then I press "Save"
    Then I should see "One Day Article Content Paragraph [autotest]"
      And I click "Close"
      And I should see "One Day Article Content Paragraph SubHead [autotest]" in the ".pane-node-field-subhead" element
    
  # Content List Paragraph administrator
  @api @javascript @tfa @tfa-magazine-article
  Scenario: Create a media coverage node with content list paragraph and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"
    And I fill in "title" with "One Day Article Content List [autotest]"
    And I fill in "field_subhead[und][0][value]" with "One Day Article Content List SubHead [autotest]"
    And I fill in "field_teaser[und][0][value]" with "Teaser-Aliquam placerat mauris sed pharetra eleifend."
    And I fill in "field_author[und][0][target_id]" with "Test Person -- teachforamerica.org(l39310/node/28400)"
    And I fill in "field_date[und][0][value][date]" with "Jan 1 2016"
    And I set "select" "field_oneday_article_category[und]" element visible
    And I select "3314" from "field_oneday_article_category[und]"
    And I set "select" "field_oneday_article_format[und]" element visible
    And I select "Photo" from "field_oneday_article_format[und]"
    And I fill in "field_additional_regions[und]" with "Colorado"
    And I fill in "field_oneday_edition[und][0][target_id]" with "Fall 2013 - The Native Education Issue"
    And I fill in "field_oneday_tags[und]" with "Alternative Education"
    Then I select "Content list" from "field_paragraphs_add_more_type"
    And I press "Add new Paragraph"
    And I wait for the paragraph element "#edit-field-paragraphs-und-0-pp-title-und-0-value" to appear
    Then I should see "Paragraph type: Content list"
      And I should see an "#edit-field-paragraphs-und-0-pp-title-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-pp-view-mode-und" element
      And I should see an "#edit-field-paragraphs-und-0-pp-items-node-und-0-target-id" element
    Then I fill in "field_paragraphs[und][0][pp_title][und][0][value]" with "Content list paragraph [autotest]"
      And I select "Default" from "field_paragraphs[und][0][pp_view_mode][und]"
      And I fill in "field_paragraphs[und][0][pp_items_node][und][0][target_id]" with "You Served For America, Now Teach For America"
    Then I press "Save"
    Then I should see "One Day Article Content List [autotest]"
      And I click "Close"
      And I should see "One Day Article Content List SubHead [autotest]" in the ".pane-node-field-subhead" element
      And I should see "Content list paragraph [autotest]" in the ".paragraphs-items-field-paragraphs .field-item" element
    
  # Pull Quote Paragraph administrator
  @api @javascript @tfa @tfa-magazine-article
  Scenario: Create a media coverage node with pull quote paragraph and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"
    And I fill in "title" with "One Day Article Pull Quote [autotest]"
    And I fill in "field_subhead[und][0][value]" with "One Day Article Pull Quote SubHead [autotest]"
    And I fill in "field_teaser[und][0][value]" with "Teaser-Aliquam placerat mauris sed pharetra eleifend."
    And I fill in "field_author[und][0][target_id]" with "Test Person -- teachforamerica.org(l39310/node/28400)"
    And I fill in "field_date[und][0][value][date]" with "Jan 1 2016"
    And I set "select" "field_oneday_article_category[und]" element visible
    And I select "3314" from "field_oneday_article_category[und]"
    And I set "select" "field_oneday_article_format[und]" element visible
    And I select "Photo" from "field_oneday_article_format[und]"
    And I fill in "field_additional_regions[und]" with "Colorado"
    And I fill in "field_oneday_edition[und][0][target_id]" with "Fall 2013 - The Native Education Issue"
    And I fill in "field_oneday_tags[und]" with "Alternative Education"
    Then I select "Pull Quote" from "field_paragraphs_add_more_type"
    And I press "Add new Paragraph"
    And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-text-und-0-value" to appear
    Then I should see "Paragraph type: Pull Quote"
      And I should see an "#edit-field-paragraphs-und-0-field-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-quote-attribution-und-0-value" element
    Then I fill in "field_paragraphs[und][0][field_text][und][0][value]" with "Create One Day Article Pull Quote [autotest]"
      And I fill in "field_paragraphs[und][0][field_quote_attribution][und][0][value]" with "Test Person [autotest]"
    Then I press "Save"
    Then I should see "One Day Article Pull Quote [autotest]"
      And I click "Close"
      And I should see "One Day Article Pull Quote SubHead [autotest]" in the ".pane-node-field-subhead" element

  # Selection Paragraph administrator
  @api @javascript @tfa @tfa-magazine-article
  Scenario: Create a media coverage node with selection paragraph and view it as role "administrator"
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add"
      And I should see the link "One Day Article"
    When I follow "One Day Article"
    And I fill in "title" with "One Day Article Selection [autotest]"
    And I fill in "field_subhead[und][0][value]" with "One Day Article Selection SubHead [autotest]"
    And I fill in "field_teaser[und][0][value]" with "Teaser-Aliquam placerat mauris sed pharetra eleifend."
    And I fill in "field_author[und][0][target_id]" with "Test Person -- teachforamerica.org(l39310/node/28400)"
    And I fill in "field_date[und][0][value][date]" with "Jan 1 2016"
    And I set "select" "field_oneday_article_category[und]" element visible
    And I select "3314" from "field_oneday_article_category[und]"
    And I set "select" "field_oneday_article_format[und]" element visible
    And I select "Photo" from "field_oneday_article_format[und]"
    And I fill in "field_additional_regions[und]" with "Colorado"
    And I fill in "field_oneday_edition[und][0][target_id]" with "Fall 2013 - The Native Education Issue"
    And I fill in "field_oneday_tags[und]" with "Alternative Education"
    Then I select "Selection" from "field_paragraphs_add_more_type"
    And I press "Add new Paragraph"
    And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-text-und-0-value" to appear
    Then I should see "Paragraph type: Selection"
      And I should see an "#edit-field-paragraphs-und-0-field-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-title-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-oneday-article-und-0-target-id" element
    Then I set "textarea" "field_paragraphs[und][0][field_text][und][0][value]" element visible  
    Then I fill in "field_paragraphs[und][0][field_text][und][0][value]" with "Selection Aliquam placerat mauris sed pharetra eleifend [autotest]."
      And I fill in "field_paragraphs[und][0][field_title][und][0][value]" with "Create One Day Article Selection [autotest]"
    Then I press "Save"
    Then I should see "One Day Article Selection [autotest]"
      And I click "Close"
      And I should see "One Day Article Selection SubHead [autotest]" in the ".pane-node-field-subhead" element

