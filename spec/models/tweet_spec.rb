require 'rails_helper'

RSpec.describe Tweet, type: :model do
  # subject { described_class.new user_id: 1, description: "TEST TEST TEST TEST TEST TEST" }
  # context 'Tweet content' do
  #   it 'is a string' do
  #     expect(subject.description).to be_a(String)
  #   end
  #   it 'is required' do
  #     tweet = described_class.new(user_id: 1)
  #     expect{ tweet.save! }.to raise_error(ActiveRecord::RecordInvalid)
  #   end
  #   it 'has a max length of 240'
  #
  #   end
  # end
  # context 'User Id' do
  #   it 'is required' do
  #     user = described_class.new(description: "TEST TEST TEST TEST TEST TEST")
  #     user.save
  #     expect(user.errors).to be_present
  #     expect(user.errors.messages[:password]).to include("can't be blank")
  #   end
  #   it 'is at least 8 characters long' do
  #     user = described_class.new password: 'aaa'
  #     user.save
  #     expect(user.errors.messages[:password]).to include("is too short (minimum is 8 characters)")
  #   end
  # end
  # context 'Email' do
  #   it 'is required' do
  #     user = described_class.new
  #     user.save
  #     expect(user.errors).to be_present
  #     expect(user.errors.messages[:email]).to include("can't be blank")
  #   end
  #   it 'is valid email' do
  #     user = described_class.new email: 'sss'
  #     expect(user.valid?).to be(false)
  #     expect(user.errors.messages[:email]).to include("bad email")
  #   end
  # end
end