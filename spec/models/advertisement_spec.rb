require 'rails_helper'

RSpec.describe Advertisements, type: :model do
  let (:advertisements) { Advertisements.create! }

  describe "attributes" do
    it "should respond to title" do
      expect(advertisements).to respond_to(:title)
    end

    it "should respond to body" do
      expect(advertisements).to respond_to(:body)
    end

    it "should respond to price" do
      expect(advertisements).to respond_to(:price)
    end
  end
end
