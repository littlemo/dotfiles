hs.loadSpoon("SpoonInstall")
local hyperKey = {'shift', 'alt', 'ctrl', 'cmd'}

-- 快速启动应用
spoon.SpoonInstall:andUse("AppLauncher", {
  config = {
    modifiers = hyperKey,
  },
  hotkeys = {
    o = "Google Chrome",
    k = "Alacritty",
    l = "Logseq",
    m = "Microsoft Outlook",
    w = "企业微信",
    c = "WeChat",
    d = "TickTick",
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
