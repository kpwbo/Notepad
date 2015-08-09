# Format menu features

def auto_wrap
  if $wrap == "wrap"
    $pad.wrap = "word"
    $horizontal.grid_remove
    $sizegrip.grid_remove
    TkGrid.rowconfigure($content, 2, :weight => 0, :minsize => 0)
  else
    $pad.wrap = "none"
    $horizontal.grid
    $sizegrip.grid
    TkGrid.rowconfigure($content, 2, :weight => 0, :minsize => 10)
  end
end

def font_selector
  $font_window = TkToplevel.new($root) {
    title "Font"
  }
  
  font_content = Tk::Tile::Frame.new($font_window) {
    padding "3 3 3 3"
  }.grid(:sticky => "nsew")
  
  (1..2).each { |c|
    TkGrid.columnconfigure(font_content, c, :weight => 1, :minsize => 10)
  }
  
  (1..5).each { |r|
    TkGrid.rowconfigure(font_content, r, :weight => 1, :minsize => 10)
  }
  
  Tk::Tile::Label.new(font_content) {
    text "Font :"
  }.grid(:column => 1, :row => 1)
  
  fonts = TkFont.families.sort
  $picked_font = TkVariable.new
  
  font_chooser = Tk::Tile::Combobox.new(font_content) {
    textvariable $picked_font
    values fonts
    state "readonly"
  }.grid(:column => 2, :row => 1)
  
  font_chooser.set($pad_font.family)
  
  font_chooser.bind("<ComboboxSelected>") { font_preview_update }

  Tk::Tile::Label.new(font_content) {
    text "Style :"
  }.grid(:column => 1, :row => 2)
  
  styles = ["Normal","Italic","Bold","Bold italic"]
  $picked_style = TkVariable.new
  
  style_chooser = Tk::Tile::Combobox.new(font_content) {
    textvariable $picked_style
    values styles
    state "readonly"
  }.grid(:column => 2, :row => 2)
  
  if $pad_font.weight == "normal"
    if $pad_font.slant == "roman"
      current_style = "Normal"
    else
      current_style = "Italic"
    end
  else
    if $pad_font.slant == "roman"
      current_style = "Bold"
    else
      current_style = "Bold italic"
    end
  end
  
  style_chooser.set(current_style)
  
  style_chooser.bind("<ComboboxSelected>") { font_preview_update }

  Tk::Tile::Label.new(font_content) {
    text "Size :"
  }.grid(:column => 1, :row => 3)
  
  sizes = [8,9,10,11,12,14,16,18,20,22,24,26,28,36,48,72]
  $picked_size = TkVariable.new
  
  size_chooser = Tk::Tile::Combobox.new(font_content) {
    textvariable $picked_size
    values sizes
    state "readonly"
  }.grid(:column => 2, :row => 3)
  
  size_chooser.set($pad_font.size)
  
  size_chooser.bind("<ComboboxSelected>") { font_preview_update }
  
  Tk::Tile::Label.new(font_content) {
    text "Preview :"
  }.grid(:column => 1, :row => 4)
  
  $preview_font = TkFont.new
  font_preview_update
  
  Tk::Tile::Label.new(font_content) {
    text "AaBbYyZz"
    font $preview_font
  }.grid(:column => 2, :row => 4)
  
  Tk::Tile::Button.new(font_content) {
    text "Done"
    command "font_change"
  }.grid(:column => 1, :row => 5)
  
  Tk::Tile::Button.new(font_content) {
    text "Cancel"
    command "font_exit"
  }.grid(:column => 2, :row => 5)
  
  $font_window.focus
end

def font_change
  $pad_font.family = $picked_font.value
  $pad_font.size = $picked_size.value
  if $picked_style.value.downcase.include?("bold")
    $pad_font.weight = "bold"
  else
    $pad_font.weight = "normal"
  end
  if $picked_style.value.downcase.include?("italic")
    $pad_font.slant = "italic"
  else
    $pad_font.slant = "roman"
  end
end

def font_exit
  $font_window.destroy
end

def font_preview_update
  $preview_font.family = $picked_font.value
  $preview_font.size = $picked_size.value
  if $picked_style.value.downcase.include?("bold")
    $preview_font.weight = "bold"
  else
    $preview_font.weight = "normal"
  end
  if $picked_style.value.downcase.include?("italic")
    $preview_font.slant = "italic"
  else
    $preview_font.slant = "roman"
  end
end