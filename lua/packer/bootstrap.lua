local packer_repo =
    'https://github.com/wbthomason/packer.nvim'

local data_path =
    vim.fn.stdpath 'data'

local install_path =
    data_path .. '/site/pack/packer/start/packer.nvim'


local install_path_is_empty =
    vim.fn.empty( vim.fn.glob(install_path) ) > 0


if install_path_is_empty then
    vim.cmd [[ echom "bootstrapping packer..." ]]

    vim.fn.system {
        'git', 'clone', '--depth', '1', packer_repo, install_path
    }
end


