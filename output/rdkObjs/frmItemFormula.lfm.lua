require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemFormula()
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
    obj:setName("frmItemFormula");
    obj:setHeight(29);

  require("common.lua"); 


 
		



			require("common.lua");
		



	


    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setHeight(29);
    obj.flowLayout1:setPadding({top=2, bottom=2, left=2, right=2});
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setWidth(34);
    obj.flowPart1:setMaxWidth(835);
    obj.flowPart1:setHeight(25);
    obj.flowPart1:setName("flowPart1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("formula");
    obj.edit1:setTextPrompt("Fórmula");
    obj.edit1:setName("edit1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setWidth(5);
    obj.flowPart2:setHeight(25);
    obj.flowPart2:setName("flowPart2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setWidth(33);
    obj.flowPart3:setMaxWidth(830);
    obj.flowPart3:setHeight(25);
    obj.flowPart3:setName("flowPart3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart3);
    obj.edit2:setAlign("client");
    obj.edit2:setField("contexto");
    obj.edit2:setTextPrompt("Contexto");
    obj.edit2:setName("edit2");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setWidth(5);
    obj.flowPart4:setHeight(25);
    obj.flowPart4:setName("flowPart4");

    obj.tipoDanoFP = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.tipoDanoFP:setParent(obj.flowLayout1);
    obj.tipoDanoFP:setName("tipoDanoFP");
    obj.tipoDanoFP:setWidth(27);
    obj.tipoDanoFP:setMaxWidth(685);
    obj.tipoDanoFP:setHeight(25);

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.tipoDanoFP);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setField("tipoDano");
    obj.comboBox1:setItems({'', 'Ácido', 'Contusão', 'Gelo', 'Fogo', 'Energia', 'Elétrico', 'Necrótico', 'Perfurante', 'Veneno', 'Psíquico', 'Radiante', 'Cortante', 'Trovejante', 'Cura', 'Cura (Temporária)'});
    obj.comboBox1:setName("comboBox1");

    obj.tipoDanoMargin = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.tipoDanoMargin:setParent(obj.flowLayout1);
    obj.tipoDanoMargin:setName("tipoDanoMargin");
    obj.tipoDanoMargin:setWidth(5);
    obj.tipoDanoMargin:setHeight(25);

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setWidth(20);
    obj.flowPart5:setMaxWidth(35);
    obj.flowPart5:setHeight(25);
    obj.flowPart5:setName("flowPart5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowPart5);
    obj.button1:setAlign("client");
    obj.button1:setText("-");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("formula");
    obj.dataLink1:setDefaultValue("");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("contexto");
    obj.dataLink2:setDefaultValue("");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("tipoDano");
    obj.dataLink3:setDefaultValue("");
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            common.askForDelete(sheet);
        end, obj);

    obj._e_event1 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.tipoDanoFP:setVisible(sheet.tipoDano ~= "não");
            		self.tipoDanoMargin:setVisible(sheet.tipoDano ~= "não");
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.tipoDanoMargin ~= nil then self.tipoDanoMargin:destroy(); self.tipoDanoMargin = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.tipoDanoFP ~= nil then self.tipoDanoFP:destroy(); self.tipoDanoFP = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemFormula()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemFormula();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemFormula = {
    newEditor = newfrmItemFormula, 
    new = newfrmItemFormula, 
    name = "frmItemFormula", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmItemFormula = _frmItemFormula;
Firecast.registrarForm(_frmItemFormula);

return _frmItemFormula;
