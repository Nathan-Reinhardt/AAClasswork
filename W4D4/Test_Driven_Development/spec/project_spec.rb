require 'project'

RSpec.describe "Tests" do
  describe "#my_uniq" do

    it "removes all non unique elements" do
      expect([1, 1, 1].my_uniq).to eq([1])
    end

    it "has elements in order that they appear" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end

    it "works on empty array" do
      expect([].my_uniq).to eq([])
    end

  end

  describe "#two_sum" do

    it "takes in an array and returns index pairs in order of original appearance" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "throws a type error when an error contains non-integers" do
      expect{["a", 1, "c"].two_sum}.to raise_error(TypeError)
    end

  end

  describe "#my_transpose" do
    
    it "takes in a 2D array" do
      expect([[1, 1], [2, 2]].my_transpose).to be_truthy
    end

    it "transposes the elements of a 2D array" do
      expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

  end

  describe "#stock_picker" do
    it "returns indices that yield highest profitability" do 
      expect([8.47, 6.91, 4.15, 5.65, 3.00, 7.49, 10.50].stock_picker).to eq([4, 6])
    end

    it "returns [] when there is no profitability" do
      expect([12, 11, 9, 6, 5, 4, 2].stock_picker).to eq([])
    end
    
  end

end

