require("analyzer4d").setup({
    -- the ip address of the Optimizer4D running the Analyzer4D software
    -- If this value is set to nil, the ANALYZER_HOST env variable is used instead
    host = nil,
    -- the port of the json communication server
    port = 17000,

    -- tries to auto connect to the Analyzer4D if there is no connection yet
    -- and a command is executed
    auto_connect = true,

    -- automatically connect to the log of the Analyzer4D
    subscribe_log = false,

    -- clear the buffer containing the Analyzer4D logs on exection of analyzer4d.reload_qml()
    clear_log_on_qml_reload = false
})
