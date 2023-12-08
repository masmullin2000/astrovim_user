-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["\\"] = { "" }, -- unmap the horizontal split
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["h"] = { "i" },
    ["i"] = { "k" },
    ["k"] = { "j" },
    ["j"] = { "h" },
    ["<C-j>"] = { "<cmd>wincmd h<cr>", desc = "Go to Left window" },
    ["<C-k>"] = { "<cmd>wincmd j<cr>", desc = "Go to down window" },
    ["<C-i>"] = { "<cmd>wincmd k<cr>", desc = "Go to up window" },
    ["<C-l>"] = { "<cmd>wincmd l<cr>", desc = "Go to right window" },
    ["<leader>c"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Toggle comment line",
    },
    ["<leader>tt"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["gt"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
    ["gT"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["h"] = { "i" },
    ["i"] = { "k" },
    ["k"] = { "j" },
    ["j"] = { "h" },
    ["<leader>c"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment for selection",
   }
  }
}
