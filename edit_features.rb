# Edit menu features

def select_all
  $pad.tag_add("sel", "1.0", "end")
  $pad.mark_set("insert", "end")
end

def undo
  begin
    $pad.edit_undo
  rescue RuntimeError
  end
end

def copy
  $pad.event_generate("<Copy>")
end

def cut
  $pad.event_generate("<Cut>")
end

def paste
  $pad.event_generate("<Paste>")
end

def delete
  begin
    $pad.delete("sel.first","sel.last")
  rescue RuntimeError
  end
end

def search
  $search_window = TkToplevel.new($root) {
    title "Search"
  }
  
  search_content = Tk::Tile::Frame.new($search_window) {
    padding "3 3 3 3"
  }.grid( :sticky => "nsew")
  
  Tk::Tile::Label.new(search_content) {
    text "Search :"
  }.grid( :column => 1, :row => 1)
  
  $search_entry = TkVariable.new
  
  entry = Tk::Tile::Entry.new(search_content) {
    textvariable $search_entry
  }.grid( :column => 2, :row => 1)
  
  $search_selection = TkVariable.new
  $search_selection.value = "no"
  
  Tk::Tile::CheckButton.new(search_content) {
    text "Search in selection"
    variable $search_selection
    onvalue "yes"
    offvalue "no"
  }.grid( :column => 1, :row => 2, :columnspan => 2, :sticky => "w")
  
  $search_case = TkVariable.new
  $search_case.value = "no"
  
  Tk::Tile::CheckButton.new(search_content) {
    text "Match case"
    variable $search_case
    onvalue "yes"
    offvalue "no"
  }.grid( :column => 1, :row => 3, :columnspan => 2, :sticky => "w")
  
  Tk::Tile::Button.new(search_content) {
    text "Find next"
    command "search_next"
  }.grid( :column => 3, :row => 1)
  
  Tk::Tile::Button.new(search_content) {
    text "Cancel"
    command "search_exit"
  }.grid( :column => 3, :row => 3)
  
  Tk::Tile::Button.new(search_content) {
    text "Find all"
    command "search_all"
  }.grid( :column => 3, :row => 2)
  
  $search_window.bind("Return") {
    search_next
  }
  
  entry.focus
end

def search_next
  $pad.tag_delete("search_result")
  if ($search_pos == "" || $search_pos == nil)
    if $search_selection == "no"
      $search_start = "1.0"
    else
      $search_start = "sel.first"
    end
  end
  if $search_selection.value == "yes"
    begin
      if $search_case.value == "no"
        $search_pos = $pad.tksearch(["nocase"],$search_entry.value, $search_start, "sel.last")
      else
        $search_pos = $pad.search($search_entry.value, $search_start, "sel.last")
      end
    rescue RuntimeError
    end
  else
    if $search_case.value == "no"
      $search_pos = $pad.tksearch(["nocase"], $search_entry.value, $search_start,"end")
    else
      $search_pos = $pad.search($search_entry.value, $search_start,"end")
    end
  end
  return if $search_pos == "" || $search_pos == nil
  $pad.tag_configure("search_result", :background => "green")
  $pad.tag_add("search_result",$search_pos,"#{$search_pos+$search_entry.value.length}")
  $search_start = $search_pos+$search_entry.value.length
end

def search_all
  $pad.tag_delete("search_result")
  return if $search_entry.value == ""
  if $search_selection.value == "no"
    $search_start = "1.0"
  else
    $search_start = "sel.first"
  end
  loop {
    if $search_selection.value == "yes"
      begin
        if $search_case.value == "no"
          $search_pos = $pad.tksearch(["nocase"],$search_entry.value, $search_start, "sel.last")
        else
          $search_pos = $pad.search($search_entry.value, $search_start, "sel.last")
        end
      rescue RuntimeError
      end
    else
      if $search_case.value == "no"
        $search_pos = $pad.tksearch(["nocase"], $search_entry.value, $search_start,"end")
      else
        $search_pos = $pad.search($search_entry.value, $search_start,"end")
      end
    end
    return if $search_pos == "" || $search_pos == nil
    $pad.tag_configure("search_result", :background => "green")
    $pad.tag_add("search_result",$search_pos,"#{$search_pos+$search_entry.value.length}")
    $search_start = $search_pos+$search_entry.value.length
  }
end

def search_exit
  $pad.tag_delete("search_result")
  $search_window.destroy
end

def time_date
  time = Time.now
  output = time.hour.to_s.rjust(2, "0") + ":"
  output += time.min.to_s.rjust(2, "0") + " "
  output += time.year.to_s.rjust(4, "0") + "-"
  output += time.month.to_s.rjust(2, "0") + "-"
  output += time.day.to_s.rjust(2, "0")
  $pad.insert("insert", output)
end
