---@class QQuest
local QuestieQuest = QuestieLoader:CreateModule("QQuest")

-- System imports
---@type ThreadLib
local ThreadLib = QuestieLoader:ImportModule("ThreadLib")
---@type SystemEventBus
local SystemEventBus = QuestieLoader:ImportModule("SystemEventBus")
---@type QuestEventBus
local QuestEventBus = QuestieLoader:ImportModule("QuestEventBus")
---@type MapEventBus
local MapEventBus = QuestieLoader:ImportModule("MapEventBus")

-- Module Imports
--! REMOVE THIS
local QQ = QuestieLoader:CreateModule("QuestieQuest")

---@type QuestLogCache
local QuestLogCache = QuestieLoader:ImportModule("QuestLogCache")

---@type QuestieMap
local QuestieMap = QuestieLoader:ImportModule("QuestieMap")
---@type QuestieLib
local QuestieLib = QuestieLoader:ImportModule("QuestieLib")
---@type QuestiePlayer
local QuestiePlayer = QuestieLoader:ImportModule("QuestiePlayer")
---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type QuestieCorrections
local QuestieCorrections = QuestieLoader:ImportModule("QuestieCorrections")
---@type QuestieQuestBlacklist
local QuestieQuestBlacklist = QuestieLoader:ImportModule("QuestieQuestBlacklist")
---@type IsleOfQuelDanas
local IsleOfQuelDanas = QuestieLoader:ImportModule("IsleOfQuelDanas")

--- Up values
local yield = coroutine.yield

local function InitializeModule()
    wipe(QuestieQuest.Show.NPC)
    wipe(QuestieQuest.Show.GameObject)
    wipe(QuestieQuest.Show.Item)
    QuestieQuest.CalculateAvailableQuests()
    QuestieQuest.CalculateCompleteQuests()
end
SystemEventBus:RegisterOnce(SystemEventBus.events.INITIALIZE_DONE, InitializeModule)

---@class RelationMapData
---@field type "availablePickup"|"availableDrop"|"finisherComplete"

local relationTypes = {
    availablePickup = {type="availablePickup"},
    availableDrop = {type="availableDrop"},
    finisherComplete = {type="finisherComplete"},
}

---@alias Show {NPC: table<NpcId, {available: table<QuestId, AvailableQuestMapData>, finisher: table<QuestId, FinisherQuestMapData>}>, GameObject: table, Item: table}
---@type Show
QuestieQuest.Show = {
    NPC = {
        --ID
        [0] = {
            available = {
                --[Questid] = { type }
            },
            complete = {
                --[Questid] = { type }
            },
            slay = {
                --[Questid] = { type }
            },
            loot = {
                --[Questid] = { type }
            },
            extra = {
                --[Questid] = { some data }
            }
        }
    },
    GameObject = {
        --ID
        [0] = {
            available = {
                --[Questid] = { type }
            },
            complete = {
                --[Questid] = { type }
            },
            loot = {
                --[Questid] = { type }
            },
            extra = {
                --[Questid] = { some data }
            }
        }
    },
    Item = {
        --ID
        [0] = {
            available = {
                --[Questid] = { type }
            },
            loot = {
                --[Questid] = { type }
            },
            extra = {
                --[Questid] = { some data }
            }
        }
    }
}


local function AddQuestGivers(questId)
    -- print("Add questgives", questId)
    local show = QuestieQuest.Show
    local starts = QuestieDB.QueryQuestSingle(questId, "startedBy") or {}
    if(starts[1] ~= nil)then
        local npcs = starts[1]
        for i=1, #npcs do
            local npcId = npcs[i]
            -- print("Adding quest giver NPC :", npcId, "for quest", questId)
            show.NPC[npcId] = show.NPC[npcId] or {}
            if show.NPC[npcId] == nil then
                show.NPC[npcId] = {}
            end
            if show.NPC[npcId].available == nil then
                show.NPC[npcId].available = {}
            end
            show.NPC[npcId].available[questId] = relationTypes.availablePickup
        end
    end
    if(starts[2] ~= nil)then
        local gameobjects = starts[2]
        for i=1, #gameobjects do
            local gameObjectId = gameobjects[i]
            if show.GameObject[gameObjectId] == nil then
                show.GameObject[gameObjectId] = {}
            end
            if show.GameObject[gameObjectId].available == nil then
                show.GameObject[gameObjectId].available = {}
            end
            show.GameObject[gameObjectId].available[questId] = relationTypes.availablePickup
        end
    end
    if(starts[3] ~= nil)then
        local items = starts[3]
        for i=1, #items do
            local itemId = items[i]
            -- print("Adding quest giver ITEM:", itemId, "for quest", questId)
            if show.Item[itemId] == nil then
                show.Item[itemId] = {}
            end
            if show.Item[itemId].available == nil then
                show.Item[itemId].available = {}
            end
            show.Item[itemId].available[questId] = relationTypes.availableDrop
        end
    end
end

