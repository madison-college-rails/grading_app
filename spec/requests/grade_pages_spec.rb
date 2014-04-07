require 'spec_helper'

describe "GradePages" do
  describe 'uploading a new exam to grade' do
    before { visit root_path }

    it 'has a create button' do
      expect(page).to have_button('Create')
    end
  end
end
