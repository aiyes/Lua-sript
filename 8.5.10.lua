--��������ʹ��
--�����г���ȫ����ϵͳ���������ƺͺ��嶼��Ԥ������ˣ���Ҫ�޸����ǣ�ֻҪ����ʵ�����ȥ�޸����ǵ�ֵ�Ϳ����ˡ�
--�Ƿ�֧�ֳ��Ʋ�ѯ����
support_inquire_car = false;
--�Ƿ�֧����ʷ������ѯ
support_query_insurance_history = false;
--�Ƿ�֧���Զ�����
support_auto_quote = false;
--�Ƿ�֧���Զ��˱�
support_auto_submit = true;
--������IP��ַ�������չ�˾��ҳ��������VPNʱ����������Ϊnil��������Ҫ����������أ������ж��Ƿ��ܷ��ʱ��չ�˾��ҳ��
web_server_ip_address = "10.134.136.48";
--��ǰ�����˽������еĹ����߳���Ŀ(ȡֵ��Χ��1~10֮��)
suggest_work_threads_num = 1;
--���չ�˾����
insurer_type = "renbao";
--�Ƿ���ʾ����
show_window = true;
--��ǰ�ű���ȫ�����ơ�������Ψһ�ģ������������������ÿ���ű�
global_name = "�˱�ʾ��";
--ȫ�ֳ�ʱʱ��(��λ������)
global_timeout = 10000

--�Ի������������������
MB_OK = 0;
MB_OKCANCEL = 1;
MB_ABORTRETRYIGNORE = 2;
MB_YESNOCANCEL = 3;
MB_YESNO = 4;
MB_RETRYCANCEL = 5;
MB_CANCELTRYCONTINUE = 6;
--�Ի�����������������
IDOK = 1;
IDCANCEL = 2;
IDABORT = 3;
IDRETRY = 4;
IDIGNORE = 5;
IDYES = 6;
IDNO = 7;
IDTRYAGAIN = 10;
IDCONTINUE = 11;

--����json�����б�
--json.Valid(s)				 �ж�������s�����Ƿ�����Ч��JSON�ַ���
--json.Get(s, k)			 ����json��s��k������ֵ�����ַ�����ʽ���أ��������������ַ�������'/'��'\\'�ּ�����Ҫȡ��json��s����ֵΪ��"{'abc':{'a':'1', 'b':'2', 'c':'3'},'d':'4'}"�����һ����'abc'�µ��Ӽ�'b'��ֵ����дΪjget(s, "/abc/b")��
--json.Set(s, k, v)		 ����json��s��k������ֵΪv������������ַ�����ʽ���ء�
--json.Size(s, k)			 �ж�json��s��k������Ԫ�ظ�����Ҫ��s[k]���������͡�

--����ϵͳ�����б�
--sys.DBGPrint(fmt,...)			���������Ϣ��������C������printfһ�£�fmt�Ǹ�ʽ�ַ���(��printfһ�£��ɽ���%d��%c��%u��%o��%f��%p��%s�ȵ�)������ӱ�Ρ�

