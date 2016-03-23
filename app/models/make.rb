class Make < ActiveRecord::Base
    has_many :models

    validates_presence_of :name, message: "is missing"
    validates_presence_of :webmotors_id, message: "is missing"
end
