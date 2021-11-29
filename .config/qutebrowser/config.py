from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

import theme

config: ConfigAPI = config
c: ConfigContainer = c

config.load_autoconfig(False)

theme.blood(c, {'spacing': {'vertical': 0, 'horizontal': 0}})

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'y': 'https://www.youtube.com/results?search_query={}',
    'g': 'https://www.google.com/search?q={}',
    'r': 'https://reddit.com/r/{}',
    'qute': 'https://www.google.com/search?q=qutebrowser+{}',
    'http': 'https://httpstatuses.com/{}',
    'mdn': 'https://developer.mozilla.org/en-US/search?q={}',
    'gh': 'https://github.com/search?q={}',
}

#  config.bind('<Ctrl-R>', 'config-cycle content.user_stylesheets solarized/css/solarized-dark/solarized-dark-all-sites.css ""')
config.set("colors.webpage.darkmode.enabled", True)
config.bind('<Space>', 'set-cmd-text :')
config.bind('j', 'scroll-px 0 200')
config.bind('k', 'scroll-px 0 -200')
config.bind('x', 'tab-close')
config.bind('X', 'undo 1')
config.bind('?', 'open -t ~/.config/qutebrowser/cheatsheet-big.png')
config.bind(',M', 'spawn mpv {url}')
config.bind(',m', 'hint links spawn mpv {hint-url}')
config.bind(',in', 'set-cmd-text -s :spawn --userscript taskadd')
config.bind('<ctrl-w>', 'rl-backward-kill-word', mode="command")
config.bind('<ctrl-w>', 'rl-backward-kill-word', mode="prompt")
config.bind('F', 'hint links tab')
config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
config.bind('gj', 'download-clear', mode='normal')
config.bind(
    ',x', 'config-cycle tabs.show always never;; config-cycle statusbar.show always never')
config.unbind('d', mode="normal")
config.unbind('co', mode="normal")
config.unbind('<ctrl-a>', mode="normal")

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set(
    'content.headers.user_agent',
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36'
    'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.javascript.can_access_clipboard', True,
           'https://github.com/*')
config.set('content.notifications.enabled', False, 'https://www.reddit.com')

c.aliases['tab-detach'] = 'tab-give'
c.aliases['cl'] = 'clear-messages'
c.backend = 'webengine'
c.auto_save.session = True
c.session.lazy_restore = True
c.colors.webpage.bg = '#333'
c.completion.height = '20%'
c.completion.quick = True
c.completion.shrink = True
c.content.headers.do_not_track = True
c.content.javascript.can_open_tabs_automatically = False
c.content.pdfjs = True
c.content.xss_auditing = True
c.content.prefers_reduced_motion = True
c.downloads.location.directory = '~/Downloads'
c.downloads.position = 'bottom'
c.editor.command = ['kitty', 'nvim', '-f', '{file}']
c.fonts.default_family = 'Roboto'
c.fonts.completion.entry = 'monospace'
c.fonts.hints = "12pt monospace"
c.fonts.default_size = '11pt'
c.fonts.completion.category = 'bold 12pt default_family'
c.fonts.completion.entry = '11pt default_family'
c.fonts.tabs.selected = '10pt default_family'
c.fonts.tabs.unselected = '10pt default_family'
c.fonts.statusbar = '11pt default_family'
c.hints.auto_follow = 'unique-match'
c.scrolling.bar = 'when-searching'
c.scrolling.smooth = False
c.statusbar.show = 'always'
c.tabs.title.format = "{audio} {current_title}"
c.tabs.title.format_pinned = ""
c.tabs.wrap = True
c.tabs.new_position.related = "next"
c.tabs.pinned.frozen = False

with config.pattern('coolors.co') as p:
    p.hints.selectors['all'].append('[data-tooltip]')

with config.pattern('github.com') as p:
    p.hints.selectors['all'].append('.btn-link.Details-content--closed')
    p.hints.selectors['all'].append('.btn-link.Details-content--open')

with config.pattern('lichess.org') as p:
    p.hints.selectors['all'].append('cg-board piece')

with config.pattern('reddit.com') as p:
    p.hints.selectors['all'].append('.expando-button')

config.bind("sp", "spawn --userscript qutepocket")
config.bind(',ym', 'yank inline [{title}]({url:pretty})')
config.bind(';Y', 'hint --rapid links yank')
config.bind('zl', 'spawn --userscript localhost list')
config.bind("gi", "hint inputs")
config.bind(">", "tab-move +")
config.bind("<", "tab-move -")
config.bind("zi", "zoom-in")
config.bind("zo", "zoom-out")
config.bind("}", "jseval document.querySelector('video').playbackRate += 0.2")
config.bind("}", "jseval document.querySelector('video').playbackRate -= 0.2")
