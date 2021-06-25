# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

import theme

config.load_autoconfig(False)

theme.blood(c, {
    'spacing': {
        'vertical': 0,
        'horizontal': 0
    }
})

config.bind("gi", "hint inputs")
#  config.bind('<Escape>', 'mode-leave ;; jseval -q document.activeElement.blur()', mode='insert')
c.url.searchengines = {
  'DEFAULT': 'https://duckduckgo.com/?q={}',
  'y': 'https://www.youtube.com/results?search_query={}',
  'g': 'https://www.google.com/search?q={}',
  'qute': 'https://www.google.com/search?q=qutebrowser+{}'
}

c.backend = 'webengine'
c.auto_save.session = False

#  config.bind('<Ctrl-R>', 'config-cycle content.user_stylesheets solarized/css/solarized-dark/solarized-dark-all-sites.css ""')
config.set("colors.webpage.darkmode.enabled", True)
config.bind('<Space>', 'set-cmd-text :')
config.bind('j', 'scroll-px 0 150')
config.bind('k', 'scroll-px 0 -150')
config.bind('x', 'tab-close')
config.bind('X', 'undo 1')
config.bind('?', 'open -t ~/.config/qutebrowser/cheatsheet-big.png')
config.bind(',m', 'spawn mpv {url}')
config.bind(',M', 'hint links spawn mpv {hint-url}')
config.unbind('d', mode="normal")

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.notifications.enabled', False, 'https://www.reddit.com')

c.completion.height = '20%'
c.completion.quick = True
c.completion.shrink = True
c.content.headers.do_not_track = True
c.content.javascript.can_open_tabs_automatically = False
c.content.pdfjs = True
c.content.xss_auditing = True
c.downloads.location.directory = '~/Downloads'
c.editor.command = ['kitty', 'nvim', '-f', '{file}']
c.hints.auto_follow = 'unique-match'
c.scrolling.bar = 'when-searching'
c.scrolling.smooth = False
c.statusbar.show = 'always'
c.tabs.title.format = "{audio} {current_title} - {current_url}"
c.tabs.wrap = False
c.fonts.hints = "default_size default_family"

with config.pattern('coolors.co') as p:
    p.hints.selectors['all'].append('[data-tooltip]')

with config.pattern('lichess.org') as p:
    p.hints.selectors['all'].append('cg-board piece')

config.set(
    'hints.selectors',
    {'scrollable': ['.md-sidebar__scrollwrap']},
    #  pattern='*://*.anichart.net/*',
)
config.bind(';c', 'hint scrollable')

config.bind("sp", "spawn --userscript qutepocket")
