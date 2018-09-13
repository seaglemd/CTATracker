function CTATracker_ConfigElements()
  ------------------------------------------------------------------------------
  --Config Window Title Header
  ------------------------------------------------------------------------------
  CTATracker_ConfigHeader = CTATracker_ConfigFrame:CreateFontString(nil, "ARTWORK", "GAMEFONTNORMAL");
  CTATracker_ConfigHeader:SetPoint("TOP", CTATracker_ConfigFrame, 0, -5);
  CTATracker_ConfigHeader:SetText("CTA Tracker Configuration");

  CTATracker_LFRSplit = CTATracker_ConfigFrame:CreateFontString(nil,"ARTWORK","GameFontNormal");
  CTATracker_ScaleHeader = CTATracker_ConfigFrame:CreateFontString(nil, "ARTWORK","GameFontNormal");
  CTATracker_ScaleNumber = CTATracker_ConfigFrame:CreateFontString(nil, "ARTWORK","GameFontNormal");
  ------------------------------------------------------------------------------
  --Config Window Close Button
  ------------------------------------------------------------------------------
  local button = CreateFrame("Button", nil, CTATracker_ConfigFrame);
  button:SetPoint("TOP", CTATracker_ConfigFrame, 100, -6);
  button:SetWidth(10);
  button:SetHeight(10);

  button:SetText("X");
  button:SetNormalFontObject("GameFontNormal");

  --Close Button Texture Status: Normal, Highlighted, Pushed
  --Normal
  local ntex = button:CreateTexture()
  ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up");
  ntex:SetTexCoord(0, 0.625, 0, 6875);
  ntex:SetAllPoints();
  button:SetNormalTexture(ntex);
  --Highlighted
  local htex = button:CreateTexture();
  htex:SetTexture("Interface/Buttons/ButtonHilight-Square");
  htex:SetTexCoord(0, 0.625, 0, 0.6875);
  htex:SetAllPoints();
  button:SetHighlightTexture(htex);
  --Pushed
  local ptex = button:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down");
  ptex:SetTexCoord(0, 0.625, 0, 0.6875);
  ptex:SetAllPoints();
  button:SetPushedTexture(ptex);
  button:SetScript("OnClick", function() CTATracker_ConfigFrame:Hide(); end);
  ------------------------------------------------------------------------------
  --Slider for Scale
  ------------------------------------------------------------------------------
  CTATracker_ScaleSlider = CreateFrame("Slider","S",CTATracker_ConfigFrame);
  CTATracker_ScaleSlider:SetPoint("TOPRIGHT",-10,-25);
  CTATracker_ScaleSlider:SetWidth(130);
  CTATracker_ScaleSlider:SetHeight(15);
  CTATracker_ScaleSlider:SetOrientation("HORIZONTAL");
  CTATracker_ScaleSlider:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal");
  CTATracker_ScaleSlider:SetMinMaxValues(0.5,3.0);
  CTATracker_ScaleSlider:SetValueStep(0.05);
  CTATracker_ScaleSlider:SetObeyStepOnDrag(true);
  CTATracker_ScaleSlider:SetValue(CTATracker_MainFrame:GetScale());
  CTATracker_ScaleSlider:SetBackdrop({
        bgFile="Interface\\Buttons\\UI-SliderBar-Background",
        edgeFile="Interface\\Buttons\\UI-SliderBar-Border",
        tile = true, tileSize =8, edgeSize =8,
        insets = {left =3, right =3, top =6, bottom =6}});
  CTATracker_ScaleSlider:SetScript("OnValueChanged", function(self, value) CTATracker_ScaleNumber:SetText(round(value,2)); CTATracker_MainFrame:SetScale(value); end);

  CTATracker_ScaleNumber:SetPoint("TOPLEFT",CTATracker_ScaleSlider,-30,-2);
  CTATracker_ScaleNumber:SetText(CTATracker_MainFrame:GetScale());

  CTATracker_ScaleHeader:SetPoint("TOPLEFT",CTATracker_ScaleSlider,-70,-2);
  CTATracker_ScaleHeader:SetText("Scale: ");
  --------------------------------------------------------------------------------
  --Rounding function for slider value displays
  --------------------------------------------------------------------------------
  function round(num, idp)
    local mult =  10^idp;
    local newNum = math.floor(num * mult + 0.5) /mult;
    return newNum;
  end
  --------------------------------------------------------------------------------
  --HEROIC WATCH CHECK BUTTON
  --------------------------------------------------------------------------------
  CTATracker_HWCheckButton = CreateFrame("CheckButton", "CTATracker_HWCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
  CTATracker_HWCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, -15, -20);
  CTATracker_HWCheckButtonText:SetText("Heroic Watching");
  CTATracker_HWCheckButton.tooltip = "Check to watch for heroic CTA.";
  if (CTATracker_HeroicWatch == true) then
    CTATracker_HWCheckButton:SetChecked(true);
  else
    CTATracker_HWCheckButton:SetChecked(false);
  end

  CTATracker_HWCheckButton:SetScript("OnClick",
    function()
      CTATracker_HeroicWatchConfig();
    end
  );
--------------------------------------------------------------------------------
--Heroic Tank Watch Check Button
--------------------------------------------------------------------------------
CTATracker_HWTankCheckButton = CreateFrame("CheckButton", "CTATracker_HWTankCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_HWTankCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -40);
CTATracker_HWTankCheckButtonText:SetText("Tank");
CTATracker_HWTankCheckButton.tooltip = "Check to watch only for Heroic Tank CTA.";
if (CTATracker_HeroicTankWatch == true) then
  CTATracker_HWTankCheckButton:SetChecked(true);
else
  CTATracker_HWTankCheckButton:SetChecked(false);
end
CTATracker_HWTankCheckButton:SetScript("OnClick",
  function()
    CTATracker_HeroicWatchTank();
  end
);
--------------------------------------------------------------------------------
--Heroic Healer Watch Check Button
--------------------------------------------------------------------------------
CTATracker_HWHealerCheckButton = CreateFrame("CheckButton", "CTATracker_HWHealerCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_HWHealerCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -60);
CTATracker_HWHealerCheckButtonText:SetText("Healer");
CTATracker_HWHealerCheckButton.tooltip = "Check to watch only for Heroic Healer CTA.";
if (CTATracker_HeroicHealerWatch == true) then
  CTATracker_HWHealerCheckButton:SetChecked(true);
else
  CTATracker_HWHealerCheckButton:SetChecked(false);
end
CTATracker_HWHealerCheckButton:SetScript("OnClick",
  function()
    CTATracker_HeroicWatchHealer();
  end
);
--------------------------------------------------------------------------------
--Heroic DPS Watch Check Button
--------------------------------------------------------------------------------
CTATracker_HWDPSCheckButton = CreateFrame("CheckButton", "CTATracker_HWDPSCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_HWDPSCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -80);
CTATracker_HWDPSCheckButtonText:SetText("DPS");
CTATracker_HWDPSCheckButton.tooltip = "Check to watch only for Heroic DPS CTA.";
if (CTATracker_HeroicDPSWatch == true) then
  CTATracker_HWDPSCheckButton:SetChecked(true);
else
  CTATracker_HWDPSCheckButton:SetChecked(false);
end
CTATracker_HWDPSCheckButton:SetScript("OnClick",
  function()
    CTATracker_HeroicWatchDPS();
  end
);
end
