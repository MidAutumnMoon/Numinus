require( 'hop' ).setup {
  char2_fallback_key = '<CR>'
}


-- Inclusive variants of Hop's
-- predefined commands

local direction_AC = require( 'hop.hint' ).HintDirection.AFTER_CURSOR
local direction_BC = require( 'hop.hint' ).HintDirection.BEFORE_CURSOR



-- there's a bug in backwards inclusive jump
vim.api.nvim_create_user_command( 'HopChar1CurrentLineBCinc',
  function( input )
    require( 'hop' ).hint_char1(
      {
        direction = direction_BC,
        current_line_only = true,
        inclusive_jump = true
      } )
  end,
  { bang = true } )

vim.api.nvim_create_user_command( 'HopChar1CurrentLineACinc',
  function( input )
    require( 'hop' ).hint_char1(
      {
        direction = direction_AC,
        current_line_only = true,
        inclusive_jump = true
      } )
  end,
  { bang = true } )


-- Keymaps

vim.cmd [[

  " Co-op with quick-scope

  vmap <silent> f <CMD>HopChar1CurrentLineACinc<CR>
  vmap <silent> F <CMD>HopChar1CurrentLineBC<CR>

  omap <silent> f <CMD>HopChar1CurrentLineACinc<CR>
  omap <silent> F <CMD>HopChar1CurrentLineBC<CR>

  nmap <silent> t <CMD>HopChar1CurrentLineAC<CR>
  nmap <silent> T <CMD>HopChar1CurrentLineBC<CR>


  " Mimic the familiar Easymotion keymaps

  nmap <silent> <Leader><Leader>k <CMD>HopLineStartBC<CR>
  nmap <silent> <Leader><Leader>j <CMD>HopLineStartAC<CR>

  vmap <silent> <Leader><Leader>k <CMD>HopLineStartBC<CR>
  vmap <silent> <Leader><Leader>j <CMD>HopLineStartAC<CR>


  " Jump to anywhere

  nmap <silent> ss    <CMD>HopChar2MW<CR>
  nmap <silent> <C-s> <CMD>HopChar1MW<CR>

]]
