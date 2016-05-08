Feature: TFA Contact Us
  As a visitor,
  I want to fill out the contact form
  So that I can communicate with Teach for America

  @api @tfa @tfa-content @tfa-contact
  Scenario: Fill out the contact us form
    Given I visit "/contact-us"
    And I fill in the following:
      | First name                 | Bart                                                 |
      | Last name                  | Simpson                                              |
      | Email address              | homer@test.dev                                       |
      | Verify Email address       | homer@test.dev                                       |
      | Reason for contacting us   | blogfeedback@teachforamerica.org                     |
      | Subject                    | Doh!                                                 |
      | Message                    | All work and no play make homer something something. |
    When I press "Submit"
    Then I should see "Thank you for contacting us."
    And 1 email should be sent:
      | To                               | Subject |
      | admin@teachforamerica.org        | Doh!    |
      | blogfeedback@teachforamerica.org | Doh!    |

  Scenario: Fill out the contact us form and send to myself
    Given I visit "/contact-us"
    And I fill in the following:
      | First name                 | Bart                                                 |
      | Last name                  | Simpson                                              |
      | Email address              | homer@test.dev                                       |
      | Verify Email address       | homer@test.dev                                       |
      | Reason for contacting us   | blogfeedback@teachforamerica.org                     |
      | Subject                    | Doh!                                                 |
      | Message                    | All work and no play make homer something something. |
      | Send me a copy             | 1                                                    |
    When I press "Submit"
    Then I should see "Thank you for contacting us."
    And 1 email should be sent:
      | To                               | Subject |
      | admin@teachforamerica.org        | Doh!    |
      | blogfeedback@teachforamerica.org | Doh!    |
      | homer@test.dev                   | Doh!    |

  Scenario: Fill out the contact us form and mess up my email
    Given I visit "/contact-us"
    And I fill in the following:
      | First name                 | Bart                                                 |
      | Last name                  | Simpson                                              |
      | Email address              | homer@test.dev                                       |
      | Verify Email address       | nomer@test.dev                                       |
      | Reason for contacting us   | blogfeedback@teachforamerica.org                     |
      | Subject                    | Doh!                                                 |
      | Message                    | All work and no play make homer something something. |
      | Send me a copy             | 1                                                    |
    When I press "Submit"
    Then I should not see the text "Thank you for contacting us."
