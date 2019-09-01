class Trek < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :name, :location

    def trek_locator
    User.find_by(id: user_id).username
    end
end