class Event < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :location
  validates_presence_of :description
  
  validate :event_start_must_be_in_future,
           :event_end_must_be_after_event_start
            
  has_many  :users, :through => :signups
  has_many  :signups    
    
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
    
  def add_to_google_calendar
    g = Googlecalendar::GData.new
    g.login('ieeeucb@gmail.com', 'inputoutput')
    event = { :title     => self.title,
              :content   => self.description,
              :author    => User.find(self.author_id).name,
              :email     => User.find(self.author_id).email,
              :where     => self.location,
              :startTime => self.event_start.to_datetime,
              :endTime   => self.event_end.to_datetime
            }
    response = g.new_event(event, 'IEEE-Berkeley-Public')    
      
    if response.message == "Created"
      url = response.body[/<id>.*<\/id>/].sub('<id>', '').sub('</id>', '')
        #save this url for later, need it for editing / deleting
      return true
    else
      warn "ERROR ADDING EVENT TO GOOGLE CALENDAR:\n MESSAGE: #{response.message}\n BODY: #{response.body}\n"
      return false
    end
  end

end
