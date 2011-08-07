class Event < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :location
  validates_presence_of :description
  
  validate :event_start_must_be_in_future,
            :event_end_must_be_after_event_start
            
  def event_start_must_be_in_future
    if !event_start.future?
      errors.add(:event_start, "Event must start in the future")
    end
  end
  
  def event_end_must_be_after_event_start
    if (event_end.to_i <= event_start.to_i)
      errors.add(:event_end, "Event must end after it starts")
    end
  end
  
end
