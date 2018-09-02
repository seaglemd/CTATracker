function CTATracker_ConfigElements()
  ------------------------------------------------------------------------------
  --Config Window Title Header
  ------------------------------------------------------------------------------
  CTATracker_ConfigHeader = CTATracker_ConfigFrame:CreateFontString(nil, "ARTWORK", "GAMEFONTNORMAL");
  CTATracker_ConfigHeader:SetPoint("TOP", CTATracker_ConfigFrame, 0, -5);
  CTATracker_ConfigHeader:SetText("CTA Tracker Configuration");
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

  CTATracker_TWJoinButton1 = CreateFrame("Button", nil, CTATracker_ConfigFrame);
  CTATracker_TWJoinButton1:SetPoint("TOP", CTATracker_ConfigFrame, 100, -20);
CTATracker_TWJoinButton1:SetWidth(15);
CTATracker_TWJoinButton1:SetHeight(15);

CTATracker_TWJoinButton1:SetText("");
CTATracker_TWJoinButton1:SetNormalFontObject("GameFontNormal");

local ntex = CTATracker_TWJoinButton1:CreateTexture();
ntex:SetTexture("Interface/Buttons/UI-OptionsButton");
ntex:SetTexCoord(0,1,0,1);
--ntex:SetTexCoord(0, 0.625, 0, 0.6875)
ntex:SetAllPoints();
CTATracker_TWJoinButton1:SetNormalTexture(ntex);

local htex = CTATracker_TWJoinButton1:CreateTexture();
htex:SetTexture("Interface/Buttons/UI-AttributeButton-Encourage-Hilight");
htex:SetTexCoord(0, 1, 0, 1);
htex:SetAllPoints();
CTATracker_TWJoinButton1:SetHighlightTexture(htex);

local ptex = CTATracker_TWJoinButton1:CreateTexture();
ptex:SetTexture("Interface/Buttons/UI-OptionsButton");
ptex:SetTexCoord(0, 1, 0, 1);
ptex:SetAllPoints();
CTATracker_TWJoinButton1:SetPushedTexture(ptex);
end
