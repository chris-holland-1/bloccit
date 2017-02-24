require 'rails_helper'

RSpec.describe AskQuestion, type: :model do
  let(:ask_question) { AskQuestion.create!(title: "New Ask Question Title", body: "New Ask Question Body") }

  describe "attributes" do
    it "has title and body attributes" do
      expect(ask_question).to have_attributes(title: "New Ask Question Title", body: "New Ask Question Body")
    end
  end
