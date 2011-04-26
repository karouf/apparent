Feature: Categories
  In order organize my inventory
  As a user
  I want to manage all the different categories


Scenario: List categories
	Given there is the following category records
    | name					|
    | Helmet				|
		| Shoulder pads	|
	And I am on the categories page
  Then I should see "Helmet"
	And I should see "Shoulder pads"
	
Scenario: Create a category
	Given there is the following category records
		| name					|
    | Helmet				|
	And I am on the categories page
	Then I should see "Helmet"
	When I go to the new category page
	And I fill in "Name" with "Shoulder pads"
	And I press "Create"
	Then I should be on the categories page
	And I should see "Helmet"
	And I should see "Shoulder pads"

Scenario: Edit a category
	Given there is the following category records
		| name					|
	  | Helmet				|
	And I am on the categories page
	When I follow "Helmet"
	And I fill in "Name" with "Shoulder pads"
	And I press "Update"
	Then I should be on the categories page
	And I should see "Shoulder pads"

Scenario: Delete a category
	Given there is the following category records
		| name					|
	  | Helmet				|
	And I am on the categories page
	When I follow "delete" within "li"
	Then I should be on the categories page
	And I should not see "Helmet"
