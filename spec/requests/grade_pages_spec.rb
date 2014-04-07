require 'spec_helper'

describe "Exams" do
  describe 'can be created' do
    before { visit root_path }

    let(:exam) { build :exam }

    it 'has a create button' do
      fill_in 'Student name', with: exam.student_name
      fill_in 'Answers', with: exam.answers
      click_button 'Create Exam'

      expect(page).to have_content 'Your grade is'
    end
  end
end
