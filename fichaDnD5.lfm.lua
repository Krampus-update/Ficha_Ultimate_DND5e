require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDnD5()
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
    obj:setDataType("br.com.rrpg.DnD5_S3");
    obj:setFormType("sheetTemplate");
    obj:setTitle("D&D 5e");
    obj:setName("frmDnD5");
    obj:setTheme("dark");


		local function mudaNick(nome)
			if not nome then return; end;
			if not sheet then return; end;

			if not common.isMainChar(sheet) then return; end;
			if not common.isMyChar(sheet) then return; end;

			local mesa = common.getMesa(sheet);
			if not mesa then return; end;

			if not mesa.meuJogador.isJogador then return; end;
			if not (mesa.meuJogador.nick ~= nome) then return; end;

			mesa.chat:enviarMensagem("/nick " .. nome);
		end;
	


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("nome");
    obj.dataLink1:setName("dataLink1");

    obj.pgcPrincipal = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.tab1);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);

 require("common.lua"); 


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.fraFrenteLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayout:setParent(obj.scrollBox1);
    obj.fraFrenteLayout:setAlign("top");
    obj.fraFrenteLayout:setHeight(500);
    obj.fraFrenteLayout:setMargins({left=10, right=10, top=10});
    obj.fraFrenteLayout:setAutoHeight(true);
    obj.fraFrenteLayout:setHorzAlign("center");
    obj.fraFrenteLayout:setLineSpacing(2);
    obj.fraFrenteLayout:setName("fraFrenteLayout");
    obj.fraFrenteLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraFrenteLayout:setMinScaledWidth(300);
    obj.fraFrenteLayout:setVertAlign("leading");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.fraFrenteLayout);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMinScaledWidth(290);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout1:setVertAlign("leading");

    obj.flwNome1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwNome1:setParent(obj.flowLayout1);
    obj.flwNome1:setName("flwNome1");
    obj.flwNome1:setMinWidth(320);
    obj.flwNome1:setMaxWidth(1600);
    obj.flwNome1:setFrameStyle("frames/banner/dragon.xml");
    obj.flwNome1:setHeight(175);
    obj.flwNome1:setVertAlign("center");
    obj.flwNome1:setAvoidScale(true);
    obj.flwNome1:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layNomeHolderFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNomeHolderFrente:setParent(obj.flwNome1);
    obj.layNomeHolderFrente:setAlign("client");
    obj.layNomeHolderFrente:setName("layNomeHolderFrente");

    obj.edtNome1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNome1:setParent(obj.layNomeHolderFrente);
    obj.edtNome1:setName("edtNome1");
    obj.edtNome1:setField("nome");
    obj.edtNome1:setFontSize(17);
    obj.edtNome1:setAlign("client");
    obj.edtNome1:setFontColor("white");
    obj.edtNome1:setVertTextAlign("center");
    obj.edtNome1:setTransparent(true);

    obj.labNome1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labNome1:setParent(obj.layNomeHolderFrente);
    obj.labNome1:setMargins({left=3});
    obj.labNome1:setName("labNome1");
    obj.labNome1:setAlign("bottom");
    obj.labNome1:setText("NOME DO PERSONAGEM");
    obj.labNome1:setAutoSize(true);
    obj.labNome1:setFontSize(12);
    obj.labNome1:setFontColor("#D0D0D0");

    obj.fraUpperGridFrente = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridFrente:setParent(obj.flowLayout1);
    obj.fraUpperGridFrente:setMinWidth(320);
    obj.fraUpperGridFrente:setMaxWidth(1600);
    obj.fraUpperGridFrente:setName("fraUpperGridFrente");
    obj.fraUpperGridFrente:setAvoidScale(true);
    obj.fraUpperGridFrente:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridFrente:setAutoHeight(true);
    obj.fraUpperGridFrente:setVertAlign("trailing");
    obj.fraUpperGridFrente:setMaxControlsPerLine(3);
    obj.fraUpperGridFrente:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo1:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo1:setHeight(50);
    obj.UpperGridCampo1:setMinScaledWidth(100);
    obj.UpperGridCampo1:setMinWidth(100);
    obj.UpperGridCampo1:setMaxWidth(233);
    obj.UpperGridCampo1:setMaxScaledWidth(233);
    obj.UpperGridCampo1:setAvoidScale(true);
    obj.UpperGridCampo1:setName("UpperGridCampo1");
    obj.UpperGridCampo1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo1:setVertAlign("leading");

    obj.edtUpperGridCampo1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.edtUpperGridCampo1:setName("edtUpperGridCampo1");
    obj.edtUpperGridCampo1:setAlign("top");
    obj.edtUpperGridCampo1:setField("classeENivel");
    obj.edtUpperGridCampo1:setFontSize(13);
    obj.edtUpperGridCampo1:setHeight(30);
    obj.edtUpperGridCampo1:setTransparent(true);
    obj.edtUpperGridCampo1:setVertTextAlign("trailing");
    obj.edtUpperGridCampo1:setWidth(195);
    obj.edtUpperGridCampo1:setFontColor("white");

    obj.linUpperGridCampo1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.linUpperGridCampo1:setName("linUpperGridCampo1");
    obj.linUpperGridCampo1:setAlign("top");
    obj.linUpperGridCampo1:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo1:setStrokeSize(1);

    obj.labUpperGridCampo1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.labUpperGridCampo1:setName("labUpperGridCampo1");
    obj.labUpperGridCampo1:setAlign("top");
    obj.labUpperGridCampo1:setText("CLASSE E NIVEL");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo2:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo2:setHeight(50);
    obj.UpperGridCampo2:setMinScaledWidth(100);
    obj.UpperGridCampo2:setMinWidth(100);
    obj.UpperGridCampo2:setMaxWidth(233);
    obj.UpperGridCampo2:setMaxScaledWidth(233);
    obj.UpperGridCampo2:setAvoidScale(true);
    obj.UpperGridCampo2:setName("UpperGridCampo2");
    obj.UpperGridCampo2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo2:setVertAlign("leading");

    obj.edtUpperGridCampo2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.edtUpperGridCampo2:setName("edtUpperGridCampo2");
    obj.edtUpperGridCampo2:setAlign("top");
    obj.edtUpperGridCampo2:setField("antecedentes");
    obj.edtUpperGridCampo2:setFontSize(13);
    obj.edtUpperGridCampo2:setHeight(30);
    obj.edtUpperGridCampo2:setTransparent(true);
    obj.edtUpperGridCampo2:setVertTextAlign("trailing");
    obj.edtUpperGridCampo2:setWidth(195);
    obj.edtUpperGridCampo2:setFontColor("white");

    obj.linUpperGridCampo2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.linUpperGridCampo2:setName("linUpperGridCampo2");
    obj.linUpperGridCampo2:setAlign("top");
    obj.linUpperGridCampo2:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo2:setStrokeSize(1);

    obj.labUpperGridCampo2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.labUpperGridCampo2:setName("labUpperGridCampo2");
    obj.labUpperGridCampo2:setAlign("top");
    obj.labUpperGridCampo2:setText("ANTECEDENTES");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo3:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo3:setHeight(50);
    obj.UpperGridCampo3:setMinScaledWidth(100);
    obj.UpperGridCampo3:setMinWidth(100);
    obj.UpperGridCampo3:setMaxWidth(233);
    obj.UpperGridCampo3:setMaxScaledWidth(233);
    obj.UpperGridCampo3:setAvoidScale(true);
    obj.UpperGridCampo3:setName("UpperGridCampo3");
    obj.UpperGridCampo3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo3:setVertAlign("leading");

    obj.edtUpperGridCampo3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.edtUpperGridCampo3:setName("edtUpperGridCampo3");
    obj.edtUpperGridCampo3:setAlign("top");
    obj.edtUpperGridCampo3:setField("nomeDoJogador");
    obj.edtUpperGridCampo3:setFontSize(13);
    obj.edtUpperGridCampo3:setHeight(30);
    obj.edtUpperGridCampo3:setTransparent(true);
    obj.edtUpperGridCampo3:setVertTextAlign("trailing");
    obj.edtUpperGridCampo3:setWidth(195);
    obj.edtUpperGridCampo3:setFontColor("white");

    obj.linUpperGridCampo3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.linUpperGridCampo3:setName("linUpperGridCampo3");
    obj.linUpperGridCampo3:setAlign("top");
    obj.linUpperGridCampo3:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo3:setStrokeSize(1);

    obj.labUpperGridCampo3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.labUpperGridCampo3:setName("labUpperGridCampo3");
    obj.labUpperGridCampo3:setAlign("top");
    obj.labUpperGridCampo3:setText("JOGADOR");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo4:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo4:setHeight(50);
    obj.UpperGridCampo4:setMinScaledWidth(100);
    obj.UpperGridCampo4:setMinWidth(100);
    obj.UpperGridCampo4:setMaxWidth(233);
    obj.UpperGridCampo4:setMaxScaledWidth(233);
    obj.UpperGridCampo4:setAvoidScale(true);
    obj.UpperGridCampo4:setName("UpperGridCampo4");
    obj.UpperGridCampo4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo4:setVertAlign("leading");

    obj.edtUpperGridCampo4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.edtUpperGridCampo4:setName("edtUpperGridCampo4");
    obj.edtUpperGridCampo4:setAlign("top");
    obj.edtUpperGridCampo4:setField("raca");
    obj.edtUpperGridCampo4:setFontSize(13);
    obj.edtUpperGridCampo4:setHeight(30);
    obj.edtUpperGridCampo4:setTransparent(true);
    obj.edtUpperGridCampo4:setVertTextAlign("trailing");
    obj.edtUpperGridCampo4:setWidth(195);
    obj.edtUpperGridCampo4:setFontColor("white");

    obj.linUpperGridCampo4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.linUpperGridCampo4:setName("linUpperGridCampo4");
    obj.linUpperGridCampo4:setAlign("top");
    obj.linUpperGridCampo4:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo4:setStrokeSize(1);

    obj.labUpperGridCampo4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.labUpperGridCampo4:setName("labUpperGridCampo4");
    obj.labUpperGridCampo4:setAlign("top");
    obj.labUpperGridCampo4:setText("RAÇA");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo5:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo5:setHeight(50);
    obj.UpperGridCampo5:setMinScaledWidth(100);
    obj.UpperGridCampo5:setMinWidth(100);
    obj.UpperGridCampo5:setMaxWidth(233);
    obj.UpperGridCampo5:setMaxScaledWidth(233);
    obj.UpperGridCampo5:setAvoidScale(true);
    obj.UpperGridCampo5:setName("UpperGridCampo5");
    obj.UpperGridCampo5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo5:setVertAlign("leading");

    obj.edtUpperGridCampo5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.edtUpperGridCampo5:setName("edtUpperGridCampo5");
    obj.edtUpperGridCampo5:setAlign("top");
    obj.edtUpperGridCampo5:setField("tendencia");
    obj.edtUpperGridCampo5:setFontSize(13);
    obj.edtUpperGridCampo5:setHeight(30);
    obj.edtUpperGridCampo5:setTransparent(true);
    obj.edtUpperGridCampo5:setVertTextAlign("trailing");
    obj.edtUpperGridCampo5:setWidth(195);
    obj.edtUpperGridCampo5:setFontColor("white");

    obj.linUpperGridCampo5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.linUpperGridCampo5:setName("linUpperGridCampo5");
    obj.linUpperGridCampo5:setAlign("top");
    obj.linUpperGridCampo5:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo5:setStrokeSize(1);

    obj.labUpperGridCampo5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.labUpperGridCampo5:setName("labUpperGridCampo5");
    obj.labUpperGridCampo5:setAlign("top");
    obj.labUpperGridCampo5:setText("TENDÊNCIA");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo6:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo6:setHeight(50);
    obj.UpperGridCampo6:setMinScaledWidth(100);
    obj.UpperGridCampo6:setMinWidth(100);
    obj.UpperGridCampo6:setMaxWidth(233);
    obj.UpperGridCampo6:setMaxScaledWidth(233);
    obj.UpperGridCampo6:setAvoidScale(true);
    obj.UpperGridCampo6:setName("UpperGridCampo6");
    obj.UpperGridCampo6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo6:setVertAlign("leading");

    obj.edtUpperGridCampo6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.edtUpperGridCampo6:setName("edtUpperGridCampo6");
    obj.edtUpperGridCampo6:setAlign("top");
    obj.edtUpperGridCampo6:setField("experiencia.valor");
    obj.edtUpperGridCampo6:setFontSize(13);
    obj.edtUpperGridCampo6:setHeight(30);
    obj.edtUpperGridCampo6:setTransparent(true);
    obj.edtUpperGridCampo6:setVertTextAlign("trailing");
    obj.edtUpperGridCampo6:setWidth(195);
    obj.edtUpperGridCampo6:setFontColor("white");

    obj.linUpperGridCampo6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.linUpperGridCampo6:setName("linUpperGridCampo6");
    obj.linUpperGridCampo6:setAlign("top");
    obj.linUpperGridCampo6:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo6:setStrokeSize(1);

    obj.labUpperGridCampo6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.labUpperGridCampo6:setName("labUpperGridCampo6");
    obj.labUpperGridCampo6:setAlign("top");
    obj.labUpperGridCampo6:setText("EXPERIÊNCIA");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraFrenteLayout);
    obj.flowLayout2:setHorzAlign("justify");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout2:setMinScaledWidth(300);
    obj.flowLayout2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout2);
    obj.flowPart1:setMinWidth(280);
    obj.flowPart1:setMaxWidth(800);
    obj.flowPart1:setHeight(64);
    obj.flowPart1:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("inspiracao");
    obj.edit1:setWidth(65);
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(15);
    obj.edit1:setFontColor("white");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("client");
    obj.label1:setText("INSPIRAÇÃO");
    obj.label1:setMargins({left=10});
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontSize(12);
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(280);
    obj.flowPart2:setMaxWidth(800);
    obj.flowPart2:setHeight(64);
    obj.flowPart2:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("left");
    obj.edit2:setField("bonusProficiencia");
    obj.edit2:setWidth(70);
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(15);
    obj.edit2:setFontColor("white");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("client");
    obj.label2:setText("BONUS DE PROFICIÊNCIA");
    obj.label2:setMargins({left=10});
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#D0D0D0");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(280);
    obj.flowPart3:setMaxWidth(800);
    obj.flowPart3:setHeight(64);
    obj.flowPart3:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("left");
    obj.edit3:setField("sabedoriaPassiva");
    obj.edit3:setWidth(70);
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(15);
    obj.edit3:setFontColor("white");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("client");
    obj.label3:setText("SABEDORIA PASSIVA (PERCEPÇÃO)");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(true);
    obj.label3:setMargins({left=10});
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("#D0D0D0");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.fraFrenteLayout);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMinScaledWidth(290);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout3:setVertAlign("leading");

    obj.fraLayAtributos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayAtributos:setParent(obj.flowLayout3);
    obj.fraLayAtributos:setName("fraLayAtributos");
    obj.fraLayAtributos:setVertAlign("leading");
    obj.fraLayAtributos:setAutoHeight(true);
    obj.fraLayAtributos:setMinScaledWidth(290);
    obj.fraLayAtributos:setMaxControlsPerLine(3);
    obj.fraLayAtributos:setHorzAlign("center");
    obj.fraLayAtributos:setLineSpacing(10);
    obj.fraLayAtributos:setFrameStyle("frames/panel1/frame.xml");
    obj.fraLayAtributos:setMargins({left=2, top=2, right=16, bottom=4});
    obj.fraLayAtributos:setAvoidScale(true);
    obj.fraLayAtributos:setStepSizes({310, 420, 640, 760, 1150});

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.fraLayAtributos);
    obj.dataLink2:setField("atributos.forca");
    obj.dataLink2:setName("dataLink2");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.fraLayAtributos);
    obj.flowPart4:setHeight(140);
    obj.flowPart4:setMinWidth(320);
    obj.flowPart4:setMaxWidth(420);
    obj.flowPart4:setMinScaledWidth(305);
    obj.flowPart4:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart4);
    obj.layout1:setLeft(6);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(116);
    obj.layout1:setHeight(115);
    obj.layout1:setName("layout1");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setAlign("top");
    obj.edit4:setMargins({left=30, right=30});
    obj.edit4:setField("atributos.forca");
    obj.edit4:setHeight(30);
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setMax(99);
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(15);
    obj.edit4:setFontColor("white");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setFrameRegion("modificador");
    obj.label4:setField("atributos.modforcastr");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("center");
    obj.label4:setFontSize(46);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart4);
    obj.layout2:setFrameRegion("titulo");
    obj.layout2:setName("layout2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setAlign("client");
    obj.button1:setText("FORÇA");
    obj.button1:setVertTextAlign("center");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart4);
    obj.flowLayout4:setFrameRegion("RegiaoDePericias");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setLineSpacing(0);
    obj.flowLayout4:setHorzAlign("leading");
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout4:setVertAlign("leading");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout4);
    obj.flowPart5:setMinWidth(206);
    obj.flowPart5:setMaxWidth(250);
    obj.flowPart5:setHeight(17);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

    obj.cbProfforca = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfforca:setParent(obj.flowPart5);
    obj.cbProfforca:setName("cbProfforca");
    obj.cbProfforca:setAlign("left");
    obj.cbProfforca:setField("resistencias.forca");
    obj.cbProfforca:setWidth(20);
    obj.cbProfforca:setHeight(20);
    obj.cbProfforca:setOptimize(false);
    obj.cbProfforca:setImageChecked("images/checkbox2_checked.png");
    obj.cbProfforca:setImageUnchecked("images/checkbox2_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flowPart5);
    obj.dataLink3:setField("macroExpertise.forca");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowPart5);
    obj.dataLink4:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink4:setName("dataLink4");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart5);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(26);
    obj.layout3:setMargins({left=2});
    obj.layout3:setName("layout3");

    obj.labProfforca = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfforca:setParent(obj.layout3);
    obj.labProfforca:setName("labProfforca");
    obj.labProfforca:setField("resistencias.bonusforcastr");
    obj.labProfforca:setAlign("client");
    obj.labProfforca:setHorzTextAlign("center");
    obj.labProfforca:setVertTextAlign("trailing");
    obj.labProfforca:setTextTrimming("none");
    obj.labProfforca:setFontColor("white");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout3);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setName("horzLine1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowPart5);
    obj.button2:setAlign("left");
    obj.button2:setText("Resistência");
    obj.button2:setWidth(122);
    obj.button2:setMargins({left=2});
    obj.button2:setName("button2");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowLayout4);
    obj.dataLink5:setFields({'atributos.modforca', 'bonusProficiencia', 'resistencias.forca', 'propriedades.prescience', 'propriedades.saveBonus'});
    obj.dataLink5:setName("dataLink5");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout4);
    obj.flowPart6:setMinWidth(206);
    obj.flowPart6:setMaxWidth(250);
    obj.flowPart6:setHeight(17);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

    obj.cbProfatletismo = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfatletismo:setParent(obj.flowPart6);
    obj.cbProfatletismo:setName("cbProfatletismo");
    obj.cbProfatletismo:setAlign("left");
    obj.cbProfatletismo:setField("pericias.atletismo");
    obj.cbProfatletismo:setWidth(20);
    obj.cbProfatletismo:setHeight(20);
    obj.cbProfatletismo:setOptimize(false);
    obj.cbProfatletismo:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfatletismo:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowPart6);
    obj.dataLink6:setField("macroExpertise.atletismo");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowPart6);
    obj.dataLink7:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink7:setName("dataLink7");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart6);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(26);
    obj.layout4:setMargins({left=2});
    obj.layout4:setName("layout4");

    obj.labProfatletismo = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfatletismo:setParent(obj.layout4);
    obj.labProfatletismo:setName("labProfatletismo");
    obj.labProfatletismo:setField("pericias.bonusatletismostr");
    obj.labProfatletismo:setAlign("client");
    obj.labProfatletismo:setHorzTextAlign("center");
    obj.labProfatletismo:setVertTextAlign("trailing");
    obj.labProfatletismo:setTextTrimming("none");
    obj.labProfatletismo:setFontColor("white");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout4);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setName("horzLine2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowPart6);
    obj.button3:setAlign("left");
    obj.button3:setText("Atletismo");
    obj.button3:setWidth(122);
    obj.button3:setMargins({left=2});
    obj.button3:setName("button3");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout4);
    obj.dataLink8:setFields({'atributos.modforca', 'bonusProficiencia', 'pericias.atletismo', 'macroExpertise.atletismo', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.fraLayAtributos);
    obj.dataLink9:setField("atributos.destreza");
    obj.dataLink9:setName("dataLink9");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.fraLayAtributos);
    obj.flowPart7:setHeight(140);
    obj.flowPart7:setMinWidth(320);
    obj.flowPart7:setMaxWidth(420);
    obj.flowPart7:setMinScaledWidth(305);
    obj.flowPart7:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart7);
    obj.layout5:setLeft(6);
    obj.layout5:setTop(12);
    obj.layout5:setWidth(116);
    obj.layout5:setHeight(115);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setAlign("top");
    obj.edit5:setMargins({left=30, right=30});
    obj.edit5:setField("atributos.destreza");
    obj.edit5:setHeight(30);
    obj.edit5:setType("number");
    obj.edit5:setMin(0);
    obj.edit5:setMax(99);
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(15);
    obj.edit5:setFontColor("white");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart7);
    obj.label5:setFrameRegion("modificador");
    obj.label5:setField("atributos.moddestrezastr");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setVertTextAlign("center");
    obj.label5:setFontSize(46);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart7);
    obj.layout6:setFrameRegion("titulo");
    obj.layout6:setName("layout6");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout6);
    obj.button4:setAlign("client");
    obj.button4:setText("DESTREZA");
    obj.button4:setVertTextAlign("center");
    obj.button4:setHorzTextAlign("center");
    obj.button4:setName("button4");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowPart7);
    obj.flowLayout5:setFrameRegion("RegiaoDePericias");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setLineSpacing(0);
    obj.flowLayout5:setHorzAlign("leading");
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout5:setVertAlign("leading");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout5);
    obj.flowPart8:setMinWidth(206);
    obj.flowPart8:setMaxWidth(250);
    obj.flowPart8:setHeight(17);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

    obj.cbProfdestreza = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfdestreza:setParent(obj.flowPart8);
    obj.cbProfdestreza:setName("cbProfdestreza");
    obj.cbProfdestreza:setAlign("left");
    obj.cbProfdestreza:setField("resistencias.destreza");
    obj.cbProfdestreza:setWidth(20);
    obj.cbProfdestreza:setHeight(20);
    obj.cbProfdestreza:setOptimize(false);
    obj.cbProfdestreza:setImageChecked("images/checkbox2_checked.png");
    obj.cbProfdestreza:setImageUnchecked("images/checkbox2_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowPart8);
    obj.dataLink10:setField("macroExpertise.destreza");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.flowPart8);
    obj.dataLink11:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink11:setName("dataLink11");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart8);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(26);
    obj.layout7:setMargins({left=2});
    obj.layout7:setName("layout7");

    obj.labProfdestreza = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfdestreza:setParent(obj.layout7);
    obj.labProfdestreza:setName("labProfdestreza");
    obj.labProfdestreza:setField("resistencias.bonusdestrezastr");
    obj.labProfdestreza:setAlign("client");
    obj.labProfdestreza:setHorzTextAlign("center");
    obj.labProfdestreza:setVertTextAlign("trailing");
    obj.labProfdestreza:setTextTrimming("none");
    obj.labProfdestreza:setFontColor("white");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout7);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setName("horzLine3");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowPart8);
    obj.button5:setAlign("left");
    obj.button5:setText("Resistência");
    obj.button5:setWidth(122);
    obj.button5:setMargins({left=2});
    obj.button5:setName("button5");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.flowLayout5);
    obj.dataLink12:setFields({'atributos.moddestreza', 'bonusProficiencia', 'resistencias.destreza', 'propriedades.prescience', 'propriedades.saveBonus'});
    obj.dataLink12:setName("dataLink12");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout5);
    obj.flowPart9:setMinWidth(206);
    obj.flowPart9:setMaxWidth(250);
    obj.flowPart9:setHeight(17);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

    obj.cbProfacrobacia = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfacrobacia:setParent(obj.flowPart9);
    obj.cbProfacrobacia:setName("cbProfacrobacia");
    obj.cbProfacrobacia:setAlign("left");
    obj.cbProfacrobacia:setField("pericias.acrobacia");
    obj.cbProfacrobacia:setWidth(20);
    obj.cbProfacrobacia:setHeight(20);
    obj.cbProfacrobacia:setOptimize(false);
    obj.cbProfacrobacia:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfacrobacia:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.flowPart9);
    obj.dataLink13:setField("macroExpertise.acrobacia");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.flowPart9);
    obj.dataLink14:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink14:setName("dataLink14");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart9);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(26);
    obj.layout8:setMargins({left=2});
    obj.layout8:setName("layout8");

    obj.labProfacrobacia = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfacrobacia:setParent(obj.layout8);
    obj.labProfacrobacia:setName("labProfacrobacia");
    obj.labProfacrobacia:setField("pericias.bonusacrobaciastr");
    obj.labProfacrobacia:setAlign("client");
    obj.labProfacrobacia:setHorzTextAlign("center");
    obj.labProfacrobacia:setVertTextAlign("trailing");
    obj.labProfacrobacia:setTextTrimming("none");
    obj.labProfacrobacia:setFontColor("white");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout8);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setAlign("bottom");
    obj.horzLine4:setName("horzLine4");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowPart9);
    obj.button6:setAlign("left");
    obj.button6:setText("Acrobacia");
    obj.button6:setWidth(122);
    obj.button6:setMargins({left=2});
    obj.button6:setName("button6");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.flowLayout5);
    obj.dataLink15:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.acrobacia', 'macroExpertise.acrobacia', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink15:setName("dataLink15");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout5);
    obj.flowPart10:setMinWidth(206);
    obj.flowPart10:setMaxWidth(250);
    obj.flowPart10:setHeight(17);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.cbProffurtividade = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProffurtividade:setParent(obj.flowPart10);
    obj.cbProffurtividade:setName("cbProffurtividade");
    obj.cbProffurtividade:setAlign("left");
    obj.cbProffurtividade:setField("pericias.furtividade");
    obj.cbProffurtividade:setWidth(20);
    obj.cbProffurtividade:setHeight(20);
    obj.cbProffurtividade:setOptimize(false);
    obj.cbProffurtividade:setImageChecked("images/checkbox1_checked.png");
    obj.cbProffurtividade:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.flowPart10);
    obj.dataLink16:setField("macroExpertise.furtividade");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.flowPart10);
    obj.dataLink17:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink17:setName("dataLink17");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart10);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(26);
    obj.layout9:setMargins({left=2});
    obj.layout9:setName("layout9");

    obj.labProffurtividade = GUI.fromHandle(_obj_newObject("label"));
    obj.labProffurtividade:setParent(obj.layout9);
    obj.labProffurtividade:setName("labProffurtividade");
    obj.labProffurtividade:setField("pericias.bonusfurtividadestr");
    obj.labProffurtividade:setAlign("client");
    obj.labProffurtividade:setHorzTextAlign("center");
    obj.labProffurtividade:setVertTextAlign("trailing");
    obj.labProffurtividade:setTextTrimming("none");
    obj.labProffurtividade:setFontColor("white");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout9);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setAlign("bottom");
    obj.horzLine5:setName("horzLine5");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowPart10);
    obj.button7:setAlign("left");
    obj.button7:setText("Furtividade");
    obj.button7:setWidth(122);
    obj.button7:setMargins({left=2});
    obj.button7:setName("button7");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.flowLayout5);
    obj.dataLink18:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.furtividade', 'macroExpertise.furtividade', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink18:setName("dataLink18");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout5);
    obj.flowPart11:setMinWidth(206);
    obj.flowPart11:setMaxWidth(250);
    obj.flowPart11:setHeight(17);
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.cbProfprestidigitacao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfprestidigitacao:setParent(obj.flowPart11);
    obj.cbProfprestidigitacao:setName("cbProfprestidigitacao");
    obj.cbProfprestidigitacao:setAlign("left");
    obj.cbProfprestidigitacao:setField("pericias.prestidigitacao");
    obj.cbProfprestidigitacao:setWidth(20);
    obj.cbProfprestidigitacao:setHeight(20);
    obj.cbProfprestidigitacao:setOptimize(false);
    obj.cbProfprestidigitacao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfprestidigitacao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.flowPart11);
    obj.dataLink19:setField("macroExpertise.prestidigitacao");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.flowPart11);
    obj.dataLink20:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink20:setName("dataLink20");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart11);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(26);
    obj.layout10:setMargins({left=2});
    obj.layout10:setName("layout10");

    obj.labProfprestidigitacao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfprestidigitacao:setParent(obj.layout10);
    obj.labProfprestidigitacao:setName("labProfprestidigitacao");
    obj.labProfprestidigitacao:setField("pericias.bonusprestidigitacaostr");
    obj.labProfprestidigitacao:setAlign("client");
    obj.labProfprestidigitacao:setHorzTextAlign("center");
    obj.labProfprestidigitacao:setVertTextAlign("trailing");
    obj.labProfprestidigitacao:setTextTrimming("none");
    obj.labProfprestidigitacao:setFontColor("white");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout10);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setAlign("bottom");
    obj.horzLine6:setName("horzLine6");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowPart11);
    obj.button8:setAlign("left");
    obj.button8:setText("Prestidigitação");
    obj.button8:setWidth(122);
    obj.button8:setMargins({left=2});
    obj.button8:setName("button8");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.flowLayout5);
    obj.dataLink21:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.prestidigitacao', 'macroExpertise.prestidigitacao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.fraLayAtributos);
    obj.dataLink22:setField("atributos.constituicao");
    obj.dataLink22:setName("dataLink22");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.fraLayAtributos);
    obj.flowPart12:setHeight(140);
    obj.flowPart12:setMinWidth(320);
    obj.flowPart12:setMaxWidth(420);
    obj.flowPart12:setMinScaledWidth(305);
    obj.flowPart12:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart12);
    obj.layout11:setLeft(6);
    obj.layout11:setTop(12);
    obj.layout11:setWidth(116);
    obj.layout11:setHeight(115);
    obj.layout11:setName("layout11");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout11);
    obj.edit6:setAlign("top");
    obj.edit6:setMargins({left=30, right=30});
    obj.edit6:setField("atributos.constituicao");
    obj.edit6:setHeight(30);
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setMax(99);
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(15);
    obj.edit6:setFontColor("white");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart12);
    obj.label6:setFrameRegion("modificador");
    obj.label6:setField("atributos.modconstituicaostr");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setVertTextAlign("center");
    obj.label6:setFontSize(46);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart12);
    obj.layout12:setFrameRegion("titulo");
    obj.layout12:setName("layout12");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout12);
    obj.button9:setAlign("client");
    obj.button9:setText("CONSTITUIÇÃO");
    obj.button9:setVertTextAlign("center");
    obj.button9:setHorzTextAlign("center");
    obj.button9:setName("button9");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowPart12);
    obj.flowLayout6:setFrameRegion("RegiaoDePericias");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setLineSpacing(0);
    obj.flowLayout6:setHorzAlign("leading");
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout6);
    obj.flowPart13:setMinWidth(206);
    obj.flowPart13:setMaxWidth(250);
    obj.flowPart13:setHeight(17);
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart13:setVertAlign("leading");

    obj.cbProfconstituicao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfconstituicao:setParent(obj.flowPart13);
    obj.cbProfconstituicao:setName("cbProfconstituicao");
    obj.cbProfconstituicao:setAlign("left");
    obj.cbProfconstituicao:setField("resistencias.constituicao");
    obj.cbProfconstituicao:setWidth(20);
    obj.cbProfconstituicao:setHeight(20);
    obj.cbProfconstituicao:setOptimize(false);
    obj.cbProfconstituicao:setImageChecked("images/checkbox2_checked.png");
    obj.cbProfconstituicao:setImageUnchecked("images/checkbox2_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.flowPart13);
    obj.dataLink23:setField("macroExpertise.constituicao");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.flowPart13);
    obj.dataLink24:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink24:setName("dataLink24");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart13);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(26);
    obj.layout13:setMargins({left=2});
    obj.layout13:setName("layout13");

    obj.labProfconstituicao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfconstituicao:setParent(obj.layout13);
    obj.labProfconstituicao:setName("labProfconstituicao");
    obj.labProfconstituicao:setField("resistencias.bonusconstituicaostr");
    obj.labProfconstituicao:setAlign("client");
    obj.labProfconstituicao:setHorzTextAlign("center");
    obj.labProfconstituicao:setVertTextAlign("trailing");
    obj.labProfconstituicao:setTextTrimming("none");
    obj.labProfconstituicao:setFontColor("white");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout13);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setAlign("bottom");
    obj.horzLine7:setName("horzLine7");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowPart13);
    obj.button10:setAlign("left");
    obj.button10:setText("Resistência");
    obj.button10:setWidth(122);
    obj.button10:setMargins({left=2});
    obj.button10:setName("button10");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.flowLayout6);
    obj.dataLink25:setFields({'atributos.modconstituicao', 'bonusProficiencia', 'resistencias.constituicao', 'propriedades.prescience', 'propriedades.saveBonus'});
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.fraLayAtributos);
    obj.dataLink26:setField("atributos.inteligencia");
    obj.dataLink26:setName("dataLink26");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.fraLayAtributos);
    obj.flowPart14:setHeight(140);
    obj.flowPart14:setMinWidth(320);
    obj.flowPart14:setMaxWidth(420);
    obj.flowPart14:setMinScaledWidth(305);
    obj.flowPart14:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart14);
    obj.layout14:setLeft(6);
    obj.layout14:setTop(12);
    obj.layout14:setWidth(116);
    obj.layout14:setHeight(115);
    obj.layout14:setName("layout14");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout14);
    obj.edit7:setAlign("top");
    obj.edit7:setMargins({left=30, right=30});
    obj.edit7:setField("atributos.inteligencia");
    obj.edit7:setHeight(30);
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setMax(99);
    obj.edit7:setName("edit7");
    obj.edit7:setTransparent(true);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(15);
    obj.edit7:setFontColor("white");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart14);
    obj.label7:setFrameRegion("modificador");
    obj.label7:setField("atributos.modinteligenciastr");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setVertTextAlign("center");
    obj.label7:setFontSize(46);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart14);
    obj.layout15:setFrameRegion("titulo");
    obj.layout15:setName("layout15");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout15);
    obj.button11:setAlign("client");
    obj.button11:setText("INTELIGÊNCIA");
    obj.button11:setVertTextAlign("center");
    obj.button11:setHorzTextAlign("center");
    obj.button11:setName("button11");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowPart14);
    obj.flowLayout7:setFrameRegion("RegiaoDePericias");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setLineSpacing(0);
    obj.flowLayout7:setHorzAlign("leading");
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout7:setVertAlign("leading");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout7);
    obj.flowPart15:setMinWidth(206);
    obj.flowPart15:setMaxWidth(250);
    obj.flowPart15:setHeight(17);
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart15:setVertAlign("leading");

    obj.cbProfinteligencia = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfinteligencia:setParent(obj.flowPart15);
    obj.cbProfinteligencia:setName("cbProfinteligencia");
    obj.cbProfinteligencia:setAlign("left");
    obj.cbProfinteligencia:setField("resistencias.inteligencia");
    obj.cbProfinteligencia:setWidth(20);
    obj.cbProfinteligencia:setHeight(20);
    obj.cbProfinteligencia:setOptimize(false);
    obj.cbProfinteligencia:setImageChecked("images/checkbox2_checked.png");
    obj.cbProfinteligencia:setImageUnchecked("images/checkbox2_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.flowPart15);
    obj.dataLink27:setField("macroExpertise.inteligencia");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.flowPart15);
    obj.dataLink28:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink28:setName("dataLink28");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart15);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(26);
    obj.layout16:setMargins({left=2});
    obj.layout16:setName("layout16");

    obj.labProfinteligencia = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfinteligencia:setParent(obj.layout16);
    obj.labProfinteligencia:setName("labProfinteligencia");
    obj.labProfinteligencia:setField("resistencias.bonusinteligenciastr");
    obj.labProfinteligencia:setAlign("client");
    obj.labProfinteligencia:setHorzTextAlign("center");
    obj.labProfinteligencia:setVertTextAlign("trailing");
    obj.labProfinteligencia:setTextTrimming("none");
    obj.labProfinteligencia:setFontColor("white");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout16);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setAlign("bottom");
    obj.horzLine8:setName("horzLine8");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.flowPart15);
    obj.button12:setAlign("left");
    obj.button12:setText("Resistência");
    obj.button12:setWidth(122);
    obj.button12:setMargins({left=2});
    obj.button12:setName("button12");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.flowLayout7);
    obj.dataLink29:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'resistencias.inteligencia', 'propriedades.prescience', 'propriedades.saveBonus'});
    obj.dataLink29:setName("dataLink29");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout7);
    obj.flowPart16:setMinWidth(206);
    obj.flowPart16:setMaxWidth(250);
    obj.flowPart16:setHeight(17);
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart16:setVertAlign("leading");

    obj.cbProfarcanismo = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfarcanismo:setParent(obj.flowPart16);
    obj.cbProfarcanismo:setName("cbProfarcanismo");
    obj.cbProfarcanismo:setAlign("left");
    obj.cbProfarcanismo:setField("pericias.arcanismo");
    obj.cbProfarcanismo:setWidth(20);
    obj.cbProfarcanismo:setHeight(20);
    obj.cbProfarcanismo:setOptimize(false);
    obj.cbProfarcanismo:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfarcanismo:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.flowPart16);
    obj.dataLink30:setField("macroExpertise.arcanismo");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.flowPart16);
    obj.dataLink31:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink31:setName("dataLink31");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart16);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(26);
    obj.layout17:setMargins({left=2});
    obj.layout17:setName("layout17");

    obj.labProfarcanismo = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfarcanismo:setParent(obj.layout17);
    obj.labProfarcanismo:setName("labProfarcanismo");
    obj.labProfarcanismo:setField("pericias.bonusarcanismostr");
    obj.labProfarcanismo:setAlign("client");
    obj.labProfarcanismo:setHorzTextAlign("center");
    obj.labProfarcanismo:setVertTextAlign("trailing");
    obj.labProfarcanismo:setTextTrimming("none");
    obj.labProfarcanismo:setFontColor("white");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout17);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setAlign("bottom");
    obj.horzLine9:setName("horzLine9");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.flowPart16);
    obj.button13:setAlign("left");
    obj.button13:setText("Arcanismo");
    obj.button13:setWidth(122);
    obj.button13:setMargins({left=2});
    obj.button13:setName("button13");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.flowLayout7);
    obj.dataLink32:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.arcanismo', 'macroExpertise.arcanismo', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink32:setName("dataLink32");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout7);
    obj.flowPart17:setMinWidth(206);
    obj.flowPart17:setMaxWidth(250);
    obj.flowPart17:setHeight(17);
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart17:setVertAlign("leading");

    obj.cbProfhistoria = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfhistoria:setParent(obj.flowPart17);
    obj.cbProfhistoria:setName("cbProfhistoria");
    obj.cbProfhistoria:setAlign("left");
    obj.cbProfhistoria:setField("pericias.historia");
    obj.cbProfhistoria:setWidth(20);
    obj.cbProfhistoria:setHeight(20);
    obj.cbProfhistoria:setOptimize(false);
    obj.cbProfhistoria:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfhistoria:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.flowPart17);
    obj.dataLink33:setField("macroExpertise.historia");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.flowPart17);
    obj.dataLink34:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink34:setName("dataLink34");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart17);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(26);
    obj.layout18:setMargins({left=2});
    obj.layout18:setName("layout18");

    obj.labProfhistoria = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfhistoria:setParent(obj.layout18);
    obj.labProfhistoria:setName("labProfhistoria");
    obj.labProfhistoria:setField("pericias.bonushistoriastr");
    obj.labProfhistoria:setAlign("client");
    obj.labProfhistoria:setHorzTextAlign("center");
    obj.labProfhistoria:setVertTextAlign("trailing");
    obj.labProfhistoria:setTextTrimming("none");
    obj.labProfhistoria:setFontColor("white");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout18);
    obj.horzLine10:setStrokeColor("white");
    obj.horzLine10:setStrokeSize(1);
    obj.horzLine10:setAlign("bottom");
    obj.horzLine10:setName("horzLine10");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.flowPart17);
    obj.button14:setAlign("left");
    obj.button14:setText("História");
    obj.button14:setWidth(122);
    obj.button14:setMargins({left=2});
    obj.button14:setName("button14");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.flowLayout7);
    obj.dataLink35:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.historia', 'macroExpertise.historia', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink35:setName("dataLink35");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout7);
    obj.flowPart18:setMinWidth(206);
    obj.flowPart18:setMaxWidth(250);
    obj.flowPart18:setHeight(17);
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart18:setVertAlign("leading");

    obj.cbProfinvestigacao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfinvestigacao:setParent(obj.flowPart18);
    obj.cbProfinvestigacao:setName("cbProfinvestigacao");
    obj.cbProfinvestigacao:setAlign("left");
    obj.cbProfinvestigacao:setField("pericias.investigacao");
    obj.cbProfinvestigacao:setWidth(20);
    obj.cbProfinvestigacao:setHeight(20);
    obj.cbProfinvestigacao:setOptimize(false);
    obj.cbProfinvestigacao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfinvestigacao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.flowPart18);
    obj.dataLink36:setField("macroExpertise.investigacao");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.flowPart18);
    obj.dataLink37:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink37:setName("dataLink37");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowPart18);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(26);
    obj.layout19:setMargins({left=2});
    obj.layout19:setName("layout19");

    obj.labProfinvestigacao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfinvestigacao:setParent(obj.layout19);
    obj.labProfinvestigacao:setName("labProfinvestigacao");
    obj.labProfinvestigacao:setField("pericias.bonusinvestigacaostr");
    obj.labProfinvestigacao:setAlign("client");
    obj.labProfinvestigacao:setHorzTextAlign("center");
    obj.labProfinvestigacao:setVertTextAlign("trailing");
    obj.labProfinvestigacao:setTextTrimming("none");
    obj.labProfinvestigacao:setFontColor("white");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout19);
    obj.horzLine11:setStrokeColor("white");
    obj.horzLine11:setStrokeSize(1);
    obj.horzLine11:setAlign("bottom");
    obj.horzLine11:setName("horzLine11");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.flowPart18);
    obj.button15:setAlign("left");
    obj.button15:setText("Investigação");
    obj.button15:setWidth(122);
    obj.button15:setMargins({left=2});
    obj.button15:setName("button15");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.flowLayout7);
    obj.dataLink38:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.investigacao', 'macroExpertise.investigacao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink38:setName("dataLink38");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout7);
    obj.flowPart19:setMinWidth(206);
    obj.flowPart19:setMaxWidth(250);
    obj.flowPart19:setHeight(17);
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart19:setVertAlign("leading");

    obj.cbProfnatureza = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfnatureza:setParent(obj.flowPart19);
    obj.cbProfnatureza:setName("cbProfnatureza");
    obj.cbProfnatureza:setAlign("left");
    obj.cbProfnatureza:setField("pericias.natureza");
    obj.cbProfnatureza:setWidth(20);
    obj.cbProfnatureza:setHeight(20);
    obj.cbProfnatureza:setOptimize(false);
    obj.cbProfnatureza:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfnatureza:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.flowPart19);
    obj.dataLink39:setField("macroExpertise.natureza");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.flowPart19);
    obj.dataLink40:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink40:setName("dataLink40");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowPart19);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(26);
    obj.layout20:setMargins({left=2});
    obj.layout20:setName("layout20");

    obj.labProfnatureza = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfnatureza:setParent(obj.layout20);
    obj.labProfnatureza:setName("labProfnatureza");
    obj.labProfnatureza:setField("pericias.bonusnaturezastr");
    obj.labProfnatureza:setAlign("client");
    obj.labProfnatureza:setHorzTextAlign("center");
    obj.labProfnatureza:setVertTextAlign("trailing");
    obj.labProfnatureza:setTextTrimming("none");
    obj.labProfnatureza:setFontColor("white");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout20);
    obj.horzLine12:setStrokeColor("white");
    obj.horzLine12:setStrokeSize(1);
    obj.horzLine12:setAlign("bottom");
    obj.horzLine12:setName("horzLine12");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.flowPart19);
    obj.button16:setAlign("left");
    obj.button16:setText("Natureza");
    obj.button16:setWidth(122);
    obj.button16:setMargins({left=2});
    obj.button16:setName("button16");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.flowLayout7);
    obj.dataLink41:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.natureza', 'macroExpertise.natureza', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink41:setName("dataLink41");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout7);
    obj.flowPart20:setMinWidth(206);
    obj.flowPart20:setMaxWidth(250);
    obj.flowPart20:setHeight(17);
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart20:setVertAlign("leading");

    obj.cbProfreligiao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfreligiao:setParent(obj.flowPart20);
    obj.cbProfreligiao:setName("cbProfreligiao");
    obj.cbProfreligiao:setAlign("left");
    obj.cbProfreligiao:setField("pericias.religiao");
    obj.cbProfreligiao:setWidth(20);
    obj.cbProfreligiao:setHeight(20);
    obj.cbProfreligiao:setOptimize(false);
    obj.cbProfreligiao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfreligiao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.flowPart20);
    obj.dataLink42:setField("macroExpertise.religiao");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.flowPart20);
    obj.dataLink43:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink43:setName("dataLink43");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flowPart20);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(26);
    obj.layout21:setMargins({left=2});
    obj.layout21:setName("layout21");

    obj.labProfreligiao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfreligiao:setParent(obj.layout21);
    obj.labProfreligiao:setName("labProfreligiao");
    obj.labProfreligiao:setField("pericias.bonusreligiaostr");
    obj.labProfreligiao:setAlign("client");
    obj.labProfreligiao:setHorzTextAlign("center");
    obj.labProfreligiao:setVertTextAlign("trailing");
    obj.labProfreligiao:setTextTrimming("none");
    obj.labProfreligiao:setFontColor("white");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout21);
    obj.horzLine13:setStrokeColor("white");
    obj.horzLine13:setStrokeSize(1);
    obj.horzLine13:setAlign("bottom");
    obj.horzLine13:setName("horzLine13");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.flowPart20);
    obj.button17:setAlign("left");
    obj.button17:setText("Religião");
    obj.button17:setWidth(122);
    obj.button17:setMargins({left=2});
    obj.button17:setName("button17");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.flowLayout7);
    obj.dataLink44:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.religiao', 'macroExpertise.religiao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.fraLayAtributos);
    obj.dataLink45:setField("atributos.sabedoria");
    obj.dataLink45:setName("dataLink45");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.fraLayAtributos);
    obj.flowPart21:setHeight(140);
    obj.flowPart21:setMinWidth(320);
    obj.flowPart21:setMaxWidth(420);
    obj.flowPart21:setMinScaledWidth(305);
    obj.flowPart21:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart21:setVertAlign("leading");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowPart21);
    obj.layout22:setLeft(6);
    obj.layout22:setTop(12);
    obj.layout22:setWidth(116);
    obj.layout22:setHeight(115);
    obj.layout22:setName("layout22");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout22);
    obj.edit8:setAlign("top");
    obj.edit8:setMargins({left=30, right=30});
    obj.edit8:setField("atributos.sabedoria");
    obj.edit8:setHeight(30);
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setMax(99);
    obj.edit8:setName("edit8");
    obj.edit8:setTransparent(true);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(15);
    obj.edit8:setFontColor("white");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart21);
    obj.label8:setFrameRegion("modificador");
    obj.label8:setField("atributos.modsabedoriastr");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("center");
    obj.label8:setFontSize(46);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowPart21);
    obj.layout23:setFrameRegion("titulo");
    obj.layout23:setName("layout23");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout23);
    obj.button18:setAlign("client");
    obj.button18:setText("SABEDORIA");
    obj.button18:setVertTextAlign("center");
    obj.button18:setHorzTextAlign("center");
    obj.button18:setName("button18");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart21);
    obj.flowLayout8:setFrameRegion("RegiaoDePericias");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setLineSpacing(0);
    obj.flowLayout8:setHorzAlign("leading");
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout8:setVertAlign("leading");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout8);
    obj.flowPart22:setMinWidth(206);
    obj.flowPart22:setMaxWidth(250);
    obj.flowPart22:setHeight(17);
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart22:setVertAlign("leading");

    obj.cbProfsabedoria = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfsabedoria:setParent(obj.flowPart22);
    obj.cbProfsabedoria:setName("cbProfsabedoria");
    obj.cbProfsabedoria:setAlign("left");
    obj.cbProfsabedoria:setField("resistencias.sabedoria");
    obj.cbProfsabedoria:setWidth(20);
    obj.cbProfsabedoria:setHeight(20);
    obj.cbProfsabedoria:setOptimize(false);
    obj.cbProfsabedoria:setImageChecked("images/checkbox2_checked.png");
    obj.cbProfsabedoria:setImageUnchecked("images/checkbox2_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.flowPart22);
    obj.dataLink46:setField("macroExpertise.sabedoria");
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.flowPart22);
    obj.dataLink47:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink47:setName("dataLink47");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flowPart22);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(26);
    obj.layout24:setMargins({left=2});
    obj.layout24:setName("layout24");

    obj.labProfsabedoria = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfsabedoria:setParent(obj.layout24);
    obj.labProfsabedoria:setName("labProfsabedoria");
    obj.labProfsabedoria:setField("resistencias.bonussabedoriastr");
    obj.labProfsabedoria:setAlign("client");
    obj.labProfsabedoria:setHorzTextAlign("center");
    obj.labProfsabedoria:setVertTextAlign("trailing");
    obj.labProfsabedoria:setTextTrimming("none");
    obj.labProfsabedoria:setFontColor("white");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout24);
    obj.horzLine14:setStrokeColor("white");
    obj.horzLine14:setStrokeSize(1);
    obj.horzLine14:setAlign("bottom");
    obj.horzLine14:setName("horzLine14");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.flowPart22);
    obj.button19:setAlign("left");
    obj.button19:setText("Resistência");
    obj.button19:setWidth(122);
    obj.button19:setMargins({left=2});
    obj.button19:setName("button19");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.flowLayout8);
    obj.dataLink48:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'resistencias.sabedoria', 'propriedades.prescience', 'propriedades.saveBonus'});
    obj.dataLink48:setName("dataLink48");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout8);
    obj.flowPart23:setMinWidth(206);
    obj.flowPart23:setMaxWidth(250);
    obj.flowPart23:setHeight(17);
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart23:setVertAlign("leading");

    obj.cbProfadestrarAnimais = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfadestrarAnimais:setParent(obj.flowPart23);
    obj.cbProfadestrarAnimais:setName("cbProfadestrarAnimais");
    obj.cbProfadestrarAnimais:setAlign("left");
    obj.cbProfadestrarAnimais:setField("pericias.adestrarAnimais");
    obj.cbProfadestrarAnimais:setWidth(20);
    obj.cbProfadestrarAnimais:setHeight(20);
    obj.cbProfadestrarAnimais:setOptimize(false);
    obj.cbProfadestrarAnimais:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfadestrarAnimais:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.flowPart23);
    obj.dataLink49:setField("macroExpertise.adestrarAnimais");
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.flowPart23);
    obj.dataLink50:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink50:setName("dataLink50");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowPart23);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(26);
    obj.layout25:setMargins({left=2});
    obj.layout25:setName("layout25");

    obj.labProfadestrarAnimais = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfadestrarAnimais:setParent(obj.layout25);
    obj.labProfadestrarAnimais:setName("labProfadestrarAnimais");
    obj.labProfadestrarAnimais:setField("pericias.bonusadestrarAnimaisstr");
    obj.labProfadestrarAnimais:setAlign("client");
    obj.labProfadestrarAnimais:setHorzTextAlign("center");
    obj.labProfadestrarAnimais:setVertTextAlign("trailing");
    obj.labProfadestrarAnimais:setTextTrimming("none");
    obj.labProfadestrarAnimais:setFontColor("white");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout25);
    obj.horzLine15:setStrokeColor("white");
    obj.horzLine15:setStrokeSize(1);
    obj.horzLine15:setAlign("bottom");
    obj.horzLine15:setName("horzLine15");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.flowPart23);
    obj.button20:setAlign("left");
    obj.button20:setText("Adestrar Animais");
    obj.button20:setWidth(122);
    obj.button20:setMargins({left=2});
    obj.button20:setName("button20");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.flowLayout8);
    obj.dataLink51:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.adestrarAnimais', 'macroExpertise.adestrarAnimais', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink51:setName("dataLink51");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout8);
    obj.flowPart24:setMinWidth(206);
    obj.flowPart24:setMaxWidth(250);
    obj.flowPart24:setHeight(17);
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart24:setVertAlign("leading");

    obj.cbProfintuicao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfintuicao:setParent(obj.flowPart24);
    obj.cbProfintuicao:setName("cbProfintuicao");
    obj.cbProfintuicao:setAlign("left");
    obj.cbProfintuicao:setField("pericias.intuicao");
    obj.cbProfintuicao:setWidth(20);
    obj.cbProfintuicao:setHeight(20);
    obj.cbProfintuicao:setOptimize(false);
    obj.cbProfintuicao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfintuicao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.flowPart24);
    obj.dataLink52:setField("macroExpertise.intuicao");
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.flowPart24);
    obj.dataLink53:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink53:setName("dataLink53");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart24);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(26);
    obj.layout26:setMargins({left=2});
    obj.layout26:setName("layout26");

    obj.labProfintuicao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfintuicao:setParent(obj.layout26);
    obj.labProfintuicao:setName("labProfintuicao");
    obj.labProfintuicao:setField("pericias.bonusintuicaostr");
    obj.labProfintuicao:setAlign("client");
    obj.labProfintuicao:setHorzTextAlign("center");
    obj.labProfintuicao:setVertTextAlign("trailing");
    obj.labProfintuicao:setTextTrimming("none");
    obj.labProfintuicao:setFontColor("white");

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout26);
    obj.horzLine16:setStrokeColor("white");
    obj.horzLine16:setStrokeSize(1);
    obj.horzLine16:setAlign("bottom");
    obj.horzLine16:setName("horzLine16");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.flowPart24);
    obj.button21:setAlign("left");
    obj.button21:setText("Intuição");
    obj.button21:setWidth(122);
    obj.button21:setMargins({left=2});
    obj.button21:setName("button21");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.flowLayout8);
    obj.dataLink54:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.intuicao', 'macroExpertise.intuicao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink54:setName("dataLink54");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout8);
    obj.flowPart25:setMinWidth(206);
    obj.flowPart25:setMaxWidth(250);
    obj.flowPart25:setHeight(17);
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart25:setVertAlign("leading");

    obj.cbProfmedicina = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfmedicina:setParent(obj.flowPart25);
    obj.cbProfmedicina:setName("cbProfmedicina");
    obj.cbProfmedicina:setAlign("left");
    obj.cbProfmedicina:setField("pericias.medicina");
    obj.cbProfmedicina:setWidth(20);
    obj.cbProfmedicina:setHeight(20);
    obj.cbProfmedicina:setOptimize(false);
    obj.cbProfmedicina:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfmedicina:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.flowPart25);
    obj.dataLink55:setField("macroExpertise.medicina");
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.flowPart25);
    obj.dataLink56:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink56:setName("dataLink56");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart25);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(26);
    obj.layout27:setMargins({left=2});
    obj.layout27:setName("layout27");

    obj.labProfmedicina = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfmedicina:setParent(obj.layout27);
    obj.labProfmedicina:setName("labProfmedicina");
    obj.labProfmedicina:setField("pericias.bonusmedicinastr");
    obj.labProfmedicina:setAlign("client");
    obj.labProfmedicina:setHorzTextAlign("center");
    obj.labProfmedicina:setVertTextAlign("trailing");
    obj.labProfmedicina:setTextTrimming("none");
    obj.labProfmedicina:setFontColor("white");

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout27);
    obj.horzLine17:setStrokeColor("white");
    obj.horzLine17:setStrokeSize(1);
    obj.horzLine17:setAlign("bottom");
    obj.horzLine17:setName("horzLine17");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.flowPart25);
    obj.button22:setAlign("left");
    obj.button22:setText("Medicina");
    obj.button22:setWidth(122);
    obj.button22:setMargins({left=2});
    obj.button22:setName("button22");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.flowLayout8);
    obj.dataLink57:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.medicina', 'macroExpertise.medicina', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink57:setName("dataLink57");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout8);
    obj.flowPart26:setMinWidth(206);
    obj.flowPart26:setMaxWidth(250);
    obj.flowPart26:setHeight(17);
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart26:setVertAlign("leading");

    obj.cbProfpercepcao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfpercepcao:setParent(obj.flowPart26);
    obj.cbProfpercepcao:setName("cbProfpercepcao");
    obj.cbProfpercepcao:setAlign("left");
    obj.cbProfpercepcao:setField("pericias.percepcao");
    obj.cbProfpercepcao:setWidth(20);
    obj.cbProfpercepcao:setHeight(20);
    obj.cbProfpercepcao:setOptimize(false);
    obj.cbProfpercepcao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfpercepcao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.flowPart26);
    obj.dataLink58:setField("macroExpertise.percepcao");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.flowPart26);
    obj.dataLink59:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink59:setName("dataLink59");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowPart26);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(26);
    obj.layout28:setMargins({left=2});
    obj.layout28:setName("layout28");

    obj.labProfpercepcao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfpercepcao:setParent(obj.layout28);
    obj.labProfpercepcao:setName("labProfpercepcao");
    obj.labProfpercepcao:setField("pericias.bonuspercepcaostr");
    obj.labProfpercepcao:setAlign("client");
    obj.labProfpercepcao:setHorzTextAlign("center");
    obj.labProfpercepcao:setVertTextAlign("trailing");
    obj.labProfpercepcao:setTextTrimming("none");
    obj.labProfpercepcao:setFontColor("white");

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout28);
    obj.horzLine18:setStrokeColor("white");
    obj.horzLine18:setStrokeSize(1);
    obj.horzLine18:setAlign("bottom");
    obj.horzLine18:setName("horzLine18");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.flowPart26);
    obj.button23:setAlign("left");
    obj.button23:setText("Percepção");
    obj.button23:setWidth(122);
    obj.button23:setMargins({left=2});
    obj.button23:setName("button23");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.flowLayout8);
    obj.dataLink60:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.percepcao', 'macroExpertise.percepcao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink60:setName("dataLink60");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout8);
    obj.flowPart27:setMinWidth(206);
    obj.flowPart27:setMaxWidth(250);
    obj.flowPart27:setHeight(17);
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart27:setVertAlign("leading");

    obj.cbProfsobrevivencia = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfsobrevivencia:setParent(obj.flowPart27);
    obj.cbProfsobrevivencia:setName("cbProfsobrevivencia");
    obj.cbProfsobrevivencia:setAlign("left");
    obj.cbProfsobrevivencia:setField("pericias.sobrevivencia");
    obj.cbProfsobrevivencia:setWidth(20);
    obj.cbProfsobrevivencia:setHeight(20);
    obj.cbProfsobrevivencia:setOptimize(false);
    obj.cbProfsobrevivencia:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfsobrevivencia:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.flowPart27);
    obj.dataLink61:setField("macroExpertise.sobrevivencia");
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.flowPart27);
    obj.dataLink62:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink62:setName("dataLink62");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flowPart27);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(26);
    obj.layout29:setMargins({left=2});
    obj.layout29:setName("layout29");

    obj.labProfsobrevivencia = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfsobrevivencia:setParent(obj.layout29);
    obj.labProfsobrevivencia:setName("labProfsobrevivencia");
    obj.labProfsobrevivencia:setField("pericias.bonussobrevivenciastr");
    obj.labProfsobrevivencia:setAlign("client");
    obj.labProfsobrevivencia:setHorzTextAlign("center");
    obj.labProfsobrevivencia:setVertTextAlign("trailing");
    obj.labProfsobrevivencia:setTextTrimming("none");
    obj.labProfsobrevivencia:setFontColor("white");

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.layout29);
    obj.horzLine19:setStrokeColor("white");
    obj.horzLine19:setStrokeSize(1);
    obj.horzLine19:setAlign("bottom");
    obj.horzLine19:setName("horzLine19");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.flowPart27);
    obj.button24:setAlign("left");
    obj.button24:setText("Sobrevivência");
    obj.button24:setWidth(122);
    obj.button24:setMargins({left=2});
    obj.button24:setName("button24");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.flowLayout8);
    obj.dataLink63:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.sobrevivencia', 'macroExpertise.sobrevivencia', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.fraLayAtributos);
    obj.dataLink64:setField("atributos.carisma");
    obj.dataLink64:setName("dataLink64");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.fraLayAtributos);
    obj.flowPart28:setHeight(140);
    obj.flowPart28:setMinWidth(320);
    obj.flowPart28:setMaxWidth(420);
    obj.flowPart28:setMinScaledWidth(305);
    obj.flowPart28:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart28:setVertAlign("leading");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowPart28);
    obj.layout30:setLeft(6);
    obj.layout30:setTop(12);
    obj.layout30:setWidth(116);
    obj.layout30:setHeight(115);
    obj.layout30:setName("layout30");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout30);
    obj.edit9:setAlign("top");
    obj.edit9:setMargins({left=30, right=30});
    obj.edit9:setField("atributos.carisma");
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setMin(0);
    obj.edit9:setMax(99);
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(15);
    obj.edit9:setFontColor("white");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart28);
    obj.label9:setFrameRegion("modificador");
    obj.label9:setField("atributos.modcarismastr");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setVertTextAlign("center");
    obj.label9:setFontSize(46);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowPart28);
    obj.layout31:setFrameRegion("titulo");
    obj.layout31:setName("layout31");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout31);
    obj.button25:setAlign("client");
    obj.button25:setText("CARISMA");
    obj.button25:setVertTextAlign("center");
    obj.button25:setHorzTextAlign("center");
    obj.button25:setName("button25");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowPart28);
    obj.flowLayout9:setFrameRegion("RegiaoDePericias");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setLineSpacing(0);
    obj.flowLayout9:setHorzAlign("leading");
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout9:setVertAlign("leading");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout9);
    obj.flowPart29:setMinWidth(206);
    obj.flowPart29:setMaxWidth(250);
    obj.flowPart29:setHeight(17);
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart29:setVertAlign("leading");

    obj.cbProfcarisma = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfcarisma:setParent(obj.flowPart29);
    obj.cbProfcarisma:setName("cbProfcarisma");
    obj.cbProfcarisma:setAlign("left");
    obj.cbProfcarisma:setField("resistencias.carisma");
    obj.cbProfcarisma:setWidth(20);
    obj.cbProfcarisma:setHeight(20);
    obj.cbProfcarisma:setOptimize(false);
    obj.cbProfcarisma:setImageChecked("images/checkbox2_checked.png");
    obj.cbProfcarisma:setImageUnchecked("images/checkbox2_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.flowPart29);
    obj.dataLink65:setField("macroExpertise.carisma");
    obj.dataLink65:setName("dataLink65");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.flowPart29);
    obj.dataLink66:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink66:setName("dataLink66");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flowPart29);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(26);
    obj.layout32:setMargins({left=2});
    obj.layout32:setName("layout32");

    obj.labProfcarisma = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfcarisma:setParent(obj.layout32);
    obj.labProfcarisma:setName("labProfcarisma");
    obj.labProfcarisma:setField("resistencias.bonuscarismastr");
    obj.labProfcarisma:setAlign("client");
    obj.labProfcarisma:setHorzTextAlign("center");
    obj.labProfcarisma:setVertTextAlign("trailing");
    obj.labProfcarisma:setTextTrimming("none");
    obj.labProfcarisma:setFontColor("white");

    obj.horzLine20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.layout32);
    obj.horzLine20:setStrokeColor("white");
    obj.horzLine20:setStrokeSize(1);
    obj.horzLine20:setAlign("bottom");
    obj.horzLine20:setName("horzLine20");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.flowPart29);
    obj.button26:setAlign("left");
    obj.button26:setText("Resistência");
    obj.button26:setWidth(122);
    obj.button26:setMargins({left=2});
    obj.button26:setName("button26");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.flowLayout9);
    obj.dataLink67:setFields({'atributos.modcarisma', 'bonusProficiencia', 'resistencias.carisma', 'propriedades.prescience', 'propriedades.saveBonus'});
    obj.dataLink67:setName("dataLink67");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout9);
    obj.flowPart30:setMinWidth(206);
    obj.flowPart30:setMaxWidth(250);
    obj.flowPart30:setHeight(17);
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart30:setVertAlign("leading");

    obj.cbProfatuacao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfatuacao:setParent(obj.flowPart30);
    obj.cbProfatuacao:setName("cbProfatuacao");
    obj.cbProfatuacao:setAlign("left");
    obj.cbProfatuacao:setField("pericias.atuacao");
    obj.cbProfatuacao:setWidth(20);
    obj.cbProfatuacao:setHeight(20);
    obj.cbProfatuacao:setOptimize(false);
    obj.cbProfatuacao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfatuacao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.flowPart30);
    obj.dataLink68:setField("macroExpertise.atuacao");
    obj.dataLink68:setName("dataLink68");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.flowPart30);
    obj.dataLink69:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink69:setName("dataLink69");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flowPart30);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(26);
    obj.layout33:setMargins({left=2});
    obj.layout33:setName("layout33");

    obj.labProfatuacao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfatuacao:setParent(obj.layout33);
    obj.labProfatuacao:setName("labProfatuacao");
    obj.labProfatuacao:setField("pericias.bonusatuacaostr");
    obj.labProfatuacao:setAlign("client");
    obj.labProfatuacao:setHorzTextAlign("center");
    obj.labProfatuacao:setVertTextAlign("trailing");
    obj.labProfatuacao:setTextTrimming("none");
    obj.labProfatuacao:setFontColor("white");

    obj.horzLine21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.layout33);
    obj.horzLine21:setStrokeColor("white");
    obj.horzLine21:setStrokeSize(1);
    obj.horzLine21:setAlign("bottom");
    obj.horzLine21:setName("horzLine21");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.flowPart30);
    obj.button27:setAlign("left");
    obj.button27:setText("Atuação");
    obj.button27:setWidth(122);
    obj.button27:setMargins({left=2});
    obj.button27:setName("button27");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.flowLayout9);
    obj.dataLink70:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.atuacao', 'macroExpertise.atuacao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink70:setName("dataLink70");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout9);
    obj.flowPart31:setMinWidth(206);
    obj.flowPart31:setMaxWidth(250);
    obj.flowPart31:setHeight(17);
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart31:setVertAlign("leading");

    obj.cbProfenganacao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfenganacao:setParent(obj.flowPart31);
    obj.cbProfenganacao:setName("cbProfenganacao");
    obj.cbProfenganacao:setAlign("left");
    obj.cbProfenganacao:setField("pericias.enganacao");
    obj.cbProfenganacao:setWidth(20);
    obj.cbProfenganacao:setHeight(20);
    obj.cbProfenganacao:setOptimize(false);
    obj.cbProfenganacao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfenganacao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.flowPart31);
    obj.dataLink71:setField("macroExpertise.enganacao");
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.flowPart31);
    obj.dataLink72:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink72:setName("dataLink72");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.flowPart31);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(26);
    obj.layout34:setMargins({left=2});
    obj.layout34:setName("layout34");

    obj.labProfenganacao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfenganacao:setParent(obj.layout34);
    obj.labProfenganacao:setName("labProfenganacao");
    obj.labProfenganacao:setField("pericias.bonusenganacaostr");
    obj.labProfenganacao:setAlign("client");
    obj.labProfenganacao:setHorzTextAlign("center");
    obj.labProfenganacao:setVertTextAlign("trailing");
    obj.labProfenganacao:setTextTrimming("none");
    obj.labProfenganacao:setFontColor("white");

    obj.horzLine22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.layout34);
    obj.horzLine22:setStrokeColor("white");
    obj.horzLine22:setStrokeSize(1);
    obj.horzLine22:setAlign("bottom");
    obj.horzLine22:setName("horzLine22");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.flowPart31);
    obj.button28:setAlign("left");
    obj.button28:setText("Enganação");
    obj.button28:setWidth(122);
    obj.button28:setMargins({left=2});
    obj.button28:setName("button28");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.flowLayout9);
    obj.dataLink73:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.enganacao', 'macroExpertise.enganacao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink73:setName("dataLink73");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout9);
    obj.flowPart32:setMinWidth(206);
    obj.flowPart32:setMaxWidth(250);
    obj.flowPart32:setHeight(17);
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart32:setVertAlign("leading");

    obj.cbProfintimidacao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfintimidacao:setParent(obj.flowPart32);
    obj.cbProfintimidacao:setName("cbProfintimidacao");
    obj.cbProfintimidacao:setAlign("left");
    obj.cbProfintimidacao:setField("pericias.intimidacao");
    obj.cbProfintimidacao:setWidth(20);
    obj.cbProfintimidacao:setHeight(20);
    obj.cbProfintimidacao:setOptimize(false);
    obj.cbProfintimidacao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfintimidacao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.flowPart32);
    obj.dataLink74:setField("macroExpertise.intimidacao");
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.flowPart32);
    obj.dataLink75:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink75:setName("dataLink75");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.flowPart32);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(26);
    obj.layout35:setMargins({left=2});
    obj.layout35:setName("layout35");

    obj.labProfintimidacao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfintimidacao:setParent(obj.layout35);
    obj.labProfintimidacao:setName("labProfintimidacao");
    obj.labProfintimidacao:setField("pericias.bonusintimidacaostr");
    obj.labProfintimidacao:setAlign("client");
    obj.labProfintimidacao:setHorzTextAlign("center");
    obj.labProfintimidacao:setVertTextAlign("trailing");
    obj.labProfintimidacao:setTextTrimming("none");
    obj.labProfintimidacao:setFontColor("white");

    obj.horzLine23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.layout35);
    obj.horzLine23:setStrokeColor("white");
    obj.horzLine23:setStrokeSize(1);
    obj.horzLine23:setAlign("bottom");
    obj.horzLine23:setName("horzLine23");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.flowPart32);
    obj.button29:setAlign("left");
    obj.button29:setText("Intimidação");
    obj.button29:setWidth(122);
    obj.button29:setMargins({left=2});
    obj.button29:setName("button29");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.flowLayout9);
    obj.dataLink76:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.intimidacao', 'macroExpertise.intimidacao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink76:setName("dataLink76");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout9);
    obj.flowPart33:setMinWidth(206);
    obj.flowPart33:setMaxWidth(250);
    obj.flowPart33:setHeight(17);
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart33:setVertAlign("leading");

    obj.cbProfpersuasao = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbProfpersuasao:setParent(obj.flowPart33);
    obj.cbProfpersuasao:setName("cbProfpersuasao");
    obj.cbProfpersuasao:setAlign("left");
    obj.cbProfpersuasao:setField("pericias.persuasao");
    obj.cbProfpersuasao:setWidth(20);
    obj.cbProfpersuasao:setHeight(20);
    obj.cbProfpersuasao:setOptimize(false);
    obj.cbProfpersuasao:setImageChecked("images/checkbox1_checked.png");
    obj.cbProfpersuasao:setImageUnchecked("images/checkbox1_unchecked.png");


					function updateCbVisibility(pericia)
						if sheet ~= nil then
							if common.pericias[pericia] ~= nil then
								local value;

								value = common.fichaTemEspecializacao(sheet, pericia);

								if value then self["cbProf" .. pericia]:setImageChecked("images/checkbox1_double_checked.png");
								else self["cbProf" .. pericia]:setImageChecked("images/checkbox1_checked.png");
								end;

								value = common.fichaTemPropriedade(sheet, 'jackOfAllTrades');
								if common.fichaTemPropriedade(sheet, 'remarkableAthlete') then
									if pericia == 'atletismo' then value = true; end;
									if pericia == 'acrobacia' then value = true; end;
									if pericia == 'furtividade' then value = true; end;
									if pericia == 'prestidigitacao' then value = true; end;
								end;

								if value then self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_half_checked.png");
								else self["cbProf" .. pericia]:setImageUnchecked("images/checkbox1_unchecked.png");
								end;
							else
								self["cbProf" .. pericia]:setImageChecked("images/checkbox2_checked.png");
								self["cbProf" .. pericia]:setImageUnchecked("images/checkbox2_unchecked.png");
							end;
						end;
					end;
				


    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.flowPart33);
    obj.dataLink77:setField("macroExpertise.persuasao");
    obj.dataLink77:setName("dataLink77");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.flowPart33);
    obj.dataLink78:setFields({'propriedades.jackOfAllTrades', 'propriedades.remarkableAthlete'});
    obj.dataLink78:setName("dataLink78");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.flowPart33);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(26);
    obj.layout36:setMargins({left=2});
    obj.layout36:setName("layout36");

    obj.labProfpersuasao = GUI.fromHandle(_obj_newObject("label"));
    obj.labProfpersuasao:setParent(obj.layout36);
    obj.labProfpersuasao:setName("labProfpersuasao");
    obj.labProfpersuasao:setField("pericias.bonuspersuasaostr");
    obj.labProfpersuasao:setAlign("client");
    obj.labProfpersuasao:setHorzTextAlign("center");
    obj.labProfpersuasao:setVertTextAlign("trailing");
    obj.labProfpersuasao:setTextTrimming("none");
    obj.labProfpersuasao:setFontColor("white");

    obj.horzLine24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.layout36);
    obj.horzLine24:setStrokeColor("white");
    obj.horzLine24:setStrokeSize(1);
    obj.horzLine24:setAlign("bottom");
    obj.horzLine24:setName("horzLine24");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.flowPart33);
    obj.button30:setAlign("left");
    obj.button30:setText("Persuasão");
    obj.button30:setWidth(122);
    obj.button30:setMargins({left=2});
    obj.button30:setName("button30");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.flowLayout9);
    obj.dataLink79:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.persuasao', 'macroExpertise.persuasao', 'propriedades.jackOfAllTrades', 'propriedades.prescience', 'propriedades.checkBonus'});
    obj.dataLink79:setName("dataLink79");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowLayout3);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setVertAlign("leading");
    obj.flowLayout10:setMaxControlsPerLine(1);
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setStepSizes({310, 360});
    obj.flowLayout10:setMinScaledWidth(300);
    obj.flowLayout10:setMaxScaledWidth(340);
    obj.flowLayout10:setAvoidScale(true);
    obj.flowLayout10:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowLayout10);
    obj.flowLayout11:setMinWidth(235);
    obj.flowLayout11:setMaxWidth(475);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setAvoidScale(false);
    obj.flowLayout11:setVertAlign("center");
    obj.flowLayout11:setHorzAlign("justify");
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout11);
    obj.flowPart34:setStepSizes({105});
    obj.flowPart34:setMinScaledWidth(75);
    obj.flowPart34:setHeight(120);
    obj.flowPart34:setFrameStyle("frames/shield/frame.xml");
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart34:setVertAlign("leading");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart34);
    obj.label10:setAlign("top");
    obj.label10:setText("CLASSE DE ARMADURA");
    obj.label10:setHeight(20);
    obj.label10:setFontSize(9);
    obj.label10:setWordWrap(true);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setTextTrimming("none");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart34);
    obj.edit10:setAlign("client");
    obj.edit10:setField("CA");
    obj.edit10:setFontSize(30);
    obj.edit10:setName("edit10");
    obj.edit10:setTransparent(true);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("white");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout11);
    obj.flowPart35:setStepSizes({105});
    obj.flowPart35:setMinScaledWidth(75);
    obj.flowPart35:setHeight(120);
    obj.flowPart35:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart35:setVertAlign("leading");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.flowPart35);
    obj.button31:setAlign("top");
    obj.button31:setText("INICIATIVA");
    obj.button31:setHeight(20);
    obj.button31:setFontSize(9);
    obj.button31:setWordWrap(true);
    obj.button31:setHorzTextAlign("center");
    obj.button31:setMargins({left=5, right=5});
    obj.button31:setTextTrimming("none");
    obj.button31:setName("button31");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart35);
    obj.edit11:setAlign("client");
    obj.edit11:setField("iniciativa");
    obj.edit11:setFontSize(30);
    obj.edit11:setName("edit11");
    obj.edit11:setTransparent(true);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontColor("white");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout11);
    obj.flowPart36:setStepSizes({105});
    obj.flowPart36:setMinScaledWidth(75);
    obj.flowPart36:setHeight(120);
    obj.flowPart36:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart36:setVertAlign("leading");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart36);
    obj.label11:setAlign("top");
    obj.label11:setText("DESLOCAMENTO");
    obj.label11:setHeight(20);
    obj.label11:setFontSize(9);
    obj.label11:setWordWrap(true);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setTextTrimming("none");
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart36);
    obj.edit12:setAlign("client");
    obj.edit12:setField("deslocamento");
    obj.edit12:setFontSize(30);
    obj.edit12:setName("edit12");
    obj.edit12:setTransparent(true);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("white");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout10);
    obj.flowPart37:setMinWidth(235);
    obj.flowPart37:setMaxWidth(475);
    obj.flowPart37:setMinScaledWidth(200);
    obj.flowPart37:setHeight(175);
    obj.flowPart37:setMargins({left=2, right=2, top=4, bottom=8});
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setVertAlign("leading");

    obj.frame1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame1:setParent(obj.flowPart37);
    obj.frame1:setAlign("client");
    obj.frame1:setFrameStyle("frames/panel5/topPanel.xml");
    obj.frame1:setMargins({left = 4, right = 4, bottom=4});
    obj.frame1:setName("frame1");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.frame1);
    obj.layout37:setAlign("client");
    obj.layout37:setMargins({left=5,right=5,bottom=5,top=5});
    obj.layout37:setName("layout37");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.layout37);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setHeight(30);
    obj.flowLayout12:setMargins({bottom=5});
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setVertAlign("leading");

 require("descanso.lua"); 


    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.flowLayout12);
    obj.button32:setText("Descanso Curto");
    obj.button32:setWidth(125);
    obj.button32:setName("button32");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.flowLayout12);
    obj.button33:setText("Descanso Longo");
    obj.button33:setWidth(125);
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.flowLayout12);
    obj.button34:setText("Dano");
    obj.button34:setWidth(50);
    obj.button34:setName("button34");


									local function levarDano(ficha)
										Dialogs.inputQuery("Dano", "Quanto dano?", "1",
											function(valorPreenchido)
												if tonumber(valorPreenchido) == nil then
													levarDano(ficha);
												else
													local mesa = common.getMesa(ficha);

													local dmg = tonumber(valorPreenchido);
													local hp = tonumber(ficha.PV);
													local hpmax = tonumber(ficha.PVmax);
													local thp = tonumber(ficha.PVTemporario);

													if dmg == 0 then
														return;
													elseif dmg > 0 then
														if thp ~= nil and thp > 0 then
															local thp_dmg = math.min(dmg, thp);
															ficha.PVTemporario = ""..(thp - thp_dmg);
															dmg = dmg - thp_dmg;
															mesa.chat:enviarAcao("perdeu " .. thp_dmg .. " pontos de vida temporários");
														end;
														local dmg_over = dmg-hp;
														ficha.PV = ""..math.max(0, hp - dmg);
														if dmg_over > hpmax then
															mesa.chat:enviarAcao("morreu o dano levado foi " .. dmg_over .. ", o que é maior que seus PV máximos.");
														end;
													else
														ficha.PV = ""..math.min(hp - dmg, hpmax);
													end;
												end;
											end
										);
									end;
								


    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("client");
    obj.layout38:setMargins({bottom=10});
    obj.layout38:setName("layout38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("right");
    obj.layout39:setWidth(81);
    obj.layout39:setName("layout39");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout39);
    obj.edit13:setAlign("left");
    obj.edit13:setMargins({left=2});
    obj.edit13:setWidth(35);
    obj.edit13:setField("PV");
    obj.edit13:setType("number");
    obj.edit13:setMin(0);
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(15);
    obj.edit13:setFontColor("white");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout39);
    obj.label12:setAlign("left");
    obj.label12:setMargins({left=2});
    obj.label12:setText("/");
    obj.label12:setWidth(5);
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout39);
    obj.edit14:setAlign("left");
    obj.edit14:setMargins({left=2});
    obj.edit14:setWidth(35);
    obj.edit14:setField("PVmax");
    obj.edit14:setType("number");
    obj.edit14:setMin(0);
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(15);
    obj.edit14:setFontColor("white");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout38);
    obj.progressBar1:setAlign("client");
    obj.progressBar1:setColor("red");
    obj.progressBar1:setField("PV");
    obj.progressBar1:setFieldMax("PVmax");
    obj.progressBar1:setMargins({left=2, right=2});
    obj.progressBar1:setColorMode("hl");
    obj.progressBar1:setName("progressBar1");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout38);
    obj.label13:setAlign("client");
    obj.label13:setAutoSize(true);
    obj.label13:setText("PONTOS DE VIDA");
    obj.label13:setFontSize(11);
    obj.label13:setVertTextAlign("center");
    obj.label13:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setMargins({top=1,left=1});
    obj.label13:setFontColor("black");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout38);
    obj.label14:setAlign("client");
    obj.label14:setAutoSize(true);
    obj.label14:setText("PONTOS DE VIDA");
    obj.label14:setFontSize(11);
    obj.label14:setVertTextAlign("center");
    obj.label14:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout38);
    obj.dataLink80:setFields({'PV', 'PVmax'});
    obj.dataLink80:setName("dataLink80");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout37);
    obj.dataLink81:setField("descansoLongo");
    obj.dataLink81:setName("dataLink81");

    obj.frame2 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame2:setParent(obj.flowPart37);
    obj.frame2:setAlign("bottom");
    obj.frame2:setHeight(70);
    obj.frame2:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.frame2:setMargins({left = 4, right = 4});
    obj.frame2:setName("frame2");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.frame2);
    obj.edit15:setAlign("client");
    obj.edit15:setField("PVTemporario");
    obj.edit15:setMargins({top=2});
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setFontSize(36);
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("white");
    obj.edit15:setTransparent(true);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.frame2);
    obj.label15:setAlign("bottom");
    obj.label15:setAutoSize(true);
    obj.label15:setText("PONTOS DE VIDA TEMPORÁRIOS");
    obj.label15:setFontSize(11);
    obj.label15:setVertTextAlign("center");
    obj.label15:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowLayout10);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMinWidth(235);
    obj.flowLayout13:setMaxWidth(475);
    obj.flowLayout13:setMinScaledWidth(235);
    obj.flowLayout13:setHorzAlign("justify");
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout13:setVertAlign("leading");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout13);
    obj.flowPart38:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart38:setStepSizes({130, 150, 160});
    obj.flowPart38:setHeight(100);
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart38:setVertAlign("leading");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.flowPart38);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout40);
    obj.label16:setAlign("left");
    obj.label16:setAutoSize(true);
    obj.label16:setText("TOTAL:");
    obj.label16:setTextTrimming("none");
    obj.label16:setWordWrap(false);
    obj.label16:setFontSize(10);
    obj.label16:setHorzTextAlign("trailing");
    obj.label16:setName("label16");
    obj.label16:setFontColor("#D0D0D0");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setAlign("client");
    obj.layout41:setMargins({left=5, right=3});
    obj.layout41:setName("layout41");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout41);
    obj.edit16:setAlign("client");
    obj.edit16:setField("DadosDeVidaTotal");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(15);
    obj.edit16:setFontColor("white");
    obj.edit16:setTransparent(true);

    obj.horzLine25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.layout41);
    obj.horzLine25:setAlign("bottom");
    obj.horzLine25:setStrokeColor("gray");
    obj.horzLine25:setName("horzLine25");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart38);
    obj.edit17:setAlign("client");
    obj.edit17:setField("DadosDeVida");
    obj.edit17:setMargins({top=2});
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setFontSize(21);
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("white");
    obj.edit17:setTransparent(true);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart38);
    obj.label17:setAlign("bottom");
    obj.label17:setAutoSize(true);
    obj.label17:setText("DADOS DE VIDA");
    obj.label17:setFontSize(11);
    obj.label17:setVertTextAlign("center");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout13);
    obj.flowPart39:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart39:setStepSizes({170, 170});
    obj.flowPart39:setHeight(100);
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart39:setVertAlign("leading");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.flowPart39);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setMargins({left=2});
    obj.layout42:setName("layout42");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout42);
    obj.label18:setAlign("client");
    obj.label18:setAutoSize(true);
    obj.label18:setFontSize(10);
    obj.label18:setText("SUCESSOS");
    obj.label18:setWordWrap(false);
    obj.label18:setVertTextAlign("center");
    obj.label18:setHorzTextAlign("trailing");
    obj.label18:setMargins({right=6});
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout42);
    obj.imageCheckBox1:setAlign("right");
    obj.imageCheckBox1:setWidth(25);
    obj.imageCheckBox1:setMargins({right=2});
    obj.imageCheckBox1:setField("testesContraMorte.s0");
    obj.imageCheckBox1:setOptimize(false);
    obj.imageCheckBox1:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox1:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");
    obj.imageCheckBox1:setHeight(20);
    obj.imageCheckBox1:setVisible(true);

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout42);
    obj.imageCheckBox2:setAlign("right");
    obj.imageCheckBox2:setWidth(25);
    obj.imageCheckBox2:setMargins({right=2});
    obj.imageCheckBox2:setField("testesContraMorte.s1");
    obj.imageCheckBox2:setOptimize(false);
    obj.imageCheckBox2:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox2:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox2:setName("imageCheckBox2");
    obj.imageCheckBox2:setHeight(20);
    obj.imageCheckBox2:setVisible(true);

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout42);
    obj.imageCheckBox3:setAlign("right");
    obj.imageCheckBox3:setWidth(25);
    obj.imageCheckBox3:setMargins({right=6});
    obj.imageCheckBox3:setField("testesContraMorte.s2");
    obj.imageCheckBox3:setOptimize(false);
    obj.imageCheckBox3:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox3:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox3:setName("imageCheckBox3");
    obj.imageCheckBox3:setHeight(20);
    obj.imageCheckBox3:setVisible(true);

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.flowPart39);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setMargins({left=2, top = 4});
    obj.layout43:setName("layout43");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout43);
    obj.label19:setAlign("client");
    obj.label19:setAutoSize(true);
    obj.label19:setFontSize(10);
    obj.label19:setText("FALHAS");
    obj.label19:setVertTextAlign("center");
    obj.label19:setHorzTextAlign("trailing");
    obj.label19:setMargins({right=6});
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout43);
    obj.imageCheckBox4:setAlign("right");
    obj.imageCheckBox4:setWidth(25);
    obj.imageCheckBox4:setMargins({right=2});
    obj.imageCheckBox4:setField("testesContraMorte.f0");
    obj.imageCheckBox4:setOptimize(false);
    obj.imageCheckBox4:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox4:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox4:setName("imageCheckBox4");
    obj.imageCheckBox4:setHeight(20);
    obj.imageCheckBox4:setVisible(true);

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout43);
    obj.imageCheckBox5:setAlign("right");
    obj.imageCheckBox5:setWidth(25);
    obj.imageCheckBox5:setMargins({right=2});
    obj.imageCheckBox5:setField("testesContraMorte.f1");
    obj.imageCheckBox5:setOptimize(false);
    obj.imageCheckBox5:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox5:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox5:setName("imageCheckBox5");
    obj.imageCheckBox5:setHeight(20);
    obj.imageCheckBox5:setVisible(true);

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout43);
    obj.imageCheckBox6:setAlign("right");
    obj.imageCheckBox6:setWidth(25);
    obj.imageCheckBox6:setMargins({right=6});
    obj.imageCheckBox6:setField("testesContraMorte.f2");
    obj.imageCheckBox6:setOptimize(false);
    obj.imageCheckBox6:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox6:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox6:setName("imageCheckBox6");
    obj.imageCheckBox6:setHeight(20);
    obj.imageCheckBox6:setVisible(true);

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.flowPart39);
    obj.button35:setAlign("bottom");
    obj.button35:setText("TESTE CONTRA MORTE");
    obj.button35:setFontSize(11);
    obj.button35:setVertTextAlign("center");
    obj.button35:setHorzTextAlign("center");
    obj.button35:setName("button35");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Caracteristicas");
    obj.tab2:setName("tab2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.tab2);
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#40000000");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.fraCaracteristicasLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraCaracteristicasLayout:setParent(obj.scrollBox2);
    obj.fraCaracteristicasLayout:setAlign("top");
    obj.fraCaracteristicasLayout:setHeight(500);
    obj.fraCaracteristicasLayout:setMargins({left=10, right=10, top=10});
    obj.fraCaracteristicasLayout:setAutoHeight(true);
    obj.fraCaracteristicasLayout:setHorzAlign("center");
    obj.fraCaracteristicasLayout:setLineSpacing(3);
    obj.fraCaracteristicasLayout:setName("fraCaracteristicasLayout");
    obj.fraCaracteristicasLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraCaracteristicasLayout:setMinScaledWidth(300);
    obj.fraCaracteristicasLayout:setVertAlign("leading");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMinScaledWidth(290);
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout14:setVertAlign("leading");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout14);
    obj.flowPart40:setMinWidth(320);
    obj.flowPart40:setMaxWidth(1600);
    obj.flowPart40:setFrameStyle("frames/banner/heroGroup.xml");
    obj.flowPart40:setHeight(175);
    obj.flowPart40:setVertAlign("center");
    obj.flowPart40:setAvoidScale(true);
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart40:setMinScaledWidth(300);
    obj.flowPart40:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.flowPart40);
    obj.layout44:setAlign("client");
    obj.layout44:setName("layout44");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout44);
    obj.edit18:setField("nome");
    obj.edit18:setFontSize(17);
    obj.edit18:setAlign("client");
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("white");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setTransparent(true);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout44);
    obj.label20:setAlign("bottom");
    obj.label20:setText("NOME DO PERSONAGEM");
    obj.label20:setAutoSize(true);
    obj.label20:setMargins({left=3});
    obj.label20:setName("label20");
    obj.label20:setFontSize(12);
    obj.label20:setFontColor("#D0D0D0");

    obj.fraUpperGridCaracteristicas = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridCaracteristicas:setParent(obj.flowLayout14);
    obj.fraUpperGridCaracteristicas:setMinWidth(320);
    obj.fraUpperGridCaracteristicas:setMaxWidth(1600);
    obj.fraUpperGridCaracteristicas:setName("fraUpperGridCaracteristicas");
    obj.fraUpperGridCaracteristicas:setAvoidScale(true);
    obj.fraUpperGridCaracteristicas:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridCaracteristicas:setAutoHeight(true);
    obj.fraUpperGridCaracteristicas:setVertAlign("trailing");
    obj.fraUpperGridCaracteristicas:setMaxControlsPerLine(3);
    obj.fraUpperGridCaracteristicas:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraUpperGridCaracteristicas:setMinScaledWidth(300);
    obj.fraUpperGridCaracteristicas:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo7:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo7:setHeight(50);
    obj.UpperGridCampo7:setMinScaledWidth(100);
    obj.UpperGridCampo7:setMinWidth(100);
    obj.UpperGridCampo7:setMaxWidth(233);
    obj.UpperGridCampo7:setMaxScaledWidth(233);
    obj.UpperGridCampo7:setAvoidScale(true);
    obj.UpperGridCampo7:setName("UpperGridCampo7");
    obj.UpperGridCampo7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo7:setVertAlign("leading");

    obj.edtUpperGridCampo7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.edtUpperGridCampo7:setName("edtUpperGridCampo7");
    obj.edtUpperGridCampo7:setAlign("top");
    obj.edtUpperGridCampo7:setField("caracteristicas.idade");
    obj.edtUpperGridCampo7:setFontSize(13);
    obj.edtUpperGridCampo7:setHeight(30);
    obj.edtUpperGridCampo7:setTransparent(true);
    obj.edtUpperGridCampo7:setVertTextAlign("trailing");
    obj.edtUpperGridCampo7:setWidth(195);
    obj.edtUpperGridCampo7:setFontColor("white");

    obj.linUpperGridCampo7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.linUpperGridCampo7:setName("linUpperGridCampo7");
    obj.linUpperGridCampo7:setAlign("top");
    obj.linUpperGridCampo7:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo7:setStrokeSize(1);

    obj.labUpperGridCampo7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.labUpperGridCampo7:setName("labUpperGridCampo7");
    obj.labUpperGridCampo7:setAlign("top");
    obj.labUpperGridCampo7:setText("IDADE");
    obj.labUpperGridCampo7:setVertTextAlign("leading");
    obj.labUpperGridCampo7:setWordWrap(true);
    obj.labUpperGridCampo7:setTextTrimming("none");
    obj.labUpperGridCampo7:setFontSize(12);
    obj.labUpperGridCampo7:setFontColor("#D0D0D0");

    self.UpperGridCampo7:setHeight(self.edtUpperGridCampo7:getHeight() + self.labUpperGridCampo7:getHeight() + self.linUpperGridCampo7:getHeight());


    obj.UpperGridCampo8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo8:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo8:setHeight(50);
    obj.UpperGridCampo8:setMinScaledWidth(100);
    obj.UpperGridCampo8:setMinWidth(100);
    obj.UpperGridCampo8:setMaxWidth(233);
    obj.UpperGridCampo8:setMaxScaledWidth(233);
    obj.UpperGridCampo8:setAvoidScale(true);
    obj.UpperGridCampo8:setName("UpperGridCampo8");
    obj.UpperGridCampo8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo8:setVertAlign("leading");

    obj.edtUpperGridCampo8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.edtUpperGridCampo8:setName("edtUpperGridCampo8");
    obj.edtUpperGridCampo8:setAlign("top");
    obj.edtUpperGridCampo8:setField("caracteristicas.altura");
    obj.edtUpperGridCampo8:setFontSize(13);
    obj.edtUpperGridCampo8:setHeight(30);
    obj.edtUpperGridCampo8:setTransparent(true);
    obj.edtUpperGridCampo8:setVertTextAlign("trailing");
    obj.edtUpperGridCampo8:setWidth(195);
    obj.edtUpperGridCampo8:setFontColor("white");

    obj.linUpperGridCampo8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.linUpperGridCampo8:setName("linUpperGridCampo8");
    obj.linUpperGridCampo8:setAlign("top");
    obj.linUpperGridCampo8:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo8:setStrokeSize(1);

    obj.labUpperGridCampo8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.labUpperGridCampo8:setName("labUpperGridCampo8");
    obj.labUpperGridCampo8:setAlign("top");
    obj.labUpperGridCampo8:setText("ALTURA");
    obj.labUpperGridCampo8:setVertTextAlign("leading");
    obj.labUpperGridCampo8:setWordWrap(true);
    obj.labUpperGridCampo8:setTextTrimming("none");
    obj.labUpperGridCampo8:setFontSize(12);
    obj.labUpperGridCampo8:setFontColor("#D0D0D0");

    self.UpperGridCampo8:setHeight(self.edtUpperGridCampo8:getHeight() + self.labUpperGridCampo8:getHeight() + self.linUpperGridCampo8:getHeight());


    obj.UpperGridCampo9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo9:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo9:setHeight(50);
    obj.UpperGridCampo9:setMinScaledWidth(100);
    obj.UpperGridCampo9:setMinWidth(100);
    obj.UpperGridCampo9:setMaxWidth(233);
    obj.UpperGridCampo9:setMaxScaledWidth(233);
    obj.UpperGridCampo9:setAvoidScale(true);
    obj.UpperGridCampo9:setName("UpperGridCampo9");
    obj.UpperGridCampo9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo9:setVertAlign("leading");

    obj.edtUpperGridCampo9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.edtUpperGridCampo9:setName("edtUpperGridCampo9");
    obj.edtUpperGridCampo9:setAlign("top");
    obj.edtUpperGridCampo9:setField("caracteristicas.peso");
    obj.edtUpperGridCampo9:setFontSize(13);
    obj.edtUpperGridCampo9:setHeight(30);
    obj.edtUpperGridCampo9:setTransparent(true);
    obj.edtUpperGridCampo9:setVertTextAlign("trailing");
    obj.edtUpperGridCampo9:setWidth(195);
    obj.edtUpperGridCampo9:setFontColor("white");

    obj.linUpperGridCampo9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.linUpperGridCampo9:setName("linUpperGridCampo9");
    obj.linUpperGridCampo9:setAlign("top");
    obj.linUpperGridCampo9:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo9:setStrokeSize(1);

    obj.labUpperGridCampo9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.labUpperGridCampo9:setName("labUpperGridCampo9");
    obj.labUpperGridCampo9:setAlign("top");
    obj.labUpperGridCampo9:setText("PESO");
    obj.labUpperGridCampo9:setVertTextAlign("leading");
    obj.labUpperGridCampo9:setWordWrap(true);
    obj.labUpperGridCampo9:setTextTrimming("none");
    obj.labUpperGridCampo9:setFontSize(12);
    obj.labUpperGridCampo9:setFontColor("#D0D0D0");

    self.UpperGridCampo9:setHeight(self.edtUpperGridCampo9:getHeight() + self.labUpperGridCampo9:getHeight() + self.linUpperGridCampo9:getHeight());


    obj.UpperGridCampo10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo10:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo10:setHeight(50);
    obj.UpperGridCampo10:setMinScaledWidth(100);
    obj.UpperGridCampo10:setMinWidth(100);
    obj.UpperGridCampo10:setMaxWidth(233);
    obj.UpperGridCampo10:setMaxScaledWidth(233);
    obj.UpperGridCampo10:setAvoidScale(true);
    obj.UpperGridCampo10:setName("UpperGridCampo10");
    obj.UpperGridCampo10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo10:setVertAlign("leading");

    obj.edtUpperGridCampo10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.edtUpperGridCampo10:setName("edtUpperGridCampo10");
    obj.edtUpperGridCampo10:setAlign("top");
    obj.edtUpperGridCampo10:setField("caracteristicas.olhos");
    obj.edtUpperGridCampo10:setFontSize(13);
    obj.edtUpperGridCampo10:setHeight(30);
    obj.edtUpperGridCampo10:setTransparent(true);
    obj.edtUpperGridCampo10:setVertTextAlign("trailing");
    obj.edtUpperGridCampo10:setWidth(195);
    obj.edtUpperGridCampo10:setFontColor("white");

    obj.linUpperGridCampo10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.linUpperGridCampo10:setName("linUpperGridCampo10");
    obj.linUpperGridCampo10:setAlign("top");
    obj.linUpperGridCampo10:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo10:setStrokeSize(1);

    obj.labUpperGridCampo10 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.labUpperGridCampo10:setName("labUpperGridCampo10");
    obj.labUpperGridCampo10:setAlign("top");
    obj.labUpperGridCampo10:setText("OLHOS");
    obj.labUpperGridCampo10:setVertTextAlign("leading");
    obj.labUpperGridCampo10:setWordWrap(true);
    obj.labUpperGridCampo10:setTextTrimming("none");
    obj.labUpperGridCampo10:setFontSize(12);
    obj.labUpperGridCampo10:setFontColor("#D0D0D0");

    self.UpperGridCampo10:setHeight(self.edtUpperGridCampo10:getHeight() + self.labUpperGridCampo10:getHeight() + self.linUpperGridCampo10:getHeight());


    obj.UpperGridCampo11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo11:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo11:setHeight(50);
    obj.UpperGridCampo11:setMinScaledWidth(100);
    obj.UpperGridCampo11:setMinWidth(100);
    obj.UpperGridCampo11:setMaxWidth(233);
    obj.UpperGridCampo11:setMaxScaledWidth(233);
    obj.UpperGridCampo11:setAvoidScale(true);
    obj.UpperGridCampo11:setName("UpperGridCampo11");
    obj.UpperGridCampo11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo11:setVertAlign("leading");

    obj.edtUpperGridCampo11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.edtUpperGridCampo11:setName("edtUpperGridCampo11");
    obj.edtUpperGridCampo11:setAlign("top");
    obj.edtUpperGridCampo11:setField("caracteristicas.pele");
    obj.edtUpperGridCampo11:setFontSize(13);
    obj.edtUpperGridCampo11:setHeight(30);
    obj.edtUpperGridCampo11:setTransparent(true);
    obj.edtUpperGridCampo11:setVertTextAlign("trailing");
    obj.edtUpperGridCampo11:setWidth(195);
    obj.edtUpperGridCampo11:setFontColor("white");

    obj.linUpperGridCampo11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.linUpperGridCampo11:setName("linUpperGridCampo11");
    obj.linUpperGridCampo11:setAlign("top");
    obj.linUpperGridCampo11:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo11:setStrokeSize(1);

    obj.labUpperGridCampo11 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.labUpperGridCampo11:setName("labUpperGridCampo11");
    obj.labUpperGridCampo11:setAlign("top");
    obj.labUpperGridCampo11:setText("PELE");
    obj.labUpperGridCampo11:setVertTextAlign("leading");
    obj.labUpperGridCampo11:setWordWrap(true);
    obj.labUpperGridCampo11:setTextTrimming("none");
    obj.labUpperGridCampo11:setFontSize(12);
    obj.labUpperGridCampo11:setFontColor("#D0D0D0");

    self.UpperGridCampo11:setHeight(self.edtUpperGridCampo11:getHeight() + self.labUpperGridCampo11:getHeight() + self.linUpperGridCampo11:getHeight());


    obj.UpperGridCampo12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo12:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo12:setHeight(50);
    obj.UpperGridCampo12:setMinScaledWidth(100);
    obj.UpperGridCampo12:setMinWidth(100);
    obj.UpperGridCampo12:setMaxWidth(233);
    obj.UpperGridCampo12:setMaxScaledWidth(233);
    obj.UpperGridCampo12:setAvoidScale(true);
    obj.UpperGridCampo12:setName("UpperGridCampo12");
    obj.UpperGridCampo12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo12:setVertAlign("leading");

    obj.edtUpperGridCampo12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.edtUpperGridCampo12:setName("edtUpperGridCampo12");
    obj.edtUpperGridCampo12:setAlign("top");
    obj.edtUpperGridCampo12:setField("caracteristicas.cabelo");
    obj.edtUpperGridCampo12:setFontSize(13);
    obj.edtUpperGridCampo12:setHeight(30);
    obj.edtUpperGridCampo12:setTransparent(true);
    obj.edtUpperGridCampo12:setVertTextAlign("trailing");
    obj.edtUpperGridCampo12:setWidth(195);
    obj.edtUpperGridCampo12:setFontColor("white");

    obj.linUpperGridCampo12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.linUpperGridCampo12:setName("linUpperGridCampo12");
    obj.linUpperGridCampo12:setAlign("top");
    obj.linUpperGridCampo12:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo12:setStrokeSize(1);

    obj.labUpperGridCampo12 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.labUpperGridCampo12:setName("labUpperGridCampo12");
    obj.labUpperGridCampo12:setAlign("top");
    obj.labUpperGridCampo12:setText("CABELO");
    obj.labUpperGridCampo12:setVertTextAlign("leading");
    obj.labUpperGridCampo12:setWordWrap(true);
    obj.labUpperGridCampo12:setTextTrimming("none");
    obj.labUpperGridCampo12:setFontSize(12);
    obj.labUpperGridCampo12:setFontColor("#D0D0D0");

    self.UpperGridCampo12:setHeight(self.edtUpperGridCampo12:getHeight() + self.labUpperGridCampo12:getHeight() + self.linUpperGridCampo12:getHeight());


    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.fraCaracteristicasLayout);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMinScaledWidth(290);
    obj.flowLayout15:setHorzAlign("center");
    obj.flowLayout15:setLineSpacing(10);
    obj.flowLayout15:setName("flowLayout15");
    obj.flowLayout15:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout15:setVertAlign("leading");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowLayout15);
    obj.flowLayout16:setMaxControlsPerLine(1);
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setLineSpacing(10);
    obj.flowLayout16:setMargins({left = 4, right = 4});
    obj.flowLayout16:setName("flowLayout16");
    obj.flowLayout16:setStepSizes({});
    obj.flowLayout16:setMinWidth(300);
    obj.flowLayout16:setMaxWidth(1600);
    obj.flowLayout16:setMinScaledWidth(300);
    obj.flowLayout16:setVertAlign("leading");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout16);
    obj.flowPart41:setHeight(390);
    obj.flowPart41:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart41:setMargins({left = 0, right = 4});
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setStepSizes({});
    obj.flowPart41:setMinWidth(300);
    obj.flowPart41:setMaxWidth(1600);
    obj.flowPart41:setMinScaledWidth(300);
    obj.flowPart41:setVertAlign("leading");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flowPart41);
    obj.image1:setAlign("client");
    obj.image1:setStyle("proportional");
    obj.image1:setField("imagens.aparencia");
    obj.image1:setMargins({top=2});
    obj.image1:setEditable(true);
    lfm_setPropAsString(obj.image1, "animate",  "true");
    obj.image1:setName("image1");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart41);
    obj.label21:setAlign("bottom");
    obj.label21:setAutoSize(true);
    obj.label21:setText("APARÊNCIA");
    obj.label21:setFontSize(12);
    obj.label21:setVertTextAlign("center");
    obj.label21:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout16);
    obj.flowPart42:setHeight(115);
    obj.flowPart42:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart42:setMargins({left = 4, right = 0});
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setStepSizes({});
    obj.flowPart42:setMinWidth(300);
    obj.flowPart42:setMaxWidth(1600);
    obj.flowPart42:setMinScaledWidth(300);
    obj.flowPart42:setVertAlign("leading");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowPart42);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("idiomas");
    obj.textEditor1:setMargins({top=2});
    obj.textEditor1:setFontSize(16);
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setTransparent(true);

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart42);
    obj.label22:setAlign("bottom");
    obj.label22:setAutoSize(true);
    obj.label22:setText("IDIOMAS");
    obj.label22:setFontSize(12);
    obj.label22:setVertTextAlign("center");
    obj.label22:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setName("label22");
    obj.label22:setFontColor("white");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowLayout15);
    obj.flowLayout17:setMaxControlsPerLine(1);
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setLineSpacing(10);
    obj.flowLayout17:setMargins({left=4, right=4});
    obj.flowLayout17:setName("flowLayout17");
    obj.flowLayout17:setStepSizes({});
    obj.flowLayout17:setMinWidth(300);
    obj.flowLayout17:setMaxWidth(1600);
    obj.flowLayout17:setMinScaledWidth(300);
    obj.flowLayout17:setVertAlign("leading");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout17);
    obj.flowPart43:setHeight(140);
    obj.flowPart43:setFrameStyle("frames/panel5/topPanel.xml");
    obj.flowPart43:setMargins({left = 4, right = 4});
    obj.flowPart43:setName("flowPart43");
    obj.flowPart43:setStepSizes({});
    obj.flowPart43:setMinWidth(300);
    obj.flowPart43:setMaxWidth(1600);
    obj.flowPart43:setMinScaledWidth(300);
    obj.flowPart43:setVertAlign("leading");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.flowPart43);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("caracteristicas.tracosPersonalidade");
    obj.textEditor2:setMargins({top=2});
    obj.textEditor2:setFontSize(16);
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setTransparent(true);

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart43);
    obj.label23:setAlign("bottom");
    obj.label23:setAutoSize(true);
    obj.label23:setText("TRAÇOS DE PERSONALIDADE");
    obj.label23:setFontSize(12);
    obj.label23:setVertTextAlign("center");
    obj.label23:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout17);
    obj.flowPart44:setHeight(115);
    obj.flowPart44:setFrameStyle("frames/panel5/centerPanel.xml");
    obj.flowPart44:setMargins({left = 4, right = 4});
    obj.flowPart44:setName("flowPart44");
    obj.flowPart44:setStepSizes({});
    obj.flowPart44:setMinWidth(300);
    obj.flowPart44:setMaxWidth(1600);
    obj.flowPart44:setMinScaledWidth(300);
    obj.flowPart44:setVertAlign("leading");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.flowPart44);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("caracteristicas.ideais");
    obj.textEditor3:setMargins({top=2});
    obj.textEditor3:setFontSize(16);
    obj.textEditor3:setName("textEditor3");
    obj.textEditor3:setTransparent(true);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart44);
    obj.label24:setAlign("bottom");
    obj.label24:setAutoSize(true);
    obj.label24:setText("IDEAIS");
    obj.label24:setFontSize(12);
    obj.label24:setVertTextAlign("center");
    obj.label24:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout17);
    obj.flowPart45:setHeight(115);
    obj.flowPart45:setFrameStyle("frames/panel5/centerPanel.xml");
    obj.flowPart45:setMargins({left = 4, right = 4});
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setStepSizes({});
    obj.flowPart45:setMinWidth(300);
    obj.flowPart45:setMaxWidth(1600);
    obj.flowPart45:setMinScaledWidth(300);
    obj.flowPart45:setVertAlign("leading");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.flowPart45);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("caracteristicas.vinculos");
    obj.textEditor4:setMargins({top=2});
    obj.textEditor4:setFontSize(16);
    obj.textEditor4:setName("textEditor4");
    obj.textEditor4:setTransparent(true);

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart45);
    obj.label25:setAlign("bottom");
    obj.label25:setAutoSize(true);
    obj.label25:setText("VÍNCULOS");
    obj.label25:setFontSize(12);
    obj.label25:setVertTextAlign("center");
    obj.label25:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout17);
    obj.flowPart46:setHeight(115);
    obj.flowPart46:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.flowPart46:setMargins({left = 4, right = 4});
    obj.flowPart46:setName("flowPart46");
    obj.flowPart46:setStepSizes({});
    obj.flowPart46:setMinWidth(300);
    obj.flowPart46:setMaxWidth(1600);
    obj.flowPart46:setMinScaledWidth(300);
    obj.flowPart46:setVertAlign("leading");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.flowPart46);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("caracteristicas.fraquezas");
    obj.textEditor5:setMargins({top=2});
    obj.textEditor5:setFontSize(16);
    obj.textEditor5:setName("textEditor5");
    obj.textEditor5:setTransparent(true);

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart46);
    obj.label26:setAlign("bottom");
    obj.label26:setAutoSize(true);
    obj.label26:setText("FRAQUEZAS");
    obj.label26:setFontSize(12);
    obj.label26:setVertTextAlign("center");
    obj.label26:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout15);
    obj.flowPart47:setHeight(515);
    obj.flowPart47:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart47:setMargins({left = 4, right = 4});
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setStepSizes({});
    obj.flowPart47:setMinWidth(300);
    obj.flowPart47:setMaxWidth(1600);
    obj.flowPart47:setMinScaledWidth(300);
    obj.flowPart47:setVertAlign("leading");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.flowPart47);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("caracteristicas.caracteristicasETracoes");
    obj.textEditor6:setMargins({top=2});
    obj.textEditor6:setFontSize(16);
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setTransparent(true);

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart47);
    obj.label27:setAlign("bottom");
    obj.label27:setAutoSize(true);
    obj.label27:setText("CARACTERÍSTICAS E TRAÇOS");
    obj.label27:setFontSize(12);
    obj.label27:setVertTextAlign("center");
    obj.label27:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.fraCaracteristicasLayout);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setMinScaledWidth(290);
    obj.flowLayout18:setHorzAlign("center");
    obj.flowLayout18:setLineSpacing(10);
    obj.flowLayout18:setMargins({top=5});
    obj.flowLayout18:setName("flowLayout18");
    obj.flowLayout18:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout18:setVertAlign("leading");

    obj.fraAliadosOrganizacoes = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraAliadosOrganizacoes:setParent(obj.flowLayout18);
    obj.fraAliadosOrganizacoes:setName("fraAliadosOrganizacoes");
    obj.fraAliadosOrganizacoes:setAutoHeight(true);
    obj.fraAliadosOrganizacoes:setFrameStyle("frames/panel5/frame.xml");
    obj.fraAliadosOrganizacoes:setMargins({left = 4, right = 4});
    obj.fraAliadosOrganizacoes:setHorzAlign("center");
    obj.fraAliadosOrganizacoes:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraAliadosOrganizacoes:setMinScaledWidth(300);
    obj.fraAliadosOrganizacoes:setVertAlign("leading");

    obj.prtAliados = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.prtAliados:setParent(obj.fraAliadosOrganizacoes);
    obj.prtAliados:setName("prtAliados");
    obj.prtAliados:setMinWidth(300);
    obj.prtAliados:setMaxWidth(1600);
    obj.prtAliados:setMinScaledWidth(290);
    obj.prtAliados:setHeight(420);
    obj.prtAliados:setAvoidScale(true);
    obj.prtAliados:setMargins({left=1, right=1, top=2, bottom=2});
    obj.prtAliados:setVertAlign("leading");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.prtAliados);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("aliados.aliadosEOrganizacoes");
    obj.textEditor7:setMargins({top=2, left=4, right=4});
    obj.textEditor7:setFontSize(16);
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setTransparent(true);

    obj.prtFaccao = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.prtFaccao:setParent(obj.fraAliadosOrganizacoes);
    obj.prtFaccao:setName("prtFaccao");
    obj.prtFaccao:setStepSizes({260, 310});
    obj.prtFaccao:setMaxScaledWidth(310);
    obj.prtFaccao:setAvoidScale(true);
    obj.prtFaccao:setHeight(350);
    obj.prtFaccao:setFrameStyle("frames/panel4transp/frame.xml");
    obj.prtFaccao:setMargins({left=4, right=4, bottom=4, top=4});
    obj.prtFaccao:setMinScaledWidth(300);
    obj.prtFaccao:setVertAlign("leading");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.prtFaccao);
    obj.label28:setAlign("top");
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setText("FACÇÃO");
    obj.label28:setFontSize(11);
    obj.label28:setFontColor("gray");
    obj.label28:setMargins({left=4, right=4});
    obj.label28:setName("label28");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.prtFaccao);
    obj.edit19:setAlign("top");
    obj.edit19:setField("aliados.faccao.nome");
    obj.edit19:setMargins({left=4, right=4});
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(15);
    obj.edit19:setFontColor("white");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.prtFaccao);
    obj.image2:setAlign("client");
    obj.image2:setField("aliados.faccao.simbolo");
    obj.image2:setEditable(true);
    obj.image2:setStyle("proportional");
    obj.image2:setMargins({left=4, right=4});
    obj.image2:setName("image2");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.prtFaccao);
    obj.label29:setAlign("bottom");
    obj.label29:setAutoSize(true);
    obj.label29:setText("SÍMBOLO DA FACÇÃO");
    obj.label29:setFontSize(12);
    obj.label29:setVertTextAlign("center");
    obj.label29:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.fraAliadosOrganizacoes);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.fraAliadosOrganizacoes);
    obj.flowPart48:setMinWidth(200);
    obj.flowPart48:setMaxWidth(1800);
    obj.flowPart48:setHeight(16);
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart48:setVertAlign("leading");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart48);
    obj.label30:setAlign("client");
    obj.label30:setAutoSize(true);
    obj.label30:setText("ALIADOS E ORGANIZAÇÕES");
    obj.label30:setFontSize(12);
    obj.label30:setVertTextAlign("center");
    obj.label30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout18);
    obj.flowPart49:setHeight(515);
    obj.flowPart49:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart49:setMargins({left = 4, right = 4});
    obj.flowPart49:setAdjustHeightToLine(true);
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart49:setMinScaledWidth(300);
    obj.flowPart49:setVertAlign("leading");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowPart49);
    obj.checkBox1:setAlign("right");
    obj.checkBox1:setWidth(15);
    obj.checkBox1:setField("historia.usarEditorFancy");
    obj.checkBox1:setMargins({left = 2, right = -2});
    obj.checkBox1:setName("checkBox1");

    obj.historiaFancy = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.historiaFancy:setParent(obj.flowPart49);
    obj.historiaFancy:setName("historiaFancy");
    obj.historiaFancy:setAlign("client");
    obj.historiaFancy:setField("historia.texto2");
    lfm_setPropAsString(obj.historiaFancy, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.historiaFancy, "defaultFontColor",  "white");
    lfm_setPropAsString(obj.historiaFancy, "hideSelection",  "false");
    lfm_setPropAsString(obj.historiaFancy, "defaultFontSize",  "16");
    lfm_setPropAsString(obj.historiaFancy, "animateImages",  "true");
    obj.historiaFancy:setMargins({top=2});
    obj.historiaFancy:setVisible(false);

    obj.historiaMerda = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.historiaMerda:setParent(obj.flowPart49);
    obj.historiaMerda:setName("historiaMerda");
    obj.historiaMerda:setAlign("client");
    obj.historiaMerda:setField("historia.texto");
    obj.historiaMerda:setMargins({top=2});
    obj.historiaMerda:setFontSize(16);
    obj.historiaMerda:setVisible(true);
    obj.historiaMerda:setTransparent(true);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart49);
    obj.label31:setAlign("bottom");
    obj.label31:setAutoSize(true);
    obj.label31:setText("HISTÓRIA DO PERSONAGEM");
    obj.label31:setFontSize(12);
    obj.label31:setVertTextAlign("center");
    obj.label31:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Equipamento");
    obj.tab3:setName("tab3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.tab3);
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#40000000");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.fraEquipamentoLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraEquipamentoLayout:setParent(obj.scrollBox3);
    obj.fraEquipamentoLayout:setAlign("top");
    obj.fraEquipamentoLayout:setHeight(500);
    obj.fraEquipamentoLayout:setMargins({left=10, right=10, top=10});
    obj.fraEquipamentoLayout:setAutoHeight(true);
    obj.fraEquipamentoLayout:setHorzAlign("center");
    obj.fraEquipamentoLayout:setLineSpacing(3);
    obj.fraEquipamentoLayout:setName("fraEquipamentoLayout");
    obj.fraEquipamentoLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraEquipamentoLayout:setMinScaledWidth(300);
    obj.fraEquipamentoLayout:setVertAlign("leading");


					local function recalcularTamanhoEquipsDefesa()
						self.flwPartEquipDefense.height = self.rclEquipsDefense.height + self.labEquipDefense.height +
														self.layEquipDefenseBottom.height + 
														self.flwPartEquipDefense.padding.top + self.flwPartEquipDefense.padding.bottom + 7;
					end;
				


    obj.flwPartEquipAttack = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwPartEquipAttack:setParent(obj.fraEquipamentoLayout);
    obj.flwPartEquipAttack:setName("flwPartEquipAttack");
    obj.flwPartEquipAttack:setHeight(250);
    obj.flwPartEquipAttack:setFrameStyle("frames/panel5/frame.xml");
    obj.flwPartEquipAttack:setMinScaledWidth(290);
    obj.flwPartEquipAttack:setStepSizes({310, 420, 640, 760, 1150});
    obj.flwPartEquipAttack:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwPartEquipAttack:setVertAlign("leading");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.flwPartEquipAttack);
    obj.layout45:setAlign("client");
    obj.layout45:setMargins({top=10, bottom=10});
    obj.layout45:setName("layout45");

    obj.layEquipAttackLeft = GUI.fromHandle(_obj_newObject("layout"));
    obj.layEquipAttackLeft:setParent(obj.layout45);
    obj.layEquipAttackLeft:setName("layEquipAttackLeft");
    obj.layEquipAttackLeft:setAlign("left");
    obj.layEquipAttackLeft:setWidth(240);

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layEquipAttackLeft);
    obj.label32:setAlign("top");
    obj.label32:setAutoSize(true);
    obj.label32:setText("EQUIPAMENTOS E ATAQUES");
    obj.label32:setFontSize(12);
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.rclEquips = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquips:setParent(obj.layEquipAttackLeft);
    obj.rclEquips:setName("rclEquips");
    obj.rclEquips:setAlign("client");
    obj.rclEquips:setField("equipamentos.ataques");
    obj.rclEquips:setTemplateForm("frmEquipamentoItem2");
    obj.rclEquips:setMinQt(1);
    obj.rclEquips:setHitTest(true);
    obj.rclEquips:setMargins({top=5, bottom=5});

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layEquipAttackLeft);
    obj.button36:setAlign("bottom");
    obj.button36:setText("Novo Item");
    obj.button36:setName("button36");

    obj.dataEquipAttackDetails = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dataEquipAttackDetails:setParent(obj.layout45);
    obj.dataEquipAttackDetails:setName("dataEquipAttackDetails");
    obj.dataEquipAttackDetails:setAlign("client");
    obj.dataEquipAttackDetails:setFrameStyle("frames/panel5/frame.xml");
    obj.dataEquipAttackDetails:setMargins({left=10});
    obj.dataEquipAttackDetails:setEnabled(false);

    obj.layEquipAttackImg = GUI.fromHandle(_obj_newObject("layout"));
    obj.layEquipAttackImg:setParent(obj.dataEquipAttackDetails);
    obj.layEquipAttackImg:setName("layEquipAttackImg");
    obj.layEquipAttackImg:setAlign("left");
    obj.layEquipAttackImg:setWidth(100);

    obj.imgEquipAttackImg = GUI.fromHandle(_obj_newObject("image"));
    obj.imgEquipAttackImg:setParent(obj.layEquipAttackImg);
    obj.imgEquipAttackImg:setName("imgEquipAttackImg");
    obj.imgEquipAttackImg:setAlign("client");
    obj.imgEquipAttackImg:setURL("https://clipartart.com/images/cross-sword-clipart.png");
    obj.imgEquipAttackImg:setShowProgress(false);
    lfm_setPropAsString(obj.imgEquipAttackImg, "animate",  "true");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layEquipAttackImg);
    obj.image3:setAlign("client");
    obj.image3:setField("imagem");
    obj.image3:setShowProgress(false);
    obj.image3:setEditable(true);
    lfm_setPropAsString(obj.image3, "animate",  "true");
    obj.image3:setName("image3");

    obj.layEquipPropriedades = GUI.fromHandle(_obj_newObject("layout"));
    obj.layEquipPropriedades:setParent(obj.dataEquipAttackDetails);
    obj.layEquipPropriedades:setName("layEquipPropriedades");
    obj.layEquipPropriedades:setAlign("left");
    obj.layEquipPropriedades:setWidth(150);
    obj.layEquipPropriedades:setMargins({left=5});

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layEquipPropriedades);
    obj.label33:setText("PROPRIEDADES");
    obj.label33:setAlign("top");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");
    obj.label33:setFontSize(12);
    obj.label33:setFontColor("#D0D0D0");

    obj.rclProps = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclProps:setParent(obj.layEquipPropriedades);
    obj.rclProps:setName("rclProps");
    obj.rclProps:setAlign("client");
    obj.rclProps:setField("listaPropriedades");
    obj.rclProps:setTemplateForm("frmText");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layEquipPropriedades);
    obj.button37:setAlign("bottom");
    obj.button37:setText("Adicionar Propriedade");
    obj.button37:setName("button37");

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layEquipPropriedades);
    obj.dataLink82:setField("propriedades");
    obj.dataLink82:setName("dataLink82");

    obj.horzLine26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.dataEquipAttackDetails);
    obj.horzLine26:setLeft(153);
    obj.horzLine26:setTop(120);
    obj.horzLine26:setRotationAngle(90);
    obj.horzLine26:setWidth(240);
    obj.horzLine26:setStrokeColor("lightGray");
    obj.horzLine26:setOpacity(0.5);
    obj.horzLine26:setName("horzLine26");

    obj.layPrincipal = GUI.fromHandle(_obj_newObject("layout"));
    obj.layPrincipal:setParent(obj.dataEquipAttackDetails);
    obj.layPrincipal:setAlign("client");
    obj.layPrincipal:setName("layPrincipal");
    obj.layPrincipal:setMargins({left=5});

    obj.optAtaqueLegenda = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.optAtaqueLegenda:setParent(obj.layPrincipal);
    obj.optAtaqueLegenda:setAlign("top");
    obj.optAtaqueLegenda:setHeight(15);
    obj.optAtaqueLegenda:setName("optAtaqueLegenda");
    obj.optAtaqueLegenda:setHorzAlign("justify");
    obj.optAtaqueLegenda:setStepSizes({310, 420, 640, 760, 1150});
    obj.optAtaqueLegenda:setMinScaledWidth(300);
    obj.optAtaqueLegenda:setMargins({left=1, right=1, top=2, bottom=2});
    obj.optAtaqueLegenda:setVertAlign("leading");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.optAtaqueLegenda);
    obj.flowPart50:setHeight(15);
    obj.flowPart50:setMinWidth(20);
    obj.flowPart50:setMaxWidth(20);
    obj.flowPart50:setName("flowPart50");
    obj.flowPart50:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart50:setVertAlign("leading");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart50);
    obj.label34:setAlign("client");
    obj.label34:setText("");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("leading");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setName("label34");
    obj.label34:setFontSize(12);
    obj.label34:setFontColor("#D0D0D0");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.optAtaqueLegenda);
    obj.flowPart51:setHeight(15);
    obj.flowPart51:setMinWidth(80);
    obj.flowPart51:setMaxWidth(150);
    obj.flowPart51:setName("flowPart51");
    obj.flowPart51:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart51:setVertAlign("leading");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart51);
    obj.label35:setAlign("client");
    obj.label35:setText("ALCANCE");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setVertTextAlign("leading");
    obj.label35:setWordWrap(true);
    obj.label35:setTextTrimming("none");
    obj.label35:setName("label35");
    obj.label35:setFontSize(12);
    obj.label35:setFontColor("#D0D0D0");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.optAtaqueLegenda);
    obj.flowPart52:setHeight(15);
    obj.flowPart52:setMinWidth(110);
    obj.flowPart52:setMaxWidth(200);
    obj.flowPart52:setName("flowPart52");
    obj.flowPart52:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart52:setVertAlign("leading");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart52);
    obj.label36:setAlign("client");
    obj.label36:setText("ACERTO");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setVertTextAlign("leading");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setName("label36");
    obj.label36:setFontSize(12);
    obj.label36:setFontColor("#D0D0D0");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.optAtaqueLegenda);
    obj.flowPart53:setHeight(15);
    obj.flowPart53:setMinWidth(80);
    obj.flowPart53:setMaxWidth(170);
    obj.flowPart53:setName("flowPart53");
    obj.flowPart53:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart53:setVertAlign("leading");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart53);
    obj.label37:setAlign("client");
    obj.label37:setText("DANO");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("leading");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setName("label37");
    obj.label37:setFontSize(12);
    obj.label37:setFontColor("#D0D0D0");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.optAtaqueLegenda);
    obj.flowPart54:setHeight(15);
    obj.flowPart54:setMinWidth(80);
    obj.flowPart54:setMaxWidth(180);
    obj.flowPart54:setName("flowPart54");
    obj.flowPart54:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart54:setVertAlign("leading");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart54);
    obj.label38:setAlign("client");
    obj.label38:setText("TIPO");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setVertTextAlign("leading");
    obj.label38:setWordWrap(true);
    obj.label38:setTextTrimming("none");
    obj.label38:setName("label38");
    obj.label38:setFontSize(12);
    obj.label38:setFontColor("#D0D0D0");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.optAtaqueLegenda);
    obj.flowPart55:setHeight(15);
    obj.flowPart55:setMinWidth(100);
    obj.flowPart55:setMaxWidth(200);
    obj.flowPart55:setName("flowPart55");
    obj.flowPart55:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart55:setVertAlign("leading");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart55);
    obj.label39:setAlign("client");
    obj.label39:setText("MUNICAO");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setVertTextAlign("leading");
    obj.label39:setWordWrap(true);
    obj.label39:setTextTrimming("none");
    obj.label39:setName("label39");
    obj.label39:setFontSize(12);
    obj.label39:setFontColor("#D0D0D0");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.optAtaqueLegenda);
    obj.flowPart56:setHeight(15);
    obj.flowPart56:setMinWidth(25);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setName("flowPart56");
    obj.flowPart56:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart56:setVertAlign("leading");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart56);
    obj.label40:setAlign("client");
    obj.label40:setText("QTD");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setVertTextAlign("leading");
    obj.label40:setWordWrap(true);
    obj.label40:setTextTrimming("none");
    obj.label40:setName("label40");
    obj.label40:setFontSize(12);
    obj.label40:setFontColor("#D0D0D0");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.optAtaqueLegenda);
    obj.flowPart57:setHeight(25);
    obj.flowPart57:setMinWidth(25);
    obj.flowPart57:setMaxWidth(25);
    obj.flowPart57:setName("flowPart57");
    obj.flowPart57:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart57:setVertAlign("leading");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart57);
    obj.label41:setAlign("client");
    obj.label41:setText("");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("leading");
    obj.label41:setWordWrap(true);
    obj.label41:setTextTrimming("none");
    obj.label41:setName("label41");
    obj.label41:setFontSize(12);
    obj.label41:setFontColor("#D0D0D0");

    obj.optAtaquePadrao = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.optAtaquePadrao:setParent(obj.layPrincipal);
    obj.optAtaquePadrao:setAlign("top");
    obj.optAtaquePadrao:setHeight(30);
    obj.optAtaquePadrao:setWidth(200);
    obj.optAtaquePadrao:setName("optAtaquePadrao");
    obj.optAtaquePadrao:setHorzAlign("justify");
    obj.optAtaquePadrao:setStepSizes({310, 420, 640, 760, 1150});
    obj.optAtaquePadrao:setMinScaledWidth(300);
    obj.optAtaquePadrao:setMargins({left=1, right=1, top=2, bottom=2});
    obj.optAtaquePadrao:setVertAlign("leading");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.optAtaquePadrao);
    obj.flowPart58:setHeight(30);
    obj.flowPart58:setWidth(20);
    obj.flowPart58:setName("flowPart58");
    obj.flowPart58:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart58:setVertAlign("leading");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowPart58);
    obj.checkBox2:setAlign("client");
    obj.checkBox2:setChecked(true);
    obj.checkBox2:setEnabled(false);
    obj.checkBox2:setName("checkBox2");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.optAtaquePadrao);
    obj.flowPart59:setHeight(30);
    obj.flowPart59:setMinWidth(80);
    obj.flowPart59:setMaxWidth(150);
    obj.flowPart59:setAvoidScale(true);
    obj.flowPart59:setName("flowPart59");
    obj.flowPart59:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart59:setVertAlign("leading");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart59);
    obj.edit20:setAlign("client");
    obj.edit20:setField("alcance");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setFontSize(13);
    obj.edit20:setTransparent(false);
    obj.edit20:setHitTest(true);
    obj.edit20:setName("edit20");
    obj.edit20:setHeight(30);
    obj.edit20:setWidth(195);
    obj.edit20:setFontColor("white");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.optAtaquePadrao);
    obj.flowPart60:setHeight(30);
    obj.flowPart60:setMinWidth(110);
    obj.flowPart60:setMaxWidth(200);
    obj.flowPart60:setAvoidScale(true);
    obj.flowPart60:setName("flowPart60");
    obj.flowPart60:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart60:setVertAlign("leading");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart60);
    obj.edit21:setAlign("client");
    obj.edit21:setField("ataque");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setFontSize(13);
    obj.edit21:setTransparent(false);
    obj.edit21:setHitTest(true);
    obj.edit21:setName("edit21");
    obj.edit21:setHeight(30);
    obj.edit21:setWidth(195);
    obj.edit21:setFontColor("white");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.optAtaquePadrao);
    obj.flowPart61:setHeight(30);
    obj.flowPart61:setMinWidth(80);
    obj.flowPart61:setMaxWidth(170);
    obj.flowPart61:setAvoidScale(true);
    obj.flowPart61:setName("flowPart61");
    obj.flowPart61:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart61:setVertAlign("leading");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart61);
    obj.edit22:setAlign("client");
    obj.edit22:setField("dano");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setFontSize(13);
    obj.edit22:setTransparent(false);
    obj.edit22:setHitTest(true);
    obj.edit22:setName("edit22");
    obj.edit22:setHeight(30);
    obj.edit22:setWidth(195);
    obj.edit22:setFontColor("white");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.optAtaquePadrao);
    obj.flowPart62:setHeight(30);
    obj.flowPart62:setMinWidth(80);
    obj.flowPart62:setMaxWidth(180);
    obj.flowPart62:setAvoidScale(true);
    obj.flowPart62:setName("flowPart62");
    obj.flowPart62:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart62:setVertAlign("leading");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart62);
    obj.edit23:setAlign("client");
    obj.edit23:setField("tipo");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setFontSize(13);
    obj.edit23:setTransparent(false);
    obj.edit23:setHitTest(true);
    obj.edit23:setName("edit23");
    obj.edit23:setHeight(30);
    obj.edit23:setWidth(195);
    obj.edit23:setFontColor("white");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.optAtaquePadrao);
    obj.flowPart63:setHeight(30);
    obj.flowPart63:setMinWidth(100);
    obj.flowPart63:setMaxWidth(200);
    obj.flowPart63:setAvoidScale(true);
    obj.flowPart63:setName("flowPart63");
    obj.flowPart63:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart63:setVertAlign("leading");

    obj.cbOptAtaqueMunicao = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cbOptAtaqueMunicao:setParent(obj.flowPart63);
    obj.cbOptAtaqueMunicao:setName("cbOptAtaqueMunicao");
    obj.cbOptAtaqueMunicao:setAlign("client");
    obj.cbOptAtaqueMunicao:setField("municao");
    obj.cbOptAtaqueMunicao:setHint("Qual 'contador' deve ser gasto");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.flowPart63);
    obj.dataLink83:setField("contadoresMudaram");
    obj.dataLink83:setName("dataLink83");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.optAtaquePadrao);
    obj.flowPart64:setHeight(30);
    obj.flowPart64:setMinWidth(25);
    obj.flowPart64:setMaxWidth(50);
    obj.flowPart64:setAvoidScale(true);
    obj.flowPart64:setName("flowPart64");
    obj.flowPart64:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart64:setVertAlign("leading");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart64);
    obj.edit24:setAlign("client");
    obj.edit24:setField("qtMunicao");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setFontSize(13);
    obj.edit24:setTransparent(false);
    obj.edit24:setHitTest(true);
    obj.edit24:setName("edit24");
    obj.edit24:setHeight(30);
    obj.edit24:setWidth(195);
    obj.edit24:setFontColor("white");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.optAtaquePadrao);
    obj.flowPart65:setHeight(30);
    obj.flowPart65:setWidth(25);
    obj.flowPart65:setName("flowPart65");
    obj.flowPart65:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart65:setVertAlign("leading");

    obj.btnApagar = GUI.fromHandle(_obj_newObject("button"));
    obj.btnApagar:setParent(obj.flowPart65);
    obj.btnApagar:setName("btnApagar");
    obj.btnApagar:setAlign("client");
    obj.btnApagar:setText("✖");
    obj.btnApagar:setEnabled(false);

    obj.horzLine27 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine27:setParent(obj.layPrincipal);
    obj.horzLine27:setAlign("top");
    obj.horzLine27:setStrokeColor("lightGray");
    obj.horzLine27:setOpacity(0.3);
    obj.horzLine27:setMargins({top=2});
    obj.horzLine27:setName("horzLine27");

    obj.rclOptsAttack = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclOptsAttack:setParent(obj.layPrincipal);
    obj.rclOptsAttack:setName("rclOptsAttack");
    obj.rclOptsAttack:setAlign("client");
    obj.rclOptsAttack:setField("optsAttack");
    obj.rclOptsAttack:setTemplateForm("frmOptAtaque");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layPrincipal);
    obj.button38:setAlign("bottom");
    obj.button38:setText("Add Attack Option");
    obj.button38:setMargins({left=200, right=200});
    obj.button38:setName("button38");

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layPrincipal);
    obj.dataLink84:setField("contadoresMudaram");
    obj.dataLink84:setName("dataLink84");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.fraEquipamentoLayout);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flwPartEquipDefense = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwPartEquipDefense:setParent(obj.fraEquipamentoLayout);
    obj.flwPartEquipDefense:setName("flwPartEquipDefense");
    obj.flwPartEquipDefense:setHeight(500);
    obj.flwPartEquipDefense:setFrameStyle("frames/panel5/frame.xml");
    obj.flwPartEquipDefense:setMinScaledWidth(290);
    obj.flwPartEquipDefense:setStepSizes({310, 420, 640, 760, 1150});
    obj.flwPartEquipDefense:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwPartEquipDefense:setVertAlign("leading");

    obj.labEquipDefense = GUI.fromHandle(_obj_newObject("label"));
    obj.labEquipDefense:setParent(obj.flwPartEquipDefense);
    obj.labEquipDefense:setName("labEquipDefense");
    obj.labEquipDefense:setAlign("top");
    obj.labEquipDefense:setAutoSize(true);
    obj.labEquipDefense:setText("EQUIPAMENTOS DE DEFESA");
    obj.labEquipDefense:setFontSize(12);
    obj.labEquipDefense:setVertTextAlign("center");
    obj.labEquipDefense:setHorzTextAlign("center");
    lfm_setPropAsString(obj.labEquipDefense, "fontStyle",  "bold");
    obj.labEquipDefense:setFontColor("white");

    obj.rclEquipsDefense = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipsDefense:setParent(obj.flwPartEquipDefense);
    obj.rclEquipsDefense:setName("rclEquipsDefense");
    obj.rclEquipsDefense:setAlign("top");
    obj.rclEquipsDefense:setField("equipamentos.defesas");
    obj.rclEquipsDefense:setTemplateForm("frmEquipamentoItemDefesa");
    obj.rclEquipsDefense:setAutoHeight(true);
    obj.rclEquipsDefense:setMinHeight(5);
    obj.rclEquipsDefense:setMinQt(1);
    obj.rclEquipsDefense:setHitTest(false);

    obj.layEquipDefenseBottom = GUI.fromHandle(_obj_newObject("layout"));
    obj.layEquipDefenseBottom:setParent(obj.flwPartEquipDefense);
    obj.layEquipDefenseBottom:setName("layEquipDefenseBottom");
    obj.layEquipDefenseBottom:setAlign("top");
    obj.layEquipDefenseBottom:setHeight(40);

    obj.btnEquipDefenseNew = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEquipDefenseNew:setParent(obj.layEquipDefenseBottom);
    obj.btnEquipDefenseNew:setName("btnEquipDefenseNew");
    obj.btnEquipDefenseNew:setAlign("left");
    obj.btnEquipDefenseNew:setText("Novo Item");
    obj.btnEquipDefenseNew:setWidth(160);
    obj.btnEquipDefenseNew:setMargins({top=4, bottom=4});

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.fraEquipamentoLayout);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.fraEquipamentoLayout);
    obj.flowPart66:setHeight(420);
    obj.flowPart66:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart66:setMinScaledWidth(290);
    obj.flowPart66:setName("flowPart66");
    obj.flowPart66:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart66:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart66:setVertAlign("leading");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.flowPart66);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(140);
    obj.layout46:setMargins({left=-20});
    obj.layout46:setName("layout46");

    obj.frame3 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame3:setParent(obj.layout46);
    obj.frame3:setFrameStyle("frames/dinheiro/pecaCobre.xml");
    obj.frame3:setWidth(228);
    obj.frame3:setHeight(64);
    obj.frame3:setAlign("top");
    obj.frame3:setMargins({});
    obj.frame3:setName("frame3");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.frame3);
    obj.label42:setFrameRegion("RegiaoSmallTitulo");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setVertTextAlign("center");
    obj.label42:setText("PC");
    obj.label42:setTextTrimming("none");
    obj.label42:setWordWrap(false);
    obj.label42:setName("label42");
    obj.label42:setFontSize(12);
    obj.label42:setFontColor("#D0D0D0");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.frame3);
    obj.edit25:setFrameRegion("RegiaoValor");
    obj.edit25:setField("equipamento.dinheiro.pc");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(19);
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("white");
    obj.edit25:setTransparent(true);

    obj.frame4 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame4:setParent(obj.layout46);
    obj.frame4:setFrameStyle("frames/dinheiro/pecaCobre.xml");
    obj.frame4:setWidth(228);
    obj.frame4:setHeight(64);
    obj.frame4:setAlign("top");
    obj.frame4:setMargins({top=6});
    obj.frame4:setName("frame4");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.frame4);
    obj.label43:setFrameRegion("RegiaoSmallTitulo");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setVertTextAlign("center");
    obj.label43:setText("PP");
    obj.label43:setTextTrimming("none");
    obj.label43:setWordWrap(false);
    obj.label43:setName("label43");
    obj.label43:setFontSize(12);
    obj.label43:setFontColor("#D0D0D0");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.frame4);
    obj.edit26:setFrameRegion("RegiaoValor");
    obj.edit26:setField("equipamento.dinheiro.pp");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(19);
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("white");
    obj.edit26:setTransparent(true);

    obj.frame5 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame5:setParent(obj.layout46);
    obj.frame5:setFrameStyle("frames/dinheiro/pecaCobre.xml");
    obj.frame5:setWidth(228);
    obj.frame5:setHeight(64);
    obj.frame5:setAlign("top");
    obj.frame5:setMargins({top=6});
    obj.frame5:setName("frame5");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.frame5);
    obj.label44:setFrameRegion("RegiaoSmallTitulo");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setVertTextAlign("center");
    obj.label44:setText("PE");
    obj.label44:setTextTrimming("none");
    obj.label44:setWordWrap(false);
    obj.label44:setName("label44");
    obj.label44:setFontSize(12);
    obj.label44:setFontColor("#D0D0D0");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.frame5);
    obj.edit27:setFrameRegion("RegiaoValor");
    obj.edit27:setField("equipamento.dinheiro.pe");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(19);
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("white");
    obj.edit27:setTransparent(true);

    obj.frame6 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame6:setParent(obj.layout46);
    obj.frame6:setFrameStyle("frames/dinheiro/pecaCobre.xml");
    obj.frame6:setWidth(228);
    obj.frame6:setHeight(64);
    obj.frame6:setAlign("top");
    obj.frame6:setMargins({top=6});
    obj.frame6:setName("frame6");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.frame6);
    obj.label45:setFrameRegion("RegiaoSmallTitulo");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setVertTextAlign("center");
    obj.label45:setText("PO");
    obj.label45:setTextTrimming("none");
    obj.label45:setWordWrap(false);
    obj.label45:setName("label45");
    obj.label45:setFontSize(12);
    obj.label45:setFontColor("#D0D0D0");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.frame6);
    obj.edit28:setFrameRegion("RegiaoValor");
    obj.edit28:setField("equipamento.dinheiro.po");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(19);
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("white");
    obj.edit28:setTransparent(true);

    obj.frame7 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame7:setParent(obj.layout46);
    obj.frame7:setFrameStyle("frames/dinheiro/pecaCobre.xml");
    obj.frame7:setWidth(228);
    obj.frame7:setHeight(64);
    obj.frame7:setAlign("top");
    obj.frame7:setMargins({top=6});
    obj.frame7:setName("frame7");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.frame7);
    obj.label46:setFrameRegion("RegiaoSmallTitulo");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setVertTextAlign("center");
    obj.label46:setText("PL");
    obj.label46:setTextTrimming("none");
    obj.label46:setWordWrap(false);
    obj.label46:setName("label46");
    obj.label46:setFontSize(12);
    obj.label46:setFontColor("#D0D0D0");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.frame7);
    obj.edit29:setFrameRegion("RegiaoValor");
    obj.edit29:setField("equipamento.dinheiro.pl");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(19);
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("white");
    obj.edit29:setTransparent(true);

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout46);
    obj.checkBox3:setAlign("top");
    obj.checkBox3:setField("equipamento.outros_melhorado");
    obj.checkBox3:setMargins({left=75, top=15});
    obj.checkBox3:setName("checkBox3");

    obj.editorFancy = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.editorFancy:setParent(obj.flowPart66);
    obj.editorFancy:setName("editorFancy");
    obj.editorFancy:setAlign("client");
    obj.editorFancy:setMargins({left=10, right=10});
    obj.editorFancy:setColor("black");
    obj.editorFancy:setVisible(false);

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.editorFancy);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setMargins({left=0.1, right=0.1, top=0.1, bottom=0.1});
    obj.richEdit1:setField("equipamento.outros2");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    lfm_setPropAsString(obj.richEdit1, "hideSelection",  "false");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "15");
    lfm_setPropAsString(obj.richEdit1, "animateImages",  "true");
    obj.richEdit1:setName("richEdit1");

    obj.editorMerda = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.editorMerda:setParent(obj.flowPart66);
    obj.editorMerda:setName("editorMerda");
    obj.editorMerda:setAlign("client");
    obj.editorMerda:setMargins({left=10, right=10});
    obj.editorMerda:setField("equipamento.outros");
    obj.editorMerda:setFontSize(15);
    obj.editorMerda:setVisible(true);

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart66);
    obj.label47:setAlign("bottom");
    obj.label47:setAutoSize(true);
    obj.label47:setText("OUTROS EQUIPAMENTOS");
    obj.label47:setFontSize(12);
    obj.label47:setVertTextAlign("center");
    obj.label47:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("Magias");
    obj.tab4:setName("tab4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.tab4);
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#40000000");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);

    obj.popMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.rectangle4);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setAlign("client");
    obj.popMagia:setMargins({left=100,right=100,top=100,bottom=100});
    obj.popMagia:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popMagia, "autoScopeNode",  "false");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.popMagia);
    obj.edit30:setAlign("top");
    obj.edit30:setField("nome");
    obj.edit30:setTextPrompt("NOME DA MAGIA");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");
    obj.edit30:setFontSize(15);
    obj.edit30:setFontColor("white");

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.popMagia);
    obj.flowLayout19:setAlign("top");
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setMaxControlsPerLine(2);
    obj.flowLayout19:setMargins({bottom=4});
    obj.flowLayout19:setHorzAlign("center");
    obj.flowLayout19:setName("flowLayout19");
    obj.flowLayout19:setVertAlign("leading");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout19);
    obj.flowPart67:setMinWidth(30);
    obj.flowPart67:setMaxWidth(800);
    obj.flowPart67:setHeight(35);
    obj.flowPart67:setName("flowPart67");
    obj.flowPart67:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart67:setVertAlign("leading");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart67);
    obj.label48:setAlign("top");
    obj.label48:setFontSize(10);
    obj.label48:setText("TEMPO FORMULAÇÃO");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setWordWrap(true);
    obj.label48:setTextTrimming("none");
    obj.label48:setAutoSize(true);
    obj.label48:setName("label48");
    obj.label48:setFontColor("#D0D0D0");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart67);
    obj.edit31:setAlign("client");
    obj.edit31:setField("tempoDeFormulacao");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("white");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout19);
    obj.flowPart68:setMinWidth(30);
    obj.flowPart68:setMaxWidth(800);
    obj.flowPart68:setHeight(35);
    obj.flowPart68:setName("flowPart68");
    obj.flowPart68:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart68:setVertAlign("leading");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart68);
    obj.label49:setAlign("top");
    obj.label49:setFontSize(10);
    obj.label49:setText("ALCANCE");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWordWrap(true);
    obj.label49:setTextTrimming("none");
    obj.label49:setAutoSize(true);
    obj.label49:setName("label49");
    obj.label49:setFontColor("#D0D0D0");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart68);
    obj.edit32:setAlign("client");
    obj.edit32:setField("alcance");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("white");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout19);
    obj.flowPart69:setMinWidth(30);
    obj.flowPart69:setMaxWidth(800);
    obj.flowPart69:setHeight(35);
    obj.flowPart69:setName("flowPart69");
    obj.flowPart69:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart69:setVertAlign("leading");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart69);
    obj.label50:setAlign("top");
    obj.label50:setFontSize(10);
    obj.label50:setText("COMPONENTES");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setWordWrap(true);
    obj.label50:setTextTrimming("none");
    obj.label50:setAutoSize(true);
    obj.label50:setName("label50");
    obj.label50:setFontColor("#D0D0D0");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart69);
    obj.edit33:setAlign("client");
    obj.edit33:setField("componentes");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("white");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout19);
    obj.flowPart70:setMinWidth(30);
    obj.flowPart70:setMaxWidth(800);
    obj.flowPart70:setHeight(35);
    obj.flowPart70:setName("flowPart70");
    obj.flowPart70:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart70:setVertAlign("leading");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart70);
    obj.label51:setAlign("top");
    obj.label51:setFontSize(10);
    obj.label51:setText("DURAÇÃO");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setWordWrap(true);
    obj.label51:setTextTrimming("none");
    obj.label51:setAutoSize(true);
    obj.label51:setName("label51");
    obj.label51:setFontColor("#D0D0D0");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart70);
    obj.edit34:setAlign("client");
    obj.edit34:setField("duracao");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("white");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout19);
    obj.flowPart71:setMinWidth(30);
    obj.flowPart71:setMaxWidth(800);
    obj.flowPart71:setHeight(35);
    obj.flowPart71:setName("flowPart71");
    obj.flowPart71:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart71:setVertAlign("leading");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart71);
    obj.label52:setAlign("top");
    obj.label52:setFontSize(10);
    obj.label52:setText("Ataque");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setWordWrap(true);
    obj.label52:setTextTrimming("none");
    obj.label52:setAutoSize(true);
    obj.label52:setName("label52");
    obj.label52:setFontColor("#D0D0D0");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart71);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setField("ataque");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setItems({'Sem ataque', 'Ataque Corpo-a-Corpo', 'Ataque a Distância'});
    obj.comboBox1:setName("comboBox1");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout19);
    obj.flowPart72:setMinWidth(30);
    obj.flowPart72:setMaxWidth(800);
    obj.flowPart72:setHeight(35);
    obj.flowPart72:setName("flowPart72");
    obj.flowPart72:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart72:setVertAlign("leading");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart72);
    obj.label53:setAlign("top");
    obj.label53:setFontSize(10);
    obj.label53:setText("Teste de Resistência");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setWordWrap(true);
    obj.label53:setTextTrimming("none");
    obj.label53:setAutoSize(true);
    obj.label53:setName("label53");
    obj.label53:setFontColor("#D0D0D0");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart72);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setField("resistencia");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setFontSize(12);
    obj.comboBox2:setItems({'Nenhum', 'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox2:setName("comboBox2");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.popMagia);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("descricao");
    obj.textEditor8:setName("textEditor8");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.rectangle4);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.fraMagiasLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraMagiasLayout:setParent(obj.scrollBox4);
    obj.fraMagiasLayout:setAlign("top");
    obj.fraMagiasLayout:setHeight(500);
    obj.fraMagiasLayout:setMargins({left=10, right=10, top=10});
    obj.fraMagiasLayout:setAutoHeight(true);
    obj.fraMagiasLayout:setHorzAlign("center");
    obj.fraMagiasLayout:setLineSpacing(3);
    obj.fraMagiasLayout:setName("fraMagiasLayout");
    obj.fraMagiasLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraMagiasLayout:setMinScaledWidth(300);
    obj.fraMagiasLayout:setVertAlign("leading");

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.fraMagiasLayout);
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setMinScaledWidth(290);
    obj.flowLayout20:setHorzAlign("center");
    obj.flowLayout20:setName("flowLayout20");
    obj.flowLayout20:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout20:setVertAlign("leading");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout20);
    obj.flowPart73:setMinWidth(320);
    obj.flowPart73:setMaxWidth(1600);
    obj.flowPart73:setFrameStyle("frames/banner/magicGroup.xml");
    obj.flowPart73:setHeight(175);
    obj.flowPart73:setVertAlign("center");
    obj.flowPart73:setAvoidScale(true);
    obj.flowPart73:setName("flowPart73");
    obj.flowPart73:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart73:setMinScaledWidth(300);
    obj.flowPart73:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.flowPart73);
    obj.layout47:setAlign("client");
    obj.layout47:setName("layout47");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout47);
    obj.edit35:setField("magias.classeConjuradora");
    obj.edit35:setFontSize(17);
    obj.edit35:setAlign("client");
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("white");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setTransparent(true);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout47);
    obj.label54:setAlign("bottom");
    obj.label54:setText("CLASSE CONJURADORA");
    obj.label54:setAutoSize(true);
    obj.label54:setMargins({left=3});
    obj.label54:setName("label54");
    obj.label54:setFontSize(12);
    obj.label54:setFontColor("#D0D0D0");

    obj.fraUpperGridMagias = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridMagias:setParent(obj.flowLayout20);
    obj.fraUpperGridMagias:setMinWidth(320);
    obj.fraUpperGridMagias:setMaxWidth(1600);
    obj.fraUpperGridMagias:setName("fraUpperGridMagias");
    obj.fraUpperGridMagias:setAvoidScale(true);
    obj.fraUpperGridMagias:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridMagias:setAutoHeight(true);
    obj.fraUpperGridMagias:setVertAlign("trailing");
    obj.fraUpperGridMagias:setMaxControlsPerLine(2);
    obj.fraUpperGridMagias:setHorzAlign("center");
    obj.fraUpperGridMagias:setLineSpacing(8);
    obj.fraUpperGridMagias:setStepSizes({310, 360, 420});
    obj.fraUpperGridMagias:setMinScaledWidth(300);
    obj.fraUpperGridMagias:setMaxScaledWidth(340);
    obj.fraUpperGridMagias:setMargins({left=1, right=1, top=2, bottom=2});

    obj.upperGridMagicBox1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox1:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicBox1:setHeight(60);
    obj.upperGridMagicBox1:setMinScaledWidth(145);
    obj.upperGridMagicBox1:setMinWidth(145);
    obj.upperGridMagicBox1:setMaxWidth(160);
    obj.upperGridMagicBox1:setMaxScaledWidth(160);
    obj.upperGridMagicBox1:setAvoidScale(true);
    obj.upperGridMagicBox1:setName("upperGridMagicBox1");
    obj.upperGridMagicBox1:setVertAlign("leading");
    obj.upperGridMagicBox1:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicBox1, "_RecalcSize",
						function ()
							self.upperGridMagicBox1:setHeight(self.panupperGridMagicBox1:getHeight() + self.labupperGridMagicBox1:getHeight());
						end);
				


    obj.panupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.panupperGridMagicBox1:setName("panupperGridMagicBox1");
    obj.panupperGridMagicBox1:setAlign("top");
    obj.panupperGridMagicBox1:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox1:setHeight(50);

    obj.cmbupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbupperGridMagicBox1:setParent(obj.panupperGridMagicBox1);
    obj.cmbupperGridMagicBox1:setName("cmbupperGridMagicBox1");
    obj.cmbupperGridMagicBox1:setFrameRegion("ContentRegion");
    obj.cmbupperGridMagicBox1:setField("magias.habilidadeDeConjuracao");
    obj.cmbupperGridMagicBox1:setItems({'', 'INTELIGÊNCIA', 'SABEDORIA', 'CARISMA'});
    obj.cmbupperGridMagicBox1:setValues({'', 'int', 'sab', 'car'});
    obj.cmbupperGridMagicBox1:setHorzTextAlign("center");
    obj.cmbupperGridMagicBox1:setVertTextAlign("center");
    obj.cmbupperGridMagicBox1:setFontSize(13);
    obj.cmbupperGridMagicBox1:setTransparent(true);

    obj.labupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.labupperGridMagicBox1:setName("labupperGridMagicBox1");
    obj.labupperGridMagicBox1:setAlign("top");
    obj.labupperGridMagicBox1:setAutoSize(true);
    obj.labupperGridMagicBox1:setText("HABILIDADE DE CONJURAÇÃO");
    obj.labupperGridMagicBox1:setHorzTextAlign("center");
    obj.labupperGridMagicBox1:setVertTextAlign("leading");
    obj.labupperGridMagicBox1:setWordWrap(true);
    obj.labupperGridMagicBox1:setTextTrimming("none");
    obj.labupperGridMagicBox1:setFontSize(12);
    obj.labupperGridMagicBox1:setFontColor("#D0D0D0");

self.upperGridMagicBox1._RecalcSize();	


    obj.upperGridMagicBox2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox2:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicBox2:setHeight(60);
    obj.upperGridMagicBox2:setMinScaledWidth(100);
    obj.upperGridMagicBox2:setMinWidth(100);
    obj.upperGridMagicBox2:setMaxWidth(160);
    obj.upperGridMagicBox2:setMaxScaledWidth(160);
    obj.upperGridMagicBox2:setAvoidScale(true);
    obj.upperGridMagicBox2:setName("upperGridMagicBox2");
    obj.upperGridMagicBox2:setVertAlign("leading");
    obj.upperGridMagicBox2:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicBox2, "_RecalcSize",
						function ()
							self.upperGridMagicBox2:setHeight(self.panupperGridMagicBox2:getHeight() + self.labupperGridMagicBox2:getHeight());
						end);
				


    obj.panupperGridMagicBox2 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox2:setParent(obj.upperGridMagicBox2);
    obj.panupperGridMagicBox2:setName("panupperGridMagicBox2");
    obj.panupperGridMagicBox2:setAlign("top");
    obj.panupperGridMagicBox2:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox2:setHeight(50);

    obj.labupperGridMagicBox2val = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox2val:setParent(obj.panupperGridMagicBox2);
    obj.labupperGridMagicBox2val:setName("labupperGridMagicBox2val");
    obj.labupperGridMagicBox2val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox2val:setField("magias.cdDaMagia");
    obj.labupperGridMagicBox2val:setFontSize(22);
    obj.labupperGridMagicBox2val:setVertTextAlign("center");
    obj.labupperGridMagicBox2val:setHorzTextAlign("center");
    obj.labupperGridMagicBox2val:setFontColor("white");

    obj.labupperGridMagicBox2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox2:setParent(obj.upperGridMagicBox2);
    obj.labupperGridMagicBox2:setName("labupperGridMagicBox2");
    obj.labupperGridMagicBox2:setAlign("top");
    obj.labupperGridMagicBox2:setAutoSize(true);
    obj.labupperGridMagicBox2:setText("CD DA MAGIA");
    obj.labupperGridMagicBox2:setHorzTextAlign("center");
    obj.labupperGridMagicBox2:setVertTextAlign("leading");
    obj.labupperGridMagicBox2:setWordWrap(true);
    obj.labupperGridMagicBox2:setTextTrimming("none");
    obj.labupperGridMagicBox2:setFontSize(12);
    obj.labupperGridMagicBox2:setFontColor("#D0D0D0");

self.upperGridMagicBox2._RecalcSize();	


    obj.upperGridMagicBox3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox3:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicBox3:setHeight(60);
    obj.upperGridMagicBox3:setMinScaledWidth(100);
    obj.upperGridMagicBox3:setMinWidth(100);
    obj.upperGridMagicBox3:setMaxWidth(160);
    obj.upperGridMagicBox3:setMaxScaledWidth(160);
    obj.upperGridMagicBox3:setAvoidScale(true);
    obj.upperGridMagicBox3:setName("upperGridMagicBox3");
    obj.upperGridMagicBox3:setVertAlign("leading");
    obj.upperGridMagicBox3:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicBox3, "_RecalcSize",
						function ()
							self.upperGridMagicBox3:setHeight(self.panupperGridMagicBox3:getHeight() + self.labupperGridMagicBox3:getHeight());
						end);
				


    obj.panupperGridMagicBox3 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox3:setParent(obj.upperGridMagicBox3);
    obj.panupperGridMagicBox3:setName("panupperGridMagicBox3");
    obj.panupperGridMagicBox3:setAlign("top");
    obj.panupperGridMagicBox3:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox3:setHeight(50);

    obj.labupperGridMagicBox3val = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox3val:setParent(obj.panupperGridMagicBox3);
    obj.labupperGridMagicBox3val:setName("labupperGridMagicBox3val");
    obj.labupperGridMagicBox3val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox3val:setField("magias.bonusAtaqueSTR");
    obj.labupperGridMagicBox3val:setFontSize(22);
    obj.labupperGridMagicBox3val:setVertTextAlign("center");
    obj.labupperGridMagicBox3val:setHorzTextAlign("center");
    obj.labupperGridMagicBox3val:setFontColor("white");

    obj.labupperGridMagicBox3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox3:setParent(obj.upperGridMagicBox3);
    obj.labupperGridMagicBox3:setName("labupperGridMagicBox3");
    obj.labupperGridMagicBox3:setAlign("top");
    obj.labupperGridMagicBox3:setAutoSize(true);
    obj.labupperGridMagicBox3:setText("BÔNUS DE ATAQUE DE MAGIA");
    obj.labupperGridMagicBox3:setHorzTextAlign("center");
    obj.labupperGridMagicBox3:setVertTextAlign("leading");
    obj.labupperGridMagicBox3:setWordWrap(true);
    obj.labupperGridMagicBox3:setTextTrimming("none");
    obj.labupperGridMagicBox3:setFontSize(12);
    obj.labupperGridMagicBox3:setFontColor("#D0D0D0");

self.upperGridMagicBox3._RecalcSize();	


    obj.upperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox1:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicEditBox1:setHeight(60);
    obj.upperGridMagicEditBox1:setMinScaledWidth(100);
    obj.upperGridMagicEditBox1:setMinWidth(100);
    obj.upperGridMagicEditBox1:setMaxWidth(160);
    obj.upperGridMagicEditBox1:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox1:setAvoidScale(true);
    obj.upperGridMagicEditBox1:setName("upperGridMagicEditBox1");
    obj.upperGridMagicEditBox1:setVertAlign("leading");
    obj.upperGridMagicEditBox1:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicEditBox1, "_RecalcSize",
						function ()
							self.upperGridMagicEditBox1:setHeight(self.panupperGridMagicEditBox1:getHeight() + self.labupperGridMagicEditBox1:getHeight());
						end);
				


    obj.panupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.panupperGridMagicEditBox1:setName("panupperGridMagicEditBox1");
    obj.panupperGridMagicEditBox1:setAlign("top");
    obj.panupperGridMagicEditBox1:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox1:setHeight(50);

    obj.edtupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox1:setParent(obj.panupperGridMagicEditBox1);
    obj.edtupperGridMagicEditBox1:setName("edtupperGridMagicEditBox1");
    obj.edtupperGridMagicEditBox1:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox1:setField("magias.spKi");
    obj.edtupperGridMagicEditBox1:setFontSize(22);
    obj.edtupperGridMagicEditBox1:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox1:setFontColor("white");
    obj.edtupperGridMagicEditBox1:setTransparent(true);

    obj.labupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.labupperGridMagicEditBox1:setName("labupperGridMagicEditBox1");
    obj.labupperGridMagicEditBox1:setAlign("top");
    obj.labupperGridMagicEditBox1:setAutoSize(true);
    obj.labupperGridMagicEditBox1:setText("SP/Ki");
    obj.labupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox1:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox1:setWordWrap(true);
    obj.labupperGridMagicEditBox1:setTextTrimming("none");
    obj.labupperGridMagicEditBox1:setFontSize(12);
    obj.labupperGridMagicEditBox1:setFontColor("#D0D0D0");

self.upperGridMagicEditBox1._RecalcSize();	


    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.fraMagiasLayout);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.fraMagiasLayout);
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setMaxColumns(3);
    obj.flowLayout21:setHorzAlign("center");
    obj.flowLayout21:setOrientation("vertical");
    obj.flowLayout21:setName("flowLayout21");
    obj.flowLayout21:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout21:setMinScaledWidth(300);
    obj.flowLayout21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout21:setVertAlign("leading");

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowLayout21);
    obj.flowLayout22:setHeight(100);
    obj.flowLayout22:setAvoidScale(true);
    obj.flowLayout22:setMaxControlsPerLine(1);
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setName("flowLayout22");
    obj.flowLayout22:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout22:setStepSizes({310, 360, 420, 600});
    obj.flowLayout22:setMinScaledWidth(300);
    obj.flowLayout22:setMaxScaledWidth(600);
    obj.flowLayout22:setVertAlign("leading");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout22);
    obj.flowPart74:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart74:setName("flowPart74");
    obj.flowPart74:setAvoidScale(true);
    obj.flowPart74:setMinScaledWidth(280);
    obj.flowPart74:setMinWidth(300);
    obj.flowPart74:setMaxWidth(600);
    obj.flowPart74:setHeight(80);
    obj.flowPart74:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart74:setVertAlign("leading");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart74);
    obj.label55:setFrameRegion("RegiaoSmallTitulo");
    obj.label55:setText("0");
    obj.label55:setName("label55");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setVertTextAlign("center");
    obj.label55:setFontSize(18);
    obj.label55:setFontColor("white");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart74);
    obj.label56:setFrameRegion("RegiaoConteudo");
    obj.label56:setText("PRECES E TRUQUES");
    obj.label56:setFontSize(15);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setVertTextAlign("center");
    obj.label56:setName("label56");
    obj.label56:setFontColor("white");

    obj.flwMagicRecordList1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList1:setParent(obj.flowLayout22);
    obj.flwMagicRecordList1:setMinWidth(300);
    obj.flwMagicRecordList1:setMaxWidth(600);
    obj.flwMagicRecordList1:setMinScaledWidth(280);
    obj.flwMagicRecordList1:setName("flwMagicRecordList1");
    obj.flwMagicRecordList1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList1:setVertAlign("leading");


					rawset(self.flwMagicRecordList1, "_recalcHeight", 
						function ()
							self.flwMagicRecordList1.height = self.rclflwMagicRecordList1.height +
														self.layBottomflwMagicRecordList1.height + 
														self.flwMagicRecordList1.padding.top + self.flwMagicRecordList1.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.rclflwMagicRecordList1:setName("rclflwMagicRecordList1");
    obj.rclflwMagicRecordList1:setAlign("top");
    obj.rclflwMagicRecordList1:setField("magias.magias.nivel0");
    obj.rclflwMagicRecordList1:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclflwMagicRecordList1:setAutoHeight(true);
    obj.rclflwMagicRecordList1:setMinHeight(5);
    obj.rclflwMagicRecordList1:setHitTest(false);
    obj.rclflwMagicRecordList1:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.layBottomflwMagicRecordList1:setName("layBottomflwMagicRecordList1");
    obj.layBottomflwMagicRecordList1:setAlign("top");
    obj.layBottomflwMagicRecordList1:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList1:setParent(obj.layBottomflwMagicRecordList1);
    obj.btnNovoflwMagicRecordList1:setName("btnNovoflwMagicRecordList1");
    obj.btnNovoflwMagicRecordList1:setAlign("left");
    obj.btnNovoflwMagicRecordList1:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList1:setWidth(160);
    obj.btnNovoflwMagicRecordList1:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList1:setParent(obj.layBottomflwMagicRecordList1);
    obj.btnImportflwMagicRecordList1:setName("btnImportflwMagicRecordList1");
    obj.btnImportflwMagicRecordList1:setAlign("left");
    obj.btnImportflwMagicRecordList1:setText("Importar Magia");
    obj.btnImportflwMagicRecordList1:setWidth(160);
    obj.btnImportflwMagicRecordList1:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList1._recalcHeight();


    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.flowLayout21);
    obj.flowLayout23:setHeight(100);
    obj.flowLayout23:setAvoidScale(true);
    obj.flowLayout23:setMaxControlsPerLine(1);
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setName("flowLayout23");
    obj.flowLayout23:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout23:setStepSizes({310, 360, 420, 600});
    obj.flowLayout23:setMinScaledWidth(300);
    obj.flowLayout23:setMaxScaledWidth(600);
    obj.flowLayout23:setVertAlign("leading");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout23);
    obj.flowPart75:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart75:setName("flowPart75");
    obj.flowPart75:setAvoidScale(true);
    obj.flowPart75:setMinScaledWidth(280);
    obj.flowPart75:setMinWidth(300);
    obj.flowPart75:setMaxWidth(600);
    obj.flowPart75:setHeight(80);
    obj.flowPart75:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart75:setVertAlign("leading");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart75);
    obj.label57:setFrameRegion("RegiaoSmallTitulo");
    obj.label57:setText("1");
    obj.label57:setName("label57");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setVertTextAlign("center");
    obj.label57:setFontSize(18);
    obj.label57:setFontColor("white");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart75);
    obj.edit36:setFrameRegion("RegiaoConteudo1");
    obj.edit36:setField("magias.espacosTotais1");
    obj.edit36:setName("edit36");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setFontSize(18);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontColor("white");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart75);
    obj.edit37:setFrameRegion("RegiaoConteudo2");
    obj.edit37:setField("magias.espacosGastos1");
    obj.edit37:setName("edit37");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setFontSize(18);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontColor("white");

    obj.flwMagicRecordList2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList2:setParent(obj.flowLayout23);
    obj.flwMagicRecordList2:setMinWidth(300);
    obj.flwMagicRecordList2:setMaxWidth(600);
    obj.flwMagicRecordList2:setMinScaledWidth(280);
    obj.flwMagicRecordList2:setName("flwMagicRecordList2");
    obj.flwMagicRecordList2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList2:setVertAlign("leading");


					rawset(self.flwMagicRecordList2, "_recalcHeight", 
						function ()
							self.flwMagicRecordList2.height = self.rclflwMagicRecordList2.height +
														self.layBottomflwMagicRecordList2.height + 
														self.flwMagicRecordList2.padding.top + self.flwMagicRecordList2.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.rclflwMagicRecordList2:setName("rclflwMagicRecordList2");
    obj.rclflwMagicRecordList2:setAlign("top");
    obj.rclflwMagicRecordList2:setField("magias.magias.nivel1");
    obj.rclflwMagicRecordList2:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList2:setAutoHeight(true);
    obj.rclflwMagicRecordList2:setMinHeight(5);
    obj.rclflwMagicRecordList2:setHitTest(false);
    obj.rclflwMagicRecordList2:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.layBottomflwMagicRecordList2:setName("layBottomflwMagicRecordList2");
    obj.layBottomflwMagicRecordList2:setAlign("top");
    obj.layBottomflwMagicRecordList2:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList2:setParent(obj.layBottomflwMagicRecordList2);
    obj.btnNovoflwMagicRecordList2:setName("btnNovoflwMagicRecordList2");
    obj.btnNovoflwMagicRecordList2:setAlign("left");
    obj.btnNovoflwMagicRecordList2:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList2:setWidth(160);
    obj.btnNovoflwMagicRecordList2:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList2:setParent(obj.layBottomflwMagicRecordList2);
    obj.btnImportflwMagicRecordList2:setName("btnImportflwMagicRecordList2");
    obj.btnImportflwMagicRecordList2:setAlign("left");
    obj.btnImportflwMagicRecordList2:setText("Importar Magia");
    obj.btnImportflwMagicRecordList2:setWidth(160);
    obj.btnImportflwMagicRecordList2:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList2._recalcHeight();


    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowLayout21);
    obj.flowLayout24:setHeight(100);
    obj.flowLayout24:setAvoidScale(true);
    obj.flowLayout24:setMaxControlsPerLine(1);
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setName("flowLayout24");
    obj.flowLayout24:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout24:setStepSizes({310, 360, 420, 600});
    obj.flowLayout24:setMinScaledWidth(300);
    obj.flowLayout24:setMaxScaledWidth(600);
    obj.flowLayout24:setVertAlign("leading");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout24);
    obj.flowPart76:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart76:setName("flowPart76");
    obj.flowPart76:setAvoidScale(true);
    obj.flowPart76:setMinScaledWidth(280);
    obj.flowPart76:setMinWidth(300);
    obj.flowPart76:setMaxWidth(600);
    obj.flowPart76:setHeight(80);
    obj.flowPart76:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart76:setVertAlign("leading");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart76);
    obj.label58:setFrameRegion("RegiaoSmallTitulo");
    obj.label58:setText("2");
    obj.label58:setName("label58");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setVertTextAlign("center");
    obj.label58:setFontSize(18);
    obj.label58:setFontColor("white");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart76);
    obj.edit38:setFrameRegion("RegiaoConteudo1");
    obj.edit38:setField("magias.espacosTotais2");
    obj.edit38:setName("edit38");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setFontSize(18);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontColor("white");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart76);
    obj.edit39:setFrameRegion("RegiaoConteudo2");
    obj.edit39:setField("magias.espacosGastos2");
    obj.edit39:setName("edit39");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setFontSize(18);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontColor("white");

    obj.flwMagicRecordList3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList3:setParent(obj.flowLayout24);
    obj.flwMagicRecordList3:setMinWidth(300);
    obj.flwMagicRecordList3:setMaxWidth(600);
    obj.flwMagicRecordList3:setMinScaledWidth(280);
    obj.flwMagicRecordList3:setName("flwMagicRecordList3");
    obj.flwMagicRecordList3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList3:setVertAlign("leading");


					rawset(self.flwMagicRecordList3, "_recalcHeight", 
						function ()
							self.flwMagicRecordList3.height = self.rclflwMagicRecordList3.height +
														self.layBottomflwMagicRecordList3.height + 
														self.flwMagicRecordList3.padding.top + self.flwMagicRecordList3.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.rclflwMagicRecordList3:setName("rclflwMagicRecordList3");
    obj.rclflwMagicRecordList3:setAlign("top");
    obj.rclflwMagicRecordList3:setField("magias.magias.nivel2");
    obj.rclflwMagicRecordList3:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList3:setAutoHeight(true);
    obj.rclflwMagicRecordList3:setMinHeight(5);
    obj.rclflwMagicRecordList3:setHitTest(false);
    obj.rclflwMagicRecordList3:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.layBottomflwMagicRecordList3:setName("layBottomflwMagicRecordList3");
    obj.layBottomflwMagicRecordList3:setAlign("top");
    obj.layBottomflwMagicRecordList3:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList3:setParent(obj.layBottomflwMagicRecordList3);
    obj.btnNovoflwMagicRecordList3:setName("btnNovoflwMagicRecordList3");
    obj.btnNovoflwMagicRecordList3:setAlign("left");
    obj.btnNovoflwMagicRecordList3:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList3:setWidth(160);
    obj.btnNovoflwMagicRecordList3:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList3:setParent(obj.layBottomflwMagicRecordList3);
    obj.btnImportflwMagicRecordList3:setName("btnImportflwMagicRecordList3");
    obj.btnImportflwMagicRecordList3:setAlign("left");
    obj.btnImportflwMagicRecordList3:setText("Importar Magia");
    obj.btnImportflwMagicRecordList3:setWidth(160);
    obj.btnImportflwMagicRecordList3:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList3._recalcHeight();


    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.flowLayout21);
    obj.flowLayout25:setHeight(100);
    obj.flowLayout25:setAvoidScale(true);
    obj.flowLayout25:setMaxControlsPerLine(1);
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setName("flowLayout25");
    obj.flowLayout25:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout25:setStepSizes({310, 360, 420, 600});
    obj.flowLayout25:setMinScaledWidth(300);
    obj.flowLayout25:setMaxScaledWidth(600);
    obj.flowLayout25:setVertAlign("leading");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout25);
    obj.flowPart77:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart77:setName("flowPart77");
    obj.flowPart77:setAvoidScale(true);
    obj.flowPart77:setMinScaledWidth(280);
    obj.flowPart77:setMinWidth(300);
    obj.flowPart77:setMaxWidth(600);
    obj.flowPart77:setHeight(80);
    obj.flowPart77:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart77:setVertAlign("leading");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart77);
    obj.label59:setFrameRegion("RegiaoSmallTitulo");
    obj.label59:setText("3");
    obj.label59:setName("label59");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setVertTextAlign("center");
    obj.label59:setFontSize(18);
    obj.label59:setFontColor("white");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart77);
    obj.edit40:setFrameRegion("RegiaoConteudo1");
    obj.edit40:setField("magias.espacosTotais3");
    obj.edit40:setName("edit40");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setFontSize(18);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontColor("white");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart77);
    obj.edit41:setFrameRegion("RegiaoConteudo2");
    obj.edit41:setField("magias.espacosGastos3");
    obj.edit41:setName("edit41");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setFontSize(18);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontColor("white");

    obj.flwMagicRecordList4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList4:setParent(obj.flowLayout25);
    obj.flwMagicRecordList4:setMinWidth(300);
    obj.flwMagicRecordList4:setMaxWidth(600);
    obj.flwMagicRecordList4:setMinScaledWidth(280);
    obj.flwMagicRecordList4:setName("flwMagicRecordList4");
    obj.flwMagicRecordList4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList4:setVertAlign("leading");


					rawset(self.flwMagicRecordList4, "_recalcHeight", 
						function ()
							self.flwMagicRecordList4.height = self.rclflwMagicRecordList4.height +
														self.layBottomflwMagicRecordList4.height + 
														self.flwMagicRecordList4.padding.top + self.flwMagicRecordList4.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.rclflwMagicRecordList4:setName("rclflwMagicRecordList4");
    obj.rclflwMagicRecordList4:setAlign("top");
    obj.rclflwMagicRecordList4:setField("magias.magias.nivel3");
    obj.rclflwMagicRecordList4:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList4:setAutoHeight(true);
    obj.rclflwMagicRecordList4:setMinHeight(5);
    obj.rclflwMagicRecordList4:setHitTest(false);
    obj.rclflwMagicRecordList4:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.layBottomflwMagicRecordList4:setName("layBottomflwMagicRecordList4");
    obj.layBottomflwMagicRecordList4:setAlign("top");
    obj.layBottomflwMagicRecordList4:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList4:setParent(obj.layBottomflwMagicRecordList4);
    obj.btnNovoflwMagicRecordList4:setName("btnNovoflwMagicRecordList4");
    obj.btnNovoflwMagicRecordList4:setAlign("left");
    obj.btnNovoflwMagicRecordList4:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList4:setWidth(160);
    obj.btnNovoflwMagicRecordList4:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList4:setParent(obj.layBottomflwMagicRecordList4);
    obj.btnImportflwMagicRecordList4:setName("btnImportflwMagicRecordList4");
    obj.btnImportflwMagicRecordList4:setAlign("left");
    obj.btnImportflwMagicRecordList4:setText("Importar Magia");
    obj.btnImportflwMagicRecordList4:setWidth(160);
    obj.btnImportflwMagicRecordList4:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList4._recalcHeight();


    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.flowLayout21);
    obj.flowLayout26:setHeight(100);
    obj.flowLayout26:setAvoidScale(true);
    obj.flowLayout26:setMaxControlsPerLine(1);
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setName("flowLayout26");
    obj.flowLayout26:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout26:setStepSizes({310, 360, 420, 600});
    obj.flowLayout26:setMinScaledWidth(300);
    obj.flowLayout26:setMaxScaledWidth(600);
    obj.flowLayout26:setVertAlign("leading");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout26);
    obj.flowPart78:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart78:setName("flowPart78");
    obj.flowPart78:setAvoidScale(true);
    obj.flowPart78:setMinScaledWidth(280);
    obj.flowPart78:setMinWidth(300);
    obj.flowPart78:setMaxWidth(600);
    obj.flowPart78:setHeight(80);
    obj.flowPart78:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart78:setVertAlign("leading");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart78);
    obj.label60:setFrameRegion("RegiaoSmallTitulo");
    obj.label60:setText("4");
    obj.label60:setName("label60");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setVertTextAlign("center");
    obj.label60:setFontSize(18);
    obj.label60:setFontColor("white");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart78);
    obj.edit42:setFrameRegion("RegiaoConteudo1");
    obj.edit42:setField("magias.espacosTotais4");
    obj.edit42:setName("edit42");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setFontSize(18);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontColor("white");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart78);
    obj.edit43:setFrameRegion("RegiaoConteudo2");
    obj.edit43:setField("magias.espacosGastos4");
    obj.edit43:setName("edit43");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setFontSize(18);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontColor("white");

    obj.flwMagicRecordList5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList5:setParent(obj.flowLayout26);
    obj.flwMagicRecordList5:setMinWidth(300);
    obj.flwMagicRecordList5:setMaxWidth(600);
    obj.flwMagicRecordList5:setMinScaledWidth(280);
    obj.flwMagicRecordList5:setName("flwMagicRecordList5");
    obj.flwMagicRecordList5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList5:setVertAlign("leading");


					rawset(self.flwMagicRecordList5, "_recalcHeight", 
						function ()
							self.flwMagicRecordList5.height = self.rclflwMagicRecordList5.height +
														self.layBottomflwMagicRecordList5.height + 
														self.flwMagicRecordList5.padding.top + self.flwMagicRecordList5.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.rclflwMagicRecordList5:setName("rclflwMagicRecordList5");
    obj.rclflwMagicRecordList5:setAlign("top");
    obj.rclflwMagicRecordList5:setField("magias.magias.nivel4");
    obj.rclflwMagicRecordList5:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList5:setAutoHeight(true);
    obj.rclflwMagicRecordList5:setMinHeight(5);
    obj.rclflwMagicRecordList5:setHitTest(false);
    obj.rclflwMagicRecordList5:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.layBottomflwMagicRecordList5:setName("layBottomflwMagicRecordList5");
    obj.layBottomflwMagicRecordList5:setAlign("top");
    obj.layBottomflwMagicRecordList5:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList5:setParent(obj.layBottomflwMagicRecordList5);
    obj.btnNovoflwMagicRecordList5:setName("btnNovoflwMagicRecordList5");
    obj.btnNovoflwMagicRecordList5:setAlign("left");
    obj.btnNovoflwMagicRecordList5:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList5:setWidth(160);
    obj.btnNovoflwMagicRecordList5:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList5:setParent(obj.layBottomflwMagicRecordList5);
    obj.btnImportflwMagicRecordList5:setName("btnImportflwMagicRecordList5");
    obj.btnImportflwMagicRecordList5:setAlign("left");
    obj.btnImportflwMagicRecordList5:setText("Importar Magia");
    obj.btnImportflwMagicRecordList5:setWidth(160);
    obj.btnImportflwMagicRecordList5:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList5._recalcHeight();


    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.flowLayout21);
    obj.flowLayout27:setHeight(100);
    obj.flowLayout27:setAvoidScale(true);
    obj.flowLayout27:setMaxControlsPerLine(1);
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setName("flowLayout27");
    obj.flowLayout27:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout27:setStepSizes({310, 360, 420, 600});
    obj.flowLayout27:setMinScaledWidth(300);
    obj.flowLayout27:setMaxScaledWidth(600);
    obj.flowLayout27:setVertAlign("leading");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout27);
    obj.flowPart79:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart79:setName("flowPart79");
    obj.flowPart79:setAvoidScale(true);
    obj.flowPart79:setMinScaledWidth(280);
    obj.flowPart79:setMinWidth(300);
    obj.flowPart79:setMaxWidth(600);
    obj.flowPart79:setHeight(80);
    obj.flowPart79:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart79:setVertAlign("leading");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart79);
    obj.label61:setFrameRegion("RegiaoSmallTitulo");
    obj.label61:setText("5");
    obj.label61:setName("label61");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setVertTextAlign("center");
    obj.label61:setFontSize(18);
    obj.label61:setFontColor("white");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart79);
    obj.edit44:setFrameRegion("RegiaoConteudo1");
    obj.edit44:setField("magias.espacosTotais5");
    obj.edit44:setName("edit44");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setFontSize(18);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontColor("white");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart79);
    obj.edit45:setFrameRegion("RegiaoConteudo2");
    obj.edit45:setField("magias.espacosGastos5");
    obj.edit45:setName("edit45");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setFontSize(18);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontColor("white");

    obj.flwMagicRecordList6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList6:setParent(obj.flowLayout27);
    obj.flwMagicRecordList6:setMinWidth(300);
    obj.flwMagicRecordList6:setMaxWidth(600);
    obj.flwMagicRecordList6:setMinScaledWidth(280);
    obj.flwMagicRecordList6:setName("flwMagicRecordList6");
    obj.flwMagicRecordList6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList6:setVertAlign("leading");


					rawset(self.flwMagicRecordList6, "_recalcHeight", 
						function ()
							self.flwMagicRecordList6.height = self.rclflwMagicRecordList6.height +
														self.layBottomflwMagicRecordList6.height + 
														self.flwMagicRecordList6.padding.top + self.flwMagicRecordList6.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.rclflwMagicRecordList6:setName("rclflwMagicRecordList6");
    obj.rclflwMagicRecordList6:setAlign("top");
    obj.rclflwMagicRecordList6:setField("magias.magias.nivel5");
    obj.rclflwMagicRecordList6:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList6:setAutoHeight(true);
    obj.rclflwMagicRecordList6:setMinHeight(5);
    obj.rclflwMagicRecordList6:setHitTest(false);
    obj.rclflwMagicRecordList6:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.layBottomflwMagicRecordList6:setName("layBottomflwMagicRecordList6");
    obj.layBottomflwMagicRecordList6:setAlign("top");
    obj.layBottomflwMagicRecordList6:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList6:setParent(obj.layBottomflwMagicRecordList6);
    obj.btnNovoflwMagicRecordList6:setName("btnNovoflwMagicRecordList6");
    obj.btnNovoflwMagicRecordList6:setAlign("left");
    obj.btnNovoflwMagicRecordList6:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList6:setWidth(160);
    obj.btnNovoflwMagicRecordList6:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList6:setParent(obj.layBottomflwMagicRecordList6);
    obj.btnImportflwMagicRecordList6:setName("btnImportflwMagicRecordList6");
    obj.btnImportflwMagicRecordList6:setAlign("left");
    obj.btnImportflwMagicRecordList6:setText("Importar Magia");
    obj.btnImportflwMagicRecordList6:setWidth(160);
    obj.btnImportflwMagicRecordList6:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList6._recalcHeight();


    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.flowLayout21);
    obj.flowLayout28:setHeight(100);
    obj.flowLayout28:setAvoidScale(true);
    obj.flowLayout28:setMaxControlsPerLine(1);
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setName("flowLayout28");
    obj.flowLayout28:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout28:setStepSizes({310, 360, 420, 600});
    obj.flowLayout28:setMinScaledWidth(300);
    obj.flowLayout28:setMaxScaledWidth(600);
    obj.flowLayout28:setVertAlign("leading");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout28);
    obj.flowPart80:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart80:setName("flowPart80");
    obj.flowPart80:setAvoidScale(true);
    obj.flowPart80:setMinScaledWidth(280);
    obj.flowPart80:setMinWidth(300);
    obj.flowPart80:setMaxWidth(600);
    obj.flowPart80:setHeight(80);
    obj.flowPart80:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart80:setVertAlign("leading");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart80);
    obj.label62:setFrameRegion("RegiaoSmallTitulo");
    obj.label62:setText("6");
    obj.label62:setName("label62");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setVertTextAlign("center");
    obj.label62:setFontSize(18);
    obj.label62:setFontColor("white");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart80);
    obj.edit46:setFrameRegion("RegiaoConteudo1");
    obj.edit46:setField("magias.espacosTotais6");
    obj.edit46:setName("edit46");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setFontSize(18);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontColor("white");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart80);
    obj.edit47:setFrameRegion("RegiaoConteudo2");
    obj.edit47:setField("magias.espacosGastos6");
    obj.edit47:setName("edit47");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setFontSize(18);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontColor("white");

    obj.flwMagicRecordList7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList7:setParent(obj.flowLayout28);
    obj.flwMagicRecordList7:setMinWidth(300);
    obj.flwMagicRecordList7:setMaxWidth(600);
    obj.flwMagicRecordList7:setMinScaledWidth(280);
    obj.flwMagicRecordList7:setName("flwMagicRecordList7");
    obj.flwMagicRecordList7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList7:setVertAlign("leading");


					rawset(self.flwMagicRecordList7, "_recalcHeight", 
						function ()
							self.flwMagicRecordList7.height = self.rclflwMagicRecordList7.height +
														self.layBottomflwMagicRecordList7.height + 
														self.flwMagicRecordList7.padding.top + self.flwMagicRecordList7.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.rclflwMagicRecordList7:setName("rclflwMagicRecordList7");
    obj.rclflwMagicRecordList7:setAlign("top");
    obj.rclflwMagicRecordList7:setField("magias.magias.nivel6");
    obj.rclflwMagicRecordList7:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList7:setAutoHeight(true);
    obj.rclflwMagicRecordList7:setMinHeight(5);
    obj.rclflwMagicRecordList7:setHitTest(false);
    obj.rclflwMagicRecordList7:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.layBottomflwMagicRecordList7:setName("layBottomflwMagicRecordList7");
    obj.layBottomflwMagicRecordList7:setAlign("top");
    obj.layBottomflwMagicRecordList7:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList7:setParent(obj.layBottomflwMagicRecordList7);
    obj.btnNovoflwMagicRecordList7:setName("btnNovoflwMagicRecordList7");
    obj.btnNovoflwMagicRecordList7:setAlign("left");
    obj.btnNovoflwMagicRecordList7:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList7:setWidth(160);
    obj.btnNovoflwMagicRecordList7:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList7:setParent(obj.layBottomflwMagicRecordList7);
    obj.btnImportflwMagicRecordList7:setName("btnImportflwMagicRecordList7");
    obj.btnImportflwMagicRecordList7:setAlign("left");
    obj.btnImportflwMagicRecordList7:setText("Importar Magia");
    obj.btnImportflwMagicRecordList7:setWidth(160);
    obj.btnImportflwMagicRecordList7:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList7._recalcHeight();


    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.flowLayout21);
    obj.flowLayout29:setHeight(100);
    obj.flowLayout29:setAvoidScale(true);
    obj.flowLayout29:setMaxControlsPerLine(1);
    obj.flowLayout29:setAutoHeight(true);
    obj.flowLayout29:setName("flowLayout29");
    obj.flowLayout29:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout29:setStepSizes({310, 360, 420, 600});
    obj.flowLayout29:setMinScaledWidth(300);
    obj.flowLayout29:setMaxScaledWidth(600);
    obj.flowLayout29:setVertAlign("leading");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout29);
    obj.flowPart81:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart81:setName("flowPart81");
    obj.flowPart81:setAvoidScale(true);
    obj.flowPart81:setMinScaledWidth(280);
    obj.flowPart81:setMinWidth(300);
    obj.flowPart81:setMaxWidth(600);
    obj.flowPart81:setHeight(80);
    obj.flowPart81:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart81:setVertAlign("leading");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart81);
    obj.label63:setFrameRegion("RegiaoSmallTitulo");
    obj.label63:setText("7");
    obj.label63:setName("label63");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setVertTextAlign("center");
    obj.label63:setFontSize(18);
    obj.label63:setFontColor("white");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart81);
    obj.edit48:setFrameRegion("RegiaoConteudo1");
    obj.edit48:setField("magias.espacosTotais7");
    obj.edit48:setName("edit48");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setFontSize(18);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontColor("white");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart81);
    obj.edit49:setFrameRegion("RegiaoConteudo2");
    obj.edit49:setField("magias.espacosGastos7");
    obj.edit49:setName("edit49");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setFontSize(18);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontColor("white");

    obj.flwMagicRecordList8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList8:setParent(obj.flowLayout29);
    obj.flwMagicRecordList8:setMinWidth(300);
    obj.flwMagicRecordList8:setMaxWidth(600);
    obj.flwMagicRecordList8:setMinScaledWidth(280);
    obj.flwMagicRecordList8:setName("flwMagicRecordList8");
    obj.flwMagicRecordList8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList8:setVertAlign("leading");


					rawset(self.flwMagicRecordList8, "_recalcHeight", 
						function ()
							self.flwMagicRecordList8.height = self.rclflwMagicRecordList8.height +
														self.layBottomflwMagicRecordList8.height + 
														self.flwMagicRecordList8.padding.top + self.flwMagicRecordList8.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.rclflwMagicRecordList8:setName("rclflwMagicRecordList8");
    obj.rclflwMagicRecordList8:setAlign("top");
    obj.rclflwMagicRecordList8:setField("magias.magias.nivel7");
    obj.rclflwMagicRecordList8:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList8:setAutoHeight(true);
    obj.rclflwMagicRecordList8:setMinHeight(5);
    obj.rclflwMagicRecordList8:setHitTest(false);
    obj.rclflwMagicRecordList8:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.layBottomflwMagicRecordList8:setName("layBottomflwMagicRecordList8");
    obj.layBottomflwMagicRecordList8:setAlign("top");
    obj.layBottomflwMagicRecordList8:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList8:setParent(obj.layBottomflwMagicRecordList8);
    obj.btnNovoflwMagicRecordList8:setName("btnNovoflwMagicRecordList8");
    obj.btnNovoflwMagicRecordList8:setAlign("left");
    obj.btnNovoflwMagicRecordList8:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList8:setWidth(160);
    obj.btnNovoflwMagicRecordList8:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList8:setParent(obj.layBottomflwMagicRecordList8);
    obj.btnImportflwMagicRecordList8:setName("btnImportflwMagicRecordList8");
    obj.btnImportflwMagicRecordList8:setAlign("left");
    obj.btnImportflwMagicRecordList8:setText("Importar Magia");
    obj.btnImportflwMagicRecordList8:setWidth(160);
    obj.btnImportflwMagicRecordList8:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList8._recalcHeight();


    obj.flowLayout30 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.flowLayout21);
    obj.flowLayout30:setHeight(100);
    obj.flowLayout30:setAvoidScale(true);
    obj.flowLayout30:setMaxControlsPerLine(1);
    obj.flowLayout30:setAutoHeight(true);
    obj.flowLayout30:setName("flowLayout30");
    obj.flowLayout30:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout30:setStepSizes({310, 360, 420, 600});
    obj.flowLayout30:setMinScaledWidth(300);
    obj.flowLayout30:setMaxScaledWidth(600);
    obj.flowLayout30:setVertAlign("leading");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout30);
    obj.flowPart82:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart82:setName("flowPart82");
    obj.flowPart82:setAvoidScale(true);
    obj.flowPart82:setMinScaledWidth(280);
    obj.flowPart82:setMinWidth(300);
    obj.flowPart82:setMaxWidth(600);
    obj.flowPart82:setHeight(80);
    obj.flowPart82:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart82:setVertAlign("leading");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart82);
    obj.label64:setFrameRegion("RegiaoSmallTitulo");
    obj.label64:setText("8");
    obj.label64:setName("label64");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setVertTextAlign("center");
    obj.label64:setFontSize(18);
    obj.label64:setFontColor("white");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart82);
    obj.edit50:setFrameRegion("RegiaoConteudo1");
    obj.edit50:setField("magias.espacosTotais8");
    obj.edit50:setName("edit50");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setFontSize(18);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontColor("white");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart82);
    obj.edit51:setFrameRegion("RegiaoConteudo2");
    obj.edit51:setField("magias.espacosGastos8");
    obj.edit51:setName("edit51");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setFontSize(18);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontColor("white");

    obj.flwMagicRecordList9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList9:setParent(obj.flowLayout30);
    obj.flwMagicRecordList9:setMinWidth(300);
    obj.flwMagicRecordList9:setMaxWidth(600);
    obj.flwMagicRecordList9:setMinScaledWidth(280);
    obj.flwMagicRecordList9:setName("flwMagicRecordList9");
    obj.flwMagicRecordList9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList9:setVertAlign("leading");


					rawset(self.flwMagicRecordList9, "_recalcHeight", 
						function ()
							self.flwMagicRecordList9.height = self.rclflwMagicRecordList9.height +
														self.layBottomflwMagicRecordList9.height + 
														self.flwMagicRecordList9.padding.top + self.flwMagicRecordList9.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.rclflwMagicRecordList9:setName("rclflwMagicRecordList9");
    obj.rclflwMagicRecordList9:setAlign("top");
    obj.rclflwMagicRecordList9:setField("magias.magias.nivel8");
    obj.rclflwMagicRecordList9:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList9:setAutoHeight(true);
    obj.rclflwMagicRecordList9:setMinHeight(5);
    obj.rclflwMagicRecordList9:setHitTest(false);
    obj.rclflwMagicRecordList9:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.layBottomflwMagicRecordList9:setName("layBottomflwMagicRecordList9");
    obj.layBottomflwMagicRecordList9:setAlign("top");
    obj.layBottomflwMagicRecordList9:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList9:setParent(obj.layBottomflwMagicRecordList9);
    obj.btnNovoflwMagicRecordList9:setName("btnNovoflwMagicRecordList9");
    obj.btnNovoflwMagicRecordList9:setAlign("left");
    obj.btnNovoflwMagicRecordList9:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList9:setWidth(160);
    obj.btnNovoflwMagicRecordList9:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList9:setParent(obj.layBottomflwMagicRecordList9);
    obj.btnImportflwMagicRecordList9:setName("btnImportflwMagicRecordList9");
    obj.btnImportflwMagicRecordList9:setAlign("left");
    obj.btnImportflwMagicRecordList9:setText("Importar Magia");
    obj.btnImportflwMagicRecordList9:setWidth(160);
    obj.btnImportflwMagicRecordList9:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList9._recalcHeight();


    obj.flowLayout31 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.flowLayout21);
    obj.flowLayout31:setHeight(100);
    obj.flowLayout31:setAvoidScale(true);
    obj.flowLayout31:setMaxControlsPerLine(1);
    obj.flowLayout31:setAutoHeight(true);
    obj.flowLayout31:setName("flowLayout31");
    obj.flowLayout31:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout31:setStepSizes({310, 360, 420, 600});
    obj.flowLayout31:setMinScaledWidth(300);
    obj.flowLayout31:setMaxScaledWidth(600);
    obj.flowLayout31:setVertAlign("leading");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout31);
    obj.flowPart83:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart83:setName("flowPart83");
    obj.flowPart83:setAvoidScale(true);
    obj.flowPart83:setMinScaledWidth(280);
    obj.flowPart83:setMinWidth(300);
    obj.flowPart83:setMaxWidth(600);
    obj.flowPart83:setHeight(80);
    obj.flowPart83:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart83:setVertAlign("leading");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart83);
    obj.label65:setFrameRegion("RegiaoSmallTitulo");
    obj.label65:setText("9");
    obj.label65:setName("label65");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setVertTextAlign("center");
    obj.label65:setFontSize(18);
    obj.label65:setFontColor("white");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart83);
    obj.edit52:setFrameRegion("RegiaoConteudo1");
    obj.edit52:setField("magias.espacosTotais9");
    obj.edit52:setName("edit52");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setFontSize(18);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontColor("white");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart83);
    obj.edit53:setFrameRegion("RegiaoConteudo2");
    obj.edit53:setField("magias.espacosGastos9");
    obj.edit53:setName("edit53");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setFontSize(18);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontColor("white");

    obj.flwMagicRecordList10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList10:setParent(obj.flowLayout31);
    obj.flwMagicRecordList10:setMinWidth(300);
    obj.flwMagicRecordList10:setMaxWidth(600);
    obj.flwMagicRecordList10:setMinScaledWidth(280);
    obj.flwMagicRecordList10:setName("flwMagicRecordList10");
    obj.flwMagicRecordList10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList10:setVertAlign("leading");


					rawset(self.flwMagicRecordList10, "_recalcHeight", 
						function ()
							self.flwMagicRecordList10.height = self.rclflwMagicRecordList10.height +
														self.layBottomflwMagicRecordList10.height + 
														self.flwMagicRecordList10.padding.top + self.flwMagicRecordList10.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.rclflwMagicRecordList10:setName("rclflwMagicRecordList10");
    obj.rclflwMagicRecordList10:setAlign("top");
    obj.rclflwMagicRecordList10:setField("magias.magias.nivel9");
    obj.rclflwMagicRecordList10:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList10:setAutoHeight(true);
    obj.rclflwMagicRecordList10:setMinHeight(5);
    obj.rclflwMagicRecordList10:setHitTest(false);
    obj.rclflwMagicRecordList10:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.layBottomflwMagicRecordList10:setName("layBottomflwMagicRecordList10");
    obj.layBottomflwMagicRecordList10:setAlign("top");
    obj.layBottomflwMagicRecordList10:setHeight(36);

 require("import5etools.lua"); 


    obj.btnNovoflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList10:setParent(obj.layBottomflwMagicRecordList10);
    obj.btnNovoflwMagicRecordList10:setName("btnNovoflwMagicRecordList10");
    obj.btnNovoflwMagicRecordList10:setAlign("left");
    obj.btnNovoflwMagicRecordList10:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList10:setWidth(160);
    obj.btnNovoflwMagicRecordList10:setMargins({top=4, bottom=4, left=48});

    obj.btnImportflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImportflwMagicRecordList10:setParent(obj.layBottomflwMagicRecordList10);
    obj.btnImportflwMagicRecordList10:setName("btnImportflwMagicRecordList10");
    obj.btnImportflwMagicRecordList10:setAlign("left");
    obj.btnImportflwMagicRecordList10:setText("Importar Magia");
    obj.btnImportflwMagicRecordList10:setWidth(160);
    obj.btnImportflwMagicRecordList10:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList10._recalcHeight();


    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.flowLayout21);
    obj.dataLink85:setField("descansoLongo");
    obj.dataLink85:setName("dataLink85");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.pgcPrincipal);
    obj.tab5:setTitle("Magias2");
    obj.tab5:setName("tab5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.tab5);
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#40000000");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);

    obj.rclMagiasNiveis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagiasNiveis:setParent(obj.rectangle5);
    obj.rclMagiasNiveis:setName("rclMagiasNiveis");
    obj.rclMagiasNiveis:setField("magias.niveis");
    obj.rclMagiasNiveis:setTemplateForm("frmNivelDeMagia");
    obj.rclMagiasNiveis:setAlign("client");

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.rectangle5);
    obj.dataLink86:setFields({'descansoLongo', 'descansoCurto'});
    obj.dataLink86:setName("dataLink86");

    obj.flowLayout32 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.rectangle5);
    obj.flowLayout32:setAlign("bottom");
    obj.flowLayout32:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setHorzAlign("justify");
    obj.flowLayout32:setName("flowLayout32");
    obj.flowLayout32:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout32:setVertAlign("leading");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout32);
    obj.flowPart84:setWidth(1);
    obj.flowPart84:setName("flowPart84");
    obj.flowPart84:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart84:setVertAlign("leading");

    obj.upperGridMagicBox4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox4:setParent(obj.flowLayout32);
    obj.upperGridMagicBox4:setHeight(60);
    obj.upperGridMagicBox4:setMinScaledWidth(165);
    obj.upperGridMagicBox4:setMinWidth(165);
    obj.upperGridMagicBox4:setMaxWidth(160);
    obj.upperGridMagicBox4:setMaxScaledWidth(160);
    obj.upperGridMagicBox4:setAvoidScale(true);
    obj.upperGridMagicBox4:setName("upperGridMagicBox4");
    obj.upperGridMagicBox4:setVertAlign("leading");
    obj.upperGridMagicBox4:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicBox4, "_RecalcSize",
						function ()
							self.upperGridMagicBox4:setHeight(self.panupperGridMagicBox4:getHeight() + self.labupperGridMagicBox4:getHeight());
						end);
				


    obj.panupperGridMagicBox4 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox4:setParent(obj.upperGridMagicBox4);
    obj.panupperGridMagicBox4:setName("panupperGridMagicBox4");
    obj.panupperGridMagicBox4:setAlign("top");
    obj.panupperGridMagicBox4:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox4:setHeight(40);

    obj.cmbupperGridMagicBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbupperGridMagicBox4:setParent(obj.panupperGridMagicBox4);
    obj.cmbupperGridMagicBox4:setName("cmbupperGridMagicBox4");
    obj.cmbupperGridMagicBox4:setFrameRegion("ContentRegion");
    obj.cmbupperGridMagicBox4:setField("magias.habilidadeDeConjuracao");
    obj.cmbupperGridMagicBox4:setItems({'', 'FORÇA', 'DESTREZA', 'CONSTITUIÇÃO', 'INTELIGÊNCIA', 'SABEDORIA', 'CARISMA'});
    obj.cmbupperGridMagicBox4:setValues({'', 'forca', 'destreza', 'constituicao', 'inteligencia', 'sabedoria', 'carisma'});
    obj.cmbupperGridMagicBox4:setHorzTextAlign("center");
    obj.cmbupperGridMagicBox4:setVertTextAlign("center");
    obj.cmbupperGridMagicBox4:setFontSize(13);
    obj.cmbupperGridMagicBox4:setTransparent(true);

    obj.labupperGridMagicBox4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox4:setParent(obj.upperGridMagicBox4);
    obj.labupperGridMagicBox4:setName("labupperGridMagicBox4");
    obj.labupperGridMagicBox4:setAlign("top");
    obj.labupperGridMagicBox4:setAutoSize(true);
    obj.labupperGridMagicBox4:setWordWrap(false);
    obj.labupperGridMagicBox4:setText("HABILIDADE DE CONJURAÇÃO");
    obj.labupperGridMagicBox4:setHorzTextAlign("center");
    obj.labupperGridMagicBox4:setVertTextAlign("leading");
    obj.labupperGridMagicBox4:setFontSize(12);
    obj.labupperGridMagicBox4:setFontColor("#D0D0D0");

self.upperGridMagicBox4._RecalcSize();	


    obj.upperGridMagicBox5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox5:setParent(obj.flowLayout32);
    obj.upperGridMagicBox5:setHeight(60);
    obj.upperGridMagicBox5:setMinScaledWidth(100);
    obj.upperGridMagicBox5:setMinWidth(100);
    obj.upperGridMagicBox5:setMaxWidth(160);
    obj.upperGridMagicBox5:setMaxScaledWidth(160);
    obj.upperGridMagicBox5:setAvoidScale(true);
    obj.upperGridMagicBox5:setName("upperGridMagicBox5");
    obj.upperGridMagicBox5:setVertAlign("leading");
    obj.upperGridMagicBox5:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicBox5, "_RecalcSize",
						function ()
							self.upperGridMagicBox5:setHeight(self.panupperGridMagicBox5:getHeight() + self.labupperGridMagicBox5:getHeight());
						end);
				


    obj.panupperGridMagicBox5 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox5:setParent(obj.upperGridMagicBox5);
    obj.panupperGridMagicBox5:setName("panupperGridMagicBox5");
    obj.panupperGridMagicBox5:setAlign("top");
    obj.panupperGridMagicBox5:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox5:setHeight(40);

    obj.labupperGridMagicBox5val = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox5val:setParent(obj.panupperGridMagicBox5);
    obj.labupperGridMagicBox5val:setName("labupperGridMagicBox5val");
    obj.labupperGridMagicBox5val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox5val:setField("magias.cdDaMagia");
    obj.labupperGridMagicBox5val:setFontSize(22);
    obj.labupperGridMagicBox5val:setVertTextAlign("center");
    obj.labupperGridMagicBox5val:setHorzTextAlign("center");
    obj.labupperGridMagicBox5val:setFontColor("white");

    obj.labupperGridMagicBox5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox5:setParent(obj.upperGridMagicBox5);
    obj.labupperGridMagicBox5:setName("labupperGridMagicBox5");
    obj.labupperGridMagicBox5:setAlign("top");
    obj.labupperGridMagicBox5:setAutoSize(true);
    obj.labupperGridMagicBox5:setWordWrap(false);
    obj.labupperGridMagicBox5:setText("CD DA MAGIA");
    obj.labupperGridMagicBox5:setHorzTextAlign("center");
    obj.labupperGridMagicBox5:setVertTextAlign("leading");
    obj.labupperGridMagicBox5:setFontSize(12);
    obj.labupperGridMagicBox5:setFontColor("#D0D0D0");

self.upperGridMagicBox5._RecalcSize();	


    obj.upperGridMagicBox6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox6:setParent(obj.flowLayout32);
    obj.upperGridMagicBox6:setHeight(60);
    obj.upperGridMagicBox6:setMinScaledWidth(160);
    obj.upperGridMagicBox6:setMinWidth(160);
    obj.upperGridMagicBox6:setMaxWidth(160);
    obj.upperGridMagicBox6:setMaxScaledWidth(160);
    obj.upperGridMagicBox6:setAvoidScale(true);
    obj.upperGridMagicBox6:setName("upperGridMagicBox6");
    obj.upperGridMagicBox6:setVertAlign("leading");
    obj.upperGridMagicBox6:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicBox6, "_RecalcSize",
						function ()
							self.upperGridMagicBox6:setHeight(self.panupperGridMagicBox6:getHeight() + self.labupperGridMagicBox6:getHeight());
						end);
				


    obj.panupperGridMagicBox6 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox6:setParent(obj.upperGridMagicBox6);
    obj.panupperGridMagicBox6:setName("panupperGridMagicBox6");
    obj.panupperGridMagicBox6:setAlign("top");
    obj.panupperGridMagicBox6:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox6:setHeight(40);

    obj.labupperGridMagicBox6val = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox6val:setParent(obj.panupperGridMagicBox6);
    obj.labupperGridMagicBox6val:setName("labupperGridMagicBox6val");
    obj.labupperGridMagicBox6val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox6val:setField("magias.bonusAtaqueSTR");
    obj.labupperGridMagicBox6val:setFontSize(22);
    obj.labupperGridMagicBox6val:setVertTextAlign("center");
    obj.labupperGridMagicBox6val:setHorzTextAlign("center");
    obj.labupperGridMagicBox6val:setFontColor("white");

    obj.labupperGridMagicBox6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox6:setParent(obj.upperGridMagicBox6);
    obj.labupperGridMagicBox6:setName("labupperGridMagicBox6");
    obj.labupperGridMagicBox6:setAlign("top");
    obj.labupperGridMagicBox6:setAutoSize(true);
    obj.labupperGridMagicBox6:setWordWrap(false);
    obj.labupperGridMagicBox6:setText("BÔNUS DE ATAQUE DE MAGIA");
    obj.labupperGridMagicBox6:setHorzTextAlign("center");
    obj.labupperGridMagicBox6:setVertTextAlign("leading");
    obj.labupperGridMagicBox6:setFontSize(12);
    obj.labupperGridMagicBox6:setFontColor("#D0D0D0");

self.upperGridMagicBox6._RecalcSize();	


    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout32);
    obj.flowPart85:setWidth(1);
    obj.flowPart85:setName("flowPart85");
    obj.flowPart85:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart85:setVertAlign("leading");

  require("common.lua"); 


    obj.popupEdit = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupEdit:setParent(obj.rectangle5);
    obj.popupEdit:setName("popupEdit");
    obj.popupEdit:setVisible(false);
    obj.popupEdit:setWidth(700);
    obj.popupEdit:setHeight(700);
    lfm_setPropAsString(obj.popupEdit, "autoScopeNode",  "false");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.popupEdit);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(100);
    obj.layout48:setName("layout48");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout48);
    obj.image4:setAlign("left");
    obj.image4:setField("icone");
    obj.image4:setEditable(true);
    obj.image4:setName("image4");

    obj.flowLayout33 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.layout48);
    obj.flowLayout33:setAlign("client");
    obj.flowLayout33:setName("flowLayout33");
    obj.flowLayout33:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout33:setVertAlign("leading");

    obj.fpPENome = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpPENome:setParent(obj.flowLayout33);
    obj.fpPENome:setName("fpPENome");
    obj.fpPENome:setMinWidth(100.0);
    obj.fpPENome:setMinScaledWidth(50.0);
    obj.fpPENome:setMaxWidth(200.0);
    obj.fpPENome:setAvoidScale(true);
    obj.fpPENome:setAdjustHeightToLine(true);
    obj.fpPENome:setPadding({left=0, right=0});
    obj.fpPENome:setVertAlign("center");
    obj.fpPENome:setMargins({left=1, right=1, top=2, bottom=2});

    obj.editPENome = GUI.fromHandle(_obj_newObject("edit"));
    obj.editPENome:setParent(obj.fpPENome);
    obj.editPENome:setName("editPENome");
    obj.editPENome:setAlign("client");
    obj.editPENome:setHitTest(true);
    obj.editPENome:setCanFocus(true);
    obj.editPENome:setCursor("handPoint");
    obj.editPENome:setField("nome");
    obj.editPENome:setHorzTextAlign("leading");
    obj.editPENome:setVertTextAlign("center");
    obj.editPENome:setTransparent(true);
    obj.editPENome:setFontColor("White");
    obj.editPENome:setHint("PENome");
    obj.editPENome:setFontSize(15);

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout33);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.flowLayout33);
    obj.rectangle6:setWidth(10000);
    obj.rectangle6:setColor("grey");
    obj.rectangle6:setHeight(1);
    obj.rectangle6:setName("rectangle6");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout33);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.fpPENivel = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpPENivel:setParent(obj.flowLayout33);
    obj.fpPENivel:setName("fpPENivel");
    obj.fpPENivel:setMinWidth(141.0);
    obj.fpPENivel:setMinScaledWidth(70.5);
    obj.fpPENivel:setMaxWidth(282.0);
    obj.fpPENivel:setAvoidScale(true);
    obj.fpPENivel:setAdjustHeightToLine(true);
    obj.fpPENivel:setPadding({left=0, right=0});
    obj.fpPENivel:setVertAlign("center");
    obj.fpPENivel:setMargins({left=1, right=1, top=2, bottom=2});

    obj.labelFieldPENivel = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldPENivel:setParent(obj.fpPENivel);
    obj.labelFieldPENivel:setName("labelFieldPENivel");
    obj.labelFieldPENivel:setAlign("client");
    obj.labelFieldPENivel:setHitTest(false);
    obj.labelFieldPENivel:setCanFocus(false);
    obj.labelFieldPENivel:setCursor("default");
    obj.labelFieldPENivel:setField("nivelTexto");
    obj.labelFieldPENivel:setHorzTextAlign("leading");
    obj.labelFieldPENivel:setVertTextAlign("center");
    obj.labelFieldPENivel:setReadOnly(true);
    obj.labelFieldPENivel:setTransparent(true);
    obj.labelFieldPENivel:setFontColor("White");
    obj.labelFieldPENivel:setFontSize(15);

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout33);
    obj.flowPart86:setWidth(1);
    obj.flowPart86:setAdjustHeightToLine(true);
    obj.flowPart86:setName("flowPart86");
    obj.flowPart86:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart86:setVertAlign("leading");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowPart86);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("gray");
    obj.rectangle7:setName("rectangle7");

    obj.fpPEEscola = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpPEEscola:setParent(obj.flowLayout33);
    obj.fpPEEscola:setName("fpPEEscola");
    obj.fpPEEscola:setMinWidth(147.0);
    obj.fpPEEscola:setMinScaledWidth(73.0);
    obj.fpPEEscola:setMaxWidth(295.0);
    obj.fpPEEscola:setAvoidScale(true);
    obj.fpPEEscola:setAdjustHeightToLine(true);
    obj.fpPEEscola:setPadding({left=0, right=0});
    obj.fpPEEscola:setVertAlign("center");
    obj.fpPEEscola:setMargins({left=1, right=1, top=2, bottom=2});

    obj.labelFieldPEEscola = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldPEEscola:setParent(obj.fpPEEscola);
    obj.labelFieldPEEscola:setName("labelFieldPEEscola");
    obj.labelFieldPEEscola:setAlign("client");
    obj.labelFieldPEEscola:setHitTest(false);
    obj.labelFieldPEEscola:setCanFocus(false);
    obj.labelFieldPEEscola:setCursor("default");
    obj.labelFieldPEEscola:setField("escolaDeMagia");
    obj.labelFieldPEEscola:setHorzTextAlign("leading");
    obj.labelFieldPEEscola:setVertTextAlign("center");
    obj.labelFieldPEEscola:setReadOnly(true);
    obj.labelFieldPEEscola:setTransparent(true);
    obj.labelFieldPEEscola:setFontColor("White");
    obj.labelFieldPEEscola:setFontSize(15);

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout33);
    obj.flowPart87:setWidth(1);
    obj.flowPart87:setAdjustHeightToLine(true);
    obj.flowPart87:setName("flowPart87");
    obj.flowPart87:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart87:setVertAlign("leading");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowPart87);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("gray");
    obj.rectangle8:setName("rectangle8");

    obj.fpPETempo = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpPETempo:setParent(obj.flowLayout33);
    obj.fpPETempo:setName("fpPETempo");
    obj.fpPETempo:setMinWidth(147.0);
    obj.fpPETempo:setMinScaledWidth(73.0);
    obj.fpPETempo:setMaxWidth(295.0);
    obj.fpPETempo:setAvoidScale(true);
    obj.fpPETempo:setAdjustHeightToLine(true);
    obj.fpPETempo:setPadding({left=0, right=0});
    obj.fpPETempo:setVertAlign("center");
    obj.fpPETempo:setMargins({left=1, right=1, top=2, bottom=2});

    obj.labelFieldPETempo = GUI.fromHandle(_obj_newObject("edit"));
    obj.labelFieldPETempo:setParent(obj.fpPETempo);
    obj.labelFieldPETempo:setName("labelFieldPETempo");
    obj.labelFieldPETempo:setAlign("client");
    obj.labelFieldPETempo:setHitTest(false);
    obj.labelFieldPETempo:setCanFocus(false);
    obj.labelFieldPETempo:setCursor("default");
    obj.labelFieldPETempo:setField("tempoConjuracao");
    obj.labelFieldPETempo:setHorzTextAlign("leading");
    obj.labelFieldPETempo:setVertTextAlign("center");
    obj.labelFieldPETempo:setReadOnly(true);
    obj.labelFieldPETempo:setTransparent(true);
    obj.labelFieldPETempo:setFontColor("White");
    obj.labelFieldPETempo:setFontSize(15);

    obj.tcPopupEdit = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tcPopupEdit:setParent(obj.popupEdit);
    obj.tcPopupEdit:setAlign("client");
    obj.tcPopupEdit:setName("tcPopupEdit");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tcPopupEdit);
    obj.tab6:setTitle("Descrição");
    obj.tab6:setName("tab6");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.tab6);
    obj.layout49:setAlign("client");
    obj.layout49:setMargins({top=5, bottom=5, left=5, right=5});
    obj.layout49:setName("layout49");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout49);
    obj.label66:setText("Mecânicas / Flavour");
    obj.label66:setName("label66");
    obj.label66:setAlign("top");
    obj.label66:setFontSize(16.0);
    obj.label66:setHeight(30);
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setFontColor("white");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout49);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("descricao");
    obj.textEditor9:setName("textEditor9");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tcPopupEdit);
    obj.tab7:setTitle("Detalhes");
    obj.tab7:setName("tab7");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.tab7);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setPadding({top=5, bottom=5, left=5, right=5});
    obj.scrollBox5:setName("scrollBox5");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.scrollBox5);
    obj.label67:setText("Detalhes da Magia");
    obj.label67:setName("label67");
    obj.label67:setAlign("top");
    obj.label67:setFontSize(16.0);
    obj.label67:setHeight(30);
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setFontColor("white");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox5);
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setAlign("top");
    obj.rectangle9:setColor("DimGray");
    obj.rectangle9:setMargins({top=2, bottom=2});
    obj.rectangle9:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle9:setXradius(2);
    obj.rectangle9:setYradius(2);

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle9);
    obj.label68:setAlign("left");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setText("Nível da Magia");
    obj.label68:setName("label68");
    obj.label68:setFontColor("white");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle9);
    obj.comboBox3:setAlign("right");
    obj.comboBox3:setWidth(115);
    obj.comboBox3:setField("nivel");
    obj.comboBox3:setItems({'Truque', '1º nível', '2º nível', '3º nível', '4º nível', '5º nível', '6º nível', '7º nível', '8º nível', '9º nível'});
    obj.comboBox3:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'});
    obj.comboBox3:setName("comboBox3");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox5);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setColor("DimGray");
    obj.rectangle10:setMargins({top=2, bottom=2});
    obj.rectangle10:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle10:setXradius(2);
    obj.rectangle10:setYradius(2);

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle10);
    obj.label69:setAlign("left");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setText("Escola de Magia");
    obj.label69:setName("label69");
    obj.label69:setFontColor("white");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle10);
    obj.comboBox4:setAlign("right");
    obj.comboBox4:setWidth(115);
    obj.comboBox4:setField("escolaDeMagia");
    obj.comboBox4:setItems({'', 'Abjuração', 'Conjuração', 'Adivinhação', 'Encantamento', 'Evocação', 'Ilusão', 'Necromância', 'Transmutação'});
    obj.comboBox4:setName("comboBox4");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox5);
    obj.rectangle11:setHeight(90);
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setColor("DimGray");
    obj.rectangle11:setMargins({top=2, bottom=2});
    obj.rectangle11:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle11:setXradius(2);
    obj.rectangle11:setYradius(2);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle11);
    obj.label70:setAlign("top");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setText("Componentes da Magia");
    obj.label70:setHeight(24);
    obj.label70:setName("label70");
    obj.label70:setFontColor("white");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle11);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(30);
    obj.layout50:setName("layout50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(34);
    obj.layout51:setName("layout51");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout51);
    obj.label71:setAlign("client");
    obj.label71:setHorzTextAlign("trailing");
    obj.label71:setText("V");
    obj.label71:setName("label71");
    obj.label71:setFontColor("white");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout51);
    obj.checkBox4:setAlign("right");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setField("componentesV");
    obj.checkBox4:setName("checkBox4");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(30);
    obj.layout52:setName("layout52");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout52);
    obj.label72:setAlign("client");
    obj.label72:setHorzTextAlign("trailing");
    obj.label72:setText("S");
    obj.label72:setName("label72");
    obj.label72:setFontColor("white");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout52);
    obj.checkBox5:setAlign("right");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setField("componentesS");
    obj.checkBox5:setName("checkBox5");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(32);
    obj.layout53:setName("layout53");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout53);
    obj.label73:setAlign("client");
    obj.label73:setHorzTextAlign("trailing");
    obj.label73:setText("M");
    obj.label73:setName("label73");
    obj.label73:setFontColor("white");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout53);
    obj.checkBox6:setAlign("right");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setField("componentesM");
    obj.checkBox6:setName("checkBox6");

    obj.popupEditCompM = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditCompM:setParent(obj.layout50);
    obj.popupEditCompM:setName("popupEditCompM");
    obj.popupEditCompM:setAlign("client");
    obj.popupEditCompM:setField("componentesMaterial");
    obj.popupEditCompM:setEnabled(false);
    obj.popupEditCompM:setFontSize(15);
    obj.popupEditCompM:setFontColor("white");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout50);
    obj.dataLink87:setField("componentesM");
    obj.dataLink87:setName("dataLink87");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle11);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(30);
    obj.layout54:setName("layout54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout54);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(100);
    obj.layout55:setName("layout55");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout55);
    obj.label74:setAlign("client");
    obj.label74:setHorzTextAlign("trailing");
    obj.label74:setText("Concentração");
    obj.label74:setName("label74");
    obj.label74:setFontColor("white");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout55);
    obj.checkBox7:setAlign("right");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setField("componentesConcentracao");
    obj.checkBox7:setName("checkBox7");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout54);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(55);
    obj.layout56:setName("layout56");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout56);
    obj.label75:setAlign("client");
    obj.label75:setHorzTextAlign("trailing");
    obj.label75:setText("Ritual");
    obj.label75:setName("label75");
    obj.label75:setFontColor("white");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout56);
    obj.checkBox8:setAlign("right");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setField("componentesRitual");
    obj.checkBox8:setName("checkBox8");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox5);
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setName("rectangle12");
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setColor("DimGray");
    obj.rectangle12:setMargins({top=2, bottom=2});
    obj.rectangle12:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle12:setXradius(2);
    obj.rectangle12:setYradius(2);

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle12);
    obj.label76:setAlign("left");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setText("Tipo de Magia");
    obj.label76:setName("label76");
    obj.label76:setFontColor("white");

    obj.flowLayout34 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.rectangle12);
    obj.flowLayout34:setAlign("client");
    obj.flowLayout34:setHorzAlign("trailing");
    obj.flowLayout34:setName("flowLayout34");
    obj.flowLayout34:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout34:setVertAlign("leading");

    obj.layPrepValor = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.layPrepValor:setParent(obj.flowLayout34);
    obj.layPrepValor:setName("layPrepValor");
    obj.layPrepValor:setWidth(100);
    obj.layPrepValor:setMinScaledWidth(50);
    obj.layPrepValor:setHeight(24);
    obj.layPrepValor:setMargins({left=1, right=1, top=2, bottom=2});
    obj.layPrepValor:setVertAlign("leading");

    obj.layPrepValorLab = GUI.fromHandle(_obj_newObject("label"));
    obj.layPrepValorLab:setParent(obj.layPrepValor);
    obj.layPrepValorLab:setName("layPrepValorLab");
    obj.layPrepValorLab:setAlign("client");
    obj.layPrepValorLab:setText("Preparado");
    obj.layPrepValorLab:setHorzTextAlign("trailing");
    obj.layPrepValorLab:setFontColor("white");

    obj.layPrepValorChb = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.layPrepValorChb:setParent(obj.layPrepValor);
    obj.layPrepValorChb:setName("layPrepValorChb");
    obj.layPrepValorChb:setAlign("right");
    obj.layPrepValorChb:setWidth(20);
    obj.layPrepValorChb:setField("preparadoValor");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout34);
    obj.flowPart88:setWidth(140);
    obj.flowPart88:setMinScaledWidth(70);
    obj.flowPart88:setHeight(24);
    obj.flowPart88:setName("flowPart88");
    obj.flowPart88:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart88:setVertAlign("leading");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.flowPart88);
    obj.comboBox5:setAlign("client");
    obj.comboBox5:setField("preparadoTipo");
    obj.comboBox5:setItems({'Preparada', 'Sempre Preparada', 'Conhecida', 'A vontade', 'Inata'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.rectangle12);
    obj.dataLink88:setField("preparadoTipo");
    obj.dataLink88:setName("dataLink88");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.scrollBox5);
    obj.label77:setText("Detalhes de Conjuração");
    obj.label77:setName("label77");
    obj.label77:setAlign("top");
    obj.label77:setFontSize(16.0);
    obj.label77:setHeight(30);
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setFontColor("white");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox5);
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setName("rectangle13");
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setColor("DimGray");
    obj.rectangle13:setMargins({top=2, bottom=2});
    obj.rectangle13:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle13:setXradius(2);
    obj.rectangle13:setYradius(2);

    obj.flowLayout35 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.rectangle13);
    obj.flowLayout35:setAlign("client");
    obj.flowLayout35:setName("flowLayout35");
    obj.flowLayout35:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout35:setVertAlign("leading");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout35);
    obj.flowPart89:setMinWidth(173);
    obj.flowPart89:setMaxWidth(865);
    obj.flowPart89:setHeight(24);
    obj.flowPart89:setName("flowPart89");
    obj.flowPart89:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart89:setVertAlign("leading");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowPart89);
    obj.label78:setAlign("client");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setText("Tempo de Conjuração");
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout35);
    obj.flowPart90:setMinWidth(3);
    obj.flowPart90:setHeight(24);
    obj.flowPart90:setName("flowPart90");
    obj.flowPart90:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart90:setVertAlign("leading");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout35);
    obj.flowPart91:setMinWidth(97);
    obj.flowPart91:setMaxWidth(485);
    obj.flowPart91:setHeight(24);
    obj.flowPart91:setName("flowPart91");
    obj.flowPart91:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart91:setVertAlign("leading");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart91);
    obj.edit54:setAlign("client");
    obj.edit54:setField("tempoConjuracaoValor");
    obj.edit54:setHorzTextAlign("trailing");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");
    obj.edit54:setFontSize(15);
    obj.edit54:setFontColor("white");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout35);
    obj.flowPart92:setMinWidth(3);
    obj.flowPart92:setHeight(24);
    obj.flowPart92:setName("flowPart92");
    obj.flowPart92:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart92:setVertAlign("leading");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout35);
    obj.flowPart93:setMinWidth(158);
    obj.flowPart93:setMaxWidth(790);
    obj.flowPart93:setHeight(24);
    obj.flowPart93:setName("flowPart93");
    obj.flowPart93:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart93:setVertAlign("leading");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.flowPart93);
    obj.comboBox6:setAlign("client");
    obj.comboBox6:setField("tempoConjuracaoUnidade");
    obj.comboBox6:setItems({'', 'Ação', 'Ação Bônus', 'Ação de Tripulação', 'Dias', 'Horas', 'Ação Lendária', 'Minutos', 'Nada', 'Reação', 'Especial', 'Ação de Lar'});
    obj.comboBox6:setName("comboBox6");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox5);
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setColor("DimGray");
    obj.rectangle14:setMargins({top=2, bottom=2});
    obj.rectangle14:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle14:setXradius(2);
    obj.rectangle14:setYradius(2);

    obj.flowLayout36 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.rectangle14);
    obj.flowLayout36:setAlign("client");
    obj.flowLayout36:setName("flowLayout36");
    obj.flowLayout36:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout36:setVertAlign("leading");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout36);
    obj.flowPart94:setMinWidth(173);
    obj.flowPart94:setMaxWidth(865);
    obj.flowPart94:setHeight(24);
    obj.flowPart94:setName("flowPart94");
    obj.flowPart94:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart94:setVertAlign("leading");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart94);
    obj.label79:setAlign("client");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setText("Condição de Ativação (Reação)");
    obj.label79:setName("label79");
    obj.label79:setFontColor("white");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout36);
    obj.flowPart95:setMinWidth(3);
    obj.flowPart95:setHeight(24);
    obj.flowPart95:setName("flowPart95");
    obj.flowPart95:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart95:setVertAlign("leading");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout36);
    obj.flowPart96:setMinWidth(258);
    obj.flowPart96:setMaxWidth(1290);
    obj.flowPart96:setHeight(24);
    obj.flowPart96:setName("flowPart96");
    obj.flowPart96:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart96:setVertAlign("leading");

    obj.popupEditCondAtiv = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditCondAtiv:setParent(obj.flowPart96);
    obj.popupEditCondAtiv:setName("popupEditCondAtiv");
    obj.popupEditCondAtiv:setAlign("client");
    obj.popupEditCondAtiv:setField("condicaoAtivacao");
    obj.popupEditCondAtiv:setFontSize(15);
    obj.popupEditCondAtiv:setFontColor("white");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.flowLayout36);
    obj.dataLink89:setField("tempoConjuracaoUnidade");
    obj.dataLink89:setName("dataLink89");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.scrollBox5);
    obj.rectangle15:setHeight(30);
    obj.rectangle15:setName("rectangle15");
    obj.rectangle15:setAlign("top");
    obj.rectangle15:setColor("DimGray");
    obj.rectangle15:setMargins({top=2, bottom=2});
    obj.rectangle15:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle15:setXradius(2);
    obj.rectangle15:setYradius(2);

    obj.flowLayout37 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout37:setParent(obj.rectangle15);
    obj.flowLayout37:setAlign("client");
    obj.flowLayout37:setName("flowLayout37");
    obj.flowLayout37:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout37:setVertAlign("leading");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout37);
    obj.flowPart97:setMinWidth(173);
    obj.flowPart97:setMaxWidth(865);
    obj.flowPart97:setHeight(24);
    obj.flowPart97:setName("flowPart97");
    obj.flowPart97:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart97:setVertAlign("leading");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowPart97);
    obj.label80:setAlign("client");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setText("Alvo");
    obj.label80:setName("label80");
    obj.label80:setFontColor("white");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout37);
    obj.flowPart98:setMinWidth(3);
    obj.flowPart98:setHeight(24);
    obj.flowPart98:setName("flowPart98");
    obj.flowPart98:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart98:setVertAlign("leading");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout37);
    obj.flowPart99:setMinWidth(69);
    obj.flowPart99:setMaxWidth(345);
    obj.flowPart99:setHeight(24);
    obj.flowPart99:setName("flowPart99");
    obj.flowPart99:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart99:setVertAlign("leading");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart99);
    obj.edit55:setAlign("client");
    obj.edit55:setField("alvoValor");
    obj.edit55:setHorzTextAlign("trailing");
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");
    obj.edit55:setFontSize(15);
    obj.edit55:setFontColor("white");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout37);
    obj.flowPart100:setMinWidth(3);
    obj.flowPart100:setHeight(24);
    obj.flowPart100:setName("flowPart100");
    obj.flowPart100:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart100:setVertAlign("leading");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout37);
    obj.flowPart101:setMinWidth(92);
    obj.flowPart101:setMaxWidth(460);
    obj.flowPart101:setHeight(24);
    obj.flowPart101:setName("flowPart101");
    obj.flowPart101:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart101:setVertAlign("leading");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.flowPart101);
    obj.comboBox7:setAlign("client");
    obj.comboBox7:setField("alvoUnidade");
    obj.comboBox7:setItems({'', 'Nenhum', 'Pessoal', 'Toque', 'Especial', 'Qualquer', 'Pés', 'Milhas', 'Metros', 'Kilômetros'});
    obj.comboBox7:setName("comboBox7");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout37);
    obj.flowPart102:setMinWidth(3);
    obj.flowPart102:setHeight(24);
    obj.flowPart102:setName("flowPart102");
    obj.flowPart102:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart102:setVertAlign("leading");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout37);
    obj.flowPart103:setMinWidth(91);
    obj.flowPart103:setMaxWidth(455);
    obj.flowPart103:setHeight(24);
    obj.flowPart103:setName("flowPart103");
    obj.flowPart103:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart103:setVertAlign("leading");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.flowPart103);
    obj.comboBox8:setAlign("client");
    obj.comboBox8:setField("alvoTipo");
    obj.comboBox8:setItems({'', 'Aliado', 'Cone', 'Criatura', 'Cubo', 'Cilindro', 'Inimigo', 'Linha', 'Nenhum', 'Objeto', 'Raio', 'Pessoal', 'Espaço', 'Esfera', 'Quadrado', 'Parede'});
    obj.comboBox8:setName("comboBox8");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.scrollBox5);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setName("rectangle16");
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setColor("DimGray");
    obj.rectangle16:setMargins({top=2, bottom=2});
    obj.rectangle16:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle16:setXradius(2);
    obj.rectangle16:setYradius(2);

    obj.flowLayout38 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout38:setParent(obj.rectangle16);
    obj.flowLayout38:setAlign("client");
    obj.flowLayout38:setName("flowLayout38");
    obj.flowLayout38:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout38:setVertAlign("leading");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout38);
    obj.flowPart104:setMinWidth(173);
    obj.flowPart104:setMaxWidth(865);
    obj.flowPart104:setHeight(24);
    obj.flowPart104:setName("flowPart104");
    obj.flowPart104:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart104:setVertAlign("leading");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart104);
    obj.label81:setAlign("client");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setText("Alcance");
    obj.label81:setName("label81");
    obj.label81:setFontColor("white");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout38);
    obj.flowPart105:setMinWidth(3);
    obj.flowPart105:setHeight(24);
    obj.flowPart105:setName("flowPart105");
    obj.flowPart105:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart105:setVertAlign("leading");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout38);
    obj.flowPart106:setMinWidth(68);
    obj.flowPart106:setMaxWidth(340);
    obj.flowPart106:setHeight(24);
    obj.flowPart106:setName("flowPart106");
    obj.flowPart106:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart106:setVertAlign("leading");

    obj.popupEditAlcanceCurto = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditAlcanceCurto:setParent(obj.flowPart106);
    obj.popupEditAlcanceCurto:setName("popupEditAlcanceCurto");
    obj.popupEditAlcanceCurto:setAlign("client");
    obj.popupEditAlcanceCurto:setField("alcanceCurto");
    obj.popupEditAlcanceCurto:setHorzTextAlign("trailing");
    obj.popupEditAlcanceCurto:setType("number");
    obj.popupEditAlcanceCurto:setFontSize(15);
    obj.popupEditAlcanceCurto:setFontColor("white");

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout38);
    obj.flowPart107:setMinWidth(13);
    obj.flowPart107:setMaxWidth(65);
    obj.flowPart107:setHeight(24);
    obj.flowPart107:setName("flowPart107");
    obj.flowPart107:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart107:setVertAlign("leading");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowPart107);
    obj.label82:setAlign("client");
    obj.label82:setText("/");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");
    obj.label82:setFontColor("white");

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout38);
    obj.flowPart108:setMinWidth(68);
    obj.flowPart108:setMaxWidth(340);
    obj.flowPart108:setHeight(24);
    obj.flowPart108:setName("flowPart108");
    obj.flowPart108:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart108:setVertAlign("leading");

    obj.popupEditAlcanceLongo = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditAlcanceLongo:setParent(obj.flowPart108);
    obj.popupEditAlcanceLongo:setName("popupEditAlcanceLongo");
    obj.popupEditAlcanceLongo:setAlign("client");
    obj.popupEditAlcanceLongo:setField("alcanceLongo");
    obj.popupEditAlcanceLongo:setHorzTextAlign("leading");
    obj.popupEditAlcanceLongo:setType("number");
    obj.popupEditAlcanceLongo:setFontSize(15);
    obj.popupEditAlcanceLongo:setFontColor("white");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout38);
    obj.flowPart109:setMinWidth(3);
    obj.flowPart109:setHeight(24);
    obj.flowPart109:setName("flowPart109");
    obj.flowPart109:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart109:setVertAlign("leading");

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout38);
    obj.flowPart110:setMinWidth(106);
    obj.flowPart110:setMaxWidth(530);
    obj.flowPart110:setHeight(24);
    obj.flowPart110:setName("flowPart110");
    obj.flowPart110:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart110:setVertAlign("leading");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.flowPart110);
    obj.comboBox9:setAlign("client");
    obj.comboBox9:setField("alcanceUnidade");
    obj.comboBox9:setItems({'', 'Nenhum', 'Pessoal', 'Toque', 'Especial', 'Qualquer', 'Pés', 'Milhas', 'Metros', 'Kilômetros'});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.flowLayout38);
    obj.dataLink90:setField("alcanceUnidade");
    obj.dataLink90:setName("dataLink90");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.scrollBox5);
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setName("rectangle17");
    obj.rectangle17:setAlign("top");
    obj.rectangle17:setColor("DimGray");
    obj.rectangle17:setMargins({top=2, bottom=2});
    obj.rectangle17:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle17:setXradius(2);
    obj.rectangle17:setYradius(2);

    obj.flowLayout39 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout39:setParent(obj.rectangle17);
    obj.flowLayout39:setAlign("client");
    obj.flowLayout39:setName("flowLayout39");
    obj.flowLayout39:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout39:setVertAlign("leading");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout39);
    obj.flowPart111:setMinWidth(173);
    obj.flowPart111:setMaxWidth(865);
    obj.flowPart111:setHeight(24);
    obj.flowPart111:setName("flowPart111");
    obj.flowPart111:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart111:setVertAlign("leading");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart111);
    obj.label83:setAlign("client");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setText("Duração");
    obj.label83:setName("label83");
    obj.label83:setFontColor("white");

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout39);
    obj.flowPart112:setMinWidth(3);
    obj.flowPart112:setHeight(24);
    obj.flowPart112:setName("flowPart112");
    obj.flowPart112:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart112:setVertAlign("leading");

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout39);
    obj.flowPart113:setMinWidth(97);
    obj.flowPart113:setMaxWidth(485);
    obj.flowPart113:setHeight(24);
    obj.flowPart113:setName("flowPart113");
    obj.flowPart113:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart113:setVertAlign("leading");

    obj.popupEditDuracaoUnidade = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditDuracaoUnidade:setParent(obj.flowPart113);
    obj.popupEditDuracaoUnidade:setName("popupEditDuracaoUnidade");
    obj.popupEditDuracaoUnidade:setAlign("client");
    obj.popupEditDuracaoUnidade:setField("duracaoValor");
    obj.popupEditDuracaoUnidade:setHorzTextAlign("trailing");
    obj.popupEditDuracaoUnidade:setType("number");
    obj.popupEditDuracaoUnidade:setFontSize(15);
    obj.popupEditDuracaoUnidade:setFontColor("white");

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout39);
    obj.flowPart114:setMinWidth(3);
    obj.flowPart114:setHeight(24);
    obj.flowPart114:setName("flowPart114");
    obj.flowPart114:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart114:setVertAlign("leading");

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout39);
    obj.flowPart115:setMinWidth(158);
    obj.flowPart115:setMaxWidth(790);
    obj.flowPart115:setHeight(24);
    obj.flowPart115:setName("flowPart115");
    obj.flowPart115:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart115:setVertAlign("leading");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.flowPart115);
    obj.comboBox10:setAlign("client");
    obj.comboBox10:setField("duracaoUnidade");
    obj.comboBox10:setItems({'', 'Dias', 'Horas', 'Instantânea', 'Minutos', 'Meses', 'Permanente', 'Rodadas', 'Especial', 'Turnos', 'Anos'});
    obj.comboBox10:setName("comboBox10");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.flowLayout39);
    obj.dataLink91:setField("duracaoUnidade");
    obj.dataLink91:setName("dataLink91");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.scrollBox5);
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setName("rectangle18");
    obj.rectangle18:setAlign("top");
    obj.rectangle18:setColor("DimGray");
    obj.rectangle18:setMargins({top=2, bottom=2});
    obj.rectangle18:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle18:setXradius(2);
    obj.rectangle18:setYradius(2);

    obj.flowLayout40 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout40:setParent(obj.rectangle18);
    obj.flowLayout40:setAlign("client");
    obj.flowLayout40:setName("flowLayout40");
    obj.flowLayout40:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout40:setVertAlign("leading");

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout40);
    obj.flowPart116:setMinWidth(173);
    obj.flowPart116:setMaxWidth(865);
    obj.flowPart116:setHeight(24);
    obj.flowPart116:setName("flowPart116");
    obj.flowPart116:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart116:setVertAlign("leading");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart116);
    obj.label84:setAlign("client");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setText("Recurso Necessário");
    obj.label84:setName("label84");
    obj.label84:setFontColor("white");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout40);
    obj.flowPart117:setMinWidth(3);
    obj.flowPart117:setHeight(24);
    obj.flowPart117:setName("flowPart117");
    obj.flowPart117:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart117:setVertAlign("leading");

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout40);
    obj.flowPart118:setMinWidth(44);
    obj.flowPart118:setMaxWidth(220);
    obj.flowPart118:setHeight(24);
    obj.flowPart118:setName("flowPart118");
    obj.flowPart118:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart118:setVertAlign("leading");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart118);
    obj.edit56:setAlign("client");
    obj.edit56:setField("contadorUsos");
    obj.edit56:setHorzTextAlign("trailing");
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");
    obj.edit56:setFontSize(15);
    obj.edit56:setFontColor("white");

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout40);
    obj.flowPart119:setMinWidth(23);
    obj.flowPart119:setMaxWidth(115);
    obj.flowPart119:setHeight(24);
    obj.flowPart119:setName("flowPart119");
    obj.flowPart119:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart119:setVertAlign("leading");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart119);
    obj.label85:setAlign("client");
    obj.label85:setText("de");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");
    obj.label85:setFontColor("white");

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout40);
    obj.flowPart120:setMinWidth(44);
    obj.flowPart120:setMaxWidth(220);
    obj.flowPart120:setHeight(24);
    obj.flowPart120:setName("flowPart120");
    obj.flowPart120:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart120:setVertAlign("leading");

    obj.popupEditContadorUsosTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditContadorUsosTotal:setParent(obj.flowPart120);
    obj.popupEditContadorUsosTotal:setName("popupEditContadorUsosTotal");
    obj.popupEditContadorUsosTotal:setAlign("client");
    obj.popupEditContadorUsosTotal:setField("contadorUsosTotal");
    obj.popupEditContadorUsosTotal:setEnabled(false);
    obj.popupEditContadorUsosTotal:setFontSize(15);
    obj.popupEditContadorUsosTotal:setFontColor("white");

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout40);
    obj.flowPart121:setMinWidth(3);
    obj.flowPart121:setHeight(24);
    obj.flowPart121:setName("flowPart121");
    obj.flowPart121:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart121:setVertAlign("leading");

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout40);
    obj.flowPart122:setMinWidth(146);
    obj.flowPart122:setMaxWidth(730);
    obj.flowPart122:setHeight(24);
    obj.flowPart122:setName("flowPart122");
    obj.flowPart122:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart122:setVertAlign("leading");

    obj.popupEditContadorNome = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.popupEditContadorNome:setParent(obj.flowPart122);
    obj.popupEditContadorNome:setName("popupEditContadorNome");
    obj.popupEditContadorNome:setAlign("client");
    obj.popupEditContadorNome:setField("contadorNome");

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.flowLayout40);
    obj.dataLink92:setField("contadorNome");
    obj.dataLink92:setName("dataLink92");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.scrollBox5);
    obj.label86:setText("Efeitos da Magia");
    obj.label86:setName("label86");
    obj.label86:setAlign("top");
    obj.label86:setFontSize(16.0);
    obj.label86:setHeight(30);
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setFontColor("white");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.scrollBox5);
    obj.rectangle19:setHeight(30);
    obj.rectangle19:setName("rectangle19");
    obj.rectangle19:setAlign("top");
    obj.rectangle19:setColor("DimGray");
    obj.rectangle19:setMargins({top=2, bottom=2});
    obj.rectangle19:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle19:setXradius(2);
    obj.rectangle19:setYradius(2);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle19);
    obj.label87:setAlign("left");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setText("Tipo de Ataque");
    obj.label87:setName("label87");
    obj.label87:setFontColor("white");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.rectangle19);
    obj.comboBox11:setAlign("right");
    obj.comboBox11:setWidth(230);
    obj.comboBox11:setField("ataqueTipo");
    obj.comboBox11:setItems({'Sem Ataque', 'Ataque com Arma Corpo-a-Corpo', 'Ataque com Arma a Distância', 'Ataque de Magia Corpo-a-Corpo', 'Ataque de Magia a Distância'});
    obj.comboBox11:setName("comboBox11");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.scrollBox5);
    obj.rectangle20:setHeight(30);
    obj.rectangle20:setName("rectangle20");
    obj.rectangle20:setAlign("top");
    obj.rectangle20:setColor("DimGray");
    obj.rectangle20:setMargins({top=2, bottom=2});
    obj.rectangle20:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle20:setXradius(2);
    obj.rectangle20:setYradius(2);

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle20);
    obj.label88:setAlign("left");
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setText("Atributo de Ataque");
    obj.label88:setName("label88");
    obj.label88:setFontColor("white");

    obj.popupEditAtaqueAtrib = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.popupEditAtaqueAtrib:setParent(obj.rectangle20);
    obj.popupEditAtaqueAtrib:setName("popupEditAtaqueAtrib");
    obj.popupEditAtaqueAtrib:setAlign("right");
    obj.popupEditAtaqueAtrib:setWidth(230);
    obj.popupEditAtaqueAtrib:setField("ataqueAtributo");
    obj.popupEditAtaqueAtrib:setItems({'Conjuração', 'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.popupEditAtaqueAtrib:setValues({'conjuracao', 'forca', 'destreza', 'constituicao', 'inteligencia', 'sabedoria', 'carisma'});

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.scrollBox5);
    obj.rectangle21:setHeight(30);
    obj.rectangle21:setName("rectangle21");
    obj.rectangle21:setAlign("top");
    obj.rectangle21:setColor("DimGray");
    obj.rectangle21:setMargins({top=2, bottom=2});
    obj.rectangle21:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle21:setXradius(2);
    obj.rectangle21:setYradius(2);

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle21);
    obj.label89:setAlign("left");
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setText("Bônus de Ataque");
    obj.label89:setName("label89");
    obj.label89:setFontColor("white");

    obj.popupEditAtaqueBonus = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditAtaqueBonus:setParent(obj.rectangle21);
    obj.popupEditAtaqueBonus:setName("popupEditAtaqueBonus");
    obj.popupEditAtaqueBonus:setAlign("right");
    obj.popupEditAtaqueBonus:setWidth(230);
    obj.popupEditAtaqueBonus:setField("ataqueBonus");
    obj.popupEditAtaqueBonus:setFontSize(15);
    obj.popupEditAtaqueBonus:setFontColor("white");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.scrollBox5);
    obj.dataLink93:setField("ataqueTipo");
    obj.dataLink93:setName("dataLink93");

    obj.popupEditDanoRect = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.popupEditDanoRect:setParent(obj.scrollBox5);
    obj.popupEditDanoRect:setName("popupEditDanoRect");
    obj.popupEditDanoRect:setHeight(30);
    obj.popupEditDanoRect:setAlign("top");
    obj.popupEditDanoRect:setColor("DimGray");
    obj.popupEditDanoRect:setMargins({top=2, bottom=2});
    obj.popupEditDanoRect:setPadding({top=3, bottom=3, left=3, right=3});
    obj.popupEditDanoRect:setXradius(2);
    obj.popupEditDanoRect:setYradius(2);

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.popupEditDanoRect);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(30);
    obj.layout57:setName("layout57");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout57);
    obj.label90:setAlign("left");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setText("Fórmulas de Dano");
    obj.label90:setName("label90");
    obj.label90:setFontColor("white");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout57);
    obj.button39:setAlign("right");
    obj.button39:setWidth(140);
    obj.button39:setText("+ Adicionar Fórmula");
    obj.button39:setName("button39");

    obj.popupEditDanoLegenda = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.popupEditDanoLegenda:setParent(obj.popupEditDanoRect);
    obj.popupEditDanoLegenda:setName("popupEditDanoLegenda");
    obj.popupEditDanoLegenda:setAlign("bottom");
    obj.popupEditDanoLegenda:setHeight(22);
    obj.popupEditDanoLegenda:setPadding({top=2});
    obj.popupEditDanoLegenda:setVisible(false);
    obj.popupEditDanoLegenda:setMargins({left=1, right=1, top=2, bottom=2});
    obj.popupEditDanoLegenda:setVertAlign("leading");

    obj.flowPart123 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.popupEditDanoLegenda);
    obj.flowPart123:setWidth(34);
    obj.flowPart123:setMaxWidth(835);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setName("flowPart123");
    obj.flowPart123:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart123:setVertAlign("leading");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowPart123);
    obj.label91:setAlign("client");
    obj.label91:setText("Fórmula");
    obj.label91:setName("label91");
    obj.label91:setFontColor("white");

    obj.flowPart124 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.popupEditDanoLegenda);
    obj.flowPart124:setWidth(5);
    obj.flowPart124:setHeight(20);
    obj.flowPart124:setName("flowPart124");
    obj.flowPart124:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart124:setVertAlign("leading");

    obj.flowPart125 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.popupEditDanoLegenda);
    obj.flowPart125:setWidth(33);
    obj.flowPart125:setMaxWidth(830);
    obj.flowPart125:setHeight(20);
    obj.flowPart125:setName("flowPart125");
    obj.flowPart125:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart125:setVertAlign("leading");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.flowPart125);
    obj.label92:setAlign("client");
    obj.label92:setText("Contexto");
    obj.label92:setName("label92");
    obj.label92:setFontColor("white");

    obj.flowPart126 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.popupEditDanoLegenda);
    obj.flowPart126:setWidth(5);
    obj.flowPart126:setHeight(20);
    obj.flowPart126:setName("flowPart126");
    obj.flowPart126:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart126:setVertAlign("leading");

    obj.flowPart127 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.popupEditDanoLegenda);
    obj.flowPart127:setWidth(27);
    obj.flowPart127:setMaxWidth(685);
    obj.flowPart127:setHeight(20);
    obj.flowPart127:setName("flowPart127");
    obj.flowPart127:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart127:setVertAlign("leading");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowPart127);
    obj.label93:setAlign("client");
    obj.label93:setText("Tipo");
    obj.label93:setName("label93");
    obj.label93:setFontColor("white");

    obj.flowPart128 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.popupEditDanoLegenda);
    obj.flowPart128:setWidth(5);
    obj.flowPart128:setHeight(20);
    obj.flowPart128:setName("flowPart128");
    obj.flowPart128:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart128:setVertAlign("leading");

    obj.flowPart129 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.popupEditDanoLegenda);
    obj.flowPart129:setWidth(20);
    obj.flowPart129:setMaxWidth(35);
    obj.flowPart129:setHeight(20);
    obj.flowPart129:setName("flowPart129");
    obj.flowPart129:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart129:setVertAlign("leading");

    obj.popupEditDanoRL = GUI.fromHandle(_obj_newObject("recordList"));
    obj.popupEditDanoRL:setParent(obj.popupEditDanoRect);
    obj.popupEditDanoRL:setName("popupEditDanoRL");
    obj.popupEditDanoRL:setAlign("bottom");
    obj.popupEditDanoRL:setAutoHeight(true);
    obj.popupEditDanoRL:setTemplateForm("frmItemFormula");
    obj.popupEditDanoRL:setField("danos");

    obj.popupEditFormulaRect = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.popupEditFormulaRect:setParent(obj.scrollBox5);
    obj.popupEditFormulaRect:setName("popupEditFormulaRect");
    obj.popupEditFormulaRect:setHeight(30);
    obj.popupEditFormulaRect:setAlign("top");
    obj.popupEditFormulaRect:setColor("DimGray");
    obj.popupEditFormulaRect:setMargins({top=2, bottom=2});
    obj.popupEditFormulaRect:setPadding({top=3, bottom=3, left=3, right=3});
    obj.popupEditFormulaRect:setXradius(2);
    obj.popupEditFormulaRect:setYradius(2);

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.popupEditFormulaRect);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(30);
    obj.layout58:setName("layout58");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout58);
    obj.label94:setAlign("left");
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setText("Outras Fórmulas");
    obj.label94:setName("label94");
    obj.label94:setFontColor("white");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout58);
    obj.button40:setAlign("right");
    obj.button40:setWidth(140);
    obj.button40:setText("+ Adicionar Fórmula");
    obj.button40:setName("button40");

    obj.popupEditFormulaLegenda = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.popupEditFormulaLegenda:setParent(obj.popupEditFormulaRect);
    obj.popupEditFormulaLegenda:setName("popupEditFormulaLegenda");
    obj.popupEditFormulaLegenda:setAlign("bottom");
    obj.popupEditFormulaLegenda:setHeight(22);
    obj.popupEditFormulaLegenda:setPadding({top=2});
    obj.popupEditFormulaLegenda:setVisible(false);
    obj.popupEditFormulaLegenda:setMargins({left=1, right=1, top=2, bottom=2});
    obj.popupEditFormulaLegenda:setVertAlign("leading");

    obj.flowPart130 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.popupEditFormulaLegenda);
    obj.flowPart130:setWidth(34);
    obj.flowPart130:setMaxWidth(835);
    obj.flowPart130:setHeight(20);
    obj.flowPart130:setName("flowPart130");
    obj.flowPart130:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart130:setVertAlign("leading");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowPart130);
    obj.label95:setAlign("client");
    obj.label95:setText("Fórmula");
    obj.label95:setName("label95");
    obj.label95:setFontColor("white");

    obj.flowPart131 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.popupEditFormulaLegenda);
    obj.flowPart131:setWidth(5);
    obj.flowPart131:setHeight(20);
    obj.flowPart131:setName("flowPart131");
    obj.flowPart131:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart131:setVertAlign("leading");

    obj.flowPart132 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.popupEditFormulaLegenda);
    obj.flowPart132:setWidth(33);
    obj.flowPart132:setMaxWidth(830);
    obj.flowPart132:setHeight(20);
    obj.flowPart132:setName("flowPart132");
    obj.flowPart132:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart132:setVertAlign("leading");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.flowPart132);
    obj.label96:setAlign("client");
    obj.label96:setText("Contexto");
    obj.label96:setName("label96");
    obj.label96:setFontColor("white");

    obj.flowPart133 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.popupEditFormulaLegenda);
    obj.flowPart133:setWidth(5);
    obj.flowPart133:setHeight(20);
    obj.flowPart133:setName("flowPart133");
    obj.flowPart133:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart133:setVertAlign("leading");

    obj.flowPart134 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.popupEditFormulaLegenda);
    obj.flowPart134:setWidth(20);
    obj.flowPart134:setMaxWidth(35);
    obj.flowPart134:setHeight(20);
    obj.flowPart134:setName("flowPart134");
    obj.flowPart134:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart134:setVertAlign("leading");

    obj.popupEditFormulaRL = GUI.fromHandle(_obj_newObject("recordList"));
    obj.popupEditFormulaRL:setParent(obj.popupEditFormulaRect);
    obj.popupEditFormulaRL:setName("popupEditFormulaRL");
    obj.popupEditFormulaRL:setAlign("bottom");
    obj.popupEditFormulaRL:setAutoHeight(true);
    obj.popupEditFormulaRL:setTemplateForm("frmItemFormula");
    obj.popupEditFormulaRL:setField("formulas");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.scrollBox5);
    obj.rectangle22:setHeight(30);
    obj.rectangle22:setName("rectangle22");
    obj.rectangle22:setAlign("top");
    obj.rectangle22:setColor("DimGray");
    obj.rectangle22:setMargins({top=2, bottom=2});
    obj.rectangle22:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle22:setXradius(2);
    obj.rectangle22:setYradius(2);

    obj.flowLayout41 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout41:setParent(obj.rectangle22);
    obj.flowLayout41:setAlign("client");
    obj.flowLayout41:setName("flowLayout41");
    obj.flowLayout41:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout41:setVertAlign("leading");

    obj.flowPart135 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout41);
    obj.flowPart135:setMinWidth(173);
    obj.flowPart135:setMaxWidth(865);
    obj.flowPart135:setHeight(24);
    obj.flowPart135:setName("flowPart135");
    obj.flowPart135:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart135:setVertAlign("leading");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.flowPart135);
    obj.label97:setAlign("client");
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setText("Teste de Resistência");
    obj.label97:setName("label97");
    obj.label97:setFontColor("white");

    obj.flowPart136 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.flowLayout41);
    obj.flowPart136:setMinWidth(3);
    obj.flowPart136:setHeight(24);
    obj.flowPart136:setName("flowPart136");
    obj.flowPart136:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart136:setVertAlign("leading");

    obj.flowPart137 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout41);
    obj.flowPart137:setMinWidth(106);
    obj.flowPart137:setMaxWidth(530);
    obj.flowPart137:setHeight(24);
    obj.flowPart137:setName("flowPart137");
    obj.flowPart137:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart137:setVertAlign("leading");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.flowPart137);
    obj.comboBox12:setAlign("client");
    obj.comboBox12:setField("cdResistenciaAtributo");
    obj.comboBox12:setItems({'', 'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma'});
    obj.comboBox12:setValues({'', 'forca', 'destreza', 'constituicao', 'inteligencia', 'sabedoria', 'carisma'});
    obj.comboBox12:setName("comboBox12");

    obj.flowPart138 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.flowLayout41);
    obj.flowPart138:setMinWidth(61);
    obj.flowPart138:setMaxWidth(305);
    obj.flowPart138:setHeight(24);
    obj.flowPart138:setName("flowPart138");
    obj.flowPart138:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart138:setVertAlign("leading");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.flowPart138);
    obj.label98:setAlign("client");
    obj.label98:setText("contra CD.");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");
    obj.label98:setFontColor("white");

    obj.flowPart139 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout41);
    obj.flowPart139:setMinWidth(30);
    obj.flowPart139:setMaxWidth(150);
    obj.flowPart139:setHeight(24);
    obj.flowPart139:setName("flowPart139");
    obj.flowPart139:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart139:setVertAlign("leading");

    obj.popupEditCDvalor = GUI.fromHandle(_obj_newObject("edit"));
    obj.popupEditCDvalor:setParent(obj.flowPart139);
    obj.popupEditCDvalor:setName("popupEditCDvalor");
    obj.popupEditCDvalor:setAlign("client");
    obj.popupEditCDvalor:setType("number");
    obj.popupEditCDvalor:setField("cdResistenciaValor");
    obj.popupEditCDvalor:setEnabled(false);
    obj.popupEditCDvalor:setFontSize(15);
    obj.popupEditCDvalor:setFontColor("white");

    obj.flowPart140 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.flowLayout41);
    obj.flowPart140:setMinWidth(3);
    obj.flowPart140:setHeight(24);
    obj.flowPart140:setName("flowPart140");
    obj.flowPart140:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart140:setVertAlign("leading");

    obj.flowPart141 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout41);
    obj.flowPart141:setMinWidth(106);
    obj.flowPart141:setMaxWidth(630);
    obj.flowPart141:setHeight(24);
    obj.flowPart141:setName("flowPart141");
    obj.flowPart141:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart141:setVertAlign("leading");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.flowPart141);
    obj.comboBox13:setAlign("client");
    obj.comboBox13:setField("cdResistenciaTipo");
    obj.comboBox13:setItems({'Conjuração', 'Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma', 'Fixo'});
    obj.comboBox13:setValues({'conjuracao', 'forca', 'destreza', 'constituicao', 'inteligencia', 'sabedoria', 'carisma', 'fixo'});
    obj.comboBox13:setName("comboBox13");

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.flowLayout41);
    obj.dataLink94:setField("cdResistenciaTipo");
    obj.dataLink94:setName("dataLink94");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.scrollBox5);
    obj.rectangle23:setHeight(60);
    obj.rectangle23:setName("rectangle23");
    obj.rectangle23:setAlign("top");
    obj.rectangle23:setColor("DimGray");
    obj.rectangle23:setMargins({top=2, bottom=2});
    obj.rectangle23:setPadding({top=3, bottom=3, left=3, right=3});
    obj.rectangle23:setXradius(2);
    obj.rectangle23:setYradius(2);

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle23);
    obj.label99:setAlign("top");
    obj.label99:setText("Mensagem");
    obj.label99:setHeight(27);
    obj.label99:setName("label99");
    obj.label99:setFontColor("white");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.rectangle23);
    obj.edit57:setAlign("top");
    obj.edit57:setField("mensagem");
    obj.edit57:setHeight(27);
    obj.edit57:setName("edit57");
    obj.edit57:setFontSize(15);
    obj.edit57:setFontColor("white");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tcPopupEdit);
    obj.tab8:setTitle("Importar");
    obj.tab8:setName("tab8");

 require("import5etools.lua"); 


    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.tab8);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setPadding({top=5, bottom=5, left=5, right=5});
    obj.scrollBox6:setName("scrollBox6");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.scrollBox6);
    obj.label100:setText("Qual a fonte da magia?");
    obj.label100:setName("label100");
    obj.label100:setAlign("top");
    obj.label100:setFontSize(16.0);
    obj.label100:setHeight(30);
    lfm_setPropAsString(obj.label100, "fontStyle",  "bold");
    obj.label100:setFontColor("white");

    obj.comboBoxImportSource = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBoxImportSource:setParent(obj.scrollBox6);
    obj.comboBoxImportSource:setName("comboBoxImportSource");
    obj.comboBoxImportSource:setAlign("top");
    obj.comboBoxImportSource:setField("importSourceName");

 dload.getSourceNames(self, "spells", function(items) self.comboBoxImportSource:setItems(items); end); 


    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.scrollBox6);
    obj.dataLink95:setField("importSourceName");
    obj.dataLink95:setDefaultValue("PHB");
    obj.dataLink95:setName("dataLink95");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.scrollBox6);
    obj.edit58:setAlign("top");
    obj.edit58:setField("importSourcePath");
    obj.edit58:setReadOnly(true);
    obj.edit58:setName("edit58");
    obj.edit58:setFontSize(15);
    obj.edit58:setFontColor("white");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.scrollBox6);
    obj.label101:setText("Qual o nível da magia?");
    obj.label101:setName("label101");
    obj.label101:setAlign("top");
    obj.label101:setFontSize(16.0);
    obj.label101:setHeight(30);
    lfm_setPropAsString(obj.label101, "fontStyle",  "bold");
    obj.label101:setFontColor("white");

    obj.comboBoxImportLevel = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBoxImportLevel:setParent(obj.scrollBox6);
    obj.comboBoxImportLevel:setName("comboBoxImportLevel");
    obj.comboBoxImportLevel:setAlign("top");
    obj.comboBoxImportLevel:setField("importLevel");
    obj.comboBoxImportLevel:setItems({'Qualquer', 'Truque', '1º nível', '2º nível', '3º nível', '4º nível', '5º nível', '6º nível', '7º nível', '8º nível', '9º nível'});
    obj.comboBoxImportLevel:setValues({'', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'});

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.scrollBox6);
    obj.dataLink96:setField("importLevel");
    obj.dataLink96:setDefaultValue("0");
    obj.dataLink96:setName("dataLink96");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.scrollBox6);
    obj.label102:setText("Qual a classe da magia?");
    obj.label102:setName("label102");
    obj.label102:setAlign("top");
    obj.label102:setFontSize(16.0);
    obj.label102:setHeight(30);
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold");
    obj.label102:setFontColor("white");

    obj.comboBoxImportClass = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBoxImportClass:setParent(obj.scrollBox6);
    obj.comboBoxImportClass:setName("comboBoxImportClass");
    obj.comboBoxImportClass:setAlign("top");
    obj.comboBoxImportClass:setField("importClass");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.scrollBox6);
    obj.dataLink97:setFields({'importSourcePath', 'importLevel'});
    obj.dataLink97:setName("dataLink97");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.scrollBox6);
    obj.label103:setText("Qual a magia?");
    obj.label103:setName("label103");
    obj.label103:setAlign("top");
    obj.label103:setFontSize(16.0);
    obj.label103:setHeight(30);
    lfm_setPropAsString(obj.label103, "fontStyle",  "bold");
    obj.label103:setFontColor("white");

    obj.comboBoxImportMagia = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBoxImportMagia:setParent(obj.scrollBox6);
    obj.comboBoxImportMagia:setName("comboBoxImportMagia");
    obj.comboBoxImportMagia:setAlign("top");
    obj.comboBoxImportMagia:setField("importName");

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.scrollBox6);
    obj.dataLink98:setFields({'importSourcePath', 'importLevel', 'importClass'});
    obj.dataLink98:setName("dataLink98");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.scrollBox6);
    obj.button41:setText("Importar");
    obj.button41:setName("button41");
    obj.button41:setAlign("top");
    obj.button41:setFontSize(16.0);
    obj.button41:setHeight(30);
    lfm_setPropAsString(obj.button41, "fontStyle",  "bold");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.rectangle5);
    obj.dataLink99:setFields({'magias.habilidadeDeConjuracao', 'atributos.modForca', 'atributos.modDestreza', 'atributos.modConstituicao', 'atributos.modInteligencia', 'atributos.modSabedoria', 'atributos.modCarisma', 'bonusProficiencia'});
    obj.dataLink99:setName("dataLink99");

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.rectangle5);
    obj.dataLink100:setField("magias.selecionada");
    obj.dataLink100:setName("dataLink100");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.pgcPrincipal);
    obj.tab9:setTitle("Contadores");
    obj.tab9:setName("tab9");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.tab9);
    obj.rectangle24:setName("rectangle24");
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("#40000000");
    obj.rectangle24:setXradius(10);
    obj.rectangle24:setYradius(10);

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.rectangle24);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.scrollBox7);
    obj.button42:setText("Add");
    obj.button42:setAlign("top");
    obj.button42:setName("button42");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.scrollBox7);
    obj.button43:setText("Import from Macro");
    obj.button43:setAlign("top");
    obj.button43:setName("button43");

    obj.rclContadores = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclContadores:setParent(obj.scrollBox7);
    obj.rclContadores:setName("rclContadores");
    obj.rclContadores:setAlign("top");
    obj.rclContadores:setField("contadores");
    obj.rclContadores:setTemplateForm("frmContador");
    obj.rclContadores:setAutoHeight(true);
    obj.rclContadores:setMinHeight(5);
    obj.rclContadores:setHitTest(false);
    obj.rclContadores:setMargins({top=10, bottom=10, left=10, right=10});

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.rectangle24);
    obj.dataLink101:setFields({'descansoLongo', 'descansoCurto'});
    obj.dataLink101:setName("dataLink101");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.pgcPrincipal);
    obj.tab10:setTitle("Propriedades");
    obj.tab10:setName("tab10");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.tab10);
    obj.rectangle25:setName("rectangle25");
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("#40000000");
    obj.rectangle25:setXradius(10);
    obj.rectangle25:setYradius(10);

    obj.rclFichaPropriedades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclFichaPropriedades:setParent(obj.rectangle25);
    obj.rclFichaPropriedades:setName("rclFichaPropriedades");
    obj.rclFichaPropriedades:setAlign("client");
    obj.rclFichaPropriedades:setField("propriedades.rcl");
    obj.rclFichaPropriedades:setTemplateForm("frmFichaPropriedade");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.rectangle25);
    obj.button44:setAlign("bottom");
    obj.button44:setText("Resetar Propriedades");
    obj.button44:setName("button44");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.rectangle25);
    obj.button45:setAlign("bottom");
    obj.button45:setText("Adicionar Propriedade");
    obj.button45:setName("button45");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.pgcPrincipal);
    obj.tab11:setTitle("Anotações");
    obj.tab11:setName("tab11");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.tab11);
    obj.rectangle26:setName("rectangle26");
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("#40000000");
    obj.rectangle26:setXradius(10);
    obj.rectangle26:setYradius(10);

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.rectangle26);
    obj.checkBox9:setAlign("right");
    obj.checkBox9:setWidth(15);
    obj.checkBox9:setField("outros.anotacoes_melhorado");
    obj.checkBox9:setName("checkBox9");

    obj.anotacoesFancy = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.anotacoesFancy:setParent(obj.rectangle26);
    obj.anotacoesFancy:setName("anotacoesFancy");
    obj.anotacoesFancy:setAlign("client");
    lfm_setPropAsString(obj.anotacoesFancy, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.anotacoesFancy, "defaultFontColor",  "white");
    obj.anotacoesFancy:setField("outros.anotacoes2");
    lfm_setPropAsString(obj.anotacoesFancy, "hideSelection",  "false");
    lfm_setPropAsString(obj.anotacoesFancy, "defaultFontSize",  "15");
    lfm_setPropAsString(obj.anotacoesFancy, "animateImages",  "true");
    obj.anotacoesFancy:setMargins({left=2, right=2, top=2, bottom=2});
    obj.anotacoesFancy:setVisible(false);

    obj.anotacoesMerda = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoesMerda:setParent(obj.rectangle26);
    obj.anotacoesMerda:setName("anotacoesMerda");
    obj.anotacoesMerda:setAlign("client");
    obj.anotacoesMerda:setField("outros.anotacoes");
    obj.anotacoesMerda:setMargins({left=2, right=2, top=2, bottom=2});
    obj.anotacoesMerda:setVisible(true);
    obj.anotacoesMerda:setTransparent(true);

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.pgcPrincipal);
    obj.tab12:setTitle("Outros");
    obj.tab12:setName("tab12");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.tab12);
    obj.rectangle27:setName("rectangle27");
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("#40000000");
    obj.rectangle27:setXradius(10);
    obj.rectangle27:setYradius(10);

 require("common.lua"); require("import5etools.lua"); 


    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.rectangle27);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox8);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(150);
    obj.layout59:setName("layout59");

    obj.btnPolymorph = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPolymorph:setParent(obj.layout59);
    obj.btnPolymorph:setName("btnPolymorph");
    obj.btnPolymorph:setText("Transformar");
    obj.btnPolymorph:setAlign("top");
    obj.btnPolymorph:setEnabled(true);

    obj.btnUnpolymorph = GUI.fromHandle(_obj_newObject("button"));
    obj.btnUnpolymorph:setParent(obj.layout59);
    obj.btnUnpolymorph:setName("btnUnpolymorph");
    obj.btnUnpolymorph:setText("Reverter");
    obj.btnUnpolymorph:setAlign("top");
    obj.btnUnpolymorph:setEnabled(false);

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout59);
    obj.dataLink102:setField("polymorph.old");
    obj.dataLink102:setName("dataLink102");

    obj.flowLayout42 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout42:setParent(obj.layout59);
    obj.flowLayout42:setAlign("client");
    obj.flowLayout42:setName("flowLayout42");
    obj.flowLayout42:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout42:setVertAlign("leading");

    obj.GridCampoSolido1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido1:setParent(obj.flowLayout42);
    obj.GridCampoSolido1:setHeight(50);
    obj.GridCampoSolido1:setMinScaledWidth(32);
    obj.GridCampoSolido1:setMinWidth(32);
    obj.GridCampoSolido1:setMaxWidth(32);
    obj.GridCampoSolido1:setMaxScaledWidth(32);
    obj.GridCampoSolido1:setAvoidScale(true);
    obj.GridCampoSolido1:setName("GridCampoSolido1");
    obj.GridCampoSolido1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.GridCampoSolido1:setVertAlign("leading");

    obj.cbxGridCampoSolido1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.cbxGridCampoSolido1:setAlign("top");
    obj.cbxGridCampoSolido1:setWidth(20);
    obj.cbxGridCampoSolido1:setMargins({});
    obj.cbxGridCampoSolido1:setField("polymorph.config.atributos.str");
    obj.cbxGridCampoSolido1:setOptimize(false);
    obj.cbxGridCampoSolido1:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido1:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido1:setName("cbxGridCampoSolido1");
    obj.cbxGridCampoSolido1:setHeight(32);
    obj.cbxGridCampoSolido1:setVisible(true);

    obj.labGridCampoSolido1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.labGridCampoSolido1:setName("labGridCampoSolido1");
    obj.labGridCampoSolido1:setAlign("top");
    obj.labGridCampoSolido1:setText("FORÇA");
    obj.labGridCampoSolido1:setHorzTextAlign("center");
    obj.labGridCampoSolido1:setVertTextAlign("leading");
    obj.labGridCampoSolido1:setWordWrap(true);
    obj.labGridCampoSolido1:setTextTrimming("none");
    obj.labGridCampoSolido1:setFontSize(12);
    obj.labGridCampoSolido1:setFontColor("#D0D0D0");

    self.GridCampoSolido1:setHeight(self.cbxGridCampoSolido1:getHeight() + self.labGridCampoSolido1:getHeight());


    obj.GridCampoSolido2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido2:setParent(obj.flowLayout42);
    obj.GridCampoSolido2:setHeight(50);
    obj.GridCampoSolido2:setMinScaledWidth(32);
    obj.GridCampoSolido2:setMinWidth(32);
    obj.GridCampoSolido2:setMaxWidth(32);
    obj.GridCampoSolido2:setMaxScaledWidth(32);
    obj.GridCampoSolido2:setAvoidScale(true);
    obj.GridCampoSolido2:setName("GridCampoSolido2");
    obj.GridCampoSolido2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.GridCampoSolido2:setVertAlign("leading");

    obj.cbxGridCampoSolido2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.cbxGridCampoSolido2:setAlign("top");
    obj.cbxGridCampoSolido2:setWidth(20);
    obj.cbxGridCampoSolido2:setMargins({});
    obj.cbxGridCampoSolido2:setField("polymorph.config.atributos.dex");
    obj.cbxGridCampoSolido2:setOptimize(false);
    obj.cbxGridCampoSolido2:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido2:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido2:setName("cbxGridCampoSolido2");
    obj.cbxGridCampoSolido2:setHeight(32);
    obj.cbxGridCampoSolido2:setVisible(true);

    obj.labGridCampoSolido2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.labGridCampoSolido2:setName("labGridCampoSolido2");
    obj.labGridCampoSolido2:setAlign("top");
    obj.labGridCampoSolido2:setText("DESTREZA");
    obj.labGridCampoSolido2:setHorzTextAlign("center");
    obj.labGridCampoSolido2:setVertTextAlign("leading");
    obj.labGridCampoSolido2:setWordWrap(true);
    obj.labGridCampoSolido2:setTextTrimming("none");
    obj.labGridCampoSolido2:setFontSize(12);
    obj.labGridCampoSolido2:setFontColor("#D0D0D0");

    self.GridCampoSolido2:setHeight(self.cbxGridCampoSolido2:getHeight() + self.labGridCampoSolido2:getHeight());


    obj.GridCampoSolido3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido3:setParent(obj.flowLayout42);
    obj.GridCampoSolido3:setHeight(50);
    obj.GridCampoSolido3:setMinScaledWidth(32);
    obj.GridCampoSolido3:setMinWidth(32);
    obj.GridCampoSolido3:setMaxWidth(32);
    obj.GridCampoSolido3:setMaxScaledWidth(32);
    obj.GridCampoSolido3:setAvoidScale(true);
    obj.GridCampoSolido3:setName("GridCampoSolido3");
    obj.GridCampoSolido3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.GridCampoSolido3:setVertAlign("leading");

    obj.cbxGridCampoSolido3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.cbxGridCampoSolido3:setAlign("top");
    obj.cbxGridCampoSolido3:setWidth(20);
    obj.cbxGridCampoSolido3:setMargins({});
    obj.cbxGridCampoSolido3:setField("polymorph.config.atributos.con");
    obj.cbxGridCampoSolido3:setOptimize(false);
    obj.cbxGridCampoSolido3:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido3:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido3:setName("cbxGridCampoSolido3");
    obj.cbxGridCampoSolido3:setHeight(32);
    obj.cbxGridCampoSolido3:setVisible(true);

    obj.labGridCampoSolido3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.labGridCampoSolido3:setName("labGridCampoSolido3");
    obj.labGridCampoSolido3:setAlign("top");
    obj.labGridCampoSolido3:setText("CONSTITUIÇÃO");
    obj.labGridCampoSolido3:setHorzTextAlign("center");
    obj.labGridCampoSolido3:setVertTextAlign("leading");
    obj.labGridCampoSolido3:setWordWrap(true);
    obj.labGridCampoSolido3:setTextTrimming("none");
    obj.labGridCampoSolido3:setFontSize(12);
    obj.labGridCampoSolido3:setFontColor("#D0D0D0");

    self.GridCampoSolido3:setHeight(self.cbxGridCampoSolido3:getHeight() + self.labGridCampoSolido3:getHeight());


    obj.GridCampoSolido4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido4:setParent(obj.flowLayout42);
    obj.GridCampoSolido4:setHeight(50);
    obj.GridCampoSolido4:setMinScaledWidth(32);
    obj.GridCampoSolido4:setMinWidth(32);
    obj.GridCampoSolido4:setMaxWidth(32);
    obj.GridCampoSolido4:setMaxScaledWidth(32);
    obj.GridCampoSolido4:setAvoidScale(true);
    obj.GridCampoSolido4:setName("GridCampoSolido4");
    obj.GridCampoSolido4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.GridCampoSolido4:setVertAlign("leading");

    obj.cbxGridCampoSolido4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.cbxGridCampoSolido4:setAlign("top");
    obj.cbxGridCampoSolido4:setWidth(20);
    obj.cbxGridCampoSolido4:setMargins({});
    obj.cbxGridCampoSolido4:setField("polymorph.config.atributos.int");
    obj.cbxGridCampoSolido4:setOptimize(false);
    obj.cbxGridCampoSolido4:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido4:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido4:setName("cbxGridCampoSolido4");
    obj.cbxGridCampoSolido4:setHeight(32);
    obj.cbxGridCampoSolido4:setVisible(true);

    obj.labGridCampoSolido4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.labGridCampoSolido4:setName("labGridCampoSolido4");
    obj.labGridCampoSolido4:setAlign("top");
    obj.labGridCampoSolido4:setText("INTELIGÊNCIA");
    obj.labGridCampoSolido4:setHorzTextAlign("center");
    obj.labGridCampoSolido4:setVertTextAlign("leading");
    obj.labGridCampoSolido4:setWordWrap(true);
    obj.labGridCampoSolido4:setTextTrimming("none");
    obj.labGridCampoSolido4:setFontSize(12);
    obj.labGridCampoSolido4:setFontColor("#D0D0D0");

    self.GridCampoSolido4:setHeight(self.cbxGridCampoSolido4:getHeight() + self.labGridCampoSolido4:getHeight());


    obj.GridCampoSolido5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido5:setParent(obj.flowLayout42);
    obj.GridCampoSolido5:setHeight(50);
    obj.GridCampoSolido5:setMinScaledWidth(32);
    obj.GridCampoSolido5:setMinWidth(32);
    obj.GridCampoSolido5:setMaxWidth(32);
    obj.GridCampoSolido5:setMaxScaledWidth(32);
    obj.GridCampoSolido5:setAvoidScale(true);
    obj.GridCampoSolido5:setName("GridCampoSolido5");
    obj.GridCampoSolido5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.GridCampoSolido5:setVertAlign("leading");

    obj.cbxGridCampoSolido5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.cbxGridCampoSolido5:setAlign("top");
    obj.cbxGridCampoSolido5:setWidth(20);
    obj.cbxGridCampoSolido5:setMargins({});
    obj.cbxGridCampoSolido5:setField("polymorph.config.atributos.wis");
    obj.cbxGridCampoSolido5:setOptimize(false);
    obj.cbxGridCampoSolido5:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido5:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido5:setName("cbxGridCampoSolido5");
    obj.cbxGridCampoSolido5:setHeight(32);
    obj.cbxGridCampoSolido5:setVisible(true);

    obj.labGridCampoSolido5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.labGridCampoSolido5:setName("labGridCampoSolido5");
    obj.labGridCampoSolido5:setAlign("top");
    obj.labGridCampoSolido5:setText("SABEDORIA");
    obj.labGridCampoSolido5:setHorzTextAlign("center");
    obj.labGridCampoSolido5:setVertTextAlign("leading");
    obj.labGridCampoSolido5:setWordWrap(true);
    obj.labGridCampoSolido5:setTextTrimming("none");
    obj.labGridCampoSolido5:setFontSize(12);
    obj.labGridCampoSolido5:setFontColor("#D0D0D0");

    self.GridCampoSolido5:setHeight(self.cbxGridCampoSolido5:getHeight() + self.labGridCampoSolido5:getHeight());


    obj.GridCampoSolido6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido6:setParent(obj.flowLayout42);
    obj.GridCampoSolido6:setHeight(50);
    obj.GridCampoSolido6:setMinScaledWidth(32);
    obj.GridCampoSolido6:setMinWidth(32);
    obj.GridCampoSolido6:setMaxWidth(32);
    obj.GridCampoSolido6:setMaxScaledWidth(32);
    obj.GridCampoSolido6:setAvoidScale(true);
    obj.GridCampoSolido6:setName("GridCampoSolido6");
    obj.GridCampoSolido6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.GridCampoSolido6:setVertAlign("leading");

    obj.cbxGridCampoSolido6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.cbxGridCampoSolido6:setAlign("top");
    obj.cbxGridCampoSolido6:setWidth(20);
    obj.cbxGridCampoSolido6:setMargins({});
    obj.cbxGridCampoSolido6:setField("polymorph.config.atributos.cha");
    obj.cbxGridCampoSolido6:setOptimize(false);
    obj.cbxGridCampoSolido6:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido6:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido6:setName("cbxGridCampoSolido6");
    obj.cbxGridCampoSolido6:setHeight(32);
    obj.cbxGridCampoSolido6:setVisible(true);

    obj.labGridCampoSolido6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.labGridCampoSolido6:setName("labGridCampoSolido6");
    obj.labGridCampoSolido6:setAlign("top");
    obj.labGridCampoSolido6:setText("CARISMA");
    obj.labGridCampoSolido6:setHorzTextAlign("center");
    obj.labGridCampoSolido6:setVertTextAlign("leading");
    obj.labGridCampoSolido6:setWordWrap(true);
    obj.labGridCampoSolido6:setTextTrimming("none");
    obj.labGridCampoSolido6:setFontSize(12);
    obj.labGridCampoSolido6:setFontColor("#D0D0D0");

    self.GridCampoSolido6:setHeight(self.cbxGridCampoSolido6:getHeight() + self.labGridCampoSolido6:getHeight());


    obj.GridCampoSolido7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido7:setParent(obj.flowLayout42);
    obj.GridCampoSolido7:setHeight(50);
    obj.GridCampoSolido7:setMinScaledWidth(32);
    obj.GridCampoSolido7:setMinWidth(32);
    obj.GridCampoSolido7:setMaxWidth(32);
    obj.GridCampoSolido7:setMaxScaledWidth(32);
    obj.GridCampoSolido7:setAvoidScale(true);
    obj.GridCampoSolido7:setName("GridCampoSolido7");
    obj.GridCampoSolido7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.GridCampoSolido7:setVertAlign("leading");

    obj.cbxGridCampoSolido7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.cbxGridCampoSolido7:setAlign("top");
    obj.cbxGridCampoSolido7:setWidth(20);
    obj.cbxGridCampoSolido7:setMargins({});
    obj.cbxGridCampoSolido7:setField("polymorph.config.token");
    obj.cbxGridCampoSolido7:setOptimize(false);
    obj.cbxGridCampoSolido7:setImageChecked("images/checkbox2_checked.png");
    obj.cbxGridCampoSolido7:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.cbxGridCampoSolido7:setName("cbxGridCampoSolido7");
    obj.cbxGridCampoSolido7:setHeight(32);
    obj.cbxGridCampoSolido7:setVisible(true);

    obj.labGridCampoSolido7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.labGridCampoSolido7:setName("labGridCampoSolido7");
    obj.labGridCampoSolido7:setAlign("top");
    obj.labGridCampoSolido7:setText("TOKEN");
    obj.labGridCampoSolido7:setHorzTextAlign("center");
    obj.labGridCampoSolido7:setVertTextAlign("leading");
    obj.labGridCampoSolido7:setWordWrap(true);
    obj.labGridCampoSolido7:setTextTrimming("none");
    obj.labGridCampoSolido7:setFontSize(12);
    obj.labGridCampoSolido7:setFontColor("#D0D0D0");

    self.GridCampoSolido7:setHeight(self.cbxGridCampoSolido7:getHeight() + self.labGridCampoSolido7:getHeight());


    obj.upperGridMagicBox7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox7:setParent(obj.flowLayout42);
    obj.upperGridMagicBox7:setHeight(60);
    obj.upperGridMagicBox7:setMinScaledWidth(100);
    obj.upperGridMagicBox7:setMinWidth(100);
    obj.upperGridMagicBox7:setMaxWidth(160);
    obj.upperGridMagicBox7:setMaxScaledWidth(160);
    obj.upperGridMagicBox7:setAvoidScale(true);
    obj.upperGridMagicBox7:setName("upperGridMagicBox7");
    obj.upperGridMagicBox7:setVertAlign("leading");
    obj.upperGridMagicBox7:setMargins({left=5, right=5, top=5, bottom=5});


					rawset(self.upperGridMagicBox7, "_RecalcSize",
						function ()
							self.upperGridMagicBox7:setHeight(self.panupperGridMagicBox7:getHeight() + self.labupperGridMagicBox7:getHeight());
						end);
				


    obj.panupperGridMagicBox7 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox7:setParent(obj.upperGridMagicBox7);
    obj.panupperGridMagicBox7:setName("panupperGridMagicBox7");
    obj.panupperGridMagicBox7:setAlign("top");
    obj.panupperGridMagicBox7:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox7:setHeight(50);

    obj.cmbupperGridMagicBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbupperGridMagicBox7:setParent(obj.panupperGridMagicBox7);
    obj.cmbupperGridMagicBox7:setName("cmbupperGridMagicBox7");
    obj.cmbupperGridMagicBox7:setFrameRegion("ContentRegion");
    obj.cmbupperGridMagicBox7:setField("polymorph.config.PV");
    obj.cmbupperGridMagicBox7:setItems({'Não muda', 'Média', 'Rolar', 'Animus'});
    obj.cmbupperGridMagicBox7:setValues({});
    obj.cmbupperGridMagicBox7:setHorzTextAlign("center");
    obj.cmbupperGridMagicBox7:setVertTextAlign("center");
    obj.cmbupperGridMagicBox7:setFontSize(13);
    obj.cmbupperGridMagicBox7:setTransparent(true);

    obj.labupperGridMagicBox7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox7:setParent(obj.upperGridMagicBox7);
    obj.labupperGridMagicBox7:setName("labupperGridMagicBox7");
    obj.labupperGridMagicBox7:setAlign("top");
    obj.labupperGridMagicBox7:setAutoSize(true);
    obj.labupperGridMagicBox7:setText("PONTOS DE VIDA");
    obj.labupperGridMagicBox7:setHorzTextAlign("center");
    obj.labupperGridMagicBox7:setVertTextAlign("leading");
    obj.labupperGridMagicBox7:setWordWrap(true);
    obj.labupperGridMagicBox7:setTextTrimming("none");
    obj.labupperGridMagicBox7:setFontSize(12);
    obj.labupperGridMagicBox7:setFontColor("#D0D0D0");

self.upperGridMagicBox7._RecalcSize();	


    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout59);
    obj.dataLink103:setField("polymorph.config.atributos.str");
    obj.dataLink103:setDefaultValue("true");
    obj.dataLink103:setName("dataLink103");

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout59);
    obj.dataLink104:setField("polymorph.config.atributos.dex");
    obj.dataLink104:setDefaultValue("true");
    obj.dataLink104:setName("dataLink104");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout59);
    obj.dataLink105:setField("polymorph.config.atributos.con");
    obj.dataLink105:setDefaultValue("true");
    obj.dataLink105:setName("dataLink105");

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout59);
    obj.dataLink106:setField("polymorph.config.atributos.int");
    obj.dataLink106:setDefaultValue("false");
    obj.dataLink106:setName("dataLink106");

    obj.dataLink107 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout59);
    obj.dataLink107:setField("polymorph.config.atributos.wis");
    obj.dataLink107:setDefaultValue("false");
    obj.dataLink107:setName("dataLink107");

    obj.dataLink108 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout59);
    obj.dataLink108:setField("polymorph.config.atributos.cha");
    obj.dataLink108:setDefaultValue("false");
    obj.dataLink108:setName("dataLink108");

    obj.dataLink109 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout59);
    obj.dataLink109:setField("polymorph.config.PV");
    obj.dataLink109:setDefaultValue("Média");
    obj.dataLink109:setName("dataLink109");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout59);
    obj.button46:setText("Limpar ficha");
    obj.button46:setAlign("top");
    obj.button46:setVisible(false);
    obj.button46:setName("button46");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            mudaNick(sheet.nome);
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;
            					sheet.atributos.modforca = modificador;
            
            					if modificador >= 0 then
            						sheet.atributos.modforcastr = "+" .. modificador;
            					else
            						sheet.atributos.modforcastr = "-" .. math.abs(modificador);
            					end;
            				else
            					sheet.atributos.modforca = nil;
            					sheet.atributos.modforcastr = nil;
            				end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'forca'}, nil, false);
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'forca'}, nil, true);
        end, obj);

    obj._e_event6 = obj.cbProfforca:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["forca"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'forca', true);
            						sheet.resistencias.forca = true;
            					end;
        end, obj);

    obj._e_event7 = obj.cbProfforca:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'forca', false);
        end, obj);

    obj._e_event8 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("forca");
        end, obj);

    obj._e_event9 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['forca'] then updateCbVisibility('forca'); end;
        end, obj);

    obj._e_event10 = obj.button2:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event11 = obj.button2:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event12 = obj.button2:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.forca'}, nil, false);
        end, obj);

    obj._e_event13 = obj.button2:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.forca'}, nil, true);
        end, obj);

    obj._e_event14 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'resistencia', 'forca');
            
            						sheet.resistencias.bonusforca = valor;
            
            						if valor >= 0 then
            							sheet.resistencias.bonusforcastr = "+" .. valor;
            						else
            							sheet.resistencias.bonusforcastr = "-" .. math.abs(valor);
            						end;
            
            						self.labProfforca:setHitTest(true);
            						self.labProfforca:setHint(hint);
        end, obj);

    obj._e_event15 = obj.cbProfatletismo:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["atletismo"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'atletismo', true);
            						sheet.pericias.atletismo = true;
            					end;
        end, obj);

    obj._e_event16 = obj.cbProfatletismo:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'atletismo', false);
        end, obj);

    obj._e_event17 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("atletismo");
        end, obj);

    obj._e_event18 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['atletismo'] then updateCbVisibility('atletismo'); end;
        end, obj);

    obj._e_event19 = obj.button3:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event20 = obj.button3:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event21 = obj.button3:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atletismo'}, nil, false);
        end, obj);

    obj._e_event22 = obj.button3:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atletismo'}, nil, true);
        end, obj);

    obj._e_event23 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'forca', 'atletismo');
            
            							sheet.pericias.bonusatletismo = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusatletismostr = "+" .. valor;
            							else
            								sheet.pericias.bonusatletismostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfatletismo:setHitTest(true);
            							self.labProfatletismo:setHint(hint);
        end, obj);

    obj._e_event24 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;
            					sheet.atributos.moddestreza = modificador;
            
            					if modificador >= 0 then
            						sheet.atributos.moddestrezastr = "+" .. modificador;
            					else
            						sheet.atributos.moddestrezastr = "-" .. math.abs(modificador);
            					end;
            				else
            					sheet.atributos.moddestreza = nil;
            					sheet.atributos.moddestrezastr = nil;
            				end;
        end, obj);

    obj._e_event25 = obj.button4:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event26 = obj.button4:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event27 = obj.button4:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'destreza'}, nil, false);
        end, obj);

    obj._e_event28 = obj.button4:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'destreza'}, nil, true);
        end, obj);

    obj._e_event29 = obj.cbProfdestreza:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["destreza"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'destreza', true);
            						sheet.resistencias.destreza = true;
            					end;
        end, obj);

    obj._e_event30 = obj.cbProfdestreza:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'destreza', false);
        end, obj);

    obj._e_event31 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("destreza");
        end, obj);

    obj._e_event32 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['destreza'] then updateCbVisibility('destreza'); end;
        end, obj);

    obj._e_event33 = obj.button5:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event34 = obj.button5:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event35 = obj.button5:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.destreza'}, nil, false);
        end, obj);

    obj._e_event36 = obj.button5:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.destreza'}, nil, true);
        end, obj);

    obj._e_event37 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'resistencia', 'destreza');
            
            						sheet.resistencias.bonusdestreza = valor;
            
            						if valor >= 0 then
            							sheet.resistencias.bonusdestrezastr = "+" .. valor;
            						else
            							sheet.resistencias.bonusdestrezastr = "-" .. math.abs(valor);
            						end;
            
            						self.labProfdestreza:setHitTest(true);
            						self.labProfdestreza:setHint(hint);
        end, obj);

    obj._e_event38 = obj.cbProfacrobacia:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["acrobacia"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'acrobacia', true);
            						sheet.pericias.acrobacia = true;
            					end;
        end, obj);

    obj._e_event39 = obj.cbProfacrobacia:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'acrobacia', false);
        end, obj);

    obj._e_event40 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("acrobacia");
        end, obj);

    obj._e_event41 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['acrobacia'] then updateCbVisibility('acrobacia'); end;
        end, obj);

    obj._e_event42 = obj.button6:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event43 = obj.button6:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event44 = obj.button6:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.acrobacia'}, nil, false);
        end, obj);

    obj._e_event45 = obj.button6:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.acrobacia'}, nil, true);
        end, obj);

    obj._e_event46 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'destreza', 'acrobacia');
            
            							sheet.pericias.bonusacrobacia = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusacrobaciastr = "+" .. valor;
            							else
            								sheet.pericias.bonusacrobaciastr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfacrobacia:setHitTest(true);
            							self.labProfacrobacia:setHint(hint);
        end, obj);

    obj._e_event47 = obj.cbProffurtividade:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["furtividade"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'furtividade', true);
            						sheet.pericias.furtividade = true;
            					end;
        end, obj);

    obj._e_event48 = obj.cbProffurtividade:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'furtividade', false);
        end, obj);

    obj._e_event49 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("furtividade");
        end, obj);

    obj._e_event50 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['furtividade'] then updateCbVisibility('furtividade'); end;
        end, obj);

    obj._e_event51 = obj.button7:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event52 = obj.button7:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event53 = obj.button7:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.furtividade'}, nil, false);
        end, obj);

    obj._e_event54 = obj.button7:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.furtividade'}, nil, true);
        end, obj);

    obj._e_event55 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'destreza', 'furtividade');
            
            							sheet.pericias.bonusfurtividade = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusfurtividadestr = "+" .. valor;
            							else
            								sheet.pericias.bonusfurtividadestr = "-" .. math.abs(valor);
            							end;
            
            							self.labProffurtividade:setHitTest(true);
            							self.labProffurtividade:setHint(hint);
        end, obj);

    obj._e_event56 = obj.cbProfprestidigitacao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["prestidigitacao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'prestidigitacao', true);
            						sheet.pericias.prestidigitacao = true;
            					end;
        end, obj);

    obj._e_event57 = obj.cbProfprestidigitacao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'prestidigitacao', false);
        end, obj);

    obj._e_event58 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("prestidigitacao");
        end, obj);

    obj._e_event59 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['prestidigitacao'] then updateCbVisibility('prestidigitacao'); end;
        end, obj);

    obj._e_event60 = obj.button8:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event61 = obj.button8:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event62 = obj.button8:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.prestidigitacao'}, nil, false);
        end, obj);

    obj._e_event63 = obj.button8:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.prestidigitacao'}, nil, true);
        end, obj);

    obj._e_event64 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'destreza', 'prestidigitacao');
            
            							sheet.pericias.bonusprestidigitacao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusprestidigitacaostr = "+" .. valor;
            							else
            								sheet.pericias.bonusprestidigitacaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfprestidigitacao:setHitTest(true);
            							self.labProfprestidigitacao:setHint(hint);
        end, obj);

    obj._e_event65 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;
            					sheet.atributos.modconstituicao = modificador;
            
            					if modificador >= 0 then
            						sheet.atributos.modconstituicaostr = "+" .. modificador;
            					else
            						sheet.atributos.modconstituicaostr = "-" .. math.abs(modificador);
            					end;
            				else
            					sheet.atributos.modconstituicao = nil;
            					sheet.atributos.modconstituicaostr = nil;
            				end;
        end, obj);

    obj._e_event66 = obj.button9:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event67 = obj.button9:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event68 = obj.button9:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'constituicao'}, nil, false);
        end, obj);

    obj._e_event69 = obj.button9:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'constituicao'}, nil, true);
        end, obj);

    obj._e_event70 = obj.cbProfconstituicao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["constituicao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'constituicao', true);
            						sheet.resistencias.constituicao = true;
            					end;
        end, obj);

    obj._e_event71 = obj.cbProfconstituicao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'constituicao', false);
        end, obj);

    obj._e_event72 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("constituicao");
        end, obj);

    obj._e_event73 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['constituicao'] then updateCbVisibility('constituicao'); end;
        end, obj);

    obj._e_event74 = obj.button10:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event75 = obj.button10:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event76 = obj.button10:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.constituicao'}, nil, false);
        end, obj);

    obj._e_event77 = obj.button10:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.constituicao'}, nil, true);
        end, obj);

    obj._e_event78 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'resistencia', 'constituicao');
            
            						sheet.resistencias.bonusconstituicao = valor;
            
            						if valor >= 0 then
            							sheet.resistencias.bonusconstituicaostr = "+" .. valor;
            						else
            							sheet.resistencias.bonusconstituicaostr = "-" .. math.abs(valor);
            						end;
            
            						self.labProfconstituicao:setHitTest(true);
            						self.labProfconstituicao:setHint(hint);
        end, obj);

    obj._e_event79 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;
            					sheet.atributos.modinteligencia = modificador;
            
            					if modificador >= 0 then
            						sheet.atributos.modinteligenciastr = "+" .. modificador;
            					else
            						sheet.atributos.modinteligenciastr = "-" .. math.abs(modificador);
            					end;
            				else
            					sheet.atributos.modinteligencia = nil;
            					sheet.atributos.modinteligenciastr = nil;
            				end;
        end, obj);

    obj._e_event80 = obj.button11:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event81 = obj.button11:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event82 = obj.button11:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'inteligencia'}, nil, false);
        end, obj);

    obj._e_event83 = obj.button11:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'inteligencia'}, nil, true);
        end, obj);

    obj._e_event84 = obj.cbProfinteligencia:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["inteligencia"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'inteligencia', true);
            						sheet.resistencias.inteligencia = true;
            					end;
        end, obj);

    obj._e_event85 = obj.cbProfinteligencia:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'inteligencia', false);
        end, obj);

    obj._e_event86 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("inteligencia");
        end, obj);

    obj._e_event87 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['inteligencia'] then updateCbVisibility('inteligencia'); end;
        end, obj);

    obj._e_event88 = obj.button12:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event89 = obj.button12:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event90 = obj.button12:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.inteligencia'}, nil, false);
        end, obj);

    obj._e_event91 = obj.button12:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.inteligencia'}, nil, true);
        end, obj);

    obj._e_event92 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'resistencia', 'inteligencia');
            
            						sheet.resistencias.bonusinteligencia = valor;
            
            						if valor >= 0 then
            							sheet.resistencias.bonusinteligenciastr = "+" .. valor;
            						else
            							sheet.resistencias.bonusinteligenciastr = "-" .. math.abs(valor);
            						end;
            
            						self.labProfinteligencia:setHitTest(true);
            						self.labProfinteligencia:setHint(hint);
        end, obj);

    obj._e_event93 = obj.cbProfarcanismo:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["arcanismo"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'arcanismo', true);
            						sheet.pericias.arcanismo = true;
            					end;
        end, obj);

    obj._e_event94 = obj.cbProfarcanismo:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'arcanismo', false);
        end, obj);

    obj._e_event95 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("arcanismo");
        end, obj);

    obj._e_event96 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['arcanismo'] then updateCbVisibility('arcanismo'); end;
        end, obj);

    obj._e_event97 = obj.button13:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event98 = obj.button13:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event99 = obj.button13:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.arcanismo'}, nil, false);
        end, obj);

    obj._e_event100 = obj.button13:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.arcanismo'}, nil, true);
        end, obj);

    obj._e_event101 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'inteligencia', 'arcanismo');
            
            							sheet.pericias.bonusarcanismo = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusarcanismostr = "+" .. valor;
            							else
            								sheet.pericias.bonusarcanismostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfarcanismo:setHitTest(true);
            							self.labProfarcanismo:setHint(hint);
        end, obj);

    obj._e_event102 = obj.cbProfhistoria:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["historia"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'historia', true);
            						sheet.pericias.historia = true;
            					end;
        end, obj);

    obj._e_event103 = obj.cbProfhistoria:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'historia', false);
        end, obj);

    obj._e_event104 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("historia");
        end, obj);

    obj._e_event105 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['historia'] then updateCbVisibility('historia'); end;
        end, obj);

    obj._e_event106 = obj.button14:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event107 = obj.button14:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event108 = obj.button14:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.historia'}, nil, false);
        end, obj);

    obj._e_event109 = obj.button14:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.historia'}, nil, true);
        end, obj);

    obj._e_event110 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'inteligencia', 'historia');
            
            							sheet.pericias.bonushistoria = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonushistoriastr = "+" .. valor;
            							else
            								sheet.pericias.bonushistoriastr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfhistoria:setHitTest(true);
            							self.labProfhistoria:setHint(hint);
        end, obj);

    obj._e_event111 = obj.cbProfinvestigacao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["investigacao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'investigacao', true);
            						sheet.pericias.investigacao = true;
            					end;
        end, obj);

    obj._e_event112 = obj.cbProfinvestigacao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'investigacao', false);
        end, obj);

    obj._e_event113 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("investigacao");
        end, obj);

    obj._e_event114 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['investigacao'] then updateCbVisibility('investigacao'); end;
        end, obj);

    obj._e_event115 = obj.button15:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event116 = obj.button15:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event117 = obj.button15:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.investigacao'}, nil, false);
        end, obj);

    obj._e_event118 = obj.button15:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.investigacao'}, nil, true);
        end, obj);

    obj._e_event119 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'inteligencia', 'investigacao');
            
            							sheet.pericias.bonusinvestigacao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusinvestigacaostr = "+" .. valor;
            							else
            								sheet.pericias.bonusinvestigacaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfinvestigacao:setHitTest(true);
            							self.labProfinvestigacao:setHint(hint);
        end, obj);

    obj._e_event120 = obj.cbProfnatureza:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["natureza"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'natureza', true);
            						sheet.pericias.natureza = true;
            					end;
        end, obj);

    obj._e_event121 = obj.cbProfnatureza:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'natureza', false);
        end, obj);

    obj._e_event122 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("natureza");
        end, obj);

    obj._e_event123 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['natureza'] then updateCbVisibility('natureza'); end;
        end, obj);

    obj._e_event124 = obj.button16:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event125 = obj.button16:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event126 = obj.button16:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.natureza'}, nil, false);
        end, obj);

    obj._e_event127 = obj.button16:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.natureza'}, nil, true);
        end, obj);

    obj._e_event128 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'inteligencia', 'natureza');
            
            							sheet.pericias.bonusnatureza = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusnaturezastr = "+" .. valor;
            							else
            								sheet.pericias.bonusnaturezastr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfnatureza:setHitTest(true);
            							self.labProfnatureza:setHint(hint);
        end, obj);

    obj._e_event129 = obj.cbProfreligiao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["religiao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'religiao', true);
            						sheet.pericias.religiao = true;
            					end;
        end, obj);

    obj._e_event130 = obj.cbProfreligiao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'religiao', false);
        end, obj);

    obj._e_event131 = obj.dataLink42:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("religiao");
        end, obj);

    obj._e_event132 = obj.dataLink43:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['religiao'] then updateCbVisibility('religiao'); end;
        end, obj);

    obj._e_event133 = obj.button17:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event134 = obj.button17:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event135 = obj.button17:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.religiao'}, nil, false);
        end, obj);

    obj._e_event136 = obj.button17:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.religiao'}, nil, true);
        end, obj);

    obj._e_event137 = obj.dataLink44:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'inteligencia', 'religiao');
            
            							sheet.pericias.bonusreligiao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusreligiaostr = "+" .. valor;
            							else
            								sheet.pericias.bonusreligiaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfreligiao:setHitTest(true);
            							self.labProfreligiao:setHint(hint);
        end, obj);

    obj._e_event138 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;
            					sheet.atributos.modsabedoria = modificador;
            
            					if modificador >= 0 then
            						sheet.atributos.modsabedoriastr = "+" .. modificador;
            					else
            						sheet.atributos.modsabedoriastr = "-" .. math.abs(modificador);
            					end;
            				else
            					sheet.atributos.modsabedoria = nil;
            					sheet.atributos.modsabedoriastr = nil;
            				end;
        end, obj);

    obj._e_event139 = obj.button18:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event140 = obj.button18:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event141 = obj.button18:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'sabedoria'}, nil, false);
        end, obj);

    obj._e_event142 = obj.button18:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'sabedoria'}, nil, true);
        end, obj);

    obj._e_event143 = obj.cbProfsabedoria:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["sabedoria"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'sabedoria', true);
            						sheet.resistencias.sabedoria = true;
            					end;
        end, obj);

    obj._e_event144 = obj.cbProfsabedoria:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'sabedoria', false);
        end, obj);

    obj._e_event145 = obj.dataLink46:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("sabedoria");
        end, obj);

    obj._e_event146 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['sabedoria'] then updateCbVisibility('sabedoria'); end;
        end, obj);

    obj._e_event147 = obj.button19:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event148 = obj.button19:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event149 = obj.button19:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.sabedoria'}, nil, false);
        end, obj);

    obj._e_event150 = obj.button19:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.sabedoria'}, nil, true);
        end, obj);

    obj._e_event151 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'resistencia', 'sabedoria');
            
            						sheet.resistencias.bonussabedoria = valor;
            
            						if valor >= 0 then
            							sheet.resistencias.bonussabedoriastr = "+" .. valor;
            						else
            							sheet.resistencias.bonussabedoriastr = "-" .. math.abs(valor);
            						end;
            
            						self.labProfsabedoria:setHitTest(true);
            						self.labProfsabedoria:setHint(hint);
        end, obj);

    obj._e_event152 = obj.cbProfadestrarAnimais:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["adestrarAnimais"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'adestrarAnimais', true);
            						sheet.pericias.adestrarAnimais = true;
            					end;
        end, obj);

    obj._e_event153 = obj.cbProfadestrarAnimais:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'adestrarAnimais', false);
        end, obj);

    obj._e_event154 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("adestrarAnimais");
        end, obj);

    obj._e_event155 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['adestrarAnimais'] then updateCbVisibility('adestrarAnimais'); end;
        end, obj);

    obj._e_event156 = obj.button20:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event157 = obj.button20:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event158 = obj.button20:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.adestrarAnimais'}, nil, false);
        end, obj);

    obj._e_event159 = obj.button20:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.adestrarAnimais'}, nil, true);
        end, obj);

    obj._e_event160 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'sabedoria', 'adestrarAnimais');
            
            							sheet.pericias.bonusadestrarAnimais = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusadestrarAnimaisstr = "+" .. valor;
            							else
            								sheet.pericias.bonusadestrarAnimaisstr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfadestrarAnimais:setHitTest(true);
            							self.labProfadestrarAnimais:setHint(hint);
        end, obj);

    obj._e_event161 = obj.cbProfintuicao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["intuicao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'intuicao', true);
            						sheet.pericias.intuicao = true;
            					end;
        end, obj);

    obj._e_event162 = obj.cbProfintuicao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'intuicao', false);
        end, obj);

    obj._e_event163 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("intuicao");
        end, obj);

    obj._e_event164 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['intuicao'] then updateCbVisibility('intuicao'); end;
        end, obj);

    obj._e_event165 = obj.button21:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event166 = obj.button21:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event167 = obj.button21:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intuicao'}, nil, false);
        end, obj);

    obj._e_event168 = obj.button21:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intuicao'}, nil, true);
        end, obj);

    obj._e_event169 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'sabedoria', 'intuicao');
            
            							sheet.pericias.bonusintuicao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusintuicaostr = "+" .. valor;
            							else
            								sheet.pericias.bonusintuicaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfintuicao:setHitTest(true);
            							self.labProfintuicao:setHint(hint);
        end, obj);

    obj._e_event170 = obj.cbProfmedicina:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["medicina"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'medicina', true);
            						sheet.pericias.medicina = true;
            					end;
        end, obj);

    obj._e_event171 = obj.cbProfmedicina:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'medicina', false);
        end, obj);

    obj._e_event172 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("medicina");
        end, obj);

    obj._e_event173 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['medicina'] then updateCbVisibility('medicina'); end;
        end, obj);

    obj._e_event174 = obj.button22:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event175 = obj.button22:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event176 = obj.button22:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.medicina'}, nil, false);
        end, obj);

    obj._e_event177 = obj.button22:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.medicina'}, nil, true);
        end, obj);

    obj._e_event178 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'sabedoria', 'medicina');
            
            							sheet.pericias.bonusmedicina = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusmedicinastr = "+" .. valor;
            							else
            								sheet.pericias.bonusmedicinastr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfmedicina:setHitTest(true);
            							self.labProfmedicina:setHint(hint);
        end, obj);

    obj._e_event179 = obj.cbProfpercepcao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["percepcao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'percepcao', true);
            						sheet.pericias.percepcao = true;
            					end;
        end, obj);

    obj._e_event180 = obj.cbProfpercepcao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'percepcao', false);
        end, obj);

    obj._e_event181 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("percepcao");
        end, obj);

    obj._e_event182 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['percepcao'] then updateCbVisibility('percepcao'); end;
        end, obj);

    obj._e_event183 = obj.button23:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event184 = obj.button23:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event185 = obj.button23:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.percepcao'}, nil, false);
        end, obj);

    obj._e_event186 = obj.button23:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.percepcao'}, nil, true);
        end, obj);

    obj._e_event187 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'sabedoria', 'percepcao');
            
            							sheet.pericias.bonuspercepcao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonuspercepcaostr = "+" .. valor;
            							else
            								sheet.pericias.bonuspercepcaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfpercepcao:setHitTest(true);
            							self.labProfpercepcao:setHint(hint);
        end, obj);

    obj._e_event188 = obj.cbProfsobrevivencia:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["sobrevivencia"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'sobrevivencia', true);
            						sheet.pericias.sobrevivencia = true;
            					end;
        end, obj);

    obj._e_event189 = obj.cbProfsobrevivencia:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'sobrevivencia', false);
        end, obj);

    obj._e_event190 = obj.dataLink61:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("sobrevivencia");
        end, obj);

    obj._e_event191 = obj.dataLink62:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['sobrevivencia'] then updateCbVisibility('sobrevivencia'); end;
        end, obj);

    obj._e_event192 = obj.button24:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event193 = obj.button24:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event194 = obj.button24:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.sobrevivencia'}, nil, false);
        end, obj);

    obj._e_event195 = obj.button24:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.sobrevivencia'}, nil, true);
        end, obj);

    obj._e_event196 = obj.dataLink63:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'sabedoria', 'sobrevivencia');
            
            							sheet.pericias.bonussobrevivencia = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonussobrevivenciastr = "+" .. valor;
            							else
            								sheet.pericias.bonussobrevivenciastr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfsobrevivencia:setHitTest(true);
            							self.labProfsobrevivencia:setHint(hint);
        end, obj);

    obj._e_event197 = obj.dataLink64:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;
            					sheet.atributos.modcarisma = modificador;
            
            					if modificador >= 0 then
            						sheet.atributos.modcarismastr = "+" .. modificador;
            					else
            						sheet.atributos.modcarismastr = "-" .. math.abs(modificador);
            					end;
            				else
            					sheet.atributos.modcarisma = nil;
            					sheet.atributos.modcarismastr = nil;
            				end;
        end, obj);

    obj._e_event198 = obj.button25:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event199 = obj.button25:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event200 = obj.button25:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'carisma'}, nil, false);
        end, obj);

    obj._e_event201 = obj.button25:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'attr', field = 'carisma'}, nil, true);
        end, obj);

    obj._e_event202 = obj.cbProfcarisma:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["carisma"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'carisma', true);
            						sheet.resistencias.carisma = true;
            					end;
        end, obj);

    obj._e_event203 = obj.cbProfcarisma:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'carisma', false);
        end, obj);

    obj._e_event204 = obj.dataLink65:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("carisma");
        end, obj);

    obj._e_event205 = obj.dataLink66:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['carisma'] then updateCbVisibility('carisma'); end;
        end, obj);

    obj._e_event206 = obj.button26:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event207 = obj.button26:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event208 = obj.button26:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.carisma'}, nil, false);
        end, obj);

    obj._e_event209 = obj.button26:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'resistencias.carisma'}, nil, true);
        end, obj);

    obj._e_event210 = obj.dataLink67:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'resistencia', 'carisma');
            
            						sheet.resistencias.bonuscarisma = valor;
            
            						if valor >= 0 then
            							sheet.resistencias.bonuscarismastr = "+" .. valor;
            						else
            							sheet.resistencias.bonuscarismastr = "-" .. math.abs(valor);
            						end;
            
            						self.labProfcarisma:setHitTest(true);
            						self.labProfcarisma:setHint(hint);
        end, obj);

    obj._e_event211 = obj.cbProfatuacao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["atuacao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'atuacao', true);
            						sheet.pericias.atuacao = true;
            					end;
        end, obj);

    obj._e_event212 = obj.cbProfatuacao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'atuacao', false);
        end, obj);

    obj._e_event213 = obj.dataLink68:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("atuacao");
        end, obj);

    obj._e_event214 = obj.dataLink69:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['atuacao'] then updateCbVisibility('atuacao'); end;
        end, obj);

    obj._e_event215 = obj.button27:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event216 = obj.button27:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event217 = obj.button27:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atuacao'}, nil, false);
        end, obj);

    obj._e_event218 = obj.button27:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.atuacao'}, nil, true);
        end, obj);

    obj._e_event219 = obj.dataLink70:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'carisma', 'atuacao');
            
            							sheet.pericias.bonusatuacao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusatuacaostr = "+" .. valor;
            							else
            								sheet.pericias.bonusatuacaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfatuacao:setHitTest(true);
            							self.labProfatuacao:setHint(hint);
        end, obj);

    obj._e_event220 = obj.cbProfenganacao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["enganacao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'enganacao', true);
            						sheet.pericias.enganacao = true;
            					end;
        end, obj);

    obj._e_event221 = obj.cbProfenganacao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'enganacao', false);
        end, obj);

    obj._e_event222 = obj.dataLink71:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("enganacao");
        end, obj);

    obj._e_event223 = obj.dataLink72:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['enganacao'] then updateCbVisibility('enganacao'); end;
        end, obj);

    obj._e_event224 = obj.button28:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event225 = obj.button28:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event226 = obj.button28:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.enganacao'}, nil, false);
        end, obj);

    obj._e_event227 = obj.button28:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.enganacao'}, nil, true);
        end, obj);

    obj._e_event228 = obj.dataLink73:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'carisma', 'enganacao');
            
            							sheet.pericias.bonusenganacao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusenganacaostr = "+" .. valor;
            							else
            								sheet.pericias.bonusenganacaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfenganacao:setHitTest(true);
            							self.labProfenganacao:setHint(hint);
        end, obj);

    obj._e_event229 = obj.cbProfintimidacao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["intimidacao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'intimidacao', true);
            						sheet.pericias.intimidacao = true;
            					end;
        end, obj);

    obj._e_event230 = obj.cbProfintimidacao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'intimidacao', false);
        end, obj);

    obj._e_event231 = obj.dataLink74:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("intimidacao");
        end, obj);

    obj._e_event232 = obj.dataLink75:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['intimidacao'] then updateCbVisibility('intimidacao'); end;
        end, obj);

    obj._e_event233 = obj.button29:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event234 = obj.button29:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event235 = obj.button29:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intimidacao'}, nil, false);
        end, obj);

    obj._e_event236 = obj.button29:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.intimidacao'}, nil, true);
        end, obj);

    obj._e_event237 = obj.dataLink76:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'carisma', 'intimidacao');
            
            							sheet.pericias.bonusintimidacao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonusintimidacaostr = "+" .. valor;
            							else
            								sheet.pericias.bonusintimidacaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfintimidacao:setHitTest(true);
            							self.labProfintimidacao:setHint(hint);
        end, obj);

    obj._e_event238 = obj.cbProfpersuasao:addEventListener("onMenu",
        function (_, x, y)
            if common.pericias["persuasao"] ~= nil then
            						common.fichaSetEspecializacao(sheet, 'persuasao', true);
            						sheet.pericias.persuasao = true;
            					end;
        end, obj);

    obj._e_event239 = obj.cbProfpersuasao:addEventListener("onClick",
        function (_)
            common.fichaSetEspecializacao(sheet, 'persuasao', false);
        end, obj);

    obj._e_event240 = obj.dataLink77:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateCbVisibility("persuasao");
        end, obj);

    obj._e_event241 = obj.dataLink78:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if common.pericias['persuasao'] then updateCbVisibility('persuasao'); end;
        end, obj);

    obj._e_event242 = obj.button30:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event243 = obj.button30:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event244 = obj.button30:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.persuasao'}, nil, false);
        end, obj);

    obj._e_event245 = obj.button30:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaPericia, { tipo = 'per', field = 'pericias.persuasao'}, nil, true);
        end, obj);

    obj._e_event246 = obj.dataLink79:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local valor, hint = common.calculaBonus(sheet, 'pericia', 'carisma', 'persuasao');
            
            							sheet.pericias.bonuspersuasao = valor;
            
            							if valor >= 0 then
            								sheet.pericias.bonuspersuasaostr = "+" .. valor;
            							else
            								sheet.pericias.bonuspersuasaostr = "-" .. math.abs(valor);
            							end;
            
            							self.labProfpersuasao:setHitTest(true);
            							self.labProfpersuasao:setHint(hint);
        end, obj);

    obj._e_event247 = obj.button31:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event248 = obj.button31:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event249 = obj.button31:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.rolaIniciativa, nil, nil, false);
        end, obj);

    obj._e_event250 = obj.button31:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.rolaIniciativa, nil, nil, true);
        end, obj);

    obj._e_event251 = obj.button32:addEventListener("onClick",
        function (_)
            descanso.curto(sheet);
        end, obj);

    obj._e_event252 = obj.button33:addEventListener("onClick",
        function (_)
            descanso.longo(sheet);
        end, obj);

    obj._e_event253 = obj.button34:addEventListener("onClick",
        function (_)
            levarDano(sheet);
        end, obj);

    obj._e_event254 = obj.dataLink80:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local jogador = Firecast.getPersonagemDe(sheet).dono;
            										if common.isMyChar(sheet) and common.isMainChar(sheet) then jogador:requestSetBarValue(1, sheet.PV, sheet.PVmax); end;
        end, obj);

    obj._e_event255 = obj.dataLink81:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.descansoLongo then sheet.PV = sheet.PVmax; end;
        end, obj);

    obj._e_event256 = obj.button35:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event257 = obj.button35:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event258 = obj.button35:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.deathSave, nil, nil, false);
        end, obj);

    obj._e_event259 = obj.button35:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.deathSave, nil, nil, true);
        end, obj);

    obj._e_event260 = obj.fraAliadosOrganizacoes:addEventListener("onBeforeLayoutCalc",
        function (_)
            if self.fraAliadosOrganizacoes:getWidth() <= 500 then
            									self.prtAliados:setHeight(200);
            									self.prtFaccao:setHeight(200);
            								else
            									self.prtAliados:setHeight(420);
            									self.prtFaccao:setHeight(350);
            								end;
        end, obj);

    obj._e_event261 = obj.checkBox1:addEventListener("onChange",
        function (_)
            if sheet then
            								self.historiaFancy:setVisible(sheet.historia.usarEditorFancy);
            								self.historiaMerda:setVisible(not (sheet.historia.usarEditorFancy));
            							end;
        end, obj);

    obj._e_event262 = obj.rclEquips:addEventListener("onSelect",
        function (_)
            local node = self.rclEquips.selectedNode;
            								self.dataEquipAttackDetails.node = node;
            								self.dataEquipAttackDetails.enabled = (node ~= nil);
            
            								if self.rclEquips.lastSelectedForm ~= nil then self.rclEquips.lastSelectedForm.editName:setEnabled(false); end;
            								if self.rclEquips.selectedForm ~= nil then self.rclEquips.selectedForm.editName:setEnabled(true); end;
            								self.rclEquips.lastSelectedForm = self.rclEquips.selectedForm;
        end, obj);

    obj._e_event263 = obj.button36:addEventListener("onClick",
        function (_)
            self.rclEquips.selectedNode = self.rclEquips:append(); self.rclEquips.selectedForm.editName:setFocus();
        end, obj);

    obj._e_event264 = obj.dataEquipAttackDetails:addEventListener("onNodeReady",
        function (_)
            self.imgEquipAttackImg:setVisible(false);
            							self.cbOptAtaqueMunicao:setItems(common.getNomeContadores(sheet, {""}));
        end, obj);

    obj._e_event265 = obj.dataEquipAttackDetails:addEventListener("onNodeUnready",
        function (_)
            self.imgEquipAttackImg:setVisible(true);
        end, obj);

    obj._e_event266 = obj.rclProps:addEventListener("onItemRemoved",
        function (_, node, form)
            local equip = self.dataEquipAttackDetails.node;
            									if equip ~= nil then
            										if equip.tabPropriedades == nil then equip.tabPropriedades = {}; end;
            										equip.tabPropriedades[node.texto] = nil;
            
            										equip.propriedades = common.concat(equip.tabPropriedades, ", ");
            									end;
        end, obj);

    obj._e_event267 = obj.button37:addEventListener("onClick",
        function (_)
            local equip = self.dataEquipAttackDetails.node;
            								if equip ~= nil then
            									if equip.tabPropriedades == nil then equip.tabPropriedades = {}; end;
            
            									local choices = {};
            									for prop,_ in pairs(common.armas_propriedades) do if not equip.tabPropriedades[prop] then table.insert(choices, prop); end; end;
            									table.sort(choices)
            
            									Dialogs.choose("Selecione a propriedade:", choices,
            										function(selected, selectedIndex, selectedText)
            											if(selected) then
            												local node = self.rclProps:append()
            												node.texto = selectedText;
            												node.hint = common.armas_propriedades[selectedText];
            
            												equip.tabPropriedades[selectedText] = true;
            												equip.propriedades = common.concat(equip.tabPropriedades, ", ");
            											end;
            										end
            									);
            								end;
        end, obj);

    obj._e_event268 = obj.dataLink82:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local equip = self.dataEquipAttackDetails.node;
            								if equip ~= nil and equip.propriedades ~= nil then
            									if equip.tabPropriedades == nil then equip.tabPropriedades = {}; end;
            
            									if self.rclProps ~= nil and common.concat(equip.tabPropriedades) == "" then
            										for propriedade in string.gmatch((equip.propriedades or ""), "[^,%s]+") do
            											if common.armas_propriedades[propriedade] ~= nil then
            												equip.tabPropriedades[propriedade] = true;
            												local node = self.rclProps:append();
            												node.texto = propriedade;
            												node.hint = common.armas_propriedades[propriedade];
            											end;
            										end;
            									end;
            									equip.propriedades = common.concat(equip.tabPropriedades, ", ");
            								end;
        end, obj);

    obj._e_event269 = obj.dataLink83:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet and sheet.contadoresMudaram then
            							self.cbOptAtaqueMunicao:setItems(common.getNomeContadores(sheet, {""}));
            						end;
        end, obj);

    obj._e_event270 = obj.btnApagar:addEventListener("onClick",
        function (_)
            common.askForDelete(self.sheet);
        end, obj);

    obj._e_event271 = obj.rclOptsAttack:addEventListener("onItemAdded",
        function (_, node, form)
            form.cbOptAtaqueMunicao:setItems(common.getNomeContadores(sheet, {""}));
        end, obj);

    obj._e_event272 = obj.button38:addEventListener("onClick",
        function (_)
            self.rclOptsAttack:append();
        end, obj);

    obj._e_event273 = obj.dataLink84:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and self ~= nil and sheet.contadoresMudaram then
            									local equip = self.dataEquipAttackDetails.node;
            									if equip ~= nil then
            										local optsAttack = NDB.getChildNodes(equip.optsAttack);
            										for i=1,#optsAttack,1 do
            											optsAttack[i].contadoresMudaram = true;
            											optsAttack[i].contadoresMudaram = false;
            										end;
            									end;
            								end;
        end, obj);

    obj._e_event274 = obj.labEquipDefense:addEventListener("onResize",
        function (_)
            recalcularTamanhoEquipsDefesa();
        end, obj);

    obj._e_event275 = obj.rclEquipsDefense:addEventListener("onResize",
        function (_)
            recalcularTamanhoEquipsDefesa();
        end, obj);

    obj._e_event276 = obj.btnEquipDefenseNew:addEventListener("onClick",
        function (_)
            self.rclEquipsDefense:append();
        end, obj);

    obj._e_event277 = obj.checkBox3:addEventListener("onChange",
        function (_)
            if sheet then
            								self.editorFancy:setVisible(sheet.equipamento.outros_melhorado);
            								self.editorMerda:setVisible(not (sheet.equipamento.outros_melhorado));
            							end;
        end, obj);

    obj._e_event278 = obj.label47:addEventListener("onResize",
        function (_)
            recalcularTamanhoEquipsDefesa();
        end, obj);

    obj._e_event279 = obj.labupperGridMagicBox1:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox1._RecalcSize();
        end, obj);

    obj._e_event280 = obj.labupperGridMagicBox2:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox2._RecalcSize();
        end, obj);

    obj._e_event281 = obj.labupperGridMagicBox3:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox3._RecalcSize();
        end, obj);

    obj._e_event282 = obj.labupperGridMagicEditBox1:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox1._RecalcSize();
        end, obj);

    obj._e_event283 = obj.rclflwMagicRecordList1:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList1._recalcHeight();
        end, obj);

    obj._e_event284 = obj.rclflwMagicRecordList1:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event285 = obj.btnNovoflwMagicRecordList1:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList1');
        end, obj);

    obj._e_event286 = obj.btnImportflwMagicRecordList1:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList1');
        end, obj);

    obj._e_event287 = obj.rclflwMagicRecordList2:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList2._recalcHeight();
        end, obj);

    obj._e_event288 = obj.rclflwMagicRecordList2:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event289 = obj.btnNovoflwMagicRecordList2:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList2');
        end, obj);

    obj._e_event290 = obj.btnImportflwMagicRecordList2:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList2');
        end, obj);

    obj._e_event291 = obj.rclflwMagicRecordList3:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList3._recalcHeight();
        end, obj);

    obj._e_event292 = obj.rclflwMagicRecordList3:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event293 = obj.btnNovoflwMagicRecordList3:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList3');
        end, obj);

    obj._e_event294 = obj.btnImportflwMagicRecordList3:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList3');
        end, obj);

    obj._e_event295 = obj.rclflwMagicRecordList4:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList4._recalcHeight();
        end, obj);

    obj._e_event296 = obj.rclflwMagicRecordList4:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event297 = obj.btnNovoflwMagicRecordList4:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList4');
        end, obj);

    obj._e_event298 = obj.btnImportflwMagicRecordList4:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList4');
        end, obj);

    obj._e_event299 = obj.rclflwMagicRecordList5:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList5._recalcHeight();
        end, obj);

    obj._e_event300 = obj.rclflwMagicRecordList5:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event301 = obj.btnNovoflwMagicRecordList5:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList5');
        end, obj);

    obj._e_event302 = obj.btnImportflwMagicRecordList5:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList5');
        end, obj);

    obj._e_event303 = obj.rclflwMagicRecordList6:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList6._recalcHeight();
        end, obj);

    obj._e_event304 = obj.rclflwMagicRecordList6:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event305 = obj.btnNovoflwMagicRecordList6:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList6');
        end, obj);

    obj._e_event306 = obj.btnImportflwMagicRecordList6:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList6');
        end, obj);

    obj._e_event307 = obj.rclflwMagicRecordList7:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList7._recalcHeight();
        end, obj);

    obj._e_event308 = obj.rclflwMagicRecordList7:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event309 = obj.btnNovoflwMagicRecordList7:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList7');
        end, obj);

    obj._e_event310 = obj.btnImportflwMagicRecordList7:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList7');
        end, obj);

    obj._e_event311 = obj.rclflwMagicRecordList8:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList8._recalcHeight();
        end, obj);

    obj._e_event312 = obj.rclflwMagicRecordList8:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event313 = obj.btnNovoflwMagicRecordList8:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList8');
        end, obj);

    obj._e_event314 = obj.btnImportflwMagicRecordList8:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList8');
        end, obj);

    obj._e_event315 = obj.rclflwMagicRecordList9:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList9._recalcHeight();
        end, obj);

    obj._e_event316 = obj.rclflwMagicRecordList9:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event317 = obj.btnNovoflwMagicRecordList9:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList9');
        end, obj);

    obj._e_event318 = obj.btnImportflwMagicRecordList9:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList9');
        end, obj);

    obj._e_event319 = obj.rclflwMagicRecordList10:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList10._recalcHeight();
        end, obj);

    obj._e_event320 = obj.rclflwMagicRecordList10:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome or '', nodeB.nome or '');
        end, obj);

    obj._e_event321 = obj.btnNovoflwMagicRecordList10:addEventListener("onClick",
        function (_)
            dload.new_spell(self, 'flwMagicRecordList10');
        end, obj);

    obj._e_event322 = obj.btnImportflwMagicRecordList10:addEventListener("onClick",
        function (_)
            dload.imp_spell(self, 'flwMagicRecordList10');
        end, obj);

    obj._e_event323 = obj.dataLink85:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.descansoLongo then
            							for i=1,9,1 do sheet.magias["espacosGastos"..i] = 0; end;
            						end;
        end, obj);

    obj._e_event324 = obj.dataLink86:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.magias = sheet.magias or {};
            			local niveis = NDB.getChildNodes(sheet.magias.niveis);
            
            			for nvl=1,#niveis do
            				niveis[nvl].descansoLongo = sheet.descansoLongo;
            				niveis[nvl].descansoCurto = sheet.descansoCurto;
            			end;
        end, obj);

    obj._e_event325 = obj.labupperGridMagicBox4:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox4._RecalcSize();
        end, obj);

    obj._e_event326 = obj.labupperGridMagicBox5:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox5._RecalcSize();
        end, obj);

    obj._e_event327 = obj.labupperGridMagicBox6:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox6._RecalcSize();
        end, obj);

    obj._e_event328 = obj.popupEdit:addEventListener("onClose",
        function (_, canceled)
            sheet.magias.selecionada = nil;
        end, obj);

    obj._e_event329 = obj.popupEdit:addEventListener("onNodeUnready",
        function (_)
            sheet.magias.selecionada = nil;
        end, obj);

    obj._e_event330 = obj.popupEdit:addEventListener("onNodeReady",
        function (_)
            self.popupEdit:getNodeObject().cdResistenciaTipo = nil;
        end, obj);

    obj._e_event331 = obj.editPENome:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event332 = obj.editPENome:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event333 = obj.editPENome:addEventListener("onClick",
        function (_)
            common.onClick(sheet, common.eventFunc, {tag = 'editPENome', node = sheet, form = self, event='onClick', contexto = ''}, nil, false);
        end, obj);

    obj._e_event334 = obj.editPENome:addEventListener("onMenu",
        function (_, x, y)
            common.onClick(sheet, common.eventFunc, {tag = 'editPENome', node = sheet, form = self, event='onMenu', contexto = ''}, nil, true);
        end, obj);

    obj._e_event335 = obj.labelFieldPENivel:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event336 = obj.labelFieldPENivel:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event337 = obj.labelFieldPEEscola:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event338 = obj.labelFieldPEEscola:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event339 = obj.labelFieldPETempo:addEventListener("onKeyDown",
        function (_, event)
            common.keyDown(sheet, event);
        end, obj);

    obj._e_event340 = obj.labelFieldPETempo:addEventListener("onKeyUp",
        function (_, event)
            common.keyUp(sheet, event);
        end, obj);

    obj._e_event341 = obj.dataLink87:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            									self.popupEditCompM:setEnabled(node.componentesM or false);
        end, obj);

    obj._e_event342 = obj.dataLink88:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            								self.layPrepValor:setVisible(node.preparadoTipo == 'Preparada' or node.preparadoTipo == 'Sempre Preparada');
            								self.layPrepValor:setEnabled(node.preparadoTipo == 'Preparada');
        end, obj);

    obj._e_event343 = obj.dataLink89:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            									self.popupEditCondAtiv:setEnabled(node.tempoConjuracaoUnidade == 'Reação');
        end, obj);

    obj._e_event344 = obj.dataLink90:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            									if node.alcanceUnidade == 'Nenhum' or node.alcanceUnidade == 'Pessoal' or node.alcanceUnidade == 'Toque' then
            										self.popupEditAlcanceCurto:setEnabled(false);
            										self.popupEditAlcanceLongo:setEnabled(false);
            									else
            										self.popupEditAlcanceCurto:setEnabled(true);
            										self.popupEditAlcanceLongo:setEnabled(true);
            									end;
        end, obj);

    obj._e_event345 = obj.dataLink91:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            									if node.duracaoUnidade == 'Instantânea' or node.duracaoUnidade == 'Permanente' then
            										self.popupEditDuracaoUnidade:setEnabled(false);
            									else
            										self.popupEditDuracaoUnidade:setEnabled(true);
            									end;
        end, obj);

    obj._e_event346 = obj.dataLink92:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            									local contador = common.getContador(node, node.contadorNome or '');
            									if not contador then
            										node.contadorUsosTotal = '-';
            									else
            										node.contadorUsosTotal = contador.valMax;
            									end;
        end, obj);

    obj._e_event347 = obj.dataLink93:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            							self.popupEditAtaqueAtrib:setEnabled(node.ataqueTipo ~= 'Sem Ataque');	
            							self.popupEditAtaqueBonus:setEnabled(node.ataqueTipo ~= 'Sem Ataque');
        end, obj);

    obj._e_event348 = obj.button39:addEventListener("onClick",
        function (_)
            self.popupEditDanoRL:append();
        end, obj);

    obj._e_event349 = obj.popupEditDanoRL:addEventListener("onEndEnumeration",
        function (_)
            local node = self.popupEdit:getNodeObject();
            								local h = 30 + self.popupEditDanoRect.margins.top + self.popupEditDanoRect.margins.bottom;
            								local danos = NDB.getChildNodes(node and node.danos or {});
            								if #danos > 0 then
            									h = h + 24 + #danos * 29;
            									self.popupEditDanoLegenda:setVisible(true);
            								else
            									self.popupEditDanoLegenda:setVisible(false);
            								end;
            								self.popupEditDanoRect:setHeight(h);
        end, obj);

    obj._e_event350 = obj.button40:addEventListener("onClick",
        function (_)
            local formula = self.popupEditFormulaRL:append();
            									if formula then formula.tipoDano = "não"; end;
        end, obj);

    obj._e_event351 = obj.popupEditFormulaRL:addEventListener("onEndEnumeration",
        function (_)
            local node = self.popupEdit:getNodeObject();
            								local h = 30 + self.popupEditFormulaRect.margins.top + self.popupEditFormulaRect.margins.bottom;
            								local formulas = NDB.getChildNodes(node and node.formulas or {});
            								if #formulas > 0 then
            									h = h + 24 + #formulas * 29;
            									self.popupEditFormulaLegenda:setVisible(true);
            								else
            									self.popupEditFormulaLegenda:setVisible(false);
            								end;
            								self.popupEditFormulaRect:setHeight(h);
        end, obj);

    obj._e_event352 = obj.dataLink94:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            									if not node.cdResistenciaTipo then
            										node.cdResistenciaTipo = 'conjuracao';
            									elseif node.cdResistenciaTipo == "fixo" then
            										self.popupEditCDvalor:setEnabled(true);
            									else
            										local ficha = common.getTopNode(node);
            										local hab = node.cdResistenciaTipo;
            										local modHab;
            										local modProf = tonumber(ficha.bonusProficiencia) or 0;
            
            										if hab == 'conjuracao' then hab = ficha.magias.habilidadeDeConjuracao; end;
            
            										modHab = tonumber(ficha.atributos['mod' .. common.toCapitalCase(hab)]) or 0;
            
            										self.popupEditCDvalor:setEnabled(false);
            										node.cdResistenciaValor = 8 + modHab + modProf;
            									end;
        end, obj);

    obj._e_event353 = obj.dataLink95:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            							dload.getSourcePath(self, "spells", node.importSourceName, function(path) node.importSourcePath = path; end);
        end, obj);

    obj._e_event354 = obj.dataLink97:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            							dload.spellGetClasses(self, node.importSourcePath, node.importLevel, function(items) self.comboBoxImportClass:setItems(items); end);
        end, obj);

    obj._e_event355 = obj.dataLink98:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.popupEdit:getNodeObject();
            							dload.spellGetNames(self, node.importSourcePath, node.importLevel, node.importClass, function(items) self.comboBoxImportMagia:setItems(items); end);
        end, obj);

    obj._e_event356 = obj.button41:addEventListener("onClick",
        function (_)
            local node = self.popupEdit:getNodeObject();
            						dload.spellImport(self, node.importSourcePath, node.importName, node);
        end, obj);

    obj._e_event357 = obj.dataLink99:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local hab;
            			local bonusProficiencia;
            			local modHab;
            
            			sheet.magias = sheet.magias or {};
            			sheet.atributos = sheet.atributos or {};
            
            			hab = sheet.magias.habilidadeDeConjuracao;
            
            			modHab = tonumber(sheet.atributos['mod' .. common.toCapitalCase(hab)]) or 0;
            
            			bonusProficiencia = tonumber(sheet.bonusProficiencia) or 0;
            
            			sheet.magias.cdDaMagia = 8 + modHab + bonusProficiencia;
            			sheet.magias.bonusAtaque = modHab + bonusProficiencia;
            
            			if sheet.magias.bonusAtaque >= 0 then
            				sheet.magias.bonusAtaqueSTR = "+" .. sheet.magias.bonusAtaque;
            			else
            				sheet.magias.bonusAtaqueSTR = sheet.magias.bonusAtaque;
            			end;
            
            
            			local niveis = NDB.getChildNodes(sheet.magias.niveis);
            
            			if #niveis == 0 then
            				local truques = self.rclMagiasNiveis:append();
            				truques.nome = 'Truques';
            				-- if sheet.magias.magias then
            				-- 	local magias_old = NDB.getChildNodes(sheet.magias.magias);
            				-- 	for i=1, #magias_old do
            				-- 		local magia = truques.rclMagias:append();
            				-- 		local magia_old = magias_old[i];
            				-- 		magia.nome = magia_old.nome;
            				-- 		if magia_old.tempoDeFormulacao then magia.tempoConjuracaoValor = magia_old.tempoDeFormulacao end;
            				-- 		if magia_old.alcance then magia.alvoValor = magia_old.alcance end;
            				-- 		magia.componentesV = string.find(magia_old.componentes, 'V');
            				-- 		magia.componentesS = string.find(magia_old.componentes, 'S');
            				-- 		magia.componentesM = string.find(magia_old.componentes, 'M');
            				-- 		magia.componentesConcentracao = string.find(magia_old.componentes, 'C');
            				-- 		magia.componentesRitual = string.find(magia_old.componentes, 'R');
            				-- 		if magia_old.duracao then magia.duracaoValor = magia_old.duracao end;
            				-- 		if magia_old.ataque == 'Ataque Corpo-a-Corpo' then magia.ataqueTipo = 'Ataque de Magia Corpo-a-Corpo';
            				-- 		elseif magia_old.ataque == 'Ataque a Distância' then magia.ataqueTipo = 'Ataque de Magia a Distância';
            				-- 		end;
            				-- 		if magia_old.resistencia == 'Força' then magia.cdResistenciaAtributo = 'forca';
            				-- 		elseif magia_old.resistencia == 'Destreza' then magia.cdResistenciaAtributo = 'destreza';
            				-- 		elseif magia_old.resistencia == 'Constituição' then magia.cdResistenciaAtributo = 'constituicao';
            				-- 		elseif magia_old.resistencia == 'Inteligência' then magia.cdResistenciaAtributo = 'inteligencia';
            				-- 		elseif magia_old.resistencia == 'Sabedoria' then magia.cdResistenciaAtributo = 'sabedoria';
            				-- 		elseif magia_old.resistencia == 'Carisma' then magia.cdResistenciaAtributo = 'carisma';
            				-- 		end;
            				-- 	end;
            				-- end;
            
            				for lvl=1,9 do
            					local node = self.rclMagiasNiveis:append();
            					node.nome = lvl .. 'º Nível';
            					if sheet.magias.magias then
            						node.espacosTotais = sheet.magias['espacosTotais' .. lvl];
            						node.espacosAtuais = node.espacosTotais - sheet.magias['espacosGastos' .. lvl];
            						-- local magias_old = NDB.getChildNodes(sheet.magias.magias);
            						-- for i=1, #magias_old do
            						-- 	local magia = node.rclMagias:append();
            						-- 	local magia_old = magias_old[i];
            						-- 	magia.nome = magia_old.nome;
            						-- 	if magia_old.tempoDeFormulacao then magia.tempoConjuracaoValor = magia_old.tempoDeFormulacao end;
            						-- 	if magia_old.alcance then magia.alvoValor = magia_old.alcance end;
            						-- 	magia.componentesV = string.find(magia_old.componentes, 'V');
            						-- 	magia.componentesS = string.find(magia_old.componentes, 'S');
            						-- 	magia.componentesM = string.find(magia_old.componentes, 'M');
            						-- 	magia.componentesConcentracao = string.find(magia_old.componentes, 'C');
            						-- 	magia.componentesRitual = string.find(magia_old.componentes, 'R');
            						-- 	if magia_old.duracao then magia.duracaoValor = magia_old.duracao end;
            						-- 	if magia_old.ataque == 'Ataque Corpo-a-Corpo' then magia.ataqueTipo = 'Ataque de Magia Corpo-a-Corpo';
            						-- 	elseif magia_old.ataque == 'Ataque a Distância' then magia.ataqueTipo = 'Ataque de Magia a Distância';
            						-- 	end;
            						-- 	if magia_old.resistencia == 'Força' then magia.cdResistenciaAtributo = 'forca';
            						-- 	elseif magia_old.resistencia == 'Destreza' then magia.cdResistenciaAtributo = 'destreza';
            						-- 	elseif magia_old.resistencia == 'Constituição' then magia.cdResistenciaAtributo = 'constituicao';
            						-- 	elseif magia_old.resistencia == 'Inteligência' then magia.cdResistenciaAtributo = 'inteligencia';
            						-- 	elseif magia_old.resistencia == 'Sabedoria' then magia.cdResistenciaAtributo = 'sabedoria';
            						-- 	elseif magia_old.resistencia == 'Carisma' then magia.cdResistenciaAtributo = 'carisma';
            						-- 	end;
            						-- end;
            					end;
            				end;
            			end;
        end, obj);

    obj._e_event358 = obj.dataLink100:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.magias and sheet.magias.selecionada then
            			local node;
            			local niveis = NDB.getChildNodes(sheet.magias.niveis);
            			for i=1,#niveis do
            				local nodes = NDB.getChildNodes(niveis[i].magias);
            				for j=1,#nodes do
            					if nodes[j].id == sheet.magias.selecionada then
            						node = nodes[j];
            					end;
            				end;
            			end;
            
            			if node then
            				self.popupEdit:setNodeObject(node);
            				self.popupEdit:show();
            			else
            				showMessage('nope');
            			end;
            		end;
        end, obj);

    obj._e_event359 = obj.button42:addEventListener("onClick",
        function (_)
            self.rclContadores:append()
        end, obj);

    obj._e_event360 = obj.button43:addEventListener("onClick",
        function (_)
            for key,_ in pairs(sheet.macroSavedSkills) do
            					val = sheet.macroSavedSkills[key];
            					if common.getContador(key) == nil then
            						local contador = self.rclContadores:append();
            						contador.name = val.nome;
            						contador.valCur = val.min;
            						contador.valMax = val.max;
            						if val.reset == "Descanso Curto" then contador["resetsDescanso Curto"] = "Completa"; contador["resetsDescanso Longo"] = "Completa"; end;
            						if val.reset == "Descanso Longo" then contador["resetsDescanso Longo"] = "Completa"; end;
            						if val.reset == "Dado de Vida" then contador["resetsDescanso Longo"] = "Recupera Metade (⌃)"; end;
            					end;
            				end;
        end, obj);

    obj._e_event361 = obj.rclContadores:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.name, nodeB.name);
        end, obj);

    obj._e_event362 = obj.rclContadores:addEventListener("onItemAdded",
        function (_, node, form)
            if sheet ~= nil then
            					sheet.contadoresMudaram = true;
            					sheet.contadoresMudaram = false;
            				end;
        end, obj);

    obj._e_event363 = obj.rclContadores:addEventListener("onItemRemoved",
        function (_, node, form)
            if sheet ~= nil then
            					sheet.contadoresMudaram = true;
            					sheet.contadoresMudaram = false;
            				end;
        end, obj);

    obj._e_event364 = obj.dataLink101:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local contadores = NDB.getChildNodes(sheet.contadores);
            			for i=1,#contadores,1 do
            				contadores[i].descansoLongo = sheet.descansoLongo;
            				contadores[i].descansoCurto = sheet.descansoCurto;
            			end;
        end, obj);

    obj._e_event365 = obj.button44:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo('Você tem certeza que deseja resetar as propriedades da ficha?', function(confirmado) if confirmado then sheet.propriedades = {}; end; end);
        end, obj);

    obj._e_event366 = obj.button45:addEventListener("onClick",
        function (_)
            if not sheet.propriedades then sheet.propriedades = {}; end;
            
            		local choices = {};
            		for key,val in pairs(common.ficha_propriedades) do
            			if sheet.propriedades[key] == nil then table.insert(choices, val.nome); end;
            		end;
            		table.sort(choices);
            		Dialogs.choose('Qual propriedade?', choices, function(selected, choiceIndex, choiceText)
            			for key,val in pairs(common.ficha_propriedades) do
            				if val.nome == choiceText then
            					if sheet.propriedades[key] then return;
            					end;
            
            					local node = self.rclFichaPropriedades:append();
            
            					node.id = key;
            					node.nome = val.nome;
            					node.descricao = val.descricao;
            					node.tipo = val.tipo;
            					node.min = val.min;
            					node.max = val.max;
            					node.default = val.default;
            					node.implementado = val.implementado;
            
            					sheet.propriedades[key] = true;
            					sheet.propriedades.alterou = key;
            					sheet.propriedades.alterou = nil;
            					return;
            				end;
            			end;
            		end);
        end, obj);

    obj._e_event367 = obj.checkBox9:addEventListener("onChange",
        function (_)
            if sheet then
            							self.anotacoesFancy:setVisible(sheet.outros.anotacoes_melhorado);
            							self.anotacoesMerda:setVisible(not (sheet.outros.anotacoes_melhorado));
            						end;
        end, obj);

    obj._e_event368 = obj.btnPolymorph:addEventListener("onClick",
        function (_)
            dload.polymorph(self, true);
        end, obj);

    obj._e_event369 = obj.btnUnpolymorph:addEventListener("onClick",
        function (_)
            dload.unpolymorph(self);
        end, obj);

    obj._e_event370 = obj.dataLink102:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.btnPolymorph:setEnabled(sheet.polymorph.old == nil);
            				self.btnUnpolymorph:setEnabled(sheet.polymorph.old ~= nil);
        end, obj);

    obj._e_event371 = obj.labupperGridMagicBox7:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox7._RecalcSize();
        end, obj);

    obj._e_event372 = obj.button46:addEventListener("onClick",
        function (_)
            sheet.macroSavedSkills = nil;
            				sheet.macroProperties = nil;
            				sheet.attackOptions = nil;
            				sheet.resistencias.attr = nil;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event372);
        __o_rrpgObjs.removeEventListenerById(self._e_event371);
        __o_rrpgObjs.removeEventListenerById(self._e_event370);
        __o_rrpgObjs.removeEventListenerById(self._e_event369);
        __o_rrpgObjs.removeEventListenerById(self._e_event368);
        __o_rrpgObjs.removeEventListenerById(self._e_event367);
        __o_rrpgObjs.removeEventListenerById(self._e_event366);
        __o_rrpgObjs.removeEventListenerById(self._e_event365);
        __o_rrpgObjs.removeEventListenerById(self._e_event364);
        __o_rrpgObjs.removeEventListenerById(self._e_event363);
        __o_rrpgObjs.removeEventListenerById(self._e_event362);
        __o_rrpgObjs.removeEventListenerById(self._e_event361);
        __o_rrpgObjs.removeEventListenerById(self._e_event360);
        __o_rrpgObjs.removeEventListenerById(self._e_event359);
        __o_rrpgObjs.removeEventListenerById(self._e_event358);
        __o_rrpgObjs.removeEventListenerById(self._e_event357);
        __o_rrpgObjs.removeEventListenerById(self._e_event356);
        __o_rrpgObjs.removeEventListenerById(self._e_event355);
        __o_rrpgObjs.removeEventListenerById(self._e_event354);
        __o_rrpgObjs.removeEventListenerById(self._e_event353);
        __o_rrpgObjs.removeEventListenerById(self._e_event352);
        __o_rrpgObjs.removeEventListenerById(self._e_event351);
        __o_rrpgObjs.removeEventListenerById(self._e_event350);
        __o_rrpgObjs.removeEventListenerById(self._e_event349);
        __o_rrpgObjs.removeEventListenerById(self._e_event348);
        __o_rrpgObjs.removeEventListenerById(self._e_event347);
        __o_rrpgObjs.removeEventListenerById(self._e_event346);
        __o_rrpgObjs.removeEventListenerById(self._e_event345);
        __o_rrpgObjs.removeEventListenerById(self._e_event344);
        __o_rrpgObjs.removeEventListenerById(self._e_event343);
        __o_rrpgObjs.removeEventListenerById(self._e_event342);
        __o_rrpgObjs.removeEventListenerById(self._e_event341);
        __o_rrpgObjs.removeEventListenerById(self._e_event340);
        __o_rrpgObjs.removeEventListenerById(self._e_event339);
        __o_rrpgObjs.removeEventListenerById(self._e_event338);
        __o_rrpgObjs.removeEventListenerById(self._e_event337);
        __o_rrpgObjs.removeEventListenerById(self._e_event336);
        __o_rrpgObjs.removeEventListenerById(self._e_event335);
        __o_rrpgObjs.removeEventListenerById(self._e_event334);
        __o_rrpgObjs.removeEventListenerById(self._e_event333);
        __o_rrpgObjs.removeEventListenerById(self._e_event332);
        __o_rrpgObjs.removeEventListenerById(self._e_event331);
        __o_rrpgObjs.removeEventListenerById(self._e_event330);
        __o_rrpgObjs.removeEventListenerById(self._e_event329);
        __o_rrpgObjs.removeEventListenerById(self._e_event328);
        __o_rrpgObjs.removeEventListenerById(self._e_event327);
        __o_rrpgObjs.removeEventListenerById(self._e_event326);
        __o_rrpgObjs.removeEventListenerById(self._e_event325);
        __o_rrpgObjs.removeEventListenerById(self._e_event324);
        __o_rrpgObjs.removeEventListenerById(self._e_event323);
        __o_rrpgObjs.removeEventListenerById(self._e_event322);
        __o_rrpgObjs.removeEventListenerById(self._e_event321);
        __o_rrpgObjs.removeEventListenerById(self._e_event320);
        __o_rrpgObjs.removeEventListenerById(self._e_event319);
        __o_rrpgObjs.removeEventListenerById(self._e_event318);
        __o_rrpgObjs.removeEventListenerById(self._e_event317);
        __o_rrpgObjs.removeEventListenerById(self._e_event316);
        __o_rrpgObjs.removeEventListenerById(self._e_event315);
        __o_rrpgObjs.removeEventListenerById(self._e_event314);
        __o_rrpgObjs.removeEventListenerById(self._e_event313);
        __o_rrpgObjs.removeEventListenerById(self._e_event312);
        __o_rrpgObjs.removeEventListenerById(self._e_event311);
        __o_rrpgObjs.removeEventListenerById(self._e_event310);
        __o_rrpgObjs.removeEventListenerById(self._e_event309);
        __o_rrpgObjs.removeEventListenerById(self._e_event308);
        __o_rrpgObjs.removeEventListenerById(self._e_event307);
        __o_rrpgObjs.removeEventListenerById(self._e_event306);
        __o_rrpgObjs.removeEventListenerById(self._e_event305);
        __o_rrpgObjs.removeEventListenerById(self._e_event304);
        __o_rrpgObjs.removeEventListenerById(self._e_event303);
        __o_rrpgObjs.removeEventListenerById(self._e_event302);
        __o_rrpgObjs.removeEventListenerById(self._e_event301);
        __o_rrpgObjs.removeEventListenerById(self._e_event300);
        __o_rrpgObjs.removeEventListenerById(self._e_event299);
        __o_rrpgObjs.removeEventListenerById(self._e_event298);
        __o_rrpgObjs.removeEventListenerById(self._e_event297);
        __o_rrpgObjs.removeEventListenerById(self._e_event296);
        __o_rrpgObjs.removeEventListenerById(self._e_event295);
        __o_rrpgObjs.removeEventListenerById(self._e_event294);
        __o_rrpgObjs.removeEventListenerById(self._e_event293);
        __o_rrpgObjs.removeEventListenerById(self._e_event292);
        __o_rrpgObjs.removeEventListenerById(self._e_event291);
        __o_rrpgObjs.removeEventListenerById(self._e_event290);
        __o_rrpgObjs.removeEventListenerById(self._e_event289);
        __o_rrpgObjs.removeEventListenerById(self._e_event288);
        __o_rrpgObjs.removeEventListenerById(self._e_event287);
        __o_rrpgObjs.removeEventListenerById(self._e_event286);
        __o_rrpgObjs.removeEventListenerById(self._e_event285);
        __o_rrpgObjs.removeEventListenerById(self._e_event284);
        __o_rrpgObjs.removeEventListenerById(self._e_event283);
        __o_rrpgObjs.removeEventListenerById(self._e_event282);
        __o_rrpgObjs.removeEventListenerById(self._e_event281);
        __o_rrpgObjs.removeEventListenerById(self._e_event280);
        __o_rrpgObjs.removeEventListenerById(self._e_event279);
        __o_rrpgObjs.removeEventListenerById(self._e_event278);
        __o_rrpgObjs.removeEventListenerById(self._e_event277);
        __o_rrpgObjs.removeEventListenerById(self._e_event276);
        __o_rrpgObjs.removeEventListenerById(self._e_event275);
        __o_rrpgObjs.removeEventListenerById(self._e_event274);
        __o_rrpgObjs.removeEventListenerById(self._e_event273);
        __o_rrpgObjs.removeEventListenerById(self._e_event272);
        __o_rrpgObjs.removeEventListenerById(self._e_event271);
        __o_rrpgObjs.removeEventListenerById(self._e_event270);
        __o_rrpgObjs.removeEventListenerById(self._e_event269);
        __o_rrpgObjs.removeEventListenerById(self._e_event268);
        __o_rrpgObjs.removeEventListenerById(self._e_event267);
        __o_rrpgObjs.removeEventListenerById(self._e_event266);
        __o_rrpgObjs.removeEventListenerById(self._e_event265);
        __o_rrpgObjs.removeEventListenerById(self._e_event264);
        __o_rrpgObjs.removeEventListenerById(self._e_event263);
        __o_rrpgObjs.removeEventListenerById(self._e_event262);
        __o_rrpgObjs.removeEventListenerById(self._e_event261);
        __o_rrpgObjs.removeEventListenerById(self._e_event260);
        __o_rrpgObjs.removeEventListenerById(self._e_event259);
        __o_rrpgObjs.removeEventListenerById(self._e_event258);
        __o_rrpgObjs.removeEventListenerById(self._e_event257);
        __o_rrpgObjs.removeEventListenerById(self._e_event256);
        __o_rrpgObjs.removeEventListenerById(self._e_event255);
        __o_rrpgObjs.removeEventListenerById(self._e_event254);
        __o_rrpgObjs.removeEventListenerById(self._e_event253);
        __o_rrpgObjs.removeEventListenerById(self._e_event252);
        __o_rrpgObjs.removeEventListenerById(self._e_event251);
        __o_rrpgObjs.removeEventListenerById(self._e_event250);
        __o_rrpgObjs.removeEventListenerById(self._e_event249);
        __o_rrpgObjs.removeEventListenerById(self._e_event248);
        __o_rrpgObjs.removeEventListenerById(self._e_event247);
        __o_rrpgObjs.removeEventListenerById(self._e_event246);
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
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

        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.btnImportflwMagicRecordList5 ~= nil then self.btnImportflwMagicRecordList5:destroy(); self.btnImportflwMagicRecordList5 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.rclflwMagicRecordList7 ~= nil then self.rclflwMagicRecordList7:destroy(); self.rclflwMagicRecordList7 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.labProfacrobacia ~= nil then self.labProfacrobacia:destroy(); self.labProfacrobacia = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.fpPEEscola ~= nil then self.fpPEEscola:destroy(); self.fpPEEscola = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.comboBoxImportClass ~= nil then self.comboBoxImportClass:destroy(); self.comboBoxImportClass = nil; end;
        if self.cbProfforca ~= nil then self.cbProfforca:destroy(); self.cbProfforca = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.linUpperGridCampo7 ~= nil then self.linUpperGridCampo7:destroy(); self.linUpperGridCampo7 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.cbProfreligiao ~= nil then self.cbProfreligiao:destroy(); self.cbProfreligiao = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.labUpperGridCampo11 ~= nil then self.labUpperGridCampo11:destroy(); self.labUpperGridCampo11 = nil; end;
        if self.rclMagiasNiveis ~= nil then self.rclMagiasNiveis:destroy(); self.rclMagiasNiveis = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.labProffurtividade ~= nil then self.labProffurtividade:destroy(); self.labProffurtividade = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.btnPolymorph ~= nil then self.btnPolymorph:destroy(); self.btnPolymorph = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.fraCaracteristicasLayout ~= nil then self.fraCaracteristicasLayout:destroy(); self.fraCaracteristicasLayout = nil; end;
        if self.cbProfprestidigitacao ~= nil then self.cbProfprestidigitacao:destroy(); self.cbProfprestidigitacao = nil; end;
        if self.upperGridMagicBox3 ~= nil then self.upperGridMagicBox3:destroy(); self.upperGridMagicBox3 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.popupEdit ~= nil then self.popupEdit:destroy(); self.popupEdit = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.fraUpperGridFrente ~= nil then self.fraUpperGridFrente:destroy(); self.fraUpperGridFrente = nil; end;
        if self.cbProfinvestigacao ~= nil then self.cbProfinvestigacao:destroy(); self.cbProfinvestigacao = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.btnNovoflwMagicRecordList6 ~= nil then self.btnNovoflwMagicRecordList6:destroy(); self.btnNovoflwMagicRecordList6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.panupperGridMagicBox3 ~= nil then self.panupperGridMagicBox3:destroy(); self.panupperGridMagicBox3 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.cbxGridCampoSolido2 ~= nil then self.cbxGridCampoSolido2:destroy(); self.cbxGridCampoSolido2 = nil; end;
        if self.labupperGridMagicBox7 ~= nil then self.labupperGridMagicBox7:destroy(); self.labupperGridMagicBox7 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.upperGridMagicBox6 ~= nil then self.upperGridMagicBox6:destroy(); self.upperGridMagicBox6 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.panupperGridMagicBox1 ~= nil then self.panupperGridMagicBox1:destroy(); self.panupperGridMagicBox1 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.labupperGridMagicBox3 ~= nil then self.labupperGridMagicBox3:destroy(); self.labupperGridMagicBox3 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.cbProfnatureza ~= nil then self.cbProfnatureza:destroy(); self.cbProfnatureza = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.btnImportflwMagicRecordList4 ~= nil then self.btnImportflwMagicRecordList4:destroy(); self.btnImportflwMagicRecordList4 = nil; end;
        if self.labProfreligiao ~= nil then self.labProfreligiao:destroy(); self.labProfreligiao = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.cbProfpersuasao ~= nil then self.cbProfpersuasao:destroy(); self.cbProfpersuasao = nil; end;
        if self.UpperGridCampo10 ~= nil then self.UpperGridCampo10:destroy(); self.UpperGridCampo10 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.upperGridMagicEditBox1 ~= nil then self.upperGridMagicEditBox1:destroy(); self.upperGridMagicEditBox1 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.labProfdestreza ~= nil then self.labProfdestreza:destroy(); self.labProfdestreza = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.fpPETempo ~= nil then self.fpPETempo:destroy(); self.fpPETempo = nil; end;
        if self.labUpperGridCampo12 ~= nil then self.labUpperGridCampo12:destroy(); self.labUpperGridCampo12 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.layBottomflwMagicRecordList9 ~= nil then self.layBottomflwMagicRecordList9:destroy(); self.layBottomflwMagicRecordList9 = nil; end;
        if self.flwMagicRecordList9 ~= nil then self.flwMagicRecordList9:destroy(); self.flwMagicRecordList9 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.comboBoxImportLevel ~= nil then self.comboBoxImportLevel:destroy(); self.comboBoxImportLevel = nil; end;
        if self.edtUpperGridCampo8 ~= nil then self.edtUpperGridCampo8:destroy(); self.edtUpperGridCampo8 = nil; end;
        if self.labProfsobrevivencia ~= nil then self.labProfsobrevivencia:destroy(); self.labProfsobrevivencia = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.rclflwMagicRecordList2 ~= nil then self.rclflwMagicRecordList2:destroy(); self.rclflwMagicRecordList2 = nil; end;
        if self.edtNome1 ~= nil then self.edtNome1:destroy(); self.edtNome1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.btnImportflwMagicRecordList7 ~= nil then self.btnImportflwMagicRecordList7:destroy(); self.btnImportflwMagicRecordList7 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.popupEditCompM ~= nil then self.popupEditCompM:destroy(); self.popupEditCompM = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.labProfhistoria ~= nil then self.labProfhistoria:destroy(); self.labProfhistoria = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.panupperGridMagicBox4 ~= nil then self.panupperGridMagicBox4:destroy(); self.panupperGridMagicBox4 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.cbProfenganacao ~= nil then self.cbProfenganacao:destroy(); self.cbProfenganacao = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.flwMagicRecordList1 ~= nil then self.flwMagicRecordList1:destroy(); self.flwMagicRecordList1 = nil; end;
        if self.cbProfsabedoria ~= nil then self.cbProfsabedoria:destroy(); self.cbProfsabedoria = nil; end;
        if self.popupEditFormulaRL ~= nil then self.popupEditFormulaRL:destroy(); self.popupEditFormulaRL = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.layBottomflwMagicRecordList2 ~= nil then self.layBottomflwMagicRecordList2:destroy(); self.layBottomflwMagicRecordList2 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.labupperGridMagicBox5 ~= nil then self.labupperGridMagicBox5:destroy(); self.labupperGridMagicBox5 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.labProfforca ~= nil then self.labProfforca:destroy(); self.labProfforca = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.GridCampoSolido4 ~= nil then self.GridCampoSolido4:destroy(); self.GridCampoSolido4 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.popupEditCondAtiv ~= nil then self.popupEditCondAtiv:destroy(); self.popupEditCondAtiv = nil; end;
        if self.labProfarcanismo ~= nil then self.labProfarcanismo:destroy(); self.labProfarcanismo = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.labProfconstituicao ~= nil then self.labProfconstituicao:destroy(); self.labProfconstituicao = nil; end;
        if self.flwMagicRecordList8 ~= nil then self.flwMagicRecordList8:destroy(); self.flwMagicRecordList8 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.layEquipDefenseBottom ~= nil then self.layEquipDefenseBottom:destroy(); self.layEquipDefenseBottom = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.frame2 ~= nil then self.frame2:destroy(); self.frame2 = nil; end;
        if self.cbProfarcanismo ~= nil then self.cbProfarcanismo:destroy(); self.cbProfarcanismo = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.cbProfinteligencia ~= nil then self.cbProfinteligencia:destroy(); self.cbProfinteligencia = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.layBottomflwMagicRecordList4 ~= nil then self.layBottomflwMagicRecordList4:destroy(); self.layBottomflwMagicRecordList4 = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.cbProfatletismo ~= nil then self.cbProfatletismo:destroy(); self.cbProfatletismo = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.optAtaqueLegenda ~= nil then self.optAtaqueLegenda:destroy(); self.optAtaqueLegenda = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.frame5 ~= nil then self.frame5:destroy(); self.frame5 = nil; end;
        if self.layPrepValorChb ~= nil then self.layPrepValorChb:destroy(); self.layPrepValorChb = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.layBottomflwMagicRecordList8 ~= nil then self.layBottomflwMagicRecordList8:destroy(); self.layBottomflwMagicRecordList8 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.cbProfhistoria ~= nil then self.cbProfhistoria:destroy(); self.cbProfhistoria = nil; end;
        if self.btnApagar ~= nil then self.btnApagar:destroy(); self.btnApagar = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.frame4 ~= nil then self.frame4:destroy(); self.frame4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.cbxGridCampoSolido6 ~= nil then self.cbxGridCampoSolido6:destroy(); self.cbxGridCampoSolido6 = nil; end;
        if self.flowLayout37 ~= nil then self.flowLayout37:destroy(); self.flowLayout37 = nil; end;
        if self.btnImportflwMagicRecordList2 ~= nil then self.btnImportflwMagicRecordList2:destroy(); self.btnImportflwMagicRecordList2 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.fpPENome ~= nil then self.fpPENome:destroy(); self.fpPENome = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.linUpperGridCampo9 ~= nil then self.linUpperGridCampo9:destroy(); self.linUpperGridCampo9 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.cbxGridCampoSolido4 ~= nil then self.cbxGridCampoSolido4:destroy(); self.cbxGridCampoSolido4 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.flowLayout39 ~= nil then self.flowLayout39:destroy(); self.flowLayout39 = nil; end;
        if self.flwMagicRecordList3 ~= nil then self.flwMagicRecordList3:destroy(); self.flwMagicRecordList3 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rclflwMagicRecordList5 ~= nil then self.rclflwMagicRecordList5:destroy(); self.rclflwMagicRecordList5 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclflwMagicRecordList9 ~= nil then self.rclflwMagicRecordList9:destroy(); self.rclflwMagicRecordList9 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.rclOptsAttack ~= nil then self.rclOptsAttack:destroy(); self.rclOptsAttack = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.labProfatletismo ~= nil then self.labProfatletismo:destroy(); self.labProfatletismo = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.flowLayout40 ~= nil then self.flowLayout40:destroy(); self.flowLayout40 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flwMagicRecordList7 ~= nil then self.flwMagicRecordList7:destroy(); self.flwMagicRecordList7 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.btnNovoflwMagicRecordList5 ~= nil then self.btnNovoflwMagicRecordList5:destroy(); self.btnNovoflwMagicRecordList5 = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.upperGridMagicBox1 ~= nil then self.upperGridMagicBox1:destroy(); self.upperGridMagicBox1 = nil; end;
        if self.cbOptAtaqueMunicao ~= nil then self.cbOptAtaqueMunicao:destroy(); self.cbOptAtaqueMunicao = nil; end;
        if self.panupperGridMagicEditBox1 ~= nil then self.panupperGridMagicEditBox1:destroy(); self.panupperGridMagicEditBox1 = nil; end;
        if self.labProfatuacao ~= nil then self.labProfatuacao:destroy(); self.labProfatuacao = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.linUpperGridCampo11 ~= nil then self.linUpperGridCampo11:destroy(); self.linUpperGridCampo11 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.popupEditFormulaLegenda ~= nil then self.popupEditFormulaLegenda:destroy(); self.popupEditFormulaLegenda = nil; end;
        if self.cbProfintimidacao ~= nil then self.cbProfintimidacao:destroy(); self.cbProfintimidacao = nil; end;
        if self.dataEquipAttackDetails ~= nil then self.dataEquipAttackDetails:destroy(); self.dataEquipAttackDetails = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.cbProffurtividade ~= nil then self.cbProffurtividade:destroy(); self.cbProffurtividade = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.UpperGridCampo11 ~= nil then self.UpperGridCampo11:destroy(); self.UpperGridCampo11 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.cmbupperGridMagicBox4 ~= nil then self.cmbupperGridMagicBox4:destroy(); self.cmbupperGridMagicBox4 = nil; end;
        if self.cmbupperGridMagicBox1 ~= nil then self.cmbupperGridMagicBox1:destroy(); self.cmbupperGridMagicBox1 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.editorMerda ~= nil then self.editorMerda:destroy(); self.editorMerda = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.labupperGridMagicBox3val ~= nil then self.labupperGridMagicBox3val:destroy(); self.labupperGridMagicBox3val = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.editPENome ~= nil then self.editPENome:destroy(); self.editPENome = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.GridCampoSolido7 ~= nil then self.GridCampoSolido7:destroy(); self.GridCampoSolido7 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.horzLine27 ~= nil then self.horzLine27:destroy(); self.horzLine27 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.popupEditFormulaRect ~= nil then self.popupEditFormulaRect:destroy(); self.popupEditFormulaRect = nil; end;
        if self.UpperGridCampo8 ~= nil then self.UpperGridCampo8:destroy(); self.UpperGridCampo8 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.linUpperGridCampo12 ~= nil then self.linUpperGridCampo12:destroy(); self.linUpperGridCampo12 = nil; end;
        if self.UpperGridCampo7 ~= nil then self.UpperGridCampo7:destroy(); self.UpperGridCampo7 = nil; end;
        if self.fraAliadosOrganizacoes ~= nil then self.fraAliadosOrganizacoes:destroy(); self.fraAliadosOrganizacoes = nil; end;
        if self.layBottomflwMagicRecordList1 ~= nil then self.layBottomflwMagicRecordList1:destroy(); self.layBottomflwMagicRecordList1 = nil; end;
        if self.cbProfmedicina ~= nil then self.cbProfmedicina:destroy(); self.cbProfmedicina = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.upperGridMagicBox4 ~= nil then self.upperGridMagicBox4:destroy(); self.upperGridMagicBox4 = nil; end;
        if self.rclflwMagicRecordList8 ~= nil then self.rclflwMagicRecordList8:destroy(); self.rclflwMagicRecordList8 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.fraEquipamentoLayout ~= nil then self.fraEquipamentoLayout:destroy(); self.fraEquipamentoLayout = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.flwPartEquipDefense ~= nil then self.flwPartEquipDefense:destroy(); self.flwPartEquipDefense = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.labUpperGridCampo7 ~= nil then self.labUpperGridCampo7:destroy(); self.labUpperGridCampo7 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layPrincipal ~= nil then self.layPrincipal:destroy(); self.layPrincipal = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.flowLayout42 ~= nil then self.flowLayout42:destroy(); self.flowLayout42 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.btnUnpolymorph ~= nil then self.btnUnpolymorph:destroy(); self.btnUnpolymorph = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.popupEditDanoLegenda ~= nil then self.popupEditDanoLegenda:destroy(); self.popupEditDanoLegenda = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.labGridCampoSolido7 ~= nil then self.labGridCampoSolido7:destroy(); self.labGridCampoSolido7 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.btnNovoflwMagicRecordList1 ~= nil then self.btnNovoflwMagicRecordList1:destroy(); self.btnNovoflwMagicRecordList1 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.rclflwMagicRecordList3 ~= nil then self.rclflwMagicRecordList3:destroy(); self.rclflwMagicRecordList3 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.linUpperGridCampo10 ~= nil then self.linUpperGridCampo10:destroy(); self.linUpperGridCampo10 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.UpperGridCampo12 ~= nil then self.UpperGridCampo12:destroy(); self.UpperGridCampo12 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.popupEditCDvalor ~= nil then self.popupEditCDvalor:destroy(); self.popupEditCDvalor = nil; end;
        if self.labupperGridMagicEditBox1 ~= nil then self.labupperGridMagicEditBox1:destroy(); self.labupperGridMagicEditBox1 = nil; end;
        if self.cbProfacrobacia ~= nil then self.cbProfacrobacia:destroy(); self.cbProfacrobacia = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.btnImportflwMagicRecordList1 ~= nil then self.btnImportflwMagicRecordList1:destroy(); self.btnImportflwMagicRecordList1 = nil; end;
        if self.flwNome1 ~= nil then self.flwNome1:destroy(); self.flwNome1 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.labProfsabedoria ~= nil then self.labProfsabedoria:destroy(); self.labProfsabedoria = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.rclflwMagicRecordList4 ~= nil then self.rclflwMagicRecordList4:destroy(); self.rclflwMagicRecordList4 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edtUpperGridCampo12 ~= nil then self.edtUpperGridCampo12:destroy(); self.edtUpperGridCampo12 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.fraUpperGridMagias ~= nil then self.fraUpperGridMagias:destroy(); self.fraUpperGridMagias = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.upperGridMagicBox2 ~= nil then self.upperGridMagicBox2:destroy(); self.upperGridMagicBox2 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flwMagicRecordList6 ~= nil then self.flwMagicRecordList6:destroy(); self.flwMagicRecordList6 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.prtAliados ~= nil then self.prtAliados:destroy(); self.prtAliados = nil; end;
        if self.flwMagicRecordList5 ~= nil then self.flwMagicRecordList5:destroy(); self.flwMagicRecordList5 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.rclEquips ~= nil then self.rclEquips:destroy(); self.rclEquips = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.btnImportflwMagicRecordList3 ~= nil then self.btnImportflwMagicRecordList3:destroy(); self.btnImportflwMagicRecordList3 = nil; end;
        if self.cbProfadestrarAnimais ~= nil then self.cbProfadestrarAnimais:destroy(); self.cbProfadestrarAnimais = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.btnNovoflwMagicRecordList10 ~= nil then self.btnNovoflwMagicRecordList10:destroy(); self.btnNovoflwMagicRecordList10 = nil; end;
        if self.cbProfsobrevivencia ~= nil then self.cbProfsobrevivencia:destroy(); self.cbProfsobrevivencia = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.labProfmedicina ~= nil then self.labProfmedicina:destroy(); self.labProfmedicina = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.flwMagicRecordList2 ~= nil then self.flwMagicRecordList2:destroy(); self.flwMagicRecordList2 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.labProfnatureza ~= nil then self.labProfnatureza:destroy(); self.labProfnatureza = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.btnNovoflwMagicRecordList9 ~= nil then self.btnNovoflwMagicRecordList9:destroy(); self.btnNovoflwMagicRecordList9 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.labProfadestrarAnimais ~= nil then self.labProfadestrarAnimais:destroy(); self.labProfadestrarAnimais = nil; end;
        if self.optAtaquePadrao ~= nil then self.optAtaquePadrao:destroy(); self.optAtaquePadrao = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.labGridCampoSolido3 ~= nil then self.labGridCampoSolido3:destroy(); self.labGridCampoSolido3 = nil; end;
        if self.labupperGridMagicBox6val ~= nil then self.labupperGridMagicBox6val:destroy(); self.labupperGridMagicBox6val = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.comboBoxImportMagia ~= nil then self.comboBoxImportMagia:destroy(); self.comboBoxImportMagia = nil; end;
        if self.cbProfatuacao ~= nil then self.cbProfatuacao:destroy(); self.cbProfatuacao = nil; end;
        if self.btnImportflwMagicRecordList10 ~= nil then self.btnImportflwMagicRecordList10:destroy(); self.btnImportflwMagicRecordList10 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.fraUpperGridCaracteristicas ~= nil then self.fraUpperGridCaracteristicas:destroy(); self.fraUpperGridCaracteristicas = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.comboBoxImportSource ~= nil then self.comboBoxImportSource:destroy(); self.comboBoxImportSource = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.btnNovoflwMagicRecordList3 ~= nil then self.btnNovoflwMagicRecordList3:destroy(); self.btnNovoflwMagicRecordList3 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.imgEquipAttackImg ~= nil then self.imgEquipAttackImg:destroy(); self.imgEquipAttackImg = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.labupperGridMagicBox2val ~= nil then self.labupperGridMagicBox2val:destroy(); self.labupperGridMagicBox2val = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layEquipPropriedades ~= nil then self.layEquipPropriedades:destroy(); self.layEquipPropriedades = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.labupperGridMagicBox5val ~= nil then self.labupperGridMagicBox5val:destroy(); self.labupperGridMagicBox5val = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.cmbupperGridMagicBox7 ~= nil then self.cmbupperGridMagicBox7:destroy(); self.cmbupperGridMagicBox7 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.labUpperGridCampo10 ~= nil then self.labUpperGridCampo10:destroy(); self.labUpperGridCampo10 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.rclProps ~= nil then self.rclProps:destroy(); self.rclProps = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.labGridCampoSolido1 ~= nil then self.labGridCampoSolido1:destroy(); self.labGridCampoSolido1 = nil; end;
        if self.editorFancy ~= nil then self.editorFancy:destroy(); self.editorFancy = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.cbxGridCampoSolido1 ~= nil then self.cbxGridCampoSolido1:destroy(); self.cbxGridCampoSolido1 = nil; end;
        if self.labupperGridMagicBox6 ~= nil then self.labupperGridMagicBox6:destroy(); self.labupperGridMagicBox6 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.layEquipAttackImg ~= nil then self.layEquipAttackImg:destroy(); self.layEquipAttackImg = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.flwMagicRecordList4 ~= nil then self.flwMagicRecordList4:destroy(); self.flwMagicRecordList4 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.labupperGridMagicBox1 ~= nil then self.labupperGridMagicBox1:destroy(); self.labupperGridMagicBox1 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.btnImportflwMagicRecordList8 ~= nil then self.btnImportflwMagicRecordList8:destroy(); self.btnImportflwMagicRecordList8 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.fpPENivel ~= nil then self.fpPENivel:destroy(); self.fpPENivel = nil; end;
        if self.layBottomflwMagicRecordList6 ~= nil then self.layBottomflwMagicRecordList6:destroy(); self.layBottomflwMagicRecordList6 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.cbxGridCampoSolido5 ~= nil then self.cbxGridCampoSolido5:destroy(); self.cbxGridCampoSolido5 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.rclFichaPropriedades ~= nil then self.rclFichaPropriedades:destroy(); self.rclFichaPropriedades = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.labelFieldPETempo ~= nil then self.labelFieldPETempo:destroy(); self.labelFieldPETempo = nil; end;
        if self.layBottomflwMagicRecordList3 ~= nil then self.layBottomflwMagicRecordList3:destroy(); self.layBottomflwMagicRecordList3 = nil; end;
        if self.cbProfintuicao ~= nil then self.cbProfintuicao:destroy(); self.cbProfintuicao = nil; end;
        if self.labelFieldPENivel ~= nil then self.labelFieldPENivel:destroy(); self.labelFieldPENivel = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.flwPartEquipAttack ~= nil then self.flwPartEquipAttack:destroy(); self.flwPartEquipAttack = nil; end;
        if self.frame7 ~= nil then self.frame7:destroy(); self.frame7 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.frame1 ~= nil then self.frame1:destroy(); self.frame1 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.btnImportflwMagicRecordList9 ~= nil then self.btnImportflwMagicRecordList9:destroy(); self.btnImportflwMagicRecordList9 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.popupEditContadorNome ~= nil then self.popupEditContadorNome:destroy(); self.popupEditContadorNome = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.popupEditDanoRL ~= nil then self.popupEditDanoRL:destroy(); self.popupEditDanoRL = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.labelFieldPEEscola ~= nil then self.labelFieldPEEscola:destroy(); self.labelFieldPEEscola = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.labProfinvestigacao ~= nil then self.labProfinvestigacao:destroy(); self.labProfinvestigacao = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.cbxGridCampoSolido3 ~= nil then self.cbxGridCampoSolido3:destroy(); self.cbxGridCampoSolido3 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.cbProfdestreza ~= nil then self.cbProfdestreza:destroy(); self.cbProfdestreza = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.edtUpperGridCampo10 ~= nil then self.edtUpperGridCampo10:destroy(); self.edtUpperGridCampo10 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.edtUpperGridCampo7 ~= nil then self.edtUpperGridCampo7:destroy(); self.edtUpperGridCampo7 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.cbProfpercepcao ~= nil then self.cbProfpercepcao:destroy(); self.cbProfpercepcao = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layNomeHolderFrente ~= nil then self.layNomeHolderFrente:destroy(); self.layNomeHolderFrente = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.labProfintimidacao ~= nil then self.labProfintimidacao:destroy(); self.labProfintimidacao = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.labGridCampoSolido2 ~= nil then self.labGridCampoSolido2:destroy(); self.labGridCampoSolido2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.cbProfconstituicao ~= nil then self.cbProfconstituicao:destroy(); self.cbProfconstituicao = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.flowLayout38 ~= nil then self.flowLayout38:destroy(); self.flowLayout38 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.labProfinteligencia ~= nil then self.labProfinteligencia:destroy(); self.labProfinteligencia = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.labGridCampoSolido6 ~= nil then self.labGridCampoSolido6:destroy(); self.labGridCampoSolido6 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.frame3 ~= nil then self.frame3:destroy(); self.frame3 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.upperGridMagicBox5 ~= nil then self.upperGridMagicBox5:destroy(); self.upperGridMagicBox5 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.linUpperGridCampo8 ~= nil then self.linUpperGridCampo8:destroy(); self.linUpperGridCampo8 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.btnImportflwMagicRecordList6 ~= nil then self.btnImportflwMagicRecordList6:destroy(); self.btnImportflwMagicRecordList6 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.popupEditAlcanceCurto ~= nil then self.popupEditAlcanceCurto:destroy(); self.popupEditAlcanceCurto = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.labProfenganacao ~= nil then self.labProfenganacao:destroy(); self.labProfenganacao = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.labProfintuicao ~= nil then self.labProfintuicao:destroy(); self.labProfintuicao = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.labProfprestidigitacao ~= nil then self.labProfprestidigitacao:destroy(); self.labProfprestidigitacao = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.GridCampoSolido5 ~= nil then self.GridCampoSolido5:destroy(); self.GridCampoSolido5 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layPrepValor ~= nil then self.layPrepValor:destroy(); self.layPrepValor = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.popupEditDanoRect ~= nil then self.popupEditDanoRect:destroy(); self.popupEditDanoRect = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.labupperGridMagicBox4 ~= nil then self.labupperGridMagicBox4:destroy(); self.labupperGridMagicBox4 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.labUpperGridCampo9 ~= nil then self.labUpperGridCampo9:destroy(); self.labUpperGridCampo9 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.labGridCampoSolido5 ~= nil then self.labGridCampoSolido5:destroy(); self.labGridCampoSolido5 = nil; end;
        if self.frame6 ~= nil then self.frame6:destroy(); self.frame6 = nil; end;
        if self.btnNovoflwMagicRecordList7 ~= nil then self.btnNovoflwMagicRecordList7:destroy(); self.btnNovoflwMagicRecordList7 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edtUpperGridCampo9 ~= nil then self.edtUpperGridCampo9:destroy(); self.edtUpperGridCampo9 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.historiaFancy ~= nil then self.historiaFancy:destroy(); self.historiaFancy = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.labProfpercepcao ~= nil then self.labProfpercepcao:destroy(); self.labProfpercepcao = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.layPrepValorLab ~= nil then self.layPrepValorLab:destroy(); self.layPrepValorLab = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.GridCampoSolido1 ~= nil then self.GridCampoSolido1:destroy(); self.GridCampoSolido1 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.labProfpersuasao ~= nil then self.labProfpersuasao:destroy(); self.labProfpersuasao = nil; end;
        if self.layBottomflwMagicRecordList5 ~= nil then self.layBottomflwMagicRecordList5:destroy(); self.layBottomflwMagicRecordList5 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.rclflwMagicRecordList10 ~= nil then self.rclflwMagicRecordList10:destroy(); self.rclflwMagicRecordList10 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.popupEditAtaqueBonus ~= nil then self.popupEditAtaqueBonus:destroy(); self.popupEditAtaqueBonus = nil; end;
        if self.panupperGridMagicBox7 ~= nil then self.panupperGridMagicBox7:destroy(); self.panupperGridMagicBox7 = nil; end;
        if self.rclflwMagicRecordList6 ~= nil then self.rclflwMagicRecordList6:destroy(); self.rclflwMagicRecordList6 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.popupEditAtaqueAtrib ~= nil then self.popupEditAtaqueAtrib:destroy(); self.popupEditAtaqueAtrib = nil; end;
        if self.anotacoesFancy ~= nil then self.anotacoesFancy:destroy(); self.anotacoesFancy = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.labupperGridMagicBox2 ~= nil then self.labupperGridMagicBox2:destroy(); self.labupperGridMagicBox2 = nil; end;
        if self.rclflwMagicRecordList1 ~= nil then self.rclflwMagicRecordList1:destroy(); self.rclflwMagicRecordList1 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.layEquipAttackLeft ~= nil then self.layEquipAttackLeft:destroy(); self.layEquipAttackLeft = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.panupperGridMagicBox5 ~= nil then self.panupperGridMagicBox5:destroy(); self.panupperGridMagicBox5 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.cbxGridCampoSolido7 ~= nil then self.cbxGridCampoSolido7:destroy(); self.cbxGridCampoSolido7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.GridCampoSolido2 ~= nil then self.GridCampoSolido2:destroy(); self.GridCampoSolido2 = nil; end;
        if self.panupperGridMagicBox2 ~= nil then self.panupperGridMagicBox2:destroy(); self.panupperGridMagicBox2 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.flowLayout41 ~= nil then self.flowLayout41:destroy(); self.flowLayout41 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclEquipsDefense ~= nil then self.rclEquipsDefense:destroy(); self.rclEquipsDefense = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.GridCampoSolido6 ~= nil then self.GridCampoSolido6:destroy(); self.GridCampoSolido6 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.labUpperGridCampo8 ~= nil then self.labUpperGridCampo8:destroy(); self.labUpperGridCampo8 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.upperGridMagicBox7 ~= nil then self.upperGridMagicBox7:destroy(); self.upperGridMagicBox7 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.btnEquipDefenseNew ~= nil then self.btnEquipDefenseNew:destroy(); self.btnEquipDefenseNew = nil; end;
        if self.layBottomflwMagicRecordList7 ~= nil then self.layBottomflwMagicRecordList7:destroy(); self.layBottomflwMagicRecordList7 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.fraMagiasLayout ~= nil then self.fraMagiasLayout:destroy(); self.fraMagiasLayout = nil; end;
        if self.edtUpperGridCampo11 ~= nil then self.edtUpperGridCampo11:destroy(); self.edtUpperGridCampo11 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.popupEditDuracaoUnidade ~= nil then self.popupEditDuracaoUnidade:destroy(); self.popupEditDuracaoUnidade = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.labEquipDefense ~= nil then self.labEquipDefense:destroy(); self.labEquipDefense = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.rclContadores ~= nil then self.rclContadores:destroy(); self.rclContadores = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.btnNovoflwMagicRecordList4 ~= nil then self.btnNovoflwMagicRecordList4:destroy(); self.btnNovoflwMagicRecordList4 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.prtFaccao ~= nil then self.prtFaccao:destroy(); self.prtFaccao = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.labNome1 ~= nil then self.labNome1:destroy(); self.labNome1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.GridCampoSolido3 ~= nil then self.GridCampoSolido3:destroy(); self.GridCampoSolido3 = nil; end;
        if self.labGridCampoSolido4 ~= nil then self.labGridCampoSolido4:destroy(); self.labGridCampoSolido4 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.popupEditAlcanceLongo ~= nil then self.popupEditAlcanceLongo:destroy(); self.popupEditAlcanceLongo = nil; end;
        if self.btnNovoflwMagicRecordList2 ~= nil then self.btnNovoflwMagicRecordList2:destroy(); self.btnNovoflwMagicRecordList2 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.layBottomflwMagicRecordList10 ~= nil then self.layBottomflwMagicRecordList10:destroy(); self.layBottomflwMagicRecordList10 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.tcPopupEdit ~= nil then self.tcPopupEdit:destroy(); self.tcPopupEdit = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.popupEditContadorUsosTotal ~= nil then self.popupEditContadorUsosTotal:destroy(); self.popupEditContadorUsosTotal = nil; end;
        if self.historiaMerda ~= nil then self.historiaMerda:destroy(); self.historiaMerda = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.cbProfcarisma ~= nil then self.cbProfcarisma:destroy(); self.cbProfcarisma = nil; end;
        if self.btnNovoflwMagicRecordList8 ~= nil then self.btnNovoflwMagicRecordList8:destroy(); self.btnNovoflwMagicRecordList8 = nil; end;
        if self.flwMagicRecordList10 ~= nil then self.flwMagicRecordList10:destroy(); self.flwMagicRecordList10 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.labProfcarisma ~= nil then self.labProfcarisma:destroy(); self.labProfcarisma = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.UpperGridCampo9 ~= nil then self.UpperGridCampo9:destroy(); self.UpperGridCampo9 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.panupperGridMagicBox6 ~= nil then self.panupperGridMagicBox6:destroy(); self.panupperGridMagicBox6 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edtupperGridMagicEditBox1 ~= nil then self.edtupperGridMagicEditBox1:destroy(); self.edtupperGridMagicEditBox1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.anotacoesMerda ~= nil then self.anotacoesMerda:destroy(); self.anotacoesMerda = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDnD5()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDnD5();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDnD5 = {
    newEditor = newfrmDnD5, 
    new = newfrmDnD5, 
    name = "frmDnD5", 
    dataType = "br.com.rrpg.DnD5_S3", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "D&D 5e", 
    description=""};

frmDnD5 = _frmDnD5;
Firecast.registrarForm(_frmDnD5);
Firecast.registrarDataType(_frmDnD5);

return _frmDnD5;
