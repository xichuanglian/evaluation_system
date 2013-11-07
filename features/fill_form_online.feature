Feature: Filling in evaluation form online

	As a office teacher
	So that I won't have to hand out and collect paper forms
	I want students and mentors fill in the form online

Background: student have logged in and on the form page

	Given the following users exist:
	| name 		| job		| jobid 		| email 			|
	| Student 1 | Student 	| 2010010001	| student1@mail.com |
	| Student 2 | Student 	| 2010010002	| student2@mail.com |

	And I have logged in as "Student 1"

Scenario: Display user name and id
	When I am on student form page
	Then I should see "Student 1" in text field "Name"
	And I should see "2010010001" in text field "Student ID"

Scenario: Save the filled form
	When I am on student form page
	And I filled text field "Education" with "My Education"
	And I press button "Save"
	Then I should see "My Education" in text field "Education"