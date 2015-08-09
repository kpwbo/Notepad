# help (?) menu

help = TkMenu.new($menubar)
$menubar.add(:cascade, :menu => help, :label => "?")

help.add(
  :command,
  :label => "About...",
  :command => proc { about },
)