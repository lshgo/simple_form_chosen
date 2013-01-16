class Detall
  include Mongoid::Document
  field :age, type: String
  field :ihone, type: String

  belongs_to :user
end
