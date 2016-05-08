Feature: Visuals
  As an author,
  I want to create a chart
  So that a site visitor can visualize data in a meaningful way

  @api @tfa @tfa-content @visuals
  Scenario: Set a default charting library
    Given I am logged in as a user with the "system administrator" role
    When I visit "/admin/config/content/visuals"
    Then I should see the heading "Visuals settings"
    When I select the radio button "HighCharts"
    And I press "Save configuration"
    Then I should see "The configuration options have been saved."

  @api @javascript @tfa @tfa-content @visuals
  Scenario: Create a chart
    Given I am logged in as a user with the "system administrator" role
    When I visit "/admin/structure/visuals/manage/add"
    Then I should see "Visuals"
    When I fill in "title" with "My graph"
    And I select the radio button "Bar"
    And I fill in "data" with:
      """
      January,4
      February, 7
      March, 8
      April, 3
      May,  9
      June, 12
      July,2
      """
    And I press "Save"
    Then I should see "Bar"
    Then I should see "Visuals Graph: My Graph"

  # Pro-tip: Do NOT interact with the IPE while this test is running.
  #   The test will fail because only one user can play with it
  #   at a time.
  @api @javascript @tfa @tfa-content @visuals
  Scenario: Place chart via panels
    Given I am logged in as a user with the "system administrator" role
    And I visit "/d/front"
    When I customize this page with the Panels IPE
    And I click "Add new pane"
    And I click "Visuals" in the "Panels Category Box"
    Then I click "Visuals Block"
    Then I should see "Graph to display"
    And I should see "Configure new Visuals Block"
    When I press the "m" key in the "edit-visuals-pane-graph" field
    And I press the "down" key in the "edit-visuals-pane-graph" field
    And I press the "tab" key in the "edit-visuals-pane-graph" field
    And I press "Finish"
    And I wait for live preview to finish
    # I really have to figure out how to make behat read the charts or throw
    # some text down there.  I figure I throw this in so when we fix the theme
    # behat will throw an error to trigger me to revisit this.
    Then I should see "Secondary menu"
