return {
    audible_bell = 'Disabled',

    automatically_reload_config = true,

    exit_behavior = 'CloseOnCleanExit', -- if the shell program exited with a successful status
    exit_behavior_messaging = 'Verbose',

    scrollback_lines = 5000,

    skip_close_confirmation_for_processes_named = {
        'bash',
        'sh',
        'zsh',
        'fish',
        'tmux',
        'nu',
        'cmd.exe',
        'pwsh.exe',
        'powershell.exe',
    },
}
