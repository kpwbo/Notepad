# Edit menu

edit = TkMenu.new($menubar)
$menubar.add(:cascade, :menu => edit, :label => "Edit")

edit.add(
  :command,
  :label => "Undo",
  :command => proc { undo },
  :accelerator => "Ctrl+Z"
)

edit.add(:separator)

edit.add(
  :command,
  :label => "Cut",
  :command => proc { cut },
  :accelerator => "Ctrl+X"
)

edit.add(
  :command,
  :label => "Copy",
  :command => proc { copy },
  :accelerator => "Ctrl+C"
)

edit.add(
  :command,
  :label => "Paste",
  :command => proc { paste },
  :accelerator => "Ctrl+V"
)

edit.add(
  :command,
  :label => "Delete",
  :command => proc { delete },
  :accelerator => "Del"
)

edit.add(:separator)

edit.add(
  :command,
  :label => "Search...",
  :command => proc { search },
  :accelerator => "Ctrl+F"
)

edit.add(:separator)

edit.add(
  :command,
  :label => "Select All",
  :command => proc { select_all },
  :accelerator => "Ctrl+A"
)

edit.add(
  :command,
  :label => "Time/Date",
  :command => proc { time_date },
  :accelerator => "F5"
)