--����ҵ�����б�
--web.GetTickCount()   ���ص�ǰϵͳʱ�䣨�ӿ�����Ŀǰ��������ʱ�䣬�Ժ���Ϊ��λ��
--web.GetUserName()		 ���ص�ǰ���ڵ�¼���չ�˾��ҳ���û���
--web.GetPassword()		 ���ص�ǰ���ڵ�¼���չ�˾��ҳ������
--web.GetRequest()	 	 ���ص�ǰ�������ǰ�˵��������
------�������������³�Ա
--------id			 ���ͣ�C���󣩣���ʶ��
--------type     ���ͣ����ͣ���0 - �鳵�ƣ�1 - ����ʷ������2 - �Զ����ۣ�3 - �Զ��˱���
--------para		 ���ͣ��ַ�������ָʾ����Ĳ���������ǲ鳵����������������ǳ��ƣ����������������������������JSON����
--------complete(result) ���ͣ�����������ɵ�ǰ����
--web.IsRunning()			 ���ص�ǰ������Ƿ������еı�־
--web.Exit(reason)		 �˳���ǰ�Ľű�ִ�л�����reason���Բ�������������������˳�ԭ���ַ�����
--web.NewPage()				 �½�ҳ�棬�����ؽ�����ҳ�����
--web.GetPageCount()	 ��ȡҳ������
--web.GetPageAt(no)		 ��ȡ�����no��ҳ�����
--web.GetPageTitle(p)  ��ȡҳ�����p�ı���
--web.GetPageURL(p)		 ��ȡҳ�����p��URL
--web.FindPageByTitle(partten)	����ҳ�����ƥ������ַ�����ҳ����󲢷��أ�pattern�пɰ���ͨ�����?,*��
--web.FindPageByURL(partten)	  ����ҳ��URLƥ��URL�ַ�����ҳ����󲢷��أ�pattern�пɰ���ͨ�����?,*��
--web.Navigate(p, url) ��ָ����ҳ�����p�ﵼ����urlָ������ַ���ɹ�����true�����򷵻�false
--web.ClosePage(p)		 �ر�ҳ�����pָ���Ĵ���
--web.ExecuteScript(p, sc)	��ָ����ҳ�����p��ִ��js�ű���js�ű���������sc�ַ�����
--web.PutResult(k,v)	 �ڵ�ǰ�����£��ɿ�ҳ�棩���ַ���v�洢��k���£��˻�����jsִ�л����µ�external.put_result(k,v)��չ������һ�µģ��������������������ﴫ������
--web.GetResult(k)		 �ڵ�ǰ�����£��ɿ�ҳ�棩��ȡk���´洢���ַ���ֵ���˻�����jsִ�л����µ�external.gut_result(k)��չ������һ�µģ��������������������ﴫ������
--web.IsDocumentCompleted(p)	�ж�ҳ�����p����ĵ��������
--web.IsNavigateError(p)	�ж�ҳ�����p�����Ƿ����
--web.OnShowMessage(func)	���õ�ǰ��������ҳ�Ի��򵯳��¼��Ļص�������func�������õĻص����������Ϊnil��ȡ���ص�����
-------�Ի��򵯳��¼��ص�����ԭ���ǣ�function ShowMessageCallback(p, caption, message, type)  �ص��������صĽ���ǰ��°�ť����ԴID��������Ի����������������Ķ��壩
-------�ص��������л���������ִ�����̲���ͬһ�������ռ��£����Ҫ��������ռ�ͨѶ��ʹ��web.PutResult��web.GetResult��
--web.Wait(ms)			 	 �ȴ�ms��������ִ�к�������
--web.IsElementExist(p,name)	�ж�ָ��ҳ�����Ƿ����name������DOM�ĵ�����name��'.'�����Ӷ���ͳ�Ա��ID�ţ����һ����Ա����������ﺬ'.'�ţ�������'@'���������֧�ֶ�����󣬶������','��';'�ָ���
--web.GetNewPage(page,min_ms)	��ȡ���´�����ҳ�棨���page��Ϊnil����ô�����ҳ�������page����ҳ�棬�������������ҳ�棩�������㴴��ʱ���ڵ�ǰʱ��ǰmin_ms����֮��
--web.IsTimeout(t)		 �жϳ�ʱ��t�Ƿ�ʱ
--web.NewTimeout(ms)	 ����ms�����ʱ�ĳ�ʱ��
--web.Refresh(p)			 ˢ��ҳ�����p

--����Ϊ��������
--��ֹϵͳ������
function OnDialog(page, caption, message, type)
	local pos;
	sys.DBGPrint("�ػ�ϵͳ�Ի���[%s, dwType=%d]��ǿ�Ʒ��ؼ�����\r\n", caption, type);
	sys.DBGPrint("�Ի���Ϣ%s��\r\n", message);
	type = type % 16;
	pos,_=string.find(message,"�Ƿ���");
	
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

--�ȴ�ҳ��������
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
			sys.DBGPrint("ҳ����س�ʱ��\r\n");			
			break;
		end
		web.Wait(50);
	end
	return false;
end

--�ȴ�ҳ���ĳ������������
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
			sys.DBGPrint("�ȴ�����'"..objName.."'������ϳ�ʱ��\r\n");
			break;
		end
		web.Wait(50);
	end
	return false;
end

