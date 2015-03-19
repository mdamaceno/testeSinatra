module Models
  class Origins
    include Mongoid::Document
    store_in collection: "origins"
    field :name, type: String
  end
end