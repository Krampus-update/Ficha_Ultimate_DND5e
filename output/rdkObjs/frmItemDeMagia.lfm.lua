require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemDeMagia()
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
    obj:setName("frmItemDeMagia");

  require("common.lua"); 


 



		require("common.lua");
		local function atualizaTamanho()
			local margins = self.rect.margins;
			local padding = self.rect.padding;

			local h = self.layItem:getHeight() + 2 + margins.top + margins.bottom + padding.top + padding.bottom;
			self.fpRect:setHeight(h);
			self:setHeight(h);
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
    obj.rect:setColor("DimGray");
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

    obj.fpIcone = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpIcone:setParent(obj.flowLayout1);
    obj.fpIcone:setName("fpIcone");
    obj.fpIcone:setWidth(32.0);
    obj.fpIcone:setAvoidScale(true);
    obj.fpIcone:setAdjustHeightToLine(true);
    obj.fpIcone:setPadding({left=0, right=0});
    obj.fpIcone:setVertAlign("center");

    obj.imgIcone = GUI.fromHandle(_obj_newObject("image"));
    obj.imgIcone:setParent(obj.fpIcone);
    obj.imgIcone:setName("imgIcone");
    obj.imgIcone:setAlign("left");
    obj.imgIcone:setWidth(32);
    obj.imgIcone:setHitTest(true);
    obj.imgIcone:setCanFocus(true);
    obj.imgIcone:setCursor("handPoint");
    obj.imgIcone:setField("icone");
    obj.imgIcone:setHint("Icone");

    obj.fpNome = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpNome:setParent(obj.flowLayout1);
    obj.fpNome:setName("fpNome");
    obj.fpNome:setMinWidth(126.0);
    obj.fpNome:setMinScaledWidth(63.0);
    obj.fpNome:setMaxWidth(252.0);
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
    obj.labelFieldNome:setFontColor("White");

    obj.fpPreparado = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpPreparado:setParent(obj.flowLayout1);
    obj.fpPreparado:setName("fpPreparado");
    obj.fpPreparado:setWidth(42.0);
    obj.fpPreparado:setAvoidScale(true);
    obj.fpPreparado:setAdjustHeightToLine(true);
    obj.fpPreparado:setPadding({left=5, right=5});
    obj.fpPreparado:setVertAlign("center");

    obj.chbPreparado = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.chbPreparado:setParent(obj.fpPreparado);
    obj.chbPreparado:setName("chbPreparado");
    obj.chbPreparado:setAlign("left");
    obj.chbPreparado:setWidth(32);
    obj.chbPreparado:setHitTest(true);
    obj.chbPreparado:setCanFocus(true);
    obj.chbPreparado:setCursor("handPoint");
    obj.chbPreparado:setImageChecked("/images/spell-prepared.png");
    obj.chbPreparado:setImageUnchecked("/images/spell-unprepared.png");
    obj.chbPreparado:setField("preparadoValor");
    obj.chbPreparado:setHint("Preparado");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.layItem);
    obj.flowPart1:setWidth(1);
    obj.flowPart1:setAdjustHeightToLine(true);
    obj.flowPart1:setName("flowPart1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("gray");
    obj.rectangle1:setName("rectangle1");

    obj.fpComponentes = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpComponentes:setParent(obj.layItem);
    obj.fpComponentes:setName("fpComponentes");
    obj.fpComponentes:setMinWidth(49.0);
    obj.fpComponentes:setMinScaledWidth(24.0);
    obj.fpComponentes:setMaxWidth(99.0);
    obj.fpComponentes:setAvoidScale(true);
    obj.fpComponentes:setAdjustHeightToLine(true);
    obj.fpComponentes:setPadding({left=0, right=0});
    obj.fpComponentes:setVertAlign("center");

    obj.labelFieldComponentes = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldComponentes:setParent(obj.fpComponentes);
    obj.labelFieldComponentes:setName("labelFieldComponentes");
    obj.labelFieldComponentes:setAlign("client");
    obj.labelFieldComponentes:setHitTest(false);
    obj.labelFieldComponentes:setCanFocus(false);
    obj.labelFieldComponentes:setCursor("default");
    obj.labelFieldComponentes:setField("componentes");
    obj.labelFieldComponentes:setHorzTextAlign("center");
    obj.labelFieldComponentes:setVertTextAlign("center");
    obj.labelFieldComponentes:setReadOnly(true);
    obj.labelFieldComponentes:setTransparent(true);
    obj.labelFieldComponentes:setFontColor("White");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.layItem);
    obj.flowPart2:setWidth(1);
    obj.flowPart2:setAdjustHeightToLine(true);
    obj.flowPart2:setName("flowPart2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowPart2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("gray");
    obj.rectangle2:setName("rectangle2");

    obj.fpEscolaDeMagia = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpEscolaDeMagia:setParent(obj.layItem);
    obj.fpEscolaDeMagia:setName("fpEscolaDeMagia");
    obj.fpEscolaDeMagia:setMinWidth(99.0);
    obj.fpEscolaDeMagia:setMinScaledWidth(49.0);
    obj.fpEscolaDeMagia:setMaxWidth(199.0);
    obj.fpEscolaDeMagia:setAvoidScale(true);
    obj.fpEscolaDeMagia:setAdjustHeightToLine(true);
    obj.fpEscolaDeMagia:setPadding({left=0, right=0});
    obj.fpEscolaDeMagia:setVertAlign("center");

    obj.labelFieldEscolaDeMagia = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldEscolaDeMagia:setParent(obj.fpEscolaDeMagia);
    obj.labelFieldEscolaDeMagia:setName("labelFieldEscolaDeMagia");
    obj.labelFieldEscolaDeMagia:setAlign("client");
    obj.labelFieldEscolaDeMagia:setHitTest(false);
    obj.labelFieldEscolaDeMagia:setCanFocus(false);
    obj.labelFieldEscolaDeMagia:setCursor("default");
    obj.labelFieldEscolaDeMagia:setField("escolaDeMagia");
    obj.labelFieldEscolaDeMagia:setHorzTextAlign("center");
    obj.labelFieldEscolaDeMagia:setVertTextAlign("center");
    obj.labelFieldEscolaDeMagia:setReadOnly(true);
    obj.labelFieldEscolaDeMagia:setTransparent(true);
    obj.labelFieldEscolaDeMagia:setFontColor("White");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.layItem);
    obj.flowPart3:setWidth(1);
    obj.flowPart3:setAdjustHeightToLine(true);
    obj.flowPart3:setName("flowPart3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("gray");
    obj.rectangle3:setName("rectangle3");

    obj.fpAlvoAreaDeEfeito = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpAlvoAreaDeEfeito:setParent(obj.layItem);
    obj.fpAlvoAreaDeEfeito:setName("fpAlvoAreaDeEfeito");
    obj.fpAlvoAreaDeEfeito:setMinWidth(99.0);
    obj.fpAlvoAreaDeEfeito:setMinScaledWidth(49.0);
    obj.fpAlvoAreaDeEfeito:setMaxWidth(199.0);
    obj.fpAlvoAreaDeEfeito:setAvoidScale(true);
    obj.fpAlvoAreaDeEfeito:setAdjustHeightToLine(true);
    obj.fpAlvoAreaDeEfeito:setPadding({left=0, right=0});
    obj.fpAlvoAreaDeEfeito:setVertAlign("center");

    obj.labelFieldAlvoAreaDeEfeito = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldAlvoAreaDeEfeito:setParent(obj.fpAlvoAreaDeEfeito);
    obj.labelFieldAlvoAreaDeEfeito:setName("labelFieldAlvoAreaDeEfeito");
    obj.labelFieldAlvoAreaDeEfeito:setAlign("client");
    obj.labelFieldAlvoAreaDeEfeito:setHitTest(false);
    obj.labelFieldAlvoAreaDeEfeito:setCanFocus(false);
    obj.labelFieldAlvoAreaDeEfeito:setCursor("default");
    obj.labelFieldAlvoAreaDeEfeito:setField("alvoAreaDeEfeito");
    obj.labelFieldAlvoAreaDeEfeito:setHorzTextAlign("center");
    obj.labelFieldAlvoAreaDeEfeito:setVertTextAlign("center");
    obj.labelFieldAlvoAreaDeEfeito:setReadOnly(true);
    obj.labelFieldAlvoAreaDeEfeito:setTransparent(true);
    obj.labelFieldAlvoAreaDeEfeito:setFontColor("White");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.layItem);
    obj.flowPart4:setWidth(1);
    obj.flowPart4:setAdjustHeightToLine(true);
    obj.flowPart4:setName("flowPart4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowPart4);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("gray");
    obj.rectangle4:setName("rectangle4");

    obj.fpTempoDeConjuracao = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpTempoDeConjuracao:setParent(obj.layItem);
    obj.fpTempoDeConjuracao:setName("fpTempoDeConjuracao");
    obj.fpTempoDeConjuracao:setMinWidth(99.0);
    obj.fpTempoDeConjuracao:setMinScaledWidth(49.0);
    obj.fpTempoDeConjuracao:setMaxWidth(199.0);
    obj.fpTempoDeConjuracao:setAvoidScale(true);
    obj.fpTempoDeConjuracao:setAdjustHeightToLine(true);
    obj.fpTempoDeConjuracao:setPadding({left=0, right=0});
    obj.fpTempoDeConjuracao:setVertAlign("center");

    obj.labelFieldTempoDeConjuracao = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldTempoDeConjuracao:setParent(obj.fpTempoDeConjuracao);
    obj.labelFieldTempoDeConjuracao:setName("labelFieldTempoDeConjuracao");
    obj.labelFieldTempoDeConjuracao:setAlign("client");
    obj.labelFieldTempoDeConjuracao:setHitTest(false);
    obj.labelFieldTempoDeConjuracao:setCanFocus(false);
    obj.labelFieldTempoDeConjuracao:setCursor("default");
    obj.labelFieldTempoDeConjuracao:setField("tempoConjuracao");
    obj.labelFieldTempoDeConjuracao:setHorzTextAlign("center");
    obj.labelFieldTempoDeConjuracao:setVertTextAlign("center");
    obj.labelFieldTempoDeConjuracao:setReadOnly(true);
    obj.labelFieldTempoDeConjuracao:setTransparent(true);
    obj.labelFieldTempoDeConjuracao:setFontColor("White");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.layItem);
    obj.flowPart5:setWidth(1);
    obj.flowPart5:setAdjustHeightToLine(true);
    obj.flowPart5:setName("flowPart5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowPart5);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("gray");
    obj.rectangle5:setName("rectangle5");

    obj.fpButoes = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fpButoes:setParent(obj.layItem);
    obj.fpButoes:setName("fpButoes");
    obj.fpButoes:setMinWidth(140);
    obj.fpButoes:setMinScaledWidth(90);
    obj.fpButoes:setAvoidScale(true);
    obj.fpButoes:setAdjustHeightToLine(true);
    obj.fpButoes:setHorzAlign("center");
    obj.fpButoes:setVertAlign("center");
    obj.fpButoes:setPadding({left=15, right=15});

    obj.fpFavorito = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpFavorito:setParent(obj.fpButoes);
    obj.fpFavorito:setName("fpFavorito");
    obj.fpFavorito:setWidth(32.0);
    obj.fpFavorito:setAvoidScale(true);
    obj.fpFavorito:setAdjustHeightToLine(true);
    obj.fpFavorito:setPadding({left=0, right=0});
    obj.fpFavorito:setVertAlign("center");

    obj.chbFavorito = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.chbFavorito:setParent(obj.fpFavorito);
    obj.chbFavorito:setName("chbFavorito");
    obj.chbFavorito:setAlign("left");
    obj.chbFavorito:setWidth(32);
    obj.chbFavorito:setHitTest(true);
    obj.chbFavorito:setCanFocus(true);
    obj.chbFavorito:setCursor("handPoint");
    obj.chbFavorito:setImageChecked("/images/vertical-banner-selected.png");
    obj.chbFavorito:setImageUnchecked("/images/vertical-banner-unselected.png");
    obj.chbFavorito:setField("favorito");
    obj.chbFavorito:setHint("Favorito");

    obj.fpEditar = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpEditar:setParent(obj.fpButoes);
    obj.fpEditar:setName("fpEditar");
    obj.fpEditar:setWidth(32.0);
    obj.fpEditar:setAvoidScale(true);
    obj.fpEditar:setAdjustHeightToLine(true);
    obj.fpEditar:setPadding({left=0, right=0});
    obj.fpEditar:setVertAlign("center");

    obj.imgEditar = GUI.fromHandle(_obj_newObject("image"));
    obj.imgEditar:setParent(obj.fpEditar);
    obj.imgEditar:setName("imgEditar");
    obj.imgEditar:setAlign("left");
    obj.imgEditar:setWidth(32);
    obj.imgEditar:setHitTest(true);
    obj.imgEditar:setCanFocus(true);
    obj.imgEditar:setCursor("handPoint");
    obj.imgEditar:setURL("/images/pencil.png");
    obj.imgEditar:setStyle("proportional");
    obj.imgEditar:setHint("Editar");

    obj.fpDeletar = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpDeletar:setParent(obj.fpButoes);
    obj.fpDeletar:setName("fpDeletar");
    obj.fpDeletar:setWidth(32.0);
    obj.fpDeletar:setAvoidScale(true);
    obj.fpDeletar:setAdjustHeightToLine(true);
    obj.fpDeletar:setPadding({left=0, right=0});
    obj.fpDeletar:setVertAlign("center");

    obj.imgDeletar = GUI.fromHandle(_obj_newObject("image"));
    obj.imgDeletar:setParent(obj.fpDeletar);
    obj.imgDeletar:setName("imgDeletar");
    obj.imgDeletar:setAlign("left");
    obj.imgDeletar:setWidth(32);
    obj.imgDeletar:setHitTest(true);
    obj.imgDeletar:setCanFocus(true);
    obj.imgDeletar:setCursor("handPoint");
    obj.imgDeletar:setURL("/images/trash-can.png");
    obj.imgDeletar:setStyle("proportional");
    obj.imgDeletar:setHint("Deletar");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("icone");
    obj.dataLink1:setDefaultValue("/images/spell-icon.png");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("nome");
    obj.dataLink2:setDefaultValue("NOME");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("descricao");
    obj.dataLink3:setDefaultValue("");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("nivel");
    obj.dataLink4:setDefaultValue("0");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("escolaDeMagia");
    obj.dataLink5:setDefaultValue("");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("componentesV");
    obj.dataLink6:setDefaultValue("");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("componentesS");
    obj.dataLink7:setDefaultValue("");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("componentesM");
    obj.dataLink8:setDefaultValue("");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("componentesConcentracao");
    obj.dataLink9:setDefaultValue("");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setField("componentesRitual");
    obj.dataLink10:setDefaultValue("");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setField("componentesMaterial");
    obj.dataLink11:setDefaultValue("");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setFields({'componentesV', 'componentesS', 'componentesM', 'componentesConcentracao', 'componentesRitual'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setField("preparadoValor");
    obj.dataLink13:setDefaultValue("");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj);
    obj.dataLink14:setField("preparadoTipo");
    obj.dataLink14:setDefaultValue("Preparada");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setField("tempoConjuracaoValor");
    obj.dataLink15:setDefaultValue("1");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj);
    obj.dataLink16:setField("tempoConjuracaoUnidade");
    obj.dataLink16:setDefaultValue("Ação");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj);
    obj.dataLink17:setFields({'tempoConjuracaoValor', 'tempoConjuracaoUnidade'});
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj);
    obj.dataLink18:setField("condicaoAtivacao");
    obj.dataLink18:setDefaultValue("");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj);
    obj.dataLink19:setField("alvoValor");
    obj.dataLink19:setDefaultValue("1");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj);
    obj.dataLink20:setField("alvoUnidade");
    obj.dataLink20:setDefaultValue("");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj);
    obj.dataLink21:setField("alvoTipo");
    obj.dataLink21:setDefaultValue("Criatura");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj);
    obj.dataLink22:setFields({'alvoValor', 'alvoUnidade', 'alvoTipo'});
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj);
    obj.dataLink23:setField("alcanceCurto");
    obj.dataLink23:setDefaultValue("18");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj);
    obj.dataLink24:setField("alcanceLongo");
    obj.dataLink24:setDefaultValue("");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj);
    obj.dataLink25:setField("alcanceUnidade");
    obj.dataLink25:setDefaultValue("Metros");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj);
    obj.dataLink26:setField("duracaoValor");
    obj.dataLink26:setDefaultValue("1");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj);
    obj.dataLink27:setField("duracaoUnidade");
    obj.dataLink27:setDefaultValue("Minuto");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj);
    obj.dataLink28:setField("contadorUsos");
    obj.dataLink28:setDefaultValue("0");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj);
    obj.dataLink29:setField("contadorUsosTotal");
    obj.dataLink29:setDefaultValue("-");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj);
    obj.dataLink30:setField("contadorNome");
    obj.dataLink30:setDefaultValue("");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj);
    obj.dataLink31:setField("ataqueTipo");
    obj.dataLink31:setDefaultValue("Sem Ataque");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj);
    obj.dataLink32:setField("ataqueAtributo");
    obj.dataLink32:setDefaultValue("Conjuração");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj);
    obj.dataLink33:setField("ataqueBonus");
    obj.dataLink33:setDefaultValue("0");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj);
    obj.dataLink34:setField("cdResistenciaAtributo");
    obj.dataLink34:setDefaultValue("");
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj);
    obj.dataLink35:setField("cdResistenciaValor");
    obj.dataLink35:setDefaultValue("10");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj);
    obj.dataLink36:setField("cdResistenciaTipo");
    obj.dataLink36:setDefaultValue("Conjuração");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj);
    obj.dataLink37:setField("mensagem");
    obj.dataLink37:setDefaultValue("");
    obj.dataLink37:setName("dataLink37");

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

    obj._e_event3 = obj.imgIcone:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event4 = obj.imgIcone:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event5 = obj.imgIcone:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'imgIcone', node = sheet, form = self, event='onClick', contexto = 'rolaMagia'}, nil, false);
        end, obj);

    obj._e_event6 = obj.imgIcone:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'imgIcone', node = sheet, form = self, event='onMenu', contexto = 'rolaMagia'}, nil, true);
        end, obj);

    obj._e_event7 = obj.labelFieldNome:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event8 = obj.labelFieldNome:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event9 = obj.chbPreparado:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event10 = obj.chbPreparado:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event11 = obj.chbPreparado:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'chbPreparado', node = sheet, form = self, event='onClick', contexto = ''}, nil, false);
        end, obj);

    obj._e_event12 = obj.chbPreparado:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'chbPreparado', node = sheet, form = self, event='onMenu', contexto = ''}, nil, true);
        end, obj);

    obj._e_event13 = obj.labelFieldComponentes:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event14 = obj.labelFieldComponentes:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event15 = obj.labelFieldEscolaDeMagia:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event16 = obj.labelFieldEscolaDeMagia:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event17 = obj.labelFieldAlvoAreaDeEfeito:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event18 = obj.labelFieldAlvoAreaDeEfeito:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event19 = obj.labelFieldTempoDeConjuracao:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event20 = obj.labelFieldTempoDeConjuracao:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event21 = obj.chbFavorito:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event22 = obj.chbFavorito:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event23 = obj.chbFavorito:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'chbFavorito', node = sheet, form = self, event='onClick', contexto = ''}, nil, false);
        end, obj);

    obj._e_event24 = obj.chbFavorito:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'chbFavorito', node = sheet, form = self, event='onMenu', contexto = ''}, nil, true);
        end, obj);

    obj._e_event25 = obj.imgEditar:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event26 = obj.imgEditar:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event27 = obj.imgEditar:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'imgEditar', node = sheet, form = self, event='onClick', contexto = 'editaMagia'}, nil, false);
        end, obj);

    obj._e_event28 = obj.imgEditar:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'imgEditar', node = sheet, form = self, event='onMenu', contexto = 'editaMagia' }, nil, true);
        end, obj);

    obj._e_event29 = obj.imgDeletar:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event30 = obj.imgDeletar:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event31 = obj.imgDeletar:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'imgDeletar', node = sheet, form = self, event='onClick', contexto = 'apagaMagia'}, nil, false);
        end, obj);

    obj._e_event32 = obj.imgDeletar:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'imgDeletar', node = sheet, form = self, event='onMenu', contexto = 'apagaMagia' }, nil, true);
        end, obj);

    obj._e_event33 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.nivel = tonumber(sheet.nivel);
            				if not sheet.nivel then sheet.nivelTexto = '';
            				elseif sheet.nivel == 0 then sheet.nivelTexto = 'Truque';
            				else sheet.nivelTexto = sheet.nivel .. 'º nível';
            				end;
        end, obj);

    obj._e_event34 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local label = '';
            				if sheet.componentesV then label = label .. 'V'; end;
            				if label ~= '' and sheet.componentesS then label = label .. ' '; end;
            				if sheet.componentesS then label = label .. 'S'; end;
            				if label ~= '' and sheet.componentesM then label = label .. ' '; end;
            				if sheet.componentesM then label = label .. 'M'; end;
            				if label ~= '' and sheet.componentesConcentracao then label = label .. ' '; end;
            				if sheet.componentesConcentracao then label = label .. 'C'; end;
            				if label ~= '' and sheet.componentesRitual then label = label .. ' '; end;
            				if sheet.componentesRitual then label = label .. 'R'; end;
            				sheet.componentes = label;
        end, obj);

    obj._e_event35 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.chbPreparado:setVisible(sheet.preparadoTipo == 'Preparada' or sheet.preparadoTipo == 'Sempre Preparada');
            				self.chbPreparado:setEnabled(sheet.preparadoTipo == 'Preparada');
            				if sheet.preparadoTipo == 'Sempre Preparada' then sheet.preparadoValor = true; end;
        end, obj);

    obj._e_event36 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local label = '';
            				if sheet.tempoConjuracaoValor then label = sheet.tempoConjuracaoValor; end;
            				if sheet.tempoConjuracaoValor and sheet.tempoConjuracaoUnidade then label = label .. ' '; end;
            				if sheet.tempoConjuracaoUnidade then label = label .. sheet.tempoConjuracaoUnidade; end;
            				sheet.tempoConjuracao = label;
        end, obj);

    obj._e_event37 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local label = '';
            				if sheet.alvoTipo == 'Pessoal' then
            					label = "Pessoal";
            				else
            					if sheet.alvoValor then label = sheet.alvoValor; end;
            					if label ~= '' and sheet.alvoUnidade then label = label .. ' '; end;
            					if sheet.alvoUnidade then label = label .. sheet.alvoUnidade; end;
            					if label ~= '' and sheet.alvoTipo then label = label .. ' '; end;
            					if sheet.alvoTipo then label = label .. sheet.alvoTipo; end;
            				end;
            				sheet.alvoAreaDeEfeito = label;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
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

        if self.chbFavorito ~= nil then self.chbFavorito:destroy(); self.chbFavorito = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.fpPreparado ~= nil then self.fpPreparado:destroy(); self.fpPreparado = nil; end;
        if self.fpAlvoAreaDeEfeito ~= nil then self.fpAlvoAreaDeEfeito:destroy(); self.fpAlvoAreaDeEfeito = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.chbPreparado ~= nil then self.chbPreparado:destroy(); self.chbPreparado = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.fpButoes ~= nil then self.fpButoes:destroy(); self.fpButoes = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.fpNome ~= nil then self.fpNome:destroy(); self.fpNome = nil; end;
        if self.fpDeletar ~= nil then self.fpDeletar:destroy(); self.fpDeletar = nil; end;
        if self.imgEditar ~= nil then self.imgEditar:destroy(); self.imgEditar = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.imgIcone ~= nil then self.imgIcone:destroy(); self.imgIcone = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.labelFieldNome ~= nil then self.labelFieldNome:destroy(); self.labelFieldNome = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.fpRect ~= nil then self.fpRect:destroy(); self.fpRect = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.fpTempoDeConjuracao ~= nil then self.fpTempoDeConjuracao:destroy(); self.fpTempoDeConjuracao = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.layItem ~= nil then self.layItem:destroy(); self.layItem = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.fpIcone ~= nil then self.fpIcone:destroy(); self.fpIcone = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.rect ~= nil then self.rect:destroy(); self.rect = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.fpEscolaDeMagia ~= nil then self.fpEscolaDeMagia:destroy(); self.fpEscolaDeMagia = nil; end;
        if self.imgDeletar ~= nil then self.imgDeletar:destroy(); self.imgDeletar = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.labelFieldEscolaDeMagia ~= nil then self.labelFieldEscolaDeMagia:destroy(); self.labelFieldEscolaDeMagia = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.labelFieldAlvoAreaDeEfeito ~= nil then self.labelFieldAlvoAreaDeEfeito:destroy(); self.labelFieldAlvoAreaDeEfeito = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.outLay ~= nil then self.outLay:destroy(); self.outLay = nil; end;
        if self.labelFieldTempoDeConjuracao ~= nil then self.labelFieldTempoDeConjuracao:destroy(); self.labelFieldTempoDeConjuracao = nil; end;
        if self.fpEditar ~= nil then self.fpEditar:destroy(); self.fpEditar = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.labelFieldComponentes ~= nil then self.labelFieldComponentes:destroy(); self.labelFieldComponentes = nil; end;
        if self.fpComponentes ~= nil then self.fpComponentes:destroy(); self.fpComponentes = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.fpFavorito ~= nil then self.fpFavorito:destroy(); self.fpFavorito = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemDeMagia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemDeMagia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemDeMagia = {
    newEditor = newfrmItemDeMagia, 
    new = newfrmItemDeMagia, 
    name = "frmItemDeMagia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmItemDeMagia = _frmItemDeMagia;
Firecast.registrarForm(_frmItemDeMagia);

return _frmItemDeMagia;
