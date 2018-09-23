class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call(phonenumber)
    client = Twilio::REST::Client.new
    client.messages.create({
      from: "+15128293862",
      to: "+1#{phonenumber}",
      body: @message
    })
  end
end