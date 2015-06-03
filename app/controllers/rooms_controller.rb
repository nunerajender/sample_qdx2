class RoomsController < ApplicationController
before_filter :config_opentok,:except => [:index]
def index
@rooms = Room.where(:public => true)

@new_room = Room.new
end

def create
session = @opentok.create_session request.remote_addr
params[:room][:sessionId] = session.session_id

@new_room = Room.new(params[:room])

respond_to do |format|
if @new_room.save
format.html { redirect_to(“/party/”+@new_room.id.to_s) }
else
format.html { render :controller => ‘rooms’,
:action => “index” }
end
end
end

def party
@room = Room.find(params[:id])

@tok_token = @opentok.generate_token :session_id =>@room.sessionId
end

private
def config_opentok
if @opentok.nil?
@opentok = OpenTok::OpenTokSDK.new '45246922', 'T1==cGFydG5lcl9pZD00NTI0NjkyMiZzaWc9ZGRiMmM2NzI0Mzk2NDUzNGYxNzIzNzhmMWVmNzAyYmNjNTIwZTc3NTpyb2xlPXB1Ymxpc2hlciZzZXNzaW9uX2lkPTFfTVg0ME5USTBOamt5TW41LU1UUXpNamM1TmpJM01qSTBNWDU2VDJaVGEzQXlTR3h6VVVwUVZtMWtaa3RuTHpsdmVYUi1mZyZjcmVhdGVfdGltZT0xNDMyODAzMTc3Jm5vbmNlPTAuODA4NjkyMDUwNTM0Njk2JmV4cGlyZV90aW1lPTE0MzI4ODk1Nzc='
end
end
end
