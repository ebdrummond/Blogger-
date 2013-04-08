class Author < ActiveRecord::Base
  # attr_accessible :title, :body
  authenticates_with_sorcery!

  validates_confirmation_of :password, message: "should match confirmation", if: :password


end
