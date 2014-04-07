# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exam do
    student_name "Jim Bob"
    answers "1 A\n2 B\n3 C"
  end
end
