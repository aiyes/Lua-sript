--可以正常使用
--以下列出的全部是系统变量，名称和含义都已预定义好了，不要修改它们，只要根据实际情况去修改它们的值就可以了。
--是否支持车牌查询开关
support_inquire_car = false;
--是否支持历史保单查询
support_query_insurance_history = false;
--是否支持自动报价
support_auto_quote = false;
--是否支持自动核保
support_auto_submit = true;
--服务器IP地址（当保险公司网页访问无需VPN时，这里设置为nil；否则需要设置这个开关，用以判断是否能访问保险公司网页）
web_server_ip_address = "10.134.136.48";
--当前机器人建议运行的工作线程数目(取值范围在1~10之间)
suggest_work_threads_num = 1;
--保险公司类型
insurer_type = "renbao";
--是否显示窗口
show_window = true;
--当前脚本的全局名称。必须是唯一的，浏览器将用它来区分每个脚本
global_name = "人保示例";
--全局超时时间(单位：毫秒)
global_timeout = 10000

--对话框输入参数常量定义
MB_OK = 0;
MB_OKCANCEL = 1;
MB_ABORTRETRYIGNORE = 2;
MB_YESNOCANCEL = 3;
MB_YESNO = 4;
MB_RETRYCANCEL = 5;
MB_CANCELTRYCONTINUE = 6;
--对话框输出结果常量定义
IDOK = 1;
IDCANCEL = 2;
IDABORT = 3;
IDRETRY = 4;
IDIGNORE = 5;
IDYES = 6;
IDNO = 7;
IDTRYAGAIN = 10;
IDCONTINUE = 11;

--内置json函数列表
--json.Valid(s)				 判定给出的s参数是否是有效的JSON字符串
--json.Get(s, k)			 返回json串s里k键处的值（以字符串形式返回）。键的类型是字符串，用'/'或'\\'分级，如要取出json串s（其值为："{'abc':{'a':'1', 'b':'2', 'c':'3'},'d':'4'}"）里第一级键'abc'下的子键'b'的值，可写为jget(s, "/abc/b")。
--json.Set(s, k, v)		 设置json串s里k键处的值为v，并将结果以字符串方式返回。
--json.Size(s, k)			 判断json串s里k键处的元素个数，要求s[k]是数组类型。

--内置系统函数列表
--sys.DBGPrint(fmt,...)			输出调试信息，参数和C函数的printf一致，fmt是格式字符串(和printf一致，可接收%d、%c、%u、%o、%f、%p、%s等等)，后面接变参。

--内置业务函数列表
--web.GetTickCount()   返回当前系统时间（从开机到目前所经历的时间，以毫秒为单位）
--web.GetUserName()		 返回当前用于登录保险公司网页的用户名
--web.GetPassword()		 返回当前用于登录保险公司网页的密码
--web.GetRequest()	 	 返回当前请求队列前端的请求对象
------请求对象包含以下成员
--------id			 类型（C对象），标识符
--------type     类型（整型），0 - 查车牌；1 - 查历史保单；2 - 自动报价；3 - 自动核保。
--------para		 类型（字符串），指示输入的参数，如果是查车牌请求，则这个参数是车牌；如果是其它的则这个参数是输入的JSON串。
--------complete(result) 类型（函数），完成当前请求。
--web.IsRunning()			 返回当前虚拟机是否在运行的标志
--web.Exit(reason)		 退出当前的脚本执行环境（reason可以不给出，否则给出的是退出原因字符串）
--web.NewPage()				 新建页面，并返回建立的页面对象
--web.GetPageCount()	 获取页面数量
--web.GetPageAt(no)		 获取序号是no的页面对象
--web.GetPageTitle(p)  获取页面对象p的标题
--web.GetPageURL(p)		 获取页面对象p的URL
--web.FindPageByTitle(partten)	查找页面标题匹配标题字符串的页面对象并返回，pattern中可包含通配符（?,*）
--web.FindPageByURL(partten)	  查找页面URL匹配URL字符串的页面对象并返回，pattern中可包含通配符（?,*）
--web.Navigate(p, url) 在指定的页面对象p里导航到url指定的网址，成功返回true，否则返回false
--web.ClosePage(p)		 关闭页面对象p指定的窗口
--web.ExecuteScript(p, sc)	在指定的页面对象p里执行js脚本。js脚本的内容在sc字符串里
--web.PutResult(k,v)	 在当前环境下（可跨页面）将字符串v存储到k键下，此环境和js执行环境下的external.put_result(k,v)扩展函数是一致的，可以用来在两种语言里传递数据
--web.GetResult(k)		 在当前环境下（可跨页面）获取k键下存储的字符串值，此环境和js执行环境下的external.gut_result(k)扩展函数是一致的，可以用来在两种语言里传递数据
--web.IsDocumentCompleted(p)	判断页面对象p里的文档载入完成
--web.IsNavigateError(p)	判断页面对象p导航是否出错
--web.OnShowMessage(func)	设置当前环境下网页对话框弹出事件的回调函数，func就是设置的回调函数（如果为nil则取消回调）。
-------对话框弹出事件回调函数原型是：function ShowMessageCallback(p, caption, message, type)  回调函数返回的结果是按下按钮的资源ID（详见“对话框输出结果常量”的定义）
-------回调函数运行环境和正常执行流程不在同一个环境空间下，如果要和主程序空间通讯请使用web.PutResult和web.GetResult。
--web.Wait(ms)			 	 等待ms毫秒后继续执行后续代码
--web.IsElementExist(p,name)	判定指定页面里是否存在name描述的DOM文档对象。name用'.'号连接对象和成员的ID号，最后一个成员如果变量名里含'.'号，可以用'@'号替代。可支持多个对象，对象间用','或';'分隔。
--web.GetNewPage(page,min_ms)	获取最新创建的页面（如果page不为nil，那么这个新页面必须是page的子页面，否则可以是任意页面），且满足创建时间在当前时间前min_ms毫秒之后。
--web.IsTimeout(t)		 判断超时器t是否超时
--web.NewTimeout(ms)	 创建ms毫秒后超时的超时器
--web.Refresh(p)			 刷新页面对象p

