class SpotSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id ,:title, :description, :price, :images, :reviews
end
