local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local MARTEN = bot_data:get("DraGoN:Photo"..result.id_)
if not result.profile_photo_ then 
if MARTEN then 
send_X(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
bot_data:del("DraGoN:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if MARTEN and MARTEN ~= result.profile_photo_.big_.persistent_id_ then 
local MARTEN_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
MARTEN3 = math.random(#MARTEN_text)
send_X(msg.chat_id_, msg.id_, 1, MARTEN_text[MARTEN3], 1, 'html')
end  
bot_data:set("DraGoN:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
Dragon = ChangePhoto
}