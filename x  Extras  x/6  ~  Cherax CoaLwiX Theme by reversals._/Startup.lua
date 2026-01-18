-- Cherax Startup Script

-- Load Default Themes
ClickGUI.LoadTheme("coalwix")
ListGUI.LoadTheme("Original")
Logger.LogInfo("Loaded Default Themes")

-- Optional load lua scripts and their features
-- Utils.ExecuteScript("MyScript.lua")

-- Load Default Feature Settings
-- This includes hotkeys aswell as lua features
if FeatureMgr.LoadSettings("mymain.json") then
	Logger.LogInfo("Loaded Default Settings")
end
SetShouldUnload()