class Exam < ActiveRecord::Base
  ANSWER_PATTERN = /\A(?<number>\d+)\.?\s+(?<answer>[a-z])/i

  def self.system_exam
    where(system: true).first
  end

  def to_answers_hash
    @to_answers_hash ||= answers.split("\n").each_with_object({}) do |line, memo|
      line = line.strip
      next unless line.present?

      match = line.match(ANSWER_PATTERN)

      next unless match

      memo[match[:number].to_i] = match[:answer]
    end
  end

  def grade
    graded = Exam.system_exam.to_answers_hash.each_with_object({}) do |number_answer, memo|
      number, answer = number_answer

      memo[number] = to_answers_hash[number] == answer
    end

    correct = graded.select { |k, v| v == true }

    correct.count * 100.0 / Exam.system_exam.to_answers_hash.count
  end
end
