-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

require("game_setup")
require("creepspawn")
require("item_drop")
require("teleport")
require("duel")
-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

XP_PER_LEVEL_TABLE = {
    0,-- 1
    230,-- 2
    600,-- 3
    1080,-- 4
    1660,-- 5
    2260,-- 6
    2980,-- 7
    3730,-- 8
    4620,-- 9
    5550,-- 10
    6520,-- 11
    7530,-- 12
    8580,-- 13
    9805,-- 14
    11055,-- 15
    12330,-- 16
    13630,-- 17
    14955,-- 18
    16455,-- 19
    18045,-- 20
    19645,-- 21
    21495,-- 22
    23595,-- 23
    25945,-- 24
    28545,-- 25
    32045,-- 26
    36545,-- 27
    42045,-- 28
    48545,-- 29
    56045,-- 30
    49500,-- 31
    52700,-- 32
    56000,-- 33
    59400,-- 34
    62900,-- 35
    66500,-- 36
    70200,-- 37
    74000,-- 38
    77900,-- 39
    81900,-- 40
    86000,-- 41
    90200,-- 42
    94500,-- 43
    98900,-- 44
    103400,-- 45
    108000,-- 46
    112700,-- 47
    117500,-- 48
    122400,-- 49
    127400 -- 50
}
function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	GameSetup:init()
	
    CreateUnitByName("npc_dota_demon_possessed", Vector(1500,-2500,0), true, nil, nil, DOTA_TEAM_NEUTRALS)
        
	GameRules:GetGameModeEntity():SetUseCustomHeroLevels(true)
	GameRules:GetGameModeEntity():SetCustomHeroMaxLevel(50)
	GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel(XP_PER_LEVEL_TABLE)
end
-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end