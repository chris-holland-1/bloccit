require 'rails_helper'

RSpec.describe AskQuestionController, type: :controller do

  let(:my_askquestion) { AskQuestion.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_askquestion] to @ask_question" do
      get :index
      expect(assigns(:ask_questions)).to eq([my_askquestion])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_askquestion.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_askquestion.id}
      expect(response).to render_template :show
    end

    it "assigns my_askquestion to @ask_question" do
      get :show, {id: my_askquestion.id}
      expect(assigns(:ask_question)).to eq(my_askquestion)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @ask_question" do
      get :new
      expect(assigns(:ask_question)).not_to be_nil
    end
  end

  describe "AskQuestion create" do
    it "increases the number of AskQuestion by 1" do
      expect{post :create, ask_question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(AskQuestion, :count).by(1)
    end

    it "assigns the new ask_question to @ask_question" do
      post :create, ask_question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:ask_question)).to eq AskQuestion.last
    end

    it "redirects to the new ask_question" do
      post :create, ask_question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to AskQuestion.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_askquestion.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_askquestion.id}
      expect(response).to render_template :edit
    end

    it "assigns ask_question to be updated to @ask_question" do
      get :edit, {id: my_askquestion.id}

      askquestion_instance = assigns(:ask_question)

      expect(ask_question_instance.id).to eq my_askquestion.id
      expect(ask_question_instance.title).to eq my_askquestion.title
      expect(ask_question_instance.body).to eq my_askquestion.body
    end
  end

  describe "PUT update" do
    it "updates ask_question with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_askquestion.id, ask_question: {title: new_title, body: new_body}
      updated_ask_question = assigns(:ask_question)
      expect(updated_ask_question.id).to eq my_askquestion.id
      expect(updated_ask_question.title).to eq new_title
      expect(updated_ask_question.body).to eq new_body
    end

    it "redirects to the updated ask_question" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_askquestion.id, ask_question: {title: new_title, body: new_body}
      expect(response).to redirect_to my_askquestion
    end
  end

  describe "DELETE destroy" do
    it "deletes the ask_question" do
      delete :destroy, {id: my_askquestion.id}
      count = AskQuestion.where({id: my_askquestion.id}).size
      expect(count).to eq 0
    end

    it "redirects to ask_question index" do
      delete :destroy, {id: my_askquestion.id}
      expect(response).to redirect_to askquestions_path
    end
  end
end
