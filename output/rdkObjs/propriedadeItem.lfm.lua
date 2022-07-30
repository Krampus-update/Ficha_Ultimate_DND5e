require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaPropriedade()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmFichaPropriedade");
    obj:setHeight(50);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("✖");
    obj.button1:setName("button1");

    obj.flOutter = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flOutter:setParent(obj);
    obj.flOutter:setName("flOutter");
    obj.flOutter:setAvoidScale(true);
    obj.flOutter:setAutoHeight(true);
    obj.flOutter:setVertAlign("trailing");
    obj.flOutter:setAlign("client");
    obj.flOutter:setLineSpacing(2);
    obj.flOutter:setHorzAlign("leading");
    obj.flOutter:setStepSizes({310, 420, 640, 760, 1150});
    obj.flOutter:setMinScaledWidth(300);
    obj.flOutter:setMargins({left=1, right=1, top=2, bottom=2});

    obj.ctrlEnabled = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.ctrlEnabled:setParent(obj.flOutter);
    obj.ctrlEnabled:setHeight(25);
    obj.ctrlEnabled:setMinScaledWidth(32);
    obj.ctrlEnabled:setMinWidth(32);
    obj.ctrlEnabled:setMaxWidth(32);
    obj.ctrlEnabled:setMaxScaledWidth(32);
    obj.ctrlEnabled:setAvoidScale(true);
    obj.ctrlEnabled:setName("ctrlEnabled");
    obj.ctrlEnabled:setMargins({left=1, right=1, top=2, bottom=2});
    obj.ctrlEnabled:setVertAlign("leading");

    obj.cbxctrlEnabled = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxctrlEnabled:setParent(obj.ctrlEnabled);
    obj.cbxctrlEnabled:setAlign("top");
    obj.cbxctrlEnabled:setWidth(20);
    obj.cbxctrlEnabled:setMargins({});
    obj.cbxctrlEnabled:setField("enabled");
    obj.cbxctrlEnabled:setOptimize(false);
    obj.cbxctrlEnabled:setImageChecked("images/checkbox2_checked.png");
    obj.cbxctrlEnabled:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxctrlEnabled:setName("cbxctrlEnabled");
    obj.cbxctrlEnabled:setHeight(32);
    obj.cbxctrlEnabled:setVisible(true);

    obj.labctrlEnabled = GUI.fromHandle(_obj_newObject("label"));
    obj.labctrlEnabled:setParent(obj.ctrlEnabled);
    obj.labctrlEnabled:setName("labctrlEnabled");
    obj.labctrlEnabled:setAlign("top");
    obj.labctrlEnabled:setText("");
    obj.labctrlEnabled:setHorzTextAlign("center");
    obj.labctrlEnabled:setVertTextAlign("leading");
    obj.labctrlEnabled:setWordWrap(true);
    obj.labctrlEnabled:setTextTrimming("none");
    obj.labctrlEnabled:setFontSize(12);
    obj.labctrlEnabled:setFontColor("#D0D0D0");

    self.ctrlEnabled:setHeight(self.cbxctrlEnabled:getHeight() + self.labctrlEnabled:getHeight());


    obj.ctrlNome = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.ctrlNome:setParent(obj.flOutter);
    obj.ctrlNome:setHeight(50);
    obj.ctrlNome:setMinScaledWidth(100);
    obj.ctrlNome:setMinWidth(100);
    obj.ctrlNome:setMaxWidth(233);
    obj.ctrlNome:setMaxScaledWidth(233);
    obj.ctrlNome:setAvoidScale(true);
    obj.ctrlNome:setName("ctrlNome");
    obj.ctrlNome:setMargins({left=1, right=1, top=2, bottom=2});
    obj.ctrlNome:setVertAlign("leading");

    obj.edtctrlNome = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtctrlNome:setParent(obj.ctrlNome);
    obj.edtctrlNome:setName("edtctrlNome");
    obj.edtctrlNome:setAlign("top");
    obj.edtctrlNome:setField("nome");
    obj.edtctrlNome:setFontSize(13);
    obj.edtctrlNome:setTransparent(false);
    obj.edtctrlNome:setVertTextAlign("center");
    obj.edtctrlNome:setReadOnly(true);
    obj.edtctrlNome:setHeight(30);
    obj.edtctrlNome:setWidth(195);
    obj.edtctrlNome:setFontColor("white");

    obj.labctrlNome = GUI.fromHandle(_obj_newObject("label"));
    obj.labctrlNome:setParent(obj.ctrlNome);
    obj.labctrlNome:setName("labctrlNome");
    obj.labctrlNome:setAlign("top");
    obj.labctrlNome:setText("NOME");
    obj.labctrlNome:setVertTextAlign("leading");
    obj.labctrlNome:setWordWrap(true);
    obj.labctrlNome:setTextTrimming("none");
    obj.labctrlNome:setFontSize(12);
    obj.labctrlNome:setFontColor("#D0D0D0");

    self.ctrlNome:setHeight(self.edtctrlNome:getHeight() + self.labctrlNome:getHeight());


    obj.ctrlID = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.ctrlID:setParent(obj.flOutter);
    obj.ctrlID:setHeight(50);
    obj.ctrlID:setMinScaledWidth(100);
    obj.ctrlID:setMinWidth(100);
    obj.ctrlID:setMaxWidth(233);
    obj.ctrlID:setMaxScaledWidth(233);
    obj.ctrlID:setAvoidScale(true);
    obj.ctrlID:setName("ctrlID");
    obj.ctrlID:setMargins({left=1, right=1, top=2, bottom=2});
    obj.ctrlID:setVertAlign("leading");

    obj.edtctrlID = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtctrlID:setParent(obj.ctrlID);
    obj.edtctrlID:setName("edtctrlID");
    obj.edtctrlID:setAlign("top");
    obj.edtctrlID:setField("id");
    obj.edtctrlID:setFontSize(13);
    obj.edtctrlID:setTransparent(false);
    obj.edtctrlID:setVertTextAlign("center");
    obj.edtctrlID:setReadOnly(true);
    obj.edtctrlID:setHeight(30);
    obj.edtctrlID:setWidth(195);
    obj.edtctrlID:setFontColor("white");

    obj.labctrlID = GUI.fromHandle(_obj_newObject("label"));
    obj.labctrlID:setParent(obj.ctrlID);
    obj.labctrlID:setName("labctrlID");
    obj.labctrlID:setAlign("top");
    obj.labctrlID:setText("ID");
    obj.labctrlID:setVertTextAlign("leading");
    obj.labctrlID:setWordWrap(true);
    obj.labctrlID:setTextTrimming("none");
    obj.labctrlID:setFontSize(12);
    obj.labctrlID:setFontColor("#D0D0D0");

    self.ctrlID:setHeight(self.edtctrlID:getHeight() + self.labctrlID:getHeight());


    obj.ctrlVal = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.ctrlVal:setParent(obj.flOutter);
    obj.ctrlVal:setHeight(50);
    obj.ctrlVal:setMinScaledWidth(100);
    obj.ctrlVal:setMinWidth(100);
    obj.ctrlVal:setMaxWidth(233);
    obj.ctrlVal:setMaxScaledWidth(233);
    obj.ctrlVal:setAvoidScale(true);
    obj.ctrlVal:setName("ctrlVal");
    obj.ctrlVal:setMargins({left=1, right=1, top=2, bottom=2});
    obj.ctrlVal:setVertAlign("leading");

    obj.edtctrlVal = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtctrlVal:setParent(obj.ctrlVal);
    obj.edtctrlVal:setName("edtctrlVal");
    obj.edtctrlVal:setAlign("top");
    obj.edtctrlVal:setField("val");
    obj.edtctrlVal:setFontSize(13);
    obj.edtctrlVal:setTransparent(false);
    obj.edtctrlVal:setVertTextAlign("center");
    obj.edtctrlVal:setReadOnly(false);
    obj.edtctrlVal:setHeight(30);
    obj.edtctrlVal:setWidth(195);
    obj.edtctrlVal:setFontColor("white");

    obj.labctrlVal = GUI.fromHandle(_obj_newObject("label"));
    obj.labctrlVal:setParent(obj.ctrlVal);
    obj.labctrlVal:setName("labctrlVal");
    obj.labctrlVal:setAlign("top");
    obj.labctrlVal:setText("VALOR");
    obj.labctrlVal:setVertTextAlign("leading");
    obj.labctrlVal:setWordWrap(true);
    obj.labctrlVal:setTextTrimming("none");
    obj.labctrlVal:setFontSize(12);
    obj.labctrlVal:setFontColor("#D0D0D0");

    self.ctrlVal:setHeight(self.edtctrlVal:getHeight() + self.labctrlVal:getHeight());


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("nome");
    obj.dataLink1:setDefaultValue("Nome da propriedade não foi inicializado");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("descricao");
    obj.dataLink2:setDefaultValue("Descrição da propriedade não foi inicializada");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("tipo");
    obj.dataLink3:setDefaultValue("bool");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("implementado");
    obj.dataLink4:setDefaultValue("true");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("min");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("max");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("default");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("enabled");
    obj.dataLink8:setDefaultValue("true");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({"val", "enabled"});
    obj.dataLink9:setName("dataLink9");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo('Você tem certeza que deseja remover essa propriedade?', function(confirmado) if confirmado then
            			local ficha = common.getTopNode(sheet);
            			ficha.propriedades[sheet.id] = nil;
            			ficha.propriedades.alterou = sheet.id;
            			ficha.propriedades.alterou = nil;
            			NDB.deleteNode(self.sheet);
            		end; end);
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.labctrlNome:setHint(sheet.descricao);
            		self.labctrlNome:setHitTest(true);
            		self.labctrlVal:setHint(sheet.descricao);
            		self.labctrlVal:setHitTest(true);
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.tipo == 'bool' then self.ctrlVal:setVisible(false);
            		else						 self.ctrlVal:setVisible(true);
            		end;
            
            		if sheet.tipo == 'int' then	self.edtctrlVal:setType('number');
            		else						self.edtctrlVal:setType('text');
            		end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local implementado = (sheet.implementado ~= false and sheet.implementado ~= 'false');
            
            		self.ctrlEnabled:setEnabled(implementado);
            		self.ctrlNome:setEnabled(implementado);
            		self.ctrlVal:setEnabled(implementado);
            
            		if implementado then self.ctrlEnabled:setHitTest(false);
            		else self.ctrlEnabled:setHitTest(true);
            		end;
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if tonumber(sheet.min) then self.edtctrlVal:setMin(sheet.min); end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if tonumber(sheet.max) then self.edtctrlVal:setMax(sheet.max); end;
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.default and sheet.val == nil then
            			if     sheet.tipo == 'int'  then sheet.val = tonumber(sheet.default);
            			elseif sheet.tipo ~= 'bool' then sheet.val = sheet.default;
            			end;
            		end;
        end, obj);

    obj._e_event7 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet and sheet.id then
            			local ficha = common.getTopNode(sheet);
            
            			if sheet.val == nil or (sheet.val == '' and sheet.tipo ~= 'string') then
            				sheet.oldVal = sheet.default;
            				sheet.val = sheet.default;
            				return;
            			end;
            
            			if sheet.oldVal ~= sheet.val and sheet.tipo == 'rolagem' then
            				local roll = common.interpreta(ficha, sheet.val):gsub(' ', '');
            				local roll2 = Firecast.interpretarRolagem(roll).asString:gsub(' ', '');
            				if roll ~= roll2 then
            					showMessage('"' .. roll .. '" ("' .. sheet.val .. '") não é uma rolagem válida.');
            					showMessage(Firecast.interpretarRolagem(roll).asString);
            					showMessage(roll);
            					sheet.val = sheet.oldVal;
            					return;
            				end;
            			end;
            
            			if ficha.propriedades[sheet.id] ~= sheet.enabled or sheet.oldVal ~= sheet.val then
            				ficha.propriedades[sheet.id] = sheet.enabled;
            				ficha.propriedades.alterou = sheet.id;
            				ficha.propriedades.alterou = nil;
            				sheet.oldVal = sheet.val;
            			end;
            		end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edtctrlID ~= nil then self.edtctrlID:destroy(); self.edtctrlID = nil; end;
        if self.edtctrlNome ~= nil then self.edtctrlNome:destroy(); self.edtctrlNome = nil; end;
        if self.ctrlID ~= nil then self.ctrlID:destroy(); self.ctrlID = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.labctrlNome ~= nil then self.labctrlNome:destroy(); self.labctrlNome = nil; end;
        if self.labctrlID ~= nil then self.labctrlID:destroy(); self.labctrlID = nil; end;
        if self.ctrlVal ~= nil then self.ctrlVal:destroy(); self.ctrlVal = nil; end;
        if self.labctrlEnabled ~= nil then self.labctrlEnabled:destroy(); self.labctrlEnabled = nil; end;
        if self.flOutter ~= nil then self.flOutter:destroy(); self.flOutter = nil; end;
        if self.cbxctrlEnabled ~= nil then self.cbxctrlEnabled:destroy(); self.cbxctrlEnabled = nil; end;
        if self.edtctrlVal ~= nil then self.edtctrlVal:destroy(); self.edtctrlVal = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.ctrlNome ~= nil then self.ctrlNome:destroy(); self.ctrlNome = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.labctrlVal ~= nil then self.labctrlVal:destroy(); self.labctrlVal = nil; end;
        if self.ctrlEnabled ~= nil then self.ctrlEnabled:destroy(); self.ctrlEnabled = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaPropriedade()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaPropriedade();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaPropriedade = {
    newEditor = newfrmFichaPropriedade, 
    new = newfrmFichaPropriedade, 
    name = "frmFichaPropriedade", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaPropriedade = _frmFichaPropriedade;
Firecast.registrarForm(_frmFichaPropriedade);

return _frmFichaPropriedade;
