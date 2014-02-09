class TrackerDevice < ActiveRecord::Base

    def to_s
        id.to_s  + ' - ' + description
    end

end
