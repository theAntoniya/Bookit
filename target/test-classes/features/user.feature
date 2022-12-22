Feature: User Verification

  Scenario: verify information about logged user
    Given I logged Bookit api as a "team-leader"
    When I sent get request to "/api/users/me" endpoint
    Then status code should be 200
    And content type is "application/json"
    And role is "student-team-leader"

  # API vs DB ---> Two point verification
  Scenario: verify information about logged user from api and database
    Given I logged Bookit api as a "team-member"
    When I sent get request to "/api/users/me" endpoint
    Then the information about current user from api and database should match


# API vs DB vs UI ---> Three point verification

  Scenario: three point/layer (UI,API,DATABASE)
    Given user logs in using "team-leader" credentials
    And user is on the my self page
    And I logged Bookit api as a "team-leader"
    When I sent get request to "/api/users/me" endpoint
    Then UI,API and Database user information must be match



  Scenario Outline: three point/layer (UI,API,DATABASE)
    Given user logs in using "<role>" credentials
    And user is on the my self page
    And I logged Bookit api as a "<role>"
    When I sent get request to "/api/users/me" endpoint
    Then UI,API and Database user information must be match

    Examples:
      | role        |
      | teacher     |
      | team-leader |
      | team-member |

