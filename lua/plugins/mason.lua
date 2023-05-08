local M = {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = { ensure_installed = { "lua-language-server" } },
}

function M.config(_, opts)
   require("mason").setup(opts)
end

return M
