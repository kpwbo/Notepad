# Format menu

format = TkMenu.new($menubar)
$menubar.add(:cascade, :menu => format, :label => "Format")

$wrap = TkVariable.new

format.add(
  :checkbutton,
  :label => "Wrap",
  :variable => $wrap,
  :onvalue => "wrap",
  :offvalue => "",
  :command => proc { auto_wrap }
)

format.add(
  :command,
  :label => "Font...",
  :command => proc { font_selector }
)