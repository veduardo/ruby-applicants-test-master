class Model < ActiveRecord::Base
    belongs_to :make

    validates_presence_of :make_id, message: "is missing"
    validates_presence_of :name, message: "is missing"
end