--以下为函数部分
--禁止系统弹出框
function OnDialog(page, caption, message, type)
	local pos;
	sys.DBGPrint("截获到系统对话框[%s, dwType=%d]，强制返回继续！\r\n", caption, type);
	sys.DBGPrint("对话消息%s！\r\n", message);
	type = type % 16;
	pos,_=string.find(message,"是否复制");
	
	if (pos ~= nil) then
		if type == MB_OKCANCEL or type == MB_RETRYCANCEL or type == MB_CANCELTRYCONTINUE or type == MB_YESNOCANCEL then
			return IDCANCEL;
		end
		if type == MB_YESNO then
			return IDNO;
		end
	end
	if(type == MB_OK or type == MB_OKCANCEL) then
		return IDOK;
	end
	if(type == MB_ABORTRETRYIGNORE) then
		return IDIGNORE;
	end
	if(type == MB_YESNOCANCEL or type == MB_YESNO) then
		return IDYES;
	end
	if(type == MB_RETRYCANCEL) then
		return IDCANCEL;
	end 
	if(type == MB_CANCELTRYCONTINUE) then
		return IDCONTINUE;
	end
	return IDOK;
end

--等待页面加载完毕
function __WaitForDocumentCompleted(page, ms)
	local tm;
	if(page == nil) then
		return false;
	end
	tm = web.NewTimeout(ms or global_timeout);
	while true do
		if(web.IsDocumentCompleted(page)) then
			return true;
		end
		if(web.IsNavigateError(page)) then
			return false;
		end
		if(web.IsTimeout(tm)) then
			sys.DBGPrint("页面加载超时！\r\n");			
			break;
		end
		web.Wait(50);
	end
	return false;
end

--等待页面的某个对象加载完毕
function WaitForObjectLoaded(page, objName, ms)
	local tm;
	if (page == nil or objName == nil) then
		return false;
	end
	tm = web.NewTimeout(ms or global_timeout);
	while true do
		if web.IsElementExist(page, objName) then
			return true;
		end
		if(web.IsNavigateError(page)) then
			return false;
		end
		if(web.IsTimeout(tm)) then
			sys.DBGPrint("等待对象'"..objName.."'加载完毕超时！\r\n");
			break;
		end
		web.Wait(50);
	end
	return false;
end

--等待页面对象里的文档载入完毕
function WaitForDocumentCompleted(page, ms)
	local title, pos;
	if not __WaitForDocumentCompleted(page, ms or global_timeout) then
		return false;
	end
	title = web.GetPageTitle(page);
	if title ~= nil then
		pos, _ = string.find(title, "证书错误");
		if pos ~= nil then
			if not WaitForObjectLoaded(page, "overridelink") then
				sys.DBGPrint("等待证书错误页面对象加载完毕超时！\r\n");
				return false;
			end
			if (not web.ExecuteScript(page, "document.getElementById(\"overridelink\").click();")) then
				sys.DBGPrint("忽略证书错误脚本执行错误！\r\n");
				return false;
			end
			if not WaitForDocumentCompleted(page, ms or global_timeout) then
				sys.DBGPrint("等待证书错误后续页面加载超时！\r\n");
				return false;
			end
		end
	else
	  sys.DBGPrint("获取新加载页面标题失败！\r\n");
	end
	return true;
end


