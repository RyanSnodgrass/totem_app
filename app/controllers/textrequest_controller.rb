class TextrequestController < ApplicationController

  def create
    @message = @client.account.messages.create({:to => "+16786369295",
                                                :from => "+14043416358",
                                                :body => "Yes it works!"})
    puts @message.text.render_to_string

    render plain: "OK"
  end

end
