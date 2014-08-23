class TextrequestController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :twilio_client

  def create
    from_number = request[:From]
    puts "From number is #{from_number}"
    session[:body] = params[:Body]
    render plain: "You sent me #{session[:body]}"


=begin
    @message = @client.account.messages.create({:to => from_number,
                                                :from => "+14043416358",
                                                :body => "Yes it works!"})
=end
  end

  private

  def twilio_client
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

end
