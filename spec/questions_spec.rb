require 'rails_helper'

RSpec.describe QuestionsController, type: :request do
  let(:user) { User.create!(email: 'test@example.com') }
  let(:questions) { Question.create!(body: 'NICE') }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end  

  it 'повертає статус 200' do
    get '/questions'
    expect(response).to have_http_status(200)
  end

  it 'повертаємо пітання і перевіряємо тіла' do
    get '/questions', headers: {'Content-Type' => 'application/json'}
    json_response = JSON.parse(response.body)
    body_values = json_response.map { |q| q['body'] }
    expect(body_values).to include('питання для тесту', 'друге пітання для тесту')
  end

  it "створює нове питання і повертає статус 201 Created" do
    post '/questions', params: { question: { body: "New test question", user_id: user.id } }, as: :json
    expect(response).to have_http_status(201)

    json_response = JSON.parse(response.body)
    expect(json_response['body']).to eq("New test question")
  end
end