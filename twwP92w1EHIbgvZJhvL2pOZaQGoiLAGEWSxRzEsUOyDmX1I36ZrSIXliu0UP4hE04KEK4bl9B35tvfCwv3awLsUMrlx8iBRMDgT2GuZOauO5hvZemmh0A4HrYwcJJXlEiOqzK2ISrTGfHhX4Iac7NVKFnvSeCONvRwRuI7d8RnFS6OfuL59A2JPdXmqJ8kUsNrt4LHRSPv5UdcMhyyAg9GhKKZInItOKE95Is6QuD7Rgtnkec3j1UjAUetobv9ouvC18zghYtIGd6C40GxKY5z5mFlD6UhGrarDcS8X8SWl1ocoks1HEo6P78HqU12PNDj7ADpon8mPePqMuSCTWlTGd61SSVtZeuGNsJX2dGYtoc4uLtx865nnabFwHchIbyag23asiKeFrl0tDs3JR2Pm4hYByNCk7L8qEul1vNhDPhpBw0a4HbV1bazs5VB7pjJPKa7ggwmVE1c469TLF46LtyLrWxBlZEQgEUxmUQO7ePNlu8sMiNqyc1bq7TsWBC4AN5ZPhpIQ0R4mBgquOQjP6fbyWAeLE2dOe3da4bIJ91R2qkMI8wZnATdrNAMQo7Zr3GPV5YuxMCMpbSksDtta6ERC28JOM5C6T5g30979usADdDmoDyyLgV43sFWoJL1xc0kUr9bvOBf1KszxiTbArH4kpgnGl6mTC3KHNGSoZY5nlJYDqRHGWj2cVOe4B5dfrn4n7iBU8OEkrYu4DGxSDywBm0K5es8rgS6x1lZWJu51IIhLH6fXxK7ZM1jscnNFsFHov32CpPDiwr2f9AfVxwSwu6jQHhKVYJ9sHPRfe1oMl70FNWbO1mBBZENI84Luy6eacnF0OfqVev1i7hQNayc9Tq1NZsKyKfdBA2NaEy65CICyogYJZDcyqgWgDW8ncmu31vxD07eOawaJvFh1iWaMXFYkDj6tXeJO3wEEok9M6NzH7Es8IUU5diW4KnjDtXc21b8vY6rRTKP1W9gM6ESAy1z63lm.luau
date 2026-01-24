local v0=(getgenv and getgenv()) or _G
pcall(function()if getscriptclosure then v0['Leme GUI LoaderFn']=getscriptclosure(script)end end)
pcall(function()local v00=v0['Leme GUI Loaded']if v00 and v00.Destroy then v00.Destroy()end end)
local v00={}
v0['Leme GUI Loaded']=v00

local v1,v2,v3,v4,v5,v6=game.Players,game:service'UserInputService',game:service'TweenService',game:service'RunService',{},false
local v7=v1.LocalPlayer
local v8=(function()local v9 pcall(function()v9=gethui()end)if not v9 then pcall(function()v9=get_hidden_gui()end)end if not v9 then v9=game:service'CoreGui' end return v9 end)()
local v10,v11
local function v12()
	if v6 then return end
	v6=true
	pcall(function()v4:UnbindFromRenderStep('v2')end)pcall(function()v4:UnbindFromRenderStep('v3')end)pcall(function()v4:UnbindFromRenderStep('v4')end)pcall(function()v4:UnbindFromRenderStep('v5')end)pcall(function()v4:UnbindFromRenderStep('v6')end)pcall(function()v4:UnbindFromRenderStep('v7')end)pcall(function()v4:UnbindFromRenderStep('v8')end)
	for v13=1,#v5 do pcall(function()v5[v13]:Disconnect()end) end
	pcall(function()if v10 then v10:Destroy()end end)
	pcall(function()if v11 then v11:Destroy()end end)
	pcall(function()script:Destroy()end)
end
v00.Destroy=v12

local function CreateStroke(v12)
	local v13=Instance.new('UIStroke',v12)
	v13.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
	v13.Color=Color3.new(1,1,1)
	return v13
end

local function CreateCorner(v14,v15)
	local v16=Instance.new('UICorner',v14)
	v16.CornerRadius=UDim.new(0,v15)
	return v16
end

local v13,v14,v15,v16,v24,v25,v26,v27='English','Leme GUI v2.1 Config.txt',{}, {}, {},nil,{},''
local function v19(v17)
	if v13~='日本語' then return v17 end
	return v15[v17] or v17
