require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new full_name: 'Bob Smith' }
  context 'Full Name' do
    it 'is a string' do
      expect(subject.full_name).to be_a(String)
    end
    it 'is required' do
      user = described_class.new
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context 'Password' do
    it 'is required' do
      user = described_class.new
      user.save
      expect(user.errors).to be_present
      expect(user.errors.messages[:password]).to include("can't be blank")
    end
    it 'is at least 8 characters long' do
      user = described_class.new password: 'aaa'
      user.save
      expect(user.errors.messages[:password]).to include("is too short (minimum is 8 characters)")
    end
  end
  context 'Email' do
    it 'is required' do
      user = described_class.new
      user.save
      expect(user.errors).to be_present
      expect(user.errors.messages[:email]).to include("can't be blank")
    end
    it 'is valid email' do
      user = described_class.new email: 'sss'
      expect(user.valid?).to be(false)
      expect(user.errors.messages[:email]).to include("is not a valid email")
    end
  end
end
