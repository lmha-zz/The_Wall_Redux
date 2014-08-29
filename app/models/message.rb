class Message < ActiveRecord::Base
  has_many :comments, :dependent => :delete_all
  belongs_to :user

  validates :message, presence: true
end
