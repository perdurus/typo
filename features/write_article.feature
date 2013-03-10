Feature: Write Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to add articles to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully write articles
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"

###########################################################################################
  Scenario: A non-admin cannot merge articles
    Given I am on user logout page 
    When I fill in "user_login" with "no_admin"
    And I fill in "user_password" with "bbbbbbbb"
    And I press "Login"
    Then I should be on the admin page	
    When I follow "New Article"
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "Foobar"
    Then I should not see "Merge Articles"

  Scenario: The merged article should contain the text of both previous articles
    Given I am on user logout page 
    When I fill in "user_login" with "admin"
    And I fill in "user_password" with "aaaaaaaa"
    And I press "Login"
    Then I should be on the admin page	
    When I follow "New Article"
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "New Article"
    And I fill in "article_title" with "Foobar 2"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum 2"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "Foobar"
    And I merge "Foobar" with "Foobar 2"
    And I press "Merge" 
    Then I should be on the admin content page
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
    And I should see "Lorem Ipsum 2"

  Scenario: The merged article should have one author
    Given I am on user logout page 
    When I fill in "user_login" with "no_admin"
     And I fill in "user_password" with "bbbbbbbb"
    And I press "Login"
    Then I should be on the admin page
    When I follow "New Article"
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "Log out"
    Then I should be on user login page 
    When I fill in "user_login" with "admin"
    And I fill in "user_password" with "aaaaaaaa"
    And I press "Login"
    Then I should be on the admin page
    When I follow "New Article"
    And I fill in "article_title" with "Foobar 2"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum 2"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "Foobar"
    And I merge "Foobar" with "Foobar 2"
    And I press "Merge" 
    Then I should see "admin"
    And I should not see "no_admin"

  Scenario:The title of the new article should be the title from either one of the merged articles.
    Given I am on user logout page 
    When I fill in "user_login" with "admin"
    And I fill in "user_password" with "aaaaaaaa"
    And I press "Login"
    Then I should be on the admin page
    When I follow "New Article"
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "New Article"
    And I fill in "article_title" with "Foobar 2"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum 2"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "Foobar"
    And I merge "Foobar" with "Foobar 2"
    And I press "Merge" 
    Then I should see "Foobar"
    And I should not see "Foobar 2"

#  Scenario: The form field containing the ID merge_with
#    Given I am on user logout page 
#    When I fill in "user_login" with "admin"
#    And I fill in "user_password" with "aaaaaaaa"
#    And I press "Login"
#    Then I should be on the admin page	
#    When I follow "New Article"
#    When I fill in "article_title" with "Foobar"
#    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
#    And I press "Publish"
#    Then I should be on the admin content page
#    When I follow "Foobar"
#    Then I should see "merge_with"

  Scenario: New category
    Given I am on user logout page 
    When I fill in "user_login" with "admin"
    And I fill in "user_password" with "aaaaaaaa"
    And I press "Login"
    Then I should be on the admin page	
    When I follow "Categories"
    And I fill in "category_name" with "New Category"
    And I fill in "category_keywords" with "keyword, list"
    And I fill in "category_permalink" with "Permanlink"
    And I fill in "category_description" with "New description"
    And I press "Save" 
    Then I should see "New Category"

  Scenario: Edit category
    Given I am on user logout page 
    When I fill in "user_login" with "admin"
    And I fill in "user_password" with "aaaaaaaa"
    And I press "Login"
    Then I should be on the admin page	
    When I follow "Categories"
    And I fill in "category_name" with "Edit Category"
    And I fill in "category_keywords" with "keyword, list"
    And I fill in "category_permalink" with "Permanlink"
    And I fill in "category_description" with "Edit description"
    And I press "Save" 
    And I fill in "category_name" with "Edit Category 2"
    And I fill in "category_keywords" with "keyword, list, edit"
    And I fill in "category_permalink" with "Permanlink 2"
    And I fill in "category_description" with "New description 2"
    And I press "Save" 
    Then I should see "Edit Category 2"
    And I should see "keyword, list, edit"
    And I should see "Permanlink 2"
    And I should see "New description 2"

