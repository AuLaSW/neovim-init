return {
    'vim-test/vim-test',
    lazy = true,
    cmd = {
        "TestSuite",
        "TestFile",
        "TestClass",
        "TestNearest",
    },
    config = function (...)
    end
}