end
local function v20(v17,v18)
	v16[#v16+1]=function()if v17 and v17.Parent then v18(v17) end end
end
local function v21()for v17=1,#v16 do pcall(v16[v17]) end end
local function v22()
	if not readfile then return end
	local v17
	pcall(function()v17=readfile(v14)end)
	if type(v17)~='string' then return end
	for v18 in pairs(v24) do v24[v18]=nil end
	v25=nil
	local v18=nil
	for v19a in v17:gmatch('[^\r\n]+') do
		local v20a=v19a:match('^%[Config:(.+)%]$')
		if v20a then
			v20a=v20a:match('^%s*(.-)%s*$')
			v18=v20a
			v24[v18]=v24[v18] or {}
		else
			local v21a,v22a=v19a:match('^([^=]+)=(.*)$')
			if v21a then
				v21a=v21a:match('^%s*(.-)%s*$')
				v22a=(v22a or ''):match('^%s*(.-)%s*$')
				if v18 then
					v24[v18][v21a]=v22a
				else
					if v21a=='Language' then v13=v22a elseif v21a=='AutoLoad' then v25=v22a end
				end
			end
		end
	end
	if v13~='English' and v13~='日本語' then v13='English' end
	if v25 and (not v24[v25]) then v25=nil end
end
local function v23()
	if not writefile then return end
	pcall(function()
		local v17='Language='..v13..'\n'
		if v25 and v25~='' then v17=v17..'AutoLoad='..v25..'\n' end
		for v18,v19a in pairs(v24) do
			v17=v17..'\n[Config:'..tostring(v18)..']\n'
			for v20a,v21a in pairs(v19a) do
				v17=v17..tostring(v20a)..'='..tostring(v21a)..'\n'
			end
		end
		writefile(v14,v17)
	end)
end
local function v28(v17,v18,v19a,v20a)
	if v27=='' or v27=='Config' then return end
	if v27=='Script' and v18=='Language' then return end
	v26[#v26+1]={v27..'.'..v18,v17,v19a,v20a}
end
local v28a=v28
local function v29(v17)
	local v18=v24[v17]
	if not v18 then return end
	for v19a=1,#v26 do
		local v20a=v26[v19a]
		local v21a=v18[v20a[1]]
		if v21a~=nil then
			local v22a=v20a[2]
			if v22a=='Toggle' then
				pcall(function()v20a[4](v21a=='1')end)
			elseif v22a=='Input' then
				pcall(function()v20a[4](tostring(v21a))end)
			elseif v22a=='3Input' then
				pcall(function()v20a[4](tostring(v21a))end)
			elseif v22a=='Select' then
				pcall(function()v20a[4](tostring(v21a))end)
			end
		end
	end
end
local function v30()
	local v17={}
	for v18=1,#v26 do
		local v19a=v26[v18]
		local v20a=v19a[2]
		if v20a=='Toggle' then
			local v21a=false
			pcall(function()v21a=v19a[3]()end)
			v17[v19a[1]]=v21a and '1' or '0'
		elseif v20a=='Input' or v20a=='3Input' or v20a=='Select' then
			local v21a=''
			pcall(function()v21a=v19a[3]()end)
			v17[v19a[1]]=tostring(v21a)
		end
	end
	return v17
end
v15={
	['Fly']='飛行',['Hover']='ホバー',['Sit Fly']='座って飛ぶ',['Speed']='速度',['Quick Fly']='クイック飛行',['Trigger']='トリガー',
	['Fling']='吹き飛ばす',['Touch Fling']='触ったら吹き飛ばす',['Fling All']='全員吹き飛ばす',['Safe Method']='安全ロック',['Whitelist Friend']='フレンドは対象外',['Target']='ターゲット',
	['Anti']='耐性',['Anti Void']='奈落耐性',['Anti AFK']='放置耐性',['Anti Fling']='吹き飛ばし耐性',
	['Humanoid']='キャラクター',['Reset']='リセット',['Loop Reset']='ループリセット',['Quick Reset']='クイックリセット',['NoClip']='すり抜け',['InfJump']='無限ジャンプ',['Anchor']='固定',
	['Other']='その他',['Rejoin']='入り直す',['Chat']='チャット',['Instant Prompt']='即時プロンプト',['Fire All Touch']='すべてのタッチを触る',['No Fog']='霧を消す',
	['WalkSpeed']='歩行速度',['Value']='数値',['Set']='設定',['Loop Set']='ループ設定',['Current']='現在値',['TP Walk']='TP歩行',
	['JumpPower']='ジャンプ力',['Gravity']='重力',['FOV']='視野',['MaxZoom']='最大ズーム',['MinZoom']='最小ズーム',['No MaxZoom']='最大ズームを消す',['No MinZoom']='最小ズームを消す',
	['Desync']='同期ズレ',['Desync Pos']='座標で同期ズレ',['Pos']='座標',['Set Pos']='座標を設定',['Desync Dir']='向きで同期ズレ',['Dir']='向き',['Desync Dif']='差分で同期ズレ',['Dif']='差分',
	['Teleport']='テレポート',
	['Script']='スクリプト',['Load IY']='IYを実行',['Load RSpy']='RSpyを実行',['Load Dex']='Dexを実行',['Load ShiftLock']='シフトロックを実行',['Unload']='LemeGUIを消す',['Language']='言語',
	['Config']='設定',['Name']='名前',['Create Config']='設定を作成',['Load Config']='設定を反映',['OverWrite Config']='設定を上書き',['Delete Config']='設定を削除',['Set AutoLoad']='オートロードに設定',
	['ON']='オン',['OFF']='オフ',['NONE']='なし'
}
v22()

local v17={}
local function v18(v19)
	local v20=v17[v19] or 0
	v20=v20+1
	v17[v19]=v20
	return v20
end

local function CreateButton(v21,v22,v23)
	local v24=Instance.new('TextButton',v21)
	v24.LayoutOrder=v18(v21)
	v24.Size=UDim2.new(1,0,0,26)
	v24.BackgroundColor3=Color3.new(.2,.2,.2)
	v24.AutoButtonColor=false
	v24.Font=Enum.Font.Code
	v24.TextColor3=Color3.new(1,1,1)
	v24.TextSize=15
	v24.Text=v19(v22)
	v20(v24,function(v25)v25.Text=v19(v22)end)
	CreateCorner(v24,5)
	CreateStroke(v24)
	if v23 then v24.MouseButton1Click:Connect(v23) end
	return v24
end

local function CreateToggle(v25,v26,v27,v28,v29)
	local v30=Instance.new('TextButton',v25)
	v30.LayoutOrder=v18(v25)
	v30.Size=UDim2.new(1,0,0,26)
	v30.BackgroundColor3=Color3.new(.2,.2,.2)
	v30.AutoButtonColor=false
	v30.Font=Enum.Font.Code
	v30.TextColor3=Color3.new(1,1,1)
	v30.TextSize=15
	CreateCorner(v30,5)
	CreateStroke(v30)
	local v31=false
	local v32
	local function v33(v34,v35)
		if v35 then
			v30.Text=v19(v26)..(v31 and ' ['..v19('ON')..']' or ' ['..v19('OFF')..']')
			return
		end
		local v36=v31
		if v34==nil then v31=not v31 else v31=v34 end
		if (not v36) and v31 and v29 then
			for v37=1,#v29 do
				if v29[v37] and v29[v37][2]~=v33 then v29[v37][2](false) end
			end
		end
		v30.Text=v19(v26)..(v31 and ' ['..v19('ON')..']' or ' ['..v19('OFF')..']')
		if v28 then v28(v31) end
		if v32 then v32:Disconnect()v32=nil end
		if v31 and v27 then v32=v4.Heartbeat:Connect(v27) end
	end
	v30.MouseButton1Click:Connect(function()v33()end)
	v30.Text=v19(v26)..' ['..v19('OFF')..']'
	if v29 then v29[#v29+1]={v30,v33} end
	v20(v30,function()v33(nil,true)end)
	v28a('Toggle',v26,function()return v31 end,v33)
	return v30,v33,function()return v31 end
end

local function CreateInput(v37,v38,v39,v40,v41)
	local v42=Instance.new('Frame',v37)
	v42.LayoutOrder=v18(v37)
	v42.Size=UDim2.new(1,0,0,26)
	v42.BackgroundTransparency=1
	local v43=Instance.new('TextLabel',v42)
	v43.Size=UDim2.new(0,0,1,0)
	v43.AutomaticSize=Enum.AutomaticSize.X
	v43.BackgroundTransparency=1
	v43.Font=Enum.Font.Code
	v43.TextColor3=Color3.new(1,1,1)
	v43.TextSize=15
	v43.Text=v19(v38)..':'
	v43.TextXAlignment=Enum.TextXAlignment.Left
	v20(v43,function(v44)v44.Text=v19(v38)..':' end)
	local v44=Instance.new('Frame',v42)
	v44.BackgroundColor3=Color3.new(.2,.2,.2)
	CreateCorner(v44,5)
	CreateStroke(v44)
	local v45=Instance.new('TextBox',v44)
	v45.Size=UDim2.new(1,-10,1,0)
	v45.Position=UDim2.new(0,5,0,0)
	v45.BackgroundTransparency=1
	v45.ClearTextOnFocus=false
	v45.Font=Enum.Font.Code
	v45.TextColor3=Color3.new(1,1,1)
	v45.TextSize=15
	v45.Text=v41 or (v40 and '0,0,0' or '')
	local function v46()
		local v47=v43.AbsoluteSize.X+6
		v44.Position=UDim2.new(0,v47,0,0)
		v44.Size=UDim2.new(1,-v47,1,0)
	end
	v43:GetPropertyChangedSignal('AbsoluteSize'):Connect(v46)
	task.defer(v46)
	local function v48(v49)
		v45.Text=tostring(v49 or '')
		if not v39 then return end
		if v40 then
			local v50,v51,v52=v45.Text:match('^%s*([%+%-]?%d*%.?%d+)%s*,%s*([%+%-]?%d*%.?%d+)%s*,%s*([%+%-]?%d*%.?%d+)%s*$')
			if v50 then v39(tonumber(v50),tonumber(v51),tonumber(v52)) end
		else
			v39(v45.Text)
		end
	end
	v45.FocusLost:Connect(function()
		if not v39 then return end
		if v40 then
			local v49,v50,v51=v45.Text:match('^%s*([%+%-]?%d*%.?%d+)%s*,%s*([%+%-]?%d*%.?%d+)%s*,%s*([%+%-]?%d*%.?%d+)%s*$')
			if v49 then v39(tonumber(v49),tonumber(v50),tonumber(v51)) end
		else
			v39(v45.Text)
		end
	end)
	v28('Input',v38,function()return v45.Text end,v48)
	return v42,v45
end

local function Create3Input(v37,v38,v39,v41,v42,v43)
	local v44=Instance.new('Frame',v37)
	v44.LayoutOrder=v18(v37)
	v44.Size=UDim2.new(1,0,0,26)
	v44.BackgroundTransparency=1
	local v45=Instance.new('TextLabel',v44)
	v45.Size=UDim2.new(0,0,1,0)
	v45.AutomaticSize=Enum.AutomaticSize.X
	v45.BackgroundTransparency=1
	v45.Font=Enum.Font.Code
	v45.TextColor3=Color3.new(1,1,1)
	v45.TextSize=15
	v45.Text=v19(v38)..':'
	v45.TextXAlignment=Enum.TextXAlignment.Left
	v20(v45,function(v46)v46.Text=v19(v38)..':' end)
	local v46=Instance.new('Frame',v44)
	v46.BackgroundColor3=Color3.new(.2,.2,.2)
	CreateCorner(v46,5)
	CreateStroke(v46)
	local v47,v48,v49=Instance.new('TextBox',v46),Instance.new('TextBox',v46),Instance.new('TextBox',v46)
	v47.BackgroundTransparency=1 v48.BackgroundTransparency=1 v49.BackgroundTransparency=1
	v47.ClearTextOnFocus=false v48.ClearTextOnFocus=false v49.ClearTextOnFocus=false
	v47.Font=Enum.Font.Code v48.Font=Enum.Font.Code v49.Font=Enum.Font.Code
	v47.TextColor3=Color3.new(1,1,1) v48.TextColor3=Color3.new(1,1,1) v49.TextColor3=Color3.new(1,1,1)
	v47.TextSize=15 v48.TextSize=15 v49.TextSize=15
	v47.Text=v41 or '0' v48.Text=v42 or '0' v49.Text=v43 or '0'
	local function v50()
		local v51=v45.AbsoluteSize.X+6
		v46.Position=UDim2.new(0,v51,0,0)
		v46.Size=UDim2.new(1,-v51,1,0)
		local v52=v46.AbsoluteSize.X
		local v53=(v52-12)/3
		v47.Size=UDim2.new(0,v53,1,0)
		v48.Size=UDim2.new(0,v53,1,0)
		v49.Size=UDim2.new(0,v53,1,0)
		v47.Position=UDim2.new(0,4,0,0)
		v48.Position=UDim2.new(0,6+v53,0,0)
		v49.Position=UDim2.new(0,8+v53*2,0,0)
	end
	v45:GetPropertyChangedSignal('AbsoluteSize'):Connect(v50)
	v46:GetPropertyChangedSignal('AbsoluteSize'):Connect(v50)
	task.defer(v50)
	local function v54()
		if not v39 then return end
		local v55,v56,v57=tonumber(v47.Text),tonumber(v48.Text),tonumber(v49.Text)
		if v55 and v56 and v57 then v39(v55,v56,v57) end
	end
	v47.FocusLost:Connect(v54)
	v48.FocusLost:Connect(v54)
	v49.FocusLost:Connect(v54)
	local function v58(v59)
		local v60,v61,v62=v59:match('^%s*([^,]+)%s*,%s*([^,]+)%s*,%s*([^,]+)%s*$')
		if not v60 then
			v60,v61,v62=v59:match('^%s*([%+%-]?%d*%.?%d+)%s+([%+%-]?%d*%.?%d+)%s+([%+%-]?%d*%.?%d+)%s*$')
		end
		if v60 then
			v47.Text=tostring(v60)
			v48.Text=tostring(v61)
			v49.Text=tostring(v62)
			v54()
		end
	end
	v28('3Input',v38,function()return tostring(v47.Text)..','..tostring(v48.Text)..','..tostring(v49.Text) end,v58)
	return v44,v47,v48,v49
end

local function CreateDisplay(v51,v52)
	local v53=Instance.new('TextLabel',v51)
	v53.LayoutOrder=v18(v51)
	v53.Size=UDim2.new(1,0,0,26)
	v53.BackgroundTransparency=1
	v53.Font=Enum.Font.Code
	v53.TextColor3=Color3.new(1,1,1)
	v53.TextSize=15
	v53.Text=v52
	v53.TextXAlignment=Enum.TextXAlignment.Left
	return v53
end

local function CreateKeybind(v54,v55,v56)
	local v57=CreateButton(v54,v55..': '..v19('NONE'))
	local v58=Enum.KeyCode.Unknown
	local v59=false
	local function v60()
		v57.Text=v19(v55)..': '..(v58~=Enum.KeyCode.Unknown and v58.Name or v19('NONE'))
	end
	v57.MouseButton1Click:Connect(function()
		v59=true
		v57.Text=v19(v55)..': ...'
	end)
	v5[#v5+1]=v2.InputBegan:Connect(function(v61,v62)
		if v62 or v6 then return end
		if v59 and v61.KeyCode~=Enum.KeyCode.Unknown then
			v59=false
			v58=v61.KeyCode
			v60()
			return
		end
		if v58~=Enum.KeyCode.Unknown and v61.KeyCode==v58 then
			if v56 then v56(v58) end
		end
	end)
	v20(v57,function()v60()end)
	v60()
	return v57
end

local function CreateSelect(v61,v62,v63,v64,v65)
	local v66,v67=CreateButton(v61,v62..': '..tostring(v63)),false
	local v68
	local function v69()
		if v68 then pcall(function()v68:Destroy()end)v68=nil end
		v67=false
	end
	local function v70()
		if v67 then return end
		v67=true
		v68=Instance.new('Frame',v11)
		v68.Size=UDim2.new(1,0,1,0)
		v68.BackgroundTransparency=1
		v68.ZIndex=2147483647
		local v71=Instance.new('TextButton',v68)
		v71.Size=UDim2.new(1,0,1,0)
		v71.BackgroundTransparency=1
		v71.Text=''
		v71.AutoButtonColor=false
		v71.ZIndex=2147483647
		local v72=Instance.new('Frame',v68)
		v72.Size=UDim2.fromOffset(360,240)
		v72.Position=UDim2.new(.5,0,.5,0)
		v72.AnchorPoint=Vector2.new(.5,.5)
		v72.BackgroundColor3=Color3.new(.15,.15,.15)
		v72.BorderSizePixel=0
		v72.ZIndex=2147483647
		CreateCorner(v72,10)
		CreateStroke(v72)
		local v73=Instance.new('TextButton',v72)
		v73.Size=UDim2.fromOffset(26,26)
		v73.Position=UDim2.new(1,-30,0,4)
		v73.BackgroundColor3=Color3.new(.2,.2,.2)
		v73.AutoButtonColor=false
		v73.Font=Enum.Font.Code
		v73.TextColor3=Color3.new(1,1,1)
		v73.TextSize=15
		v73.Text='X'
		v73.ZIndex=2147483647
		CreateCorner(v73,5)
		CreateStroke(v73)
		local v74=Instance.new('TextLabel',v72)
		v74.Size=UDim2.new(1,-40,0,26)
		v74.Position=UDim2.new(0,10,0,4)
		v74.BackgroundTransparency=1
		v74.Font=Enum.Font.Code
		v74.TextColor3=Color3.new(1,1,1)
		v74.TextSize=22
		v74.Text=v19(v62)
		v74.TextXAlignment=Enum.TextXAlignment.Left
		v74.ZIndex=2147483647
		local v75=Instance.new('ScrollingFrame',v72)
		v75.Size=UDim2.new(1,-20,1,-44)
		v75.Position=UDim2.new(0,10,0,36)
		local v80=Instance.new('UIPadding',v75)
		v80.PaddingLeft=UDim.new(0,1)
		v80.PaddingRight=UDim.new(0,1)
		v80.PaddingTop=UDim.new(0,1)
		v80.PaddingBottom=UDim.new(0,1)
		v75.BackgroundTransparency=1
		v75.BorderSizePixel=0
		v75.ScrollBarThickness=0
		v75.AutomaticCanvasSize=Enum.AutomaticSize.Y
		v75.ZIndex=2147483647
		local v76=Instance.new('UIListLayout',v75)
		v76.Padding=UDim.new(0,8)
		v76.SortOrder=Enum.SortOrder.LayoutOrder
		v73.MouseButton1Click:Connect(v69)
		v71.MouseButton1Click:Connect(v69)
		for v77=1,#v64 do
			local v78=v64[v77]
			local v79=Instance.new('TextButton',v75)
			v79.Size=UDim2.new(1,-2,0,26)
			v79.Position=UDim2.new(0,1,0,0)
			v79.BackgroundColor3=Color3.new(.2,.2,.2)
			v79.AutoButtonColor=false
			v79.Font=Enum.Font.Code
			v79.TextColor3=Color3.new(1,1,1)
			v79.TextSize=15
			v79.Text=tostring(v78)
			v79.ZIndex=2147483647
			CreateCorner(v79,5)
			CreateStroke(v79)
			v79.MouseButton1Click:Connect(function()
				v63=v78
				v66.Text=v19(v62)..': '..tostring(v63)
				if v65 then v65(v63) end
				v23()
				v21()
				v69()
			end)
		end
	end
	v66.MouseButton1Click:Connect(v70)
	local function v71(v72)
		v63=v72
		if v65 then v65(v63) end
		v66.Text=v19(v62)..': '..tostring(v63)
		v23()
		v21()
	end
	v20(v66,function()v66.Text=v19(v62)..': '..tostring(v63)end)
	v28('Select',v62,function()return tostring(v63) end,v71)
	return v66,function()return v63 end,v71
end

local function CreateGroup(v62,v63)
	v27=v63
	local v64=Instance.new('Frame',v62)
	v64.Size=UDim2.new(1,0,0,0)
	v64.AutomaticSize=Enum.AutomaticSize.Y
	v64.BackgroundTransparency=1
	local v65=Instance.new('UIListLayout',v64)
	v65.Padding=UDim.new(0,10)
	v65.SortOrder=Enum.SortOrder.LayoutOrder
	local v66=Instance.new('TextLabel',v64)
	v66.Size=UDim2.new(1,0,0,26)
	v66.BackgroundTransparency=1
	v66.Font=Enum.Font.Code
	v66.TextColor3=Color3.new(1,1,1)
	v66.TextSize=22
	v66.Text=v19(v63)
	v66.TextXAlignment=Enum.TextXAlignment.Left
	v20(v66,function(v67)v67.Text=v19(v63)end)
	local v67=Instance.new('Frame',v64)
	v67.Size=UDim2.new(1,0,0,0)
	v67.AutomaticSize=Enum.AutomaticSize.Y
	v67.BackgroundTransparency=1
	local v68=Instance.new('UIListLayout',v67)
	v68.FillDirection=Enum.FillDirection.Horizontal
	v68.Padding=UDim.new(0,12)
	v68.SortOrder=Enum.SortOrder.LayoutOrder
	local v69=Instance.new('Frame',v67)
	v69.LayoutOrder=0
	v69.Size=UDim2.new(.5,-6,0,0)
	v69.AutomaticSize=Enum.AutomaticSize.Y
	v69.BackgroundTransparency=1
	local v70=Instance.new('UIListLayout',v69)
	v70.Padding=UDim.new(0,8)
	v70.SortOrder=Enum.SortOrder.LayoutOrder
	local v71=Instance.new('Frame',v67)
	v71.LayoutOrder=1
	v71.Size=UDim2.new(.5,-6,0,0)
	v71.AutomaticSize=Enum.AutomaticSize.Y
	v71.BackgroundTransparency=1
	local v72=Instance.new('UIListLayout',v71)
	v72.Padding=UDim.new(0,8)
	v72.SortOrder=Enum.SortOrder.LayoutOrder
	return v69,v71
end

local v73,v74=nil,nil
local function v75(v76)
	v73,v74=nil,nil
	for _,v77 in ipairs(v76:GetChildren()) do
		if v77:IsA('Humanoid') then v73=v77 elseif v77.Name=='HumanoidRootPart' then v74=v77 end
	end
	v76.ChildAdded:Connect(function(v78)
		if v78:IsA('Humanoid') then v73=v78 elseif v78.Name=='HumanoidRootPart' then v74=v78 end
	end)
end
if v7.Character then v75(v7.Character) end
v5[#v5+1]=v7.CharacterAdded:Connect(v75)

local v78,v79,v80,v81,v82,v83=false,false,false,false,false,false
v5[#v5+1]=v2.InputBegan:Connect(function(v84,v85)
	if v85 or v6 then return end
	local v86=v84.KeyCode
	if v86==Enum.KeyCode.W then v80=true
	elseif v86==Enum.KeyCode.A then v81=true
	elseif v86==Enum.KeyCode.S then v82=true
	elseif v86==Enum.KeyCode.D then v83=true
	elseif v86==Enum.KeyCode.Q then v78=true
	elseif v86==Enum.KeyCode.E then v79=true
	end
end)

v5[#v5+1]=v2.InputEnded:Connect(function(v88,v89)
	if v89 or v6 then return end
	local v90=v88.KeyCode
	if v90==Enum.KeyCode.W then v80=false
	elseif v90==Enum.KeyCode.A then v81=false
	elseif v90==Enum.KeyCode.S then v82=false
	elseif v90==Enum.KeyCode.D then v83=false
	elseif v90==Enum.KeyCode.Q then v78=false
	elseif v90==Enum.KeyCode.E then v79=false
	end
end)

v10=Instance.new('ScreenGui',v8)
v10.ResetOnSpawn=false
v10.IgnoreGuiInset=true
v10.DisplayOrder=2147483647
local v91=Instance.new('Frame',v10)
v91.Size=UDim2.new(1,0,1,0)
v91.BackgroundColor3=Color3.new()
v91.BackgroundTransparency=1
v91.Active=false
local v92=v3:Create(v91,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=.7})
v92:Play()
v92.Completed:Wait()

local v93=Instance.new('Frame',v10)
v93.Size=UDim2.fromOffset(60,60)
v93.Position=UDim2.new(.5,0,0,-40)
v93.AnchorPoint=Vector2.new(.5,.5)
v93.BackgroundColor3=Color3.new(.15,.15,.15)
v93.Active=false
CreateCorner(v93,1000)
local v94=Instance.new('TextLabel',v93)
v94.Size=UDim2.new(1,0,1,0)
v94.BackgroundTransparency=1
v94.Font=Enum.Font.Code
v94.TextColor3=Color3.new(1,1,1)
v94.TextSize=22
v94.Text='2.1'
v94.TextTransparency=1
local v95=CreateStroke(v93)
local v96,v96a=v3:Create(v93,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(.5,0,.43,0)}),v3:Create(v94,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0})
v96:Play()v96a:Play()
v96.Completed:Wait()

local v97=Instance.new('TextLabel',v10)
v97.Size=UDim2.fromOffset(360,60)
v97.Position=UDim2.new(.5,0,1,60)
v97.AnchorPoint=Vector2.new(.5,.5)
v97.BackgroundTransparency=1
v97.Font=Enum.Font.Code
v97.TextColor3=Color3.new(1,1,1)
v97.TextSize=32
v97.Text='Leme GUI'
v97.Active=false
local v98=v3:Create(v97,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(.5,0,.51,0)})
v98:Play()
v98.Completed:Wait()

