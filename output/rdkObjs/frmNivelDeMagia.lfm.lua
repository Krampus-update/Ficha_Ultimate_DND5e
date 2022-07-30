require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmNivelDeMagia()
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
    obj:setName("frmNivelDeMagia");

  require("common.lua"); 


 



		require("common.lua");
		local function atualizaTamanho()
			local margins = self.rect.margins;
			local padding = self.rect.padding;

			local h1 = self.layItem:getHeight() + 2 + margins.top + margins.bottom + padding.top + padding.bottom;
			local h2 = self.rclMagias:getHeight();
			self.fpRect:setHeight(h1);
			self.fpMagias:setHeight(h2);
			self:setHeight(h1 + h2);
		end;
	


 


    obj.outLay = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.outLay:setParent(obj);
    obj.outLay:setName("outLay");
    obj.outLay:setAlign("client");
    obj.outLay:setHorzAlign("center");

    obj.fpRect = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpRect:setParent(obj.outLay);
    obj.fpRect:setName("fpRect");
    obj.fpRect:setMinWidth(691);
    obj.fpRect:setMinScaledWidth(371);
    obj.fpRect:setMaxWidth(1431);
    obj.fpRect:setAdjustHeightToLine(true);

    obj.rect = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rect:setParent(obj.fpRect);
    obj.rect:setName("rect");
    obj.rect:setAlign("client");
    obj.rect:setColor("DarkGray");
    obj.rect:setMargins({top=2, bottom=2, left=10, right=10});
    obj.rect:setPadding({top=3, bottom=3});
    obj.rect:setXradius(2);
    obj.rect:setYradius(2);

    obj.layItem = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.layItem:setParent(obj.rect);
    obj.layItem:setName("layItem");
    obj.layItem:setAlign("top");
    obj.layItem:setAutoHeight(true);
    obj.layItem:setHorzAlign("center");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.layItem);
    obj.flowLayout1:setMinWidth(200);
    obj.flowLayout1:setMinScaledWidth(105);
    obj.flowLayout1:setMaxWidth(390);
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setAdjustHeightToLine(true);
    obj.flowLayout1:setVertAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.fpNome = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpNome:setParent(obj.flowLayout1);
    obj.fpNome:setName("fpNome");
    obj.fpNome:setMinWidth(72.0);
    obj.fpNome:setMinScaledWidth(36.0);
    obj.fpNome:setMaxWidth(144.0);
    obj.fpNome:setAvoidScale(true);
    obj.fpNome:setAdjustHeightToLine(true);
    obj.fpNome:setPadding({left=0, right=0});
    obj.fpNome:setVertAlign("center");

    obj.labelFieldNome = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldNome:setParent(obj.fpNome);
    obj.labelFieldNome:setName("labelFieldNome");
    obj.labelFieldNome:setAlign("client");
    obj.labelFieldNome:setHitTest(false);
    obj.labelFieldNome:setCanFocus(false);
    obj.labelFieldNome:setCursor("default");
    obj.labelFieldNome:setField("nome");
    obj.labelFieldNome:setHorzTextAlign("leading");
    obj.labelFieldNome:setVertTextAlign("center");
    obj.labelFieldNome:setReadOnly(true);
    obj.labelFieldNome:setTransparent(true);
    obj.labelFieldNome:setFontColor("#555555");

    obj.fpEspacosAtuais = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpEspacosAtuais:setParent(obj.flowLayout1);
    obj.fpEspacosAtuais:setName("fpEspacosAtuais");
    obj.fpEspacosAtuais:setMinWidth(8.0);
    obj.fpEspacosAtuais:setMinScaledWidth(4.0);
    obj.fpEspacosAtuais:setMaxWidth(16.0);
    obj.fpEspacosAtuais:setAvoidScale(true);
    obj.fpEspacosAtuais:setAdjustHeightToLine(true);
    obj.fpEspacosAtuais:setPadding({left=0, right=0});
    obj.fpEspacosAtuais:setVertAlign("center");

    obj.editEspacosAtuais = GUI.fromHandle(_obj_newObject("edit"));
    obj.editEspacosAtuais:setParent(obj.fpEspacosAtuais);
    obj.editEspacosAtuais:setName("editEspacosAtuais");
    obj.editEspacosAtuais:setAlign("client");
    obj.editEspacosAtuais:setHitTest(true);
    obj.editEspacosAtuais:setCanFocus(true);
    obj.editEspacosAtuais:setCursor("handPoint");
    obj.editEspacosAtuais:setType("number");
    obj.editEspacosAtuais:setField("espacosAtuais");
    obj.editEspacosAtuais:setHorzTextAlign("center");
    obj.editEspacosAtuais:setVertTextAlign("center");
    obj.editEspacosAtuais:setTransparent(true);
    obj.editEspacosAtuais:setFontColor("#555555");
    obj.editEspacosAtuais:setHint("Espaços Atuais");

    obj.fpslash = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpslash:setParent(obj.flowLayout1);
    obj.fpslash:setName("fpslash");
    obj.fpslash:setMinWidth(5.0);
    obj.fpslash:setMinScaledWidth(2.5);
    obj.fpslash:setMaxWidth(10.0);
    obj.fpslash:setAvoidScale(true);
    obj.fpslash:setAdjustHeightToLine(true);
    obj.fpslash:setPadding({left=0, right=0});
    obj.fpslash:setVertAlign("center");

    obj.labelslash = GUI.fromHandle(_obj_newObject("label"));
    obj.labelslash:setParent(obj.fpslash);
    obj.labelslash:setName("labelslash");
    obj.labelslash:setAlign("client");
    obj.labelslash:setHitTest(false);
    obj.labelslash:setCanFocus(false);
    obj.labelslash:setCursor("default");
    obj.labelslash:setText("/");
    obj.labelslash:setHorzTextAlign("center");
    obj.labelslash:setVertTextAlign("center");
    obj.labelslash:setFontColor("#555555");

    obj.fpEspacosTotais = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpEspacosTotais:setParent(obj.flowLayout1);
    obj.fpEspacosTotais:setName("fpEspacosTotais");
    obj.fpEspacosTotais:setMinWidth(8.0);
    obj.fpEspacosTotais:setMinScaledWidth(4.0);
    obj.fpEspacosTotais:setMaxWidth(16.0);
    obj.fpEspacosTotais:setAvoidScale(true);
    obj.fpEspacosTotais:setAdjustHeightToLine(true);
    obj.fpEspacosTotais:setPadding({left=0, right=0});
    obj.fpEspacosTotais:setVertAlign("center");

    obj.editEspacosTotais = GUI.fromHandle(_obj_newObject("edit"));
    obj.editEspacosTotais:setParent(obj.fpEspacosTotais);
    obj.editEspacosTotais:setName("editEspacosTotais");
    obj.editEspacosTotais:setAlign("client");
    obj.editEspacosTotais:setHitTest(true);
    obj.editEspacosTotais:setCanFocus(true);
    obj.editEspacosTotais:setCursor("handPoint");
    obj.editEspacosTotais:setType("number");
    obj.editEspacosTotais:setField("espacosTotais");
    obj.editEspacosTotais:setHorzTextAlign("center");
    obj.editEspacosTotais:setVertTextAlign("center");
    obj.editEspacosTotais:setTransparent(true);
    obj.editEspacosTotais:setFontColor("#555555");
    obj.editEspacosTotais:setHint("Espaços Máximos");

    obj.fpMagiaDePacto = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpMagiaDePacto:setParent(obj.flowLayout1);
    obj.fpMagiaDePacto:setName("fpMagiaDePacto");
    obj.fpMagiaDePacto:setWidth(12.0);
    obj.fpMagiaDePacto:setAvoidScale(true);
    obj.fpMagiaDePacto:setAdjustHeightToLine(true);
    obj.fpMagiaDePacto:setPadding({left=0, right=0});
    obj.fpMagiaDePacto:setVertAlign("center");

    obj.chbMagiaDePacto = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.chbMagiaDePacto:setParent(obj.fpMagiaDePacto);
    obj.chbMagiaDePacto:setName("chbMagiaDePacto");
    obj.chbMagiaDePacto:setAlign("left");
    obj.chbMagiaDePacto:setWidth(12);
    obj.chbMagiaDePacto:setHitTest(true);
    obj.chbMagiaDePacto:setCanFocus(true);
    obj.chbMagiaDePacto:setCursor("handPoint");
    obj.chbMagiaDePacto:setImageChecked("/images/checkbox1_checked.png");
    obj.chbMagiaDePacto:setImageUnchecked("/images/checkbox1_unchecked.png");
    obj.chbMagiaDePacto:setField("magiaDePacto");
    obj.chbMagiaDePacto:setHint("Recupera com Descanso Curto");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.layItem);
    obj.flowLayout2:setMinWidth(50);
    obj.flowLayout2:setMinScaledWidth(25);
    obj.flowLayout2:setMaxWidth(100);
    obj.flowLayout2:setAdjustHeightToLine(true);
    obj.flowLayout2:setVertAlign("center");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.fpComponentes = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpComponentes:setParent(obj.flowLayout2);
    obj.fpComponentes:setName("fpComponentes");
    obj.fpComponentes:setWidth(32.0);
    obj.fpComponentes:setAvoidScale(true);
    obj.fpComponentes:setAdjustHeightToLine(true);
    obj.fpComponentes:setPadding({left=0, right=0});
    obj.fpComponentes:setVertAlign("center");

    obj.imgComponentes = GUI.fromHandle(_obj_newObject("image"));
    obj.imgComponentes:setParent(obj.fpComponentes);
    obj.imgComponentes:setName("imgComponentes");
    obj.imgComponentes:setAlign("left");
    obj.imgComponentes:setWidth(32);
    obj.imgComponentes:setHitTest(false);
    obj.imgComponentes:setCanFocus(false);
    obj.imgComponentes:setCursor("default");
    obj.imgComponentes:setURL("/images/components.png");
    obj.imgComponentes:setStyle("proportional");
    obj.imgComponentes:setHint("Componentes");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.layItem);
    obj.flowLayout3:setMinWidth(100);
    obj.flowLayout3:setMinScaledWidth(50);
    obj.flowLayout3:setMaxWidth(200);
    obj.flowLayout3:setAdjustHeightToLine(true);
    obj.flowLayout3:setVertAlign("center");
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.fpEscolaDeMagia = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpEscolaDeMagia:setParent(obj.flowLayout3);
    obj.fpEscolaDeMagia:setName("fpEscolaDeMagia");
    obj.fpEscolaDeMagia:setWidth(32.0);
    obj.fpEscolaDeMagia:setAvoidScale(true);
    obj.fpEscolaDeMagia:setAdjustHeightToLine(true);
    obj.fpEscolaDeMagia:setPadding({left=0, right=0});
    obj.fpEscolaDeMagia:setVertAlign("center");

    obj.imgEscolaDeMagia = GUI.fromHandle(_obj_newObject("image"));
    obj.imgEscolaDeMagia:setParent(obj.fpEscolaDeMagia);
    obj.imgEscolaDeMagia:setName("imgEscolaDeMagia");
    obj.imgEscolaDeMagia:setAlign("left");
    obj.imgEscolaDeMagia:setWidth(32);
    obj.imgEscolaDeMagia:setHitTest(false);
    obj.imgEscolaDeMagia:setCanFocus(false);
    obj.imgEscolaDeMagia:setCursor("default");
    obj.imgEscolaDeMagia:setURL("/images/school-of-magic.png");
    obj.imgEscolaDeMagia:setStyle("proportional");
    obj.imgEscolaDeMagia:setHint("Escola de Magia");

    obj.fpAlvo = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpAlvo:setParent(obj.layItem);
    obj.fpAlvo:setName("fpAlvo");
    obj.fpAlvo:setMinWidth(100.0);
    obj.fpAlvo:setMinScaledWidth(50.0);
    obj.fpAlvo:setMaxWidth(200.0);
    obj.fpAlvo:setAvoidScale(true);
    obj.fpAlvo:setAdjustHeightToLine(true);
    obj.fpAlvo:setPadding({left=0, right=0});
    obj.fpAlvo:setVertAlign("center");

    obj.labelAlvo = GUI.fromHandle(_obj_newObject("label"));
    obj.labelAlvo:setParent(obj.fpAlvo);
    obj.labelAlvo:setName("labelAlvo");
    obj.labelAlvo:setAlign("client");
    obj.labelAlvo:setHitTest(false);
    obj.labelAlvo:setCanFocus(false);
    obj.labelAlvo:setCursor("default");
    obj.labelAlvo:setText("Alvo");
    obj.labelAlvo:setHorzTextAlign("center");
    obj.labelAlvo:setVertTextAlign("center");
    obj.labelAlvo:setFontColor("#555555");

    obj.fpUso = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpUso:setParent(obj.layItem);
    obj.fpUso:setName("fpUso");
    obj.fpUso:setMinWidth(100.0);
    obj.fpUso:setMinScaledWidth(50.0);
    obj.fpUso:setMaxWidth(200.0);
    obj.fpUso:setAvoidScale(true);
    obj.fpUso:setAdjustHeightToLine(true);
    obj.fpUso:setPadding({left=0, right=0});
    obj.fpUso:setVertAlign("center");

    obj.labelUso = GUI.fromHandle(_obj_newObject("label"));
    obj.labelUso:setParent(obj.fpUso);
    obj.labelUso:setName("labelUso");
    obj.labelUso:setAlign("client");
    obj.labelUso:setHitTest(false);
    obj.labelUso:setCanFocus(false);
    obj.labelUso:setCursor("default");
    obj.labelUso:setText("Uso");
    obj.labelUso:setHorzTextAlign("center");
    obj.labelUso:setVertTextAlign("center");
    obj.labelUso:setFontColor("#555555");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.layItem);
    obj.flowLayout4:setMinWidth(141);
    obj.flowLayout4:setMinScaledWidth(91);
    obj.flowLayout4:setAvoidScale(true);
    obj.flowLayout4:setAdjustHeightToLine(true);
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setVertAlign("center");
    obj.flowLayout4:setPadding({left=15, right=15});
    obj.flowLayout4:setName("flowLayout4");

    obj.fpAdicionar = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpAdicionar:setParent(obj.flowLayout4);
    obj.fpAdicionar:setName("fpAdicionar");
    obj.fpAdicionar:setWidth(32.0);
    obj.fpAdicionar:setAvoidScale(true);
    obj.fpAdicionar:setAdjustHeightToLine(true);
    obj.fpAdicionar:setPadding({left=0, right=0});
    obj.fpAdicionar:setVertAlign("center");

    obj.imgAdicionar = GUI.fromHandle(_obj_newObject("image"));
    obj.imgAdicionar:setParent(obj.fpAdicionar);
    obj.imgAdicionar:setName("imgAdicionar");
    obj.imgAdicionar:setAlign("left");
    obj.imgAdicionar:setWidth(32);
    obj.imgAdicionar:setHitTest(true);
    obj.imgAdicionar:setCanFocus(true);
    obj.imgAdicionar:setCursor("handPoint");
    obj.imgAdicionar:setURL("/images/add.png");
    obj.imgAdicionar:setStyle("proportional");
    obj.imgAdicionar:setHint("Adicionar Magia");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.outLay);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.fpMagias = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpMagias:setParent(obj.outLay);
    obj.fpMagias:setName("fpMagias");
    obj.fpMagias:setMinWidth(691);
    obj.fpMagias:setMinScaledWidth(371);
    obj.fpMagias:setMaxWidth(1431);
    obj.fpMagias:setAdjustHeightToLine(true);

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.fpMagias);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setAlign("top");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setTemplateForm("frmItemDeMagia");
    obj.rclMagias:setAutoHeight(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'descansoLongo', 'descansoCurto'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("nome");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.rect:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event1 = obj.rect:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event2 = obj.layItem:addEventListener("onResize",
        function (_)
            atualizaTamanho();
        end, obj);

    obj._e_event3 = obj.labelFieldNome:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event4 = obj.labelFieldNome:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event5 = obj.editEspacosAtuais:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event6 = obj.editEspacosAtuais:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event7 = obj.editEspacosAtuais:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'editEspacosAtuais', node = sheet, form = self, event='onClick', contexto = ''}, nil, false);
        end, obj);

    obj._e_event8 = obj.editEspacosAtuais:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'editEspacosAtuais', node = sheet, form = self, event='onMenu', contexto = ''}, nil, true);
        end, obj);

    obj._e_event9 = obj.labelslash:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event10 = obj.labelslash:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event11 = obj.editEspacosTotais:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event12 = obj.editEspacosTotais:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event13 = obj.editEspacosTotais:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'editEspacosTotais', node = sheet, form = self, event='onClick', contexto = ''}, nil, false);
        end, obj);

    obj._e_event14 = obj.editEspacosTotais:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'editEspacosTotais', node = sheet, form = self, event='onMenu', contexto = ''}, nil, true);
        end, obj);

    obj._e_event15 = obj.chbMagiaDePacto:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event16 = obj.chbMagiaDePacto:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event17 = obj.chbMagiaDePacto:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'chbMagiaDePacto', node = sheet, form = self, event='onClick', contexto = ''}, nil, false);
        end, obj);

    obj._e_event18 = obj.chbMagiaDePacto:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'chbMagiaDePacto', node = sheet, form = self, event='onMenu', contexto = ''}, nil, true);
        end, obj);

    obj._e_event19 = obj.imgComponentes:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event20 = obj.imgComponentes:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event21 = obj.imgEscolaDeMagia:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event22 = obj.imgEscolaDeMagia:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event23 = obj.labelAlvo:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event24 = obj.labelAlvo:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event25 = obj.labelUso:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event26 = obj.labelUso:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event27 = obj.imgAdicionar:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event28 = obj.imgAdicionar:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event29 = obj.imgAdicionar:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'imgAdicionar', node = sheet, form = self, event='onClick', contexto = 'criaMagia'}, nil, false);
        end, obj);

    obj._e_event30 = obj.imgAdicionar:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'imgAdicionar', node = sheet, form = self, event='onMenu', contexto = 'criaMagia' }, nil, true);
        end, obj);

    obj._e_event31 = obj.rclMagias:addEventListener("onResize",
        function (_)
            atualizaTamanho();
        end, obj);

    obj._e_event32 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.descansoLongo or (sheet.descansoCurto and sheet.magiaDePacto) then
            				sheet.espacosAtuais = sheet.espacosTotais;
            			end;
        end, obj);

    obj._e_event33 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nome == "Truques" then
            				self.editEspacosAtuais:setVisible(false);
            				self.labelslash:setVisible(false);
            				self.editEspacosTotais:setVisible(false);
            				self.chbMagiaDePacto:setVisible(false);
            			end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
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

        if self.layItem ~= nil then self.layItem:destroy(); self.layItem = nil; end;
        if self.fpMagiaDePacto ~= nil then self.fpMagiaDePacto:destroy(); self.fpMagiaDePacto = nil; end;
        if self.imgComponentes ~= nil then self.imgComponentes:destroy(); self.imgComponentes = nil; end;
        if self.fpslash ~= nil then self.fpslash:destroy(); self.fpslash = nil; end;
        if self.fpUso ~= nil then self.fpUso:destroy(); self.fpUso = nil; end;
        if self.rect ~= nil then self.rect:destroy(); self.rect = nil; end;
        if self.labelslash ~= nil then self.labelslash:destroy(); self.labelslash = nil; end;
        if self.fpEscolaDeMagia ~= nil then self.fpEscolaDeMagia:destroy(); self.fpEscolaDeMagia = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.labelAlvo ~= nil then self.labelAlvo:destroy(); self.labelAlvo = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.chbMagiaDePacto ~= nil then self.chbMagiaDePacto:destroy(); self.chbMagiaDePacto = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.labelUso ~= nil then self.labelUso:destroy(); self.labelUso = nil; end;
        if self.fpAdicionar ~= nil then self.fpAdicionar:destroy(); self.fpAdicionar = nil; end;
        if self.outLay ~= nil then self.outLay:destroy(); self.outLay = nil; end;
        if self.fpMagias ~= nil then self.fpMagias:destroy(); self.fpMagias = nil; end;
        if self.editEspacosAtuais ~= nil then self.editEspacosAtuais:destroy(); self.editEspacosAtuais = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.fpEspacosAtuais ~= nil then self.fpEspacosAtuais:destroy(); self.fpEspacosAtuais = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.fpNome ~= nil then self.fpNome:destroy(); self.fpNome = nil; end;
        if self.fpComponentes ~= nil then self.fpComponentes:destroy(); self.fpComponentes = nil; end;
        if self.labelFieldNome ~= nil then self.labelFieldNome:destroy(); self.labelFieldNome = nil; end;
        if self.fpRect ~= nil then self.fpRect:destroy(); self.fpRect = nil; end;
        if self.editEspacosTotais ~= nil then self.editEspacosTotais:destroy(); self.editEspacosTotais = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.imgEscolaDeMagia ~= nil then self.imgEscolaDeMagia:destroy(); self.imgEscolaDeMagia = nil; end;
        if self.fpAlvo ~= nil then self.fpAlvo:destroy(); self.fpAlvo = nil; end;
        if self.imgAdicionar ~= nil then self.imgAdicionar:destroy(); self.imgAdicionar = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.fpEspacosTotais ~= nil then self.fpEspacosTotais:destroy(); self.fpEspacosTotais = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmNivelDeMagia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmNivelDeMagia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmNivelDeMagia = {
    newEditor = newfrmNivelDeMagia, 
    new = newfrmNivelDeMagia, 
    name = "frmNivelDeMagia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmNivelDeMagia = _frmNivelDeMagia;
Firecast.registrarForm(_frmNivelDeMagia);

return _frmNivelDeMagia;
