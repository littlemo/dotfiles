hs.loadSpoon("SpoonInstall")
local hyperKey = {'shift', 'alt', 'ctrl', 'cmd'}

-- 快速启动应用
spoon.SpoonInstall:andUse("AppLauncher", {
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
spoon.SpoonInstall:andUse("WindowScreenLeftAndRight", {
  config = {
    animationDuration = 0,
  },
  hotkeys = {
    screen_left = { hyperKey, "Left" },
    screen_right= { hyperKey, "Right" },
  },
})
