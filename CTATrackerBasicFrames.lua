function CTATracker_CreateBasicFrames()
  CTATracker_BasicFrameElements();
  CTATracker_CreateDungeonFrames(3);
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
--Creates the dungeon frames
--------------------------------------------------------------------------------
function CTATracker_CreateDungeonFrames(num)
  if(CTATracker_Frames ~= nil) then
    CTATracker_CollectGarbage();    
  end
  CTATracker_Frames = {};
  for i=1, num do
    CTATracker_Frames[i] = CTATracker_DungeonFrame:new{
      dungeonFrameName = "CTATracker_DungeonFrame" .. i,
      buttonFrameName = "CTATracker_ButtonFrame" .. i,
      Frame = CreateFrame("Frame", dungeonFrameName, CTATracker_TopAnchorFrame),
      ButtonFrame = CreateFrame("Frame", buttonFrameName,nil),         
      xpos = 0,
      ypos = (34-(i*36))
    };    
    CTATracker_CurrentFrame(CTATracker_Frames[i].Frame, CTATracker_Frames[i].ButtonFrame, CTATracker_Frames[i].ypos);
  end
  CTATracker_MainFrame:SetHeight((num*36)+20);
end
--------------------------------------------------------------------------------
--Basic Template Frames
--------------------------------------------------------------------------------
function CTATracker_CurrentFrame(Frame, ButtonFrame, ypos)  
  Frame:SetPoint("TOP", CTATracker_TopAnchorFrame, 0, ypos);
  Frame:SetWidth(94);
  Frame:SetHeight(34);
  Frame.texture = Frame:CreateTexture(nil, "BACKGROUND");
  Frame.texture:SetAllPoints(Frame);
  Frame.texture:SetColorTexture(0.10,0.10,0.10,0.90);
  Frame:Show();

  FrameHeader = Frame:CreateFontString(nil, "ARTWORK", "GAMEFONTNORMAL");
  FrameHeader:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE, MONOCHROME");
  FrameHeader:SetTextColor(1,1,1,1);
  FrameHeader:SetPoint("TOP", Frame, 0, -4);
  FrameHeader:SetText("CTA Template Header");

  CTATracker_ButtonTemplateFrame(Frame, ButtonFrame);
end
--------------------------------------------------------------------------------
--Basic Template Button Frame
--------------------------------------------------------------------------------
function CTATracker_ButtonTemplateFrame(Frame, ButtonFrame)
  ButtonFrame:SetParent(Frame);
  ButtonFrame:SetPoint("TOP", Frame, 0, -15);
  ButtonFrame:SetWidth(90);
  ButtonFrame:SetHeight(18);
  ButtonFrame.texture = ButtonFrame:CreateTexture(nil, "BACKGROUND");
  ButtonFrame.texture:SetAllPoints(ButtonFrame);
  ButtonFrame.texture:SetColorTexture(0,0,0,1);
  ButtonFrame:Show();

  CTATracker_TankButtonTemplate(ButtonFrame);
  CTATracker_HealerButtonTemplate(ButtonFrame);
  CTATracker_DPSButtonTemplate(ButtonFrame);
end
--------------------------------------------------------------------------------
--Basic Tank Button
--------------------------------------------------------------------------------
function CTATracker_TankButtonTemplate(ButtonFrame)
  local tankButton = CreateFrame("Button","tankButton",ButtonFrame);
  tankButton:EnableMouse(true);
  tankButton:SetPoint("LEFT",ButtonFrame,0,0);
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
function CTATracker_HealerButtonTemplate(ButtonFrame)
  local healerButton = CreateFrame("Button","healerButton",ButtonFrame);
  healerButton:EnableMouse(true);
  healerButton:SetPoint("CENTER",ButtonFrame,0,0);
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
function CTATracker_DPSButtonTemplate(ButtonFrame)
  local dpsButton = CreateFrame("Button","dpsButton",ButtonFrame);
  dpsButton:SetPoint("RIGHT", ButtonFrame,0,0);
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

--------------------------------------------------------------------------------
--Collect the garbage from orphaned frames, your welcome world, I care about
--addon memory usage
--------------------------------------------------------------------------------
function CTATracker_CollectGarbage()
  for i=1, table.getn(CTATracker_Frames) do
    CTATracker_Frames[i].Frame:Hide();
    CTATracker_Frames[i] = nil;
  end
  collectgarbage("collect");
end
