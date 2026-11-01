local record _Test
    record _TestNested 
        attr1: string
        attr2: integer
    end

    record FontRules end
    record Behavior end
    record SpawnCommand end
    record AllowSquareGlyphs end
    record Modifiers end
    record ExecDomain end
    record HyperlinkRule end
    record PaletteBrights end
    record Key end
    record LeaderKey end
    record DisplayPixelGeometry end
    record HsbTransform end
    record TabInformation end
    record StableCursorPosition end
    record RenderableDimensions end
    record WindowEvent end
    record GuiScreensInfo end
    record MuxDomain end
    record TabBar end
    record LocalProcessInfo end
    record PaneProgress end
    record PaneInformation end
    record PaletteAnsi end
    record Config end
    record DroppedFileQuoting end
    record EasingFunction end
    record Gradient end
    record MouseBindingBase end
    record NotifyHandler end
    record QuickSelectAlphabet end
    record SerialDomain end
    record TabBarStyle end
    record TlsDomainClient end
    record TlsDomainServer end
    record UnixDomain end
    record VisualBell end
    record WebGpuPowerPreference end
    record WindowDecorations end
    record WindowFrameConfig end
    record WindowPadding end
    record Ribbon end

    -- record FormatItemAttribute end
    record Intensity where self._tl_type == "Intensity"
        _tl_type: string
    end
    record Underline where self._tl_type == "Underline"
        _tl_type: string
    end

    enum Colorschemes end

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
    record Pane end
    record MuxWindow end
    record MuxTab end
    record SpawnTabDomain
        tmp: string
    end
    record DomainName
        tmp: integer
    end
    record Window end
    record Url end
    record WeztermConfig end
    record Events end
    record Harfbuzz end
    record Color end
    record Mux end
    record Nerdfonts end
    record WeztermPlugin end
    record ProcInfo end
    record Serde end
    record Time end
    record WeztermEvent end
    record EventCallback end
    record Gui end
    record BatteryInfo end
    record FontFamilyAttributes end
    record FormatItem end
    record HyperLinkRule end
    record Palette end
    record SshDomain end
    record TextStyle end
    record TextStyleAttributes end
    record WslDomain end
    record KeyEvent end
    record FormatItemSpec end
    record LinearGradientOrientation end
    record RadialGradientOrientation end
    record MouseEventInfo end
    record PaneSelectMode end
    record Action end
    record EmitEvent end
    record ClipboardCopyDestination end
    record CharGroup end

    record ActivateKeyTableParams end
    record CharSelectParams end
    record ClipboardPasteDestination end
    record ConfirmationParams end
    record CopyModeParams end
    record CopyTextToParams end
    record InputSelectorParams end
    record PaneDirection end
    record PaneSelectParams end
    record PromptInputLineParams end
    record QuickSelectArgsParams end
    record RotationDirection end
    record ScrollbackEraseMode end
    record SearchParams end
    record SelectionMode end
    record SendKeyParams end
    record SetWindowLevelParams end
    record ShowLauncherArgsParams end
    record SplitPaneParams end
    record SwitchToWorkspaceParams end
    record Parallax end
    record VerticalAlign end
    record FormatItemAttribute where self._tl_type == "FormatItemAttribute"
        _tl_type: string
    end
    record TabBarColor where self._tl_type == "TabBarColor"
        _tl_type: string
    end

    record KeyBinding where self.key ~= nil
        event: KeyEvent
        key: string
        
    end
    record MouseBinding where self.key == nil
        event: MouseEvent
        key: nil
    end
end

return _Test



