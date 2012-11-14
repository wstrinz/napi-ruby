require 'spec_helper'

describe "Test Interpret Endpoint" do
  
  before do
    @client = MaluubaNapi::Client.new 'UJ74UkOwAmJISTJfiIGVU8OhsGeHnts6'
  end


  describe "category: BUSINESS" do

    describe "action: BUSINESS_SEARCH" do

      it "should test: where can I buy a hammer" do
        response = @client.interpret phrase: 'where can I buy a hammer'
        assert_intepret response, "BUSINESS", "BUSINESS_SEARCH"
      end

      it "should test: i am hungry" do
        response = @client.interpret phrase: 'i am hungry'
        assert_intepret response, "BUSINESS", "BUSINESS_SEARCH"
      end

      it "should test: i want some pizza" do
        response = @client.interpret phrase: 'i want some pizza'
        assert_intepret response, "BUSINESS", "BUSINESS_SEARCH"
      end

    end

    describe "action: BUSINESS_RESERVATION" do

      it "should test: book a table for 2 at an italian restaurant nearby" do
        response = @client.interpret phrase: 'book a table for 2 at an italian restaurant nearby'
        assert_intepret response, "BUSINESS", "BUSINESS_RESERVATION"
      end

      it "should test: reserve a room at a hotel" do
        response = @client.interpret phrase: 'reserve a room at a hotel'
        assert_intepret response, "BUSINESS", "BUSINESS_RESERVATION"
      end

    end

  end

  describe "category: CALL" do

    describe "action: CALL_DIAL" do

      it "should test: call josh" do
        response = @client.interpret phrase: 'call josh'
        assert_intepret response, "CALL", "CALL_DIAL"       
      end

      it "should test: call josh" do
        response = @client.interpret phrase: 'call josh'
        assert_intepret response, "CALL", "CALL_DIAL"       
      end

    end

    describe "action: CALL_CHECK_MISSED" do

      it "should test: did i miss any calls" do
        response = @client.interpret phrase: 'did i miss any calls'
        assert_intepret response, "CALL", "CALL_CHECK_MISSED"       
      end

    end

    describe "action: CALL_RESPOND_MISSED" do

      it "should test: respond to that missed call" do
        response = @client.interpret phrase: 'respond to that missed call'
        assert_intepret response, "CALL", "CALL_RESPOND_MISSED"       
      end

    end

    describe "action: CALL_ACCEPT_INCOMING" do

      it "should test: accept this call" do
        response = @client.interpret phrase: 'accept this call'
        assert_intepret response, "CALL", "CALL_ACCEPT_INCOMING"       
      end

    end

  end

  describe "category: CONTACT" do

    describe "action: CONTACT_ADD" do
      
      it "should test: add josh 5551234" do
        response = @client.interpret phrase: 'add josh 5551234'
        assert_intepret response, "CONTACT", "CONTACT_ADD"       
      end

    end

    describe "action: CONTACT_SEARCH" do
      
      it "should test: show me adrians information" do
        response = @client.interpret phrase: 'show me adrians information'
        assert_intepret response, "CONTACT", "CONTACT_SEARCH"       
      end

      it "should test: what is josh's phone number" do
        response = @client.interpret phrase: "what is josh's phone number"
        assert_intepret response, "CONTACT", "CONTACT_SEARCH"       
      end

    end

    describe "action: CONTACT_SET_ALIAS" do
      
      it "should test: elizabeth is my mom" do
        response = @client.interpret phrase: 'elizabeth is my mom'
        assert_intepret response, "CONTACT", "CONTACT_SET_ALIAS"       
      end

    end

  end

  describe "category: KNOWLEDGE" do

    describe "action: KNOWLEDGE_SEARCH" do

      it "should test: who is Barack Obama" do
        response = @client.interpret phrase: 'who is Barack Obama'
        assert_intepret response, "KNOWLEDGE", "KNOWLEDGE_SEARCH"
      end

      it "should test: who is the president" do
        response = @client.interpret phrase: 'who is the president'
        assert_intepret response, "KNOWLEDGE", "KNOWLEDGE_SEARCH"
      end

      it "should test: what is two plus two" do
        response = @client.interpret phrase: 'what is two plus two'
        assert_intepret response, "KNOWLEDGE", "KNOWLEDGE_SEARCH"  
      end

      it "should test: what is the tallest mountain" do
        response = @client.interpret phrase: 'what is the tallest mountain'
        assert_intepret response, "KNOWLEDGE", "KNOWLEDGE_SEARCH"
      end      

    end

  end

  
end