---@class QuestieWotlkQuestFixes
local QuestieWotlkQuestFixes = QuestieLoader:CreateModule("QuestieWotlkQuestFixes")

---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type ZoneDB
local ZoneDB = QuestieLoader:ImportModule("ZoneDB")
---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

function QuestieWotlkQuestFixes:Load()
    local questKeys = QuestieDB.questKeys
    local raceIDs = QuestieDB.raceKeys
    local classIDs = QuestieDB.classKeys
    local zoneIDs = ZoneDB.zoneIDs
    local sortKeys = QuestieDB.sortKeys

    return {
        [11154] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_OBJECT, l10n("Throw the firecrackers up to 20 yards away underneath a darkclaw bat to scare it"), 0, {{"monster", 23959}}}},
        },
        [11157] = {
            [questKeys.objectives] = {{{23777,"Proto-Drake Egg destroyed"},},nil,nil,nil,{{23688,23750,},23688},},
        },
        [11241] = {
            [questKeys.triggerEnd] = {"Rescue Apothecary Hanes",{[zoneIDs.HOWLING_FJORD]={{78.72,37.23,},},},},
        },
        [11246] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{23666,23662,23661,223664,23663,23665,23667,23670,23668,23669,},23666,"Winterskorn Vrykul Dismembered"},},
        },
        [11249] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_EVENT, l10n("Present the Vrykul Scroll of Ascension"), 0, {{"object", 186586}}}},
        },
        [11252] = {
            [questKeys.preQuestSingle] = {},
        },
        [11314] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_EVENT, l10n("Use Lurielle's Pendant on Chill Nymph"), 0, {{"monster", 23678}}}},
        },
        [11343] = {
            [questKeys.triggerEnd] = {"Secrets of Wyrmskull Uncovered",{[zoneIDs.HOWLING_FJORD]={{60.13,50.8,},},},},
        },
        [11344] = {
            [questKeys.triggerEnd] = {"Secrets of Nifflevar Uncovered",{[zoneIDs.HOWLING_FJORD]={{69.04,54.79,},},},},
        },
        [11355] = {
            [questKeys.objectives] = {{{24329,"Runed Stone Giant Corpse Analyzed"},},nil,nil,nil,},
        },
        [11393] = {
            [questKeys.exclusiveTo] = {11394,},
        },
        [11394] = {
            [questKeys.preQuestSingle] = {},
        },
        [11429] = {
            [questKeys.triggerEnd] = {"Alliance Banner Defended",{[zoneIDs.HOWLING_FJORD]={{64.89,40.03,},},},},
        },
        [11436] = {
            [questKeys.triggerEnd] = {"Go Harpoon Surfing",{[zoneIDs.HOWLING_FJORD]={{60.08,62.06,},},},},
        },
        [11460] = {
            [questKeys.triggerEnd] = {"Fjord Rock Falcon Fed",{[zoneIDs.HOWLING_FJORD]={{75.26,64.91,},},},},
        },
        [11466] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_EVENT, l10n("Talk to Olga"), 0, {{"monster", 24639}}}},
        },
        [11471] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_SLAY, l10n("Fight Jonah"), 0, {{"monster", 24742}}}},
        },
        [11472] = {
            [questKeys.triggerEnd] = {"Reef Bull led to a Reef Cow",{[zoneIDs.HOWLING_FJORD]={{31.16,71.63,},},},},
        },
        [11485] = {
            [questKeys.triggerEnd] = {"Rocket Jump Mastered",{[zoneIDs.HOWLING_FJORD]={{75.08,64.55,},},},},
        },
        [11491] = {
            [questKeys.triggerEnd] = {"Lebronski Bluffed",{[zoneIDs.HOWLING_FJORD]={{74.8,65.28,},},},},
        },
        [11495] = {
            [questKeys.triggerEnd] = {"Thundering Cave investigated",{[zoneIDs.HOWLING_FJORD]={{71.5,69.75,},},},},
        },
        [11570] = {
            [questKeys.triggerEnd] = {"Escort Lurgglbr to safety",{[zoneIDs.BOREAN_TUNDRA]={{41.35,16.29,},},},},
        },
        [11590] = {
            [questKeys.objectives] = {{{25316,"Captured Beryl Sorcerer"},},nil,nil,nil,},
        },
        [11591] = {
            [questKeys.exclusiveTo] = {11592,11593,11594,},
        },
        [11592] = {
            [questKeys.triggerEnd] = {"Successfully assisted Longrunner Proudhoof's assault.",{[zoneIDs.BOREAN_TUNDRA]={{49.45,26.49,},},},},
        },
        [11594] = {
            [questKeys.preQuestSingle] = {},
        },
        [11652] = {
            [questKeys.triggerEnd] = {"Scourge Leader identified",{[zoneIDs.BOREAN_TUNDRA]={{36.41,63.52,},},},},
        },
        [11664] = {
            [questKeys.triggerEnd] = {"Mootoo Saved",{[zoneIDs.BOREAN_TUNDRA]={{31.19,54.44,},},},},
        },
        [11673] = {
            [questKeys.triggerEnd] = {"Bonker Togglevolt escorted to safety.",{[zoneIDs.BOREAN_TUNDRA]={{53.84,13.85,},},},},
        },
        [11705] = {
            [questKeys.triggerEnd] = {"Varidus the Flenser Defeated",{[zoneIDs.BOREAN_TUNDRA]={{35.13,46.32,},},},},
        },
        [11708] = {
            [questKeys.triggerEnd] = {"Fizzcrank's tale listened to.",{[zoneIDs.BOREAN_TUNDRA]={{57.01,18.69,},},},},
        },
        [11711] = {
            [questKeys.triggerEnd] = {"Alliance Deserter Delivered",{[zoneIDs.BOREAN_TUNDRA]={{55.28,50.86,},},},},
        },
        [11712] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{25765,25767,25783,25814,26601,26619},25814,"Fizzcrank Gnome cursed & ported"}},
        },
        [11719] = {
            [questKeys.triggerEnd] = {"Bloodspore Flower Used",{[zoneIDs.BOREAN_TUNDRA]={{52.07,52.46,},},},},
        },
        [11878] = {
            [questKeys.triggerEnd] = {"Orphaned Mammoth Calf Delivered to Khu'nok",{[zoneIDs.BOREAN_TUNDRA]={{59.35,30.55,},},},},
        },
        [11890] = {
            [questKeys.triggerEnd] = {"Fizzcrank Pumping Station environs inspected.",{[zoneIDs.BOREAN_TUNDRA]={{65.17,25.2,},},},},
        },
        [11930] = {
            [questKeys.triggerEnd] = {"Secure Passage to Dragonblight",{[zoneIDs.DRAGONBLIGHT]={{10.29,53.83,},},},},
        },
        [12027] = {
            [questKeys.triggerEnd] = {"Help Emily and Mr. Floppy return to the camp",{[zoneIDs.GRIZZLY_HILLS]={{53.81,33.33,},},},},
        },
        [12028] = {
            [questKeys.triggerEnd] = {"Spiritual insight concerning Indu'le Village attained.",{[zoneIDs.DRAGONBLIGHT]={{48.95,75.84,},},},},
        },
        [12032] = {
            [questKeys.triggerEnd] = {"Oacha'noa's compulsion obeyed.",{[zoneIDs.DRAGONBLIGHT]={{34.09,84.01,},},},},
        },
        [12033] = {
            [questKeys.triggerEnd] = {"Letter from Saurfang read and destroyed",{[zoneIDs.DRAGONBLIGHT]={{37.31,46.66,},},},},
        },
        [12036] = {
            [questKeys.triggerEnd] = {"Pit of Narjun Explored",{[zoneIDs.DRAGONBLIGHT]={{26.26,50.01,},},},},
        },
        [12044] = {
            [questKeys.nextQuestInChain] = 12045,
        },
        [12045] = {
            [questKeys.preQuestSingle] = {12044},
        },
        [12050] = {
            [questKeys.preQuestGroup] = {12046,12047},
        },
        [12053] = {
            [questKeys.triggerEnd] = {"Warsong Battle Standard Defended",{[zoneIDs.DRAGONBLIGHT]={{25.09,41.97,},},},},
        },
        [12079] = {
            [questKeys.preQuestSingle] = {12075},
        },
        [12080] = {
            [questKeys.preQuestSingle] = {12076},
        },
        [12082] = {
            [questKeys.triggerEnd] = {"Harrison has escorted you to safety.",{[zoneIDs.GRIZZLY_HILLS]={{73.51,24.02,},},},},
        },
        [12135] = {
            [questKeys.triggerEnd] = {"Put Out the Fires",{
                [zoneIDs.AZUREMYST_ISLE]={{49.3,51.5,},},
                [zoneIDs.DUN_MOROGH]={{53.2,51.4,},},
                [zoneIDs.ELWYNN_FOREST]={{43.2,67,},},
            },},
        },
        [12139] = {
            [questKeys.triggerEnd] = {"Put Out the Fires",{
                [zoneIDs.EVERSONG_WOODS]={{47.3,46.6,},},
                [zoneIDs.DUROTAR]={{52.8,42.6,},},
                [zoneIDs.TIRISFAL_GLADES]={{61,53.5,},},
            },},
        },
        [12150] = {
            [questKeys.triggerEnd] = {"Name of the Magnataur Warlord",{[zoneIDs.DRAGONBLIGHT]={{72.56,49.62,},},},},
        },
        [12258] = {
            [questKeys.preQuestSingle] = {12251},
        },
        [12263] = {
            [questKeys.triggerEnd] = {"Uncover the Magmawyrm Resurrection Chamber",{[zoneIDs.DRAGONBLIGHT]={{31.76,30.46,},},},},
        },
        [12301] = {
            [questKeys.triggerEnd] = {"The Forgotten Redeemed",{[zoneIDs.DRAGONBLIGHT]={{86.86,66.18,},},},},
        },
        [12321] = {
            [questKeys.triggerEnd] = {"Righteous Sermon Heard",{[zoneIDs.DRAGONBLIGHT]={{76.73,47.4,},},},},
        },
        [12327] = {
            [questKeys.triggerEnd] = {"Vision from the Past",{[zoneIDs.SILVERPINE_FOREST]={{46.53,76.18,},},},},
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_EVENT, l10n("Use Gossamer Potion"),0,{{"object", 189972}}}},
        },
        [12330] = {
            [questKeys.triggerEnd] = {"Tatjana Delivered",{[zoneIDs.GRIZZLY_HILLS]={{57.77,41.7,},},},},
        },
        [12427] = {
            [questKeys.triggerEnd] = {"Ironhide defeated",{[zoneIDs.GRIZZLY_HILLS]={{23.2,64.68,},},},},
        },
        [12428] = {
            [questKeys.triggerEnd] = {"Torgg Thundertotem defeated",{[zoneIDs.GRIZZLY_HILLS]={{23.05,64.55,},},},},
        },
        [12429] = {
            [questKeys.triggerEnd] = {"Rustblood defeated",{[zoneIDs.GRIZZLY_HILLS]={{23.12,64.62,},},},},
        },
        [12430] = {
            [questKeys.triggerEnd] = {"Horgrenn Hellcleave defeated",{[zoneIDs.GRIZZLY_HILLS]={{23.11,64.6,},},},},
        },
        [12439] = {
            [questKeys.exclusiveTo] = {11995},
        },
        [12470] = {
            [questKeys.triggerEnd] = {"Hourglass of Eternity protected",{[zoneIDs.DRAGONBLIGHT]={{71.57,38.91,},},},},
        },
        [12473] = {
            [questKeys.triggerEnd] = {"Thel'zan the Duskbringer Defeated",{[zoneIDs.DRAGONBLIGHT]={{81.11,50.64,},},},},
        },
        [12506] = {
            [questKeys.triggerEnd] = {"Main building at the Altar of Sseratus investigated.",{[zoneIDs.ZUL_DRAK]={{40.32,39.46,},},},},
        },
        [12532] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_EVENT, l10n("Capture Chicken Escapee"), 0, {{"monster", 28161}}}},
        },
        [12536] = {
            [questKeys.triggerEnd] = {"Travel to Mistwhisper Refuge.",{[zoneIDs.SHOLAZAR_BASIN]={{46.31,39.88,},},},},
        },
        [12537] = {
            [questKeys.triggerEnd] = {"Sabotage the Mistwhisper Weather Shrine",{[zoneIDs.SHOLAZAR_BASIN]={{45.23,37.1,},},},},
        },
        [12570] = {
            [questKeys.triggerEnd] = {"Escort the Injured Rainspeaker Oracle to Rainspaker Canopy",{[zoneIDs.SHOLAZAR_BASIN]={{53.59,56.76,},},},},
        },
        [12573] = {
            [questKeys.triggerEnd] = {"Extend Peace Offering to Shaman Vekjik",{[zoneIDs.SHOLAZAR_BASIN]={{51.34,64.67,},},},},
        },
        [12578] = {
            [questKeys.triggerEnd] = {"Travel to Mosswalker Village.",{[zoneIDs.SHOLAZAR_BASIN]={{75.07,51.88,},},},},
        },
        [12665] = {
            [questKeys.triggerEnd] = {"Quetz'lun's fate revealed.",{[zoneIDs.ZUL_DRAK]={{75.75,58.39,},},},},
        },
        [12668] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{28747,28748,},28747,"Trolls killed near a Soul Font"},},
        },
        [12671] = {
            [questKeys.triggerEnd] = {"Reconnaissance Flight",{[zoneIDs.SHOLAZAR_BASIN]={{50.04,61.43,},},},},
        },
        [12674] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_EVENT, l10n("Use Quetz'lun's Hexxing Stick and slay him/her"), 0, {{"monster", 28752},{"monster", 28754},{"monster", 28756}}}},
        },
        [12685] = {
            [questKeys.extraObjectives] = {{nil, ICON_TYPE_EVENT, l10n("Use Quetz'lun's Ritual"), 0, {{"monster", 28672}}}},
        },
        [12687] = {
            [questKeys.triggerEnd] = {"The Horseman's Challenge",{[zoneIDs.PLAGUELANDS_THE_SCARLET_ENCLAVE]={{52.41,34.59,},},},},
        },
        [12688] = {
            [questKeys.triggerEnd] = {"Escort Engineer Helice out of Swindlegrin's Dig",{[zoneIDs.SHOLAZAR_BASIN]={{37.26,50.56,},},},},
        },
        [12720] = {
            [questKeys.triggerEnd] = {"\"Crimson Dawn\" Revealed",{[zoneIDs.PLAGUELANDS_THE_SCARLET_ENCLAVE]={{55.09,66.12},{61.3,67.7},{55.31,70.37},{58.32,65.63},{55.76,62.17,},},},},
        },
        [12721] = {
            [questKeys.triggerEnd] = {"Akali unfettered from his chains.",{[zoneIDs.ZUL_DRAK]={{78.64,25.11,},},},},
        },
        [12816] = {
            [questKeys.triggerEnd] = {"Investigate a circle",{[zoneIDs.EVERSONG_WOODS]={{56.5,52,},},},},
        },
        [12817] = {
            [questKeys.triggerEnd] = {"Investigate a circle",{[zoneIDs.AZUREMYST_ISLE]={{34.9,45.5,},},},},
        },
        [12821] = {
            [questKeys.name] = "Cell Block Tango",
            [questKeys.triggerEnd] = {"Garm Teleporter Activated",{[zoneIDs.STORM_PEAKS]={{50.7,81.9,},},},},
        },
        [12832] = {
            [questKeys.triggerEnd] = {"Escort the Injured Goblin Miner to K3.",{[zoneIDs.STORM_PEAKS]={{40.2,79,},},},},
        },
        [12842] = {
            [questKeys.triggerEnd] = {"Weapon emblazoned",{[zoneIDs.PLAGUELANDS_THE_SCARLET_ENCLAVE]={{47.28,31.36},{47.82,27.42},{50.43,28.17},},},},
        },
        [12864] = {
            [questKeys.triggerEnd] = {"Locate Missing Scout",{[zoneIDs.STORM_PEAKS]={{37.68,66.75},{38.49,77.19},{31.65,64.53},{34.56,64.64},{36.43,77.3},},},},
        },
        [12932] = {
            [questKeys.triggerEnd] = {"Yggdras Defeated",{[zoneIDs.ZUL_DRAK]={{47.93,56.85,},},},},
        },
        [12933] = {
            [questKeys.triggerEnd] = {"Stinkbeard Defeated",{[zoneIDs.ZUL_DRAK]={{47.94,56.61,},},},},
        },
        [12934] = {
            [questKeys.triggerEnd] = {"Elemental Lord Defeated",{[zoneIDs.ZUL_DRAK]={{48.01,56.72,},},},},
        },
        [12935] = {
            [questKeys.triggerEnd] = {"Orinoko Tuskbreaker Defeated",{[zoneIDs.ZUL_DRAK]={{48,56.72,},},},},
        },
        [12936] = {
            [questKeys.triggerEnd] = {"Korrak the Bloodrager Defeated",{[zoneIDs.ZUL_DRAK]={{48.04,56.75,},},},},
        },
        [12948] = {
            [questKeys.triggerEnd] = {"Vladof the Butcher Defeated",{[zoneIDs.ZUL_DRAK]={{47.98,56.74,},},},},
        },
        [12954] = {
            [questKeys.triggerEnd] = {"Yggdras Defeated",{[zoneIDs.ZUL_DRAK]={{47.93,56.85,},},},},
        },
        [12973] = {
            [questKeys.triggerEnd] = {"Accompany Brann Bronzebeard to Frosthold.",{[zoneIDs.STORM_PEAKS]={{30.2,74.6,},},},},
            [questKeys.extraObjectives] = {{{[zoneIDs.STORM_PEAKS]={{39.6,56.4}}}, ICON_TYPE_EVENT, l10n("Get in Brann Bronzebeard Flying Machine"),}},
        },
        [13039] = {
            [questKeys.preQuestSingle] = {13036},
        },
        [13040] = {
            [questKeys.preQuestSingle] = {13036},
        },
        [13047] = {
            [questKeys.triggerEnd] = {"Witness the Reckoning",{[zoneIDs.STORM_PEAKS]={{36,31.4,},},},},
        },
        [13141] = {
            [questKeys.triggerEnd] = {"Battle for Crusaders' Pinnacle",{[3711]={{80.06,71.81,},},},},
        },
        [13343] = {
            [questKeys.triggerEnd] = {"Hourglass of Eternity protected from the Infinite Dragonflight.",{[zoneIDs.DRAGONBLIGHT]={{71.74,39.17,},},},},
        },
        [13347] = {
            [questKeys.preQuestSingle] = {12499},
        },
        [13377] = {
            [questKeys.triggerEnd] = {"Assist King Varian Wrynn",{[zoneIDs.UNDERCITY]={{53.75,89.96,},},},},
        },
        [13405] = {
            [questKeys.triggerEnd] = {"Victory in Strand of the Ancients", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [13407] = {
            [questKeys.triggerEnd] = {"Victory in Strand of the Ancients", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [13427] = {
            [questKeys.triggerEnd] = {"Victory in Alterac Valley", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [13428] = {
            [questKeys.triggerEnd] = {"Victory in Alterac Valley", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [13429] = {
            [questKeys.triggerEnd] = {"Help Akama and Maiev enter the Black Temple.",{[zoneIDs.SHADOWMOON_VALLEY]={{71.02,46.12,},},},},
        },
        [13549] = {
            [questKeys.objectives] = {{{29327,"Female Frost Leopards recovered"},{29319,"Female Icepaw Bears recovered"},},nil,nil,nil,},
        },
        [13830] = {
            [questKeys.triggerEnd] = {"Discover the Ghostfish mystery",{[zoneIDs.SHOLAZAR_BASIN]={{48.89,62.29,},},},},
        },
        [14163] = {
            [questKeys.triggerEnd] = {"Victory in the Isle of Conquest", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [14164] = {
            [questKeys.triggerEnd] = {"Victory in the Isle of Conquest", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [14178] = {
            [questKeys.triggerEnd] = {"Victory in Arathi Basin", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [14179] = {
            [questKeys.triggerEnd] = {"Victory in the Eye of the Storm", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [14180] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [14181] = {
            [questKeys.triggerEnd] = {"Victory in Arathi Basin", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [14182] = {
            [questKeys.triggerEnd] = {"Victory in Eye of the Storm", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [14183] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [24216] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [24217] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [24218] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [24219] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [24220] = {
            [questKeys.triggerEnd] = {"Victory in Arathi Basin", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [24221] = {
            [questKeys.triggerEnd] = {"Victory in Arathi Basin", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [24223] = {
            [questKeys.triggerEnd] = {"Victory in Arathi Basin", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [24224] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
        [24225] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [24426] = {
            [questKeys.triggerEnd] = {"Victory in Alterac Valley", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
                [zoneIDs.THUNDER_BLUFF]={{56.05,76.69}},
                [zoneIDs.UNDERCITY]={{60.67,87.66}},
                [zoneIDs.DALARAN]={{58.3,20.5}},
            }},
        },
        [24427] = {
            [questKeys.triggerEnd] = {"Victory in Alterac Valley", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
                [zoneIDs.DARNASSUS]={{58.02,34.52}},
                [zoneIDs.THE_EXODAR]={{26.58,50.04}},
                [zoneIDs.DALARAN]={{29.8,75.7}},
            }},
        },
    }
end