task.wait(1)

local v99,v100,v101,v102=v3:Create(v93,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=1}),v3:Create(v95,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}),v3:Create(v97,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=1}),v3:Create(v94,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=1})
v99:Play()v100:Play()v101:Play()v102:Play()v99.Completed:Wait()
pcall(function()v93:Destroy()end)
pcall(function()v97:Destroy()end)

local v102=v3:Create(v91,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=1})
v102:Play()
v102.Completed:Wait()
pcall(function()v10:Destroy()end)
v10=nil
if v6 then return end

v11=Instance.new('ScreenGui',v8)
v11.ResetOnSpawn=false
v11.DisplayOrder=2147483647
v11.IgnoreGuiInset=true

local v103=Instance.new('TextButton',v11)
v103.Size=UDim2.fromOffset(60,60)
v103.Position=UDim2.new(.5,0,1,400)
v103.AnchorPoint=Vector2.new(.5,.5)
v103.BackgroundColor3=Color3.new(.15,.15,.15)
v103.AutoButtonColor=false
v103.Text=''
CreateCorner(v103,1000)
CreateStroke(v103)

local v104=Instance.new('Frame',v11)
v104.Size=UDim2.fromOffset(390,260)
v104.Position=UDim2.new(.5,0,1,660)
v104.AnchorPoint=Vector2.new(.5,1)
v104.BackgroundColor3=Color3.new(.15,.15,.15)
v104.BorderSizePixel=0
CreateCorner(v104,10)
CreateStroke(v104)

