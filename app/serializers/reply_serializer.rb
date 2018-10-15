class ReplySerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at
  belongs_to :user
end
