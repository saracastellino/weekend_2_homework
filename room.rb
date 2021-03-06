class Room

attr_reader :name, :capacity, :playlist, :till, :entry_fee, :guests, :available_places

 def initialize(name, capacity, playlist, till, entry_fee, guests)
   @name = name
   @capacity = capacity
   @playlist = playlist
   @till = till
   @entry_fee = entry_fee
   @guests = guests
   @available_places = capacity
 end

  def change_available_places
    @available_places = @capacity - @guests.size
  end

  def increase_till(entry_fee)
  	@till += @entry_fee
  end

  def check_in_guest(guests)
    @guests.concat(guests)
    change_available_places()
  end

  def check_out_guest(guest)
    @guests.delete(guest)
    change_available_places()
  end

  def add_song_to_playlist(song)
    new_playlist = @playlist << song
    return new_playlist.map {|song| song.name}
  end

 def deny_access_no_available_seats(guest)
   if @available_places > 0
     check_in_guest(guest)
   end
 end

 def deny_access_guest_can_t_afford_fee(guest, entry_fee)
   if guest.wallet >= @entry_fee
     check_in_guest(guest)
   end
 end

 def fav_song_on_air(guest)
  fav_song_found = @playlist.find {|song| song == guest.fav_song}
  return fav_song_found == guest.fav_song ? "Yay!!! Give me the mic NOW!!!" : "Cool!"
 end

end
