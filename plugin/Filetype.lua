vim.filetype.add {

  extension = {
    service = "systemd",
    target = "systemd",
    path = "systemd",
    timer = "systemd",

    opml = "xml",
    mobileconfig = "xml",

    hlsl = "hlsl",

    mdx = "markdown",
  },

  filename = {
    [".envrc"] = "bash",
    ["flake.lock"] = "json",
    ["justfile"] = "just"
  }

}
