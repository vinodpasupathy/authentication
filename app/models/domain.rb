class Domain < ActiveRecord::Base
validates :d_name,  uniqueness: true,:presence => { :message => " cannot be blank" } ,format: { with: /\b(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}
#/^((http|https):\/\/)[a-z0-9]*(\.?[a-z0-9]+)\.[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix#d_name, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
end
