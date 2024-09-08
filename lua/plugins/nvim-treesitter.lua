-- 코드 파싱 및 구문 분석 도구
return	{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "javascript", "html", "css", "typescript", "svelte", "markdown" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}

