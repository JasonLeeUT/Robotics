local isCustomizationScript=sim.getScriptAttribute(sim.getScriptHandle(sim.handle_self),sim.scriptattribute_scripttype)==sim.scripttype_customizationscript

if not sim.isPluginLoaded('Bwf') then
    function sysCall_init()
    end
else
    function sysCall_init()
        model={}
        simBWF.appendCommonModelData(model,simBWF.modelTags.INSTANCIATEDPARTHOLDER)
        if isCustomizationScript then
            -- Customization script
            if model.modelVersion==1 then
                require("/BlueWorkforce/scripts/partCreationAndHandling/common")
                require("/BlueWorkforce/scripts/partCreationAndHandling/customization_ext")
                require("/BlueWorkforce/scripts/partCreationAndHandling/customization_main")
            end
        else
            -- Child script
--            if model.modelVersion==1 then
--                require("/BlueWorkforce/scripts/partCreationAndHandling/common")
--                require("/BlueWorkforce/scripts/partCreationAndHandling/child_main")
--            end
        end
        sysCall_init() -- one of above's 'require' redefined that function
    end
end
