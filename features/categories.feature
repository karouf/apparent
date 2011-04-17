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