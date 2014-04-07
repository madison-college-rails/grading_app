# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

exam = Exam.where(system: true).first_or_initialize
exam.update_attributes!(student_name: 'system', answers: "1 A\n2 B\n3 C\n4 D")
