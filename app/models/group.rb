class Group < ActiveRecord::Base
    validates :title, presence: true
    has_many :posts
    has_one :photo
    accepts_nested_attributes_for :photo

    has_many :group_users
    has_many :members, through: :group_users, source: :user

    #:owner這個欄位可以任意指定名稱，但不管什麼名稱都還是對應到User這個model
    belongs_to :owner, class_name: 'User', foreign_key: :user_id

    def editable_by?(user)
        user && user == owner
    end
    self.per_page = 10
end
