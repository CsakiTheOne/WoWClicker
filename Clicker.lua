if (score == nil) then score = 0 end;
if (auto == nil) then auto = 0 end;

local frame = CreateFrame("Frame", "ClickerFrame", UIParent, "BasicFrameTemplateWithInset");
frame:SetMovable(true);
frame:EnableMouse(true);
frame:RegisterForDrag("LeftButton");
frame:SetScript("OnDragStart", frame.StartMoving);
frame:SetScript("OnDragStop", frame.StopMovingOrSizing);
frame:SetPoint("LEFT", UIParent, "LEFT", 16, 0);
frame:SetSize(150, 80);
frame:SetScript("OnHide", function(self) auto = 0; score = 0; frame:Show(); end);

frame.title = frame:CreateFontString(nil, "OVERLAY");
frame.title:SetFontObject("GameFontHighlight");
frame.title:SetPoint("LEFT", frame.TitleBg, "LEFT", 5, 0);
frame.title:SetText("Clicker game");

frame.lblScore = frame:CreateFontString(nil, "OVERLAY");
frame.lblScore:SetFontObject("GameFontNormal");
frame.lblScore:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -30);
frame.lblScore:SetText("Score: 0");

frame.btna = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate");
frame.btna:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 10);
frame.btna:SetSize(50, 23);
frame.btna:SetText("+auto");
frame.btna:SetScript("OnClick", function(self, arg1)
    score = score - (auto * auto * auto);
    auto = auto + 0.1;
    frame.lblScore:SetText("Score: " .. score);
end);

frame.btnc = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate");
frame.btnc:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -10, 10);
frame.btnc:SetSize(80, 23);
frame.btnc:SetText("Click me!");
frame.btnc:SetScript("OnClick", function(self, arg1)
    score = score + auto + 1;
    frame.lblScore:SetText("Score: " .. score);
end);

frame:SetScript("OnUpdate", function(self, elapsed)
    frame.btna:SetEnabled(score > auto * auto * auto);
    score = score + auto / 45;
    frame.lblScore:SetText("Score: " .. round(score, 1));
end);

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

tick();