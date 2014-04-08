require 'spec_helper'

describe "Exams" do
  before { create :exam, system: true, answers: "1 C\n2 B"}

  describe 'can be created' do
    before { visit root_path }

    let(:exam) { build :exam, answers: "1 A\n2 B" }

    it 'and are graded upon submission' do
      fill_in 'Student name', with: exam.student_name
      fill_in 'Answers', with: exam.answers
      click_button 'Create Exam'

      expect(page).to have_content 'Your grade is 50.0'
    end
  end
end
