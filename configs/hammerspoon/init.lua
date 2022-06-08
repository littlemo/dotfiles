hs.loadSpoon("SpoonInstall")
Install = spoon.SpoonInstall

-- 设置自定义源
Install.repos.littlemo = {
   url = "https://github.com/littlemo/Spoons",
   desc = "littlemo spoon repository",
   branch = "master",
}

local hyperKey = {'shift', 'alt', 'ctrl', 'cmd'}

-- 快速启动应用
Install:andUse("AppLauncher", {
  config = {
    modifiers = hyperKey,
  },
  hotkeys = {
    u = "Chromium",
    j = "Google Chrome",
    k = "Alacritty",
    l = "Logseq",
    [";"] = "/System/Library/CoreServices/Finder.app",
    m = "Microsoft Outlook",
    w = "企业微信",
    o = "腾讯文档",
    c = "WeChat",
    d = "TickTick",
    t = "TencentMeeting",
  },
})

-- 跨屏幕移动窗口
Install:andUse("WindowScreenMove", {
  repo = "littlemo",
  config = {
    animationDuration = 0,
  },
  hotkeys = {
    screen_left = { hyperKey, "Left" },
    screen_right= { hyperKey, "Right" },
    screen_up   = { hyperKey, "Up" },
    screen_down = { hyperKey, "Down" },
  },
})
