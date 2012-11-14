module MaluubaNapi
  class Categories
    
    ALL = [
      :BUSINESS,
      :CALL,
      :CONTACT,
      :KNOWLEDGE,
      :ENTERTAINMENT,
      :EMAIL,
      :HELP,
      :TRAVEL,
      :MUSIC,
      :CALENDAR,
      :WEATHER,
      :REMINDER,
      :ALARM,
      :TIMER,
      :STOPWATCH,
      :NAVIGATION,
      :TRANSIT,
      :SEARCH,
      :TEXT,
      :SOCIAL,
      :SPORTS,
      :APPLICATION
    ].freeze
  
    def self.valid?(arg)
      ALL.include? arg
    end

end