class User
  include Mongoid::Document
  field :name, type: String
  field :pwd, type: String


   has_many :detall
end
