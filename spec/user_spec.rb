require 'rails_helper'

# frozen_string_literal: true

describe User, type: :model do

  it "перевірка на порожній email" do
    user = User.create(email: nil)
    #user.valid?
     expect(user.errors[:email]).to include("can't be blank")
      
  end

  it "перевірка на заглавні літери" do
    user = User.create(nickname: 'TestUser', email: 'test@fuckintest2.sraka')
    expect(user.reload.nickname).to eq('testuser')
  end 

  it "перевірка на збереження малими літерами" do
    user = User.create(nickname: 'testuser', email: 'test@fuckintest1.sraka')
    expect(user.nickname).to eq('testuser')
  end
  
end