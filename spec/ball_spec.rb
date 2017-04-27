require 'yaml' #требую
require_relative '../ball' #требую_ родителя 

RSpec.describe Ball do #РСпек.Описать мяч
  let(:answers) { YAML.load_file(File.join(__dir__, '../answers.yml')) } # Дать:(ответ) {ЙАМЛ. загрузить_файл(Файл. присоеденить(_дир_) - файл

  it { expect(answers).to include(subject.shake) } #это {ожидать(наследует) ( ответ). включает в себя(предмет.трясти)}
  it { expect(answers).to eql(Ball::ANSWERS) }# это {наследует(ответ) eql это по ходу равно (Мяч::Ответ)

  describe '#shake' do #описать трясти
    before { stub_const('Ball::ANSWERS', ['ANSWER']) } # до мяч ответ (ответ)

    it 'prints colorized answer' do # тут цвет
      expect(STDOUT).to receive(:puts).with("\e[31mANSWER\e[0m")
      subject.shake
    end
  end
end
