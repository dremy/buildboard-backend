Feature: TFA One Day Article (magazine-article)
  The TFA One Day Article bundle should behave per specification.

  # Pull Quote Paragraph one day editor
  @api @javascript @tfa @tfa-magazine-article
  Scenario: Create a media coverage node with pull quote paragraph and view it as role "one day editor"
    Given I am logged in as a user with the "one day editor" role
    When I visit "node/add/magazine-article"
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
      And I should see "One Day Article Pull Quote SubHead [autotest]"

  # Selection Paragraph one day editor
  @api @javascript @tfa @tfa-magazine-article
  Scenario: Create a media coverage node with selection paragraph and view it as role "one day editor"
    Given I am logged in as a user with the "one day editor" role
    When I visit "node/add/magazine-article"
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
      And I should see "One Day Article Selection SubHead [autotest]"

  @api @javascript @tfa @tfa-magazine-article
  Scenario: Verify one day editor can interact with paragraphs widgets
    Given I am logged in as a user with the "one day editor" role

    # Check the Full Bleed
    When I visit "node/add/magazine-article"

    Then I select "Full Bleed" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-scald-image-und-0-sid" to appear
    Then I should see "Paragraph type: Full Bleed"
      And I should see an "#edit-field-paragraphs-und-0-field-scald-image-und-0-sid" element
      And I should see an "#edit-field-paragraphs-und-0-actions-remove-button" element

    # Check the Image Filmstrip
    When I visit "node/add/magazine-article"

    Then  I select "Image Filmstrip" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-scald-images-und-0-sid" to appear
    Then I should see "Paragraph type: Image Filmstrip"
      And I should see an "#edit-field-paragraphs-und-0-field-scald-images-und-0-sid" element
      And I should see an "#edit-field-paragraphs-und-0-field-scald-images-und-1-sid" element
      And I should see an "#edit-field-paragraphs-und-0-field-scald-images-und-2-sid" element
      And I should see an "#edit-field-paragraphs-und-0-field-caption-und-0-value" element

    # Check the Pull Quote
    When I visit "node/add/magazine-article"

    Then  I select "Pull Quote" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-text-und-0-value" to appear
    Then I should see "Paragraph type: Pull Quote"
      And I should see an "#edit-field-paragraphs-und-0-field-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-quote-attribution-und-0-value" element

    # Check the Selection
    When I visit "node/add/magazine-article"

    Then I select "Selection" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-text-und-0-value" to appear
    Then I should see "Paragraph type: Selection"
      And I should see an "#edit-field-paragraphs-und-0-field-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-title-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-oneday-article-und-0-target-id" element
      And I should see an "#edit-field-paragraphs-und-0-field-pb-selection-alignment-und" element
      And I should see an "#edit-field-paragraphs-und-0-actions-remove-button" element

    # Check the Supplemental
    When I visit "node/add/magazine-article"

    Then I select "Supplemental" from "field_paragraphs_add_more_type"
      And I press "Add new Paragraph"
      And I wait for the paragraph element "#edit-field-paragraphs-und-0-field-text-und-0-value" to appear
    Then I should see "Paragraph type: Supplemental"
      And I should see an "#edit-field-paragraphs-und-0-field-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-title-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-supplemental-text-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-scald-image-und-0-sid" element
      And I should see an "#edit-field-paragraphs-und-0-field-supplemental-source-und-0-value" element
      And I should see an "#edit-field-paragraphs-und-0-field-pb-alignment-und" element
      And I should see an "#edit-field-paragraphs-und-0-field-pb-alignment-layout-und" element
      And I should see an "#edit-field-paragraphs-und-0-field-pb-full-bleed-layout-und" element