--�ȴ�ҳ���������ĵ��������
function WaitForDocumentCompleted(page, ms)
	local title, pos;
	if not __WaitForDocumentCompleted(page, ms or global_timeout) then
		return false;
	end
	title = web.GetPageTitle(page);
	if title ~= nil then
		pos, _ = string.find(title, "֤�����");
		if pos ~= nil then
			if not WaitForObjectLoaded(page, "overridelink") then
				sys.DBGPrint("�ȴ�֤�����ҳ����������ϳ�ʱ��\r\n");
				return false;
			end
			if (not web.ExecuteScript(page, "document.getElementById(\"overridelink\").click();")) then
				sys.DBGPrint("����֤�����ű�ִ�д���\r\n");
				return false;
			end
			if not WaitForDocumentCompleted(page, ms or global_timeout) then
				sys.DBGPrint("�ȴ�֤��������ҳ����س�ʱ��\r\n");
				return false;
			end
		end
	else
	  sys.DBGPrint("��ȡ�¼���ҳ�����ʧ�ܣ�\r\n");
	end
	return true;
end


--�ȴ���ҳ�洴��
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
			sys.DBGPrint("�ȴ���ҳ��򿪳�ʱ��\r\n");
			break;
		end
		web.Wait(10);
	end
	return nil;
end

--��¼
function login(page)
	local user, password, url, url1, pos, ret, error, title;
	user = web.GetUserName();
	password = web.GetPassword();
	if user == nil or password == nil then
		return false, "�û���������Ϊ��"; 
	end
	if not web.Navigate(page, "http://10.134.136.48/") then
		return false, "�޷��������˱���ҳ";
	end
	if not WaitForDocumentCompleted(page) then
		return false, "����ʧ��";
	end
	title = web.GetPageTitle(page);
	if title == nil then
		return false, "�޷���ȡ����";
	end
	pos, _ = string.find(title, "PICC");
	if pos == nil then
		return false, "�޷�ʶ��ı���["..title.."]";
	end
	url = web.GetPageURL(page);
	if (url == nil) then
		return false, "�޷���ȡ��ҳURL��ַ";
	end
	pos,_=string.find(url, "/login?");
	if (pos == nil) then
		pos,_=string.find(url, "/portal/");
		if (pos == nil) then
			sys.DBGPrint("��ǰ�������ĵ�ַ��[%s]��\r\n", url);
			return false, error;
		else
			return true, "�ɹ�";
		end
	end
	WaitForObjectLoaded(page, "document.getElementById(\"username1\").value;document.getElementById(\"password1\").value;document.getElementById(\"button\")");
	web.PutResult("username", user);
	web.PutResult("password", password);
	if (not web.ExecuteScript(page, "document.getElementById(\"username1\").value=external.get_result(\"username\");\r\n\
								document.getElementById(\"password1\").value=external.get_result(\"password\");\r\n\
								document.getElementById(\"button\").click();")) then
		return false, "ִ�е�¼�ű�ʧ�ܣ�";
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
		return false, "�޷���ȡҳ��URL��ַ";
	end
	pos,_ = string.find(url, "/index.jsp?");
	if (pos == nil) then
		return false, "��¼����δ֪ҳ��["..url.."]";
	end
	return true, "�ɹ�";
end

--�򿪹���̨
function opendesk(page)
	local desk, ret;
	web.PutResult("result", "");
	WaitForObjectLoaded(page, "main");
	if (not web.ExecuteScript(page, "var arr=main.document.getElementsByTagName('A');\r\n\
														for(var i=0;i<arr.length;i++){\r\n\
															if(arr[i].title=='>> �������ճб�ϵͳ'){\r\n\
																external.put_result('result','1');\r\n\
																arr[i].click();\r\n\
																break;\r\n\
															}\r\n\
														}\r\n")) then
			return nil, "ִ�д򿪹���̨�ű�ʧ��";
	end
	ret = web.GetResult("result");
	if ret == nil then
		return nil, "ִ�д򿪹���̨�ű��ɹ�������û���ҵ����б�ϵͳ���ı�ǩ";
	end
	desk = WaitForNewPage(page, 3000);
	if (desk == nil) then
		return nil, "û���ҵ���ҳ��";
	end
	WaitForDocumentCompleted(desk);
	return desk, "�ɹ�";
