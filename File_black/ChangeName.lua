local function ChangeName(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local MARTEN = bot_data:get("DraGoN:Name"..result.id_)
if not result.first_name_ then 
if MARTEN then 
bot_data:del("DraGoN:Name"..result.id_) 
end
end
if result.first_name_ then 
if MARTEN and MARTEN ~= result.first_name_ then 
local MARTEN_text = {
"اسمك "..result.first_name_.." ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك "..result.first_name_.."\n قطيت احد حبي ؟ 🌚😹",
"اسمك "..result.first_name_.." فد شي وين زخرفته ؟، 🤤♥️", 
}
MARTENs = math.random(#MARTEN_text)
send_X(msg.chat_id_, msg.id_, 1, MARTEN_text[MARTENs], 1, 'html')
end  
bot_data:set("DraGoN:Name"..result.id_, result.first_name_)  
end
end
end,nil) 
end
end

end
return {
XBOT = ChangeName
}