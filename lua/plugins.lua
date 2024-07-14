local packer = require("packer")
packer.startup(
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 你的插件列表...
  end)

-- 以浮动窗口打开安装列表
config = {
  display = {
    open_fn = function()
       return require("packer.util").float({ border = "single"})
    end,
  },
}

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

packer.startup({
  function(use)
    -- Packer 可以自己升级
    use("wbthomason/packer.nvim")
    ---------------- colorschemes ---------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    use("mhartington/oceanic-next")
    -- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")
    -- kanagawa
    use("rebelot/kanagawa.nvim")
    ------------------ plugins ------------------
    -- 侧边文件列表 nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- 顶部标签栏 bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye"}})
    -- 底部状态栏 lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" }})
    use("arkav/lualine-lsp-progress")
    -- 模糊搜索 telescope
    use{ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" }}
    -- 模糊搜索扩展
    use "LinArcX/telescope-env.nvim"
    -- 启动界面 dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- 语法高亮 treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- 语法补全 coc
    use{"neoclide/coc.nvim", branch = 'release' }
    -- 自动空格 surround
    -- use{"tpope/vim-surround"}
    -- 对齐线 indentLine
    use {
        'Yggdroot/indentLine',
        config = function()
            vim.g.indentLine_char = '│' 
            -- 你可以根据需要更改对齐线的字符
            vim.g.indentLine_fileTypeExclude = {'dashboard'} 
            -- 如果你想要排除某些文件类型，请添加到此列表
            vim.g.indentLine_concealcursor = 'n' 
            -- 控制对齐线在不同模式下的可见性
            vim.g.indentLine_char_list = {'|', '¦', '┆', '┊'} 
            -- 自定义对齐线字符列表
            vim.g.indentLine_setColors = 0 
            -- 禁用对齐线自动匹配颜色，可根据需要进行自定义
        end
    }
    use {'lewis6991/gitsigns.nvim'}
    -- use {'vimfn/clipboard'}

    --------------------------- LSP ------------------------------
    -- use("williamboman/nvim-lsp-installer")
    -- Lspconfig
    -- use({ "neovim/nvim-lspconfig" })
    
    -- next
  end,
  config = {
    -- 锁定插件在snapshots目录
    -- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- 锁定插件版本在v1,不会继续更新
    -- snapshot = "v1",
    
    -- 最大并法数
    -- max_jobs = 16,
  },
})
