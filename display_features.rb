# Display menu features

$current_pos = TkVariable.new

$pad.bind("KeyRelease") { update_pos }

def show_status_bar
  if $status_bar_toggle == "show"
    $status_bar = Tk::Tile::Label.new($content) {
      textvariable $current_pos
      anchor "e"
    }.grid(:column => 1, :row => 3, :sticky => "ew")
    update_pos
    $sizegrip.grid(:column => 2, :row => 3, :sticky => "se")
  else
    $status_bar.destroy
    $sizegrip.grid(:column => 2, :row => 2, :sticky => "se")
  end
end

def update_pos
  pos = $pad.index("insert").split(".")
  $current_pos.value = "Ln #{pos[0]}, Col #{(pos[1].to_i+1).to_s}"
end