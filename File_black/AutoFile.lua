local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
send_X(msg.chat_id_,msg.id_, 1, "⌯︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌯︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
bot_data:del(XBOT.."MARTEN:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
send_X(msg.chat_id_,msg.id_, 1, "⌯︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
bot_data:set(XBOT.."MARTEN:Lock:AutoFile",true) 
end 
end

if (text and not bot_data:get(XBOT.."MARTEN:Lock:AutoFile")) then
Time = bot_data:get(XBOT.."MARTEN:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = bot_data:smembers(XBOT..'MARTEN:Groups') 
local Members = bot_data:smembers(XBOT..'MARTEN:Users') 
local BotName = (bot_data:get(XBOT.."MARTEN:NameBot") or 'اكس')
local GetJson = '{"BotId": '..XBOT..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = bot_data:get(XBOT.."MARTEN:Groups:Links"..v)
Welcomes = bot_data:get(XBOT..'MARTEN:Groups:Welcomes'..v) or ''
MARTENConstructors = bot_data:smembers(XBOT..'MARTEN:Ownar:'..v)
BasicConstructors = bot_data:smembers(XBOT..'MARTEN:BasicConstructor:'..v)
Constructors = bot_data:smembers(XBOT..'MARTEN:Constructor:'..v)
Managers = bot_data:smembers(XBOT..'MARTEN:Managers:'..v)
Admis = bot_data:smembers(XBOT..'MARTEN:Admins:'..v)
Vips = bot_data:smembers(XBOT..'MARTEN:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #MARTENConstructors ~= 0 then
GetJson = GetJson..'"MARTENConstructors":['
for k,v in pairs(MARTENConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
if #Members ~= 0 then 
GetJson = GetJson..',"mem":['
for k,v in pairs(Members) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
GetJson = GetJson..'}}'
local File = io.open('./'..XBOT..'.json', "w")
File:write(GetJson)
File:close()
local MARTEN = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. MARTEN .. '" -F "chat_id='..DraGon..'" -F "document=@'..XBOT..'.json' .. '" -F "caption=⌯︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه\n⌯︙وتحتوي ايضاَ علئ ↫ '..#Members..' مشتركين\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"'
io.popen(curl)
io.popen('fm -fr '..XBOT..'.json')
bot_data:set(XBOT.."MARTEN:AutoFile:Time",os.date("%x"))
end
else 
bot_data:set(XBOT.."MARTEN:AutoFile:Time",os.date("%x"))
end
end

end
return {
XBOT = AutoFile
}