end

--�Զ��˱�
function auto_check(req)
	local page, err, ret, desk2, engine, cls, model, vin, num, tm, qiangNo, shangNo;
	sys.DBGPrint("���ֺ˱�[%s]������\r\n", req.para);
	startTime = web.GetTickCount();
	sys.DBGPrint()
	page = web.NewPage();
	if (page == nil) then
		sys.DBGPrint("�½�ҳ��ʧ�ܣ�\r\n");
		req:complete("{\"error\":-2,\"msg\":\"����ҳ��ʧ��\"}");
		return false;
	end
	ret, err = login(page, req);
	if not ret then
		web.ClosePage(page);
		sys.DBGPrint("��¼���ؽ��[%s]��\r\n", err);
		req:complete("{\"error\":-3,\"msg\":\""..err.."\"}");
		return false;
	end
	if web.GetUserName() ~= nil then
		sys.DBGPrint("��¼��"..web.GetUserName().."\r\n");
	end
	if web.GetPassword() ~= nil then
		sys.DBGPrint("����"..web.GetPassword().."\r\n");
	end
	
	
	desk, err = opendesk(page);
	web.ClosePage(page);
	if desk == nil then
		sys.DBGPrint("�򿪹���̨ʧ��[%s]��\r\n", err);
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
			sys.DBGPrint("ִ�е�����������ű�ʧ�ܣ�\r\n");
			req:complete("{\"error\":-5,\"msg\":\"ִ�е�����������ű�ʧ��\"}");
			return false;
	end
	ret = web.GetResult("result");
	if (ret == nil) then
			web.ClosePage(desk);
			sys.DBGPrint("��ҳδ����ȫ���أ�\r\n");
			req:complete("{\"error\":-6,\"msg\":\"��ҳδ����ȫ����\"}");
			return false;
	end
	WaitForDocumentCompleted(desk);
	sys.DBGPrint("�������ҳ�棬�ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	
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
	sys.DBGPrint("����json��ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	--Ϊ������Ϣ����
	req.para = json.Set(req.para, "/insurance/complete", 0);
	car = '�޳�����Ϣ';
	insurancedPerson = '�ޱ�������Ϣ';
	car = json.Get(req.para, "/car");
	insuredPerson = json.Get(req.para, "/insured person");
	insurance = json.Get(req.para, "/insurance");
	--������Ϣ
	WaitForObjectLoaded(desk, "main.page.fm.document.getElementById('prpCitemCar.licenseNo')");
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('prpCitemCar.licenseNo').value = external.get_result('plate_no');\r\n\
									//main.page.fm.document.getElementById('prpCitemCar.engineNo').value = external.get_result('engine_no');\r\n\
									//main.page.fm.document.getElementById('prpCitemCar.frameNo').value = external.get_result('vin');\r\n\
									//main.page.fm.document.getElementById('prpCitemCar.enrollDate').value = external.get_result('register_date');\r\n\
									main.page.fm.document.getElementById('prpCitemCar.licenseNo').onchange();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("������Ϣ������\r\n");
			req:complete("{\"error\":-71,\"msg\":\"������Ϣ������!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	tm0 = web.NewTimeout(15000);
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('en',main.page.fm.document.getElementById('prpCitemCar.engineNo').value);\r\n\
										external.put_result('fn',main.page.fm.document.getElementById('prpCitemCar.frameNo').value);\r\n\
										external.put_result('ed',main.page.fm.document.getElementById('prpCitemCar.enrollDate').value);\r\n\
										") then
			sys.DBGPrint("������Ϣ�Զ�������\r\n");
			req:complete("{\"error\":-711,\"msg\":\"������Ϣ�Զ�������\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		en = web.GetResult("en");
		fn = web.GetResult("fn");
		ed = web.GetResult("ed");
		sys.DBGPrint("��������У����Ժ�\r\n")
		web.Wait(500);
	until ((en ~= nil and fn ~= nil and ed ~= nil) or web.IsTimeout(tm0))
	if (en == nil or fn == nil or ed == nil) then
		web.ClosePage(desk);
		sys.DBGPrint("�������ʧ�ܣ�\r\n");
		req:complete("{\"error\":-7111,\"msg\":\"�������ʧ��!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	sys.DBGPrint("�����Զ������ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('searchByJY').click();//���\r\n\
									") then
			web.ClosePage(desk);	
			sys.DBGPrint("������Ϣ��ѯ����\r\n");
			req:complete("{\"error\":-72,\"msg\":\"������Ϣ��ѯ����!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	tm1 = web.NewTimeout(15000);
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('inn',main.page.fm.document.getElementById('prpCinsureds[0].insuredName').value);\r\n\
										") then
			sys.DBGPrint("������Ϣ��ѯ����\r\n");
			req:complete("{\"error\":-711,\"msg\":\"������Ϣ��ѯ����\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		inn = web.GetResult("inn");
		sys.DBGPrint("������Ϣ��ѯ�У����Ժ�\r\n")
		web.Wait(500);
	until ((inn ~= nil) or web.IsTimeout(tm1))
	if (inn == nil) then
		web.ClosePage(desk);
		sys.DBGPrint("������Ϣ��ѯʧ�ܣ�\r\n");
		req:complete("{\"error\":-7111,\"msg\":\"������Ϣ��ѯʧ��!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	sys.DBGPrint("������Ϣ��ѯ��ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	--ƥ������
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
											case '��������':\r\n\
												main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[0].selected=true;\r\n\
												break;\r\n\
											case '��������(�������)':\r\n\
												main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[1].selected=true;\r\n\
												break;\r\n\
											case '���ڲ���':\r\n\
												main.page.fm.document.getElementById('prpCitemKindsTemp[6].modeCode').options[2].selected=true;\r\n\
												break;\r\n\
											case '���ڲ������������)':\r\n\
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
			sys.DBGPrint("ƥ�����ִ���\r\n");
			req:complete("{\"error\":-7321,\"msg\":\"ִ�к˱�����!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	
	--Ͷ������Ϣ
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('prpCinsureds[0].insuredName').value = '';//ȥ������\r\n\
									main.page.fm.document.getElementById('prpCinsureds[0].identifyNumber').value = external.get_result('id_no');//'512927197611165190';//\r\n\
									main.page.fm.document.getElementById('save2_insured_4S').click();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("��������Ϣ������\r\n");
			req:complete("{\"error\":-73,\"msg\":\"��������Ϣ������!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;	
	end
	web.Wait(2000);--�ȴ�����ƥ��
	sys.DBGPrint("��������Ϣ��估ƥ��������ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	--���㱣��
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('buttonPremium_1').click();//���㱣��\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("���㱣�Ѵ���\r\n");
			req:complete("{\"error\":-72,\"msg\":\"���㱣�Ѵ���!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	tm2 = web.NewTimeout(15000);
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('sunnumber',main.page.fm.document.getElementById('sunnumber').value);\r\n\
									") then
			sys.DBGPrint("���Ѽ�����,���Ժ�\r\n");
			req:complete("{\"error\":-721,\"msg\":\"������Ϣ��ȡ����\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		sunnumber = web.GetResult("sunnumber");
		sys.DBGPrint("���Ѽ�����,���Ժ�\r\n");
		web.Wait(500);
	until ((sunnumber ~= '0' )or web.IsTimeout(tm2))
	if(sunnumber == '0') then
		web.ClosePage(desk);
		sys.DBGPrint("���Ѽ���ʧ�ܣ�\r\n");
		req:complete("{\"error\":-7211,\"msg\":\"���Ѽ���ʧ�ܣ�\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	sys.DBGPrint("���Ѽ�����ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	sys.DBGPrint("�����ܶ"..sunnumber.."\r\n");
	
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('buttonSave').click();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("���汣������\r\n");
			req:complete("{\"error\":-75,\"msg\":\"���汣������\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end	
	tm3 = web.NewTimeout(15000);
	--if (shang == '1') then---------------------------------------------------------------------------------------------------------
	
	repeat
		if not	web.ExecuteScript(desk, "external.put_result('shangdanhao',main.page.fm.document.getElementById('prpCmain.proposalNo').value);\r\n\
									") then
			sys.DBGPrint("������ҵ�ձ�������\r\n");
			req:complete("{\"error\":-7221,\"msg\":\"������ҵ�ձ�������\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
		end
		shangNo = web.GetResult("shangdanhao");
		sys.DBGPrint("���������У����Ժ�\r\n");
		web.Wait(500);
	until ((shangNo ~= nil) or web.IsTimeout(tm3))
	
	--end
	if (qiang == '1') then
		repeat
			if not	web.ExecuteScript(desk, "external.put_result('qiangdanhao',main.page.fm.document.getElementById('prpCmainCI.proposalNo').value);\r\n\
										") then
				sys.DBGPrint("���潻ǿ�ձ�������\r\n");
				req:complete("{\"error\":-7222,\"msg\":\"���潻ǿ�ձ�������\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
				return false;
			end
			qiiangNo = web.GetResult("qiangdanhao");
			sys.DBGPrint("���������У����Ժ�\r\n");
			web.Wait(500);
		until ((qiangNo ~= nil ) or web.IsTimeout(tm3))
	end
	
	if(shangNo == nil and qiangNo == nil) then
		web.ClosePage(desk);
		sys.DBGPrint("��������ʧ�ܣ�\r\n");
		req:complete("{\"error\":-72221,\"msg\":\"��������ʧ��!\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
		return false;
	end
	--����ҵ�����źͽ�ǿ�����Ŵ���req.para--
	if shangNo ~= nil then
		req.para = json.Set(req.para, "/insurance/shangNo", shangNo);
	end
	if qiangNo ~= nil then
		req.para = json.Set(req.para, "/insurance/qiangNo", qiangNo);
	end
	sys.DBGPrint("����������ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	insurance = json.Get(req.para, "/insurance");
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementById('buttonSubmitUnw').click();\r\n\
									") then
			web.ClosePage(desk);
			sys.DBGPrint("����˱�����\r\n");
			req:complete("{\"error\":-76,\"msg\":\"����˱�����\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	sys.DBGPrint("����˱���ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	
	WaitForObjectLoaded(desk, "main.page.fm.document.getElementsByTagName('a')[0]");
	if not	web.ExecuteScript(desk, "main.page.fm.document.getElementsByTagName('a')[0].click();//\r\n\
									") then
			web.ClosePage(desk);	
			sys.DBGPrint("�򿪺˱�����ҳ����\r\n");
			req:complete("{\"error\":-77,\"msg\":\"�򿪺˱�����ҳ����\",\"car\":"..car..",\"insuredPerson\":"..insuredPerson..",\"insurance\":"..insurance.."}");
			return false;
	end
	
	desk2 = WaitForNewPage(desk, 3000);
	sys.DBGPrint("�򿪺˱�����ҳ�ɹ�");
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
	sys.DBGPrint("ȡ������ɣ��ܺ�ʱ��"..((web.GetTickCount()-startTime)/1000).."\r\n");
	--json�������
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
--�Զ�����
function auto_quote(req)
	req:complete("{\"error\":-2,\"msg\":\"�����У���δ֧��\"}");
end

--���庯��������������ʱ���Զ����ô˺���
function main()
	local req;
	sys.DBGPrint("�ű���ʼִ�С���\r\n");
	web.OnShowMessage("OnDialog");
	while web.IsRunning() do
		req = web.GetRequest();
		if (req ~= nil) then
			if (req.type == 0) then
				--�鳵��
				inquire_car(req);
			else 
				if (req.type == 1) then
					--����ʷ����
					req:complete("{\"error\":-1,\"msg\":\"��֧�ֲ���ʷ����\"}");
				else 
					if (req.type == 2) then
						--�Զ�����
						auto_quote(req);
					else 
						if (req.type == 3) then
							--�Զ��˱�
							startTime = web.GetTickCount();
							auto_check(req);
							endTime = web.GetTickCount();
							sys.DBGPrint("�ܺ�ʱ��"..((endTime-startTime)/1000).."\r\n");
							else
							--δ֪����������
							req:complete("{\"error\":-1,\"msg\":\"δ֪����\"}");
						end
					end
				end
			end
		end
		web.Wait(10);
	end
	sys.DBGPrint("�ű��˳�\r\n");
end
--[[


]]--

