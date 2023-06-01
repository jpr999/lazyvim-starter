return {
  {
    "Shatur/neovim-cmake",
    dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    cmd = "CMake",
    config = function()
      require("cmake").setup({
        parameters_file = "neovim.json",
        configure_args = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
        build_args = { "-j 10" },
        dap_configuration = {
          type = "cppdbg",
          request = "launch",
          setupCommands = {
            {
              description = "Enable pretty-printing",
              text = "-enable-pretty-printing",
            },
          },
        },
        -- dap_open_command = false,
        -- dap_open_command = require('dap').repl.open,
        dap_open_command = require("dapui").open,
      })
    end,
  },
}
