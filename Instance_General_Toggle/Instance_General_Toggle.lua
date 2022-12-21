-- Create a new addon object
local MyAddon = {}

-- Create a frame to register events on
local frame = CreateFrame("FRAME")

-- Set up an event handler function to react to events
function MyAddon:OnEvent(event, ...)
  -- Check if the event is the ZONE_CHANGED_NEW_AREA event
  if event == "ZONE_CHANGED_NEW_AREA" then
    -- Check if the player is in an instance
    if IsInInstance() then
      -- Leave the general chat channel
      LeaveChannelByName("general")
    else
      -- Join the general chat channel
      JoinChannelByName("general")
    end
  end
end

-- Set the frame's event handler function
frame:SetScript("OnEvent", MyAddon.OnEvent)

-- Register for the ZONE_CHANGED_NEW_AREA event
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
