vim.g.rooter_silent_chdir = 1
vim.g.rooter_change_directory_for_non_project_files = 'current'

vim.cmd [[

  let g:rooter_patterns = [ ]


  " General project files

  let g:rooter_patterns += [
        \ 'README', 'README.*',
        \ '.envrc',
        \ 'Makefile'
        \ ]

  " Git

  let g:rooter_patterns += [
        \ '.git', '.gitignore'
        \ ]

  " Nix

  let g:rooter_patterns += [
        \ 'default.nix', 'machine.nix'
        \ ]

  " Arch!

  let g:rooter_patterns += [
        \ 'PKGBUILD'
        \ ]

  " Rust

  let g:rooter_patterns += [
        \ 'Cargo.toml'
        \ ]

  " Misc

  let g:rooter_patterns += [
        \ '!^etc'
        \ ]

]]
