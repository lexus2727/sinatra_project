class List < ActiveRecord::Base

    belongs_to :trek
    validates_presence_of :title, :content

end