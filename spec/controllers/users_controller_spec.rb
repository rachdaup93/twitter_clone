require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    subject { get :new }
    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end
    it "renders the new template" do
      expect(subject).to render_template(:new)
      expect(subject).to render_template("new")
      expect(subject).to render_template("users/new")
    end
    it "does not render a different template" do
      expect(subject).not_to render_template("users/show")
    end
  end

  # describe "POST #create" do
  #   let(:user_params){ { first_name: "User"} }
  #   it "returns http success" do
  #     post :create, params:{ user: user_params }
  #     expect(response).to
  #   end
  #   it
  # end
  #
  # describe "GET #show" do
  #   subject { User.create(first_name: 'User', last_name: 'Test', email: 'test@test.com', password: 'IcecreamCake@!') }
  #   it "returns http success" do
  #     get :show, params: { :id => subject.id }
  #     expect(response).to have_http_status(:success)
  #   end
  #   it "renders the show template" do
  #     get :show, params: { :id => subject.id }
  #     expect(response).to render_template(:show)
  #     expect(response).to render_template("show")
  #     expect(response).to render_template("users/show")
  #   end
  #   it "does not render a different template" do
  #     get :show, params: { :id => subject.id }
  #     expect(response).not_to render_template("users/new")
  #   end
  # end
  #
  # describe "GET #edit" do
  #   subject { User.create(first_name: 'User', last_name: 'Test', email: 'test@test.com', password: 'IcecreamCake@!') }
  #   it "returns http success" do
  #     get :edit, params: { :id => subject.id }
  #     expect(response).to have_http_status(:success)
  #   end
  #   it "renders the edit template" do
  #     get :edit, params: { :id => subject.id }
  #     expect(response).to render_template(:edit)
  #   end
  #   it "does not render a different template" do
  #     get :show, params: { :id => subject.id }
  #     expect(response).not_to render_template(:new)
  #   end
  # end

  # describe "GET #delete" do
  #   it "returns http success" do
  #     get :delete
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
