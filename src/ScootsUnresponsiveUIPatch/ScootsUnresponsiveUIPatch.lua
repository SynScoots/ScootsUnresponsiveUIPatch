local masterFrame = CreateFrame('Frame', 'ScootsUnresponsiveUIPatchMasterFrame', UIParent)

local frames = {
    {
        ['parent'] = 'QuestLogFrame',
        ['children'] = {
            'QuestLogFrameAbandonButton',
            'QuestLogFramePushQuestButton',
            'QuestLogFrameTrackButton'
        }
    }
}

local reorderFrames = {
    {
        ['adjust'] = 'LootDBFrame',
        ['by'] = 10,
        ['relativeto'] = {
            'AttuneMgrFrame'
        }
    },
    {
        ['adjust'] = 'ISelFrame',
        ['by'] = 10,
        ['relativeto'] = {
            'BHunterFrame',
            'LootDBFrame',
            'LFilterFrame'
        }
    }
}

local numberedFrames = {
    {
        ['parent'] = 'TPortFrame',
        ['prefix'] = 'TPortFrame-Cat',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 4
    },
    {
        ['parent'] = 'TPortFrame-Content1',
        ['prefix'] = 'TPortFrame-Line',
        ['suffix'] = '-Bar',
        ['min'] = 1,
        ['max'] = 30
    },
    {
        ['parent'] = 'AttuneMgrFrame-Content1',
        ['prefix'] = 'AttuneMgrFrame-ILine-',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 500
    },
    {
        ['parent'] = 'LootDBFrame-Content1',
        ['prefix'] = 'LootDBFrame-ILine-',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 100
    },
    {
        ['parent'] = 'LootDBFrame-Content2',
        ['prefix'] = 'LootDBFrame-SLine-',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 100
    },
    {
        ['parent'] = 'ISelFrame',
        ['prefix'] = 'ISelFrame-ILine-',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 100
    },
    {
        ['parent'] = 'PerkMgrFrame',
        ['prefix'] = 'PerkMgrFrame-Option-',
        ['suffix'] = '',
        ['min'] = 0,
        ['max'] = 30
    },
    {
        ['parent'] = 'PerkMgrFrame',
        ['prefix'] = 'PerkMgrFrame-PerkLine-',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 100
    },
    {
        ['parent'] = 'LBoardFrame',
        ['prefix'] = 'LBoardFrame-TLine-',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 40
    },
    {
        ['parent'] = 'RBankFrame',
        ['prefix'] = 'RBankFrame-ILine-',
        ['suffix'] = '',
        ['min'] = 1,
        ['max'] = 200
    }
}

local reorderFrames = {
    {
        ['adjust'] = 'LootDBFrame',
        ['by'] = 10,
        ['relativeto'] = {
            'AttuneMgrFrame'
        }
    },
    {
        ['adjust'] = 'ISelFrame',
        ['by'] = 10,
        ['relativeto'] = {
            'BHunterFrame',
            'LootDBFrame',
            'LFilterFrame'
        }
    }
}

masterFrame:SetScript('OnUpdate', function()
    for _, config in pairs(frames) do
        if(_G[config.parent] ~= nil and _G[config.parent]:IsVisible()) then
            local baseLevel = _G[config.parent]:GetFrameLevel()
            for _, frameName in pairs(config.children) do
                if(_G[frameName] ~= nil) then
                    _G[frameName]:SetFrameLevel(baseLevel + 10)
                end
            end
        end
    end
    
    for _, config in pairs(reorderFrames) do
        if(_G[config.adjust] ~= nil and _G[config.adjust]:IsVisible()) then
            local level = _G[config.adjust]:GetFrameLevel()
            
            for _, compare in pairs(config.relativeto) do
                if(_G[compare] ~= nil and _G[compare]:IsVisible()) then
                    level = math.max(level, _G[compare]:GetFrameLevel() + config.by)
                end
            end
            
            _G[config.adjust]:SetFrameLevel(level)
        end
    end

    for _, config in pairs(numberedFrames) do
        if(_G[config.parent] ~= nil and _G[config.parent]:IsVisible()) then
            local baseLevel = _G[config.parent]:GetFrameLevel()
            for i = config.min, config.max do
                local frameName = config.prefix .. tostring(i) .. config.suffix
                if(_G[frameName] ~= nil) then
                    _G[frameName]:SetFrameLevel(baseLevel + 10)
                end
            end
        end
    end
end)