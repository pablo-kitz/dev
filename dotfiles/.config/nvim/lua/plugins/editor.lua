return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate to left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate to bottom pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate to top pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate to right pane" },
    }
  }
}