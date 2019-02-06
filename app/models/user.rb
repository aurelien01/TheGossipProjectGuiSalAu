class User < ApplicationRecord
  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :gossips
  has_many :sub_comments
  has_many :likes
  has_many :comments

  validates :last_name,
   presence: true,
   uniqueness: true
  validates :first_name,
   presence: true,
   uniqueness: true
  validates :description,
   presence: true,
   length: { minimum: 20 }
  validates :email,
   presence: true,
   uniqueness: true,
   format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age,
  presence: true,
  numericality: { greater_than_or_equal_to: 1 }
end
