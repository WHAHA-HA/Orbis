require 'reform/form/coercion'

class UserCategoryForm < Reform::Form
  include Reform::Form::ModelReflections
  include Reform::Form::Module
  model :user

  collection :carrier_categories do
    # model :user_carrier_category

    property :carrier_category, type: Integer
    # property :user_id, virtual: false
    validates :carrier_category, presence: true
  end

  def self.reflect_on_association(association)
    User.reflect_on_association(association)
  end
end