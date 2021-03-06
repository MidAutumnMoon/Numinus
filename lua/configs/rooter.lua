vim.g.rooter_silent_chdir = 1
vim.g.rooter_change_directory_for_non_project_files = 'current'
vim.g.rooter_cd_cmd = 'lcd'

vim.g.rooter_patterns = {

    -- General project stuffs
    --
    'README', 'README.*', '.envrc',

    -- Git
    --
    '.git',
    '.gitignore',

    -- Nix
    --
    'default.nix',
    'flake.nix',

    -- Rust
    --
    'Cargo.toml',

    -- Revert
    --
    '!^/etc'
}
