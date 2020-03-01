class Room

attr_reader :name, :capacity, :playlist, :till, :entry_fee, :guests

 def initialize(name, capacity, playlist, till, entry_fee, guests)
   @name = name
   @capacity = capacity
   @playlist = playlist
   @till = till
   @entry_fee = entry_fee
   @guests = guests
 end

  def change_available_places
    available_places = @capacity -= @guests.size
  end

  def increase_till(entry_fee)
  	@till += @entry_fee
  end

  def check_in_guest(*guest)
    @guests.push(*guest)
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

	def add_song_to_playlist(song)
		new_playlist = @playlist << song
    return new_playlist.map {|song| song.name}
	end

 def allow_access(*guest)
   if @available_places > 0
     # && @guest.wallet >= 5.50
     check_in_guest(*guest)
     change_available_places()
     increase_till(entry_fee)
     # decrease_wallet(guest, room)
   end

 end

 def fav_song_on_air(guest)
  fav_song_found = @playlist.find {|song| song == guest.fav_song}
  return fav_song_found == guest.fav_song ? "Yay!!! Give me the mic NOW!!!" : "Cool!"
 end

end
