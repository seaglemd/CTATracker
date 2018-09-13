function CTATracker_CreateBasicFrames()
  CTATracker_BasicFrameElements();
  CTATracker_TemplateFrame();
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
--------------------------------------------------------------------------------
--Basic Template Frames
--------------------------------------------------------------------------------
function CTATracker_TemplateFrame()
  CTATracker_TemplateFrame = CreateFrame("Frame", "CTATracker_TemplateFrame", CTATracker_TopAnchorFrame);
  CTATracker_TemplateFrame:SetPoint("TOP", CTATracker_TopAnchorFrame, 0, -2);
  CTATracker_TemplateFrame:SetWidth(94);
  CTATracker_TemplateFrame:SetHeight(34);
  CTATracker_TemplateFrame.texture = CTATracker_TemplateFrame:CreateTexture(nil, "BACKGROUND");
  CTATracker_TemplateFrame.texture:SetAllPoints(CTATracker_TemplateFrame);
  CTATracker_TemplateFrame.texture:SetColorTexture(0.10,0.10,0.10,0.90);
  CTATracker_TemplateFrame:Show();

  CTATracker_TemplateHeader = CTATracker_TemplateFrame:CreateFontString(nil, "ARTWORK", "GAMEFONTNORMAL");
  CTATracker_TemplateHeader:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE, MONOCHROME");
  CTATracker_TemplateHeader:SetTextColor(1,1,1,1);
  CTATracker_TemplateHeader:SetPoint("TOP", CTATracker_TemplateFrame, 0, -4);
  CTATracker_TemplateHeader:SetText("CTA Template Header");

  CTATracker_ButtonTemplateFrame();
end
--------------------------------------------------------------------------------
--Basic Template Button Frame
--------------------------------------------------------------------------------
function CTATracker_ButtonTemplateFrame()
  CTATracker_ButtonTemplateFrame = CreateFrame("Frame", "CTATracker_ButtonTemplateFrame", CTATracker_TemplateFrame);
  CTATracker_ButtonTemplateFrame:SetPoint("TOP", CTATracker_TemplateFrame, 0, -15);
  CTATracker_ButtonTemplateFrame:SetWidth(90);
  CTATracker_ButtonTemplateFrame:SetHeight(18);
  CTATracker_ButtonTemplateFrame.texture = CTATracker_ButtonTemplateFrame:CreateTexture(nil, "BACKGROUND");
  CTATracker_ButtonTemplateFrame.texture:SetAllPoints(CTATracker_ButtonTemplateFrame);
  CTATracker_ButtonTemplateFrame.texture:SetColorTexture(0,0,0,1);
  CTATracker_ButtonTemplateFrame:Show();

  CTATracker_TankButtonTemplate();
  CTATracker_HealerButtonTemplate();
  CTATracker_DPSButtonTemplate();
end
--------------------------------------------------------------------------------
--Basic Tank Button
--------------------------------------------------------------------------------
function CTATracker_TankButtonTemplate()
  local tankButton = CreateFrame("Button","tankButton",CTATracker_ButtonTemplateFrame);
  tankButton:EnableMouse(true);
  tankButton:SetPoint("LEFT",CTATracker_ButtonTemplateFrame,0,0);
  tankButton:SetWidth(16);
  tankButton:SetHeight(16);
  tankButton:SetFrameStrata("MEDIUM");

  local textureTank = tankButton:CreateTexture();
  textureTank:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-ROLES.blp");
  textureTank:SetTexCoord(0,0.26,0.26,0.52);
  textureTank:SetAllPoints();
  tankButton:SetNormalTexture(textureTank);

  local htex = tankButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight");
  htex:SetTexCoord(0,0.625,0,0.6875);
  htex:SetAllPoints();
  tankButton:SetHighlightTexture(htex);

  local ptex = tankButton:CreateTexture();
  ptex:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES.blp");
  ptex:SetTexCoord(0,0.26,0.26,0.52);
  ptex:SetAllPoints();
  tankButton:SetPushedTexture(ptex);
end
--------------------------------------------------------------------------------
--Basic Healer Button
--------------------------------------------------------------------------------
function CTATracker_HealerButtonTemplate()
  local healerButton = CreateFrame("Button","healerButton",CTATracker_ButtonTemplateFrame);
  healerButton:EnableMouse(true);
  healerButton:SetPoint("CENTER",CTATracker_ButtonTemplateFrame,0,0);
  healerButton:SetWidth(16);
  healerButton:SetHeight(16);
  healerButton:SetFrameStrata("MEDIUM");

  local textureHealer = healerButton:CreateTexture();
  textureHealer:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-ROLES.blp");
  textureHealer:SetTexCoord(0.26,0.52,0,0.26);
  textureHealer:SetAllPoints(healerButton);
  healerButton:SetNormalTexture(textureHealer);

  local htex = healerButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight");
  htex:SetTexCoord(0,0.625,0,0.6875);
  htex:SetAllPoints();
  healerButton:SetHighlightTexture(htex);

  local ptex = healerButton:CreateTexture();
  ptex:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-ROLES.blp");
  ptex:SetTexCoord(0.26,0.52,0,0.26);
  ptex:SetAllPoints();
  healerButton:SetPushedTexture(ptex);
end

--------------------------------------------------------------------------------
--Basic DPS Button
--------------------------------------------------------------------------------
function CTATracker_DPSButtonTemplate()
  local dpsButton = CreateFrame("Button","dpsButton",CTATracker_ButtonTemplateFrame);
  dpsButton:SetPoint("RIGHT", CTATracker_ButtonTemplateFrame,0,0);
  dpsButton:EnableMouse(true);
  dpsButton:SetWidth(16);
  dpsButton:SetHeight(16);
  dpsButton:SetFrameStrata("MEDIUM");

  local textureDPS = dpsButton:CreateTexture();
  textureDPS:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES.blp");
  textureDPS:SetTexCoord(0.26,0.52,0.26,0.52);
  textureDPS:SetAllPoints(dpsButton);
  dpsButton:SetNormalTexture(textureDPS);

  local htex = dpsButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight");
  htex:SetTexCoord(0,0.625,0,0.6875);
  htex:SetAllPoints();
  dpsButton:SetHighlightTexture(htex);

  local ptex = dpsButton:CreateTexture();
  ptex:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES.blp");
  ptex:SetTexCoord(0.26,0.52,0.26,0.52);
  ptex:SetAllPoints();
  dpsButton:SetPushedTexture(ptex);
end

function CTATracker_BasicFrameElements()
  ------------------------------------------------------------------------------
  --Close Tracker Button
  ------------------------------------------------------------------------------
  local CTATracker_CloseTracker = CreateFrame("Button", nil, CTATracker_BottomAnchorFrame);
  CTATracker_CloseTracker:SetPoint("TOP", CTATracker_BottomAnchorFrame, 44, 12);
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
  CTATracker_ConfigButton:SetPoint("TOP", CTATracker_BottomAnchorFrame, 30, 15);
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
