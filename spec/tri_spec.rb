describe Tri do
  subject { Tri.new(*args) }

  context 'equilateral' do
    let(:args) {[1, 1, 1]}
    it 'recognizes' do
      expect(subject.type).to eq 'Equilateral'
    end
  end
end