--? Creates a localized space where the local variables and functions are stored
do
    --- Used to keep track of the active timer for CalculateAvailableQuests
    --- Is used by the QuestieQuest.CalculateAndDrawAvailableQuestsIterative func
    ---@type Ticker|nil
    local timer

    local function CalculateAvailableQuests()

        local questsPerYield = 64

        -- Localize the variable for speeeeed
        local debugEnabled = Questie.db.global.debugEnabled

        local data = QuestieDB.QuestPointers or QuestieDB.questData

        local playerLevel = QuestiePlayer.GetPlayerLevel()
        local minLevel = playerLevel - GetQuestGreenRange("player")
        local maxLevel = playerLevel

        if Questie.db.char.absoluteLevelOffset then
            minLevel = Questie.db.char.minLevelFilter
            maxLevel = Questie.db.char.maxLevelFilter
        elseif Questie.db.char.manualMinLevelOffset then
            minLevel = playerLevel - Questie.db.char.minLevelFilter
        end

        local showRepeatableQuests = Questie.db.char.showRepeatableQuests
        local showDungeonQuests = Questie.db.char.showDungeonQuests
        local showRaidQuests = Questie.db.char.showRaidQuests
        local showPvPQuests = Questie.db.char.showPvPQuests
        local showAQWarEffortQuests = Questie.db.char.showAQWarEffortQuests

        --- Fast Localizations
        local autoBlacklist = QQ.autoBlacklist
        local hiddenQuests = QuestieCorrections.hiddenQuests
        local hidden  = Questie.db.char.hidden
        local NewThread = ThreadLib.ThreadSimple
        -- local DB = QuestieLoader:ImportModule("DB")

        local isLevelRequirementsFulfilled = QuestieDB.IsLevelRequirementsFulfilled
        local isDoable = QuestieDB.IsDoable

        local questCount = 0
        for questId in pairs(data) do
            -- local quest = DB.Quest[questId]
            --? Quick exit through autoBlacklist if IsDoable has blacklisted it.
            if (not autoBlacklist[questId]) then
                --Check if we've already completed the quest and that it is not "manually" hidden and that the quest is not currently in the questlog.
                if(
                    (not Questie.db.char.complete[questId]) and -- Don't show completed quests
                    ((not QuestiePlayer.currentQuestlog[questId]) or QuestieDB.IsComplete(questId) == -1) and -- Don't show quests if they're already in the quest log
                    (not hiddenQuests[questId] and not hidden[questId]) and -- Don't show blacklisted or player hidden quests
                    (showRepeatableQuests or (not QuestieDB.IsRepeatable(questId))) and  -- Show repeatable quests if the quest is repeatable and the option is enabled
                    (showDungeonQuests or (not QuestieDB.IsDungeonQuest(questId))) and  -- Show dungeon quests only with the option enabled
                    (showRaidQuests or (not QuestieDB.IsRaidQuest(questId))) and  -- Show Raid quests only with the option enabled
                    (showPvPQuests or (not QuestieDB.IsPvPQuest(questId))) and -- Show PvP quests only with the option enabled
                    (showAQWarEffortQuests or (not QuestieQuestBlacklist.AQWarEffortQuests[questId])) and -- Don't show AQ War Effort quests with the option enabled
                    ((not Questie.IsWotlk) or (not IsleOfQuelDanas.quests[Questie.db.global.isleOfQuelDanasPhase][questId]))
                ) then

                    if isLevelRequirementsFulfilled(questId, minLevel, maxLevel, playerLevel) and isDoable(questId, debugEnabled) then
                        AddQuestGivers(questId)
                        -- QuestieQuest.availableQuests[questId] = true
                        -- --If the quest is not drawn draw the quest, otherwise skip.
                        -- if (not QuestieMap.questIdFrames[questId]) then
                        --     --? This looks expensive, and it kind of is but it offloads the work to a thread, which happens "next frame"
                        --     -- NewThread(function()
                        --     --     ---@type Quest
                        --     --     local quest = QuestieDB:GetQuest(questId)
                        --     --     if (not quest.tagInfoWasCached) then
                        --     --         Questie:Debug(Questie.DEBUG_SPAM, "Caching tag info for quest", questId)
                        --     --         QuestieDB.GetQuestTagInfo(questId) -- cache to load in the tooltip
                        --     --         quest.tagInfoWasCached = true
                        --     --     end
                        --     --     --Draw a specific quest through the function
                        --     --     _QuestieQuest:DrawAvailableQuest(quest)
                        --     -- end, 0)
                        -- else
                        --     --* TODO: How the frames are handled needs to be reworked, why are we getting them from _G
                        --     --We might have to update the icon in this situation (config changed/level up)
                        --     -- for _, frame in ipairs(QuestieMap:GetFramesForQuest(questId)) do
                        --     --     if frame and frame.data and frame.data.QuestData then
                        --     --         local newIcon = _QuestieQuest:GetQuestIcon(frame.data.QuestData)
                        --     --         if newIcon ~= frame.data.Icon then
                        --     --             frame:UpdateTexture(newIcon)
                        --     --         end
                        --     --     end
                        --     -- end
                        -- end
                    else
                        --If the quests are not within level range we want to unload them
                        --(This is for when people level up or change settings etc)
                        -- QuestieMap:UnloadQuestFrames(questId)
                        -- if QuestieQuest.availableQuests[questId] then
                        --     QuestieTooltips:RemoveQuest(questId)
                        -- end
                    end
                end
            end

            -- Reset the questCount
            questCount = questCount + 1
            if questCount > questsPerYield then
                questCount = 0
                yield()
            end
        end
        QuestEventBus.quickFire.CALCULATED_AVAILABLE_QUESTS(QuestieQuest.Show)
    end

    -- Starts a thread to calculate available quests to avoid lag spikes
    function QuestieQuest.CalculateAvailableQuests()
        Questie:Debug(Questie.DEBUG_INFO, "[QuestieQuest.CalculateAvailableQuests] PlayerLevel =", QuestiePlayer.GetPlayerLevel())

        --? Cancel the previously running timer to not have multiple running at the same time
        if timer then
            timer:Cancel()
        end

        --? Run this first because there are parts that depend on the Show data still being there.
        MapEventBus:Fire(MapEventBus.events.MAP.REMOVE_ALL_AVAILABLE)

        --TODO: This should not wipe everything because we will have multiple things here.
        -- wipe(QuestieQuest.Show.NPC)
        -- wipe(QuestieQuest.Show.GameObject)
        -- wipe(QuestieQuest.Show.Item)


        timer = ThreadLib.Thread(CalculateAvailableQuests, 0, "Error in CalculateAvailableQuests", function() print("test") end)
    end
