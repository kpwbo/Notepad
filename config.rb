# Grid configuration

TkGrid.columnconfigure($root, 0, :weight => 1)
TkGrid.rowconfigure($root, 0, :weight => 1)

(1..NUM_COLUMNS).each { |c|
  TkGrid.columnconfigure($content, c, :weight => 1, :minsize => 10)
}

TkGrid.columnconfigure($content, 2, :weight => 0, :minsize => 10)

(1..NUM_ROWS).each { |r|
  TkGrid.rowconfigure($content, r, :weight => 1, :minsize => 10)
}

TkGrid.rowconfigure($content, 2, :weight => 0, :minsize => 10)

TkOption.add "*tearOff", 0