local M = {}

M.get_tree = function ()
    local tree = vim.treesitter.get_parser(bufnr, lang):parse()[1]:root()
    print(tree)
    return tree
end

M.capture = function (str_query)
    local bufnr = vim.api.nvim_get_current_buf()
    local lang = vim.bo.filetype
    local tree = vim.treesitter.get_parser(bufnr, lang):parse()[1]
    local query = vim.treesitter.query.parse(lang, str_query)
    local results = {}

    for id, node, metadata in query:iter_captures(tree:root(), bufnr, 0, -1) do
        -- sort results by the name of the capture
        if results[select(1, node:range())] == nil
        then
            results[select(1, node:range())] = {}
        end

        results[select(1, node:range())][query.captures[id]] = {
            row1 = select(1, node:range()),
            row2 = select(2, node:range()),
            col1 = select(3, node:range()),
            col2 = select(4, node:range()),
            type = node:type(),
            text = vim.treesitter.get_node_text(node, bufnr, nil),
        }

    end

    results['rows'] = {}
    local i = 1

    for k, _ in pairs(results) do
        results['rows'][i] = k
        i = i + 1
    end

    return results
end

return M
