vim.opt.completeopt = { "menuone", "noselect", "menu" }

local cmp = require("cmp")

local has_words_before = function()
   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
   return col ~= 0
       and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end


local kind_icons = {
   File = { icon = "", hl = "@text.uri" },
   Module = { icon = "", hl = "@namespace" },
   Namespace = { icon = "", hl = "@namespace" },
   Package = { icon = "", hl = "@namespace" },
   Class = { icon = "𝓒", hl = "@type" },
   Method = { icon = "ƒ", hl = "@method" },
   Property = { icon = "", hl = "@method" },
   Field = { icon = "", hl = "@field" },
   Constructor = { icon = "", hl = "@constructor" },
   Enum = { icon = "ℰ", hl = "@type" },
   Interface = { icon = "ﰮ", hl = "@type" },
   Function = { icon = "", hl = "@function" },
   Variable = { icon = "", hl = "@constant" },
   Constant = { icon = "", hl = "@constant" },
   String = { icon = "𝓐", hl = "@string" },
   Number = { icon = "#", hl = "@number" },
   Boolean = { icon = "⊨", hl = "@boolean" },
   Array = { icon = "", hl = "@constant" },
   Object = { icon = "⦿", hl = "@type" },
   Key = { icon = "🔐", hl = "@type" },
   Null = { icon = "NULL", hl = "@type" },
   EnumMember = { icon = "", hl = "@field" },
   Struct = { icon = "𝓢", hl = "@type" },
   Event = { icon = "🗲", hl = "@type" },
   Operator = { icon = "+", hl = "@operator" },
   TypeParameter = { icon = "𝙏", hl = "@parameter" },
   Component = { icon = "", hl = "@function" },
   Fragment = { icon = "", hl = "@constant" },
}
local icons = require("pluginsetup/icons")

cmp.setup({
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   window = {
      documentation = cmp.config.window.bordered(),
      completion = cmp.config.window.bordered(),
   },
   formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
         -- return special icon for cmdline completion
         if entry.source.name == "cmdline" then
            item.kind = ""
            item.menu = "Vim"
            return item
         elseif entry.source.name == "nvim_lsp_signature_help" then
            item.kind = "Property"
         end
         item.menu = item.kind
         item.kind = icons.kinds[item.kind]
         return item
      end,
   },
   mapping = {
      ["<cr>"] = cmp.mapping.confirm({ select = true }),
      ["<s-tab>"] = cmp.mapping.select_prev_item(),
      ["<tab>"] = cmp.mapping.select_next_item(),
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
   },
   preselect = cmp.PreselectMode.None,
})
