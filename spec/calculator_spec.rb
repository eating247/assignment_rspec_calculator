require 'calculator'

describe Calculator do 

  let(:calculator){Calculator.new}
  let(:string_calc){Calculator.new(true)}

  describe '@initialize' do
    it 'creates a Calculator' do
      expect(calculator).to be_a(Calculator)
    end

    it 'initializes with an empty memory' do
      expect(calculator.memory).to be_nil
    end

    it 'default initializes with a false stringify value' do
      expect(calculator.instance_variable_get(:@stringify)).to be false
    end

    it "initializes with a true stringify when true passed in" do
      expect(string_calc.instance_variable_get(:@stringify)).to be true
    end
  end

  describe '#add' do
    it "adds positive numbers" do
      expect(calculator.add(1,2)).to eq(3)
    end

    it "adds negative numbers" do
      expect(calculator.add(-1, -2)).to eq(-3)
    end

    it "adds positive and negative numbers" do
      expect(calculator.add(1,-2)).to eq(-1)
    end

    it "adds floats" do 
      expect(calculator.add(4.0, -3.0)).to eq(1.0)
    end
  end

  describe '#subtract' do
    it "subtracts positive and negative integers" do
      expect(calculator.subtract(-6, 3)).to eq(-9)
    end

    it "subtracts positive or negative floats" do
      expect(calculator.subtract(-6.0, 4.0)).to eq(-10)
    end
  end

  describe '#multiply' do
    it "multiplies numbers" do
      expect(calculator.multiply(5, 5)).to eq(25) 
    end
  end

  describe '#divide' do
    it "divides numbers" do
      expect(calculator.divide(25,5)).to eq(5)
    end

    it "raises an ArgumentError if second arg is 0" do
      expect{calculator.divide(4, 0)}.to raise_error(ArgumentError)
    end

    it "return an integer if there is no remainder" do 
      expect(calculator.divide(12, 3)).to eq(4)
    end

    it "returns a float if there is a remainder" do
      expect(calculator.divide(3,2)).to eq(1.5)
    end
  end

  describe '#pow' do
    it "raises numbers to their power" do
      expect(calculator.pow(2,3)).to eq(8)
    end

    it "raises numbers to their negative power" do
      expect(calculator.pow(4, -2)).to eq(1/16.to_f)
    end

    it "raises decimal numbers to their decimal power" do
      expect(calculator.pow(16, 0.5)).to eq(4)
    end
  end

  describe '#sqrt' do
    it "determines square roots for positive numbers" do
      expect(calculator.sqrt(25)).to eq(5)
    end

    it "raises errors for negative inputs" do
      expect{calculator.sqrt(-10)}.to raise_error(ArgumentError)
    end

    it "returns integers for round roots" do
      expect(calculator.sqrt(4)).to be_a(Integer)
    end

    it "returns 2-digit decimals for non-round roots" do
      expect(calculator.sqrt(2)).to eq(1.41)
    end
  end

  describe '#memory=' do
    before(:each) { calculator.memory = 212}
    
    it "stores an object in memory" do
      expect(calculator.memory).to eq(212)
    end

    it "overwrites any previous object in memory" do
      calculator.memory = 1000
      expect(calculator.memory).to eq(1000)
    end
  end

  describe '#memory' do
    it "returns the object in memory" do
      calculator.memory = 10
      expect(calculator.memory).to eq(10)
    end

    it "clears memory when returned" do
      expect(calculator.memory).to be_nil
    end
  end

  describe '#output, or stringify input' do

    it "outputs string for add function when stringify true" do
      expect(string_calc.add(3,3)).to be_a(String)
    end

    it "outputs string for subtract function when stringify true" do
      expect(string_calc.subtract(3,1)).to be_a(String)
    end

    it "outputs string for multiply function when stringify true" do
      expect(string_calc.multiply(10,10)).to be_a(String)
    end

    it "outputs string for divide function when stringify true" do
      expect(string_calc.divide(20,3)).to be_a(String)
    end

    it "outputs string for pow function when stringify true" do
      expect(string_calc.pow(2, 10)).to be_a(String)
    end

    it "outputs string for sqrt function when stringify true" do
      expect(string_calc.sqrt(144)).to be_a(String)
    end
  end

#class ends here
end