local v105=Instance.new('ScrollingFrame',v104)
v105.Size=UDim2.new(1,0,1,0)
v105.BackgroundTransparency=1
v105.BorderSizePixel=0
v105.ScrollBarThickness=0
v105.AutomaticCanvasSize=Enum.AutomaticSize.Y
local v106=Instance.new('UIListLayout',v105)
v106.Padding=UDim.new(0,16)
v106.SortOrder=Enum.SortOrder.LayoutOrder
local v107=Instance.new('UIPadding',v105)
v107.PaddingLeft=UDim.new(0,12)
v107.PaddingRight=UDim.new(0,12)
v107.PaddingTop=UDim.new(0,12)
v107.PaddingBottom=UDim.new(0,12)

local function v500()
local v108={}
local v109=300
local v110=nil

local v111,v112=CreateGroup(v105,'Fly')
local v113=nil
local v114=nil
local v115=0
local function v116()
	v115=v115+1
	return v115%2==1 and v111 or v112
end

local v117,v118,v119=CreateToggle(v116(),'Fly',function(v120)
	if v6 then return end
	if not v74 or not v74.Parent then return end
	local v121=workspace.CurrentCamera
	if not v121 then return end
	if not v110 then v110=v74.CFrame end
	local v122=v110.p
	local v123=v121.CFrame
	local v124=v123.LookVector
	local v125=v123.RightVector
	local v126=v123.UpVector
	local v127=Vector3.new()
	if v80 then v127=v127+v124 end
	if v82 then v127=v127-v124 end
	if v83 then v127=v127+v125 end
	if v81 then v127=v127-v125 end
	if v79 then v127=v127+v126 end
	if v78 then v127=v127-v126 end
	if v127.Magnitude>0 then v127=v127.Unit end
	v122=v122+v127*v109*v120
	v110=CFrame.fromMatrix(v122,v123.RightVector,v123.UpVector)
	v74.Velocity=Vector3.new()
	v74.RotVelocity=Vector3.new()
	v74.CFrame=v110
end,function(v120)
	if v120 then
		if v74 then v110=v74.CFrame else v110=nil end
	else
		v110=nil
	end
end,v108)

local v128,v129,v132=CreateToggle(v116(),'Hover',function(v131)
	if v6 then return end
	if not v74 or not v74.Parent then return end
	if not v113 or not v113.Parent then return end
	local v132=workspace.CurrentCamera
	if not v132 then return end
	if not v114 then v114=v74.CFrame.p end
	local v133=v132.CFrame
	local v134=v133.LookVector
	local v135=Vector3.new(v134.X,0,v134.Z)
	if v135.Magnitude<.001 then
		local v136=v74.CFrame.LookVector
		v135=Vector3.new(v136.X,0,v136.Z)
	end
	v135=v135.Unit
	local v137=v133.RightVector
	local v138=Vector3.new(v137.X,0,v137.Z)
	if v138.Magnitude<.001 then v138=v135:Cross(Vector3.new(0,1,0)) end
	v138=v138.Unit
	local v139=Vector3.new()
	if v80 then v139=v139+v135 end
	if v82 then v139=v139-v135 end
	if v83 then v139=v139+v138 end
	if v81 then v139=v139-v138 end
	local v140=(v79 and 1 or 0)-(v78 and 1 or 0)
	if v139.Magnitude>0 then v139=v139.Unit end
	v114=v114+(v139*v109+Vector3.new(0,v140*v109,0))*v131
	v113.Position=v114
	v130.CFrame=CFrame.new(v114,v114+v135)
end,function(v131)
	if v131 then
		if v74 then
			v114=v74.CFrame.p
			local v132=Instance.new('Attachment',v74)
			v113=Instance.new('AlignPosition',v74)
			v113.Attachment0=v132
			v113.Mode=Enum.PositionAlignmentMode.OneAttachment
			v113.Responsiveness=1/0
			v113.MaxForce=1/0
			v113.Position=v114
			v130=Instance.new('AlignOrientation',v74)
			v130.Attachment0=v132
			v130.Mode=Enum.OrientationAlignmentMode.OneAttachment
			v130.Responsiveness=1/0
			v130.MaxTorque=1/0
			v130.CFrame=v74.CFrame
		end
	else
		pcall(function()if v113 then v113:Destroy()end end)
		pcall(function()if v130 then v130:Destroy()end end)
		pcall(function()if v74 then for _,v132 in ipairs(v74:GetChildren()) do if v132:IsA('Attachment') then v132:Destroy()break end end end end)
		v113=nil v114=nil v130=nil
	end
end,v108)

local v141,v142,v143=CreateToggle(v116(),'Sit Fly',nil,function(v144)
	if v144 then
		if v142 then pcall(function()v142:Disconnect()end)v142=nil end
		v142=v4.RenderStepped:Connect(function()
			if v6 then return end
			if v73 and ((v119 and v119()) or (v132 and v132())) then v73.Sit=true else if v73 then v73.Sit=false end end
		end)
	else
		if v142 then pcall(function()v142:Disconnect()end)v142=nil end
		if v73 then v73.Sit=false end
	end
end)

CreateInput(v116(),'Speed',function(v145)
	local v146=tonumber(v145)
	if v146 then v109=v146 end
end,nil,'300')

if v2.KeyboardEnabled and v2.MouseEnabled and not v2.TouchEnabled then
	local v147,v148,v149=CreateToggle(v116(),'Quick Fly')
	CreateKeybind(v116(),'Trigger',function(v150)
		if v149 and v149() and v118 and v119 then v118(not v119()) end
	end)
end

local v151,v152=CreateGroup(v105,'Fling')
local v153=0
local function v154()
	v153=v153+1
	return v153%2==1 and v151 or v152
end

local v155,v156=CreateInput(v154(),'Target',function(v157)end)
local v157=CreateDisplay(v154(),'Target: NONE')

local v176=nil
local v262=''
local v158={}
local v260,v261=nil,false
local v159,v160,v161=CreateToggle(v154(),'Fling',nil,function(v162)
	if v162 and not v176 then v160(false) return end
	if v162 then
		local v163=workspace.CurrentCamera
		if v163 then v260=v163.CameraSubject end
		v261=true
		v4:BindToRenderStep('v4',Enum.RenderPriority.Camera.Value+1,function()
			if v6 then return end
			local v164=workspace.CurrentCamera
			if not v164 then return end
			local v165=v176
			if not v165 or v165.Parent~=v1 then if v260 and v164.CameraSubject~=v260 then v164.CameraSubject=v260 end return end
			local v166=v165.Character
			if not v166 then if v260 and v164.CameraSubject~=v260 then v164.CameraSubject=v260 end return end
			local v167,v169=nil,nil
			for _,v168 in ipairs(v166:GetChildren()) do
				if v168:IsA('Humanoid') then v167=v168 elseif v168.Name=='HumanoidRootPart' then v169=v168 end
			end
			if (not v167) or v167.Health<=0 or (not v169) then if v260 and v164.CameraSubject~=v260 then v164.CameraSubject=v260 end return end
			local v170=v169.Velocity
			if math.abs(v170.X)+math.abs(v170.Y)+math.abs(v170.Z)>500 then if v260 and v164.CameraSubject~=v260 then v164.CameraSubject=v260 end return end
			v164.CameraSubject=v167
		end)
	else
		if v261 then v4:UnbindFromRenderStep('v4') v261=false end
		local v163=workspace.CurrentCamera
		if v163 and v260 then v163.CameraSubject=v260 end
		v260=nil
		if v195 then
			local v164=v184
			if v164 and v196 and v197 and v198 then v164.CFrame=v196 v164.Velocity=v197 v164.RotVelocity=v198 end
			v195=false
		end
	end
end,v158)
local v164,v165,v166=CreateToggle(v154(),'Touch Fling',nil,function(v162)
	v263=v162
	if not v162 then return end
	task.spawn(function()
		while v263 and not v6 do
			v4.Heartbeat:Wait()
			if not v263 or v6 then break end
			local v163=v74
			if not v163 then continue end
			v264=v163.Velocity
			v163.Velocity=Vector3.new(0,2147483647,0)
			v4.RenderStepped:Wait()
			if not v263 or v6 then break end
			v163=v74
			if v163 and v264 then v163.Velocity=v264 end
		end
		local v163=v74
		if v163 and v264 then v163.Velocity=v264 end
	end)
end,v158)
local v167,v168,v169=CreateToggle(v154(),'Fling All',nil,function(v162)
	if not v162 and v195 then
		local v163=v184
		if v163 and v196 and v197 and v198 then v163.CFrame=v196 v163.Velocity=v197 v163.RotVelocity=v198 end
		v195=false
	end
end,v158)

