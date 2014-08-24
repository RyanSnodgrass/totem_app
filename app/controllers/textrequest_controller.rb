class TextrequestController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :twilio_client

  def create
    #message is the body of the text
    message_params = params[:Body].split(" ")
    from_number = params[:From]
    unique_input = message_params.first
    #from_number is where it came from
    session[:patient_record]=Patient.where(:unique_id => unique_input).take
    case 
    when message_params.length == 1
      if !session[:patient_record]
        response="no patient found"
      else
        response="Patient found: #{session[:patient_record].last_name},#{session[:patient_record].first_name}"
      end 
    when message_params.length == 2
      if !session[:patient_record]
        response="no patient found"
      elsif message_params.last == "D"
        response="Diagnosis for #{session[:patient_record].last_name},#{session[:patient_record].last_name}: #{session[:patient_record].diagnoses}"
      elsif message_params.last == "M"
        response="Medications for #{session[:patient_record].last_name},#{session[:patient_record].last_name}: #{session[:patient_record].medications}"
      end 
    
    else 

      response="invalid input"
    
    end
    render plain: response
end
    

=begin

    if{message == }
    response = "this works"

    if message.length == 12
      #session[:patient] = Patient.find_by_identifier(message)
      #response = "New Patient: #{session[:patient].firstname} #{session[:patient].lastname}"
    elsif message == "prescriptions"
      #look up prescriptions
      response = ""
    elsif message == "whatever"
      #look up whatever
      response = ""
    end
=end

    #render plain: response

  private

  def twilio_client
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

end

=begin
    @message = @client.account.messages.create({:to => from_number,
                                                :from => "+14043416358",
                                                :body => "Yes it works!"})
=end