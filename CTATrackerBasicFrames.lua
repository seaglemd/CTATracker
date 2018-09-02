function CTATracker_CreateBasicFrames()
  CTATracker_BasicFrameElements();
  CTATracker_CreateConfigFrame();
end

function CTATracker_CreateConfigFrame()
  CTATracker_ConfigFrame = CreateFrame("Frame", "CTATracker_ConfigFrame", UIParent);
  CTATracker_ConfigFrame:SetPoint("CENTER", UIParent, 0, 0);
  CTATracker_ConfigFrame:SetMovable(true);
  CTATracker_ConfigFrame:EnableMouse(true);
  CTATracker_ConfigFrame:RegisterForDrag("LeftButton");
  CTATracker_ConfigFrame:SetScript("OnDragStart", CTATracker_ConfigFrame.StartMoving);
  CTATracker_ConfigFrame:SetScript("OnDragStop", CTATracker_ConfigFrame.StopMovingOrSizing);
  CTATracker_ConfigFrame:SetFrameStrata("BACKGROUND");
  CTATracker_ConfigFrame:SetWidth(220);
  CTATracker_ConfigFrame:SetHeight(340);
  CTATracker_ConfigFrame.texture = CTATracker_ConfigFrame:CreateTexture(nil, "BACKGROUND");
  CTATracker_ConfigFrame.texture:SetAllPoints(CTATracker_ConfigFrame);
  CTATracker_ConfigFrame.texture:SetTexture("Interface\\GLUES\\COMMON\\Glue-Tooltip-Background.blp", false);
  CTATracker_ConfigFrame:Hide();

  CTATracker_ConfigElements();
end

function CTATracker_BasicFrameElements()
  ------------------------------------------------------------------------------
  --Close Tracker Button
  ------------------------------------------------------------------------------
  local CTATracker_CloseTracker = CreateFrame("Button", nil, CTATracker_BottomAnchorFrame);
  CTATracker_CloseTracker:SetPoint("TOP", CTATracker_BottomAnchorFrame, 62, 12);
  CTATracker_CloseTracker:SetWidth(10);
  CTATracker_CloseTracker:SetHeight(10);

  CTATracker_CloseTracker:SetText("X");
  CTATracker_CloseTracker:SetNormalFontObject("GameFontNormal");

  --Close Button Texture Status: Normal, Highlighted, Pushed
  --Normal
  local ntex = CTATracker_CloseTracker:CreateTexture()
  ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up");
  ntex:SetTexCoord(0, 0.625, 0, 6875);
  ntex:SetAllPoints();
  CTATracker_CloseTracker:SetNormalTexture(ntex);
  --Highlighted
  local htex = CTATracker_CloseTracker:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-AttributeButton-Encourage-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_CloseTracker:SetHighlightTexture(htex);
  --Pushed
  local ptex = CTATracker_CloseTracker:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down");
  ptex:SetTexCoord(0, 0.625, 0, 0.6875);
  ptex:SetAllPoints();
  CTATracker_CloseTracker:SetPushedTexture(ptex);
  CTATracker_CloseTracker:SetScript("OnClick", function() CTATracker_MainFrame:Hide(); end);
  ------------------------------------------------------------------------------
  --Config Button
  ------------------------------------------------------------------------------
  local CTATracker_ConfigButton = CreateFrame("Button", nil, CTATracker_BottomAnchorFrame);
  CTATracker_ConfigButton:SetPoint("TOP", CTATracker_BottomAnchorFrame, 48, 15);
  CTATracker_ConfigButton:SetWidth(15);
  CTATracker_ConfigButton:SetHeight(15);

  CTATracker_ConfigButton:SetText("");
  CTATracker_ConfigButton:SetNormalFontObject("GameFontNormal");
  --Normal
  local ntex = CTATracker_ConfigButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-OptionsButton");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_ConfigButton:SetNormalTexture(ntex);
  --Highlighted
  local htex = CTATracker_ConfigButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-AttributeButton-Encourage-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_ConfigButton:SetHighlightTexture(htex);
  --Pushed
  local ptex = CTATracker_ConfigButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-OptionsButton");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_ConfigButton:SetPushedTexture(ptex);
  CTATracker_ConfigButton:SetScript("OnClick", function() CTATracker_ConfigFrame:Show(); end);
end
