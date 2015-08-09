require "tk"
require "tkextlib/tile"

def new_button(parent, text, invoque, column, row, columnspan = 1, sticky = "")
	Tk::Tile::Button.new(parent) {
		text(text)
		command {
			send(invoque)
		}
	}.grid( :column => column, :row => row, :columnspan => columnspan, :sticky => sticky)
end

def new_label_text(parent, text, column, row, columnspan = 1, sticky = "")
	Tk::Tile::Label.new(parent) {
		text(text)
	}.grid( :column => column, :row => row, :columnspan => columnspan, :sticky => sticky)
end

def new_label_textvariable(parent, variable, column, row, columnspan = 1, sticky = "")
	Tk::Tile::Label.new(parent) {
		textvariable(variable)
	}.grid( :column => column, :row => row, :columnspan => columnspan, :sticky => sticky)
end

def new_entry(parent, variable, column, row, columnspan = 1, sticky = "")
	Tk::Tile::Entry.new(parent) {
		textvariable(variable)
	}.grid( :column => column, :row => row, :columnspan => columnspan, :sticky => sticky)
end

def new_labelframe(parent,text,column,row,columnspan = 1, sticky = "")
	Tk::Tile::Labelframe.new(parent) {
		text(text)
	}.grid( :column => column, :row => row, :columnspan => columnspan, :sticky => sticky)
end