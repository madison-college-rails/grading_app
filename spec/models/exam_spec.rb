require 'spec_helper'

describe Exam do
  let!(:system_exam) { create :exam, system: true, student_name: 'system', answers: "1 A\n2 B\n3 C\n4 D" }

  describe '#to_answers_hash' do
    let(:exam) { build :exam, answers: "1 A\n2 B\n3 C" }

    it 'is a hash of the answers keyed by number' do
      expect(exam.to_answers_hash).to eq({ 1 => 'A', 2 => 'B', 3 => 'C' })
    end
  end

  describe '#grade' do
    context 'when there is an exam with the correct answers' do
      let(:exam) { build :exam, answers: system_exam.answers }

      it 'is 100' do
        expect(exam.grade).to eq 100.0
      end
    end

    context 'when there is an exam with 3/4 of the correct answers' do
      let(:exam) { build :exam, answers: "1 A\n2 B\n3 C" }

      it 'is 75' do
        expect(exam.grade).to eq 75.0
      end
    end
  end
end
