local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
    s("lorem", {
        t("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }),
    s("eslint-disable", {
        t("// eslint-disable-next-line "), i(1, "no-console")
    }),
    s("console-log-with-disable", {
        t({ "// eslint-disable-next-line no-console", "console.log('" }),
        i(1, "ZOMG"),
        t("')")
    }),
})