local v170,v171,v172=CreateToggle(v154(),'Safe Method')
v171(true)
v170.LayoutOrder=2147483646
local v173,v174,v175=CreateToggle(v154(),'Whitelist Friend',nil,function(v176)
	if v176 then
		for _,v177 in ipairs(v1:GetPlayers()) do
			if v177~=v7 then
				local v178
				pcall(function()v178=v7:IsFriendsWith(v177.UserId)end)
				v179[v177]=v178 or false
			end
		end
	else
		for v177 in pairs(v179) do v179[v177]=nil end
	end
end)
v173.LayoutOrder=2147483647

local v177,v178={},{}
local v179={}
local v180={}
local v181,v182={},0
local v183=0
local v184=nil
local v185=nil
local v186=nil
local v187=nil
local v188=nil
local v189=0
local v263,v264=false,nil
local v190=0
local v191=0
local v192,v193,v194=nil,nil,nil
local v195=false
local v196,v197,v198=nil,nil,nil

local function v199(v200)
	if not v200 then return nil end
	for _,v201 in ipairs(v200:GetChildren()) do
		if v201.Name=='HumanoidRootPart' then return v201 end
	end
	return nil
end

local function v202(v203)
	v185=v203
	v184=v199(v203)
	if v186 then v186:Disconnect()v186=nil end
	v186=v203.ChildAdded:Connect(function(v204)
		if v204.Name=='HumanoidRootPart' then v184=v204 end
	end)
end

local function v205(v206)
	if v206==v7 then return end
	if v180[v206] then return end
	v182=v182+1
	v181[v182]=v206
	local v207={}
	v180[v206]=v207
	local v208=v206.Character
	if v208 then
		v207[1]=v199(v208)
		if v207[3] then v207[3]:Disconnect() end
		v207[3]=v208.ChildAdded:Connect(function(v209)
			if v209.Name=='HumanoidRootPart' then v207[1]=v209 end
		end)
		if v207[4] then v207[4]:Disconnect() end
		v207[4]=v208.ChildRemoved:Connect(function(v209)
			if v209.Name=='HumanoidRootPart' then v207[1]=nil end
		end)
	end
	if v207[2] then v207[2]:Disconnect() end
	v207[2]=v206.CharacterAdded:Connect(function(v210)
		v207[1]=v199(v210)
		if v207[3] then v207[3]:Disconnect() end
		v207[3]=v210.ChildAdded:Connect(function(v211)
			if v211.Name=='HumanoidRootPart' then v207[1]=v211 end
		end)
		if v207[4] then v207[4]:Disconnect() end
		v207[4]=v210.ChildRemoved:Connect(function(v211)
			if v211.Name=='HumanoidRootPart' then v207[1]=nil end
		end)
	end)
	if v175 and v175() then
		local v212
		pcall(function()v212=v7:IsFriendsWith(v206.UserId)end)
		v179[v206]=v212 or false
	end
end

local function v213(v214)
	for v215=1,v182 do
		if v181[v215]==v214 then
			v181[v215]=v181[v182]
			v181[v182]=nil
			v182=v182-1
			if v190>v182 then v190=v182 end
			break
		end
	end
	local v216=v180[v214]
	if v216 then
		if v216[4] then v216[4]:Disconnect() end
		if v216[3] then v216[3]:Disconnect() end
		if v216[2] then v216[2]:Disconnect() end
		v180[v214]=nil
	end
	v177[v214]=nil
	v178[v214]=nil
	v179[v214]=nil
	if v176==v214 then v176=nil end
end

local function v217(v218)
	local v219=v180[v218]
	if not v219 then return end
	local v220=v219[1]
	if not v220 then return end
	if not v220.Parent then v219[1]=nil return end
	local v221=v220.CFrame.p
	local v222=v219[5]
	if v222 and v183>0 then v219[6]=(v221-v222)/v183 end
	v219[5]=v221
end

local function v250(v224)
	local v225=v180[v224]
	if not v225 then return nil end
	local v226=v225[1]
	if not v226 then return nil end
	if not v226.Parent then v225[1]=nil return nil end
	local v227=v184
	if not v227 then return nil end
	local v228=v227.CFrame.p
	local v229=v226.CFrame.p
	local v232=math.random(0,10)/10
	local v234=v226.Velocity
	if math.abs(v234.X)+math.abs(v234.Y)+math.abs(v234.Z)<1 then
		local v235=v225[6]
		if v235 then v234=v235 end
	end
	local v233=v229+v234*v232
	if v172 and v172() and (v233-v228).Magnitude>800 then return nil end
	if math.abs(v234.X)+math.abs(v234.Y)+math.abs(v234.Z)>500 then return nil end
	local v235=math.random()*math.pi*2
	local v236=math.random()*math.pi*2
	local v237=math.random()*math.pi*2
	return CFrame.new(v233)*CFrame.Angles(v235,v236,v237)
end

local function v238()
	if v182<1 then return nil end
	local v239=v184
	if not v239 then return nil end
	local v240=v239.CFrame.p
	local v241=0
	while v241<v182 do
		v241=v241+1
		v190=v190+1
		if v190>v182 then v190=1 end
		local v242=v181[v190]
		if v242 then
			if v175 and v175() and v179[v242] then
			else
				local v243=v250(v242)
				if v243 then return v243 end
			end
		end
	end
	return nil
end

