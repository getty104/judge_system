require 'spec_helper'

describe JudgeSystem do
  it 'has a version number' do
    expect(JudgeSystem::VERSION).not_to be nil
  end

  it 'compile ruby correctly' do
    expect(JudgeSystem.judge_result(lang: 'rb', code: rb_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'AC'

    expect(JudgeSystem.judge_result(lang: 'rb', code: rb_code, answer: "1\n", stdin: '2', time: 5))
      .to eq 'WA'

    expect(JudgeSystem.judge_result(lang: 'c', code: rb_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'

    expect(JudgeSystem.judge_result(lang: 'rb', code: rb_code, answer: "2\n", stdin: '2', time: 0.001))
      .to eq 'TLE'
  end

  it 'compile c++ correctly' do
    expect(JudgeSystem.judge_result(lang: 'cpp', code: cpp_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'AC'

    expect(JudgeSystem.judge_result(lang: 'cpp', code: cpp_code, answer: "1\n", stdin: '2', time: 5))
      .to eq 'WA'

    expect(JudgeSystem.judge_result(lang: 'rb', code: cpp_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'

    expect(JudgeSystem.judge_result(lang: 'cpp', code: cpp_code, answer: "2\n", stdin: '2', time: 0.001))
      .to eq 'TLE'
  end

  it 'compile c correctly' do
    expect(JudgeSystem.judge_result(lang: 'c', code: c_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'AC'

    expect(JudgeSystem.judge_result(lang: 'c', code: c_code, answer: "1\n", stdin: '2', time: 5))
      .to eq 'WA'

    expect(JudgeSystem.judge_result(lang: 'rb', code: c_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'

    expect(JudgeSystem.judge_result(lang: 'c', code: c_code, answer: "2\n", stdin: '2', time: 0.001))
      .to eq 'TLE'
  end

  it 'compile go correctly' do
    expect(JudgeSystem.judge_result(lang: 'go', code: go_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'AC'

    expect(JudgeSystem.judge_result(lang: 'go', code: go_code, answer: "1\n", stdin: '2', time: 5))
      .to eq 'WA'

    expect(JudgeSystem.judge_result(lang: 'rb', code: go_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'

    expect(JudgeSystem.judge_result(lang: 'go', code: go_code, answer: "2\n", stdin: '2', time: 0.001))
      .to eq 'TLE'
  end

  it 'compile python correctly' do
    expect(JudgeSystem.judge_result(lang: 'py', code: py_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'AC'

    expect(JudgeSystem.judge_result(lang: 'py', code: py_code, answer: "1\n", stdin: '2', time: 5))
      .to eq 'WA'

    expect(JudgeSystem.judge_result(lang: 'rb', code: py_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'

    expect(JudgeSystem.judge_result(lang: 'py', code: py_code, answer: "2\n", stdin: '2', time: 0.001))
      .to eq 'TLE'
  end

  it 'compile swift correctly' do
    expect(JudgeSystem.judge_result(lang: 'swift', code: swift_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'AC'

    expect(JudgeSystem.judge_result(lang: 'swift', code: swift_code, answer: "1\n", stdin: '2', time: 5))
      .to eq 'WA'

    expect(JudgeSystem.judge_result(lang: 'rb', code: swift_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'

    expect(JudgeSystem.judge_result(lang: 'swift', code: swift_code, answer: "2\n", stdin: '2', time: 0.001))
      .to eq 'TLE'
  end

  it 'compile haskell correctly' do
    expect(JudgeSystem.judge_result(lang: 'hs', code: hs_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'AC'

    expect(JudgeSystem.judge_result(lang: 'hs', code: hs_code, answer: "1\n", stdin: '2', time: 5))
      .to eq 'WA'

    expect(JudgeSystem.judge_result(lang: 'rb', code: hs_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'

    expect(JudgeSystem.judge_result(lang: 'hs', code: hs_code, answer: "2\n", stdin: '2', time: 0.001))
      .to eq 'TLE'
  end

  it 'run safely' do
    expect(JudgeSystem.judge_result(lang: 'rb', code: dangerous_code, answer: "2\n", stdin: '2', time: 5))
      .to eq 'RE'
  end

  it "can't use serious methods" do
    expect { JudgeSystem::WandBox.run('rb', dangerous_code, '2', 5) }
      .to raise_error NoMethodError

    expect { JudgeSystem::WandBox.compile(lang: 'rb', code: dangerous_code, stdin: '2') }
      .to raise_error NoMethodError
  end
end
