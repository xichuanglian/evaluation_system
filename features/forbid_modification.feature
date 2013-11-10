Feature: Unmodifiable after submit

	As an office teacher
	So that the information in the form is stable
	I want to forbid modification once the form is submitted

Background: student have logged in and on the form page

	Given the following users exist:
	| name 		| job		| jobid 		| email 			|
	| Student 1 | Student 	| 2010010001	| student1@mail.com |
	| Student 2 | Student 	| 2010010002	| student2@mail.com |

	Given I have logged in as "Student 1"
	And "Student 1" have final submitted

Scenario: Redirect to show form page when visit fill form page
	When I visit student form page
	Then I should be on form page for student 2010010001