local function v244(v245)
	local v246=string.lower(v245 or '')
	local v247={}
	for v248,v249 in pairs(v177) do
		if v249 and string.find(string.lower(v249),v246,1,true) then v247[#v247+1]=v248 end
	end
	v262=v245 or ''
	if #v247==1 then v176=v247[1] return end
	if #v247==0 then
		for v248,v249 in pairs(v178) do
			if v249 and string.find(string.lower(v249),v246,1,true) then v247[#v247+1]=v248 end
		end
		if #v247==1 then v176=v247[1] else v176=nil end
	else
		v176=nil
	end
end

v156:GetPropertyChangedSignal('Text'):Connect(function()v244(v156.Text)end)

for _,v245 in ipairs(v1:GetPlayers()) do
	v177[v245]=v245.Name
	v178[v245]=v245.DisplayName
	v205(v245)
end
v5[#v5+1]=v1.PlayerAdded:Connect(function(v245)
	v177[v245]=v245.Name
	v178[v245]=v245.DisplayName
	v205(v245)
	if v262~='' then v244(v262) end
end)
v5[#v5+1]=v1.PlayerRemoving:Connect(function(v245)
	v213(v245)
	if v262~='' then v244(v262) end
end)

if v7.Character then v202(v7.Character) end
v5[#v5+1]=v7.CharacterAdded:Connect(v202)

v5[#v5+1]=v4.Heartbeat:Connect(function(v245)
	v183=v245
	if v182>0 then
		for v246=1,v182 do
			local v247=v181[v246]
			if v247 then v217(v247) end
		end
	end
	local v246=v184
	if not v246 then v195=false v189=0 return end
	local v247=nil
	if v161() then
		local v248=v176
		if not v248 then v195=false v189=0 return end
		v247=v250(v248)
		if not v247 then v195=false v189=0 return end
		v189=1
	elseif v169() then
		v247=v238()
		if not v247 then v195=false v189=0 return end
		v189=2
	elseif v166() then
		v195=false v189=0
		return
	else
		v195=false v189=0
		return
	end
	v196=v246.CFrame
	v197=v246.Velocity
	v198=v246.RotVelocity
	v246.CFrame=v247
	v246.Velocity=Vector3.new()
	v246.RotVelocity=Vector3.new(2147483647,2147483647,2147483647)
	v195=true
end)

v4:BindToRenderStep('v3',Enum.RenderPriority.Camera.Value-1,function()
	if not v195 or v189~=2 then return end
	local v245=v184
	if not v245 then v195=false return end
	if v196 and v197 and v198 then v245.CFrame=v196 v245.Velocity=v197 v245.RotVelocity=v198 end
	v195=false
end)

v5[#v5+1]=v4.RenderStepped:Connect(function()
	if v6 then return end
	if v195 and v189==1 then
		local v246=v184
		if v246 and v196 and v197 and v198 then v246.CFrame=v196 v246.Velocity=v197 v246.RotVelocity=v198 end
		v195=false
	end
	local v245=v176
	if v245 and v245.Parent~=v1 then v176=nil v245=nil end
	if v245 then v157.Text=v19('Target')..': '..(v245.DisplayName or v245.Name) else v157.Text=v19('Target')..': NONE' end
end)

local v248,v249=CreateGroup(v105,'Anti')
local v250=0
local function v251()
	v250=v250+1
	return v250%2==1 and v248 or v249
end

local v252,v253=nil,nil
local v254,v255,v256=CreateToggle(v251(),'Anti Void',nil,function(v257)
	if v253 then v253:Disconnect()v253=nil end
	if v257 then
		v252=workspace.FallenPartsDestroyHeight
		v253=v4.RenderStepped:Connect(function()workspace.FallenPartsDestroyHeight=0/0 end)
		v5[#v5+1]=v253
	else
		if v252~=nil then workspace.FallenPartsDestroyHeight=v252 v252=nil end
	end
end)

local v257,v261=nil,0
local v258,v259,v260=CreateToggle(v251(),'Anti AFK',nil,function(v262)
	if v257 then v257:Disconnect()v257=nil end
	v261=0
	if v262 then
		v257=v4.Heartbeat:Connect(function(v263)
			v261=v261+v263
			if v261>=100 then
				v261=v261-100
				game:service'VirtualInputManager':SendKeyEvent(true,Enum.KeyCode.Unknown,false,game)
				game:service'VirtualInputManager':SendKeyEvent(false,Enum.KeyCode.Unknown,false,game)
			end
		end)
		v5[#v5+1]=v257
	end
end)

local v262,v263,v264={}, {}, {}
local function v265(v266)
	for _,v267 in ipairs(v266:GetChildren()) do
		if v267.Name=='HumanoidRootPart' then return v267 end
	end
	return nil
end
local function v268(v269)
	if v269==v7 or v262[v269] then return end
	v262[v269]=true
	local v270={}
	v263[v269]=v270
	local v271=v269.Character
	if v271 then
		v264[v269]=v265(v271)
		v270[1]=v271.ChildAdded:Connect(function(v272)
			if v272.Name=='HumanoidRootPart' then v264[v269]=v272 end
		end)
		v270[2]=v271.ChildRemoved:Connect(function(v272)
			if v272.Name=='HumanoidRootPart' then v264[v269]=nil end
		end)
		v5[#v5+1]=v270[1]v5[#v5+1]=v270[2]
	end
	v270[3]=v269.CharacterAdded:Connect(function(v272)
		v264[v269]=v265(v272)
		if v270[1] then v270[1]:Disconnect()v270[1]=nil end
		if v270[2] then v270[2]:Disconnect()v270[2]=nil end
		v270[1]=v272.ChildAdded:Connect(function(v273)
			if v273.Name=='HumanoidRootPart' then v264[v269]=v273 end
		end)
		v270[2]=v272.ChildRemoved:Connect(function(v273)
			if v273.Name=='HumanoidRootPart' then v264[v269]=nil end
		end)
		v5[#v5+1]=v270[1]v5[#v5+1]=v270[2]
	end)
	v5[#v5+1]=v270[3]
end
for _,v266 in ipairs(v1:GetPlayers()) do v268(v266) end
v5[#v5+1]=v1.PlayerAdded:Connect(function(v266)v268(v266)end)
v5[#v5+1]=v1.PlayerRemoving:Connect(function(v266)
	v262[v266]=nil
	v264[v266]=nil
	local v267=v263[v266]
	if v267 then
		if v267[2] then v267[2]:Disconnect()end
		if v267[1] then v267[1]:Disconnect()end
		if v267[3] then v267[3]:Disconnect()end
	end
	v263[v266]=nil
end)

local v269,v270=nil,nil
local v271,v272,v273=CreateToggle(v251(),'Anti Fling',nil,function(v274)
	if v269 then v269:Disconnect()v269=nil end
	if v270 then v270:Disconnect()v270=nil end
	if v274 then
		local function v275()
			for v276,v277 in pairs(v264) do
				if v276~=v7 and v277 and v277.Parent then v277.Velocity=Vector3.new()v277.RotVelocity=Vector3.new() end
			end
		end
		v269=v4.Heartbeat:Connect(v275)
		v270=v4.RenderStepped:Connect(v275)
		v5[#v5+1]=v269 v5[#v5+1]=v270
	end
end)

local v276,v277=CreateGroup(v105,'Humanoid')
local v278=0
local function v279()
	v278=v278+1
	return v278%2==1 and v276 or v277
end

local function v280()
	if v6 then return end
	local v281=v7.Character
	local v282=v73
	if v282 then pcall(function()v282:ChangeState(Enum.HumanoidStateType.Dead)end)pcall(function()v282.Health=0 end)end
	if v281 then pcall(function()v281:BreakJoints()end)end
end

CreateButton(v279(),'Reset',v280)

local v283=nil
CreateToggle(v279(),'Loop Reset',nil,function(v284)
	if v283 then v283:Disconnect()v283=nil end
	if v284 then
		v283=v4.RenderStepped:Connect(function()v280()end)
		v5[#v5+1]=v283
	end
end)

if v2.KeyboardEnabled and v2.MouseEnabled and not v2.TouchEnabled then
	local v285,v286,v287=CreateToggle(v279(),'Quick Reset')
	CreateKeybind(v279(),'Trigger',function()
		if v287 and v287() then v280()end
	end)
end

local v288,v289,v290={},nil,nil
CreateToggle(v279(),'NoClip',nil,function(v291)
	if v289 then v289:Disconnect()v289=nil end
	if not v291 then
		for v292,v293 in pairs(v288) do if v292 and v292.Parent then v292.CanCollide=v293 end end
		for v292 in pairs(v288) do v288[v292]=nil end
		v290=nil
		return
	end
	v289=v4.Stepped:Connect(function()
		if v6 then return end
		local v292=v7.Character
		if not v292 then return end
		if v290~=v292 then v290=v292 end
		for _,v293 in ipairs(v292:GetDescendants()) do
			if v293:IsA('BasePart') then
				if v288[v293]==nil then v288[v293]=v293.CanCollide end
				v293.CanCollide=false
			end
		end
	end)
	v5[#v5+1]=v289
end)

local v293=nil
CreateToggle(v279(),'InfJump',nil,function(v294)
	if v293 then v293:Disconnect()v293=nil end
	if v294 then
		v293=v2.JumpRequest:Connect(function()
			if v6 then return end
			if v73 then pcall(function()v73:ChangeState(Enum.HumanoidStateType.Jumping)end)end
		end)
		v5[#v5+1]=v293
	end
end)

local v295=nil
local v296,v297=nil,nil
CreateToggle(v279(),'Anchor',nil,function(v298)
	if v296 then v296:Disconnect()v296=nil end
	if v297 then v297:Disconnect()v297=nil end
	if not v298 then
		if v74 and v74.Parent then v74.Velocity=Vector3.new()end
		v295=nil
		return
	end
	if v74 and v74.Parent then v295=v74.CFrame end
	local function v299()
		if v6 then return end
		if not v295 then if v74 and v74.Parent then v295=v74.CFrame end end
		local v300=v74
		if v300 and v300.Parent and v295 then v300.CFrame=v295 v300.Velocity=Vector3.new()end
	end
	v296=v4.Heartbeat:Connect(v299)
	v297=v4.RenderStepped:Connect(v299)
	v5[#v5+1]=v296 v5[#v5+1]=v297
end)

local v301,v302=CreateGroup(v105,'Other')
local v303=0
local function v304()
	v303=v303+1
	return v303%2==1 and v301 or v302
end

CreateButton(v304(),'Rejoin',function()
	local v1,v2,v3,v4,v5=game.Players,game:service'TeleportService',game.Players.LocalPlayer,game.PlaceId,game.JobId
	if #v1:GetPlayers()<=1 then
		v3:Kick()
		task.wait()
		v2:Teleport(v4,v3)
	else
		v2:TeleportToPlaceInstance(v4,v5,v3)
	end
end)

local v305,v306,v307=CreateToggle(v304(),'Chat')
v306(true)
local v308=game:service'TextChatService'
v5[#v5+1]=v4.RenderStepped:Connect(function()
	if v6 then return end
	local v309=v307()
	pcall(function()game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat,v309)end)
	pcall(function()v308.BubbleChatConfiguration.Enabled=v309 end)
	pcall(function()v308.ChatInputBarConfiguration.Enabled=v309 end)
	pcall(function()v308.ChatWindowConfiguration.Enabled=v309 end)
end)

local v310,v311={},nil
local v312,v313,v314=nil,nil,nil
local v315,v316,v317=CreateToggle(v304(),'Instant Prompt',nil,function(v318)
	if v312 then v312:Disconnect()v312=nil end
	if v313 then v313:Disconnect()v313=nil end
	if v314 then v314:Disconnect()v314=nil end
	if not v318 then
		for v319,v320 in pairs(v310) do if v319 and v319.Parent then v319.HoldDuration=v320 end end
		for v319 in pairs(v310) do v310[v319]=nil end
		return
	end
	local v319=game:service'ProximityPromptService'
	v312=v319.PromptShown:Connect(function(v320)
		if v310[v320]==nil then v310[v320]=v320.HoldDuration end
		v320.HoldDuration=0
	end)
	v313=v319.PromptHidden:Connect(function(v320)
		local v321=v310[v320]
		if v321~=nil and v320 and v320.Parent then v320.HoldDuration=v321 end
		v310[v320]=nil
	end)
	v314=v4.RenderStepped:Connect(function()
		if v6 then return end
		for v320 in pairs(v310) do if v320 and v320.Parent then v320.HoldDuration=0 else v310[v320]=nil end end
	end)
	v5[#v5+1]=v312 v5[#v5+1]=v313 v5[#v5+1]=v314
end)

local v318=false
CreateButton(v304(),'Fire All Touch',function()
	if v6 or v318 then return end
	v318=true
	task.spawn(function()
		local v319=v74
		if not v319 or not v319.Parent then v318=false return end
		local v320=v319.CFrame
		local v321,v322=v319.Velocity,v319.RotVelocity
		local v323={}
		for _,v324 in ipairs(workspace:GetDescendants()) do
			if v324:IsA('TouchTransmitter') then
				local v325=v324.Parent
				if v325 and v325:IsA('BasePart') then v323[#v323+1]=v325 end
			end
		end
		for v326=1,#v323 do
			if v6 then break end
			local v325=v323[v326]
			if v325 and v325.Parent then
				local v327=v74
				if not v327 or not v327.Parent then break end
				v327.CFrame=CFrame.new(v325.CFrame.p)*(v320-v320.p)
			end
			v4.Heartbeat:Wait()
			local v327=v74
			if not v327 or not v327.Parent then break end
			local v328,v329,v330=v327.CFrame,v327.Velocity,v327.RotVelocity
			v327.CFrame=v320
			v327.Velocity=Vector3.new()
			v327.RotVelocity=Vector3.new()
			v4.RenderStepped:Wait()
			v327=v74
			if not v327 or not v327.Parent then break end
			v327.CFrame=v328
			v327.Velocity=v329
			v327.RotVelocity=v330
		end
		local v327=v74
		if v327 and v327.Parent then
			v327.CFrame=v320
			v327.Velocity=v321
			v327.RotVelocity=v322
		end
		v318=false
	end)
end)

local function v333()
local v331=nil
CreateToggle(v304(),'No Fog',nil,function(v332)
	if v331 then v331:Disconnect()v331=nil end
	if v332 then
		v331=v4.RenderStepped:Connect(function()
			if v6 then return end
			local v333=game.Lighting
			for _,v334 in ipairs(v333:GetChildren()) do
				if v334:IsA('Atmosphere') then v334:Destroy() end
			end
			v333.FogEnd=1/0
		end)
		v5[#v5+1]=v331
	end
end)

local function v334(v335)
	return tostring(math.floor(v335*100+0.5)/100)
end

local v335,v336=CreateGroup(v105,'WalkSpeed')
local v337=0
local function v338()
	v337=v337+1
	return v337%2==1 and v335 or v336
end
local v339=v334((v73 and v73.WalkSpeed) or 16)
local v340,v341=CreateInput(v338(),'Value',function(v342)v339=v342 end,nil,v339)
v341:GetPropertyChangedSignal('Text'):Connect(function()v339=v341.Text end)
CreateButton(v338(),'Set',function()
	local v342=tonumber(v339)
	if v342 and v73 then v73.WalkSpeed=v342 end
end)
local v343=nil
CreateToggle(v338(),'Loop Set',nil,function(v342)
	if v343 then v343:Disconnect()v343=nil end
	if v342 then
		v343=v4.RenderStepped:Connect(function()
			if v6 then return end
			local v344=tonumber(v339)
			if v344 and v73 then v73.WalkSpeed=v344 end
		end)
		v5[#v5+1]=v343
	end
end)
local v420=CreateDisplay(v338(),'Current: 0')
local v426=50
CreateToggle(v338(),'TP Walk',function(v342)
	if v6 then return end
	local v343,v344=v73,v74
	if not v343 or not v344 or not v344.Parent then return end
	local v345=v343.MoveDirection
	if v345.Magnitude<.001 then return end
	local v346=v344.CFrame
	v344.CFrame=CFrame.new(v346.p+v345.Unit*v426*v342)*(v346-v346.p)
end)
CreateInput(v338(),'Speed',function(v342)local v343=tonumber(v342)if v343 then v426=v343 end end,nil,'50')

local v345,v346=CreateGroup(v105,'JumpPower')
local v347=0
local function v348()
	v347=v347+1
	return v347%2==1 and v345 or v346
end
local v349=v334((v73 and v73.JumpPower) or 50)
local v350,v351=CreateInput(v348(),'Value',function(v352)v349=v352 end,nil,v349)
v351:GetPropertyChangedSignal('Text'):Connect(function()v349=v351.Text end)
CreateButton(v348(),'Set',function()
	local v352=tonumber(v349)
	if v73 and v352 then pcall(function()v73.UseJumpPower=true end)pcall(function()v73.JumpPower=v352 end)end
end)
local v353=nil
CreateToggle(v348(),'Loop Set',nil,function(v352)
	if v353 then v353:Disconnect()v353=nil end
	if v352 then
		v353=v4.RenderStepped:Connect(function()
			if v6 then return end
			local v354=tonumber(v349)
			if v73 and v354 then pcall(function()v73.UseJumpPower=true end)pcall(function()v73.JumpPower=v354 end)end
		end)
		v5[#v5+1]=v353
	end
end)
local v421=CreateDisplay(v348(),'Current: 0')

local v355,v356=CreateGroup(v105,'Gravity')
local v357=0
local function v358()
	v357=v357+1
	return v357%2==1 and v355 or v356
end
local v359=v334(workspace.Gravity)
local v360,v361=CreateInput(v358(),'Value',function(v362)v359=v362 end,nil,v359)
v361:GetPropertyChangedSignal('Text'):Connect(function()v359=v361.Text end)
CreateButton(v358(),'Set',function()
	local v362=tonumber(v359)
	if v362 then workspace.Gravity=v362 end
end)
local v363=nil
CreateToggle(v358(),'Loop Set',nil,function(v362)
	if v363 then v363:Disconnect()v363=nil end
	if v362 then
		v363=v4.RenderStepped:Connect(function()
			if v6 then return end
			local v364=tonumber(v359)
			if v364 then workspace.Gravity=v364 end
		end)
		v5[#v5+1]=v363
	end
end)
local v422=CreateDisplay(v358(),'Current: 0')

local v395,v396=CreateGroup(v105,'FOV')
local v397=0
local function v398()
	v397=v397+1
	return v397%2==1 and v395 or v396
end
local v399=v334((workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 70)
local v400,v401=CreateInput(v398(),'Value',function(v402)v399=v402 end,nil,v399)
v401:GetPropertyChangedSignal('Text'):Connect(function()v399=v401.Text end)
CreateButton(v398(),'Set',function()
	local v402=tonumber(v399)
	if v402 then
		local v403=workspace.CurrentCamera
		if v403 then v403.FieldOfView=v402 end
	end
end)
local v404=nil
CreateToggle(v398(),'Loop Set',nil,function(v402)
	if v404 then v404:Disconnect()v404=nil end
	if v402 then
		v404=v4.RenderStepped:Connect(function()
			if v6 then return end
			local v405=tonumber(v399)
			if v405 then
				local v406=workspace.CurrentCamera
				if v406 then v406.FieldOfView=v405 end
			end
		end)
		v5[#v5+1]=v404
	end
end)
local v423=CreateDisplay(v398(),'Current: 0')

local v365,v366=CreateGroup(v105,'MaxZoom')
local v367=0
local function v368()
	v367=v367+1
	return v367%2==1 and v365 or v366
end
local v369=v334(v7.CameraMaxZoomDistance)
local v370,v371=CreateInput(v368(),'Value',function(v372)v369=v372 end,nil,v369)
v371:GetPropertyChangedSignal('Text'):Connect(function()v369=v371.Text end)
CreateButton(v368(),'Set',function()
	local v372=tonumber(v369)
	if v372 then v7.CameraMaxZoomDistance=v372 end
end)
local v373,v374,v375=CreateToggle(v368(),'No MaxZoom')
local v376=nil
local function v377(v378)
	if v376 then v376:Disconnect()v376=nil end
	if v378 then
		v376=v4.RenderStepped:Connect(function()
			if v6 then return end
			if v375() then v7.CameraMaxZoomDistance=1/0 else
				local v379=tonumber(v369)
				if v379 then v7.CameraMaxZoomDistance=v379 end
			end
		end)
		v5[#v5+1]=v376
	end
end
CreateToggle(v368(),'Loop Set',nil,function(v378)v377(v378 or v375())end)
v374(false)
v373.MouseButton1Click:Connect(function()task.defer(function()v377(v375() or false)end)end)
local v424=CreateDisplay(v368(),'Current: 0')

local v380,v381=CreateGroup(v105,'MinZoom')
local v382=0
local function v383()
	v382=v382+1
	return v382%2==1 and v380 or v381
end
local v384=v334(v7.CameraMinZoomDistance)
local v385,v386=CreateInput(v383(),'Value',function(v387)v384=v387 end,nil,v384)
v386.Text=v384
v386:GetPropertyChangedSignal('Text'):Connect(function()v384=v386.Text end)
CreateButton(v383(),'Set',function()
	local v387=tonumber(v384)
	if v387 then v7.CameraMinZoomDistance=v387 end
end)
local v388,v389,v390=CreateToggle(v383(),'No MinZoom')
local v391=nil
local function v392(v393)
	if v391 then v391:Disconnect()v391=nil end
	if v393 then
		v391=v4.RenderStepped:Connect(function()
			if v6 then return end
			if v390() then v7.CameraMinZoomDistance=-1/0 else
				local v394=tonumber(v384)
				if v394 then v7.CameraMinZoomDistance=v394 end
			end
		end)
		v5[#v5+1]=v391
	end
end
CreateToggle(v383(),'Loop Set',nil,function(v393)v392(v393 or v390())end)
v389(false)
v388.MouseButton1Click:Connect(function()task.defer(function()v392(v390() or false)end)end)
local v425=CreateDisplay(v383(),'Current: 0')

v5[#v5+1]=v4.RenderStepped:Connect(function()
	if v6 then return end
	if v420 then v420.Text=v19('Current')..': '..v334((v73 and v73.WalkSpeed) or 0) end
	if v421 then v421.Text=v19('Current')..': '..v334((v73 and v73.JumpPower) or 0) end
	if v422 then v422.Text=v19('Current')..': '..v334(workspace.Gravity) end
	if v423 then v423.Text=v19('Current')..': '..v334((workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 0) end
	if v424 then v424.Text=v19('Current')..': '..v334(v7.CameraMaxZoomDistance) end
	if v425 then v425.Text=v19('Current')..': '..v334(v7.CameraMinZoomDistance) end
end)

end
v333()

local function v334()
	local v335,v336=CreateGroup(v105,'Desync')
	local v337=0
	local function v338()
		v337=v337+1
		return v337%2==1 and v335 or v336
	end
	local v339={}
	local v340,v341,v342,v343=nil,nil,false,nil
	local v344,v345,v346=nil,nil,nil
	local v347,v348,v349=0,0,0
	local v350,v351,v352=0,0,0
	local v372,v373,v374=0,0,0
	local v356,v357=nil,nil
	local function v353()
		local v358=v344
		if v340 then v340:Disconnect()v340=nil end
		pcall(function()v4:UnbindFromRenderStep('v6')end)pcall(function()v4:UnbindFromRenderStep('v7')end)
		if v358 then
			local v359=v74
			if v359 and v359.Parent and v341 then
				if v358==3 or v358==4 then
				v359.CFrame=v341
			else
				if v345 and v346 then v359.CFrame=v341 v359.Velocity=v345 v359.RotVelocity=v346 end
			end
			end
		end
		v341=nil v345=nil v346=nil
		v342=false
		v344=nil
		if v356 then pcall(function()v356:Destroy()end)v356=nil end
		v357=nil
	end
	local function v354(v355)
		v341=nil v345=nil v346=nil
		v344=v355
		if not v355 then return end
		if not v356 then
			v356=Instance.new('Part',workspace)
			v356.Size=Vector3.new(2.02,2.02,1.01)
			v356.Color=Color3.new(1,0,0)
			v356.Material=Enum.Material.Neon
			v356.Transparency=.5
			v356.CanCollide=false
			v356.CanQuery=false
			v356.CanTouch=false
			v356.CastShadow=false
			v356.Anchored=true
		end
		v340=v4.Heartbeat:Connect(function()
			if v6 then return end
			local v358=v74
			if not v358 or not v358.Parent then return end
			v341=v358.CFrame
			if v344~=4 then v345=v358.Velocity v346=v358.RotVelocity else v345=nil v346=nil end
			local v359
			if v344==1 then
				v359=v343
			elseif v344==2 then
				v359=CFrame.new(v347,v348,v349)
			elseif v344==3 then
				v359=CFrame.new(v341.p)*((v341-v341.p)*CFrame.Angles(math.rad(v350),math.rad(v351),math.rad(v352)))
			else
				v359=v341*CFrame.new(v372,v373,v374)
			end
			v357=v359
			if v344==3 then
				v358.CFrame=v359
			else
				v358.CFrame=v359
				if v344~=4 then v358.Velocity=Vector3.new()v358.RotVelocity=Vector3.new() end
			end
			if v356 then v356.CFrame=v359 v356.Velocity=Vector3.new()v356.RotVelocity=Vector3.new() end
			v342=true
		end)
		v4:BindToRenderStep('v6',Enum.RenderPriority.Camera.Value-1,function()
			if not v342 then return end
			v342=false
			local v358=v74
			if not v358 or not v358.Parent then return end
			if v344==3 or v344==4 then
				if v341 then v358.CFrame=v341 end
			else
				if v341 and v345 and v346 then v358.CFrame=v341 v358.Velocity=v345 v358.RotVelocity=v346 end
			end
		end)
		v4:BindToRenderStep('v7',Enum.RenderPriority.Camera.Value+2,function()
			if v6 then return end
			local v358=v356
			local v359=v357
			if v358 and v359 then v358.CFrame=v359 v358.Velocity=Vector3.new()v358.RotVelocity=Vector3.new() end
		end)
		v5[#v5+1]=v340
	end

	local v358,v359,v360=CreateToggle(v338(),'Desync',nil,function(v361)
		if v361 then
			v353()
			local v362=v74
			if v362 and v362.Parent then v343=v362.CFrame else v343=CFrame.new() end
			v354(1)
		else
			v353()
		end
	end,v339)

	CreateToggle(v338(),'Desync Pos',nil,function(v367)
		if v367 then v353()v354(2) else v353() end
	end,v339)
	local v363,v364,v365,v366=Create3Input(v338(),'Pos',function(v367,v368,v369)v347,v348,v349=v367,v368,v369 end,'0','0','0')
	CreateButton(v338(),'Set Pos',function()
		local v367=v74
		if not v367 or not v367.Parent then return end
		local v368=v367.CFrame.p
		local v369=math.floor(v368.X*10+0.5)/10
		local v370=math.floor(v368.Y*10+0.5)/10
		local v371=math.floor(v368.Z*10+0.5)/10
		v347,v348,v349=v369,v370,v371
		v364.Text=tostring(v369)
		v365.Text=tostring(v370)
		v366.Text=tostring(v371)
	end)

	CreateToggle(v338(),'Desync Dir',nil,function(v367)
		if v367 then v353()v354(3) else v353() end
	end,v339)
	Create3Input(v338(),'Dir',function(v367,v368,v369)v350,v351,v352=v367,v368,v369 end,'0','0','0')

	local v375,v376,v377=CreateToggle(v338(),'Desync Dif',nil,function(v367)
		if v367 then v353()v354(4) else v353() end
	end,v339)
	Create3Input(v338(),'Dif',function(v367,v368,v369)v372,v373,v374=v367,v368,v369 end,'0','0','0')
end
v334()

local function v335()
	local v336,v337=CreateGroup(v105,'Teleport')
	local v338=0
	local function v339()
		v338=v338+1
		return v338%2==1 and v336 or v337
	end
	local v340,v341,v342=0,0,0
	CreateButton(v339(),'Teleport',function()
		if v6 then return end
		local v343=v74
		if not v343 or not v343.Parent then return end
		local v344=v343.CFrame
		v343.CFrame=CFrame.new(v340,v341,v342)*(v344-v344.p)
		v343.Velocity=Vector3.new()
	end)
	local v345,v346,v347,v348=Create3Input(v339(),'Pos',function(v349,v350,v351)v340,v341,v342=v349,v350,v351 end,'0','0','0')
	CreateButton(v339(),'Set Pos',function()
		local v349=v74
		if not v349 or not v349.Parent then return end
		local v350=v349.CFrame.p
		local v351=math.floor(v350.X*10+0.5)/10
		local v352=math.floor(v350.Y*10+0.5)/10
		local v353=math.floor(v350.Z*10+0.5)/10
		v340,v341,v342=v351,v352,v353
		v346.Text=tostring(v351)
		v347.Text=tostring(v352)
		v348.Text=tostring(v353)
	end)
end

local function v336()
	local v337,v338=CreateGroup(v105,'Script')
	local v339=0
	local function v340()
		v339=v339+1
		return v339%2==1 and v337 or v338
	end
	CreateButton(v340(),'Load IY',function()pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end)end)
	CreateButton(v340(),'Load RSpy',function()pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua'))()end)end)
	CreateButton(v340(),'Load Dex',function()pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()end)end)
	CreateButton(v340(),'Load ShiftLock',function()pcall(function()loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Shiftlock-script-42373'))()end)end)
	CreateButton(v340(),'Unload',function()v12()end)
	CreateSelect(v340(),'Language',v13,{'English','日本語'},function(v341)v13=v341 end)
end

local function v337()
	local v337a,v338a=CreateGroup(v105,'Config')
	local v339a=0
	local function v340a()
		v339a=v339a+1
		return v339a%2==1 and v337a or v338a
	end
	local v341a,v342a=CreateInput(v340a(),'Name',function(v343a)end)
	local v344a,v344b={},{}
	local v345a,v345b='',''
	local function v346a()
		for v347a=1,#v344a do v344a[v347a]=nil end
		for v347a in pairs(v344b) do v344b[v347a]=nil end
		for v347a in pairs(v24) do
			local v348a=tostring(v347a)
			local v349a=v348a..((v25==v348a) and ' (AutoLoad)' or '')
			v344a[#v344a+1]=v349a
			v344b[v349a]=v348a
		end
	end
	v346a()
	local v347a,v348a,v349a=CreateSelect(v340a(),'Config',v345b,v344a,function(v350a)
		v345b=tostring(v350a or '')
		v345a=v344b[v345b] or v345b
	end)
	local function v350a()
		v346a()
		if v345a~='' and (not v24[v345a]) then v345a='' v345b='' pcall(function()v349a('')end) end
		if v345a~='' then v345b=v345a..((v25==v345a) and ' (AutoLoad)' or '') end
		pcall(function()v349a(v345b)end)
		v23()
	end
	CreateButton(v340a(),'Create Config',function()
		local v351a=(v342a and v342a.Text or ''):match('^%s*(.-)%s*$')
		if v351a=='' then return end
		if v24[v351a] then return end
		v24[v351a]=v30()
		v345a=v351a
		v345b=v351a..((v25==v351a) and ' (AutoLoad)' or '')
		pcall(function()v349a(v345b)end)
		v350a()
	end)
	CreateButton(v340a(),'Load Config',function()
		if v345a=='' then return end
		v29(v345a)
		v21()
	end)
	CreateButton(v340a(),'OverWrite Config',function()
		if v345a=='' then return end
		if not v24[v345a] then return end
		v24[v345a]=v30()
		v350a()
	end)
	CreateButton(v340a(),'Delete Config',function()
		if v345a=='' then return end
		v24[v345a]=nil
		if v25==v345a then v25=nil end
		v345a='' v345b=''
		pcall(function()v349a('')end)
		v350a()
	end)
	CreateButton(v340a(),'Set AutoLoad',function()
		if v345a=='' then return end
		if not v24[v345a] then return end
		v25=v345a
		v350a()
	end)
end

v335()
v337()
v336()
if v25 and v24[v25] then v29(v25) end
v21()
end
v500()

local v221,v222,v223=0,false,false
local v224,v225=v3:Create(v103,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(.5,0,1,-55)}),v3:Create(v104,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(.5,0,1,260)})
v223=true
v224:Play()v225:Play()v224.Completed:Wait()v223=false

v5[#v5+1]=v4.RenderStepped:Connect(function(v226)
	if v6 or v223 then return end
	local v227=workspace.CurrentCamera
	if v227 then
		local v228=v227.ViewportSize.X
		local v229=v104.AbsoluteSize.X
		local v230=(v228-v229)*.5
		if v230<0 then v230=0 end
		if v221>v230 then v221=v230 elseif v221<-v230 then v221=-v230 end
	end
	local v231=1-math.exp(-v226*25)
	local v232=v222 and -315 or -55
	v103.Position=v103.Position:Lerp(UDim2.new(.5,v221,1,v232),v231)
	v104.Position=v104.Position:Lerp(UDim2.new(.5,v221,1,v222 and 0 or 260),v231)
end)

local v233,v234,v235,v236
v5[#v5+1]=v103.InputBegan:Connect(function(v237)
	if v6 then return end
	if v237.UserInputType~=Enum.UserInputType.MouseButton1 and v237.UserInputType~=Enum.UserInputType.Touch then return end
	v223=false
	v235=false
	v234=v221
	v236=v237.Position.X
	v233=v237
end)

v5[#v5+1]=v2.InputChanged:Connect(function(v238)
	if v6 or v223 or not v233 then return end
	if (v233.UserInputType==Enum.UserInputType.MouseButton1 and v238.UserInputType==Enum.UserInputType.MouseMovement) or v238==v233 then
		local v239=v238.Position.X-v236
		if not v235 and (v239>6 or v239<-6) then v235=true end
		v221=v234+v239
		local v240=workspace.CurrentCamera
		if v240 then
			local v241=v240.ViewportSize.X
			local v242=v104.AbsoluteSize.X
			local v243=(v241-v242)*.5
			if v243<0 then v243=0 end
			if v221>v243 then v221=v243 elseif v221<-v243 then v221=-v243 end
		end
	end
end)

v5[#v5+1]=v2.InputEnded:Connect(function(v244)
	if v6 or not v233 then return end
	if v244==v233 or (v233.UserInputType==Enum.UserInputType.MouseButton1 and v244.UserInputType==Enum.UserInputType.MouseButton1) then
		v233=nil
		if v235 then return end
		v222=not v222
		v223=true
		if v10 then pcall(function()v10:Cancel()end) end
		local v245=v221
		local v246=v3:Create(v103,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(.5,v245,1,v222 and -315 or -55)})
		local v247=v3:Create(v104,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(.5,v245,1,v222 and 0 or 260)})
		v10=v246
		v246.Completed:Connect(function()v223=false end)
		v246:Play()v247:Play()
	end
end)