--等待新页面创建
function WaitForNewPage(page, ms)
	local child, tm;
	if (page == nil or ms == nil) then
		return nil;
	end
	tm = web.NewTimeout(global_timeout);
	while true do
		child = web.GetNewPage(page, ms);
		if child ~= nil then
			return child;
		end
		if(web.IsTimeout(tm)) then
			sys.DBGPrint("等待新页面打开超时！\r\n");
			break;
		end
		web.Wait(10);
	end
	return nil;
end

--登录
function login(page)
	local user, password, url, url1, pos, ret, error, title;
	user = web.GetUserName();
	password = web.GetPassword();
	if user == nil or password == nil then
		return false, "用户名或密码为空"; 
	end
	if not web.Navigate(page, "http://10.134.136.48/") then
		return false, "无法导航到人保首页";
	end
	if not WaitForDocumentCompleted(page) then
		return false, "导航失败";
	end
	title = web.GetPageTitle(page);
	if title == nil then
		return false, "无法获取标题";
	end
	pos, _ = string.find(title, "PICC");
	if pos == nil then
		return false, "无法识别的标题["..title.."]";
	end
	url = web.GetPageURL(page);
	if (url == nil) then
		return false, "无法获取首页URL地址";
	end
	pos,_=string.find(url, "/login?");
	if (pos == nil) then
		pos,_=string.find(url, "/portal/");
		if (pos == nil) then
			sys.DBGPrint("当前导航到的地址是[%s]！\r\n", url);
			return false, error;
		else
			return true, "成功";
		end
	end
	WaitForObjectLoaded(page, "document.getElementById(\"username1\").value;document.getElementById(\"password1\").value;document.getElementById(\"button\")");
	web.PutResult("username", user);
	web.PutResult("password", password);
	if (not web.ExecuteScript(page, "document.getElementById(\"username1\").value=external.get_result(\"username\");\r\n\
								document.getElementById(\"password1\").value=external.get_result(\"password\");\r\n\
								document.getElementById(\"button\").click();")) then
		return false, "执行登录脚本失败！";
	end
	while true do
		url1 = web.GetPageURL(page);
		if url1 ~= url then
			break;
		end
		web.Wait(1);
	end
	WaitForDocumentCompleted(page);
	url = web.GetPageURL(page);
	if (url == nil) then
		return false, "无法获取页面URL地址";
	end
	pos,_ = string.find(url, "/index.jsp?");
	if (pos == nil) then
		return false, "登录到了未知页面["..url.."]";
	end
	return true, "成功";
end

--打开工作台
function opendesk(page)
	local desk, ret;
	web.PutResult("result", "");
	WaitForObjectLoaded(page, "main");
	if (not web.ExecuteScript(page, "var arr=main.document.getElementsByTagName('A');\r\n\
														for(var i=0;i<arr.length;i++){\r\n\
															if(arr[i].title=='>> 北京车险承保系统'){\r\n\
																external.put_result('result','1');\r\n\
																arr[i].click();\r\n\
																break;\r\n\
															}\r\n\
														}\r\n")) then
			return nil, "执行打开工作台脚本失败";
	end
	ret = web.GetResult("result");
	if ret == nil then
		return nil, "执行打开工作台脚本成功，但是没有找到‘承保系统’的标签";
	end
	desk = WaitForNewPage(page, 3000);
	if (desk == nil) then
		return nil, "没有找到新页面";
	end
	WaitForDocumentCompleted(desk);
	return desk, "成功";
end

