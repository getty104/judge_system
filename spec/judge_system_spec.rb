require "spec_helper"

describe JudgeSystem do
	it "has a version number" do
		expect(JudgeSystem::VERSION).not_to be nil
	end

	it "compile ruby correctly" do
		expect(JudgeSystem.judge_result(lang: "rb", code: "n = gets\nputs n", answer: "2\n", stdin: "2", time: 5 ))
		.to eq 'AC'

		expect(JudgeSystem.judge_result(lang: "rb", code: "n = gets.to_i + 1\nputs n ", answer: "2\n", stdin: "2", time: 5 ))
		.to eq 'WA'

		expect(JudgeSystem.judge_result(lang: "c", code: "n = gets\nputs n ", answer: "2\n", stdin: "2", time: 5 ))
		.to eq 'RE'

		expect(JudgeSystem.judge_result(lang: "rb", code: "n = gets\nputs n", answer: "2\n", stdin: "2", time: 0.001 ))
		.to eq 'TLE'
	end

end

