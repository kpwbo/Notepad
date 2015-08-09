# Help (?) menu features

def about
  $about_window = TkToplevel.new($root) {
    title "About"
  }
  
  about_content = Tk::Tile::Frame.new($about_window) {
    padding "20 20 20 20"
  }.grid(:sticky => "nsew")
  
  Tk::Tile::Label.new(about_content) {
    text "Made by kpwbo © 2015"
  }.grid(:column => 1, :row => 1)
  
  Tk::Tile::Label.new(about_content) {
    text "Thank you !"
  }.grid(:column => 1, :row => 2)
end