############################ Possible improvements #############################
### - Better search feature (window and feature)
### - Better font selector (window and feature)
### - Search and replace feature
################################################################################

# Tk
require "tk"
require "tkextlib/tile"

# Root window
$root = TkRoot.new {
  title "Notepad is the standard text editor"
  minsize(600, 400)
}

# Content
$content = Tk::Tile::Frame.new($root) {
  padding "0 0 0 0"
}.grid(:sticky => "nsew")

# Configuring grid
NUM_COLUMNS = 2
NUM_ROWS = 2
require_relative "config"

# Menu bar
$menubar = TkMenu.new($root)
$root["menu"] = $menubar

# Menus
require_relative "file_menu"
require_relative "edit_menu"
require_relative "format_menu"
require_relative "display_menu"
require_relative "help_menu"

# Scroll bars
$vertical = Tk::Tile::Scrollbar.new($content) {
  orient "vertical"
  command proc{|*args| $pad.yview(*args)}
}.grid( :column => 2, :row => 1, :sticky => "ns")

$horizontal = Tk::Tile::Scrollbar.new($content) {
  orient "horizontal"
  command proc{|*args| $pad.xview(*args)}
}.grid( :column => 1, :row => 2, :sticky => "we")

# Pad
$pad_font = TkFont.new(:family => "Consolas", :size => 11, :weight => "normal", :slant => "roman")

$pad = TkText.new($content) {
  width 40
  heigh 10
  font $pad_font
  undo "true"
  padx 5
  pady 2
  autoseparators "true"
  yscrollcommand proc{|*args| $vertical.set(*args)}
  xscrollcommand proc{|*args| $horizontal.set(*args)}
  wrap "none"
}.grid( :column => 1, :row => 1, :sticky => "nsew")

# Sizegrip
$sizegrip = Tk::Tile::SizeGrip.new($content).grid(:column => 2, :row => 2, :sticky => "se")

# Name of the opened file
$current_file = ""

# Menu features
require_relative "file_features"
require_relative "edit_features"
require_relative "format_features"
require_relative "display_features"
require_relative "help_features"

# Keyboard bidings
require_relative "keyboard_shortcuts"

# Start!
Tk.mainloop
