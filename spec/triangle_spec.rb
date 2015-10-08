describe Triangle do
  subject { Triangle.new(*args).type }

  context 'equilateral' do
    let(:args) {[1, 1, 1]}
    it 'recognizes Equilateral' do
      expect(subject).to eq 'Equilateral'
    end
  end

  context 'isosceles' do
    let(:args) {[1, 2, 2]}
    it 'recognizes Isosceles' do
      expect(subject).to eq 'Isosceles'
    end
  end

  context 'right triangle' do
    let(:args) {[3, 4, 5]}
    it 'recognizes Right' do
      expect(subject).to eq 'Right'
    end
  end

  context 'scalene' do
    let(:args) {[3, 4, 6]}
    it 'recognizes Scalene' do
      expect(subject).to eq 'Scalene'
    end
  end

  context 'with an invalid triangle' do
    context 'with one super long side' do
      let(:args) {[1, 1, 10]}
      it 'recognizes NotATriangle' do
        expect(subject).to eq 'NotATriangle'
      end
    end

    context 'with a side equal to the sum of the other two sides' do
      let(:args) {[1, 1, 2]}
      it 'recognizes NotATriangle' do
        expect(subject).to eq 'NotATriangle'
      end
    end
  end
end
