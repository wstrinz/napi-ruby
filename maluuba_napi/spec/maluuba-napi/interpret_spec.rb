require 'spec_helper'

describe "Test Interpret Endpoint" do
  
  before do
    @client = MaluubaNapi::Client.new 'your_apikey_here'
  end


  describe "category: BUSINESS" do
    describe "action: BUSINESS_SEARCH" do

      it "should test: where can I buy a hammer" do
        response = @client.interpret phrase: 'where can I buy a hammer'
        assert_intepret response, :BUSINESS, :BUSINESS_SEARCH
      end

      it "should test: i am hungry" do
        response = @client.interpret phrase: 'i am hungry'
        assert_intepret response, :BUSINESS, :BUSINESS_SEARCH
      end

      it "should test: i want some pizza" do
        response = @client.interpret phrase: 'i want some pizza'
        assert_intepret response, :BUSINESS, :BUSINESS_SEARCH
      end
    end

    describe "action: BUSINESS_RESERVATION" do
      it "should test: book a table for 2 at an italian restaurant nearby" do
        response = @client.interpret phrase: 'book a table for 2 at an italian restaurant nearby'
        assert_intepret response, :BUSINESS, :BUSINESS_RESERVATION
      end

      it "should test: reserve a room at a hotel" do
        response = @client.interpret phrase: 'reserve a room at a hotel'
        assert_intepret response, :BUSINESS, :BUSINESS_RESERVATION
      end

    end
  end

  describe "category: CALL" do
    describe "action: CALL_DIAL" do

      it "should test: call josh" do
        response = @client.interpret phrase: 'call josh'
        assert_intepret response, :CALL, :CALL_DIAL      
      end

      it "should test: call josh" do
        response = @client.interpret phrase: 'call josh'
        assert_intepret response, :CALL, :CALL_DIAL       
      end

    end
    describe "action: CALL_CHECK_MISSED" do

      it "should test: did i miss any calls" do
        response = @client.interpret phrase: 'did i miss any calls'
        assert_intepret response, :CALL, :CALL_CHECK_MISSED      
      end

    end
    describe "action: CALL_RESPOND_MISSED" do

      it "should test: respond to that missed call" do
        response = @client.interpret phrase: 'respond to that missed call'
        assert_intepret response, :CALL, :CALL_RESPOND_MISSED      
      end
    end
    describe "action: CALL_ACCEPT_INCOMING" do

      it "should test: accept this call" do
        response = @client.interpret phrase: 'accept this call'
        assert_intepret response, :CALL, :CALL_ACCEPT_INCOMING       
      end
    end

  end

  describe "category: CONTACT" do
    describe "action: CONTACT_ADD" do
      
      it "should test: add josh 5551234" do
        response = @client.interpret phrase: 'add josh 5551234'
        assert_intepret response, :CONTACT, :CONTACT_ADD    
      end

    end
    describe "action: CONTACT_SEARCH" do
      
      it "should test: show me adrians information" do
        response = @client.interpret phrase: 'show me adrians information'
        assert_intepret response, :CONTACT, :CONTACT_SEARCH      
      end

      it "should test: what is josh's phone number" do
        response = @client.interpret phrase: "what is josh's phone number"
        assert_intepret response, :CONTACT, :CONTACT_SEARCH        
      end

    end
    describe "action: CONTACT_SET_ALIAS" do
      
      it "should test: elizabeth is my mom" do
        response = @client.interpret phrase: 'elizabeth is my mom'
        assert_intepret response, :CONTACT, :CONTACT_SET_ALIAS        
      end

    end
  end

  describe "category: KNOWLEDGE" do
    describe "action: KNOWLEDGE_SEARCH" do

      it "should test: who is Barack Obama" do
        response = @client.interpret phrase: 'who is Barack Obama'
        assert_intepret response, :KNOWLEDGE, :KNOWLEDGE_SEARCH
      end

      it "should test: who is the president" do
        response = @client.interpret phrase: 'who is the president'
        assert_intepret response, :KNOWLEDGE, :KNOWLEDGE_SEARCH
      end

      it "should test: what is two plus two" do
        response = @client.interpret phrase: 'what is two plus two'
        assert_intepret response, :KNOWLEDGE, :KNOWLEDGE_SEARCH 
      end

      it "should test: what is the tallest mountain" do
        response = @client.interpret phrase: 'what is the tallest mountain'
        assert_intepret response, :KNOWLEDGE, :KNOWLEDGE_SEARCH
      end      

    end
  end

  describe "category: ENTERTAINMENT" do
    describe "action: ENTERTAINMENT_MOVIE" do

      it "should test: I want to see a funny movie" do
        response = @client.interpret phrase: 'I want to see a funny movie'
        assert_intepret response, :ENTERTAINMENT, :ENTERTAINMENT_MOVIE
      end

      it "should test: I want to see skyfall" do
        response = @client.interpret phrase: 'I want to see skyfall'
        assert_intepret response, :ENTERTAINMENT, :ENTERTAINMENT_MOVIE
      end

    end
    describe "action: ENTERTAINMENT_EVENT" do

      it "should test: I want to see a funny movie" do
        response = @client.interpret phrase: 'I want to see justin bieber'
        assert_intepret response, :ENTERTAINMENT, :ENTERTAINMENT_EVENT
      end

      it "should test: I want to see skyfall" do
        response = @client.interpret phrase: 'when do the leafs play'
        assert_intepret response, :ENTERTAINMENT, :ENTERTAINMENT_EVENT
      end


    end
    describe "action: ENTERTAINMENT_AMBIGUOUS" do

      it "should test: I want to see a funny movie" do
        response = @client.interpret phrase: "What's fun to do on the weekend"
        assert_intepret response, :ENTERTAINMENT, :ENTERTAINMENT_AMBIGUOUS
      end

    end
  end

  describe "category: EMAIL" do
    describe "action: EMAIL_SEND" do

      it "should test: email adrian about the api" do
        response = @client.interpret phrase: "email adrian about the api"
        assert_intepret response, :EMAIL, :EMAIL_SEND
      end     

    end
    describe "action: EMAIL_DISPLAY" do

      it "should test: show me emails from josh" do
        response = @client.interpret phrase: "show me emails from josh"
        assert_intepret response, :EMAIL, :EMAIL_DISPLAY
      end     

    end
  end

  describe "category: HELP" do
    describe "action: HELP_HELP" do

      it "should test: help" do
        response = @client.interpret phrase: "help"
        assert_intepret response, :HELP, :HELP_HELP
      end

      it "should test: what can you do" do
        response = @client.interpret phrase: "what can you do"
        assert_intepret response, :HELP, :HELP_HELP
      end     
      
    end    
  end

  describe "category: TRAVEL" do
    describe "action: TRAVEL_FLIGHT" do
    
      it "should test: i would like a first class ticket to new york leaving from toronto on the day before christmas returning a week after christmas" do
        response = @client.interpret phrase: "i would like a first class ticket to new york leaving from toronto on the day before christmas returning a week after christmas"
        assert_intepret response, :TRAVEL, :TRAVEL_FLIGHT        
      end  

    end    
  end

  describe "category: MUSIC" do
    describe "action: MUSIC_PLAY" do

      it "should test: play the song firework" do
        response = @client.interpret phrase: "play the song firework"
        assert_intepret response, :MUSIC, :MUSIC_PLAY
      end    
      
    end
    describe "action: MUSIC_PAUSE" do

      it "should test: please pause the music" do
        response = @client.interpret phrase: "please pause the music"
        assert_intepret response, :MUSIC, :MUSIC_PAUSE
      end    

    end
  end

  describe "category: CALENDAR" do
    describe "action: CALENDAR_CREATE_EVENT" do

      it "should test: Set up a meeting from 8 to 10" do
        response = @client.interpret phrase: "Set up a meeting from 8 to 10"
        assert_intepret response, :CALENDAR, :CALENDAR_CREATE_EVENT
      end    

    end  
    describe "action: CALENDAR_SEARCH" do

      it "should test: what meetings do I have on Friday" do
        response = @client.interpret phrase: "what meetings do I have on Friday"
        assert_intepret response, :CALENDAR, :CALENDAR_SEARCH
      end    

    end
    describe "action: CALENDAR_REMOVE_EVENT" do

      it "should test: Cancel my next meeting" do
        response = @client.interpret phrase: "Cancel my next meeting"
        assert_intepret response, :CALENDAR, :CALENDAR_REMOVE_EVENT
      end    

    end  
    describe "action: CALENDAR_MODIFY_EVENT" do

      it "should test: Move my 5 o'clock to 7" do
        response = @client.interpret phrase: "Move my 5 o'clock to 7"
        assert_intepret response, :CALENDAR, :CALENDAR_MODIFY_EVENT
      end    

    end  
    describe "action: CALENDAR_AVAILABILITY" do

      it "should test: When am I available" do
        response = @client.interpret phrase: "When am I available"
        assert_intepret response, :CALENDAR, :CALENDAR_AVAILABILITY
      end    

    end    
  end

  describe "category: WEATHER" do
    describe "action: WEATHER_STATUS" do

      it "should test: What is the weather outside?" do
        response = @client.interpret phrase: "What is the weather outside?"
        assert_intepret response, :WEATHER, :WEATHER_STATUS
      end
      
    end
    describe "action: WEATHER_DETAILS" do

      it "should test: What is the wind speed?" do
        response = @client.interpret phrase: "What is the wind speed?"
        assert_intepret response, :WEATHER, :WEATHER_DETAILS
      end
      
    end
    describe "action: WEATHER_SUNSET" do

      it "should test: When is the sunset?" do
        response = @client.interpret phrase: "When is the sunset?"
        assert_intepret response, :WEATHER, :WEATHER_SUNSET
      end
      
    end
    describe "action: WEATHER_SUNRISE" do

      it "should test: When is sunrise for Friday?" do
        response = @client.interpret phrase: "When is sunrise for Friday?"
        assert_intepret response, :WEATHER, :WEATHER_SUNRISE
      end
      
    end    
  end

  describe "category: REMINDER" do
    describe "action: REMINDER_SET" do

      it "should test: Remind me to put out the garbage tonight" do
        response = @client.interpret phrase: "Remind me to put out the garbage tonight"
        assert_intepret response, :REMINDER, :REMINDER_SET
      end

    end
    describe "action: REMINDER_SEARCH" do

      it "should test: Find me reminders for this week" do
        response = @client.interpret phrase: "Find me reminders for this week"
        assert_intepret response, :REMINDER, :REMINDER_SEARCH
      end

    end    
  end

  describe "category: ALARM" do
    describe "action: ALARM_SET" do

     it "should test: set an alarm for five thirty" do
        response = @client.interpret phrase: "set an alarm for five thirty"
        assert_intepret response, :ALARM, :ALARM_SET
      end

    end
    describe "action: ALARM_SET_RECURRING" do

     it "should test: Set an alarm at five thirty every morning" do
        response = @client.interpret phrase: "Set an alarm at five thirty every morning"
        assert_intepret response, :ALARM, :ALARM_SET_RECURRING
      end

    end
    describe "action: ALARM_MODIFY" do

     it "should test: Change my morning alarms from 5 to 7" do
        response = @client.interpret phrase: "Change my morning alarms from 5 to 7"
        assert_intepret response, :ALARM, :ALARM_MODIFY
      end

    end
    describe "action: ALARM_CANCEL" do

     it "should test: Cancel my alarm at 6 tonight" do
        response = @client.interpret phrase: "Cancel my alarm at 6 tonight"
        assert_intepret response, :ALARM, :ALARM_CANCEL
      end

    end
    describe "action: ALARM_CANCEL_ALL_ALARMS" do

     it "should test: Remove all my alarms" do
        response = @client.interpret phrase: "Remove all my alarms"
        assert_intepret response, :ALARM, :ALARM_CANCEL_ALL_ALARMS
      end

    end
    describe "action: ALARM_SEARCH" do

     it "should test: Find my alarms" do
        response = @client.interpret phrase: "Find my alarms"
        assert_intepret response, :ALARM, :ALARM_SEARCH
      end

    end    
  end

  describe "TIMER" do
    describe "TIMER_START" do

     it "should test: Set a 30 minute timer" do
        response = @client.interpret phrase: "Set a 30 minute timer"
        assert_intepret response, :TIMER, :TIMER_START
      end 
      
    end
    describe "TIMER_DISPLAY" do

     it "should test: show my timer" do
        response = @client.interpret phrase: "show my timer"
        assert_intepret response, :TIMER, :TIMER_DISPLAY
      end 
      
    end
    describe "TIMER_CANCEL" do

     it "should test: cancel the timer" do
        response = @client.interpret phrase: "cancel the timer"
        assert_intepret response, :TIMER, :TIMER_CANCEL
      end 
      
    end
    describe "TIMER_PAUSE" do

     it "should test: pause timer" do
        response = @client.interpret phrase: "pause timer"
        assert_intepret response, :TIMER, :TIMER_PAUSE
      end 
      
    end
  end

  describe "category: STOPWATCH" do
    describe "action: STOPWATCH_START" do

     it "should test: start a stopwatch" do
        response = @client.interpret phrase: "start a stopwatch"
        assert_intepret response, :STOPWATCH, :STOPWATCH_START
      end 

    end
    describe "action: STOPWATCH_STOP" do

     it "should test: stop a stopwatch" do
        response = @client.interpret phrase: "stop a stopwatch"
        assert_intepret response, :STOPWATCH, :STOPWATCH_STOP
      end 
      
    end
    describe "action: STOPWATCH_DISPLAY" do

     it "should test: display the stopwatch" do
        response = @client.interpret phrase: "display the stopwatch"
        assert_intepret response, :STOPWATCH, :STOPWATCH_DISPLAY
      end 
      
    end    
  end

  describe "category: NAVIGATION" do
    describe "action: NAVIGATION_DIRECTIONS" do
      
      it "should test: How do I get to the mall from my house" do
        response = @client.interpret phrase: "How do I get to the mall from my house"
        assert_intepret response, :NAVIGATION, :NAVIGATION_DIRECTIONS
      end

      it "should test: How do I get to the mall from my house" do
        response = @client.interpret phrase: "How do I get to the mall from my house"
        assert_intepret response, :NAVIGATION, :NAVIGATION_DIRECTIONS
      end

    end
    describe "action: NAVIGATION_WHERE_AM_I" do
      
      it "should test: Show my current location" do
        response = @client.interpret phrase: "Show my current location"
        assert_intepret response, :NAVIGATION, :NAVIGATION_WHERE_AM_I
      end

    end      
  end

  describe "category: TRANSIT" do
    describe "action: TRANSIT_NEXT_BUS" do

      it "should test: When will the next bus come to the university" do
        response = @client.interpret phrase: "When will the next bus come to the university"
        assert_intepret response, :TRANSIT, :TRANSIT_NEXT_BUS
      end
      
    end
    describe "action: TRANSIT_NEARBY_STOPS" do

      it "should test: bus stops near the mall" do
        response = @client.interpret phrase: "bus stops near the mall"
        assert_intepret response, :TRANSIT, :TRANSIT_NEARBY_STOPS
      end
      
    end
    describe "action: TRANSIT_SCHEDULE" do

      it "should test: What is the schedule for the green route tomorrow" do
        response = @client.interpret phrase: "What is the schedule for the green route tomorrow"
        assert_intepret response, :TRANSIT, :TRANSIT_SCHEDULE
      end
      
    end    
  end

  describe "category: SEARCH" do
    describe "action: SEARCH_AMAZON" do

      it "should test: i want to buy a book on amazon" do
        response = @client.interpret phrase: "i want to buy a book on amazon"
        assert_intepret response, :SEARCH, :SEARCH_AMAZON
      end

      it "should test: search amazon for electronics" do
        response = @client.interpret phrase: "search amazon for electronics"
        assert_intepret response, :SEARCH, :SEARCH_AMAZON
      end

    end
    describe "action: SEARCH_BING" do

      it "should test: bing search ryan seacrest" do
        response = @client.interpret phrase: "bing search ryan seacrest"
        assert_intepret response, :SEARCH, :SEARCH_BING
      end

    end
    describe "action: SEARCH_EBAY" do

      it "should test: search ebay for socks" do
        response = @client.interpret phrase: "search ebay for socks"
        assert_intepret response, :SEARCH, :SEARCH_EBAY
      end

    end
    describe "action: SEARCH_DEFAULT" do

      it "should test: search the web for cheese" do
        response = @client.interpret phrase: "search the web for cheese"
        assert_intepret response, :SEARCH, :SEARCH_DEFAULT
      end

    end
    describe "action: SEARCH_GOOGLE" do

      it "should test: google search androids" do
        response = @client.interpret phrase: "google search androids"
        assert_intepret response, :SEARCH, :SEARCH_GOOGLE
      end

    end
    describe "action: SEARCH_RECIPES" do

      it "should test: how do i make butter chicken" do
        response = @client.interpret phrase: "how do i make butter chicken"
        assert_intepret response, :SEARCH, :SEARCH_RECIPES
      end

    end
    describe "action: SEARCH_WIKIPEDIA" do

      it "should test: search wikipedia for the romans" do
        response = @client.interpret phrase: "search wikipedia for the romans"
        assert_intepret response, :SEARCH, :SEARCH_WIKIPEDIA
      end

    end
  end

  describe "category: TEXT" do
    describe "action: TEXT_DISPLAY" do
      
      it "should test: show unread texts" do
        response = @client.interpret phrase: "show unread texts"
        assert_intepret response, :TEXT, :TEXT_DISPLAY
      end

    end
    describe "action: TEXT_SEND" do
      
      it "should test: send a text to rob how is the law stuff" do
        response = @client.interpret phrase: "send a text to rob how is the law stuff"
        assert_intepret response, :TEXT, :TEXT_SEND
      end

    end    
  end

  describe "SOCIAL" do
    describe "SOCIAL_FACEBOOK_SEND_MESSAGE" do

      it "should test: send a facebook message to zhiyuan hey g" do
        response = @client.interpret phrase: "send a facebook message to zhiyuan hey g"
        assert_intepret response, :SOCIAL, :SOCIAL_FACEBOOK_SEND_MESSAGE
      end     

    end
    describe "SOCIAL_FACEBOOK_SHOW_NEWSFEED" do

      it "should test: show me my facebook newsfeed" do
        response = @client.interpret phrase: "show me my facebook newsfeed"
        assert_intepret response, :SOCIAL, :SOCIAL_FACEBOOK_SHOW_NEWSFEED
      end     

    end 
    describe "SOCIAL_FACEBOOK_SHOW_PHOTOS" do

      it "should test: show me pictures of irene" do
        response = @client.interpret phrase: "show me pictures of irene"
        assert_intepret response, :SOCIAL, :SOCIAL_FACEBOOK_SHOW_PHOTOS
      end     

    end
    describe "SOCIAL_FACEBOOK_SHOW_WALL" do

      it "should test: take me to cynthia's facebook wall" do
        response = @client.interpret phrase: "take me to cynthia's facebook wall"
        assert_intepret response, :SOCIAL, :SOCIAL_FACEBOOK_SHOW_WALL
      end     

    end 
    describe "SOCIAL_FACEBOOK_WRITE_ON_WALL" do

      it "should test: write on sam's wall good luck in korea" do
        response = @client.interpret phrase: "write on sam's wall good luck in korea"
        assert_intepret response, :SOCIAL, :SOCIAL_FACEBOOK_WRITE_ON_WALL
      end     

    end 
    describe "SOCIAL_FOURSQUARE_CHECK_IN" do

      it "should test: check me in at communitech" do
        response = @client.interpret phrase: "check me in at communitech"
        assert_intepret response, :SOCIAL, :SOCIAL_FOURSQUARE_CHECK_IN
      end     

    end 
    describe "SOCIAL_FOURSQUARE_SHOW_CHECKINS" do

      it "should test: where have i checked in" do
        response = @client.interpret phrase: "where have i checked in"
        assert_intepret response, :SOCIAL, :SOCIAL_FOURSQUARE_SHOW_CHECKINS
      end     

    end 
    describe "SOCIAL_TWITTER_SHOW_FOLLOWER" do

      it "should test: show my twitter timeline" do
        response = @client.interpret phrase: "show my twitter timeline"
        assert_intepret response, :SOCIAL, :SOCIAL_TWITTER_SHOW_FOLLOWER
      end     

    end 
    describe "SOCIAL_TWITTER_SHOW_TRENDING" do

      it "should test: what is trending on twitter" do
        response = @client.interpret phrase: "what is trending on twitter"
        assert_intepret response, :SOCIAL, :SOCIAL_TWITTER_SHOW_TRENDING
      end     

    end 
    describe "SOCIAL_TWITTER_TWEET" do

      it "should test: tweet i want a burrito" do
        response = @client.interpret phrase: "tweet i want a burrito"
        assert_intepret response, :SOCIAL, :SOCIAL_TWITTER_TWEET
      end     

    end 
  end

  describe "category: SPORTS" do
    describe "action: SPORTS_MISC" do

      it "should test: what was the score of the game last night" do
        response = @client.interpret phrase: "what was the score of the game last night"
        assert_intepret response, :SPORTS, :SPORTS_MISC
      end
      
    end
  end

  describe "category: APPLICATION" do
    describe "action: APPLICATION_LAUNCH" do

      it "should test: launch angry birds" do
        response = @client.interpret phrase: "launch angry birds"
        assert_intepret response, :APPLICATION, :APPLICATION_LAUNCH
      end
      
    end
  end
  
end