class TextrequestController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :twilio_client

  def create
    #message is the body of the text
    message = params[:Body]
    #from_number is where it came from
    from_number = params[:From]

    if message.length == 12
      session[:patient] = Patient.find_by_identifier(message)
      response = "New Patient: #{session[:patient].firstname} #{session[:patient].lastname}"
    elsif message == "prescriptions"
      #look up prescriptions
      response = ""
    elsif message == "whatever"
      #look up whatever
      response = ""
    end

    render plain: response

  end

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