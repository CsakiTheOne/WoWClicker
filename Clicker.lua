local score = 0;
local auto = 0;

local frame = CreateFrame("Frame", "ClickerFrame", UIParent, "BasicFrameTemplateWithInset");
frame:SetPoint("LEFT", UIParent, "LEFT", 16, 0);
frame:SetSize(150, 80);

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
    auto = auto + 1;
    score = score - auto;
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

local timer = 1;
frame:SetScript("OnUpdate", function(self, elapsed)
    if (timer > 2.5) then
        score = score + auto / 20;
        frame.lblScore:SetText("Score: " .. score);
        timer = 1;
    else timer = timer + 1;
    end
end);

tick();