# File menu features

def new_file
  answer = Tk::messageBox(
    :type => "yesnocancel",
    :message => "Do you wish to save the current file first ?",
    :icon => "warning",
    :title => "Save"
  )
  save_file if answer == "yes"
  return if answer == "cancel"
  $pad.delete("1.0", "end")
  $current_file = ""
end

def open_file
  path = Tk.getOpenFile
  return if path == ""
  $pad.delete("1.0","end")
  File.open(path) { |f|
    f.readlines.each { |line|
      $pad.insert("end", "#{line}")
    }
  }
  $current_file = path
end

def save_file(save_path=$current_file)
  if save_path.empty?
    path = Tk.getSaveFile(
      :initialfile => $current_file,
      :defaultextension => ".txt",
      :filetypes => [["Text files", ".txt"],
                     ["Ruby scripts", ".rb"],
                     ["Perl scripts", ".pl"]]
    )
    save_path = path
    return if path == ""
  end
  File.open(save_path,"w+") { |f|
    text = $pad.get("1.0","end")
    f.write(text)
  }
  $current_file = save_path
end

def save_as
  path = Tk.getSaveFile(
    :initialfile => $current_file,
    :defaultextension => ".txt",
    :filetypes => [["Text files", ".txt"],
                   ["Ruby scripts", ".rb"],
                   ["Perl scripts", ".pl"]]
  )
  return if path == ""
  save_file(path)
end

def exit_notepad
  answer = Tk::messageBox(
    :type => "yesnocancel",
    :message => "Do you wish to save the current file first ?",
    :icon => "warning",
    :title => "Save"
  )
  save_file if answer == "yes"
  return if answer == "cancel"
  exit
end
