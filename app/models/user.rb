class User < ActiveRecord::Base

  has_many :accounts, dependent: :destroy


  def has_facebook?
    accounts.where(provider: 'facebook').any?
  end

  def has_twitter?
    accounts.where(provider: 'twitter').any?
  end

end
