require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
 
 describe 'GET new' do
    it "renders the new appointment template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  
  describe 'POST create' do
    context 'with valid attributes'do
      it 'creates the appointment' do
        appointment = create(:appointment).attributes
        post :create, :appointment => appointment
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to("/appointments/#{assigns(:appointment).id}")
      end
    end
  end
  
  describe 'POST create' do
    context 'with invalid date'do
      it 'creates the appointment' do
        appointment = build(:appointment, date: nil).attributes
        post :create, :appointment => appointment
        expect(response).to_not have_http_status(:found)
        expect(response).to_not redirect_to("/appointments/#{assigns(:appointment).id}")
      end
    end
  end
  
  
  describe 'GET index' do
      it "renders the index appointment template" do
        get :index
        expect(response).to render_template("index")
      end
  end
  
  describe 'GET show' do
      it "renders the show appointment template" do
        appointment = create(:appointment)
        get :show, id: appointment
        expect(response).to render_template("show")
      end
  end
  
  describe 'GET show' do
      it "returns the requested appointment" do
        appointment = create(:appointment)
        get :show, id: appointment
        expect(assigns(:appointment)).to eq appointment
      end
  end
  
  describe 'GET edit' do
    it "renders the edit appointment template" do
      appointment = create(:appointment)
      get :edit, id: appointment
      expect(response).to render_template("edit")
    end
  end
  
  describe 'GET edit' do
    it "manage the requested appointment" do
      appointment = create(:appointment)
      get :edit, id: appointment
      expect(assigns(:appointment)).to eq appointment
    end
  end
  
  describe 'PUT update' do
    context 'with valid attributes'do
      it 'updates the appointment' do
        appointment = create(:appointment)
        put :update, id: appointment,appointment: attributes_for(:appointment, user_id: 3)
        appointment.reload
        expect(assigns(:appointment)).to eq appointment
      end
    end
  end
  
  describe 'DELETE destroy' do
      it 'deletes the appointment' do
        appointment = create(:appointment)
        delete :destroy, id: appointment
        expect(response).to_not have_http_status(:success)
      end
  end

  
  context 'json' do
    describe 'GET getlist.json' do
      it "renders the json appointments list template" do
        get :getlist,  format: :json
        expect(response.content_type).to eq("application/json")
      end
    end
  end
  
    
  context 'json' do
    describe 'GET singular.json' do
      it "renders the json appointment template" do
        appointment = create(:appointment)
        get :singular, id: appointment,  format: :json
        expect(response.content_type).to eq("application/json")
      end
    end
  end
  
end
