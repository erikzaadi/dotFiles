-- Filetype detection
vim.filetype.add({
    extension = {
        j2  = 'jinja',
        prisma = 'graphql',
        mdx = 'markdown',
        nacl = 'salto.vhdl',
    },
    pattern = {
        ['.*tmux%.conf'] = 'tmux',
    },
})

-- Python
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
        vim.opt_local.shiftwidth  = 4
        vim.opt_local.tabstop     = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab   = true
    end,
})

-- JavaScript / TypeScript
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'tsx', 'jsx' },
    callback = function()
        vim.opt_local.softtabstop = 2
        vim.opt_local.tabstop     = 2
        vim.opt_local.shiftwidth  = 2
        vim.opt_local.expandtab   = false
    end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.json',
    callback = function() vim.opt_local.conceallevel = 0 end,
})

-- Go
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'go',
    callback = function()
        vim.opt_local.shiftwidth  = 4
        vim.opt_local.tabstop     = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab   = false
    end,
})

-- Git
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'gitcommit',
    callback = function()
        vim.api.nvim_win_set_cursor(0, { 1, 0 })
        vim.opt_local.spell = true
    end,
})

-- Markdown
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        vim.opt_local.spell = true
        vim.keymap.set('n', '<leader>s', ':<C-u>call markdownfmt#Format()<CR>',
            { buffer = true, silent = true, desc = 'Format markdown' })
    end,
})
