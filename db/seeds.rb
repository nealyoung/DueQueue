# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:first_name => 'Nealon', :last_name => 'Young', :email => 'nealony@uci.edu', :password => 'asdf', :password_confirmation => 'asdf')
User.create(:first_name => 'Michael', :last_name => 'Bulotano', :email => 'mbulotan@uci.edu', :password => 'asdf', :password_confirmation => 'asdf')
User.create(:first_name => 'Lance', :last_name => 'Mar', :email => 'lcmar@uci.edu', :password => 'asdf', :password_confirmation => 'asdf')

Course.create(:department => 'COMPSCI', :number => '112', :created_by => 3)
Course.create(:department => 'COMPSCI', :number => '116', :created_by => 3)
Course.create(:department => 'COMPSCI', :number => '121', :created_by => 3)
Course.create(:department => 'COMPSCI', :number => '122A', :created_by => 3)
Course.create(:department => 'COMPSCI', :number => '122B', :created_by => 1)
Course.create(:department => 'COMPSCI', :number => '141', :created_by => 3)
Course.create(:department => 'I&C SCI', :number => '6B', :created_by => 1)
Course.create(:department => 'I&C SCI', :number => '31', :created_by => 3)
Course.create(:department => 'I&C SCI', :number => '32', :created_by => 3)
Course.create(:department => 'I&C SCI', :number => '33', :created_by => 3)
Course.create(:department => 'I&C SCI', :number => '62', :created_by => 3)
Course.create(:department => 'I&C SCI', :number => '77B', :created_by => 3)
Course.create(:department => 'I&C SCI', :number => '77D', :created_by => 3)
Course.create(:department => 'I&C SCI', :number => '139W', :created_by => 1)
Course.create(:department => 'IN4MATX', :number => '43', :created_by => 3)
Course.create(:department => 'IN4MATX', :number => '101', :created_by => 3)
Course.create(:department => 'IN4MATX', :number => '115', :created_by => 3)
Course.create(:department => 'IN4MATX', :number => '123', :created_by => 3)
Course.create(:department => 'IN4MATX', :number => '124', :created_by => 3)

Assignment.create(:title => 'Project 1', :notes => 'JDBC Connections', :due => '2013-1-21', :course_id => 5)
Assignment.create(:title => 'Project 2', :notes => 'Java EE Web Applications', :due => '2013-2-8', :course_id => 5)
Assignment.create(:title => 'Project 3', :notes => 'MySQL User Management', :due => '2013-2-20', :course_id => 5)
Assignment.create(:title => 'Project 4', :notes => 'XML and AJAX', :due => '2013-3-4', :course_id => 5)
Assignment.create(:title => 'Project 5', :notes => 'Android Applications', :due => '2013-3-18', :course_id => 5)

Assignment.create(:title => 'Homework 1', :notes => 'SIMPLESEM Parsing', :due => '2013-2-1', :course_id => 6)
Assignment.create(:title => 'Homework 2', :notes => 'SIMPLESEM Semantics', :due => '2013-2-14', :course_id => 6)
Assignment.create(:title => 'Homework 3', :notes => 'C1-C4'' Conversions', :due => '2013-2-28', :course_id => 6)

Assignment.create(:title => 'Resume Draft', :notes => 'In-class peer review on Thursday', :due => '2013-1-17', :course_id => 14)
Assignment.create(:title => 'Resume Final', :notes => 'SIMPLESEM Parsing',  :due => '2013-1-22', :course_id => 14)
Assignment.create(:title => 'Personal Statement Draft', :notes => 'Bring paper copy to class', :due => '2013-1-29', :course_id => 14)
Assignment.create(:title => 'Personal Statement Final', :notes => 'SIMPLESEM Parsing',  :due => '2013-2-12', :course_id => 14)
Assignment.create(:title => 'Pitch Presentation', :notes => 'Submit slides to EEE Dropbox by 12:20AM day of presentation', :due => '2013-2-14', :course_id => 14)
Assignment.create(:title => 'Wikipedia Draft', :notes => 'SIMPLESEM Parsing',  :due => '2013-2-12', :course_id => 14)
