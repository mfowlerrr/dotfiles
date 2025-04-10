-- python env manager
return {
  'AckslD/swenv.nvim',
  config = function()
    -- Optional: swenv setup
    -- require('swenv').setup({})

    -- Only set keymap for Python files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'python',
      callback = function()
        vim.keymap.set('n', '<leader>vv', function()
          require('swenv.api').pick_venv()
        end, { buffer = true, desc = 'Pick virtualenv (swenv)' }) -- buffer-local keymap
      end,
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'python',
      callback = function()
        vim.keymap.set('n', '<leader>vc', function()
          require('swenv.api').get_current_venv()
        end, { buffer = true, desc = 'Get [C]urrent Venv' }) -- buffer-local keymap
      end,
    })
  end,
}
