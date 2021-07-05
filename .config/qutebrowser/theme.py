def blood(c, options={}):
    palette = {
        'background': '#1e2029',
        'background-alt': '#16171d',
        'background-attention': '#181920',
        'border': '#282a36',
        'current-line': '#44475a',
        'selection': '#252C41',
        'foreground': '#f8f8f2',
        'foreground-alt': '#e0e0e0',
        'foreground-attention': '#ccc',
        'comment': '#6272a4',
        'cyan': '#8be9fd',
        'green': '#50fa7b',
        'orange': '#ffb86c',
        'dark-orange': '#624327',
        'pink': '#ff79c6',
        'purple': '#bd93f9',
        'red': '#ff5555',
        'yellow': '#f1fa8c'
    }

    spacing = options.get('spacing', {'vertical': 2, 'horizontal': 2})

    padding = options.get(
        'padding', {
            'top': spacing['vertical'],
            'right': spacing['horizontal'],
            'bottom': spacing['vertical'],
            'left': spacing['horizontal']
        })

    # Background color of the completion widget category headers.
    c.colors.completion.category.bg = palette['background']

    # Bottom border color of the completion widget category headers.
    c.colors.completion.category.border.bottom = palette['border']

    # Top border color of the completion widget category headers.
    c.colors.completion.category.border.top = palette['border']

    # Foreground color of completion widget category headers.
    c.colors.completion.category.fg = palette['foreground']

    # Background color of the completion widget for even rows.
    c.colors.completion.even.bg = palette['background']

    # Background color of the completion widget for odd rows.
    c.colors.completion.odd.bg = palette['background-alt']

    # Text color of the completion widget.
    c.colors.completion.fg = palette['foreground']

    # Background color of the selected completion item.
    c.colors.completion.item.selected.bg = palette['selection']

    # Bottom border color of the selected completion item.
    c.colors.completion.item.selected.border.bottom = palette['selection']

    # Top border color of the completion widget category headers.
    c.colors.completion.item.selected.border.top = palette['selection']

    # Foreground color of the selected completion item.
    c.colors.completion.item.selected.fg = palette['foreground']

    # Foreground color of the matched text in the completion.
    c.colors.completion.match.fg = palette['orange']

    # Color of the scrollbar in completion view
    c.colors.completion.scrollbar.bg = palette['background']

    # Color of the scrollbar handle in completion view.
    c.colors.completion.scrollbar.fg = palette['foreground']

    # Background color for the download bar.
    c.colors.downloads.bar.bg = palette['background']

    # Background color for downloads with errors.
    c.colors.downloads.error.bg = palette['background']

    # Foreground color for downloads with errors.
    c.colors.downloads.error.fg = palette['red']

    # Color gradient stop for download backgrounds.
    c.colors.downloads.stop.bg = palette['background']

    c.colors.downloads.system.bg = 'none'

    c.colors.hints.bg = palette['background']
    c.colors.hints.fg = palette['orange']
    c.colors.hints.match.fg = palette['background-alt']
    c.hints.border = '0'
    c.hints.padding = {"bottom": 2, "left": 5, "right": 5, "top": 2}

    c.colors.keyhint.bg = palette['background']
    c.colors.keyhint.fg = palette['foreground-attention']
    c.colors.keyhint.suffix.fg = palette['orange']

    c.colors.messages.error.bg = palette['background']
    c.colors.messages.error.border = palette['background-alt']
    c.colors.messages.error.fg = palette['red']
    c.colors.messages.info.bg = palette['background']
    c.colors.messages.info.border = palette['background-alt']
    c.colors.messages.info.fg = palette['comment']
    c.colors.messages.warning.bg = palette['background']
    c.colors.messages.warning.border = palette['background-alt']
    c.colors.messages.warning.fg = palette['red']

    c.colors.prompts.bg = palette['background']
    c.colors.prompts.border = '0px solid ' + palette['background-alt']
    c.colors.prompts.fg = palette['foreground']
    c.colors.prompts.selected.bg = palette['selection']

    c.statusbar.padding = padding
    c.colors.statusbar.caret.bg = palette['background']
    c.colors.statusbar.caret.fg = palette['orange']
    c.colors.statusbar.caret.selection.bg = palette['background']
    c.colors.statusbar.caret.selection.fg = palette['orange']
    c.colors.statusbar.command.bg = palette['background']
    c.colors.statusbar.command.fg = palette['foreground-attention']
    c.colors.statusbar.command.private.bg = palette['background']
    c.colors.statusbar.command.private.fg = palette['foreground-alt']
    c.colors.statusbar.insert.bg = palette['background-attention']
    c.colors.statusbar.insert.fg = palette['foreground-attention']
    c.colors.statusbar.normal.bg = palette['background']
    c.colors.statusbar.normal.fg = palette['foreground']
    c.colors.statusbar.passthrough.bg = palette['background']
    c.colors.statusbar.passthrough.fg = palette['orange']
    c.colors.statusbar.private.bg = palette['background-alt']
    c.colors.statusbar.private.fg = palette['foreground-alt']
    c.colors.statusbar.progress.bg = palette['background']
    c.colors.statusbar.url.error.fg = palette['red']
    c.colors.statusbar.url.fg = palette['foreground']
    c.colors.statusbar.url.hover.fg = palette['background']
    c.colors.statusbar.url.success.http.fg = palette['green']
    c.colors.statusbar.url.success.https.fg = palette['green']
    c.colors.statusbar.url.warn.fg = palette['yellow']

    c.colors.tabs.bar.bg = palette['selection']
    c.colors.tabs.even.bg = palette['selection']
    c.colors.tabs.even.fg = palette['foreground']
    c.colors.tabs.odd.bg = palette['selection']
    c.colors.tabs.odd.fg = palette['foreground']

    c.colors.tabs.selected.even.bg = palette['dark-orange']
    c.colors.tabs.selected.even.fg = palette['foreground']
    c.colors.tabs.selected.odd.bg = palette['dark-orange']
    c.colors.tabs.selected.odd.fg = palette['foreground']

    c.colors.tabs.pinned.even.bg = palette['selection']
    c.colors.tabs.pinned.even.fg = palette['foreground']
    c.colors.tabs.pinned.odd.bg = palette['selection']
    c.colors.tabs.pinned.odd.fg = palette['foreground']

    c.colors.tabs.pinned.selected.even.bg = palette['dark-orange']
    c.colors.tabs.pinned.selected.even.fg = palette['foreground']
    c.colors.tabs.pinned.selected.odd.bg = palette['dark-orange']
    c.colors.tabs.pinned.selected.odd.fg = palette['foreground']

    c.colors.tabs.indicator.error = palette['red']
    c.colors.tabs.indicator.start = palette['orange']
    c.colors.tabs.indicator.stop = palette['dark-orange']
    c.colors.tabs.indicator.system = 'none'

    c.tabs.indicator.width = 1
    c.tabs.favicons.scale = 1
    c.tabs.padding = {**padding, 'top': 4, 'bottom': 4}
