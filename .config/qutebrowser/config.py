# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

import theme

config.load_autoconfig()
#  config.bind('<Escape>', 'mode-leave ;; jseval -q document.activeElement.blur()', mode='insert')
c.downloads.location.directory = '~/Downloads'

config.set('content.user_stylesheets', 'darkmode.css')

theme.blood(c, {
    'spacing': {
        'vertical': 3,
        'horizontal': 2
    }
})

config.bind("gi", "hint inputs")
