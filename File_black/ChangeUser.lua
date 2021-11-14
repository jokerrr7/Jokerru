local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local MARTEN = bot_data:get("MARTEN:User"..result.id_)
if not result.username_ then 
if MARTEN then 
send_X(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..MARTEN.."", 1, 'html')
bot_data:del("MARTEN:User"..result.id_) 
end
end
if result.username_ then 
if MARTEN and MARTEN ~= result.username_ then 
local MARTEN_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
MARTENs = math.random(#MARTEN_text)
send_X(msg.chat_id_, msg.id_, 1, MARTEN_text[MARTENs], 1, 'html')
end  
bot_data:set("MARTEN:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
XBOT = ChangeUser
}