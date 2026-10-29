local record _Test
    record _TestNested 
        attr1: string
        attr2: integer
    end

    record SpawnCommand end

    -- record FormatItemAttribute end
    record Intensity end
    record Underline end

    record ColorSpec end
    record FreeTypeLoadFlags end
    record FreeTypeTarget end
    record HarfbuzzFeatures end
    record FontStretch end
    record FontStyle end
    record FontWeight end

    record GpuInfo
        record Backend end
        record DeviceType end
    end

    record Wezterm__Color end
    record Wezterm__Gui end
    record Wezterm__Mux end
    record Wezterm__NerdFont end
    record Wezterm__Plugin end
    record Wezterm__ProcInfo end
    record Wezterm__Serde end
    record Wezterm__Time end
    record Wezterm__Url end

    record GpuInfo__Backend end
    record GpuInfo__DeviceType end
    record BatteryInfo__State end
    record NerdFont
        tmp2: string
    end
    record StableCursorPosition__Shape end
    record Blend end
    record Interpolation end
    record GradientOrientation end
    record MouseEvent end
    record KeyAssignment end
    record Wezterm
        tmp: string
    end
end

return _Test
