# pylint: disable=C0111
import os
import subprocess

# pylint settings to disable linting errors
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103


def read_xresources(prefix):
    props = {}
    try:
        x = subprocess.run(
            ["xrdb", "-query"], capture_output=True, check=True, text=True
        )
        lines = x.stdout.split("\n")
        for line in filter(lambda l: l.startswith(prefix), lines):
            prop, _, value = line.partition(":\t")
            props[prop] = value
    except Exception:
        return {
            "*.background": "#1e1e1e",
            "*.foreground": "#ffffff",
            "*color3": "#f0c674",
            "*color6": "#8abeb7",
            "*color8": "#969896",
            "*color10": "#b5bd68",
            "*color11": "#f0c674",
            "*color12": "#81a2be",
            "*color13": "#b294bb",
            "*color14": "#8abeb7",
        }
    return props


xresources = read_xresources("*")

home = os.path.expanduser("~")
# homepage_path = f"file://{home}/.config/qutebrowser/homepage.html"

# c.url.start_pages = [homepage_path]
# c.url.default_page = homepage_path

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "!aw": "https://wiki.archlinux.org/?search={}",
    "!apkg": "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "!gh": "https://github.com/search?o=desc&q={}&s=stars",
    "!yt": "https://www.youtube.com/results?search_query={}",
}

config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
c.content.blocking.enabled = True
config.set("content.images", True)
config.set("content.javascript.enabled", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://accounts.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://docs.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://drive.google.com/*",
)

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"
config.set("colors.webpage.darkmode.enabled", False, "file://*")
# config.set("content.user_stylesheets", ["~/.config/qutebrowser/styles/styles.css"])

c.window.transparent = True
c.statusbar.show = "never"
c.tabs.show = "multiple"
c.tabs.width = "10%"
c.tabs.padding = {"top": 12, "bottom": 12, "left": 10, "right": 10}
c.tabs.indicator.width = 0
c.tabs.title.format = "{audio}{current_title}"
c.zoom.default = "180%"
c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
    "filesystem",
]
c.downloads.location.directory = "~/Downloads"

c.colors.tabs.even.bg = "rgba(0, 0, 0, 0.0)"
c.colors.tabs.odd.bg = "rgba(0, 0, 0, 0.0)"
c.colors.tabs.bar.bg = "rgba(0, 0, 0, 0.0)"
c.colors.tabs.even.fg = xresources["*.color3"]
c.colors.tabs.odd.fg = xresources["*.color3"]

c.colors.tabs.selected.even.bg = xresources["*color11"]
c.colors.tabs.selected.odd.bg = xresources["*color11"]
c.colors.tabs.selected.even.fg = xresources["*.background"]
c.colors.tabs.selected.odd.fg = xresources["*.background"]

c.colors.statusbar.normal.bg = xresources["*.background"]
c.colors.statusbar.command.bg = xresources["*.background"]
c.colors.statusbar.command.fg = xresources["*.foreground"]
c.colors.statusbar.normal.fg = xresources["*color14"]
c.colors.statusbar.passthrough.fg = xresources["*color14"]
c.colors.statusbar.passthrough.bg = xresources["*.background"]
c.colors.statusbar.url.fg = xresources["*color13"]
c.colors.statusbar.url.success.https.fg = xresources["*color13"]
c.colors.statusbar.url.hover.fg = xresources["*color12"]

c.colors.hints.bg = xresources["*.background"]
c.colors.hints.fg = xresources["*.foreground"]
c.hints.border = xresources["*.foreground"]

c.colors.completion.odd.bg = xresources["*.background"]
c.colors.completion.even.bg = xresources["*.background"]
c.colors.completion.fg = xresources["*.foreground"]
c.colors.completion.match.fg = xresources["*color6"]
c.colors.completion.item.selected.bg = xresources["*.background"]
c.colors.completion.item.selected.fg = xresources["*.foreground"]
c.colors.completion.item.selected.match.fg = xresources["*color6"]
c.colors.completion.category.bg = xresources["*.background"]
c.colors.completion.category.fg = xresources["*.foreground"]

c.colors.messages.info.bg = xresources["*.background"]
c.colors.messages.info.fg = xresources["*.foreground"]
c.colors.messages.error.bg = xresources["*.background"]
c.colors.messages.error.fg = xresources["*.foreground"]

c.colors.downloads.error.bg = xresources["*.background"]
c.colors.downloads.error.fg = xresources["*.foreground"]
c.colors.downloads.bar.bg = xresources["*.background"]
c.colors.downloads.start.bg = xresources["*color10"]
c.colors.downloads.start.fg = xresources["*.foreground"]
c.colors.downloads.stop.bg = xresources["*color8"]
c.colors.downloads.stop.fg = xresources["*.foreground"]

c.colors.tabs.indicator.start = xresources["*color10"]
c.colors.tabs.indicator.stop = xresources["*color8"]
c.colors.tooltip.bg = xresources["*.background"]
c.colors.webpage.bg = xresources["*.background"]

c.fonts.default_family = ["JetBrainsMono Nerd Font"]
c.fonts.default_size = "20pt"
c.fonts.web.family.fixed = "monospace"
c.fonts.web.family.sans_serif = "monospace"
c.fonts.web.family.serif = "monospace"
c.fonts.web.family.standard = "monospace"
c.fonts.web.size.default = 20
c.fonts.statusbar = "bold 20pt monospace"
c.fonts.tabs.selected = "bold 20pt monospace"
c.fonts.tabs.unselected = "20pt monospace"

config.set("fileselect.handler", "external")
ranger_cmd = [
    "kitty",
    "--class",
    "ranger,ranger",
    "-e",
    "ranger",
    "--choosefile",
    "{}",
]
config.set("fileselect.single_file.command", ranger_cmd)
config.set("fileselect.multiple_files.command", ranger_cmd)

config.bind("=", "cmd-set-text -s :open")
config.bind("h", "history")
config.bind("cs", "cmd-set-text -s :config-source")
config.bind("tH", "config-cycle tabs.show multiple never")
config.bind("sH", "config-cycle statusbar.show always never")
config.bind("T", "hint links tab")
config.bind("pP", "open -- {primary}")
config.bind("pp", "open -- {clipboard}")
config.bind("pt", "open -t -- {clipboard}")
config.bind("qm", "macro-record")
config.bind("<ctrl-y>", "spawn --userscript ytdl.sh")
config.bind("tT", "config-cycle tabs.position top left")
config.bind("gJ", "tab-move +")
config.bind("gK", "tab-move -")
config.bind("gm", "tab-move")
config.bind("Z", "hint links spawn st -e youtube-dl {hint-url}")

config.load_autoconfig()
c.auto_save.session = True
