require 'rails_helper'

RSpec.describe User, type: :model do
  it '氏名、メール、パスワードがある場合、有効である' do
    user = FactoryBot.build(:user)
    p user
    expect(user).to be_valid
  end

  it '氏名がない場合、無効である' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end

  it 'メールアドレスがない場合、無効である' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it '重複したメールアドレスの場合、無効である' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors[:email]).to include('はすでに存在します')
  end

  it 'パスワードがない場合、無効である' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include('を入力してください')
  end

  it 'パスワードが7文字以下の時、登録出来ない' do
    user = FactoryBot.build(:user, password: 'pass777')
    expect(user).to be_invalid
  end
end