--自动核保
function auto_check(req)
	local page, err, ret, desk2, engine, cls, model, vin, num, tm, qiangNo, shangNo;
	sys.DBGPrint("发现核保[%s]的请求！\r\n", req.para);
	startTime = web.GetTickCount();
	sys.DBGPrint()
	page = web.NewPage();
	if (page == nil) then
		sys.DBGPrint("新建页面失败！\r\n");
		req:complete("{\"error\":-2,\"msg\":\"创建页面失败\"}");
		return false;
	end
	ret, err = login(page, req);
	if not ret then
		web.ClosePage(page);
		sys.DBGPrint("登录返回结果[%s]！\r\n", err);
		req:complete("{\"error\":-3,\"msg\":\""..err.."\"}");
		return false;
	end
	if web.GetUserName() ~= nil then
		sys.DBGPrint("登录名"..web.GetUserName().."\r\n");
	end
	if web.GetPassword() ~= nil then
		sys.DBGPrint("密码"..web.GetPassword().."\r\n");
	end
	
	
	desk, err = opendesk(page);
	web.ClosePage(page);
	if desk == nil then
		sys.DBGPrint("打开工作台失败[%s]！\r\n", err);
		req:complete("{\"error\":-4,\"msg\":\""..err.."\"}");
		return false;
	end
	WaitForObjectLoaded(desk, "main.page.quick_4S");
	web.PutResult("result","");
	if not web.ExecuteScript(desk, "var obj = main.page.document.getElementById('quick_4S');\r\n\
								if(obj){\r\n\
										obj.click();\r\n\
										external.put_result('result', '1');\r\n\
								}") then
			web.ClosePage(desk);
			sys.DBGPrint("执行点击车商渠道脚本失败！\r\n");
			req:complete("{\"error\":-5,\"msg\":\"执行点击车商渠道脚本失败\"}");
			return false;
	end
	ret = web.GetResult("result");
	if (ret == nil) then
			web.ClosePage(desk);
			sys.DBGPrint("网页未能完全加载！\r\n");
			req:complete("{\"error\":-6,\"msg\":\"网页未能完全加载\"}");
			return false;
	end
	WaitForDocumentCompleted(desk);
	sys.DBGPrint("进入出单页面，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	--json
	if (json.Get(req.para,"/car/plate_no") ~= nil) then
		web.PutResult("plate_no", json.Get(req.para,"/car/plate_no"));
	end
	
	if (json.Get(req.para,"/car/engine_no") ~= nil) then
		web.PutResult("engine_no", json.Get(req.para,"/car/engine_no"));
	end
	
	if (json.Get(req.para,"/car/vin") ~= nil) then
		web.PutResult("vin", json.Get(req.para,"/car/vin"));
	end
	
	if (json.Get(req.para,"/car/register_date") ~= nil) then
		web.PutResult("register_date", json.Get(req.para,"/car/register_date"));
	end
	
	--[[
	if (json.Get(req.para,"/insured person/id_no") ~= nil) then
		web.PutResult("id_no", json.Get(req.para,"/insured person/id_no"));
	end
	]]--
	web.PutResult("id_no", "512927197611165190");
	if (json.Get(req.para,"/insurer") ~= nil) then
		web.PutResult("insurer", json.Get(req.para,"/insurer"));
	end
	
	if (json.Get(req.para,"/insurance/jiaoqiang") ~= nil) then
		web.PutResult("qiang", json.Get(req.para,"/insurance/jiaoqiang"));
		if (json.Get(req.para,"/insurance/qiangDateStart") ~= nil) then
			web.PutResult("qingDataStart", json.Get(req.para,"/insurance/qiangDateStart"));
		end
		if (json.Get(req.para,"/insurance/qiangDateEnd") ~= nil) then
			web.PutResult("qiangDateEnd", json.Get(req.para,"/insurance/qiangDateEnd"));	
		end
	end
	sys.DBGPrint("qiang\r\n");

	if (json.Get(req.para,"/insurance/chesun") ~= nil) then
		web.PutResult("chesun", json.Get(req.para,"/insurance/chesun"));
		if (json.Get(req.para,"/insurance/chesun/buji") ~= nil) then
			web.PutResult("chesunbuji", json.Get(req.para,"/insurance/chesun/buji"));
		end
	end
	sys.DBGPrint("chesun\r\n");
	

	if (json.Get(req.para,"/insurance/daoqiang") ~= nil) then
		web.PutResult("daoqiang", json.Get(req.para,"/insurance/daoqiang"));	
		if (json.Get(req.para,"/insurance/daoqiang/buji") ~= nil) then
		web.PutResult("daoqiangbuji", json.Get(req.para,"/insurance/daoqiang/buji"));
		end
	end
	sys.DBGPrint("daoqiang\r\n");
	
	if(json.Get(req.para,"/insurance/sanzhe") ~= nil) then
		web.PutResult("sanzhe", json.Get(req.para,"/insurance/sanzhe"));
		if(json.Get(req.para,"/insurance/sanzhe/baoe") ~= nil) then
		web.PutResult("sanzhebaoe", json.Get(req.para,"/insurance/sanzhe/baoe"));
		end
		if(json.Get(req.para,"/insurance/sanzhe/buji") ~= nil) then
		web.PutResult("sanzhebuji", json.Get(req.para,"/insurance/sanzhe/buji"));
		end
	end
	sys.DBGPrint("sanzhe\r\n");
	
	if(json.Get(req.para,"/insurance/siji") ~= nil) then
		web.PutResult("siji", json.Get(req.para,"/insurance/siji"));
		if(json.Get(req.para,"/insurance/siji/baoe") ~= nil) then
		web.PutResult("sijibaoe", json.Get(req.para,"/insurance/siji/baoe"));
		end
		if(json.Get(req.para,"/insurance/siji/buji") ~= nil) then
		web.PutResult("sijibuji", json.Get(req.para,"/insurance/siji/buji"));
		end
	end
	sys.DBGPrint("siji\r\n");

	if(json.Get(req.para,"/insurance/chengke") ~= nil) then
		web.PutResult("chengke", json.Get(req.para,"/insurance/chengke"));
		if(json.Get(req.para,"/insurance/chengke/buji") ~= nil) then
		web.PutResult("chengkebuji", json.Get(req.para,"/insurance/chengke/buji"));
		end
		if(json.Get(req.para,"/insurance/chengke/unit") ~= nil) then
		web.PutResult("chengkeunit", json.Get(req.para,"/insurance/chengke/unit"));
		end
	end
	sys.DBGPrint("chengke\r\n");

	if(json.Get(req.para,"/insurance/huahen") ~= nil) then
		web.PutResult("huahen", json.Get(req.para,"/insurance/huahen"));
		if(json.Get(req.para,"/insurance/huahen/baoe") ~= nil) then
		web.PutResult("huahenbaoe", json.Get(req.para,"/insurance/huahen/baoe"));
		end
		if(json.Get(req.para,"/insurance/huahen/buji") ~= nil) then
		web.PutResult("huahenbuji", json.Get(req.para,"/insurance/huahen/buji"));
		end
	end
	sys.DBGPrint("huahen\r\n");
	
	if(json.Get(req.para,"/insurance/boli") ~= nil) then
		web.PutResult("boli", json.Get(req.para,"/insurance/boli"));
		if(json.Get(req.para,"/insurance/boli/baoe") ~= nil) then
			web.PutResult("bolibaoe", json.Get(req.para,"/insurance/boli/baoe"));
		end
	end
	sys.DBGPrint("boli\r\n");

	if(json.Get(req.para,"/insurance/zhiding") ~= nil) then
		web.PutResult("zhiding", json.Get(req.para,"/insurance/zhiding"));
	end
	sys.DBGPrint("zhiding\r\n");

	if(json.Get(req.para,"/insurance/ziran") ~= nil) then
		web.PutResult("ziran", json.Get(req.para,"/insurance/ziran"));
		if(json.Get(req.para,"/insurance/ziran/buji") ~= nil) then
			web.PutResult("ziranbuji", json.Get(req.para,"/insurance/ziran/buji"));
		end
	end
	sys.DBGPrint("ziran\r\n");

	if(json.Get(req.para,"/insurance/sheshui") ~= nil) then
		web.PutResult("sheshui", json.Get(req.para,"/insurance/sheshui"));
		if(json.Get(req.para,"/insurance/sheshui/buji") ~= nil) then
			web.PutResult("sheshuibuji", json.Get(req.para,"/insurance/sheshui/buji"));
		end
	end
	
	if(json.Get(req.para,"/insurance/shang") ~= nil) then
		web.PutResult("shang", json.Get(req.para,"/insurance/shang"));
		if(json.Get(req.para,"/insurance/shangDateEnd") ~= nil) then
			web.PutResult("shangDateEnd",  json.Get(req.para,"/insurance/shangDateEnd"));
		end
		if(json.Get(req.para,"/insurance/shangDateStart") ~= nil) then
			web.PutResult("shangDateStart", json.Get(req.para,"/insurance/shangDateStart"));
		end
	end
	sys.DBGPrint("shang\r\n");
	sys.DBGPrint("解析json完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	--为错误信息备用
	req.para = json.Set(req.para, "/insurance/complete", 0);
	car = '无车辆信息';
	insurancedPerson = '无被保人信息';
	car = json.Get(req.para, "/car");
	insuredPerson = json.Get(req.para, "/insured person");
	insurance = json.Get(req.para, "/insurance");
	--车牌信息
	WaitForObjectLoaded(desk, "main.page.fm.document.getElementById('prpCitemCar.licenseNo')");
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('prpCitemCar.licenseNo').value = external.get_result('plate_no');\r\n\
									//main.page.fm.document.getElementById('prpCitemCar.engineNo').value = external.get_result('engine_no');\r\n\
									//main.page.fm.document.getElementById('prpCitemCar.frameNo').value = external.get_result('vin');\r\n\
									//main.page.fm.document.getElementById('prpCitemCar.enrollDate').value = external.get_result('register_date');\r\n\
									main.page.fm.document.getElementById('prpCitemCar.licenseNo').onchange();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("车牌信息填充错误！\r\n");
			req:complete("{\"error\":-71,\"msg\":\"车牌信息填充错误!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	tm0 = web.NewTimeout(15000);
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('en',main.page.fm.document.getElementById('prpCitemCar.engineNo').value);\r\n\
										external.put_result('fn',main.page.fm.document.getElementById('prpCitemCar.frameNo').value);\r\n\
										external.put_result('ed',main.page.fm.document.getElementById('prpCitemCar.enrollDate').value);\r\n\
										") then
			sys.DBGPrint("车牌信息自动填充错误！\r\n");
			req:complete("{\"error\":-711,\"msg\":\"车牌信息自动填充错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		en = web.GetResult("en");
		fn = web.GetResult("fn");
		ed = web.GetResult("ed");
		sys.DBGPrint("车牌填充中，请稍后！\r\n")
		web.Wait(500);
	until ((en ~= nil and fn ~= nil and ed ~= nil) or web.IsTimeout(tm0))
	if (en == nil or fn == nil or ed == nil) then
		web.ClosePage(desk);
		sys.DBGPrint("车牌填充失败！\r\n");
		req:complete("{\"error\":-7111,\"msg\":\"车牌填充失败!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	sys.DBGPrint("车牌自动填充完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('searchByJY').click();//点查\r\n\
									") then
			web.ClosePage(desk);	
			sys.DBGPrint("车牌信息查询错误！\r\n");
			req:complete("{\"error\":-72,\"msg\":\"车牌信息查询错误!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	tm1 = web.NewTimeout(15000);
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('inn',main.page.fm.document.getElementById('prpCinsureds[0].insuredName').value);\r\n\
										") then
			sys.DBGPrint("车牌信息查询错误！\r\n");
			req:complete("{\"error\":-711,\"msg\":\"车牌信息查询错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		inn = web.GetResult("inn");
		sys.DBGPrint("车牌信息查询中，请稍后！\r\n")
		web.Wait(500);
	until ((inn ~= nil) or web.IsTimeout(tm1))
	if (inn == nil) then
		web.ClosePage(desk);
		sys.DBGPrint("车牌信息查询失败！\r\n");
		req:complete("{\"error\":-7111,\"msg\":\"车牌信息查询失败!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	sys.DBGPrint("车牌信息查询完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	--匹配险种
	if not	web.ExecuteScript(desk, "if(external.get_result('chesun') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[0].chooseFlag').click();\r\n\
										if(external.get_result('chesunbuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[0].specialFlag').click();\r\n\
										}\r\n\
									}\r\n\
									if(external.get_result('qiang') == '1'){\r\n\
										main.page.fm.document.getElementById('prpCitemKindCI.familyNo').click();\r\n\
										if(external.get_result('qiangDateStart') != ''){\r\n\
											main.page.fm.document.getElementById('prpCmainCI.startDate').value = external.get_result('qiangDateStart');\r\n\
											main.page.fm.document.getElementById('prpCmainCI.startDate').onchange();\r\n\
										}\r\n\
										if(external.get_result('qiangDateEnd') != ''){\r\n\
											main.page.fm.document.getElementById('prpCmainCI.endDate').value = external.get_result('qiangDateEnd');\r\n\
											main.page.fm.document.getElementById('prpCmainCI.endDate').onchange();\r\n\
										}\r\n\
									}\r\n\
									if(external.get_result('shangDateStart') != ''){\r\n\
										main.page.fm.document.getElementById('prpCmain.startDate').value = external.get_result('shangDateStart')\r\n\
										main.page.fm.document.getElementById('prpCmain.startDate').onchange();\r\n\
									}\r\n\
									if(external.get_result('shangDateEnd') != ''){\r\n\
										main.page.fm.document.getElementById('prpCmain.endDate').value = external.get_result('shangDateEnd');\r\n\
										main.page.fm.document.getElementById('prpCmain.endDate').onchange();\r\n\
									}\r\n\
									if(external.get_result('daoqiang') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[1].chooseFlag').click();\r\n\
										if(external.get_result('daoqiangbuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[1].specialFlag').click();\r\n\
										}\r\n\
									}\r\n\
									if(external.get_result('sanzhe') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[2].chooseFlag').click();\r\n\
										if(external.get_result('sanzhebuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[2].specialFlag').click();\r\n\
										}\r\n\
										if(external.get_result('sanzhebaoe') != ''){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[2].amount').value = external.get_result('sanzhebaoe');\r\n\
										}\r\n\
									}\r\n\
									if(external.get_result('siji') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[3].chooseFlag').click();\r\n\
										if(external.get_result('sijibuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[3].specialFlag').click();\r\n\
										}\r\n\
										if(external.get_result('sijibaoe') != ''){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[3].amount').value = external.get_result('sijibaoe');\r\n\
										}\r\n\
									}\r\n\
									if(external.get_result('chengke') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[4].chooseFlag').click();\r\n\
										if(external.get_result('chengkebuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[4].specialFlag').click();\r\n\
										}\r\n\
										if(external.get_result('chengkeunit') != ''){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[4].unitAmount').value = external.get_result('chengkeunit');\r\n\
										}\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[4].unitAmount').onchange();\r\n\
									}\r\n\
									if(external.get_result('huahen') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[5].chooseFlag').click();\r\n\
										if(external.get_result('huahenbuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[5].specialFlag').click();\r\n\
										}\r\n\
									}\r\n\
									switch (external.get_result('huahenbaoe'))\r\n\
										{\r\n\
										case '2000':\r\n\
											main.page.fm.document.getElementsByName('prpCitemKindsTemp[5].amount')[0].options[0].selected=true;\r\n\
											break;\r\n\
										case '5000':\r\n\
											main.page.fm.document.getElementsByName('prpCitemKindsTemp[5].amount')[0].options[1].selected=true;\r\n\
											break;\r\n\
										case '10000':\r\n\
											main.page.fm.document.getElementsByName('prpCitemKindsTemp[5].amount')[0].options[2].selected=true;\r\n\
											break;\r\n\
										case '20000':\r\n\
											main.page.fm.document.getElementsByName('prpCitemKindsTemp[5].amount')[0].options[3].selected=true;\r\n\
											break;\r\n\
										default:\r\n\
											main.page.fm.document.getElementsByName('prpCitemKindsTemp[5].amount')[0].options[0].selected=true;\r\n\
											break;\r\n\
										}\r\n\
									if(external.get_result('boli') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[6].chooseFlag').click();\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[6].chooseFlag').onchange();\r\n\
										switch(external.get_result('bolibaoe')){\r\n\
											case '国产玻璃':\r\n\
												main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[0].selected=true;\r\n\
												break;\r\n\
											case '国产玻璃(特殊材质)':\r\n\
												main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[1].selected=true;\r\n\
												break;\r\n\
											case '进口玻璃':\r\n\
												main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[2].selected=true;\r\n\
												break;\r\n\
											case '进口玻璃（特殊材质)':\r\n\
												main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[3].selected=true;\r\n\
												break;\r\n\
											//default:\r\n\
											//	main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[0].selected=true;\r\n\
										}\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').onchange();\r\n\
									}\r\n\
									if(external.get_result('zhiding') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[7].chooseFlag').click();\r\n\
									}\r\n\
									if(external.get_result('ziran') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[8].chooseFlag').click();\r\n\
										if(external.get_result('ziranbuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[8].specialFlag').click();\r\n\
										}\r\n\
									}\r\n\
									if(external.get_result('sheshui') != ''){\r\n\
										main.page.fm.document.getElementById('prpCitemKindsTemp[9].chooseFlag').click();\r\n\
										if(external.get_result('sheshuibuji') != '1'){\r\n\
											main.page.fm.document.getElementById('prpCitemKindsTemp[9].specialFlag').click();\r\n\
										}\r\n\
									}\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("匹配险种错误！\r\n");
			req:complete("{\"error\":-7321,\"msg\":\"执行核保错误!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	
	--投保人信息
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('prpCinsureds[0].insuredName').value = '';//去掉姓名\r\n\
									main.page.fm.document.getElementById('prpCinsureds[0].identifyNumber').value = external.get_result('id_no');//'512927197611165190';//\r\n\
									main.page.fm.document.getElementById('save2_insured_4S').click();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("被保人信息填充错误！\r\n");
			req:complete("{\"error\":-73,\"msg\":\"被保人信息填充错误!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;	
	end
	web.Wait(2000);--等待险种匹配
	sys.DBGPrint("被保人信息填充及匹配险种完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	--计算保费
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('buttonPremium_1').click();//计算保费\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("计算保费错误！\r\n");
			req:complete("{\"error\":-72,\"msg\":\"计算保费错误!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	tm2 = web.NewTimeout(15000);
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('sunnumber',main.page.fm.document.getElementById('sunnumber').value);\r\n\
									") then
			sys.DBGPrint("保费计算中,请稍后！\r\n");
			req:complete("{\"error\":-721,\"msg\":\"保费信息提取错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		sunnumber = web.GetResult("sunnumber");
		sys.DBGPrint("保费计算中,请稍后！\r\n");
		web.Wait(500);
	until ((sunnumber ~= '0' )or web.IsTimeout(tm2))
	if(sunnumber == '0') then
		web.ClosePage(desk);
		sys.DBGPrint("保费计算失败！\r\n");
		req:complete("{\"error\":-7211,\"msg\":\"保费计算失败！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	sys.DBGPrint("保费计算完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	sys.DBGPrint("保费总额："..sunnumber.."\r\n");
	
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('buttonSave').click();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("保存保单错误！\r\n");
			req:complete("{\"error\":-75,\"msg\":\"保存保单错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end	
	tm3 = web.NewTimeout(15000);
	--if (shang == '1') then---------------------------------------------------------------------------------------------------------
	
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('shangdanhao',main.page.fm.document.getElementById('prpCmain.proposalNo').value);\r\n\
									") then
			sys.DBGPrint("保存商业险保单错误！\r\n");
			req:complete("{\"error\":-7221,\"msg\":\"保存商业险保单错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		shangNo = web.GetResult("shangdanhao");
		sys.DBGPrint("保单保存中，请稍后！\r\n");
		web.Wait(500);
	until ((shangNo ~= nil) or web.IsTimeout(tm3))
	
	--end
	if (qiang == '1') then
		repeat
			if not	web.ExecuteScript(desk, "external.put_result('qiangdanhao',main.page.fm.document.getElementById('prpCmainCI.proposalNo').value);\r\n\
										") then
				sys.DBGPrint("保存交强险保单错误！\r\n");
				req:complete("{\"error\":-7222,\"msg\":\"保存交强险保单错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
				return false;
			end
			qiiangNo = web.GetResult("qiangdanhao");
			sys.DBGPrint("保单保存中，请稍后！\r\n");
			web.Wait(500);
		until ((qiangNo ~= nil ) or web.IsTimeout(tm3))
	end
	
	if(shangNo == nil and qiangNo == nil) then
		web.ClosePage(desk);
		sys.DBGPrint("保单保存失败！\r\n");
		req:complete("{\"error\":-72221,\"msg\":\"保单保存失败!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	--将商业保单号和交强保单号存入req.para--
	if shangNo ~= nil then
		req.para = json.Set(req.para, "/insurance/shangNo", shangNo);
	end
	if qiangNo ~= nil then
		req.para = json.Set(req.para, "/insurance/qiangNo", qiangNo);
	end
	sys.DBGPrint("保单保存完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	insurance = json.Get(req.para, "/insurance");
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('buttonSubmitUnw').click();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("点击核保错误！\r\n");
			req:complete("{\"error\":-76,\"msg\":\"点击核保错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	sys.DBGPrint("点击核保完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	WaitForObjectLoaded(desk, "main.page.fm.document.getElementsByTagName('a')[0]");
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementsByTagName('a')[0].click();//\r\n\
									") then
			web.ClosePage(desk);	
			sys.DBGPrint("打开核保详情页错误！\r\n");
			req:complete("{\"error\":-77,\"msg\":\"打开核保详情页错误！\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	
	desk2 = WaitForNewPage(desk, 3000);
	sys.DBGPrint("打开核保详情页成功");
	web.ClosePage(desk);
	repeat
		web.Wait(500);
		dataFetch = web.ExecuteScript(desk2, "var obj= document.getElementsByTagName('textarea');\r\n\
								for(var i=0;i < obj.length;i++){\r\n\
								external.put_result('test'+i,obj[i].value);\r\n\
								}\r\n\
								")
	until(dataFetch or web.IsTimeout(tm3))
	
	web.ClosePage(desk2);
	sys.DBGPrint("取数据完成，总耗时："..((web.GetTickCount()-startTime)/1000).."\r\n");
	--json打包传出
	test0 = web.GetResult("test0");
	test1 = web.GetResult("test1");
	test2 = web.GetResult("test2");
	ret = "{\"error\":0,\"msg\":";
	
	if test0 ~= nil then
		ret = ret.."\""..test0;
	end
	if test1 ~= nil then
		ret = ret..test1;
	end
	if test2 ~= nil then
		ret = ret..test2;
	end
	ret = ret.."\"";
	
	ret = ret..",\"car\":"..car;
	ret = ret..",\"insured person\":"..insuredPerson;
	req.para = json.Set(req.para, "/insurance/complete", 1);
	insurance = json.Get(req.para, "/insurance");
	ret = ret..",\"insurance\":"..insurance;
	ret = ret.."}";
	sys.DBGPrint(ret);
	req:complete(ret);
	return true;
end
--自动报价
function auto_quote(req)
	req:complete("{\"error\":-2,\"msg\":\"制作中，暂未支持\"}");
end

--主体函数，机器人运行时会自动调用此函数
function main()
	local req;
	sys.DBGPrint("脚本开始执行……\r\n");
	web.OnShowMessage("OnDialog");
	while web.IsRunning() do
		req = web.GetRequest();
		if (req ~= nil) then
			if (req.type == 0) then
				--查车牌
				inquire_car(req);
			else 
				if (req.type == 1) then
					--查历史保单
					req:complete("{\"error\":-1,\"msg\":\"不支持查历史保单\"}");
				else 
					if (req.type == 2) then
						--自动报价
						auto_quote(req);
					else 
						if (req.type == 3) then
							--自动核保
							startTime = web.GetTickCount();
							auto_check(req);
							endTime = web.GetTickCount();
							sys.DBGPrint("总耗时："..((endTime-startTime)/1000).."\r\n");
							else
							--未知的请求类型
							req:complete("{\"error\":-1,\"msg\":\"未知请求\"}");
						end
					end
				end
			end
		end
		web.Wait(10);
	end
	sys.DBGPrint("脚本退出\r\n");
end
--[[


]]--