end

local function AddQuestFinishers(questId)
    -- print("Add questgives", questId)
    local show = QuestieQuest.Show
    local finishes = QuestieDB.QueryQuestSingle(questId, "finishedBy") or {}
    if(finishes[1] ~= nil)then
        local npcs = finishes[1]
        for i=1, #npcs do
            local npcId = npcs[i]
            print("Adding quest giver NPC :", npcId, "for quest", questId)
            if show.NPC[npcId] == nil then
                show.NPC[npcId] = {}
            end
            if show.NPC[npcId].finisher == nil then
                show.NPC[npcId].finisher = {}
            end
            show.NPC[npcId].finisher[questId] = relationTypes.finisherComplete
        end
    end
    if(finishes[2] ~= nil)then
        local gameobjects = finishes[2]
        for i=1, #gameobjects do
            local gameObjectId = gameobjects[i]
            print("Adding quest giver GO  :", gameObjectId, "for quest", questId)
            if show.GameObject[gameObjectId] == nil then
                show.GameObject[gameObjectId] = {}
            end
            if show.GameObject[gameObjectId].finisher == nil then
                show.GameObject[gameObjectId].finisher = {}
            end
            show.GameObject[gameObjectId].finisher[questId] = relationTypes.finisherComplete
        end
    end
end

do
    --- Used to keep track of the active timer for CalculateAvailableQuests
    --- Is used by the QuestieQuest.CalculateAndDrawAvailableQuestsIterative func
    ---@type Ticker|nil
    local timer

    local function CalculateCompleteQuests()

        local questsPerYield = 6

        -- Localize the variable for speeeeed
        local debugEnabled = Questie.db.global.debugEnabled

        local questCount = 0
        for questId, data in pairs(QuestLogCache.questLog_DO_NOT_MODIFY) do -- DO NOT MODIFY THE RETURNED TABLE
            if QuestieDB.IsComplete(questId) == 1 then
                AddQuestFinishers(questId)
            end

            -- Reset the questCount
            questCount = questCount + 1
            if questCount > questsPerYield then
                questCount = 0
                yield()
            end
        end
        QuestEventBus.quickFire.CALCULATED_COMPLETED_QUESTS(QuestieQuest.Show)
    end

    -- Starts a thread to calculate available quests to avoid lag spikes
    function QuestieQuest.CalculateCompleteQuests()
        Questie:Debug(Questie.DEBUG_INFO, "[QuestieQuest.CalculateCompleteQuests] PlayerLevel =", QuestiePlayer.GetPlayerLevel())

        --? Cancel the previously running timer to not have multiple running at the same time
        if timer then
            timer:Cancel()
        end

        --? Run this first because there are parts that depend on the Show data still being there.
        MapEventBus:Fire(MapEventBus.events.MAP.REMOVE_ALL_COMPLETED)

        --TODO: This should not wipe everything because we will have multiple things here.
        -- wipe(QuestieQuest.Show.NPC)
        -- wipe(QuestieQuest.Show.GameObject)
        -- wipe(QuestieQuest.Show.Item)


        timer = ThreadLib.Thread(CalculateCompleteQuests, 0, "Error in CalculateCompleteQuests", function() print("test") end)
    end
end