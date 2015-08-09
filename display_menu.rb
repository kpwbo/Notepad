# Display menu

display = TkMenu.new($menubar)
$menubar.add(:cascade, :menu => display, :label => "Display")

$status_bar_toggle = TkVariable.new

display.add(
  :checkbutton,
  :label => "Status bar",
  :variable => $status_bar_toggle,
  :onvalue => "show",
  :offvalue => "",
  :command => proc { show_status_bar },
)