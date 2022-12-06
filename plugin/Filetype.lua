vim.filetype.add {

  extension = {
    service = "systemd",
    target = "systemd",
    path = "systemd",
    timer = "systemd",

    opml = "xml",

    just = "just",
  },

  filename = {
    [".envrc"] = "bash",
    ["flake.lock"] = "json",
    ["justfile"] = "just"
  }

}
