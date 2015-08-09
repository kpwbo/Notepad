# File menu

file = TkMenu.new($menubar)
$menubar.add(:cascade, :menu => file, :label => "File")

file.add(
  :command,
  :label => "New",
  :command => proc { new_file },
  :accelerator => "Ctrl+N"
)

file.add(
  :command,
  :label => "Open...",
  :command => proc { open_file },
  :accelerator => "Ctrl+O"
)

file.add(
  :command,
  :label => "Save",
  :command => proc { save_file },
  :accelerator => "Ctrl+S"
)

file.add(
  :command,
  :label => "Save As...",
  :command => proc { save_as }
)

file.add(:separator)

file.add(
  :command,
  :label => "Exit",
  :command => proc { exit_notepad },
  :accelerator => "Alt+F4"
)
