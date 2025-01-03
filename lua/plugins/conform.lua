return {

  {

    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "google-java-format",
      },
    },
  },
}
