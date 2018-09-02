SLASH_CTA1 = '/cta';

function CTATracker_handler(msg, editbox)
	if CTATracker_MainFrame:IsVisible() and msg=="" then
		CTATracker_MainFrame:Hide();
	elseif msg=="" then
		CTATracker_MainFrame:Show();
	end
end
SlashCmdList["CTA"] = CTATracker_handler;
