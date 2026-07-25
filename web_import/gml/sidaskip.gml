<?xml version="1.0" encoding="iso-8859-1"?>

<!DOCTYPE	Body				SYSTEM "scene.dtd"
[]>

<Body>

<!-- Flags -->
<!-- Flags for scene 2 -->

<!-- Talked with kjaftekelling or not -->
<!-- 0 = not taken -->
<!-- 1 = taken -->
<ConditionFlag name="f_TalkedWithWoman"/>
<SetFlagQuantum name="q_TalkedWithWoman1" flag="f_TalkedWithWoman" value="1"/>

<!-- Money Given to Worker or not. -->
<!-- 0 = not taken -->
<!-- 1 = taken -->
<ConditionFlag name="f_MoneyGiven2Worker"/>
<SetFlagQuantum name="q_MoneyGiven2Worker1" flag="f_MoneyGiven2Worker" value="1"/>

<!-- Number of sacred items taken in church -->
<ConditionFlag name="f_SacredItemsTaken"/>
<IncrementFlagQuantum name="q_SacredItemTaken" flag="f_SacredItemsTaken"/>
<DecrementFlagQuantum name="q_SacredItemInBag" flag="f_SacredItemsTaken"/>
<SetFlagQuantum name="q_SacredItemNull" flag="f_SacredItemsTaken" value="0"/>

<!-- Þetta þarf til þess að athuga hversu margir hlutir eru í pokanum þegar hann er látinn upp í hilluna -->
<ConditionFlag name="f_NumberSacredItemsInBag"/>
<IncrementFlagQuantum name="q_NumberSacredItemsInBag" flag="f_NumberSacredItemsInBag"/>
<SetFlagQuantum name="q_SacredItemsInBagNull" flag="f_NumberSacredItemsInBag" value="0"/>

<ConditionFlag name="f_SilfurInInventory"/>
<ConditionFlag name="f_KaleikurInInventory"/>
<ConditionFlag name="f_MariumyndInInventory"/>
<ConditionFlag name="f_EngillInInventory"/>
<SetFlagQuantum name="q_SilfurInInventory" flag="f_SilfurInInventory" value="1"/>
<SetFlagQuantum name="q_MariumyndInInventory" flag="f_MariumyndInInventory" value="1"/>
<SetFlagQuantum name="q_EngillInInventory" flag="f_EngillInInventory" value="1"/>
<SetFlagQuantum name="q_KaleikurInInventory" flag="f_KaleikurInInventory" value="1"/>
<SetFlagQuantum name="q_SilfurFromInventory" flag="f_SilfurInInventory" value="0"/>
<SetFlagQuantum name="q_MariumyndFromInventory" flag="f_MariumyndInInventory" value="0"/>
<SetFlagQuantum name="q_EngillFromInventory" flag="f_EngillInInventory" value="0"/>
<SetFlagQuantum name="q_KaleikurFromInventory" flag="f_KaleikurInInventory" value="0"/>


<!-- Poki placed on shelf in bedroom -->
<ConditionFlag name="f_PokiPlacedOnSkuffa"/>
<SetFlagQuantum name="q_PokiPlacedOnSkuffa1" flag="f_PokiPlacedOnSkuffa" value="1"/>

<ConditionFlag name="f_ShowLykill"/>
<SetFlagQuantum name="q_ShowLykill1" flag="f_ShowLykill" value="1"/>

<ConditionFlag name="f_HideLykill"/>
<SetFlagQuantum name="q_HideLykill1" flag="f_HideLykill" value="1"/>

<ConditionFlag name="f_SkuffaLocked"/>
<SetFlagQuantum name="q_SkuffaLocked1" flag="f_SkuffaLocked" value="1"/>
<SetFlagQuantum name="q_SkuffaLocked0" flag="f_SkuffaLocked" value="0"/>

<ConditionFlag name="f_Puki"/>
<SetFlagQuantum name="q_Puki1" flag="f_Puki" value="1"/>

<ConditionFlag name="f_Poki"/>
<SetFlagQuantum name="q_Poki1" flag="f_Poki" value="1"/>

<ConditionFlag name="f_Random6"/>
<RandomSetFlagQuantum name="q_Randomize6" flag="f_Random6" low="0" high="5"/>

<ConditionFlag name="f_Random9"/>
<RandomSetFlagQuantum name="q_Randomize9" flag="f_Random9" low="0" high="8"/>

<ConditionFlag name="f_Random13"/>
<RandomSetFlagQuantum name="q_Randomize13" flag="f_Random13" low="0" high="12"/>

<ConditionFlag name="f_Bryti"/>
<IncrementFlagQuantum name="q_BrytiInc" flag="f_Bryti"/>
<SetFlagQuantum name="q_Bryti5" flag="f_Bryti" value="5"/>


<ConditionFlag name="f_Bryti2"/>
<IncrementFlagQuantum name="q_Bryti2Inc" flag="f_Bryti2"/>

<ConditionFlag name="f_VinnumadurTalk"/>
<SetFlagQuantum name="q_VinnumadurTalk1" flag="f_VinnumadurTalk" value="1"/>

<ConditionFlag name="f_KristoferTalk"/>
<SetFlagQuantum name="q_KristoferTalk1" flag="f_KristoferTalk" value="1"/>
<SetFlagQuantum name="q_KristoferTalk2" flag="f_KristoferTalk" value="2"/>

<ConditionFlag name="f_Money"/>
<SetFlagQuantum name="q_MoneyOK" flag="f_Money" value="1"/>

<ConditionFlag name="f_Zero"/>

<ConditionFlag name="f_Kopavogur"/>
<IncrementFlagQuantum name="q_KopavogurInc" flag="f_Kopavogur"/>

<ConditionFlag name="f_Vinnumadur"/>
<SetFlagQuantum name="q_Vinnumadur1" flag="f_Vinnumadur" value="1"/>

<ConditionFlag name="f_Galdrabok"/>
<SetFlagQuantum name="q_Galdrabok1" flag="f_Galdrabok" value="1"/>

<ConditionFlag name="f_Testament"/>
<SetFlagQuantum name="q_Testament1" flag="f_Testament" value="1"/>

<ConditionFlag name="f_Kopavogur2"/>
<SetFlagQuantum name="q_ToKopavogur1" flag="f_Kopavogur2" value="1"/>
<SetFlagQuantum name="q_ToKopavogur0" flag="f_Kopavogur2" value="0"/>

<ConditionFlag name="f_Kirkja4"/>
<SetFlagQuantum name="q_ToKirkjaOk" flag="f_Kirkja4" value="1"/>
<SetFlagQuantum name="q_ToKirkjaNo" flag="f_Kirkja4" value="0"/>

<ConditionFlag name="f_Thula"/>
<SetFlagQuantum name="q_Thula1" flag="f_Thula" value="1"/>

<ConditionFlag name="f_CurrentScene"/>
<SetFlagQuantum name="q_CurrentHjaBryta" flag="f_CurrentScene" value="9"/>
<SetFlagQuantum name="q_CurrentFyrirUtan" flag="f_CurrentScene" value="1"/>
<SetFlagQuantum name="q_CurrentKirkja" flag="f_CurrentScene" value="2"/>
<SetFlagQuantum name="q_CurrentSkrifstofa" flag="f_CurrentScene" value="3"/>
<SetFlagQuantum name="q_CurrentSvefnherbergi" flag="f_CurrentScene" value="4"/>
<SetFlagQuantum name="q_CurrentKopavogur" flag="f_CurrentScene" value="5"/>
<SetFlagQuantum name="q_CurrentAskur" flag="f_CurrentScene" value="6"/>
<SetFlagQuantum name="q_CurrentGaldrabok" flag="f_CurrentScene" value="7"/>
<SetFlagQuantum name="q_CurrentSalmabok" flag="f_CurrentScene" value="8"/>



<Polygon name="p_All">
	<Point x="0" y="0"/>
	<Point x="800" y="0"/>
	<Point x="800" y="600"/>
	<Point x="0" y="600"/>
</Polygon>

<!-- Terrains and scenes -->
<!-- Inventory for scene 3 -->
<Scene name="s_Inventory"/>

<SimplePseudo3DTerrain name="t_InventoryBack" scene="s_Inventory" polygon="p_All" zmin="-7" zmax="0"/>
<Inventory name="t_Inventory" scene="s_Inventory" polygon="p_All" zmin="1" zmax="1500"/>

<StaticActorFace name="af_BigInventory" file="\sidaskiA\Graphic\inventoA" prepare="true"/>
<StaticActor name="a_BigInventory" terrain="t_InventoryBack" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_BigInventory"/>
</StaticActor>
<PrepareQuantum	name="qp_Inventory" object="af_BigInventory" prepare="true"/>
<PrepareQuantum	name="qu_Inventory" object="af_BigInventory" prepare="false"/>

<StaticActorFace name="af_KollurI" file="\SidaskiA\Graphic\hlutir\kolluri" prepare="true"/>
<StaticActorFace name="af_TvinniAskurI" file="\SidaskiA\Graphic\hlutir\tvinnii" prepare="true"/>
<StaticActorFace name="af_TolurAskurI" file="\SidaskiA\Graphic\hlutir\toluri" prepare="true"/>
<StaticActorFace name="af_SkaeriAskurI" file="\SidaskiA\Graphic\hlutir\skarii" prepare="true"/>
<StaticActorFace name="af_PeningarAskurI" file="\SidaskiA\Graphic\hlutir\peningaA" prepare="true"/>
<StaticActorFace name="af_LykillI" file="\SidaskiA\Graphic\hlutir\lykilli" prepare="true"/>
<StaticActorFace name="af_GaldrabokI" file="\SidaskiA\Graphic\hlutir\galdrabA" prepare="true"/>
<StaticActorFace name="af_BladsidaI" file="\SidaskiA\Graphic\hlutir\bladsidA" prepare="true"/>
<StaticActorFace name="af_SalmabokI" file="\SidaskiA\Graphic\hlutir\testameA" prepare="true"/>
<StaticActorFace name="af_SilfurI" file="\SidaskiA\Graphic\hlutir\silfuri" prepare="true"/>
<StaticActorFace name="af_EngillI" file="\SidaskiA\Graphic\hlutir\engilli" prepare="true"/>
<StaticActorFace name="af_KaleikurI" file="\SidaskiA\Graphic\hlutir\kaleikuA" prepare="true"/>
<StaticActorFace name="af_SalmabokGaldurI" file="\SidaskiA\Graphic\hlutir\testameB" prepare="true"/>
<StaticActorFace name="af_MariumyndI" file="\SidaskiA\Graphic\hlutir\mariumyA" prepare="true"/>
<StaticActorFace name="af_PokiHalfFullurI" file="\SidaskiA\Graphic\hlutir\pokihalA" prepare="true"/>
<StaticActorFace name="af_PokiI" file="\SidaskiA\Graphic\hlutir\pokii" prepare="true"/>
<StaticActorFace name="af_PokiFullurI" file="\SidaskiA\Graphic\hlutir\pokifulA" prepare="true"/>
<StaticActorFace name="af_SendibrefI" file="\SidaskiA\Graphic\hlutir\sendibrA" prepare="true"/>

<!-- Black screen -->
<Scene name="s_Black"/>

<SimplePseudo3DTerrain name="t_Black" scene="s_Black" polygon="p_All" zmin="-7" zmax="0"/>

<PauseQuantum name="q_4sec" time="2500"/>

<Scene name="s_HjaBryta"/>

<Polygon name="p_HjaBrytal">
	<Point x="-1" y="577"/>
	<Point x="293" y="396"/>
	<Point x="1000" y="393"/>
	<Point x="1000" y="465"/>
	<Point x="465" y="465"/>
	<Point x="320" y="600"/>
	<Point x="-1" y="600"/>
</Polygon>

<SimplePseudo3DTerrain name="t_HjaBryta" scene="s_HjaBryta" polygon="p_All"	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_HjaBrytal" scene="s_HjaBryta" polygon="p_HjaBrytal" zmin="0" zmax="800" defaultscaling="0.85" scaling2="1.0" scanline1="425" scanline2="570"/>

<!-- Background for HjaBryta -->
<StaticActorFace name="af_HjaBryta" file="\SidaskiA\Graphic\hjabryta"/>
<StaticActor name="a_HjaBryta" terrain="t_HjaBryta" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_HjaBryta"/>
</StaticActor>
<!-- Prepare HjaBryta-->
<PrepareQuantum name="qp_HjaBryta0" object="af_HjaBryta" prepare="true"/>
<PrepareQuantum name="qu_HjaBryta0" object="af_HjaBryta" prepare="false"/>

<!-- Kertalogi-->
<CelledAnimated2DActorFace name="af_Logi1" repeat="-1" file="\SidaskiA\AnimatiA\logi" count="3" speed="450" random="true"/>
<StaticActor name="a_Logi1" terrain="t_HjaBryta" x="462" y="17" z="0" state="none">
	<State name="stop" face="af_Logi1"/>
</StaticActor>
<StateQuantum name="q_StartLogi" actor="a_Logi1" state="stop" wait="false"/>
<StateQuantum name="q_StopLogi" actor="a_Logi1" state="none" wait="false"/>
<PrepareQuantum name="qu_HjaBryta1" object="af_Logi1" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta1" object="af_Logi1" prepare="true"/>

<Pseudo3DCollisionBox name="cb_HjaBryta2FyrirUtan" x="15" y="68" z="10"/>
<StaticActor name="a_HjaBryta2FyrirUtan" terrain="t_HjaBrytal" x="784" y="429" z="1" state="stop"
		collision="ac_HjaBryta2FyrirUtan">
	<State name="stop" collisionbox="cb_HjaBryta2FyrirUtan"/>
</StaticActor>
<MoveActorQuantum name="qh_HjaBryta2FyrirUtan" actor="a_HjaBryta2FyrirUtan"/>
<MoveActorQuantum name="qs_HjaBryta2FyrirUtan" actor="a_HjaBryta2FyrirUtan" terrain="t_HjaBrytal"/>

<StaticActorFace name="af_Bord" file="\SidaskiA\Graphic\bord" />
<StaticActor name="a_Bord" terrain="t_HjaBrytal" x="317" y="542" z="200" state="stop">
	<State name="stop" face="af_Bord"/>
</StaticActor>
<PrepareQuantum name="qu_HjaBryta2" object="af_Bord" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta2" object="af_Bord" prepare="true"/>

<StaticActorFace name="af_Kollur" file="\SidaskiA\Graphic\kollur"/>
<StaticActorFace name="af_KollurU" file="\SidaskiA\Graphic\hlutir\kollurU" prepare="true"/>
<Pseudo3DCollisionBox name="cb_Kollur" x="70" y="30" z="90"/>
<StaticActor name="a_Kollur" terrain="t_HjaBrytal" x="312" y="425" z="1" state="stop" save="true" random="true">
	<State name="stop" face="af_Kollur" collisionbox="cb_Kollur"/>
	<State name="taken" face="af_KollurI"/>
	<State name="use" face="af_KollurU"/>
</StaticActor>
<StateQuantum name="q_KollurTaken" actor="a_Kollur" state="taken"/>
<StateQuantum name="q_KollurStop" actor="a_Kollur" state="stop"/>
<PrepareQuantum name="qu_HjaBryta3" object="af_Kollur" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta3" object="af_Kollur" prepare="true"/>

<TransparentActorFace name="af_Hotspot" width="65" height="155"/>
<StaticActor name="a_Hotspot" terrain="t_HjaBrytal" x="747" y="830" z="600" state="stop">
	<State name="stop" face="af_Hotspot"/>
</StaticActor>

<TransparentActorFace name="af_Baekur2" width="140" height="63"/>
<StaticActor name="a_Baekur2" terrain="t_HjaBrytal" x="80" y="775" z="600" state="stop" random="true">
	<State name="stop" face="af_Baekur2"/>
</StaticActor>

<TransparentActorFace name="af_Kerti2" width="22" height="100"/>
<StaticActor name="a_Kerti2" terrain="t_HjaBrytal" x="463" y="41" z="0" state="stop" random="true">
	<State name="stop" face="af_Kerti2"/>
</StaticActor>

<TransparentActorFace name="af_AskurLitill" width="52" height="37"/>
<StaticActor name="a_AskurLitill" terrain="t_HjaBrytal" x="566" y="81" z="0" state="stop" random="true">
	<State name="stop" face="af_AskurLitill"/>
</StaticActor>

<TransparentActorFace name="af_Hilla1" width="183" height="65"/>
<StaticActor name="a_Hilla1" terrain="t_HjaBrytal" x="532" y="4" z="0" state="stop" random="true">
	<State name="stop" face="af_Hilla1"/>
</StaticActor>

<TransparentActorFace name="af_Askur2" width="46" height="27"/>
<StaticActor name="a_Askur2" terrain="t_HjaBrytal" x="623" y="11" z="0" state="stop" random="true">
	<State name="stop" face="af_Askur2"/>
</StaticActor>

<TransparentActorFace name="af_Skalar" width="22" height="27"/>
<StaticActor name="a_Skalar" terrain="t_HjaBrytal" x="632" y="90" z="0" state="stop" random="true">
	<State name="stop" face="af_Skalar"/>
</StaticActor>

<TransparentActorFace name="af_Skeid" width="27" height="6"/>
<StaticActor name="a_Skeid" terrain="t_HjaBrytal" x="659" y="113" z="0" state="stop" random="true">
	<State name="stop" face="af_Skeid"/>
</StaticActor>

<SimplePseudo3DTerrain name="t_Corners" scene="s_HjaBryta" polygon="p_All"
	zmin="800" zmax="2000" defaultscaling="1.0" scrolling="false"/>

<!-- State image in the corner -->
<StaticActorFace name="af_Moving" file="\Common\Graphic\moving" prepare="true"/>
<StaticActorFace name="af_Looking" file="\Common\Graphic\looking" prepare="true"/>
<StaticActorFace name="af_Taking" file="\Common\Graphic\taking" prepare="true"/>
<StaticActorFace name="af_Talking" file="\Common\Graphic\talking" prepare="true"/>
<StaticActorFace name="af_Freeze" file="\Common\Graphic\freeze" prepare="true"/>
<StaticActor name="a_States" terrain="t_Corners" x="0" y="20000" z="20000" state="freeze">
	<State name="moving" face="af_Moving"/>
	<State name="looking" face="af_Looking"/>
	<State name="taking" face="af_Taking"/>
	<State name="talking" face="af_Talking"/>
	<State name="freeze" face="af_Freeze"/>
</StaticActor>

<!-- Small inventory in the corner -->
<StaticActorFace name="af_SmallInventory" file="\Common\Graphic\inventoA" prepare="true"/>
<StaticActor name="a_SmallInventory" terrain="t_Corners" x="701" y="900" z="900" state="stop">
	<State name="stop" face="af_SmallInventory"/>
</StaticActor>

<ScrollingScene name="s_FyrirUtan" width="1600" height="600"/>

<Polygon name="p_FyrirUtan">
	<Point x="-1" y="425"/>
	<Point x="485" y="190"/>
	<Point x="1060" y="190"/>
	<Point x="1160" y="420"/>
	<Point x="1315" y="520"/>
	<Point x="1482" y="601"/>
	<Point x="290" y="601"/>
	<Point x="290" y="1300"/>
	<Point x="-1" y="1300"/>
</Polygon>

<SimplePseudo3DTerrain name="t_FyrirUtan" scene="s_FyrirUtan" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_FyrirUtanl" scene="s_FyrirUtan" polygon="p_FyrirUtan"
	zmin="0" zmax="800" defaultscaling="0.65" scaling2="0.85" scanline1="290" scanline2="580"/>

<!-- Background for FyrirUtan -->
<StaticActorFace name="af_FyrirUtan1" file="\SidaskiA\Graphic\fyrirutA" prepare="false"/>
<StaticActor name="a_FyrirUtan1" terrain="t_FyrirUtan" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_FyrirUtan1"/>
</StaticActor>
<StaticActorFace name="af_FyrirUtan2" file="\SidaskiA\Graphic\fyrirutB" prepare="false"/>
<StaticActor name="a_FyrirUtan2" terrain="t_FyrirUtan" x="800" y="0" z="0" state="stop">
	<State name="stop" face="af_FyrirUtan2"/>
</StaticActor>
<!-- Prepare FyrirUtan -->
<PrepareQuantum name="qp_FyrirUtan0" object="af_FyrirUtan1" prepare="true"/>
<PrepareQuantum name="qu_FyrirUtan0" object="af_FyrirUtan1" prepare="false"/>
<PrepareQuantum name="qp_FyrirUtan01" object="af_FyrirUtan2" prepare="true"/>
<PrepareQuantum name="qu_FyrirUtan01" object="af_FyrirUtan2" prepare="false"/>

<TransparentActorFace name="af_ToHjaBryta" width="90" height="220"/>
<StaticActor name="a_FyrirUtan2HjaBrytaTT" terrain="t_FyrirUtanl" x="60" y="850" z="700" state="stop">
	<State name="stop" face="af_ToHjaBryta"/>
</StaticActor>

<Pseudo3DCollisionBox name="cb_Special" x="4" y="376" z="5"/>
<StaticActor name="a_Special" terrain="t_FyrirUtanl" x="568" y="385" z="1" state="stop"	collision="ac_Special" save="true">
	<State name="stop" collisionbox="cb_Special"/>
</StaticActor>
<MoveActorQuantum name="qh_Special" actor="a_Special"/>

<Pseudo3DCollisionBox name="cb_Special3" x="4" y="390" z="5"/>
<StaticActor name="a_Special3" x="992" y="400" z="1" state="stop" collision="ac_Special3" save="true">
	<State name="stop" collisionbox="cb_Special3"/>
</StaticActor>
<MoveActorQuantum name="qs_Special3" actor="a_Special3" terrain="t_FyrirUtanl"/>
<MoveActorQuantum name="qh_Special3" actor="a_Special3"/>

<!-- "Hotspot" from FyrirUtan to Kirkja -->
<TransparentActorFace name="af_ToKirkja" width="127" height="173"/>
<StaticActor name="a_FyrirUtan2KirkjaTT" terrain="t_FyrirUtanl" x="645" y="800" z="800" state="stop">
	<State name="stop" face="af_ToKirkja"/>
</StaticActor>

<!-- "Hotspot" from FyrirUtan to Skrifstofa -->
<TransparentActorFace name="af_ToSkrifstofa" width="123" height="293"/>
<StaticActor name="a_FyrirUtan2SkrifstofaTT" terrain="t_FyrirUtanl" x="1400" y="880" z="600" state="stop">
	<State name="stop" face="af_ToSkrifstofa"/>
</StaticActor>

<!-- "Hotspot" from FyrirUtan to Kopavogur -->
<Pseudo3DCollisionBox name="cb_FyrirUtan2Kopavogur" x="270" y="35" z="4"/>
<TransparentActorFace name="af_ToKopavogur" width="277" height="45"/>
<StaticActor name="a_FyrirUtan2Kopavogur" terrain="t_FyrirUtanl" x="140" y="580" z="1" state="stop"
		collision="ac_FyrirUtan2Kopavogur">
	<State name="stop" collisionbox="cb_FyrirUtan2Kopavogur"/>
</StaticActor>
<StaticActor name="a_FyrirUtan2KopavogurTT" terrain="t_FyrirUtanl" x="1" y="855" z="300" state="stop">
	<State name="stop" face="af_ToKopavogur"/>
</StaticActor>
<MoveActorQuantum name="qh_FyrirUtan2Kopavogur" actor="a_FyrirUtan2Kopavogur"/>
<MoveActorQuantum name="qs_FyrirUtan2Kopavogur" actor="a_FyrirUtan2Kopavogur" terrain="t_FyrirUtanl"/>

<!-- Skilti -->
<StaticActorFace name="af_Skilti" file="\SidaskiA\Graphic\skilti" prepare="false"/>
<Pseudo3DCollisionBox name="cb_Skilti" x="20" y="20" z="115"/>
<StaticActor name="a_Skilti" terrain="t_FyrirUtanl" x="319" y="589" z="1" state="stop" random="true">
	<State name="stop" face="af_Skilti" collisionbox="cb_Skilti"/>
</StaticActor>
<StateQuantum name="q_SkiltiStop" actor="a_Skilti" state="stop"/>
<PrepareQuantum	name="qp_FyrirUtan6" object="af_Skilti" prepare="true"/>
<PrepareQuantum	name="qu_FyrirUtan6" object="af_Skilti" prepare="false"/>

<TransparentActorFace name="af_Gluggi1" width="33" height="27"/>
<StaticActor name="a_Gluggi1" terrain="t_FyrirUtanl" x="88" y="73" z="0" state="stop" random="true">
	<State name="stop" face="af_Gluggi1"/>
</StaticActor>

<TransparentActorFace name="af_Gluggi2" width="52" height="78"/>
<StaticActor name="a_Gluggi2" terrain="t_FyrirUtanl" x="1220" y="265" z="0" state="stop" random="true">
	<State name="stop" face="af_Gluggi2"/>
</StaticActor>

<TransparentActorFace name="af_Gluggi3" width="50" height="65"/>
<StaticActor name="a_Gluggi3" terrain="t_FyrirUtanl" x="1420" y="148" z="0" state="stop" random="true">
	<State name="stop" face="af_Gluggi3"/>
</StaticActor>

<TransparentActorFace name="af_Runni" width="55" height="94"/>
<StaticActor name="a_Runni" terrain="t_FyrirUtanl" x="233" y="199" z="0" state="stop" random="true">
	<State name="stop" face="af_Runni"/>
</StaticActor>

<ScrollingScene name="s_Kirkja" width="1200" height="600"/>

<Polygon name="p_Kirkja">
	<Point x="-1" y="-1"/>
	<Point x="-1" y="601"/>
	<Point x="1200" y="601"/>
	<Point x="1200" y="-1"/>
</Polygon>

<Polygon name="p_Kirkjal">
	<Point x="-1" y="542"/>
	<Point x="415" y="495"/>
	<Point x="684" y="540"/>
	<Point x="880" y="540"/>
	<Point x="1050" y="601"/>
	<Point x="215" y="601"/>
	<Point x="215" y="1111"/>
	<Point x="-1" y="1111"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Kirkja" scene="s_Kirkja" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Kirkjal" scene="s_Kirkja" polygon="p_Kirkjal"
	zmin="0" zmax="800" defaultscaling="1.0" scaling2="1.0" scanline1="490" scanline2="590"/>

<!-- Background for Kirkja -->
<StaticActorFace name="af_Kirkja1" file="\SidaskiA\Graphic\kirkja1" prepare="false"/>
<StaticActor name="a_Kirkja1" terrain="t_Kirkja" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Kirkja1"/>
</StaticActor>
<StaticActorFace name="af_Kirkja2" file="\SidaskiA\Graphic\kirkja2" prepare="false"/>
<StaticActor name="a_Kirkja2" terrain="t_Kirkja" x="800" y="0" z="0" state="stop">
	<State name="stop" face="af_Kirkja2"/>
</StaticActor>
<!-- Prepare Kirkja -->
<PrepareQuantum name="qp_Kirkja0" object="af_Kirkja1" prepare="true"/>
<PrepareQuantum name="qu_Kirkja0" object="af_Kirkja1" prepare="false"/>
<PrepareQuantum name="qp_Kirkja01" object="af_Kirkja2" prepare="true"/>
<PrepareQuantum name="qu_Kirkja01" object="af_Kirkja2" prepare="false"/>

<Pseudo3DCollisionBox name="cb_Kirkja2FyrirUtan" x="20" y="60" z="10"/>
<TransparentActorFace name="af_ToFyrirUtanFromKirkja" width="150" height="100"/>
<StaticActor name="a_Kirkja2FyrirUtan" terrain="t_Kirkjal" x="110" y="564" z="10" state="stop"
		collision="ac_Kirkja2FyrirUtan">
	<State name="stop" collisionbox="cb_Kirkja2FyrirUtan"/>
</StaticActor>
<MoveActorQuantum name="qh_Kirkja2FyrirUtan" actor="a_Kirkja2FyrirUtan"/>
<MoveActorQuantum name="qs_Kirkja2FyrirUtan" actor="a_Kirkja2FyrirUtan" terrain="t_Kirkjal"/>
<StaticActor name="a_Kirkja2FyrirUtanTT" terrain="t_Kirkjal" x="0" y="1010" z="500" state="stop">
	<State name="stop" face="af_ToFyrirUtanFromKirkja"/>
</StaticActor>

<StaticActorFace name="af_Silfur" file="\SidaskiA\Graphic\hlutir\silfur" prepare="false"/>
<StaticActorFace name="af_SilfurU" file="\SidaskiA\Graphic\hlutir\silfuru" prepare="true"/>
<StaticActor name="a_Silfur" terrain="t_Kirkjal" x="291" y="344" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Silfur"/>
	<State name="taken" face="af_SilfurI"/>
	<State name="use" face="af_SilfurU"/>
</StaticActor>
<StateQuantum name="q_SilfurTaken" actor="a_Silfur" state="taken"/>
<StateQuantum name="q_SilfurStop" actor="a_Silfur" state="stop"/>
<MoveActorQuantum name="qh_Silfur" actor="a_Silfur"/>
<MoveActorQuantum name="q_MoveSilfur2Inventory" actor="a_Silfur" terrain="t_Inventory"/>
<MoveActorQuantum name="qs_Silfur" actor="a_Silfur" terrain="t_Kirkjal">
	<Location x="291" y="344" z="0"/> </MoveActorQuantum>
<PrepareQuantum	name="qp_Kirkja1" object="af_Silfur" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja1" object="af_Silfur" prepare="false"/>

<StaticActorFace name="af_Engill" file="\SidaskiA\Graphic\hlutir\engill" prepare="false"/>
<StaticActorFace name="af_EngillU" file="\SidaskiA\Graphic\hlutir\engillu" prepare="true"/>
<StaticActor name="a_Engill" terrain="t_Kirkjal" x="101" y="273" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Engill"/>
	<State name="taken" face="af_EngillI" />
	<State name="use" face="af_EngillU" />
</StaticActor>
<StateQuantum name="q_EngillTaken" actor="a_Engill" state="taken"/>
<StateQuantum name="q_EngillStop" actor="a_Engill" state="stop"/>
<MoveActorQuantum name="qh_Engill" actor="a_Engill"/>
<MoveActorQuantum name="q_MoveEngill2Inventory" actor="a_Engill" terrain="t_Inventory"/>
<MoveActorQuantum name="qs_Engill" actor="a_Engill" terrain="t_Kirkjal">
	<Location x="101" y="273" z="0"/> </MoveActorQuantum>
<PrepareQuantum	name="qp_Kirkja2" object="af_Engill" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja2" object="af_Engill" prepare="false"/>

<StaticActorFace name="af_Kaleikur" file="\SidaskiA\Graphic\hlutir\kaleikur" prepare="false"/>
<StaticActorFace name="af_KaleikurU" file="\SidaskiA\Graphic\hlutir\kaleikuB" prepare="true"/>
<StaticActor name="a_Kaleikur" terrain="t_Kirkjal" x="251" y="401" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Kaleikur"/>
	<State name="taken" face="af_KaleikurI" />
	<State name="use" face="af_KaleikurU" />
</StaticActor>
<StateQuantum name="q_KaleikurTaken" actor="a_Kaleikur" state="taken"/>
<StateQuantum name="q_KaleikurStop" actor="a_Kaleikur" state="stop"/>
<MoveActorQuantum name="qh_Kaleikur" actor="a_Kaleikur"/>
<MoveActorQuantum name="q_MoveKaleikur2Inventory" actor="a_Kaleikur" terrain="t_Inventory"/>
<MoveActorQuantum name="qs_Kaleikur" actor="a_Kaleikur" terrain="t_Kirkjal">
	<Location x="251" y="401" z="0"/> </MoveActorQuantum>
<PrepareQuantum	name="qp_Kirkja3" object="af_Kaleikur" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja3" object="af_Kaleikur" prepare="false"/>

<!-- Sálmabók á borði -->
<StaticActorFace name="af_Salmabok" file="\SidaskiA\Graphic\hlutir\testameC" prepare="false"/>
<StaticActorFace name="af_SalmabokU" file="\SidaskiA\Graphic\hlutir\testameD" prepare="true"/>
<StaticActor name="a_Salmabok" terrain="t_Kirkjal" x="337" y="414" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Salmabok"/>
	<State name="taken" face="af_SalmabokI"/>
	<State name="use" face="af_SalmabokU"/>
</StaticActor>
<StateQuantum name="q_SalmabokTaken" actor="a_Salmabok" state="taken"/>
<MoveActorQuantum name="qh_Salmabok" actor="a_Salmabok"/>
<MoveActorQuantum name="q_MoveSalmabok2Inventory" actor="a_Salmabok" terrain="t_Inventory"/>
<PrepareQuantum	name="qp_Kirkja4" object="af_Salmabok" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja4" object="af_Salmabok" prepare="false"/>

<!-- Sálmabók á borði -->
<StaticActorFace name="af_SalmabokGaldurU" file="\SidaskiA\Graphic\hlutir\testameE" prepare="true"/>
<StaticActor name="a_SalmabokGaldur" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_SalmabokGaldurI"/>
	<State name="use" face="af_SalmabokGaldurU"/>
</StaticActor>
<MoveActorQuantum name="qs_SalmabokGaldur" actor="a_SalmabokGaldur" terrain="t_Inventory"/>

<!-- Sálmabók large -->
<StaticActorFace name="af_SalmabokLarge" file="\SidaskiA\Graphic\nyjatesA" prepare="false"/>
<StaticActorFace name="af_SalmabokLargeGaldur" file="\SidaskiA\Graphic\nyjatesB" prepare="false"/>
<StaticActor name="a_SalmabokLarge" x="0" y="950" z="950" state="stop" save="true">
	<State name="stop" face="af_SalmabokLarge"/>
	<State name="stop2" face="af_SalmabokLargeGaldur"/>
</StaticActor>
<StateQuantum name="q_GaldurISalmabok" actor="a_SalmabokLarge" state="stop2"/>
<PrepareQuantum	name="qp_SalmabokLargeGaldur" object="af_SalmabokLargeGaldur" prepare="true"/>
<PrepareQuantum	name="qu_SalmabokLargeGaldur" object="af_SalmabokLargeGaldur" prepare="false"/>
<PrepareQuantum	name="qp_SalmabokLarge" object="af_SalmabokLarge" prepare="true"/>
<PrepareQuantum	name="qu_SalmabokLarge" object="af_SalmabokLarge" prepare="false"/>
<MoveActorQuantum name="q_HideSalmabokLarge" actor="a_SalmabokLarge"/>
<MoveActorQuantum name="q_ShowSalmabokLargeInv" actor="a_SalmabokLarge" terrain="t_InventoryBack"/>
<MoveActorQuantum name="q_ShowSalmabokLargeKirk" actor="a_SalmabokLarge" terrain="t_Kirkjal"/>

<StaticActorFace name="af_Mariumynd" file="\SidaskiA\Graphic\hlutir\mariumyB" prepare="false"/>
<StaticActorFace name="af_MariumyndU" file="\SidaskiA\Graphic\hlutir\mariumyC" prepare="true"/>
<StaticActor name="a_Mariumynd" terrain="t_Kirkjal" x="975" y="246" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Mariumynd"/>
	<State name="taken" face="af_MariumyndI" />
	<State name="use" face="af_MariumyndU" />
</StaticActor>
<StateQuantum name="q_MariumyndTaken" actor="a_Mariumynd" state="taken"/>
<StateQuantum name="q_MariumyndStop" actor="a_Mariumynd" state="stop"/>
<MoveActorQuantum name="qh_Mariumynd" actor="a_Mariumynd"/>
<MoveActorQuantum name="q_MoveMariumynd2Inventory" actor="a_Mariumynd" terrain="t_Inventory"/>
<MoveActorQuantum name="qs_Mariumynd" actor="a_Mariumynd" terrain="t_Kirkjal">
	<Location x="975" y="246" z="0"/> </MoveActorQuantum>
<PrepareQuantum	name="qp_Kirkja5" object="af_Mariumynd" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja5" object="af_Mariumynd" prepare="false"/>

<TransparentActorFace name="af_Tafla" width="52" height="71"/>
<StaticActor name="a_Tafla" terrain="t_Kirkjal" x="725" y="828" z="600" state="stop" random="true">
	<State name="stop" face="af_Tafla"/>
</StaticActor>

<TransparentActorFace name="af_Men" width="16" height="91"/>
<StaticActor name="a_Men" terrain="t_Kirkjal" x="768" y="803" z="400" state="stop" random="true">
	<State name="stop" face="af_Men"/>
</StaticActor>

<Scene name="s_Skrifstofa"/>

<Polygon name="p_Skrifstofa">
	<Point x="-1" y="503"/>
	<Point x="237" y="503"/>
	<Point x="353" y="321"/>
	<Point x="582" y="321"/>
	<Point x="700" y="410"/>
	<Point x="801" y="427"/>
	<Point x="1101" y="427"/>
	<Point x="1101" y="1200"/>
	<Point x="-1" y="1200"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Skrifstofa" scene="s_Skrifstofa" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Skrifstofal" scene="s_Skrifstofa" polygon="p_Skrifstofa"
	zmin="0" zmax="800" defaultscaling="0.82" scaling2="1.0" scanline1="330" scanline2="570"/>

<!-- Background for Skrifstofa -->
<StaticActorFace name="af_Skrifstofa" file="\SidaskiA\Graphic\skrifstA" prepare="false"/>
<StaticActor name="a_Skrifstofa" terrain="t_Skrifstofa" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Skrifstofa"/>
</StaticActor>
<!-- Prepare Skrifstofa -->
<PrepareQuantum name="qp_Skrifstofa0" object="af_Skrifstofa" prepare="true"/>
<PrepareQuantum name="qu_Skrifstofa0" object="af_Skrifstofa" prepare="false"/>

<!-- "Hotspot" from Skrifstofa to FyrirUtan -->
<Pseudo3DCollisionBox name="cb_Skrifstofa2FyrirUtan" x="400" y="40" z="4"/>
<TransparentActorFace name="af_ToFyrirUtanFromSkrifstofa" width="450" height="50"/>
<StaticActor name="a_Skrifstofa2FyrirUtan" terrain="t_Skrifstofal" x="215" y="575" z="1" state="stop"
		collision="ac_Skrifstofa2FyrirUtan">
	<State name="stop" collisionbox="cb_Skrifstofa2FyrirUtan"/>
</StaticActor>
<StaticActor name="a_Skrifstofa2FyrirUtanTT" terrain="t_Skrifstofal" x="0" y="600" z="50" state="stop">
	<State name="stop" face="af_ToFyrirUtanFromSkrifstofa"/>
</StaticActor>
<MoveActorQuantum name="qh_Skrifstofa2FyrirUtan" actor="a_Skrifstofa2FyrirUtan"/>
<MoveActorQuantum name="qs_Skrifstofa2FyrirUtan" actor="a_Skrifstofa2FyrirUtan" terrain="t_Skrifstofal"/>

<!-- "Hotspot" from Skrifstofa to Svefnherbergi -->
<Pseudo3DCollisionBox name="cb_Skrifstofa2Svefnherbergi" x="4" y="170" z="4"/>
<TransparentActorFace name="af_ToSvefnherbergiFromSkrifstofa" width="50" height="350"/>
<StaticActor name="a_Skrifstofa2Svefnherbergi" terrain="t_Skrifstofal" x="762" y="508" z="1" state="stop"
		collision="ac_Skrifstofa2Svefnherbergi">
	<State name="stop" collisionbox="cb_Skrifstofa2Svefnherbergi"/>
</StaticActor>
<StaticActor name="a_Skrifstofa2SvefnherbergiTT" terrain="t_Skrifstofal" x="750" y="750" z="500" state="stop">
	<State name="stop" face="af_ToSvefnherbergiFromSkrifstofa"/>
</StaticActor>
<MoveActorQuantum name="qh_Skrifstofa2Svefnherbergi" actor="a_Skrifstofa2Svefnherbergi"/>
<MoveActorQuantum name="qs_Skrifstofa2Svefnherbergi" actor="a_Skrifstofa2Svefnherbergi" terrain="t_Skrifstofal"/>

<!-- Dummy actor þegar skúffan er lokuð -->
<Pseudo3DCollisionBox name="cb_SkuffaSkrifstofaClosed" x="50" y="50" z="30"/>
<TransparentActorFace name="af_SkuffaSkrifstofaClosed" width="50" height="50"/>
<StaticActor name="a_SkuffaSkrifstofaClosed" terrain="t_Skrifstofa" x="301" y="237" z="1" state="stop" save="true" random="true">
	<State name="stop" face="af_SkuffaSkrifstofaClosed"/>
</StaticActor>

<!-- Skúffa opin -->
<StaticActorFace name="af_SkuffaSkrifstofaOpen" file="\SidaskiA\Graphic\hlutir\skuffa" prepare="false"/>
<StaticActor name="a_SkuffaSkrifstofaOpen" x="299" y="240" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_SkuffaSkrifstofaOpen"/>
</StaticActor>
<PrepareQuantum name="qp_Skrifstofa1" object="af_SkuffaSkrifstofaOpen" prepare="true"/>
<PrepareQuantum name="qu_Skrifstofa1" object="af_SkuffaSkrifstofaOpen" prepare="false"/>

<!-- Galdrabók Large -->
<StaticActorFace name="af_GaldrabokLarge" file="\SidaskiA\Graphic\galdrabA" prepare="false"/>
<StaticActor name="a_GaldrabokLarge" x="0" y="950" z="950" state="stop" save="true">
	<State name="stop" face="af_GaldrabokLarge"/>
</StaticActor>
<MoveActorQuantum name="q_HideGaldrabokLarge" actor="a_GaldrabokLarge"/>
<MoveActorQuantum name="q_ShowGaldrabokLargeInv" actor="a_GaldrabokLarge" terrain="t_InventoryBack"/>
<MoveActorQuantum name="q_ShowGaldrabokLargeSkrif" actor="a_GaldrabokLarge" terrain="t_Skrifstofal"/>

<!-- Lykill -->
<StaticActorFace name="af_Lykill" file="\SidaskiA\Graphic\hlutir\lykill" prepare="false"/>
<StaticActorFace name="af_LykillU" file="\SidaskiA\Graphic\hlutir\lykillu" prepare="true"/>
<StaticActor name="a_Lykill" x="312" y="253" z="11" state="stop" save="true" random="true">
	<State name="stop" face="af_Lykill"/>
	<State name="taken" face="af_LykillI"/>
	<State name="use" face="af_LykillU"/>
</StaticActor>
<StateQuantum name="q_LykillTaken" actor="a_Lykill" state="taken"/>
<StateQuantum name="q_LykillStop" actor="a_Lykill" state="stop"/>
<MoveActorQuantum name="q_FelaLykil" actor="a_Lykill"/>
<MoveActorQuantum name="q_BirtaLykil" actor="a_Lykill" terrain="t_Skrifstofal" />
<MoveActorQuantum name="q_MoveLykill2Inventory" actor="a_Lykill" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Skrifstofa2" object="af_Lykill" prepare="true"/>
<PrepareQuantum name="qu_Skrifstofa2" object="af_Lykill" prepare="false"/>

<!-- Galdrabók í hillu -->
<StaticActorFace name="af_Galdrabok" file="\SidaskiA\Graphic\hlutir\galdrabB" prepare="false"/>
<StaticActorFace name="af_GaldrabokU" file="\SidaskiA\Graphic\hlutir\galdrabC" prepare="true"/>
<StaticActor name="a_Galdrabok" terrain="t_Skrifstofal" x="656" y="129" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Galdrabok"/>
	<State name="taken" face="af_GaldrabokI"/>
	<State name="use" face="af_GaldrabokU"/>
</StaticActor>
<StateQuantum name="q_GaldrabokTaken" actor="a_Galdrabok" state="taken"/>
<MoveActorQuantum name="qh_Galdrabok" actor="a_Galdrabok"/>
<MoveActorQuantum name="q_MoveGaldrabok2Inventory" actor="a_Galdrabok" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Skrifstofa3" object="af_Galdrabok" prepare="true"/>
<PrepareQuantum name="qu_Skrifstofa3" object="af_Galdrabok" prepare="false"/>

<!-- Kollur -->
<StaticActorFace name="af_Kollur7" file="\SidaskiA\Graphic\hlutir\kollur7" prepare="false"/>
<Pseudo3DCollisionBox name="cb_Kollur7" x="70" y="25" z="84"/>
<StaticActor name="a_Kollur7" x="627" y="410" z="1" state="stop" terrain="t_Skrifstofal" random="true">
	<State name="stop" face="af_Kollur7" collisionbox="cb_Kollur7"/>
</StaticActor>
<PrepareQuantum name="qp_Skrifstofa4" object="af_Kollur7" prepare="true"/>
<PrepareQuantum name="qu_Skrifstofa4" object="af_Kollur7" prepare="false"/>

<!-- Bladsida -->
<StaticActorFace name="af_BladsidaU" file="\SidaskiA\Graphic\hlutir\bladsidB" prepare="true"/>
<StaticActor name="a_Bladsida" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_BladsidaI"/>
	<State name="use" face="af_BladsidaU"/>
</StaticActor>
<MoveActorQuantum name="q_MoveBladsida2Inventory" actor="a_Bladsida" terrain="t_Inventory"/>
<MoveActorQuantum name="qh_Bladsida" actor="a_Bladsida" />

<!-- Bladsida Large-->
<StaticActorFace name="af_BladsidaLarge" file="\SidaskiA\Graphic\sida" prepare="false"/>
<StaticActor name="a_BladsidaLarge" x="0" y="950" z="950" state="stop">
	<State name="stop" face="af_BladsidaLarge"/>
</StaticActor>
<MoveActorQuantum name="qh_BladsidaLarge" actor="a_BladsidaLarge" />
<MoveActorQuantum name="qs_BladsidaLarge" actor="a_BladsidaLarge" terrain="t_InventoryBack"/>

<!-- Sendibref Large -->
<StaticActorFace name="af_SendibrefLarge" file="\SidaskiA\Graphic\sendibrA" prepare="false"/>
<StaticActor name="a_SendibrefLarge" x="0" y="950" z="950" state="stop">
	<State name="stop" face="af_SendibrefLarge"/>
</StaticActor>
<MoveActorQuantum name="q_HideSendibrefLarge" actor="a_SendibrefLarge"/>
<MoveActorQuantum name="q_ShowSendibrefLarge" actor="a_SendibrefLarge" terrain="t_InventoryBack"/>

<TransparentActorFace name="af_Kista" width="205" height="130"/>
<StaticActor name="a_Kista" terrain="t_Skrifstofal" x="45" y="370" z="0" state="stop" random="true">
	<State name="stop" face="af_Kista"/>
</StaticActor>

<TransparentActorFace name="af_Koppur" width="46" height="31"/>
<StaticActor name="a_Koppur" terrain="t_Skrifstofal" x="583" y="297" z="0" state="stop" random="true">
	<State name="stop" face="af_Koppur"/>
</StaticActor>

<TransparentActorFace name="af_Gluggi5" width="120" height="174"/>
<StaticActor name="a_Gluggi5" terrain="t_Skrifstofal" x="392" y="9" z="0" state="stop" random="true">
	<State name="stop" face="af_Gluggi5"/>
</StaticActor>

<TransparentActorFace name="af_Lampi1" width="20" height="78"/>
<StaticActor name="a_Lampi1" terrain="t_Skrifstofal" x="221" y="140" z="0" state="stop" random="true">
	<State name="stop" face="af_Lampi1"/>
</StaticActor>

<TransparentActorFace name="af_Bok11" width="8" height="36"/>
<StaticActor name="a_Bok11" terrain="t_Skrifstofal" x="653" y="79" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok11"/>
</StaticActor>

<TransparentActorFace name="af_Bok12" width="7" height="36"/>
<StaticActor name="a_Bok12" terrain="t_Skrifstofal" x="661" y="79" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok12"/>
</StaticActor>

<TransparentActorFace name="af_Bok13" width="12" height="37"/>
<StaticActor name="a_Bok13" terrain="t_Skrifstofal" x="670" y="78" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok13"/>
</StaticActor>

<TransparentActorFace name="af_Bok14" width="13" height="27"/>
<StaticActor name="a_Bok14" terrain="t_Skrifstofal" x="683" y="88" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok14"/>
</StaticActor>

<TransparentActorFace name="af_Bok15" width="8" height="34"/>
<StaticActor name="a_Bok15" terrain="t_Skrifstofal" x="675" y="186" z="50" state="stop" random="true">
	<State name="stop" face="af_Bok15"/>
</StaticActor>

<TransparentActorFace name="af_Bok16" width="9" height="35"/>
<StaticActor name="a_Bok16" terrain="t_Skrifstofal" x="684" y="178" z="50" state="stop" random="true">
	<State name="stop" face="af_Bok16"/>
</StaticActor>

<TransparentActorFace name="af_Bok17" width="3" height="35"/>
<StaticActor name="a_Bok17" terrain="t_Skrifstofal" x="694" y="178" z="50" state="stop" random="true">
	<State name="stop" face="af_Bok17"/>
</StaticActor>

<TransparentActorFace name="af_Bok18" width="8" height="41"/>
<StaticActor name="a_Bok18" terrain="t_Skrifstofal" x="654" y="181" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok18"/>
</StaticActor>

<TransparentActorFace name="af_Bok19" width="10" height="43"/>
<StaticActor name="a_Bok19" terrain="t_Skrifstofal" x="663" y="184" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok19"/>
</StaticActor>

<TransparentActorFace name="af_Bok20" width="5" height="39"/>
<StaticActor name="a_Bok20" terrain="t_Skrifstofal" x="675" y="193" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok20"/>
</StaticActor>

<TransparentActorFace name="af_Bok21" width="5" height="43"/>
<StaticActor name="a_Bok21" terrain="t_Skrifstofal" x="682" y="194" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok21"/>
</StaticActor>

<TransparentActorFace name="af_Bok22" width="7" height="46"/>
<StaticActor name="a_Bok22" terrain="t_Skrifstofal" x="689" y="196" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok22"/>
</StaticActor>

<TransparentActorFace name="af_Bok23" width="6" height="39"/>
<StaticActor name="a_Bok23" terrain="t_Skrifstofal" x="655" y="239" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok23"/>
</StaticActor>

<TransparentActorFace name="af_Bok24" width="6" height="42"/>
<StaticActor name="a_Bok24" terrain="t_Skrifstofal" x="662" y="242" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok24"/>
</StaticActor>

<TransparentActorFace name="af_Bok25" width="4" height="42"/>
<StaticActor name="a_Bok25" terrain="t_Skrifstofal" x="670" y="249" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok25"/>
</StaticActor>

<TransparentActorFace name="af_Bok26" width="6" height="43"/>
<StaticActor name="a_Bok26" terrain="t_Skrifstofal" x="677" y="255" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok26"/>
</StaticActor>

<TransparentActorFace name="af_Bok27" width="5" height="43"/>
<StaticActor name="a_Bok27" terrain="t_Skrifstofal" x="685" y="261" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok27"/>
</StaticActor>

<TransparentActorFace name="af_Bok28" width="3" height="44"/>
<StaticActor name="a_Bok28" terrain="t_Skrifstofal" x="693" y="266" z="0" state="stop" random="true">
	<State name="stop" face="af_Bok28"/>
</StaticActor>

<StaticActorFace name="af_Baekur88" file="\SidaskiA\Graphic\hlutir\baekur"/>
<StaticActor name="a_Baekur88" x="675" y="153" z="30" state="stop" terrain="t_Skrifstofal">
	<State name="stop" face="af_Baekur88"/>
</StaticActor>
<PrepareQuantum name="qp_Skrifstofa5" object="af_Baekur88" prepare="true"/>
<PrepareQuantum name="qu_Skrifstofa5" object="af_Baekur88" prepare="false"/>


<Scene name="s_Svefnherbergi"/>

<Polygon name="p_Svefnherbergil">
	<Point x="-1" y="500"/>
	<Point x="160" y="399"/>
	<Point x="336" y="399"/>
	<Point x="518" y="601"/>
	<Point x="-1" y="601"/>
	<Point x="-1" y="500"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Svefnherbergi" scene="s_Svefnherbergi" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Svefnherbergil" scene="s_Svefnherbergi" polygon="p_Svefnherbergil"
	zmin="0" zmax="800" defaultscaling="0.92" scaling2="1.0" scanline1="445" scanline2="595"/>

<!-- Background for Svefnherbergi -->
<StaticActorFace name="af_Svefnherbergi" file="\SidaskiA\Graphic\svefnheA" prepare="false"/>
<StaticActor name="a_Svefnherbergi" terrain="t_Svefnherbergi" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Svefnherbergi"/>
</StaticActor>
<!-- Prepare Svefnherbergi -->
<PrepareQuantum name="qp_Svefnherbergi0" object="af_Svefnherbergi" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi0" object="af_Svefnherbergi" prepare="false"/>

<TransparentActorFace name="af_ToSkrifstofaFromSvefnherbergi" width="170" height="367"/>
<StaticActor name="a_Svefnherbergi2SkrifstofaTT" terrain="t_Svefnherbergil" x="158" y="848" z="800" state="stop">
	<State name="stop" face="af_ToSkrifstofaFromSvefnherbergi"/>
</StaticActor>

<!-- Skúffan -->
<TransparentActorFace name="af_SkuffaSvefnherbergiClosed1" width="46" height="47"/>
<TransparentActorFace name="af_SkuffaSvefnherbergiClosed2" width="67" height="69"/>
<StaticActor name="a_SkuffaSvefnherbergiClosed1" terrain="t_Svefnherbergil" x="474" y="683" z="300" state="stop" save="true" random="true">
	<State name="stop" face="af_SkuffaSvefnherbergiClosed1"/>
</StaticActor>
<StaticActor name="a_SkuffaSvefnherbergiClosed2" terrain="t_Svefnherbergil" x="494" y="729" z="300" state="stop" save="true" random="true">
	<State name="stop" face="af_SkuffaSvefnherbergiClosed2"/>
</StaticActor>
<MoveActorQuantum name="qs_SkuffaSvefnherbergiClosed1" actor="a_SkuffaSvefnherbergiClosed1" terrain="t_Svefnherbergil"/>
<MoveActorQuantum name="qs_SkuffaSvefnherbergiClosed2" actor="a_SkuffaSvefnherbergiClosed2" terrain="t_Svefnherbergil"/>
<MoveActorQuantum name="qh_SkuffaSvefnherbergiClosed1" actor="a_SkuffaSvefnherbergiClosed1"/>
<MoveActorQuantum name="qh_SkuffaSvefnherbergiClosed2" actor="a_SkuffaSvefnherbergiClosed2"/>

<!-- Skúffa opin -->
<StaticActorFace name="af_SkuffaSvefnherbergiOpen" file="\SidaskiA\Graphic\hlutir\skuffa7" prepare="false"/>
<StaticActor name="a_SkuffaSvefnherbergiOpen" x="404" y="380" z="-2" state="stop" save="true" random="true">
	<State name="stop" face="af_SkuffaSvefnherbergiOpen"/>
</StaticActor>
<MoveActorQuantum name="q_OpenSkuffaSvefnherbergi" actor="a_SkuffaSvefnherbergiOpen" terrain="t_Svefnherbergil"/>
<MoveActorQuantum name="q_CloseSkuffaSvefnherbergi" actor="a_SkuffaSvefnherbergiOpen"/>
<PrepareQuantum name="qp_Svefnherbergi1" object="af_SkuffaSvefnherbergiOpen" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi1" object="af_SkuffaSvefnherbergiOpen" prepare="false"/>


<StaticActorFace name="af_Poki" file="\SidaskiA\Graphic\hlutir\poki" prepare="false"/>
<StaticActorFace name="af_PokiU" file="\SidaskiA\Graphic\hlutir\pokiu" prepare="true"/>
<StaticActor name="a_Poki" x="446" y="381" z="-57" state="stop" save="true" random="true">
	<State name="stop" face="af_Poki"/>
	<State name="taken" face="af_PokiI"/>
	<State name="use" face="af_PokiU"/>
</StaticActor>
<StateQuantum name="q_PokiTaken" actor="a_Poki" state="taken"/>
<MoveActorQuantum name="q_BirtaPoka" actor="a_Poki" terrain="t_Svefnherbergil"/>
<MoveActorQuantum name="q_MovePoki" actor="a_Poki"/>
<MoveActorQuantum name="q_MovePoki2Inventory" actor="a_Poki" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Svefnherbergi2" object="af_Poki" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi2" object="af_Poki" prepare="false"/>


<StaticActorFace name="af_PokiHalfFullurU" file="\SidaskiA\Graphic\hlutir\pokihalB" prepare="true"/>
<StaticActor name="a_PokiHalfFullur" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_PokiHalfFullurI"/>
	<State name="use" face="af_PokiHalfFullurU"/>
</StaticActor>
<MoveActorQuantum name="qs_PokiHalfFullur" actor="a_PokiHalfFullur" terrain="t_Inventory"/>
<MoveActorQuantum name="qh_PokiHalfFullur" actor="a_PokiHalfFullur"/>

<StaticActorFace name="af_PokiFullur" file="\SidaskiA\Graphic\hlutir\pokifulB" prepare="false"/>
<StaticActorFace name="af_PokiFullurU" file="\SidaskiA\Graphic\hlutir\pokifulC" prepare="true"/>
<StaticActor name="a_PokiFullur" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="stop" face="af_PokiFullur"/>
	<State name="taken" face="af_PokiFullurI"/>
	<State name="use" face="af_PokiFullurU"/>
</StaticActor>
<StateQuantum name="q_StopPokiFullur" actor="a_PokiFullur" state="stop"/>
<MoveActorQuantum name="qs_PokiFullur" actor="a_PokiFullur" terrain="t_Inventory"/>
<MoveActorQuantum name="qh_PokiFullur" actor="a_PokiFullur"/>
<MoveActorQuantum name="q_MovePoki2Skuffa" actor="a_PokiFullur" terrain="t_Svefnherbergil">
	<Location x="441" y="381" z="10"/>
</MoveActorQuantum>
<PrepareQuantum name="qp_Svefnherbergi3" object="af_PokiFullur" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi3" object="af_PokiFullur" prepare="false"/>

<TransparentActorFace name="af_Kollur17" width="90" height="116"/>
<StaticActor name="a_Kollur17" terrain="t_Svefnherbergil" x="356" y="317" z="0" state="stop" random="true">
	<State name="stop" face="af_Kollur17"/>
</StaticActor>

<TransparentActorFace name="af_Baekur45" width="106" height="57"/>
<StaticActor name="a_Baekur45" terrain="t_Svefnherbergil" x="486" y="75" z="0" state="stop" random="true">
	<State name="stop" face="af_Baekur45"/>
</StaticActor>

<TransparentActorFace name="af_Lampi33" width="26" height="91"/>
<StaticActor name="a_Lampi33" terrain="t_Svefnherbergil" x="431" y="52" z="0" state="stop" random="true">
	<State name="stop" face="af_Lampi33"/>
</StaticActor>

<TransparentActorFace name="af_Kista17" width="135" height="60"/>
<StaticActor name="a_Kista17" terrain="t_Svefnherbergil" x="666" y="541" z="0" state="stop" random="true">
	<State name="stop" face="af_Kista17"/>
</StaticActor>


<Scene name="s_Kopavogur"/>

<Polygon name="p_Kopavogur">
	<Point x="-600" y="440"/>
	<Point x="150" y="440"/>
	<Point x="490" y="370"/>
	<Point x="801" y="370"/>
	<Point x="801" y="480"/>
	<Point x="590" y="601"/>
	<Point x="-600" y="601"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Kopavogur" scene="s_Kopavogur" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Kopavogurl" scene="s_Kopavogur" polygon="p_Kopavogur"
	zmin="0" zmax="800" defaultscaling="0.85" scaling2="1.0" scanline1="400" scanline2="570"/>

<!-- Background for Kopavogur -->
<StaticActorFace name="af_Kopavogur" file="\SidaskiA\Graphic\kopavogA" prepare="false"/>
<StaticActor name="a_Kopavogur" terrain="t_Kopavogur" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Kopavogur"/>
</StaticActor>
<!-- Prepare Kopavogur -->
<PrepareQuantum name="qp_Kopavogur0" object="af_Kopavogur" prepare="true"/>
<PrepareQuantum name="qu_Kopavogur0" object="af_Kopavogur" prepare="false"/>

<Pseudo3DCollisionBox name="cb_Kopavogur2FyrirUtan" x="4" y="140" z="10"/>
<TransparentActorFace name="af_ToFyrirUtanFromKopavogur" width="80" height="170"/>
<StaticActor name="a_Kopavogur2FyrirUtan" terrain="t_Kopavogurl" x="40" y="520" z="1" state="stop"
		collision="ac_Kopavogur2FyrirUtan">
	<State name="stop" collisionbox="cb_Kopavogur2FyrirUtan"/>
</StaticActor>
<StaticActor name="a_Kopavogur2FyrirUtanTT" terrain="t_Kopavogurl" x="-5" y="940" z="500" state="stop">
	<State name="stop" face="af_ToFyrirUtanFromKopavogur"/>
</StaticActor>
<MoveActorQuantum name="qh_Kopavogur2FyrirUtan" actor="a_Kopavogur2FyrirUtan"/>
<MoveActorQuantum name="qs_Kopavogur2FyrirUtan" actor="a_Kopavogur2FyrirUtan" terrain="t_Kopavogurl"/>

<StaticActorFace name="af_Krossfiskur_Stop" file="\SidaskiA\animatiA\krossfiA\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Dans" repeat="1" file="\SidaskiA\AnimatiA\krossfiA\krossfiA" count="28" prepare="false" speed="225"/>
<StaticActor name="a_Krossfiskur" terrain="t_Kopavogurl" x="308" y="271" z="0" state="stop" random="true">
	<State name="stop" face="af_Krossfiskur_Stop"/>
	<State name="dans" face="af_Dans"/>
</StaticActor>
<StateQuantum name="q_KrossfiskurStop" actor="a_Krossfiskur" state="stop" wait="false"/>
<StateQuantum name="q_KrossfiskurDans" actor="a_Krossfiskur" state="dans" wait="true"/>
<PrepareQuantum	name="qp_Kopavogur1" object="af_Krossfiskur_Stop" prepare="true"/>
<PrepareQuantum	name="qp_Kopavogur2" object="af_Dans" prepare="true"/>
<PrepareQuantum	name="qu_Kopavogur1" object="af_Krossfiskur_Stop" prepare="false"/>
<PrepareQuantum	name="qu_Kopavogur2" object="af_Dans" prepare="false"/>

<Pseudo3DCollisionBox name="cb_Konungsmenn" x="195" y="30" z="299"/>
<StaticActorFace name="af_Konungsmenn_Stop" file="\SidaskiA\animatiA\konungsA\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Konungsmenn" repeat="-1" file="\SidaskiA\AnimatiA\konungsA\konungsA" count="4" prepare="false" speed="300" random="true"/>
<StaticActor name="a_Konungsmenn" x="671" y="477" z="1" state="stop" save="true" random="true">
	<State name="stop" face="af_Konungsmenn_Stop" collisionbox="cb_Konungsmenn"/>
	<State name="dans" face="af_Konungsmenn" collisionbox="cb_Konungsmenn"/>
</StaticActor>
<StateQuantum name="q_KonungsmennStop" actor="a_Konungsmenn" state="stop"/>
<StateQuantum name="q_KonungsmennDans" actor="a_Konungsmenn" state="dans"/>
<MoveActorQuantum name="qh_Konungsmenn" actor="a_Konungsmenn"/>
<MoveActorQuantum name="qs_Konungsmenn" actor="a_Konungsmenn" terrain="t_Kopavogurl"/>
<PrepareQuantum	name="qp_Kopavogur3" object="af_Konungsmenn" prepare="true"/>
<PrepareQuantum	name="qu_Kopavogur3" object="af_Konungsmenn" prepare="false"/>
<PrepareQuantum	name="qp_Kopavogur4" object="af_Konungsmenn_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Kopavogur4" object="af_Konungsmenn_Stop" prepare="false"/>

<StaticActorFace name="af_Skip" file="\SidaskiA\Graphic\skip" prepare="false"/>
<StaticActor name="a_Skip" x="305" y="61" z="0" state="stop" save="true">
	<State name="stop" face="af_Skip" />
</StaticActor>
<MoveActorQuantum name="qh_Skip" actor="a_Skip"/>
<MoveActorQuantum name="qs_Skip" actor="a_Skip" terrain="t_Kopavogurl"/>
<PrepareQuantum	name="qp_Kopavogur5" object="af_Skip" prepare="true"/>
<PrepareQuantum	name="qu_Kopavogur5" object="af_Skip" prepare="false"/>

<StaticActorFace name="af_Batur" file="\SidaskiA\Graphic\batur" prepare="false"/>
<StaticActor name="a_Batur" x="644" y="151" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Batur" />
</StaticActor>
<MoveActorQuantum name="qh_Batur" actor="a_Batur"/>
<MoveActorQuantum name="qs_Batur" actor="a_Batur" terrain="t_Kopavogurl"/>
<PrepareQuantum	name="qp_Kopavogur6" object="af_Batur" prepare="true"/>
<PrepareQuantum	name="qu_Kopavogur6" object="af_Batur" prepare="false"/>

<TransparentActorFace name="af_Kudungur1" width="17" height="20"/>
<StaticActor name="a_Kudungur1" terrain="t_Kopavogurl" x="34" y="472" z="0" state="stop" random="true">
	<State name="stop" face="af_Kudungur1"/>
</StaticActor>

<TransparentActorFace name="af_Kudungur2" width="22" height="15"/>
<StaticActor name="a_Kudungur2" terrain="t_Kopavogurl" x="174" y="440" z="0" state="stop" random="true">
	<State name="stop" face="af_Kudungur2"/>
</StaticActor>

<TransparentActorFace name="af_Kudungur3" width="25" height="23"/>
<StaticActor name="a_Kudungur3" terrain="t_Kopavogurl" x="408" y="428" z="0" state="stop" random="true">
	<State name="stop" face="af_Kudungur3"/>
</StaticActor>

<TransparentActorFace name="af_Kudungur4" width="19" height="14"/>
<StaticActor name="a_Kudungur4" terrain="t_Kopavogurl" x="674" y="452" z="0" state="stop" random="true">
	<State name="stop" face="af_Kudungur4"/>
</StaticActor>

<TransparentActorFace name="af_Steinn1" width="34" height="14"/>
<StaticActor name="a_Steinn1" terrain="t_Kopavogurl" x="258" y="362" z="0" state="stop" random="true">
	<State name="stop" face="af_Steinn1"/>
</StaticActor>


<Scene name="s_Askur"/>

<Polygon name="p_Askur">
	<Point x="-1" y="-1"/>
	<Point x="-1" y="601"/>
	<Point x="801" y="601"/>
	<Point x="801" y="-1"/>
</Polygon>

<Polygon name="p_Askurl">
	<Point x="-1" y="-1"/>
	<Point x="-1" y="600"/>
	<Point x="800" y="600"/>
	<Point x="800" y="-1"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Askur" scene="s_Askur" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Askurl" scene="s_Askur" polygon="p_Askurl"
	zmin="0" zmax="800" defaultscaling="1.0"/>

<!-- Background for Askur -->
<StaticActorFace name="af_Askur" file="\SidaskiA\Graphic\askur" prepare="false"/>
<StaticActor name="a_Askur" terrain="t_Askur" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Askur"/>
</StaticActor>
<!-- Prepare Askur -->
<PrepareQuantum name="qp_Askur0" object="af_Askur" prepare="true"/>
<PrepareQuantum name="qu_Askur0" object="af_Askur" prepare="false"/>


<!-- Hotspot to HjaBryta -->
<TransparentActorFace name="af_AsksLok" width="191" height="220"/>
<StaticActor name="a_Askur2HjaBryta" terrain="t_Askurl" x="484" y="206" z="0" state="stop">
	<State name="stop" face="af_AsksLok"/>
</StaticActor>

<!-- Peningar -->
<StaticActorFace name="af_PeningarAskur" file="\SidaskiA\Graphic\hlutir\peningar" prepare="false"/>
<StaticActorFace name="af_PeningarAskurU" file="\SidaskiA\Graphic\hlutir\peningaB" prepare="true"/>
<StaticActor name="a_PeningarAskur" terrain="t_Askur" x="248" y="2" z="-300" state="stop" save="true" random="true">
	<State name="stop" face="af_PeningarAskur"/>
	<State name="taken" face="af_PeningarAskurI"/>
	<State name="use" face="af_PeningarAskurU"/>
</StaticActor>
<StateQuantum name="q_PeningarAskurTaken" actor="a_PeningarAskur" state="taken"/>
<StateQuantum name="q_PeningarAskurStop" actor="a_PeningarAskur" state="stop"/>
<MoveActorQuantum name="qh_PeningarAskur" actor="a_PeningarAskur"/>
<MoveActorQuantum name="q_MovePeningar2Inventory" actor="a_PeningarAskur" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Askur1" object="af_PeningarAskur" prepare="true"/>
<PrepareQuantum name="qu_Askur1" object="af_PeningarAskur" prepare="false"/>

<!-- Skæri -->
<StaticActorFace name="af_SkaeriAskur" file="\SidaskiA\Graphic\hlutir\skari" prepare="false"/>
<StaticActorFace name="af_SkaeriAskurU" file="\SidaskiA\Graphic\hlutir\skariu" prepare="true"/>
<StaticActor name="a_SkaeriAskur" terrain="t_Askur" x="242" y="193" z="1" state="stop" save="true" random="true">
	<State name="stop" face="af_SkaeriAskur"/>
	<State name="taken" face="af_SkaeriAskurI"/>
	<State name="use" face="af_SkaeriAskurU"/>
</StaticActor>
<StateQuantum name="q_SkaeriAskurTaken" actor="a_SkaeriAskur" state="taken"/>
<StateQuantum name="q_SkaeriAskurStop" actor="a_SkaeriAskur" state="stop"/>
<MoveActorQuantum name="q_MoveSkaeriAskur" actor="a_SkaeriAskur"/>
<MoveActorQuantum name="q_MoveSkaeri2Inventory" actor="a_SkaeriAskur" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Askur2" object="af_SkaeriAskur" prepare="true"/>
<PrepareQuantum name="qu_Askur2" object="af_SkaeriAskur" prepare="false"/>

<!-- Tölur -->
<StaticActorFace name="af_TolurAskur" file="\SidaskiA\Graphic\hlutir\tolur" prepare="false"/>
<StaticActorFace name="af_TolurAskurU" file="\SidaskiA\Graphic\hlutir\toluru" prepare="true"/>
<StaticActor name="a_TolurAskur" terrain="t_Askur" x="308" y="170" z="-100" state="stop" save="true" random="true">
	<State name="stop" face="af_TolurAskur"/>
	<State name="taken" face="af_TolurAskurI"/>
	<State name="use" face="af_TolurAskurU"/>
</StaticActor>
<StateQuantum name="q_TolurAskurTaken" actor="a_TolurAskur" state="taken"/>
<StateQuantum name="q_TolurAskurStop" actor="a_TolurAskur" state="stop"/>
<MoveActorQuantum name="q_MoveTolurAskur" actor="a_TolurAskur"/>
<MoveActorQuantum name="q_MoveTolur2Inventory" actor="a_TolurAskur" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Askur3" object="af_TolurAskur" prepare="true"/>
<PrepareQuantum name="qu_Askur3" object="af_TolurAskur" prepare="false"/>

<!-- Tvinni -->
<StaticActorFace name="af_TvinniAskur" file="\SidaskiA\Graphic\hlutir\tvinni" prepare="false"/>
<StaticActorFace name="af_TvinniAskurU" file="\SidaskiA\Graphic\hlutir\tvinniu" prepare="true"/>
<StaticActor name="a_TvinniAskur" terrain="t_Askur" x="363" y="160" z="-100" state="stop" save="true" random="true">
	<State name="stop" face="af_TvinniAskur"/>
	<State name="taken" face="af_TvinniAskurI"/>
	<State name="use" face="af_TvinniAskurU"/>
</StaticActor>
<StateQuantum name="q_TvinniAskurTaken" actor="a_TvinniAskur" state="taken"/>
<StateQuantum name="q_TvinniAskurStop" actor="a_TvinniAskur" state="stop"/>
<MoveActorQuantum name="q_MoveTvinniAskur" actor="a_TvinniAskur"/>
<MoveActorQuantum name="q_MoveTvinni2Inventory" actor="a_TvinniAskur" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Askur4" object="af_TvinniAskur" prepare="true"/>
<PrepareQuantum name="qu_Askur4" object="af_TvinniAskur" prepare="false"/>


<Text name="a_Text" terrain="t_Corners" text=" " hilite="false" color="yellow"/>

<StateController name="sc"
	stateactor="a_States"
	inventoryactor="a_SmallInventory"
	inventory="s_Inventory"
	textactor="a_Text" />
<ActorMoused actor="a_SmallInventory" listener="sc"/>
<ActorMoused actor="a_Kollur" listener="sc" moving="Kollur" thf="koll"/>
<ActorMoused actor="a_AskurLitill" listener="sc" moving="Askur" thf="ask"/>
<ActorMoused actor="a_Askur2" listener="sc" moving="Askur" thf="ask"/>
<UseText actor="a_Kollur" actor2="a_AskurLitill" listener="sc" text="Stíga upp á kollinn"/>
<UseText actor="a_Kollur" actor2="a_Askur2" listener="sc" text="Stíga upp á kollinn"/>

<ActorMoused actor="a_Hotspot" listener="sc" moving="Út úr brytabústað" thf=" " looking="Út úr brytabústað" taking=" " talking=" "/>
<ActorMoused actor="a_FyrirUtan2HjaBrytaTT" listener="sc" moving="Inn í brytabústað" looking="Inn í brytabústað" taking="Opna dyr" talking=" " />
<ActorMoused actor="a_FyrirUtan2KirkjaTT" listener="sc" moving="Inn í kirkju" looking="Inn í kirkju" taking="Opna dyr" talking=" " />
<ActorMoused actor="a_FyrirUtan2KopavogurTT" listener="sc" moving="Til Kópavogs" looking="Til Kópavogs" taking=" " talking=" " />
<ActorMoused actor="a_FyrirUtan2SkrifstofaTT" listener="sc" moving="Inn í skrifstofu" looking="Inn í skrifstofu" taking="Opna dyr" talking=" " />
<ActorMoused actor="a_Skrifstofa2FyrirUtanTT" listener="sc" moving="Út úr skrifstofu" looking="Út úr skrifstofu" taking=" " talking=" " />
<ActorMoused actor="a_Kirkja2FyrirUtanTT" listener="sc" moving="Út úr kirkju" looking="Út úr kirkju" taking=" " talking=" " />
<ActorMoused actor="a_Skrifstofa2SvefnherbergiTT" listener="sc" moving="Inn í svefnherbergi" looking="Inn í svefnherbergi" taking=" " talking=" " />
<ActorMoused actor="a_Svefnherbergi2SkrifstofaTT" listener="sc" moving="Inn í skrifstofu" looking="Inn í skrifstofu" taking="Opna dyr" talking=" " />
<ActorMoused actor="a_Kopavogur2FyrirUtanTT" listener="sc" moving="Til Skálholts" looking="Til Skálholts" taking=" " talking=" " />
<ActorMoused actor="a_Skilti" listener="sc" moving="Skilti" thf="skilti" />
<ActorMoused actor="a_Baekur2" listener="sc" moving="Bækur" thf="bækur" />
<ActorMoused actor="a_Tafla" listener="sc" moving="Sálmatafla" thf="sálmatöflu" />
<ActorMoused actor="a_Men" listener="sc" moving="Hálsmen" thf="hálsmen" />
<ActorMoused actor="a_Kerti2" listener="sc" moving="Kerti" thf="kerti" />
<ActorMoused actor="a_Hilla1" listener="sc" moving="Hilla" thf="hillu" />
<ActorMoused actor="a_Skalar" listener="sc" moving="Skálar" thf="skálar" />
<ActorMoused actor="a_Skeid" listener="sc" moving="Skeið" thf="skeið" />
<ActorMoused actor="a_Gluggi1" listener="sc" moving="Gluggi" thf="glugga" />
<ActorMoused actor="a_Gluggi2" listener="sc" moving="Gluggi" thf="glugga" />
<ActorMoused actor="a_Gluggi3" listener="sc" moving="Gluggi" thf="glugga" />
<ActorMoused actor="a_Runni" listener="sc" moving="Runni" thf="runna" />
<ActorMoused actor="a_Kudungur1" listener="sc" moving="Kuðungur" thf="kuðung" />
<ActorMoused actor="a_Kudungur2" listener="sc" moving="Kuðungur" thf="kuðung" />
<ActorMoused actor="a_Kudungur3" listener="sc" moving="Kuðungur" thf="kuðung" />
<ActorMoused actor="a_Kudungur4" listener="sc" moving="Skel" thf="skel" />
<ActorMoused actor="a_Steinn1" listener="sc" moving="Steinn" thf="stein" />
<ActorMoused actor="a_Kista" listener="sc" moving="Kista" thf="kistu" />
<ActorMoused actor="a_Koppur" listener="sc" moving="Koppur" thf="kopp" />
<ActorMoused actor="a_Lampi1" listener="sc" moving="Lampi" thf="lampa" />
<ActorMoused actor="a_Gluggi5" listener="sc" moving="Gluggi" thf="glugga" />
<ActorMoused actor="a_Bok11" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok12" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok13" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok14" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok15" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok16" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok17" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok18" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok19" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok20" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok21" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok22" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok23" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok24" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok25" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok26" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok27" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Bok28" listener="sc" moving="Bók" thf="bók" />
<ActorMoused actor="a_Kollur7" listener="sc" moving="Kollur" thf="koll" />
<ActorMoused actor="a_Kollur17" listener="sc" moving="Kollur" thf="koll" />
<ActorMoused actor="a_Baekur45" listener="sc" moving="Bækur" thf="bækur" />
<ActorMoused actor="a_Lampi33" listener="sc" moving="Lampi" thf="lampa" />
<ActorMoused actor="a_Kista17" listener="sc" moving="Kista" thf="kistu" />

<ActorMoused actor="a_SkuffaSkrifstofaClosed" listener="sc" moving="Skúffa" taking="Opna skúffu" thf="skúffu"/>
<ActorMoused actor="a_SkuffaSkrifstofaOpen" listener="sc" moving="Opin skúffa" taking="Loka skúffu" thf="skúffu"/>

<ActorMoused actor="a_SkuffaSvefnherbergiClosed1" listener="sc" moving="Skúffa" taking="Opna skúffu" thf="skúffu"/>
<ActorMoused actor="a_SkuffaSvefnherbergiClosed2" listener="sc" moving="Skúffa" taking="Opna skúffu" thf="skúffu"/>
<ActorMoused actor="a_SkuffaSvefnherbergiOpen" listener="sc" moving="Opin skúffa" taking="Loka skúffu" thf="skúffu"/>

<ActorMoused actor="a_Poki" listener="sc" thf="poka" moving="Poki"/>
<ActorMoused actor="a_PokiHalfFullur" listener="sc" thf="poka með helgimunum" moving="Poki með helgimunum"/>
<ActorMoused actor="a_PokiFullur" listener="sc" thf="troðfullan poka með helgimunum" moving="Troðfullur poki með helgimunum"/>
<ActorMoused actor="a_Askur2HjaBryta" listener="sc" thf="askslok" moving="Loka aski" taking="Loka aski" looking="Loka aski" talking="Loka aski"/>
<ActorMoused actor="a_Silfur" listener="sc" thf="silfurkertastjaka" moving="Silfurkertastjaki"/>
<UseText actor="a_Poki" actor2="a_Silfur" listener="sc" text="Setja silfrið í pokann"/>
<UseText actor="a_Silfur" actor2="a_Poki" listener="sc" text="Setja silfrið í pokann"/>
<UseText actor="a_PokiHalfFullur" actor2="a_Silfur" listener="sc" text="Setja silfrið í pokann"/>
<UseText actor="a_Silfur" actor2="a_PokiHalfFullur" listener="sc" text="Setja silfrið í pokann"/>
<ActorMoused actor="a_Engill" listener="sc" thf="engilsstyttu" moving="Stytta af engli"/>
<UseText actor="a_Poki" actor2="a_Engill" listener="sc" text="Setja engilinn í pokann"/>
<UseText actor="a_Engill" actor2="a_Poki" listener="sc" text="Setja engilinn í pokann"/>
<UseText actor="a_PokiHalfFullur" actor2="a_Engill" listener="sc" text="Setja engilinn í pokann"/>
<UseText actor="a_Engill" actor2="a_PokiHalfFullur" listener="sc" text="Setja engilinn í pokann"/>
<ActorMoused actor="a_Kaleikur" listener="sc" thf="kaleik" moving="Kaleikur"/>
<UseText actor="a_Poki" actor2="a_Kaleikur" listener="sc" text="Setja kaleikinn í pokann"/>
<UseText actor="a_Kaleikur" actor2="a_Poki" listener="sc" text="Setja kaleikinn í pokann"/>
<UseText actor="a_PokiHalfFullur" actor2="a_Kaleikur" listener="sc" text="Setja kaleikinn í pokann"/>
<UseText actor="a_Kaleikur" actor2="a_PokiHalfFullur" listener="sc" text="Setja kaleikinn í pokann"/>
<ActorMoused actor="a_Salmabok" listener="sc" thf="Nýja testamentið" moving="Nýja testamentið"/>
<ActorMoused actor="a_SalmabokGaldur" listener="sc" thf="betrumbætta Nýja testamentið" moving="Betrumbætt Nýja testament"/>
<ActorMoused actor="a_SalmabokLarge" listener="sc" thf="sálmabók" moving="Loka bók" taking="Loka bók" looking="Loka bók" talking="Loka bók"/>
<UseText actor="a_Poki" actor2="a_Salmabok" listener="sc" text="Setja Nýja testamentið í pokann"/>
<UseText actor="a_Salmabok" actor2="a_Poki" listener="sc" text="Setja Nýja testamentið í pokann"/>
<UseText actor="a_PokiHalfFullur" actor2="a_Salmabok" listener="sc" text="Setja Nýja testamentið í pokann"/>
<UseText actor="a_Salmabok" actor2="a_PokiHalfFullur" listener="sc" text="Setja Nýja testamentið í pokann"/>
<UseText actor="a_PokiFullur" actor2="a_Salmabok" listener="sc" text="Setja Nýja testamentið í pokann"/>
<UseText actor="a_Salmabok" actor2="a_PokiFullur" listener="sc" text="Setja Nýja testamentið í pokann"/>

<UseText actor="a_SalmabokGaldur" actor2="a_Poki" listener="sc" text="Setja betrumbætta Nýja testamentið í pokann"/>
<ActorMoused actor="a_Mariumynd" listener="sc" thf="Maríumynd" moving="Maríumynd"/>
<ActorMoused actor="a_Bladsida" listener="sc" thf="blaðsíðu úr galdrabók" moving="Blaðsíða úr galdrabók" />
<UseText actor="a_Poki" actor2="a_Mariumynd" listener="sc" text="Setja Maríumyndina í pokann"/>
<UseText actor="a_Mariumynd" actor2="a_Poki" listener="sc" text="Setja Maríumyndina í pokann"/>
<UseText actor="a_SkaeriAskur" actor2="a_Galdrabok" listener="sc" text="Klippa Galdrabók"/>
<UseText actor="a_SkaeriAskur" actor2="a_Salmabok" listener="sc" text="Klippa Nýja testamentið"/>
<UseText actor="a_SkaeriAskur" actor2="a_SalmabokGaldur" listener="sc" text="Klippa Nýja testamentið"/>
<UseText actor="a_Bladsida" actor2="a_Salmabok" listener="sc" text="Setja blaðsíðu í Nýja testamentið"/>

<ActorMoused actor="a_PeningarAskur" listener="sc" moving="Peningar" thf="peninga"/>
<ActorMoused actor="a_SkaeriAskur" listener="sc" moving="Skæri" thf="skæri"/>
<ActorMoused actor="a_TolurAskur" listener="sc" moving="Tölur" thf="tölur"/>
<ActorMoused actor="a_TvinniAskur" listener="sc" moving="Tvinni" thf="tvinna"/>

<ActorMoused actor="a_Konungsmenn" listener="sc" moving="Menn hirðstjóra" taking="Hrinda mönnum hirðstjóra" thf="menn hirðstjóra"/>
<ActorMoused actor="a_Krossfiskur" listener="sc" moving="Krossfiskur" thf="krossfisk" />

<ActorMoused actor="a_Galdrabok" listener="sc" moving="Galdrabók" thf="galdrabók"/>
<ActorMoused actor="a_GaldrabokLarge" listener="sc" thf="bók" moving="Loka bók" taking="Loka bók" looking="Loka bók" talking="Loka bók"/>
<ActorMoused actor="a_SendibrefLarge" listener="sc" thf="bréf" moving="Loka bréfi" taking="Loka bréfi" looking="Loka bréfi" talking="Loka bréfi"/>
<ActorMoused actor="a_BladsidaLarge" listener="sc" thf="blaðsíðu" moving="Til baka" taking="Til baka" looking="Til baka" talking="Til baka"/>
<ActorMoused actor="a_Lykill" listener="sc" moving="Lykill" thf="lykil"/>
<ActorMoused actor="a_Batur" listener="sc" moving="Bátur" thf="bát"/>


<SwitchStateQuantum name="q_Moving" state="Moving" controller="sc"/>
<SwitchStateQuantum name="q_Taking" state="Taking" controller="sc"/>
<SwitchStateQuantum name="q_Looking" state="Looking" controller="sc"/>
<SwitchStateQuantum name="q_Talking" state="Talking" controller="sc"/>
<SwitchStateQuantum name="q_Freeze" state="Freeze" controller="sc"/>
<SwitchStateQuantum name="q_Using" state="Using" controller="sc"/>
<SwitchStateQuantum name="q_Conversating" state="Conversating" controller="sc"/>

<Scene name="s_Map"/>

<SimplePseudo3DTerrain name="t_map" scene="s_Map" polygon="p_All"
	zmin="0" zmax="20" defaultscaling="1.0"/>

<!-- Background for map -->
<StaticActorFace name="af_Map" file="\Common\Graphic\Map\map" prepare="false"/>
<StaticActor name="a_map" terrain="t_map" x="0" y="1010" z="1010" state="stop">
	<State name="stop" face="af_Map"/> </StaticActor>

<CelledAnimated2DActorFace name="af_Mapanim" repeat="1" speed="900" file="\SidaskiA\AnimatiA\skrefkop\skref" count="5" prepare="false"/>
<StaticActorFace name="af_Kop" file="\sidaskiA\graphic\mapkopaA" prepare="false"/>
<StaticActorFace name="af_Skal" file="\sidaskiA\graphic\skalholt" prepare="false"/>
<StaticActor name="a_Mapanim" state="none" x="171" y="1421" z="1000">
	<State name="play" face="af_Mapanim"/>
</StaticActor>
<StateQuantum name="q_PlayMap" actor="a_Mapanim" state="play" wait="true"/>
<StateQuantum name="q_MapNone" actor="a_Mapanim" state="none" wait="false"/>
<MoveActorQuantum name="qs_Kop" actor="a_Mapanim" terrain="t_map"/>
<MoveActorQuantum name="qh_Kop" actor="a_Mapanim"/>

<CelledAnimated2DActorFace name="af_Mapanim2" repeat="1" speed="900" file="\SidaskiA\AnimatiA\skrefskA\skref" count="5" prepare="false"/>
<StaticActor name="a_Mapanim2" state="none" x="171" y="1421" z="1000">
	<State name="play" face="af_Mapanim2"/>
</StaticActor>
<StateQuantum name="q_PlayMap2" actor="a_Mapanim2" state="play" wait="true"/>
<StateQuantum name="q_Map2None" actor="a_Mapanim2" state="none" wait="false"/>
<MoveActorQuantum name="qs_Skal" actor="a_Mapanim2" terrain="t_map"/>
<MoveActorQuantum name="qh_Skal" actor="a_Mapanim2"/>

<StaticActor name="a_Kop" state="stop" terrain="t_map" x="140" y="1395" z="1000">
	<State name="stop" face="af_Kop"/>
</StaticActor>
<StaticActor name="a_Skal" state="stop" terrain="t_map" x="265" y="1400" z="1000">
	<State name="stop" face="af_Skal"/>
</StaticActor>

<!-- Prepare Map -->
<PrepareQuantum name="qp_Map1" object="af_Map" prepare="true"/>
<PrepareQuantum name="qu_Map1" object="af_Map" prepare="false"/>
<PrepareQuantum name="qp_Map2" object="af_Mapanim" prepare="true"/>
<PrepareQuantum name="qu_Map2" object="af_Mapanim" prepare="false"/>
<PrepareQuantum name="qp_Map3" object="af_Kop" prepare="true"/>
<PrepareQuantum name="qu_Map3" object="af_Kop" prepare="false"/>
<PrepareQuantum name="qp_Map4" object="af_Skal" prepare="true"/>
<PrepareQuantum name="qu_Map4" object="af_Skal" prepare="false"/>
<PrepareQuantum name="qp_Map5" object="af_Mapanim2" prepare="true"/>
<PrepareQuantum name="qu_Map5" object="af_Mapanim2" prepare="false"/>



<!-- Actors -->
<Text name="a_Gissur_acc" terrain="t_Corners" text=" " color="white" hilite="false"/>

<!-- Bls 2 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_TilHamingjuMed" file="\sidaskiA\Media\gissur\tilhamiA.wav" >
	<Sentence text="Til hamingju með það." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_TilHamingjuMed" object="m_TilHamingjuMed" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HaEg" file="\sidaskiA\Media\gissur\haeg.wav" >
	<Sentence text="Ha! Ég?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HaEg" object="m_HaEg" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_JaHeldurduThad" file="\sidaskiA\Media\gissur\jahelduA.wav" >
	<Sentence text="Já, heldurðu það?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_JaHeldurduThad" object="m_JaHeldurduThad" prepare="false"/>

<!-- Bls 3 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_OddurAf" file="\sidaskiA\Media\gissur\odduraf.wav" >
	<Sentence text="Oddur! Af hverju þýddir þú Nýja testamentið á íslensku?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_OddurAf" object="m_OddurAf" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HvernigForum" file="\sidaskiA\Media\gissur\hvernigA.wav" >
	<Sentence text="Hvernig förum við að því að koma á lútherskum sið á Íslandi?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HvernigForum" object="m_HvernigForum" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HvadEigumVid" file="\sidaskiA\Media\gissur\hvadeigA.wav" >
	<Sentence text="Hvað eigum við að gera við Ögmund?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HvadEigumVid" object="m_HvadEigumVid" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_AfHverjuErLutherstru" file="\sidaskiA\Media\gissur\afhverjA.wav" >
	<Sentence text="Af hverju er lútherstrú ekki komin á nú þegar ..." time="0"/>
	<Sentence text="... fyrst Kristján konungur hefur skipað svo fyrir?" time="3250"/></SpeechActorMouth>
<PrepareQuantum name="qu_AfHverjuErLutherstru" object="m_AfHverjuErLutherstru" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgErBuinnAd" file="\sidaskiA\Media\gissur\egerbuiA.wav" >
	<Sentence text="Ég er búinn að gleyma af hverju Marteinn Lúther vill banna helga muni." time="0"/>
	<Sentence text="Getur þú nokkuð hresst upp á minni mitt?" time="4700"/> </SpeechActorMouth>
<PrepareQuantum name="qu_EgErBuinnAd" object="m_EgErBuinnAd" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HverErThessiMarteinn" file="\sidaskiA\Media\gissur\hverertA.wav" >
	<Sentence text="Hver er þessi Marteinn Lúther?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HverErThessiMarteinn" object="m_HverErThessiMarteinn" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HvadaArEr" file="\sidaskiA\Media\gissur\hvadaarA.wav" >
	<Sentence text="Hvaða ár er eiginlega?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HvadaArEr" object="m_HvadaArEr" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_JaAudvitad" file="\sidaskiA\Media\gissur\jaaudviA.wav" >
	<Sentence text="Já, auðvitað." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_JaAudvitad" object="m_JaAudvitad" prepare="false"/>

<!-- Bls 4 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_UhhNeiEg" file="\sidaskiA\Media\gissur\uhhneieg.wav" >
	<Sentence text="Nei! Ég man það eiginlega ekki." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_UhhNeiEg" object="m_UhhNeiEg" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_AdSjalfsogduMan" file="\sidaskiA\Media\gissur\adsjalfA.wav" >
	<Sentence text="Að sjálfsögðu man ég allt sem við lærðum í Þýskalandi!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_AdSjalfsogduMan" object="m_AdSjalfsogduMan" prepare="false"/>

<!-- bls 5 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_BaraVel" file="\sidaskiA\Media\gissur\baravel.wav" >
	<Sentence text="Bara vel." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_BaraVel" object="m_BaraVel" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_JaEgGeri" file="\sidaskiA\Media\gissur\jaeggeri.wav" >
	<Sentence text="Já, ég geri það kannski." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_JaEgGeri" object="m_JaEgGeri" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_VertuSaell" file="\sidaskiA\Media\gissur\vertusaA.wav" >
	<Sentence text="Vertu sæll!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_VertuSaell" object="m_VertuSaell" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_KomduSaelKona" file="\sidaskiA\Media\gissur\komdusaA.wav" >
	<Sentence text="Komdu sæl, kona góð." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_KomduSaelKona" object="m_KomduSaelKona" prepare="false"/>

<!-- bls 6 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_GeturThuSagt" file="\sidaskiA\Media\gissur\geturthA.wav" >
	<Sentence text="Getur þú sagt mér eitthvað um hagi Ögmundar?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_GeturThuSagt" object="m_GeturThuSagt" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HvadErtThu" file="\sidaskiA\Media\gissur\hvadertA.wav" >
	<Sentence text="Hvað ert þú að gera hér?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HvadErtThu" object="m_HvadErtThu" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_UhhHaFyrirgefdu" file="\sidaskiA\Media\gissur\uhhhafyA.wav" >
	<Sentence text="Ha! Fyrirgefðu ég missti athyglina." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_UhhHaFyrirgefdu" object="m_UhhHaFyrirgefdu" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HaHvadSagdirdu" file="\sidaskiA\Media\gissur\hahvadsA.wav" >
	<Sentence text="Ha! Hvað sagðirðu? Sofnaði ég óvart?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HaHvadSagdirdu" object="m_HaHvadSagdirdu" prepare="false"/>

<!-- bls 7 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_UmmhhJa" file="\sidaskiA\Media\gissur\ummhhja.wav" >
	<Sentence text="Já!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_UmmhhJa" object="m_UmmhhJa" prepare="false"/>

<!-- bls 8 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_EdlilegaTharSem" file="\sidaskiA\Media\gissur\edlilegA.wav" >
	<Sentence text="Eðlilega, þar sem hann er kaþólskur." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_EdlilegaTharSem" object="m_EdlilegaTharSem" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_NeiAllsEnga" file="\sidaskiA\Media\gissur\neiallsA.wav" >
	<Sentence text="Nei! Alls enga." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_NeiAllsEnga" object="m_NeiAllsEnga" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_UmmmhEgHeld" file="\sidaskiA\Media\gissur\ummmhegA.wav" >
	<Sentence text="Ég held að hann vilji fá mig dæmdan frá embætti." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_UmmmhEgHeld" object="m_UmmmhEgHeld" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HannGaetiReynt" file="\sidaskiA\Media\gissur\hanngaeA.wav" >
	<Sentence text="Hann gæti reynt að kitla mig!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HannGaetiReynt" object="m_HannGaetiReynt" prepare="false"/>

<!-- bls 9 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_NeiEnEgErAd" file="\sidaskiA\Media\gissur\neienegA.wav" >
	<Sentence text="Nei, en ég er að vinna í málinu." time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_NeiEnEgErAd" object="m_NeiEnEgErAd" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_KomduSaellHver" file="\sidaskiA\Media\gissur\komdusaB.wav" >
	<Sentence text="Komdu sæll! Hver ert þú?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_KomduSaellHver" object="m_KomduSaellHver" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_KomduSaellVinnumadur" file="\sidaskiA\Media\gissur\komdusaC.wav" >
	<Sentence text="Komdu sæll!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_KomduSaellVinnumadur" object="m_KomduSaellVinnumadur" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_TaktuVidThessumPeningum" file="\sidaskiA\Media\gissur\taktuviA.wav" >
	<Sentence text="Taktu við þessum peningum." time="0"/>
	<Sentence text="Þú hefur unnið fyrir þeim!" time="1547"/> </SpeechActorMouth>
<PrepareQuantum name="qu_TaktuVidThessumPeningum" object="m_TaktuVidThessumPeningum" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HvernigLidurTher" file="\sidaskiA\Media\gissur\hvernigB.wav" >
	<Sentence text="Hvernig líður þér hérna í Skálholti?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HvernigLidurTher" object="m_HvernigLidurTher" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_AfHverjuStendur" file="\sidaskiA\Media\gissur\afhverjB.wav" >
	<Sentence text="Af hverju stendur þú bara hér?" time="0"/>
	<Sentence text="Hefur þú ekkert þarfara að gera?" time="2250"/> </SpeechActorMouth>
<PrepareQuantum name="qu_AfHverjuStendur" object="m_AfHverjuStendur" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_MaEgNokkudSja" file="\sidaskiA\Media\gissur\maegnokA.wav" >
	<Sentence text="Má ég nokkuð sjá bréfið til Jóns Arasonar?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_MaEgNokkudSja" object="m_MaEgNokkudSja" prepare="false"/>

<!-- bls 10 -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgKomstYfirThettaBref" file="\sidaskiA\Media\gissur\egkomstA.wav" >
	<Sentence text="Ég komst yfir þetta bréf frá Ögmundi til Jóns Arasonar Hólabiskups ..." time="0"/>
	<Sentence text="... þar sem Ögmundur er að kvarta yfir því ..." time="4100"/>
	<Sentence text="... að ég hafi tekið munina úr kirkjunni." time="6150"/>
	<Sentence text="Hann er greinilega að safna gögnum ..." time="8950"/>
	<Sentence text="... til að fá mig dæmdan frá embætti." time="10350"/> </SpeechActorMouth>
<PrepareQuantum name="qu_EgKomstYfirThettaBref" object="m_EgKomstYfirThettaBref" prepare="false"/>

<!-- Gissur við Kristófer Hvítfeld í Kópavogi bls 11 og 12-->
<SpeechActorMouth acc="a_Gissur_acc" name="m_SaellOgBlessadurHerra" file="\sidaskiA\Media\gissur\saellogA.wav" >
	<Sentence text="Sæll og blessaður, herra Kristófer hvítfeldur, ..." time="0"/>
	<Sentence text="... og þakka þér fyrir að bera mér kveðju konungs." time="4250"/> </SpeechActorMouth>
<PrepareQuantum name="qu_SaellOgBlessadurHerra" object="m_SaellOgBlessadurHerra" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_TilHamingjuMedHirdstjora" file="\sidaskiA\Media\gissur\tilhamiB.wav" >
	<Sentence text="Til hamingju með hirðstjóraembættið, herra Kristófer!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_TilHamingjuMedHirdstjora" object="m_TilHamingjuMedHirdstjora" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HvernigGekkSiglingin" file="\sidaskiA\Media\gissur\hvernigC.wav" >
	<Sentence text="Hvernig gekk siglingin frá Danmörku?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HvernigGekkSiglingin" object="m_HvernigGekkSiglingin" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_MikidHefEgBedidLengi" file="\sidaskiA\Media\gissur\mikidheA.wav" >
	<Sentence text="Mikið hef ég beðið lengi eftir komu þinni." time="0"/>
	<Sentence text="Ég þarf fulltingi þitt til að koma á ..." time="3600"/>
	<Sentence text="... lútherskri kirkjuskipan Kristjáns, konungs vors." time="5730"/> </SpeechActorMouth>
<PrepareQuantum name="qu_MikidHefEgBedidLengi" object="m_MikidHefEgBedidLengi" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_JaEgHeldAdHann" file="\sidaskiA\Media\gissur\jaeghelA.wav" >
	<Sentence text="Já, ég held að hann sé staddur í Reykjavík að skoða hveri!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_JaEgHeldAdHann" object="m_JaEgHeldAdHann" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ErHannEkkiBara" file="\sidaskiA\Media\gissur\erhanneA.wav" >
	<Sentence text="Er hann ekki bara heima hjá sér í Skálholti?" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_ErHannEkkiBara" object="m_ErHannEkkiBara" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HannGaetiVeridHja" file="\sidaskiA\Media\gissur\hanngaeB.wav" >
	<Sentence text="Hann gæti verið hjá systur sinni á Hjalla í Ölfusi!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HannGaetiVeridHja" object="m_HannGaetiVeridHja" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ErHannEkkiHerI" file="\sidaskiA\Media\gissur\erhanneB.wav" >
	<Sentence text="Er hann ekki hér í Kópavogi?" time="0"/>
	<Sentence text="Þú hefur ekki rekist á hann hér?" time="2650"/> </SpeechActorMouth>
<PrepareQuantum name="qu_ErHannEkkiHerI" object="m_ErHannEkkiHerI" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HannErOrugglegaHja" file="\sidaskiA\Media\gissur\hanneroA.wav" >
	<Sentence text="Hann er örugglega hjá augnlækni!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HannErOrugglegaHja" object="m_HannErOrugglegaHja" prepare="false"/>

<SpeechActorMouth acc="a_Gissur_acc" name="m_Sporddreki" file="\sidaskiA\Media\gissur\sporddrA.wav" >
	<Sentence text="Og þeim var boðið að deyða þá." time="0"/>
	<Sentence text="Þeim svíður undan sporðdreka ..." time="2980"/>
	<Sentence text="... og munu dauðans leita, ..." time="5400"/>
	<Sentence text="... finna hann og deyja." time="7200"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Sporddreki" object="m_Sporddreki" prepare="false"/>

<!-- Bless -->
<SpeechActorMouth acc="a_Gissur_acc" name="m_Bless" file="\sidaskiA\Media\gissur\bless.wav" >
	<Sentence text="Vertu Blessuð!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless" object="m_Bless" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Bless2" file="\common\Media\bless\bless2.wav" >
	<Sentence text="Mér er ekki til setunnar boðið!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless2" object="m_Bless2" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Bless3" file="\common\Media\bless\bless3.wav" >
	<Sentence text="Ég þarf að þjóta!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless3" object="m_Bless3" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Bless4" file="\common\Media\bless\bless4.wav" >
	<Sentence text="Það var gaman að tala við þig!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless4" object="m_Bless4" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Bless5" file="\common\Media\bless\bless5.wav" >
	<Sentence text="Við þyrftum endilega að borða hádegismat saman einhvern tímann ..." time="0"/>
	<Sentence text="... en því miður er ég á hraðferð núna!" time="3200"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless5" object="m_Bless5" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Bless6" file="\common\Media\bless\bless6.wav" >
	<Sentence text="Sjáumst síðar!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless6" object="m_Bless6" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Bless1" file="\common\Media\bless\bless1.wav" >
	<Sentence text="Bless!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless1" object="m_Bless1" prepare="false"/>

<SpeechActorMouth acc="a_Gissur_acc" name="m_HeyrduOddur" file="\sidaskiA\Media\gissur\HeyrduOA.wav" >
	<Sentence text="Heyrðu Oddur!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_HeyrduOddur" object="m_HeyrduOddur" prepare="false"/>
<SpeechActorMouth acc="a_Gissur_acc" name="m_SaellOgBlessadurHerra2" file="\sidaskiA\Media\gissur\saellogB.wav" >
	<Sentence text="Sæll og blessaður, herra Kristófer hvítfeldur!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_SaellOgBlessadurHerra2" object="m_SaellOgBlessadurHerra2" prepare="false"/>

<SpeechActorMouth acc="a_Gissur_acc" name="m_EgVeitEkkert" file="\sidaskiA\Media\gissur\EgVeitEA.wav" >
	<Sentence text="Ég veit ekkert hver þetta er." time="0"/>
	<Sentence text=" Hann situr bara alltaf hér og þegir!" time="1550"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgNaeEkki" file="\sidaskiA\Media\gissur\EgNaeEkA.wav" >
	<Sentence text="Ég næ ekki askinum." time="0"/>
	<Sentence text="Ég er enginn risi." time="1750"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgAEkkertVantalad" file="\sidaskiA\Media\gissur\EgAEkkeA.wav" >
	<Sentence text="Ég á ekkert vantalað við Ögmund." time="0"/>
    <Sentence text="Hann er alltaf að skammast út í Martein Lúther." time="2300"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_NeiEgHeldAdEgSe" file="\sidaskiA\Media\gissur\NeiEgHeA.wav" >
	<Sentence text="Nei, ég held að ég sé ekkert að tala við ráðsmanninn." time="0"/>
	<Sentence text="Hann er einn af kaþólskum fylgismönnum Ögmundar." time="2820"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_NeiEgHefThadSterklega" file="\sidaskiA\Media\gissur\NeiEgHeB.wav" >
	<Sentence text="Nei, ég hef það sterklega á tilfinningunni ..." time="0"/>
	<Sentence text="... að ég þurfi að nota þennan poka." time="2700"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_NyjaTestamentidHans" file="\sidaskiA\Media\gissur\NyjaTesA.wav" >
	<Sentence text="Nýja Testamentið hans Odds er glæsilegt." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgFerNuEkki" file="\sidaskiA\Media\gissur\EgFerNuA.wav" >
	<Sentence text="Ég fer nú ekki að klippa Nýja testamentið hans Odds." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThessiGaldurHerEr" file="\sidaskiA\Media\gissur\ThessiGA.wav" >
	<Sentence text="Þessi galdur hér er áhugaverður." time="0"/>
	<Sentence text="Hann er til að kveða niður púka." time="2770"/>
	<Sentence text="Það er bara verst að blaðsíðan er sundurklippt." time="5000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_GodHugmynd" file="\sidaskiA\Media\gissur\GodHugmA.wav" >
	<Sentence text="Góð hugmynd." time="0"/>
	<Sentence text="Ég klippi blaðsíðuna með púkagaldrinum út úr galdrabókinni." time="1250"/>
	<Sentence text="Þá þarf ég ekki að burðast með bókina lengur." time="4750"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErBladsidan" file="\sidaskiA\Media\gissur\ThettaEA.wav" >
	<Sentence text="Þetta er blaðsíðan með púkagaldrinum ..." time="0"/>
	<Sentence text="... sem ég klippti út úr galdrabókinni." time="1740"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_SnidugtEgLaet" file="\sidaskiA\Media\gissur\SnidugtA.wav" >
	<Sentence text="Sniðugt.  Ég læt blaðsíðuna inn í Nýja Testamentið." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThadErHaegt" file="\sidaskiA\Media\gissur\ThadErHA.wav" >
	<Sentence text="Það er hægt að lesa þulu í gegnum götin á blaðsíðunni ..." time="0"/>
	<Sentence text="... sem ég setti inn í Nýja testamentið." time="3900"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgLaetPokann" file="\sidaskiA\Media\gissur\EgLaetPA.wav" >
	<Sentence text="Ég læt bara pokann liggja." time="0"/>
	<Sentence text="Ég þarf hann ekki meira." time="1370"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_AfHverjuAetti" file="\sidaskiA\Media\gissur\AfHverjC.wav" >
	<Sentence text="Af hverju ætti ég að gefa vinnumanninum peningana?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_SkuffanErLaest" file="\sidaskiA\Media\gissur\SkuffanA.wav" >
	<Sentence text="Skúffan er læst!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_LatumThadGottHeita" file="\sidaskiA\Media\gissur\LatumThA.wav" >
	<Sentence text="Látum það gott heita að sinni." time="0"/>
	<Sentence text="Ég vil ekki valda vandræðum." time="1710"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_PokinnErTrodfullur" file="\sidaskiA\Media\gissur\PokinnEA.wav" >
	<Sentence text="Pokinn er troðfullur af helgimunum." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_SaelirFelagar" file="\sidaskiA\Media\gissur\SaelirFA.wav" >
	<Sentence text="Sælir félagar!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErBref" file="\sidaskiA\Media\gissur\ThettaEB.wav" >
	<Sentence text="Þetta er bréf frá Ögmundi til Jóns Arasonar, Hólabiskups." time="0"/>
	<Sentence text="Ögmundur er greinilega að leita eftir fulltingi Jóns ..." time="3950"/>
	<Sentence text="... til að fá mig dæmdan frá embætti." time="6590"/>
	<Sentence text="Hann er meðal annars að kvarta undan því að ég tók helgimunina." time="8730"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_TomurPoki" file="\sidaskiA\Media\gissur\TomurPoA.wav" >
	<Sentence text="Hmm... Tómur poki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_PokinnErEkkiTomur" file="\sidaskiA\Media\gissur\PokinnEB.wav" >
	<Sentence text="Pokinn er ekki tómur lengur!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErBrytinn" file="\sidaskiA\Media\gissur\ThettaEC.wav" >
	<Sentence text="Þetta er brytinn á staðnum, hann Oddur Eyjólfsson." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErHannOddur" file="\sidaskiA\Media\gissur\ThettaED.wav" >
	<Sentence text="Þetta er hann Oddur Gottskálksson, skólafélagi minn." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThessiKollur" file="\sidaskiA\Media\gissur\ThessiKA.wav" >
	<Sentence text="Þessi kollur er hrein völundarsmíði." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgHefEkkertAdGera" file="\sidaskiA\Media\gissur\EgHefEkA.wav" >
	<Sentence text="Ég hef ekkert að gera við þessar bækur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_SnidugtNuSeEg" file="\sidaskiA\Media\gissur\SnidugtB.wav" >
	<Sentence text="Sniðugt! Nú sé ég hvað er í askinum." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaEruFallegOg" file="\sidaskiA\Media\gissur\ThettaEE.wav" >
	<Sentence text="Þetta eru falleg og nýtískuleg skæri." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaEruOskop" file="\sidaskiA\Media\gissur\ThettaEF.wav" >
	<Sentence text="Þetta eru ósköp venjulegar tölur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_NalOgTvinni" file="\sidaskiA\Media\gissur\NalOgTvA.wav" >
	<Sentence text="Nál og tvinni." time="0"/>
	<Sentence text="Nú get ég saumað allt ..." time="3000"/>
	<Sentence text="... sem mig hefur alltaf dreymt um að sauma." time="4320"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaEruMiklirPeningar" file="\sidaskiA\Media\gissur\ThettaEG.wav" >
	<Sentence text="Vá! Þetta eru miklir peningar." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErFallegurAskur" file="\sidaskiA\Media\gissur\ThettaEH.wav" >
	<Sentence text="Þetta er fallegur askur." time="0"/>
	<Sentence text="Hvað ætli sé eiginlega í honum?" time="2100"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_KomidThidSaelir" file="\sidaskiA\Media\gissur\KomidThA.wav" >
	<Sentence text="Komið þið sælir!" time="0"/>
	<Sentence text="Ég heiti Hjalti, að ég held." time="1150"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ASkiltinuStendur" file="\sidaskiA\Media\gissur\ASkiltiA.wav" >
	<Sentence text="Á skiltinu stendur Kópavogur" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThadErEitthvadDularfullt" file="\sidaskiA\Media\gissur\ThadErEA.wav" >
	<Sentence text="Það er eitthvað dularfullt við þennan krossfisk!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErStyttaAfEngli" file="\sidaskiA\Media\gissur\ThettaEI.wav" >
	<Sentence text="Þetta er stytta af engli." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErKaleikur" file="\sidaskiA\Media\gissur\thettaeJ.wav" >
	<Sentence text="Þetta er kaleikur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErBaraOskopVenjulegurKertastjaki" file="\sidaskiA\Media\gissur\ThettaEK.wav" >
	<Sentence text="Þetta er bara ósköp venjulegur kertastjaki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErMyndAf" file="\sidaskiA\Media\gissur\ThettaEL.wav" >
	<Sentence text="Þetta er mynd af Maríu mey!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErRadsmadurinn" file="\sidaskiA\Media\gissur\ThettaEM.wav" >
	<Sentence text="Þetta er ráðsmaðurinn í Skálholti." time="0"/>
	<Sentence text="Hann er kaþólskur!" time="2280"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_KonanErAdBidjast" file="\sidaskiA\Media\gissur\KonanErA.wav" >
	<Sentence text="Konan er að biðjast fyrir." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_TharnaStendurOgmundur" file="\sidaskiA\Media\gissur\TharnaSA.wav" >
	<Sentence text="Þarna stendur Ögmundur gamli!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_FlotturLykill" file="\sidaskiA\Media\gissur\FlotturA.wav" >
	<Sentence text="Flottur lykill!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_SkuffanOpnadist" file="\sidaskiA\Media\gissur\SkuffanB.wav" >
	<Sentence text="Skúffan opnaðist." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_SkuffanErNuLaest" file="\sidaskiA\Media\gissur\SkuffanC.wav" >
	<Sentence text="Skúffan er nú læst." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_HvadErThessiOfrynilegi" file="\sidaskiA\Media\gissur\HvadErTB.wav" >
	<Sentence text="Hvað er þessi ófrýnilegi púki ..." time="0"/>
	<Sentence text="... eiginlega að gera undir rúminu mínu?" time="2150"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_EgErFeginnAdVeraLaus" file="\sidaskiA\Media\gissur\EgErFegA.wav" >
	<Sentence text="Úff! Ég er feginn að vera laus við þennan púka!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_VinnumadurinnVirdist" file="\sidaskiA\Media\gissur\VinnumaA.wav" >
	<Sentence text="Vinnumaðurinn virðist vera nýbúinn ..." time="0"/>
	<Sentence text="... að grafa eitthvað niður í jörðina!" time="1600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_MikidEruMenn" file="\sidaskiA\Media\gissur\MikidErA.wav" >
	<Sentence text="Mikið eru menn hirðstjóra glaðir að sjá!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_ThettaErNyrHirdstjori" file="\sidaskiA\Media\gissur\ThettaEN.wav" >
	<Sentence text="Þetta er nýr hirðstjóri konungs á Íslandi, ..." time="0"/>
	<Sentence text="... herra Kristófer hvítfeldur." time="2950"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Gissur_acc" name="m_Take1" file="\common\Media\take\take1.wav" >
	<Sentence text="Láttu ekki svona!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take2" file="\common\Media\take\take2.wav" >
	<Sentence text="Ég gæti aldrei haldið á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take3" file="\common\Media\take\take3.wav" >
	<Sentence text="Ég gæti aldrei haldið á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take4" file="\common\Media\take\take4.wav" >
	<Sentence text="Ekki þessa vitleysu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take5" file="\common\Media\take\take5.wav" >
	<Sentence text="Gengur ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take6" file="\common\Media\take\take6.wav" >
	<Sentence text="Ég hef engan áhuga á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take7" file="\common\Media\take\take7.wav" >
	<Sentence text="Nei! Ég þarf þetta ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take8" file="\common\Media\take\take8.wav" >
	<Sentence text="Nei, hættu nú alveg!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take9" file="\common\Media\take\take9.wav" >
	<Sentence text="Nei! Þetta þarf ég ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take10" file="\common\Media\take\take10.wav" >
	<Sentence text="Nei! Þetta þarf ég ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take11" file="\common\Media\take\take11.wav" >
	<Sentence text="Það væri gaman að eiga þetta." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take12" file="\common\Media\take\take12.wav" >
	<Sentence text="Til hvers ætti ég að nota þennan hlut?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Take13" file="\common\Media\take\take13.wav" >
	<Sentence text="Til hvers ætti ég að nota þennan hlut?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Gissur_acc" name="m_Look1" file="\common\Media\look\look1.wav" >
	<Sentence text="Veistu ekki hvað þetta er?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Look2" file="\common\Media\look\look2.wav" >
	<Sentence text="Mikið er þetta fallegt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Look3" file="\common\Media\look\look3.wav" >
	<Sentence text="Það væri gaman að eiga þetta!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Look4" file="\common\Media\look\look4.wav" >
	<Sentence text="Þetta er nú ansi fallegt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Look5" file="\common\Media\look\look5.wav" >
	<Sentence text="Veistu ekki hvað þetta er?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Look6" file="\common\Media\look\look6.wav" >
	<Sentence text="Ég hef engan áhuga á þessu!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Gissur_acc" name="m_Talk1" file="\common\Media\talk\talk1.wav" >
	<Sentence text="Ekki þessa vitleysu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Talk2" file="\common\Media\talk\talk2.wav" >
	<Sentence text="Láttu ekki svona!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Talk3" file="\common\Media\talk\talk3.wav" >
	<Sentence text="Þetta er líklega versta hugmynd ..." time="0"/>
	<Sentence text="... sem ég hef nokkru sinni heyrt!" time="2150"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Talk4" file="\common\Media\talk\talk4.wav" >
	<Sentence text="Nei, hættu nú alveg!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Talk5" file="\common\Media\talk\talk5.wav" >
	<Sentence text="Nei! Þetta gengur ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Talk6" file="\common\Media\talk\talk6.wav" >
	<Sentence text="Ég held að það sé kominn tími til að sumir ..." time="0"/>
	<Sentence text="... hætti að spila tölvuleiki." time="2280"/>
	<Sentence text="Ég á bara að gera tóma vitleysu!" time="4850"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Gissur_acc" name="m_Use1" file="\common\Media\use\use1.wav" >
	<Sentence text="Ég þarf ekki að nota þetta hér!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use2" file="\common\Media\use\use2.wav" >
	<Sentence text="Ekki vera að þessu rugli." time="0"/>
	<Sentence text="Ég er búinn að reyna þetta!" time="1720"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use3" file="\common\Media\use\use3.wav" >
	<Sentence text="Frábær hugmynd ..." time="0"/>
	<Sentence text="... eða nei, kannski ekki!" time="1350"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use4" file="\common\Media\use\use4.wav" >
	<Sentence text="Gengur ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use5" file="\common\Media\use\use5.wav" >
	<Sentence text="Nei! Þetta gengur ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use6" file="\common\Media\use\use6.wav" >
	<Sentence text="Ég held að það sé kominn tími til að sumir ..." time="0"/>
	<Sentence text="... hætti að spila tölvuleiki." time="2280"/>
	<Sentence text="Ég á bara að gera tóma vitleysu!" time="4850"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use7" file="\common\Media\use\use7.wav" >
	<Sentence text="Þetta er líklega versta hugmynd ..." time="0"/>
	<Sentence text="... sem ég hef nokkru sinni heyrt!" time="2150"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use8" file="\common\Media\use\use8.wav" >
	<Sentence text="Þetta tvennt gengur ekki saman!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Gissur_acc" name="m_Use9" file="\common\Media\use\use9.wav" >
	<Sentence text="Þetta tvennt passar ekki saman!" time="0"/> </SpeechActorMouth>

<!-- Actorface -->
<StaticActorFace name="af_Gissur_Stop" file="\SidaskiA\AnimatiA\gissur\stop" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Right" repeat="-1" file="\SidaskiA\AnimatiA\gissur\right" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Left" repeat="-1" file="\SidaskiA\AnimatiA\gissur\left" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Front" repeat="-1" file="\SidaskiA\AnimatiA\gissur\front" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Back" repeat="-1" file="\SidaskiA\AnimatiA\gissur\back" count="6" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Stop2right" repeat="1" file="\SidaskiA\AnimatiA\gissur\stop2riA" count="1" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Stop2left" repeat="1" file="\SidaskiA\AnimatiA\gissur\stop2leA" count="1" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Stop2back" repeat="1" file="\SidaskiA\AnimatiA\gissur\stop2baA" count="1" prepare="true"/>
<CelledAnimated2DActorFace name="af_Gissur_Talk" repeat="-1" file="\SidaskiA\AnimatiA\gissur\talk" count="3" prepare="true" speed="150" xoffset="-20" yoffset="0" random="true"/>

<CelledAnimated2DActorFace name="af_Gissur_Stigur" repeat="1" file="\SidaskiA\AnimatiA\gissur\stiga" count="12" prepare="false" xoffset="-80" yoffset="-70" speed="225"/>
<StaticActorFace name="af_Gissur_StopStigur" file="\SidaskiA\AnimatiA\gissur\stopstiA" prepare="false" xoffset="-80" yoffset="-70"/>
<CelledAnimated2DActorFace name="af_Gissur_Why" repeat="1" file="\SidaskiA\AnimatiA\gissur\why" count="3" prepare="true" xoffset="-38" yoffset="0" speed="225"/>
<CelledAnimated2DActorFace name="af_Gissur_Yppir" repeat="1" file="\SidaskiA\AnimatiA\gissur\yppir" count="3" prepare="true" xoffset="-40" yoffset="0" speed="225"/>
<CelledAnimated2DActorFace name="af_Gissur_KPuka1" repeat="1" file="\SidaskiA\AnimatiA\gissur\kpuka1" count="6" prepare="false" xoffset="-14" yoffset="0" speed="225"/>
<CelledAnimated2DActorFace name="af_Gissur_KPuka2" repeat="-1" file="\SidaskiA\AnimatiA\gissur\kpuka2" count="4" prepare="false" xoffset="-14" yoffset="0" speed="225" random="true"/>
<CelledAnimated2DActorFace name="af_Gissur_KPuka3" repeat="1" file="\SidaskiA\AnimatiA\gissur\kpuka3" count="6" prepare="false" xoffset="-14" yoffset="0" speed="225"/>
<CelledAnimated2DActorFace name="af_Gissur_Hverfur" repeat="1" file="\SidaskiA\AnimatiA\gissur\hverfur" count="6" prepare="false" xoffset="-8" yoffset="0" speed="450"/>
<CelledAnimated2DActorFace name="af_Gissur_TekurStein" repeat="1" file="\SidaskiA\AnimatiA\gissur\tekurstA" count="6" prepare="false" xoffset="-8" yoffset="0" speed="225"/>
<CelledAnimated2DActorFace name="af_Gissur_StopStein" repeat="2" file="\SidaskiA\AnimatiA\gissur\stopsteA" count="1" prepare="false" speed="350"/>

<Pseudo3DCollisionBox name="cb_Gissur" x="100" y="30" z="359"/>

<MovingActor name="a_Gissur" state="stop" terrain="t_HjaBrytal" x="370" y="470" z="1" scaling="dynamic" save="true" speed="100" random="true">
	<State name="stop" face="af_Gissur_Stop" collisionbox="cb_Gissur"/>
	<State name="right" face="af_Gissur_Right" collisionbox="cb_Gissur"/>
	<State name="left" face="af_Gissur_Left" collisionbox="cb_Gissur"/>
	<State name="front" face="af_Gissur_Front" collisionbox="cb_Gissur"/>
	<State name="back" face="af_Gissur_Back" collisionbox="cb_Gissur"/>
	<State name="stop2right" face="af_Gissur_Stop2right" collisionbox="cb_Gissur"/>
	<State name="stop2left" face="af_Gissur_Stop2left" collisionbox="cb_Gissur"/>
	<State name="stop2back" face="af_Gissur_Stop2back" collisionbox="cb_Gissur"/>

	<State name="stigur" face="af_Gissur_Stigur" collisionbox="cb_Gissur"/>
	<State name="why" face="af_Gissur_Why" collisionbox="cb_Gissur"/>
	<State name="yppir" face="af_Gissur_Yppir" collisionbox="cb_Gissur"/>
	<State name="kpuka1" face="af_Gissur_KPuka1" collisionbox="cb_Gissur"/>
	<State name="kpuka3" face="af_Gissur_KPuka3" collisionbox="cb_Gissur"/>
	<State name="hverfur" face="af_Gissur_Hverfur" collisionbox="cb_Gissur"/>
	<State name="tekurstein" face="af_Gissur_TekurStein" collisionbox="cb_Gissur"/>
	<State name="stopstein" face="af_Gissur_StopStein" collisionbox="cb_Gissur"/>
	<State name="stopstigur" face="af_Gissur_StopStigur" collisionbox="cb_Gissur" mouth="m_SnidugtNuSeEg"/>
	<State name="stopstigur2" face="af_Gissur_StopStigur" collisionbox="cb_Gissur" mouth="m_EgNaeEkki"/>

<!-- setningar -->

	<!-- bls 2 -->

	<State name="Sporddreki" face="af_Gissur_KPuka2" mouth="m_Sporddreki" collisionbox="cb_Gissur"/>

	<State name="TilHamingjuMed" face="af_Gissur_Talk" mouth="m_TilHamingjuMed" collisionbox="cb_Gissur"/>
	<State name="HaEg" face="af_Gissur_Talk" mouth="m_HaEg" collisionbox="cb_Gissur"/>
	<State name="JaHeldurduThad" face="af_Gissur_Talk" mouth="m_JaHeldurduThad" collisionbox="cb_Gissur"/>
	<State name="OddurAf" face="af_Gissur_Talk" mouth="m_OddurAf" collisionbox="cb_Gissur"/>
	<State name="HvernigForum" face="af_Gissur_Talk" mouth="m_HvernigForum" collisionbox="cb_Gissur"/>
    <State name="HvadEigumVid" face="af_Gissur_Talk" mouth="m_HvadEigumVid" collisionbox="cb_Gissur"/>
    <State name="AfHverjuErLutherstru" face="af_Gissur_Talk" mouth="m_AfHverjuErLutherstru" collisionbox="cb_Gissur"/>
    <State name="EgErBuinnAd" face="af_Gissur_Talk" mouth="m_EgErBuinnAd" collisionbox="cb_Gissur"/>
    <State name="HverErThessiMarteinn" face="af_Gissur_Talk" mouth="m_HverErThessiMarteinn" collisionbox="cb_Gissur"/>
    <State name="HvadaArEr" face="af_Gissur_Talk" mouth="m_HvadaArEr" collisionbox="cb_Gissur"/>
    <State name="UhhNeiEg" face="af_Gissur_Talk" mouth="m_UhhNeiEg" collisionbox="cb_Gissur"/>
    <State name="AdSjalfsogduMan" face="af_Gissur_Talk" mouth="m_AdSjalfsogduMan" collisionbox="cb_Gissur"/>
	<State name="JaAudvitad" face="af_Gissur_Talk" mouth="m_JaAudvitad" collisionbox="cb_Gissur"/>

	<!-- bls8 -->

	<State name="EdlilegaTharSem" face="af_Gissur_Talk" mouth="m_EdlilegaTharSem" collisionbox="cb_Gissur"/>

	<!-- Gissur við Odd bls 8 -->

	<State name="NeiAllsEnga" face="af_Gissur_Talk" mouth="m_NeiAllsEnga" collisionbox="cb_Gissur"/>
	<State name="UmmmhEgHeld" face="af_Gissur_Talk" mouth="m_UmmmhEgHeld" collisionbox="cb_Gissur"/>
	<State name="HannGaetiReynt" face="af_Gissur_Talk" mouth="m_HannGaetiReynt" collisionbox="cb_Gissur"/>

	<State name="BaraVel" face="af_Gissur_Talk" mouth="m_BaraVel" collisionbox="cb_Gissur"/>
	<State name="JaEgGeri" face="af_Gissur_Talk" mouth="m_JaEgGeri" collisionbox="cb_Gissur"/>
	<State name="VertuSaell" face="af_Gissur_Talk" mouth="m_VertuSaell" collisionbox="cb_Gissur"/>
	<State name="UmmhhJa" face="af_Gissur_Talk" mouth="m_UmmhhJa" collisionbox="cb_Gissur"/>

	<!-- Kona í Kirkju bls 5 og 6 -->

	<State name="KomduSaelKona" face="af_Gissur_Talk" mouth="m_KomduSaelKona" collisionbox="cb_Gissur"/>
	<State name="GeturThuSagt" face="af_Gissur_Talk" mouth="m_GeturThuSagt" collisionbox="cb_Gissur"/>
	<State name="HvadErtThu" face="af_Gissur_Talk" mouth="m_HvadErtThu" collisionbox="cb_Gissur"/>
	<State name="UhhHaFyrirgefdu" face="af_Gissur_Talk" mouth="m_UhhHaFyrirgefdu" collisionbox="cb_Gissur"/>
	<State name="HaHvadSagdirdu" face="af_Gissur_Talk" mouth="m_HaHvadSagdirdu" collisionbox="cb_Gissur"/>

	<!-- eitthvað -->

	<State name="NeiEnEgErAd" face="af_Gissur_Talk" mouth="m_NeiEnEgErAd" collisionbox="cb_Gissur"/>
	<State name="EgKomstYfirThettaBref" face="af_Gissur_Talk" mouth="m_EgKomstYfirThettaBref" collisionbox="cb_Gissur"/>

	<!-- Vinnumaður -->

	<State name="KomduSaellHver" face="af_Gissur_Talk" mouth="m_KomduSaellHver" collisionbox="cb_Gissur"/>
	<State name="KomduSaellVinnumadur" face="af_Gissur_Talk" mouth="m_KomduSaellVinnumadur" collisionbox="cb_Gissur"/>
	<State name="TaktuVidThessumPeningum" face="af_Gissur_Talk" mouth="m_TaktuVidThessumPeningum" collisionbox="cb_Gissur"/>
	<State name="HvernigLidurTher" face="af_Gissur_Talk" mouth="m_HvernigLidurTher" collisionbox="cb_Gissur"/>
	<State name="AfHverjuStendur" face="af_Gissur_Talk" mouth="m_AfHverjuStendur" collisionbox="cb_Gissur"/>
	<State name="MaEgNokkudSja" face="af_Gissur_Talk" mouth="m_MaEgNokkudSja" collisionbox="cb_Gissur"/>

	<!-- Kristofer -->

	<State name="SaellOgBlessadurHerra" face="af_Gissur_Talk" mouth="m_SaellOgBlessadurHerra" collisionbox="cb_Gissur"/>
	<State name="TilHamingjuMedHirdstjora" face="af_Gissur_Talk" mouth="m_TilHamingjuMedHirdstjora" collisionbox="cb_Gissur"/>
	<State name="HvernigGekkSiglingin" face="af_Gissur_Talk" mouth="m_HvernigGekkSiglingin" collisionbox="cb_Gissur"/>
	<State name="MikidHefEgBedidLengi" face="af_Gissur_Talk" mouth="m_MikidHefEgBedidLengi" collisionbox="cb_Gissur"/>
	<State name="JaEgHeldAdHann" face="af_Gissur_Talk" mouth="m_JaEgHeldAdHann" collisionbox="cb_Gissur"/>
	<State name="ErHannEkkiBara" face="af_Gissur_Talk" mouth="m_ErHannEkkiBara" collisionbox="cb_Gissur"/>
	<State name="HannGaetiVeridHja" face="af_Gissur_Talk" mouth="m_HannGaetiVeridHja" collisionbox="cb_Gissur"/>
	<State name="ErHannEkkiHerI" face="af_Gissur_Talk" mouth="m_ErHannEkkiHerI" collisionbox="cb_Gissur"/>
	<State name="HannErOrugglegaHja" face="af_Gissur_Talk" mouth="m_HannErOrugglegaHja" collisionbox="cb_Gissur"/>

	<!-- Bless -->

	<State name="Bless" face="af_Gissur_Talk" mouth="m_Bless" collisionbox="cb_Gissur"/>
	<State name="Bless2" face="af_Gissur_Talk" mouth="m_Bless2" collisionbox="cb_Gissur"/>
	<State name="Bless3" face="af_Gissur_Talk" mouth="m_Bless3" collisionbox="cb_Gissur"/>
	<State name="Bless4" face="af_Gissur_Talk" mouth="m_Bless4" collisionbox="cb_Gissur"/>
	<State name="Bless5" face="af_Gissur_Talk" mouth="m_Bless5" collisionbox="cb_Gissur"/>
	<State name="Bless6" face="af_Gissur_Talk" mouth="m_Bless6" collisionbox="cb_Gissur"/>
	<State name="Bless1" face="af_Gissur_Talk" mouth="m_Bless1" collisionbox="cb_Gissur"/>

	<State name="Look1" face="af_Gissur_Talk" mouth="m_Look1" collisionbox="cb_Gissur"/>
	<State name="Look2" face="af_Gissur_Talk" mouth="m_Look2" collisionbox="cb_Gissur"/>
	<State name="Look3" face="af_Gissur_Talk" mouth="m_Look3" collisionbox="cb_Gissur"/>
	<State name="Look4" face="af_Gissur_Talk" mouth="m_Look4" collisionbox="cb_Gissur"/>
	<State name="Look5" face="af_Gissur_Talk" mouth="m_Look5" collisionbox="cb_Gissur"/>
	<State name="Look6" face="af_Gissur_Talk" mouth="m_Look6" collisionbox="cb_Gissur"/>

	<State name="Talk1" face="af_Gissur_Talk" mouth="m_Talk1" collisionbox="cb_Gissur"/>
	<State name="Talk2" face="af_Gissur_Talk" mouth="m_Talk2" collisionbox="cb_Gissur"/>
	<State name="Talk3" face="af_Gissur_Talk" mouth="m_Talk3" collisionbox="cb_Gissur"/>
	<State name="Talk4" face="af_Gissur_Talk" mouth="m_Talk4" collisionbox="cb_Gissur"/>
	<State name="Talk5" face="af_Gissur_Talk" mouth="m_Talk5" collisionbox="cb_Gissur"/>
	<State name="Talk6" face="af_Gissur_Talk" mouth="m_Talk6" collisionbox="cb_Gissur"/>

	<State name="Take1" face="af_Gissur_Talk" mouth="m_Take1" collisionbox="cb_Gissur"/>
	<State name="Take2" face="af_Gissur_Talk" mouth="m_Take2" collisionbox="cb_Gissur"/>
	<State name="Take3" face="af_Gissur_Talk" mouth="m_Take3" collisionbox="cb_Gissur"/>
	<State name="Take4" face="af_Gissur_Talk" mouth="m_Take4" collisionbox="cb_Gissur"/>
	<State name="Take5" face="af_Gissur_Talk" mouth="m_Take5" collisionbox="cb_Gissur"/>
	<State name="Take6" face="af_Gissur_Talk" mouth="m_Take6" collisionbox="cb_Gissur"/>
	<State name="Take7" face="af_Gissur_Talk" mouth="m_Take7" collisionbox="cb_Gissur"/>
	<State name="Take8" face="af_Gissur_Talk" mouth="m_Take8" collisionbox="cb_Gissur"/>
	<State name="Take9" face="af_Gissur_Talk" mouth="m_Take9" collisionbox="cb_Gissur"/>
	<State name="Take10" face="af_Gissur_Talk" mouth="m_Take10" collisionbox="cb_Gissur"/>
	<State name="Take11" face="af_Gissur_Talk" mouth="m_Take11" collisionbox="cb_Gissur"/>
	<State name="Take12" face="af_Gissur_Talk" mouth="m_Take12" collisionbox="cb_Gissur"/>
	<State name="Take13" face="af_Gissur_Talk" mouth="m_Take13" collisionbox="cb_Gissur"/>

	<State name="Use1" face="af_Gissur_Talk" mouth="m_Use1" collisionbox="cb_Gissur"/>
	<State name="Use2" face="af_Gissur_Talk" mouth="m_Use2" collisionbox="cb_Gissur"/>
	<State name="Use3" face="af_Gissur_Talk" mouth="m_Use3" collisionbox="cb_Gissur"/>
	<State name="Use4" face="af_Gissur_Talk" mouth="m_Use4" collisionbox="cb_Gissur"/>
	<State name="Use5" face="af_Gissur_Talk" mouth="m_Use5" collisionbox="cb_Gissur"/>
	<State name="Use6" face="af_Gissur_Talk" mouth="m_Use6" collisionbox="cb_Gissur"/>
	<State name="Use7" face="af_Gissur_Talk" mouth="m_Use7" collisionbox="cb_Gissur"/>
	<State name="Use8" face="af_Gissur_Talk" mouth="m_Use8" collisionbox="cb_Gissur"/>
	<State name="Use9" face="af_Gissur_Talk" mouth="m_Use9" collisionbox="cb_Gissur"/>

	<!-- Við ráðsmann -->

    <State name="HeyrduOddur" face="af_Gissur_Talk" mouth="m_HeyrduOddur" collisionbox="cb_Gissur"/>
    <State name="SaellOgBlessadurHerra2" face="af_Gissur_Talk" mouth="m_SaellOgBlessadurHerra2" collisionbox="cb_Gissur"/>

    <State name="EgVeitEkkert" face="af_Gissur_Talk" mouth="m_EgVeitEkkert" collisionbox="cb_Gissur"/>
    <State name="EgNaeEkki" face="af_Gissur_Talk" mouth="m_EgNaeEkki" collisionbox="cb_Gissur"/>
    <State name="EgAEkkertVantalad" face="af_Gissur_Talk" mouth="m_EgAEkkertVantalad" collisionbox="cb_Gissur"/>
    <State name="NeiEgHeldAdEgSe" face="af_Gissur_Talk" mouth="m_NeiEgHeldAdEgSe" collisionbox="cb_Gissur"/>
    <State name="NeiEgHefThadSterklega" face="af_Gissur_Talk" mouth="m_NeiEgHefThadSterklega" collisionbox="cb_Gissur"/>
    <State name="NyjaTestamentidHans" face="af_Gissur_Talk" mouth="m_NyjaTestamentidHans" collisionbox="cb_Gissur"/>
    <State name="EgFerNuEkki" face="af_Gissur_Talk" mouth="m_EgFerNuEkki" collisionbox="cb_Gissur"/>
    <State name="ThessiGaldurHerEr" face="af_Gissur_Talk" mouth="m_ThessiGaldurHerEr" collisionbox="cb_Gissur"/>
    <State name="GodHugmynd" face="af_Gissur_Talk" mouth="m_GodHugmynd" collisionbox="cb_Gissur"/>
    <State name="ThettaErBladsidan" face="af_Gissur_Talk" mouth="m_ThettaErBladsidan" collisionbox="cb_Gissur"/>
    <State name="SnidugtEgLaet" face="af_Gissur_Talk" mouth="m_SnidugtEgLaet" collisionbox="cb_Gissur"/>
    <State name="ThadErHaegt" face="af_Gissur_Talk" mouth="m_ThadErHaegt" collisionbox="cb_Gissur"/>
    <State name="EgLaetPokann" face="af_Gissur_Talk" mouth="m_EgLaetPokann" collisionbox="cb_Gissur"/>
    <State name="AfHverjuAetti" face="af_Gissur_Talk" mouth="m_AfHverjuAetti" collisionbox="cb_Gissur"/>
    <State name="SkuffanErLaest" face="af_Gissur_Talk" mouth="m_SkuffanErLaest" collisionbox="cb_Gissur"/>
    <State name="LatumThadGottHeita" face="af_Gissur_Talk" mouth="m_LatumThadGottHeita" collisionbox="cb_Gissur"/>
    <State name="PokinnErTrodfullur" face="af_Gissur_Talk" mouth="m_PokinnErTrodfullur" collisionbox="cb_Gissur"/>
    <State name="SaelirFelagar" face="af_Gissur_Talk" mouth="m_SaelirFelagar" collisionbox="cb_Gissur"/>
    <State name="ThettaErBref" face="af_Gissur_Talk" mouth="m_ThettaErBref" collisionbox="cb_Gissur"/>
    <State name="TomurPoki" face="af_Gissur_Talk" mouth="m_TomurPoki" collisionbox="cb_Gissur"/>
    <State name="PokinnErEkkiTomur" face="af_Gissur_Talk" mouth="m_PokinnErEkkiTomur" collisionbox="cb_Gissur"/>
    <State name="ThettaErBrytinn" face="af_Gissur_Talk" mouth="m_ThettaErBrytinn" collisionbox="cb_Gissur"/>
    <State name="ThettaErHannOddur" face="af_Gissur_Talk" mouth="m_ThettaErHannOddur" collisionbox="cb_Gissur"/>
    <State name="ThessiKollur" face="af_Gissur_Talk" mouth="m_ThessiKollur" collisionbox="cb_Gissur"/>
    <State name="EgHefEkkertAdGera" face="af_Gissur_Talk" mouth="m_EgHefEkkertAdGera" collisionbox="cb_Gissur"/>
    <State name="ThettaEruFallegOg" face="af_Gissur_Talk" mouth="m_ThettaEruFallegOg" collisionbox="cb_Gissur"/>
    <State name="ThettaEruOskop" face="af_Gissur_Talk" mouth="m_ThettaEruOskop" collisionbox="cb_Gissur"/>
    <State name="NalOgTvinni" face="af_Gissur_Talk" mouth="m_NalOgTvinni" collisionbox="cb_Gissur"/>
    <State name="ThettaEruMiklirPeningar" face="af_Gissur_Talk" mouth="m_ThettaEruMiklirPeningar" collisionbox="cb_Gissur"/>
    <State name="ThettaErFallegurAskur" face="af_Gissur_Talk" mouth="m_ThettaErFallegurAskur" collisionbox="cb_Gissur"/>
    <State name="KomidThidSaelir" face="af_Gissur_Talk" mouth="m_KomidThidSaelir" collisionbox="cb_Gissur"/>
    <State name="ASkiltinuStendur" face="af_Gissur_Talk" mouth="m_ASkiltinuStendur" collisionbox="cb_Gissur"/>
    <State name="ThadErEitthvadDularfullt" face="af_Gissur_Talk" mouth="m_ThadErEitthvadDularfullt" collisionbox="cb_Gissur"/>
    <State name="ThettaErStyttaAfEngli" face="af_Gissur_Talk" mouth="m_ThettaErStyttaAfEngli" collisionbox="cb_Gissur"/>
    <State name="ThettaErKaleikur" face="af_Gissur_Talk" mouth="m_ThettaErKaleikur" collisionbox="cb_Gissur"/>
    <State name="ThettaErBaraOskopVenjulegurKertastjaki" face="af_Gissur_Talk" mouth="m_ThettaErBaraOskopVenjulegurKertastjaki" collisionbox="cb_Gissur"/>
    <State name="ThettaErMyndAf" face="af_Gissur_Talk" mouth="m_ThettaErMyndAf" collisionbox="cb_Gissur"/>
    <State name="ThettaErRadsmadurinn" face="af_Gissur_Talk" mouth="m_ThettaErRadsmadurinn" collisionbox="cb_Gissur"/>
    <State name="KonanErAdBidjast" face="af_Gissur_Talk" mouth="m_KonanErAdBidjast" collisionbox="cb_Gissur"/>
    <State name="TharnaStendurOgmundur" face="af_Gissur_Talk" mouth="m_TharnaStendurOgmundur" collisionbox="cb_Gissur"/>
    <State name="FlotturLykill" face="af_Gissur_Talk" mouth="m_FlotturLykill" collisionbox="cb_Gissur"/>
    <State name="SkuffanOpnadist" face="af_Gissur_Talk" mouth="m_SkuffanOpnadist" collisionbox="cb_Gissur"/>
    <State name="SkuffanErNuLaest" face="af_Gissur_Talk" mouth="m_SkuffanErNuLaest" collisionbox="cb_Gissur"/>
    <State name="HvadErThessiOfrynilegi" face="af_Gissur_Talk" mouth="m_HvadErThessiOfrynilegi" collisionbox="cb_Gissur"/>
    <State name="EgErFeginnAdVeraLaus" face="af_Gissur_Talk" mouth="m_EgErFeginnAdVeraLaus" collisionbox="cb_Gissur"/>
    <State name="VinnumadurinnVirdist" face="af_Gissur_Talk" mouth="m_VinnumadurinnVirdist" collisionbox="cb_Gissur"/>
    <State name="MikidEruMenn" face="af_Gissur_Talk" mouth="m_MikidEruMenn" collisionbox="cb_Gissur"/>
    <State name="ThettaErNyrHirdstjori" face="af_Gissur_Talk" mouth="m_ThettaErNyrHirdstjori" collisionbox="cb_Gissur"/>
</MovingActor>
<ActorMoused actor="a_Gissur" listener="sc" moving=" " taking="Klappa mér" talking="Tala við sjálfan mig" thf="mig"/>

<!-- Quanta -->
<StateQuantum name="q_StopGissur" actor="a_Gissur" state="stop" wait="false"/>
<StopActorQuantum name="q_StoppGissur" actor="a_Gissur"/>

<StateQuantum name="q_GissurHverfur" actor="a_Gissur" state="hverfur" wait="true"/>
<StateQuantum name="q_GissurTekurStein" actor="a_Gissur" state="tekurstein" wait="true"/>
<StateQuantum name="q_GissurKPuka1" actor="a_Gissur" state="kpuka1" wait="true"/>
<StateQuantum name="q_GissurKPuka3" actor="a_Gissur" state="kpuka3" wait="true"/>
<StateQuantum name="q_GissurStopStein" actor="a_Gissur" state="stopstein" wait="true"/>
<StateQuantum name="q_GissurStopStigur" actor="a_Gissur" state="stopstigur" wait="true"/>
<StateQuantum name="q_GissurStopStigur2" actor="a_Gissur" state="stopstigur2" wait="true"/>
<StateQuantum name="q_GissurStigur" actor="a_Gissur" state="stigur" wait="true"/>
<StateQuantum name="q_GissurWhy" actor="a_Gissur" state="why" wait="true"/>
<StateQuantum name="q_GissurYppir" actor="a_Gissur" state="yppir" wait="true"/>

<StateQuantum name="q_GissurNone" actor="a_Gissur" state="none" wait="false"/>

<!-- Quanta for sentences -->

<StateQuantum name="q_Sporddreki" actor="a_Gissur" state="Sporddreki" wait="true"/>
<StateQuantum name="q_NeiEgHeldAd" actor="a_Gissur" state="NeiEgHeldAd" wait="true"/>
<StateQuantum name="q_EgVeitEkkert" actor="a_Gissur" state="EgVeitEkkert" wait="true"/>
<StateQuantum name="q_EgNaeEkki" actor="a_Gissur" state="EgNaeEkki" wait="true"/>
<StateQuantum name="q_EgAEkkertVantalad" actor="a_Gissur" state="EgAEkkertVantalad" wait="true"/>
<StateQuantum name="q_NeiEgHeldAdEgSe" actor="a_Gissur" state="NeiEgHeldAdEgSe" wait="true"/>
<StateQuantum name="q_NeiEgHefThadSterklega" actor="a_Gissur" state="NeiEgHefThadSterklega" wait="true"/>
<StateQuantum name="q_NyjaTestamentidHans" actor="a_Gissur" state="NyjaTestamentidHans" wait="true"/>
<StateQuantum name="q_EgFerNuEkki" actor="a_Gissur" state="EgFerNuEkki" wait="true"/>
<StateQuantum name="q_ThessiGaldurHerEr" actor="a_Gissur" state="ThessiGaldurHerEr" wait="true"/>
<StateQuantum name="q_GodHugmynd" actor="a_Gissur" state="GodHugmynd" wait="true"/>
<StateQuantum name="q_ThettaErBladsidan" actor="a_Gissur" state="ThettaErBladsidan" wait="true"/>
<StateQuantum name="q_SnidugtEgLaet" actor="a_Gissur" state="SnidugtEgLaet" wait="true"/>
<StateQuantum name="q_ThadErHaegt" actor="a_Gissur" state="ThadErHaegt" wait="true"/>
<StateQuantum name="q_EgLaetPokann" actor="a_Gissur" state="EgLaetPokann" wait="true"/>
<StateQuantum name="q_AfHverjuAetti" actor="a_Gissur" state="AfHverjuAetti" wait="true"/>
<StateQuantum name="q_SkuffanErLaest" actor="a_Gissur" state="SkuffanErLaest" wait="true"/>
<StateQuantum name="q_LatumThadGottHeita" actor="a_Gissur" state="LatumThadGottHeita" wait="true"/>
<StateQuantum name="q_PokinnErTrodfullur" actor="a_Gissur" state="PokinnErTrodfullur" wait="true"/>
<StateQuantum name="q_SaelirFelagar" actor="a_Gissur" state="SaelirFelagar" wait="true"/>
<StateQuantum name="q_ThettaErBref" actor="a_Gissur" state="ThettaErBref" wait="true"/>
<StateQuantum name="q_TomurPoki" actor="a_Gissur" state="TomurPoki" wait="true"/>
<StateQuantum name="q_PokinnErEkkiTomur" actor="a_Gissur" state="PokinnErEkkiTomur" wait="true"/>
<StateQuantum name="q_ThettaErBrytinn" actor="a_Gissur" state="ThettaErBrytinn" wait="true"/>
<StateQuantum name="q_ThettaErHannOddur" actor="a_Gissur" state="ThettaErHannOddur" wait="true"/>
<StateQuantum name="q_ThessiKollur" actor="a_Gissur" state="ThessiKollur" wait="true"/>
<StateQuantum name="q_EgHefEkkertAdGera" actor="a_Gissur" state="EgHefEkkertAdGera" wait="true"/>
<StateQuantum name="q_ThettaEruFallegOg" actor="a_Gissur" state="ThettaEruFallegOg" wait="true"/>
<StateQuantum name="q_ThettaEruOskop" actor="a_Gissur" state="ThettaEruOskop" wait="true"/>
<StateQuantum name="q_NalOgTvinni" actor="a_Gissur" state="NalOgTvinni" wait="true"/>
<StateQuantum name="q_ThettaEruMiklirPeningar" actor="a_Gissur" state="ThettaEruMiklirPeningar" wait="true"/>
<StateQuantum name="q_ThettaErFallegurAskur" actor="a_Gissur" state="ThettaErFallegurAskur" wait="true"/>
<StateQuantum name="q_KomidThidSaelir" actor="a_Gissur" state="KomidThidSaelir" wait="true"/>
<StateQuantum name="q_ASkiltinuStendur" actor="a_Gissur" state="ASkiltinuStendur" wait="true"/>
<StateQuantum name="q_ThadErEitthvadDularfullt" actor="a_Gissur" state="ThadErEitthvadDularfullt" wait="true"/>
<StateQuantum name="q_ThettaErStyttaAfEngli" actor="a_Gissur" state="ThettaErStyttaAfEngli" wait="true"/>
<StateQuantum name="q_ThettaErKaleikur" actor="a_Gissur" state="ThettaErKaleikur" wait="true"/>
<StateQuantum name="q_ThettaErBaraOskopVenjulegurKertastjaki" actor="a_Gissur" state="ThettaErBaraOskopVenjulegurKertastjaki" wait="true"/>
<StateQuantum name="q_ThettaErMyndAf" actor="a_Gissur" state="ThettaErMyndAf" wait="true"/>
<StateQuantum name="q_ThettaErRadsmadurinn" actor="a_Gissur" state="ThettaErRadsmadurinn" wait="true"/>
<StateQuantum name="q_KonanErAdBidjast" actor="a_Gissur" state="KonanErAdBidjast" wait="true"/>
<StateQuantum name="q_TharnaStendurOgmundur" actor="a_Gissur" state="TharnaStendurOgmundur" wait="true"/>
<StateQuantum name="q_FlotturLykill" actor="a_Gissur" state="FlotturLykill" wait="true"/>
<StateQuantum name="q_SkuffanOpnadist" actor="a_Gissur" state="SkuffanOpnadist" wait="true"/>
<StateQuantum name="q_SkuffanErNuLaest" actor="a_Gissur" state="SkuffanErNuLaest" wait="true"/>
<StateQuantum name="q_HvadErThessiOfrynilegi" actor="a_Gissur" state="HvadErThessiOfrynilegi" wait="true"/>
<StateQuantum name="q_EgErFeginnAdVeraLaus" actor="a_Gissur" state="EgErFeginnAdVeraLaus" wait="true"/>
<StateQuantum name="q_VinnumadurinnVirdist" actor="a_Gissur" state="VinnumadurinnVirdist" wait="true"/>
<StateQuantum name="q_MikidEruMenn" actor="a_Gissur" state="MikidEruMenn" wait="true"/>
<StateQuantum name="q_ThettaErNyrHirdstjori" actor="a_Gissur" state="ThettaErNyrHirdstjori" wait="true"/>

<StateQuantum name="q_TilHamingjuMed" actor="a_Gissur" state="TilHamingjuMed" wait="true"/>
<StateQuantum name="q_HaEg" actor="a_Gissur" state="HaEg" wait="true"/>
<StateQuantum name="q_JaHeldurduThad" actor="a_Gissur" state="JaHeldurduThad" wait="true"/>
<StateQuantum name="q_OddurAf" actor="a_Gissur" state="OddurAf" wait="true"/>
<StateQuantum name="q_HvernigForum" actor="a_Gissur" state="HvernigForum" wait="true"/>
<StateQuantum name="q_HvadEigumVid" actor="a_Gissur" state="HvadEigumVid" wait="true"/>
<StateQuantum name="q_AfHverjuErLutherstru" actor="a_Gissur" state="AfHverjuErLutherstru" wait="true"/>
<StateQuantum name="q_EgErBuinnAd" actor="a_Gissur" state="EgErBuinnAd" wait="true"/>
<StateQuantum name="q_HverErThessiMarteinn" actor="a_Gissur" state="HverErThessiMarteinn" wait="true"/>
<StateQuantum name="q_HvadaArEr" actor="a_Gissur" state="HvadaArEr" wait="true"/>
<StateQuantum name="q_UhhNeiEg" actor="a_Gissur" state="UhhNeiEg" wait="true"/>
<StateQuantum name="q_AdSjalfsogduMan" actor="a_Gissur" state="AdSjalfsogduMan" wait="true"/>
<StateQuantum name="q_JaAudvitad" actor="a_Gissur" state="JaAudvitad" wait="true"/>
<StateQuantum name="q_EdlilegaTharSem" actor="a_Gissur" state="EdlilegaTharSem" wait="true"/>
<StateQuantum name="q_NeiAllsEnga" actor="a_Gissur" state="NeiAllsEnga" wait="true"/>
<StateQuantum name="q_UmmmhEgHeld" actor="a_Gissur" state="UmmmhEgHeld" wait="true"/>
<StateQuantum name="q_HannGaetiReynt" actor="a_Gissur" state="HannGaetiReynt" wait="true"/>
<StateQuantum name="q_BaraVel" actor="a_Gissur" state="BaraVel" wait="true"/>
<StateQuantum name="q_JaEgGeri" actor="a_Gissur" state="JaEgGeri" wait="true"/>
<StateQuantum name="q_VertuSaell" actor="a_Gissur" state="VertuSaell" wait="true"/>
<StateQuantum name="q_UmmhhJa" actor="a_Gissur" state="UmmhhJa" wait="true"/>
<StateQuantum name="q_KomduSaelKona" actor="a_Gissur" state="KomduSaelKona" wait="true"/>
<StateQuantum name="q_GeturThuSagt" actor="a_Gissur" state="GeturThuSagt" wait="true"/>
<StateQuantum name="q_HvadErtThu" actor="a_Gissur" state="HvadErtThu" wait="true"/>
<StateQuantum name="q_UhhHaFyrirgefdu" actor="a_Gissur" state="UhhHaFyrirgefdu" wait="true"/>
<StateQuantum name="q_HaHvadSagdirdu" actor="a_Gissur" state="HaHvadSagdirdu" wait="true"/>
<StateQuantum name="q_NeiEnEgErAd" actor="a_Gissur" state="NeiEnEgErAd" wait="true"/>
<StateQuantum name="q_EgKomstYfirThettaBref" actor="a_Gissur" state="EgKomstYfirThettaBref" wait="true"/>
<StateQuantum name="q_KomduSaellHver" actor="a_Gissur" state="KomduSaellHver" wait="true"/>
<StateQuantum name="q_KomduSaellVinnumadur" actor="a_Gissur" state="KomduSaellVinnumadur" wait="true"/>
<StateQuantum name="q_TaktuVidThessumPeningum" actor="a_Gissur" state="TaktuVidThessumPeningum" wait="true"/>
<StateQuantum name="q_HvernigLidurTher" actor="a_Gissur" state="HvernigLidurTher" wait="true"/>
<StateQuantum name="q_AfHverjuStendur" actor="a_Gissur" state="AfHverjuStendur" wait="true"/>
<StateQuantum name="q_MaEgNokkudSja" actor="a_Gissur" state="MaEgNokkudSja" wait="true"/>
<StateQuantum name="q_SaellOgBlessadurHerra" actor="a_Gissur" state="SaellOgBlessadurHerra" wait="true"/>
<StateQuantum name="q_TilHamingjuMedHirdstjora" actor="a_Gissur" state="TilHamingjuMedHirdstjora" wait="true"/>
<StateQuantum name="q_HvernigGekkSiglingin" actor="a_Gissur" state="HvernigGekkSiglingin" wait="true"/>
<StateQuantum name="q_MikidHefEgBedidLengi" actor="a_Gissur" state="MikidHefEgBedidLengi" wait="true"/>
<StateQuantum name="q_JaEgHeldAdHann" actor="a_Gissur" state="JaEgHeldAdHann" wait="true"/>
<StateQuantum name="q_ErHannEkkiBara" actor="a_Gissur" state="ErHannEkkiBara" wait="true"/>
<StateQuantum name="q_HannGaetiVeridHja" actor="a_Gissur" state="HannGaetiVeridHja" wait="true"/>
<StateQuantum name="q_ErHannEkkiHerI" actor="a_Gissur" state="ErHannEkkiHerI" wait="true"/>
<StateQuantum name="q_HannErOrugglegaHja" actor="a_Gissur" state="HannErOrugglegaHja" wait="true"/>

<!-- Bless -->
<StateQuantum name="q_Bless1" actor="a_Gissur" state="Bless1" wait="true"/>
<StateQuantum name="q_Bless2" actor="a_Gissur" state="Bless2" wait="true"/>
<StateQuantum name="q_Bless3" actor="a_Gissur" state="Bless3" wait="true"/>
<StateQuantum name="q_Bless4" actor="a_Gissur" state="Bless4" wait="true"/>
<StateQuantum name="q_Bless5" actor="a_Gissur" state="Bless5" wait="true"/>
<StateQuantum name="q_Bless6" actor="a_Gissur" state="Bless6" wait="true"/>
<StateQuantum name="q_Bless" actor="a_Gissur" state="Bless" wait="true"/>

<StateQuantum name="q_Look1" actor="a_Gissur" state="Look1" wait="true"/>
<StateQuantum name="q_Look2" actor="a_Gissur" state="Look2" wait="true"/>
<StateQuantum name="q_Look3" actor="a_Gissur" state="Look3" wait="true"/>
<StateQuantum name="q_Look4" actor="a_Gissur" state="Look4" wait="true"/>
<StateQuantum name="q_Look5" actor="a_Gissur" state="Look5" wait="true"/>
<StateQuantum name="q_Look6" actor="a_Gissur" state="Look6" wait="true"/>

<StateQuantum name="q_Talk1" actor="a_Gissur" state="Talk1" wait="true"/>
<StateQuantum name="q_Talk2" actor="a_Gissur" state="Talk2" wait="true"/>
<StateQuantum name="q_Talk3" actor="a_Gissur" state="Talk3" wait="true"/>
<StateQuantum name="q_Talk4" actor="a_Gissur" state="Talk4" wait="true"/>
<StateQuantum name="q_Talk5" actor="a_Gissur" state="Talk5" wait="true"/>
<StateQuantum name="q_Talk6" actor="a_Gissur" state="Talk6" wait="true"/>

<StateQuantum name="q_Use1" actor="a_Gissur" state="Use1" wait="true"/>
<StateQuantum name="q_Use2" actor="a_Gissur" state="Use2" wait="true"/>
<StateQuantum name="q_Use3" actor="a_Gissur" state="Use3" wait="true"/>
<StateQuantum name="q_Use4" actor="a_Gissur" state="Use4" wait="true"/>
<StateQuantum name="q_Use5" actor="a_Gissur" state="Use5" wait="true"/>
<StateQuantum name="q_Use6" actor="a_Gissur" state="Use6" wait="true"/>
<StateQuantum name="q_Use7" actor="a_Gissur" state="Use7" wait="true"/>
<StateQuantum name="q_Use8" actor="a_Gissur" state="Use8" wait="true"/>
<StateQuantum name="q_Use9" actor="a_Gissur" state="Use9" wait="true"/>

<StateQuantum name="q_Take1" actor="a_Gissur" state="Take1" wait="true"/>
<StateQuantum name="q_Take2" actor="a_Gissur" state="Take2" wait="true"/>
<StateQuantum name="q_Take3" actor="a_Gissur" state="Take3" wait="true"/>
<StateQuantum name="q_Take4" actor="a_Gissur" state="Take4" wait="true"/>
<StateQuantum name="q_Take5" actor="a_Gissur" state="Take5" wait="true"/>
<StateQuantum name="q_Take6" actor="a_Gissur" state="Take6" wait="true"/>
<StateQuantum name="q_Take7" actor="a_Gissur" state="Take7" wait="true"/>
<StateQuantum name="q_Take8" actor="a_Gissur" state="Take8" wait="true"/>
<StateQuantum name="q_Take9" actor="a_Gissur" state="Take9" wait="true"/>
<StateQuantum name="q_Take10" actor="a_Gissur" state="Take10" wait="true"/>
<StateQuantum name="q_Take11" actor="a_Gissur" state="Take11" wait="true"/>
<StateQuantum name="q_Take12" actor="a_Gissur" state="Take12" wait="true"/>
<StateQuantum name="q_Take13" actor="a_Gissur" state="Take13" wait="true"/>

<!-- Rugl við Ögmund -->
<StateQuantum name="q_NeiEgHeldAdHannVilji" actor="a_Gissur" state="NeiEgHeldAdHannVilji" wait="true"/>

<StateQuantum name="q_HeyrduOddur" actor="a_Gissur" state="HeyrduOddur" wait="true"/>
<StateQuantum name="q_SaellOgBlessadurHerra2" actor="a_Gissur" state="SaellOgBlessadurHerra2" wait="true"/>

<PrepareQuantum	name="qp_Gissur1" object="af_Gissur_Stigur" prepare="true"/>
<PrepareQuantum	name="qu_Gissur1" object="af_Gissur_Stigur" prepare="false"/>
<PrepareQuantum	name="qp_Gissur2" object="af_Gissur_StopStigur" prepare="true"/>
<PrepareQuantum	name="qu_Gissur2" object="af_Gissur_StopStigur" prepare="false"/>
<PrepareQuantum	name="qp_Gissur3" object="af_Gissur_KPuka1" prepare="true"/>
<PrepareQuantum	name="qu_Gissur3" object="af_Gissur_KPuka1" prepare="false"/>
<PrepareQuantum	name="qp_Gissur4" object="af_Gissur_Hverfur" prepare="true"/>
<PrepareQuantum	name="qu_Gissur4" object="af_Gissur_Hverfur" prepare="false"/>
<PrepareQuantum	name="qp_Gissur5" object="af_Gissur_TekurStein" prepare="true"/>
<PrepareQuantum	name="qu_Gissur5" object="af_Gissur_TekurStein" prepare="false"/>
<PrepareQuantum	name="qp_Gissur6" object="af_Gissur_StopStein" prepare="true"/>
<PrepareQuantum	name="qu_Gissur6" object="af_Gissur_StopStein" prepare="false"/>
<PrepareQuantum	name="qp_Gissur7" object="af_Gissur_KPuka3" prepare="true"/>
<PrepareQuantum	name="qu_Gissur7" object="af_Gissur_KPuka3" prepare="false"/>
<PrepareQuantum	name="qp_Gissur8" object="af_Gissur_KPuka2" prepare="true"/>
<PrepareQuantum	name="qu_Gissur8" object="af_Gissur_KPuka2" prepare="false"/>


<!-- Oddur -->

<Text name="a_Oddur_acc" terrain="t_Corners" text=" " r="8" g="168" b="56" hilite="false"/>

<!-- Sentences -->
<SpeechActorMouth acc="a_Oddur_acc" name="m_KaeruFelagarNuEr" file="\sidaskiA\Media\oddur\kaerufeA.wav" >
	<Sentence text="Kæru félagar!" time="0"/>
	<Sentence text="Nú er stóra stundin loksins runnin upp, ..." time="1150"/>
	<Sentence text="... okkur er ekkert að vanbúnaði að breiða út boðskap ..." time="3650"/>
	<Sentence text="... Marteins Lúthers um gjörvallt Ísland ..." time="6150"/>
	<Sentence text="... og losa landið við trúvillu kaþólsku kirkjunnar." time="8400"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_JaGissur" file="\sidaskiA\Media\oddur\jagissur.wav" >
	<Sentence text="Já Gissur!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_Hjalti" file="\sidaskiA\Media\oddur\hjalti.wav" >
	<Sentence text="Hjalti!" time="0"/>
	<Sentence text="Er biskupsfrægðin að stíga þér til höfuðs herra Gissur?" time="1600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_NuHefurHerra" file="\sidaskiA\Media\oddur\nuhefurA.wav" >
	<Sentence text="Nú hefur herra Gissur Einarsson loksins tekið við ..." time="0"/>
	<Sentence text="... Skálholtsbiskupsstólnum af Ögmundi Pálssyni." time="2300"/>
	<Sentence text="Nýja testamentið, sem ég þýddi á íslensku, ..." time="5950"/>
	<Sentence text="... er nú komið úr prentun frá Danmörku." time="7800"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_ThakkaTherFyrir" file="\sidaskiA\Media\oddur\thakkatA.wav" >
	<Sentence text="Þakka þér fyrir herra Gissur." time="0"/>
	<Sentence text="En eins og allir vita þá er konungur vor, ..." time="3000"/>
	<Sentence text="... Kristján þriðji, líka á okkar bandi ..." time="5700"/>
	<Sentence text="... og hefur gefið út tilskipun um að ..." time="8350"/>
	<Sentence text="... lútherskir siðir skuli teknir upp hér á landi." time="10950"/>
	<Sentence text="Við höfum farið leynt með skoðanir okkar nógu lengi." time="16900"/>
	<Sentence text="Þú verður að taka frumkvæðið, herra Gissur." time="19100"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_JaThuEruMargir" file="\sidaskiA\Media\oddur\jathuerA.wav" >
	<Sentence text="Já þú! Eru margir Gissurar hér?" time="0"/>
	<Sentence text="Ég legg til að þú byrjir á því að fjarlægja alla ..." time="3700"/>
	<Sentence text="... kaþólska helgimuni úr kirkjunni." time="6050"/>
	<Sentence text="Ég get ekki afborið svona afguðadýrkun deginum lengur." time="9000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_EgHefAhyggjur" file="\sidaskiA\Media\oddur\eghefahA.wav" >
	<Sentence text="Ég hef áhyggjur af minni þínu, Gissur!" time="0"/>
	<Sentence text="Lúther benti á að vitneskju um rétta ..." time="2600"/>
	<Sentence text="... kristna trú fengju menn aðeins úr ..." time="5350"/>
	<Sentence text="... heilagri ritningu, Biblíunni sjálfri." time="7830"/>
	<Sentence text="Þess vegna leggur hann áherslu á að ..." time="12450"/>
	<Sentence text="... Biblían sé þýdd á þjóðtungu hverrar þjóðar ..." time="14650"/>
	<Sentence text="... til að allir geti lesið hana." time="17700"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_ThuHefurBiskupsvald" file="\sidaskiA\Media\oddur\thuhefuA.wav" >
	<Sentence text="Þú hefur biskupsvald hér í Skálholti." time="0"/>
	<Sentence text="Þú verður að predika lútherska siði og koma ..." time="3800"/>
	<Sentence text="... lútherskum prestum í öll prestaköll Skálholtsstiftis." time="6400"/>
	<Sentence text="Við verðum bara að gæta okkar á ..." time="11000"/>
	<Sentence text="... Ögmundi og fylgismönnum hans." time="12350"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_OgmundurErOrdinn" file="\sidaskiA\Media\oddur\ogmunduA.wav" >
	<Sentence text="Ögmundur er orðinn gamall ..." time="0"/>
	<Sentence text="... og auk þess er hann staurblindur." time="1450"/>
	<Sentence text="Hann er þó ekki dauður úr öllum æðum ennþá." time="3650"/>
	<Sentence text="Þú manst hvernig menn hans fóru með ..." time="6750"/>
	<Sentence text="... fógeta konungs í fyrra." time="7950"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_KristjanKonungurHlytur" file="\sidaskiA\Media\oddur\kristjaA.wav" >
	<Sentence text="Kristján konungur hlýtur að senda hermenn ..." time="0"/>
	<Sentence text="... hingað til lands fljótlega og þá verðum við að ..." time="2250"/>
	<Sentence text="... sjá til þess að Ögmundur verði handtekinn ..." time="4550"/>
	<Sentence text="... til að við fáum frið." time="5600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_EinsOgThuManst" file="\sidaskiA\Media\oddur\einsogtA.wav" >
	<Sentence text="Eins og þú manst þá harðneituðu biskuparnir ..." time="0"/>
	<Sentence text="... á Íslandi, Ögmundur og Jón, að taka sönsum ..." time="2250"/>
	<Sentence text="... þegar Kristján konungur gaf út tilskipun um ..." time="6100"/>
	<Sentence text="... hina nýju lúthersku kirkjuskipan í fyrra." time="8350"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_HvadUmThadTha" file="\sidaskiA\Media\oddur\hvadumtA.wav" >
	<Sentence text="Hvað um það þá drápu skósveinar Ögmundar ..." time="0"/>
    <Sentence text="... Diðrik, fógeta konungs, þegar hann ætlaði ..." time="3450"/>
    <Sentence text="... að framkvæma tilskipun konungs ..." time="6350"/>
    <Sentence text="... og koma á lútherskri kirkjuskipan." time="7800"/>
    <Sentence text="Síðan þá hefur ekki verið nein ..." time="10650"/>
    <Sentence text="... landsstjórn Dana á Íslandi." time="12450"/>
    <Sentence text="Konungur vor hlýtur þó að senda fljótlega ..." time="16000"/>
    <Sentence text="... nýjan hirðstjóra til Íslands til að taka völdin á ný." time="17950"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_LutherErAMoti" file="\sidaskiA\Media\oddur\luthereA.wav" >
	<Sentence text="Lúther er á móti dýrkun dýrlinga vegna þess ..." time="0"/>
	<Sentence text="... að samkvæmt Biblíunni er ekki leyft ..." time="3250"/>
	<Sentence text="... að tilbiðja aðra en Guð." time="5350"/>
	<Sentence text="Hann telur dýrlingatrú jafngilda fjölgyðistrú, ..." time="8500"/>
	<Sentence text="... sem er stranglega bönnuð í Biblíunni." time="12600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_MjogFyndidHerra" file="\sidaskiA\Media\oddur\mjogfynA.wav" >
	<Sentence text="Mjög fyndið, herra biskup!" time="0"/>
	<Sentence text="Þykist þú vera búinn að gleyma öllu því ..." time="3550"/>
	<Sentence text="... sem við lærðum í skóla í Þýskalandi?" time="5550"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_MarteinnLutherThekkir" file="\sidaskiA\Media\oddur\marteinA.wav" >
	<Sentence text="Marteinn Lúther þekkir Biblíuna eins vel og ..." time="0"/>
	<Sentence text="... handarbakið á sér og hefur með hana að vopni ..." time="2250"/>
	<Sentence text="... afneitað fjölmörgu sem kaþólska kirkjan ..." time="4700"/>
	<Sentence text="... telur gott og blessað, dýrlingatrú, munklífi, ..." time="7100"/>
	<Sentence text="... kenningunni um að páfi væri óskeikull og fleiru." time="10600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_NuErArid1540" file="\sidaskiA\Media\oddur\nuerariA.wav" >
	<Sentence text="Nú er árið 1540." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_ThuHefurStadidThigVel" file="\sidaskiA\Media\oddur\ThuHefuB.wav" >
	<Sentence text="Þú hefur staðið þig vel, Gissur." time="0"/>
	<Sentence text="Mér líður strax betur nú þegar munirnir ..." time="2600"/>
	<Sentence text="... eru farnir úr kirkjunni en ég hef ..." time="4650"/>
	<Sentence text="... slæmar fréttir að færa." time="6650"/>
	<Sentence text="Ögmundur hefur komist að því að þú tókst ..." time="8400"/>
	<Sentence text="... munina úr kirkjunni og er allt annað en ánægður." time="10250"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_EgErHraeddurUm" file="\sidaskiA\Media\oddur\EgErHraA.wav" >
	<Sentence text="Ég er hræddur um að hann ætli sér ..." time="0"/>
	<Sentence text="... að koma þér frá embætti." time="1550"/>
	<Sentence text="Nú verðum við að komast að því ..." time="4600"/>
	<Sentence text="... hvað hann hefur í hyggju svo að ..." time="5770"/>
	<Sentence text="... hann eyðileggi ekki allt fyrir okkur." time="7500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Oddur_acc" name="m_EkkiOrvaentaGissur" file="\sidaskiA\Media\oddur\EkkiOrvA.wav" >
	<Sentence text="Ekki örvænta Gissur, kæri vinur." time="0"/>
	<Sentence text="Ég hef góðar fréttir að færa." time="3700"/>
	<Sentence text="Nýr hirðstjóri Danakonungs, Kristján hvítfeldur, ..." time="6350"/>
	<Sentence text="... er nýkominn til landsins með tvö herskip." time="10330"/>
	<Sentence text="Ég hef nú þegar sent honum skilaboð ..." time="14300"/>
	<Sentence text="... um gang mála hér í Skálholti." time="16850"/>
	<Sentence text="Ég sagði að þú myndir hitta hann í Kópavogi ..." time="20400"/>
	<Sentence text="... til að ræða hvað skuli gera í málum Ögmundar." time="24330"/> </SpeechActorMouth>

<StaticActorFace name="af_Oddur_Stop" file="\SidaskiA\AnimatiA\Oddur\stop" />
<CelledAnimated2DActorFace name="af_Oddur_Talk" repeat="-1" file="\SidaskiA\AnimatiA\Oddur\talk" count="4" speed="150" random="true"/>
<PrepareQuantum name="qu_HjaBryta4" object="af_Oddur_Stop" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta4" object="af_Oddur_Stop" prepare="true"/>
<PrepareQuantum name="qu_HjaBryta5" object="af_Oddur_Talk" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta5" object="af_Oddur_Talk" prepare="true"/>

<StaticActor name="a_Oddur" state="stop" terrain="t_HjaBrytal" x="445" y="550" z="280" >
	<State name="stop" face="af_Oddur_Stop" />
	<State name="KaeruFelagarNuEr" face="af_Oddur_Talk" mouth="m_KaeruFelagarNuEr"/>
	<State name="NuHefurHerra" face="af_Oddur_Talk" mouth="m_NuHefurHerra"/>
	<State name="ThakkaTherFyrir" face="af_Oddur_Talk" mouth="m_ThakkaTherFyrir"/>
	<State name="JaThuEruMargir" face="af_Oddur_Talk" mouth="m_JaThuEruMargir"/>
	<State name="EgHefAhyggjur" face="af_Oddur_Talk" mouth="m_EgHefAhyggjur"/>
    <State name="ThuHefurBiskupsvald" face="af_Oddur_Talk" mouth="m_ThuHefurBiskupsvald"/>
    <State name="OgmundurErOrdinn" face="af_Oddur_Talk" mouth="m_OgmundurErOrdinn"/>
    <State name="KristjanKonungurHlytur" face="af_Oddur_Talk" mouth="m_KristjanKonungurHlytur"/>
    <State name="EinsOgThuManst" face="af_Oddur_Talk" mouth="m_EinsOgThuManst"/>
    <State name="HvadUmThadTha" face="af_Oddur_Talk" mouth="m_HvadUmThadTha"/>
    <State name="LutherErAMoti" face="af_Oddur_Talk" mouth="m_LutherErAMoti"/>
    <State name="MjogFyndidHerra" face="af_Oddur_Talk" mouth="m_MjogFyndidHerra"/>
    <State name="MarteinnLutherThekkir" face="af_Oddur_Talk" mouth="m_MarteinnLutherThekkir"/>
    <State name="NuErArid1540" face="af_Oddur_Talk" mouth="m_NuErArid1540"/>
    <State name="ThuHefurStadidThigVel" face="af_Oddur_Talk" mouth="m_ThuHefurStadidThigVel"/>
    <State name="EgErHraeddurUm" face="af_Oddur_Talk" mouth="m_EgErHraeddurUm"/>
    <State name="EkkiOrvaentaGissur" face="af_Oddur_Talk" mouth="m_EkkiOrvaentaGissur"/>
    <State name="JaGissur" face="af_Oddur_Talk" mouth="m_JaGissur"/>
    <State name="Hjalti" face="af_Oddur_Talk" mouth="m_Hjalti"/>
</StaticActor>

<TransparentActorFace name="af_OddurF" height="70" width="130"/>
<StaticActor name="a_OddurF" state="stop" terrain="t_HjaBrytal" x="498" y="897" z="580" random="true">
    <State name="stop" face="af_OddurF"/>
</StaticActor>
<ActorMoused actor="a_OddurF" listener="sc" moving="Oddur" taking="Hrinda Oddi" thf="Odd" />

<TransparentActorFace name="af_OddurT" height="65" width="45"/>
<StaticActor name="a_OddurT" state="stop" terrain="t_HjaBrytal" x="524" y="847" z="580" random="true">
    <State name="stop" face="af_OddurT"/>
</StaticActor>
<ActorMoused actor="a_OddurT" listener="sc" moving="Oddur" taking="Hrinda Oddi" thf="Odd" />

<!-- Conversation -->
<SentenceContainer name="conv_Oddur" scene="s_HjaBryta" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta -->
<StateQuantum name="q_StopOddur" actor="a_Oddur" state="stop" wait="false"/>

<!-- Quanta for sentences -->
<StateQuantum name="q_KaeruFelagarNuEr" actor="a_Oddur" state="KaeruFelagarNuEr" wait="true"/>
<StateQuantum name="q_NuHefurHerra" actor="a_Oddur" state="NuHefurHerra" wait="true"/>
<StateQuantum name="q_ThakkaTherFyrir" actor="a_Oddur" state="ThakkaTherFyrir" wait="true"/>
<StateQuantum name="q_JaThuEruMargir" actor="a_Oddur" state="JaThuEruMargir" wait="true"/>
<StateQuantum name="q_EgHefAhyggjur" actor="a_Oddur" state="EgHefAhyggjur" wait="true"/>
<StateQuantum name="q_ThuHefurBiskupsvald" actor="a_Oddur" state="ThuHefurBiskupsvald" wait="true"/>
<StateQuantum name="q_OgmundurErOrdinn" actor="a_Oddur" state="OgmundurErOrdinn" wait="true"/>
<StateQuantum name="q_KristjanKonungurHlytur" actor="a_Oddur" state="KristjanKonungurHlytur" wait="true"/>
<StateQuantum name="q_EinsOgThuManst" actor="a_Oddur" state="EinsOgThuManst" wait="true"/>
<StateQuantum name="q_HvadUmThadTha" actor="a_Oddur" state="HvadUmThadTha" wait="true"/>
<StateQuantum name="q_LutherErAMoti" actor="a_Oddur" state="LutherErAMoti" wait="true"/>
<StateQuantum name="q_MjogFyndidHerra" actor="a_Oddur" state="MjogFyndidHerra" wait="true"/>
<StateQuantum name="q_MarteinnLutherThekkir" actor="a_Oddur" state="MarteinnLutherThekkir" wait="true"/>
<StateQuantum name="q_NuErArid1540" actor="a_Oddur" state="NuErArid1540" wait="true"/>
<StateQuantum name="q_ThuHefurStadidThigVel" actor="a_Oddur" state="ThuHefurStadidThigVel" wait="true"/>
<StateQuantum name="q_EgErHraeddurUm" actor="a_Oddur" state="EgErHraeddurUm" wait="true"/>
<StateQuantum name="q_EkkiOrvaentaGissur" actor="a_Oddur" state="EkkiOrvaentaGissur" wait="true"/>
<StateQuantum name="q_JaGissur" actor="a_Oddur" state="JaGissur" wait="true"/>
<StateQuantum name="q_Hjalti" actor="a_Oddur" state="Hjalti" wait="true"/>


<!-- Brytinn -->

<Text name="a_bryti_acc" terrain="t_Corners" text=" " r="222" g="6" b="42" hilite="false"/>

<!-- Sentences -->
<SpeechActorMouth acc="a_bryti_acc" name="m_ThadVerdurErfitt" file="\sidaskiA\Media\brytinn\thadverA.wav" >
	<Sentence text="Það verður erfitt." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_ThuVerdurAd" file="\sidaskiA\Media\brytinn\thuverdA.wav" >
	<Sentence text="Þú verður að fara gætilega vegna þess að..." time="0"/>
	<Sentence text="... Ögmundur fylgist grannt með þér þessa dagana." time="2650"/>
	<Sentence text="Ég held að hann sé farinn að gruna ..." time="6270"/>
	<Sentence text="... að þú hallist að kenningum Lúthers." time="7938"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_OgmundurOgKatholskir" file="\sidaskiA\Media\brytinn\ogmunduA.wav" >
	<Sentence text="Ögmundur og kaþólskir fylgismenn hans ..." time="0"/>
	<Sentence text="... eru ennþá valdamiklir hér í Skálholti." time="3350"/>
	<Sentence text="Auk þess getur Ögmundur alltaf leitað til ..." time="7000"/>
	<Sentence text="... Jóns Arasonar Hólabiskups ef hann vantar aðstoð." time="9500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_FlyttuTherNuAdFjarlaegja" file="\sidaskiA\Media\brytinn\flyttutA.wav" >
	<Sentence text="Flýttu þér nú að fjarlægja helgimunina úr kirkjunni." time="0"/>
	<Sentence text="Ég get ekki beðið eftir því að losna við þá." time="4250"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_ThettaVarVelAfSer" file="\sidaskiA\Media\brytinn\thettavA.wav" >
	<Sentence text="Þetta var vel af sér vikið, herra Gissur." time="0"/>
	<Sentence text="En ég mundi fela helgimunina einhvers staðar ..." time="3118"/>
	<Sentence text="... þar sem ráðsmaðurinn finnur þá ekki ..." time="5788"/>
	<Sentence text="... því að hann er vís til að taka þá af þér ..." time="8120"/>
	<Sentence text="... ef hann sér þig burðast með þá." time="9600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_EgHeldAdOddur" file="\sidaskiA\Media\brytinn\egheldaA.wav" >
	<Sentence text="Ég held að Oddur hafi rétt fyrir sér." time="0"/>
	<Sentence text="Hefur þú einhverja hugmynd um ..." time="3200"/>
	<Sentence text="... hvað Ögmundur ætlast fyrir?" time="4500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_HefurThuEinhverja" file="\sidaskiA\Media\brytinn\hefurthA.wav" >
	<Sentence text="Hefur þú einhverja hugmynd um ..." time="0"/>
	<Sentence text="... hvað Ögmundur ætlast fyrir?" time="1300"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_VidVerdumAdKomast" file="\sidaskiA\Media\brytinn\vidverdA.wav" >
	<Sentence text="Við verðum að komast að því hvað hann ætlast fyrir." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_VidVerdumThaAd" file="\sidaskiA\Media\brytinn\vidverdB.wav" >
	<Sentence text="Við verðum þá að komast að því ..." time="0"/>
	<Sentence text="... hvernig hann ætlar að fara að því ..." time="1600"/>
	<Sentence text="... og hindra hann því að annars er enginn ..." time="3150"/>
	<Sentence text="... til að bera út boðskap Lúthers." time="5800"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_ThettaErEkkertTilAd" file="\sidaskiA\Media\brytinn\thettaeA.wav" >
	<Sentence text="Þetta er ekkert til að hafa í flimtingum, herra Gissur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_HefurThuKomist" file="\sidaskiA\Media\brytinn\hefurthB.wav" >
	<Sentence text="Hefur þú komist að einhverju nýju?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_OgmundurHefurLika" file="\sidaskiA\Media\brytinn\ogmunduB.wav" >
	<Sentence text="Ögmundur hefur líka frétt af komu hirðstjóra ..." time="0"/>
	<Sentence text="... og nú finnst hann hvergi hér í Skálholti." time="2620"/>
	<Sentence text="Hann hlýtur að hafa flúið eitthvert!" time="5500"/>
	<Sentence text="Ég vona að hann komist ekki langt ..." time="8000"/>
	<Sentence text="... því við verðum að losna við afskipti hans." time="9500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_bryti_acc" name="m_DrifduThigNuAdHitta" file="\sidaskiA\Media\brytinn\drifdutA.wav" >
	<Sentence text="Drífðu þig nú að hitta Kristófer hvítfeld í Kópavogi." time="0"/>
<!--	<Sentence text="... í Kópavogi svo að Ögmundur komist ekki langt." time="2330"/> --> </SpeechActorMouth>

<!-- Brytinn -->
<StaticActorFace name="af_Brytinn_Stop" file="\SidaskiA\AnimatiA\Brytinn\stop" />
<CelledAnimated2DActorFace name="af_Brytinn_Hnefi" repeat="3" file="\SidaskiA\AnimatiA\Brytinn\hnefi" count="3" speed="225" xoffset="-10" yoffset="-22"/>
<CelledAnimated2DActorFace name="af_Brytinn_Talk" repeat="-1" file="\SidaskiA\AnimatiA\Brytinn\talk" count="4" speed="150" random="true"/>
<PrepareQuantum name="qu_HjaBryta6" object="af_Brytinn_Stop" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta6" object="af_Brytinn_Stop" prepare="true"/>
<PrepareQuantum name="qu_HjaBryta7" object="af_Brytinn_Talk" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta7" object="af_Brytinn_Talk" prepare="true"/>
<PrepareQuantum name="qu_HjaBryta8" object="af_Brytinn_Hnefi" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta8" object="af_Brytinn_Hnefi" prepare="true"/>

<!-- Fúli -->
<StaticActorFace name="af_Fuli_Stop" file="\SidaskiA\AnimatiA\fuli\stop" />
<CelledAnimated2DActorFace name="af_Fuli_Start" repeat="-1" file="\SidaskiA\AnimatiA\fuli\talk" count="3" />
<PrepareQuantum name="qu_HjaBryta9" object="af_Fuli_Stop" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta9" object="af_Fuli_Stop" prepare="true"/>
<PrepareQuantum name="qu_HjaBryta10" object="af_Fuli_Start" prepare="false"/>
<PrepareQuantum name="qp_HjaBryta10" object="af_Fuli_Start" prepare="true"/>

<!-- end Fúli-->

<!-- Brytinn -->
<StaticActor name="a_Brytinn" state="stop" terrain="t_HjaBrytal" x="648" y="550" z="290" random="true">
	<State name="stop" face="af_Brytinn_Stop" />
	<State name="hnefi" face="af_Brytinn_Hnefi" />
	<State name="ThadVerdurErfitt" face="af_Brytinn_Talk" mouth="m_ThadVerdurErfitt"/>
	<State name="ThuVerdurAd" face="af_Brytinn_Talk" mouth="m_ThuVerdurAd"/>
	<State name="OgmundurOgKatholskir" face="af_Brytinn_Talk" mouth="m_OgmundurOgKatholskir"/>
	<State name="FlyttuTherNuAdFjarlaegja" face="af_Brytinn_Talk" mouth="m_FlyttuTherNuAdFjarlaegja"/>
	<State name="ThettaVarVelAfSer" face="af_Brytinn_Talk" mouth="m_ThettaVarVelAfSer"/>
	<State name="EgHeldAdOddur" face="af_Brytinn_Talk" mouth="m_EgHeldAdOddur"/>
	<State name="HefurThuEinhverja" face="af_Brytinn_Talk" mouth="m_HefurThuEinhverja"/>
	<State name="VidVerdumAdKomast" face="af_Brytinn_Talk" mouth="m_VidVerdumAdKomast"/>
	<State name="VidVerdumThaAd" face="af_Brytinn_Talk" mouth="m_VidVerdumThaAd"/>
	<State name="ThettaErEkkertTilAd" face="af_Brytinn_Talk" mouth="m_ThettaErEkkertTilAd"/>
	<State name="HefurThuKomist" face="af_Brytinn_Talk" mouth="m_HefurThuKomist"/>
	<State name="OgmundurHefurLika" face="af_Brytinn_Talk" mouth="m_OgmundurHefurLika"/>
	<State name="DrifduThigNuAdHitta" face="af_Brytinn_Talk" mouth="m_DrifduThigNuAdHitta"/>
</StaticActor>

<!-- Fúli -->
<StaticActor name="a_Fuli" state="stop" terrain="t_HjaBrytal" x="378" y="759" z="500" random="true">
	<State name="stop" face="af_Fuli_Stop" />
	<State name="start" face="af_Fuli_Start" />
</StaticActor>
<!-- End Fúli-->

<ActorMoused actor="a_Brytinn" listener="sc" moving="Brytinn" taking="Hrinda bryta" thf="bryta"/>

<!-- Quanta -->
<StateQuantum name="q_StopBrytinn" actor="a_Brytinn" state="stop" wait="false"/>
<StateQuantum name="q_HnefiBrytinn" actor="a_Brytinn" state="hnefi" wait="true"/>
<StateQuantum name="q_StopFuli" actor="a_Fuli" state="stop" wait="false"/>

<!-- Quanta for sentences -->
<StateQuantum name="q_ThadVerdurErfitt" actor="a_Brytinn" state="ThadVerdurErfitt" wait="true"/>
<StateQuantum name="q_ThuVerdurAd" actor="a_Brytinn" state="ThuVerdurAd" wait="true"/>
<StateQuantum name="q_OgmundurOgKatholskir" actor="a_Brytinn" state="OgmundurOgKatholskir" wait="true"/>
<StateQuantum name="q_FlyttuTherNuAdFjarlaegja" actor="a_Brytinn" state="FlyttuTherNuAdFjarlaegja" wait="true"/>
<StateQuantum name="q_ThettaVarVelAfSer" actor="a_Brytinn" state="ThettaVarVelAfSer" wait="true"/>
<StateQuantum name="q_EgHeldAdOddur" actor="a_Brytinn" state="EgHeldAdOddur" wait="true"/>
<StateQuantum name="q_HefurThuEinhverja" actor="a_Brytinn" state="HefurThuEinhverja" wait="true"/>
<StateQuantum name="q_VidVerdumAdKomast" actor="a_Brytinn" state="VidVerdumAdKomast" wait="true"/>
<StateQuantum name="q_VidVerdumThaAd" actor="a_Brytinn" state="VidVerdumThaAd" wait="true"/>
<StateQuantum name="q_ThettaErEkkertTilAd" actor="a_Brytinn" state="ThettaErEkkertTilAd" wait="true"/>
<StateQuantum name="q_HefurThuKomist" actor="a_Brytinn" state="HefurThuKomist" wait="true"/>
<StateQuantum name="q_OgmundurHefurLika" actor="a_Brytinn" state="OgmundurHefurLika" wait="true"/>
<StateQuantum name="q_DrifduThigNuAdHitta" actor="a_Brytinn" state="DrifduThigNuAdHitta" wait="true"/>
<StateQuantum name="q_StartFuli" actor="a_Fuli" state="start" wait="false"/>


<!-- Kjaftakelling  -->

<Text name="a_Kelling_acc" terrain="t_Corners" text=" " r="255" g="208" b="50" hilite="false"/>

<!-- Sentences -->
<SpeechActorMouth acc="a_Kelling_acc" name="m_KomduSaellHerraGissur" file="\sidaskiA\Media\kjaftakA\komdusaA.wav" >
    <Sentence text="Komdu sæll, herra Gissur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Kelling_acc" name="m_JaVeistuJa" file="\sidaskiA\Media\kjaftakA\javeistA.wav" >
    <Sentence text="Já veistu já, þetta með hann Ögmund." time="0"/>
    <Sentence text="Ég veit nú ekki barasta." time="2000"/>
    <Sentence text="Hvernig er þetta eiginlega með hann?" time="3550"/>
    <Sentence text="Hann er nú að verða blindur og ég veit nú ekki." time="5430"/>
    <Sentence text="Og hvað er þetta með skuldir hans við kirkjuna?" time="7530"/>
    <Sentence text="Skuldar hann ekki einhver reiðinnar ósköp?" time="10250"/>
    <Sentence text="Ég frétti að hann hefði fargað ..." time="12720"/>
    <Sentence text="... jörðum biskupsstólsins án þess að fá leyfi." time="14000"/>
	<Sentence text="Er þetta rétt?" time="16250"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Kelling_acc" name="m_HverVeitHvad" file="\sidaskiA\Media\kjaftakA\hverveiA.wav" >
    <Sentence text="Hver veit hvað hann gerir núna þegar hann..." time="0"/>
    <Sentence text="... þarf að greiða skuldir sínar við kirkjuna?" time="1550"/>
    <Sentence text="Svo er það nú með hana systur hans ..." time="4000"/>
    <Sentence text="... sem býr í Hjalla í Ölfusi ..." time="5170"/>
    <Sentence text="... og hann maðurinn hennar ..." time="6380"/>
    <Sentence text="... hvað heitir hann aftur?" time="7150"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Kelling_acc" name="m_JaHannEyjolfur" file="\sidaskiA\Media\kjaftakA\jahanneA.wav" >
    <Sentence text="Já hann Eyjólfur." time="0"/>
    <Sentence text="Og nú veit ég ekki með þau, ..." time="1480"/>
    <Sentence text="... hvað hann Ögmundur hefur gert við jörðina þeirra." time="2670"/>
    <Sentence text="Ég meina hún Ásdís systir hans ..." time="4780"/>
    <Sentence text="... fékk nú jörðina einu sinni í móðurarf ..." time="5960"/>
    <Sentence text="... en nú virðist vera sem Ögmundur ..." time="7980"/>
    <Sentence text="... stjórni henni alveg eins og honum sýnist, ..." time="9350"/>
    <Sentence text="... nema hvað þau búa jú auðvitað þarna ..." time="11250"/>
    <Sentence text="... með fjölskyldu sinni en ég veit nú ..." time="12650"/>
    <Sentence text="... ekki hversu langt það nær." time="13750"/>
    <Sentence text="Það er ég viss um að ef Ögmundur ..." time="15850"/>
    <Sentence text="... verður sóttur til saka að hann ..." time="17680"/>
    <Sentence text="... gefur upp jörðina þeirra sem þau ..." time="18780"/>
    <Sentence text="... eiga auðvitað með réttu." time="20510"/>
	<Sentence text="En hvað er annars að frétta af þér?" time="22070"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Kelling_acc" name="m_Ekkert" file="\sidaskiA\Media\kjaftakA\ekkert.wav" >
    <Sentence text="Ekkert!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Kelling_acc" name="m_EgErAdBidjaFyrir" file="\sidaskiA\Media\kjaftakA\egeradbA.wav" >
    <Sentence text="Ég er að biðja fyrir þér, elsku kallinn minn." time="0"/>
    <Sentence text="Ég veit að þú átt erfitt þessa dagana ..." time="4100"/>
    <Sentence text="... þar sem þú ert nýtekinn við ..." time="6050"/>
    <Sentence text="... biskupsstólnum svona ungur ..." time="7350"/>
    <Sentence text="... og með Ögmund og menn hans ..." time="9770"/>
    <Sentence text="... alltaf að skipta sér af rekstri stólsins." time="11100"/> </SpeechActorMouth>

<!-- Kjaftakelling -->
<StaticActorFace name="af_Kjaftakelling_Stop" file="\SidaskiA\AnimatiA\KjaftakA\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Kjaftakelling_Talk" repeat="-1" file="\SidaskiA\AnimatiA\KjaftakA\talk" count="4" prepare="false" speed="225" random="true"/>
<StaticActor name="a_Kjaftakelling" state="stop" terrain="t_Kirkjal" x="813" y="306" z="0" random="true" >
	<State name="stop" face="af_Kjaftakelling_Stop" />
	<State name="KomduSaellHerraGissur" face="af_Kjaftakelling_Talk" mouth="m_KomduSaellHerraGissur"/>
	<State name="JaVeistuJa" face="af_Kjaftakelling_Talk" mouth="m_JaVeistuJa"/>
	<State name="HverVeitHvad" face="af_Kjaftakelling_Talk" mouth="m_HverVeitHvad"/>
	<State name="JaHannEyjolfur" face="af_Kjaftakelling_Talk" mouth="m_JaHannEyjolfur"/>
	<State name="Ekkert" face="af_Kjaftakelling_Talk" mouth="m_Ekkert"/>
	<State name="EgErAdBidjaFyrir" face="af_Kjaftakelling_Talk" mouth="m_EgErAdBidjaFyrir"/>
</StaticActor>
<ActorMoused actor="a_Kjaftakelling" listener="sc" moving="Kerling" thf="kerlingu" taking="Hrinda kerlingu"/>

<StaticActorFace name="af_Kjaftakelling_Faetur" file="\SidaskiA\AnimatiA\KjaftakA\faetur" prepare="false"/>
<StaticActor name="a_Kjaftakelling2" state="stop" terrain="t_Kirkjal" x="827" y="477" z="0" >
	<State name="stop" face="af_Kjaftakelling_Faetur" />
</StaticActor>
<PrepareQuantum	name="qp_Kirkja8" object="af_Kjaftakelling_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja8" object="af_Kjaftakelling_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Kirkja9" object="af_Kjaftakelling_Talk" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja9" object="af_Kjaftakelling_Talk" prepare="false"/>
<PrepareQuantum	name="qp_Kirkja10" object="af_Kjaftakelling_Faetur" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja10" object="af_Kjaftakelling_Faetur" prepare="false"/>

<!-- Conversation -->
<SentenceContainer name="conv_Kjaftakelling" scene="s_Kirkja" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta -->
<StateQuantum name="q_StopKjaftakelling" actor="a_Kjaftakelling" state="stop" wait="false"/>

<!-- Quanta for sentences -->
<StateQuantum name="q_KomduSaellHerraGissur" actor="a_Kjaftakelling" state="KomduSaellHerraGissur" wait="true"/>
<StateQuantum name="q_JaVeistuJa" actor="a_Kjaftakelling" state="JaVeistuJa" wait="true"/>
<StateQuantum name="q_HverVeitHvad" actor="a_Kjaftakelling" state="HverVeitHvad" wait="true"/>
<StateQuantum name="q_JaHannEyjolfur" actor="a_Kjaftakelling" state="JaHannEyjolfur" wait="true"/>
<StateQuantum name="q_Ekkert" actor="a_Kjaftakelling" state="Ekkert" wait="true"/>
<StateQuantum name="q_EgErAdBidjaFyrir" actor="a_Kjaftakelling" state="EgErAdBidjaFyrir" wait="true"/>



<!-- Ögmundur -->

<Text name="a_ogmundur_acc" terrain="t_Corners" text=" " r="164" g="136" b="120" hilite="false"/>

<SpeechActorMouth acc="a_ogmundur_acc" name="m_GodanDaginnGissurHvernig" file="\sidaskiA\Media\ogmundur\GodanDaA.wav" >
	<Sentence text="Góðan daginn, Gissur!" time="0"/>
	<Sentence text="Hvernig gengur að stjórna biskupsstólnum?" time="2300"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_ogmundur_acc" name="m_ThuTalarBaraVid" file="\sidaskiA\Media\ogmundur\ThuTalaA.wav" >
	<Sentence text="Þú talar bara við mig ef þig vantar góð ráð." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_ogmundur_acc" name="m_ThuVerdurBaraAdGaeta" file="\sidaskiA\Media\ogmundur\ThuVerdA.wav" >
	<Sentence text="Þú verður bara að gæta þín ..." time="0"/>
	<Sentence text="... á að láta ekki glepjast af kenningum ..." time="1950"/>
	<Sentence text="...  grámunksins Marteins Lúthers." time="4280"/>
	<Sentence text="En það er engin hætta á því, ..." time="7350"/>
	<Sentence text="... eða hvað?" time="9850"/>
	<Sentence text="Jæja, sæll að sinni!" time="12000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_ogmundur_acc" name="m_ErThettaThuGissur" file="\sidaskiA\Media\ogmundur\ErtThetA.wav" >
	<Sentence text="Er þetta þú, Gissur?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_ogmundur_acc" name="m_EgFrettiAdHelgirMunir" file="\sidaskiA\Media\ogmundur\EgFrettA.wav" >
	<Sentence text="Ég frétti að helgir munir væru horfnir úr kirkjunni." time="0"/>
	<Sentence text="Ég gerði greinilega mistök þegar ..." time="4900"/>
	<Sentence text="... ég mælti með þér sem eftirmanni mínum ..." time="6850"/>
	<Sentence text="... fyrst þú ert byrjaður að stunda siði ..." time="10050"/>
	<Sentence text="... grámunksins Marteins Lúthers." time="12600"/>
	<Sentence text="Þú getur treyst því að ég mun gera allt ..." time="15800"/>
	<Sentence text="... sem í mínu valdi stendur ..." time="18200"/>
	<Sentence text="... til að fá þig dæmdan frá embætti." time="20000"/> </SpeechActorMouth>

<!-- Ögmundur -->
<StaticActorFace name="af_Ogmundur_Stop" file="\SidaskiA\AnimatiA\ogmundur\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Ogmundur_Talk" repeat="-1" file="\SidaskiA\AnimatiA\ogmundur\talk" count="3" prepare="false" speed="150" random="true"/>
<CelledAnimated2DActorFace name="af_Ogmundur_Reidur" repeat="2" file="\SidaskiA\AnimatiA\ogmundur\reidur" count="5" prepare="false" xoffset="-105" yoffset="0" speed="75"/>

<Pseudo3DCollisionBox name="cb_Ogmundur" x="85" y="30" z="200"/>

<!-- Ögmundur staðsetning-->
<StaticActor name="a_Ogmundur" state="stop" terrain="t_FyrirUtanl" x="846" y="405" z="1" save="true" random="true">
	<State name="stop" face="af_Ogmundur_Stop" collisionbox="cb_Ogmundur"/>
	<State name="reidur" face="af_Ogmundur_Reidur" collisionbox="cb_Ogmundur"/>

	<State name="GodanDaginnGissurHvernig" face="af_Ogmundur_Talk" mouth="m_GodanDaginnGissurHvernig" collisionbox="cb_Ogmundur"/>
	<State name="ThuTalarBaraVid" face="af_Ogmundur_Talk" mouth="m_ThuTalarBaraVid" collisionbox="cb_Ogmundur"/>
	<State name="ThuVerdurBaraAdGaeta" face="af_Ogmundur_Talk" mouth="m_ThuVerdurBaraAdGaeta" collisionbox="cb_Ogmundur"/>
	<State name="ErThettaThuGissur" face="af_Ogmundur_Talk" mouth="m_ErThettaThuGissur" collisionbox="cb_Ogmundur"/>
	<State name="EgFrettiAdHelgirMunir" face="af_Ogmundur_Talk" mouth="m_EgFrettiAdHelgirMunir" collisionbox="cb_Ogmundur"/>
</StaticActor>

<PrepareQuantum	name="qp_FyrirUtan3" object="af_Ogmundur_Stop" prepare="true"/>
<PrepareQuantum	name="qp_FyrirUtan4" object="af_Ogmundur_Talk" prepare="true"/>
<PrepareQuantum	name="qp_FyrirUtan5" object="af_Ogmundur_Reidur" prepare="true"/>
<PrepareQuantum	name="qu_FyrirUtan3" object="af_Ogmundur_Stop" prepare="false"/>
<PrepareQuantum	name="qu_FyrirUtan4" object="af_Ogmundur_Talk" prepare="false"/>
<PrepareQuantum	name="qu_FyrirUtan5" object="af_Ogmundur_Reidur" prepare="false"/>

<ActorMoused actor="a_Ogmundur" listener="sc" moving="Ögmundur" taking="Hrinda Ögmundi" thf="Ögmund"/>

<!-- Conversation -->
<SentenceContainer name="conv_Ogmundur" scene="s_FyrirUtan" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta -->
<StateQuantum name="q_StopOgmundur" actor="a_Ogmundur" state="stop" wait="false"/>
<StateQuantum name="q_OgmundurPotar" actor="a_Ogmundur" state="reidur" wait="true"/>
<MoveActorQuantum name="qh_Ogmundur" actor="a_Ogmundur"/>


<!-- Quanta for sentences -->
<StateQuantum name="q_GodanDaginnGissurHvernig" actor="a_Ogmundur" state="GodanDaginnGissurHvernig" wait="true"/>
<StateQuantum name="q_ThuTalarBaraVid" actor="a_Ogmundur" state="ThuTalarBaraVid" wait="true"/>
<StateQuantum name="q_ThuVerdurBaraAdGaeta" actor="a_Ogmundur" state="ThuVerdurBaraAdGaeta" wait="true"/>
<StateQuantum name="q_ErThettaThuGissur" actor="a_Ogmundur" state="ErThettaThuGissur" wait="true"/>
<StateQuantum name="q_EgFrettiAdHelgirMunir" actor="a_Ogmundur" state="EgFrettiAdHelgirMunir" wait="true"/>


<!-- Puki -->
<!-- Sentences -->

<Text name="a_puki_acc" terrain="t_Corners" text=" " r="175" g="4" b="4" hilite="false"/>

<SpeechActorMouth acc="a_puki_acc" name="m_ThennanPokaFaerdThu" file="\sidaskiA\Media\puki\ThennanA.wav" >
	<Sentence text="Þennan poka færð þú aldrei." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_puki_acc" name="m_Hlatur" file="\sidaskiA\Media\puki\Hlatur.wav" >
	<Sentence text="Ha ha ha ha ha ha ha!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_puki_acc" name="m_Hlatur2" file="\sidaskiA\Media\puki\Hlatur2.wav" >
	<Sentence text="Ha ha ha ha ha ha ha" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_puki_acc" name="m_Vein" file="\sidaskiA\Media\puki\vein.wav" >
	<Sentence text="Aææææææææææ!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_puki_acc" name="m_ThuAumaJardneska" file="\sidaskiA\Media\puki\ThuAumaA.wav" >
	<Sentence text="Þú auma jarðneska vera." time="0"/>
	<Sentence text="Heldurðu virkilega að þú getir ráðið við mig." time="3200"/> </SpeechActorMouth>

<!-- Puki -->
<StaticActorFace name="af_Puki_Stop" file="\SidaskiA\AnimatiA\Puki\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Puki_Talk" repeat="-1" file="\SidaskiA\AnimatiA\Puki\talk" count="4" prepare="false" speed="75" random="true"/>
<CelledAnimated2DActorFace name="af_Puki_Forkur" repeat="2" file="\SidaskiA\AnimatiA\Puki\forkur" count="2" prepare="false" speed="225" xoffset="-45" yoffset="1"/>
<CelledAnimated2DActorFace name="af_Puki_Hali" repeat="-1" file="\SidaskiA\AnimatiA\Puki\hali" count="4" prepare="false" speed="225"/>
<CelledAnimated2DActorFace name="af_Puki_Hopp" repeat="2" file="\SidaskiA\AnimatiA\Puki\hopp" count="3" prepare="false" speed="300" xoffset="-27" yoffset="-20"/>
<CelledAnimated2DActorFace name="af_Puki_Hlatur" repeat="-1" file="\SidaskiA\AnimatiA\Puki\hlatur" count="3" prepare="false" speed="225"/>
<CelledAnimated2DActorFace name="af_Puki_Hverfur" repeat="1" file="\SidaskiA\AnimatiA\Puki\hverfur" count="4" prepare="false" speed="450"/>

<PrepareQuantum name="qp_Svefnherbergi4" object="af_Puki_Talk" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi4" object="af_Puki_Talk" prepare="false"/>
<PrepareQuantum name="qp_Svefnherbergi5" object="af_Puki_Forkur" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi5" object="af_Puki_Forkur" prepare="false"/>
<PrepareQuantum name="qp_Svefnherbergi6" object="af_Puki_Hopp" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi6" object="af_Puki_Hopp" prepare="false"/>
<PrepareQuantum name="qp_Svefnherbergi9" object="af_Puki_Hali" prepare="true"/>
<PrepareQuantum name="qu_Svefnherbergi9" object="af_Puki_Hali" prepare="false"/>
<PrepareQuantum	name="qp_Svefnherbergi8" object="af_Puki_Hlatur" prepare="true"/>
<PrepareQuantum	name="qu_Svefnherbergi8" object="af_Puki_Hlatur" prepare="false"/>
<PrepareQuantum	name="qp_Svefnherbergi7" object="af_Puki_Hverfur" prepare="true"/>
<PrepareQuantum	name="qu_Svefnherbergi7" object="af_Puki_Hverfur" prepare="false"/>

<!-- Puki staðsetning-->
<StaticActor name="a_Puki" state="stop" x="447" y="384" z="20" save="true" random="true">
	<State name="stop" face="af_Puki_Stop"/>
	<State name="ThennanPokaFaerdThu" face="af_Puki_Talk" mouth="m_ThennanPokaFaerdThu"/>
	<State name="Hlatur" face="af_Puki_Hlatur" mouth="m_Hlatur"/>
	<State name="Hlatur2" face="af_Puki_Hlatur" mouth="m_Hlatur2"/>
	<State name="ThuAumaJardneska" face="af_Puki_Talk" mouth="m_ThuAumaJardneska"/>
	<State name="forkur" face="af_Puki_Forkur" />
	<State name="hali" face="af_Puki_Hali" />
	<State name="hverfur" face="af_Puki_Hverfur" mouth="m_Vein"/>
	<State name="hopp" face="af_Puki_Hopp" />
</StaticActor>
<ActorMoused actor="a_Puki" listener="sc" moving="Púki" thf="púka" taking="Hrinda púka"/>

<!-- Quanta -->
<StateQuantum name="q_StopPuki" actor="a_Puki" state="stop"/>
<StateQuantum name="q_ForkurPuki" actor="a_Puki" state="forkur" wait="true"/>
<StateQuantum name="q_HaliPuki" actor="a_Puki" state="hali"/>
<StateQuantum name="q_HoppPuki" actor="a_Puki" state="hopp" wait="true"/>
<StateQuantum name="q_PukiHverfur" actor="a_Puki" state="hverfur" wait="true"/>

<MoveActorQuantum name="qs_Puki" actor="a_Puki" terrain="t_Svefnherbergil"/>
<MoveActorQuantum name="qh_Puki" actor="a_Puki"/>

<!-- Quanta for sentences -->
<StateQuantum name="q_ThennanPokaFaerdThu" actor="a_Puki" state="ThennanPokaFaerdThu" wait="true"/>
<StateQuantum name="q_Hlatur" actor="a_Puki" state="Hlatur" wait="true"/>
<StateQuantum name="q_Hlatur2" actor="a_Puki" state="Hlatur2" wait="true"/>
<StateQuantum name="q_ThuAumaJardneska" actor="a_Puki" state="ThuAumaJardneska" wait="true"/>


<Sequence name="s_Puki45">
	<Quantum name="q_ForkurPuki"/>
	<Quantum name="q_Hlatur"/>
	<Quantum name="q_HoppPuki"/>
</Sequence>

<Sequence name="s_Puki46">
	<Quantum name="q_ForkurPuki"/>
	<Quantum name="q_HoppPuki"/>
	<Quantum name="q_Hlatur2"/>
</Sequence>

<Sequence name="s_Puki47">
	<Quantum name="q_Hlatur"/>
	<Quantum name="q_ForkurPuki"/>
	<Quantum name="q_HoppPuki"/>
</Sequence>

<Sequence name="s_Puki48">
	<Quantum name="q_HoppPuki"/>
	<Quantum name="q_Hlatur2"/>
	<Quantum name="q_ForkurPuki"/>
</Sequence>

<Sequence name="s_Puki49">
	<Quantum name="q_HoppPuki"/>
	<Quantum name="q_ForkurPuki"/>
	<Quantum name="q_Hlatur2"/>
</Sequence>

<Sequence name="s_Puki50">
	<Quantum name="q_Hlatur"/>
	<Quantum name="q_HoppPuki"/>
	<Quantum name="q_ForkurPuki"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPukaOrder" flag="f_Random6" wait="true">
	<Trigger value="0" seq="s_Puki45"/>
	<Trigger value="1" seq="s_Puki46"/>
	<Trigger value="2" seq="s_Puki47"/>
	<Trigger value="3" seq="s_Puki48"/>
	<Trigger value="4" seq="s_Puki49"/>
	<Trigger value="5" seq="s_Puki50"/>
</CheckConditionQuantum>

<Sequence name="s_PukiHlaer">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="q_Randomize6"/>
	<Quantum name="q_CheckPukaOrder"/>
	<Quantum name="q_HaliPuki"/>
	<Quantum name="q_Moving"/>
</Sequence>

<!-- Vinnumadur -->

<Text name="a_vinnumadur_acc" terrain="t_Corners" text=" " r="236" g="200" b="170" hilite="false"/>

<!-- Sentences -->
<SpeechActorMouth acc="a_vinnumadur_acc" name="m_KomidTherSaelir" file="\sidaskiA\Media\vinnumaA\KomidThA.wav" >
	<Sentence text="Komið þér sælir, herra Gissur." time="0"/>
	<Sentence text="Ég heiti Bergur og er nýbyrjaður ..." time="2500"/>
	<Sentence text="... sem vinnumaður hérna í Skálholti." time="4550"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_vinnumadur_acc" name="m_KomidTherSaelirHerraGissur" file="\sidaskiA\Media\vinnumaA\KomidThB.wav" >
	<Sentence text="Komið þér sælir, herra Gissur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_vinnumadur_acc" name="m_MerLidurAgaetlega" file="\sidaskiA\Media\vinnumaA\MerLiduA.wav" >
	<Sentence text="Mér líður ágætlega." time="0"/>
	<Sentence text="Það er gaman að geta orðið að gagni ..." time="1780"/>
	<Sentence text="... á svo merkum stað sem Skálholt er." time="3580"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_vinnumadur_acc" name="m_JuSvoSannarlega" file="\sidaskiA\Media\vinnumaA\JuSvoSaA.wav" >
	<Sentence text="Jú! Svo sannarlega!" time="0"/>
	<Sentence text="Ögmundur Pálsson fól mér sendibréf ..." time="2600"/>
	<Sentence text="... sem er ætlað sjálfum Hólabiskupi, Jóni Arasyni." time="4620"/>
	<Sentence text="Ég er að bíða eftir hópi manna ..." time="8450"/>
	<Sentence text="... sem ég fæ að ríða með norður í land ..." time="10550"/>
	<Sentence text="... seinna í dag til að ég geti komið bréfinu til Jóns." time="12200"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_vinnumadur_acc" name="m_EgGetThviMidur" file="\sidaskiA\Media\vinnumaA\EgGetThA.wav" >
	<Sentence text="Ég get því miður ekki orðið við ósk þinni ..." time="0"/>
	<Sentence text="... því að Ögmundur tók það skýrt fram ..." time="2800"/>
	<Sentence text="... að ég mætti alls ekki láta neinn annan ..." time="4700"/>
	<Sentence text="... en Jón sjálfan fá bréfið." time="6300"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_vinnumadur_acc" name="m_VaaaThakkaTher" file="\sidaskiA\Media\vinnumaA\VaaaThaA.wav" >
	<Sentence text="Vá! Þakka þér innilega fyrir." time="0"/>
	<Sentence text="Ég hef aldrei átt svona peninga áður!" time="3050"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_vinnumadur_acc" name="m_JaaEfThuLofar" file="\sidaskiA\Media\vinnumaA\JaaEfThA.wav" >
	<Sentence text="Ef þú lofar að segja Ögmundi ekki neitt ..." time="0"/>
	<Sentence text="... þá er ég viss um að hann áttar sig ekkert á því ..." time="2850"/>
	<Sentence text="... að ég hafi ekki komið því til skila." time="4600"/>
	<Sentence text="Hann er orðinn svo gamall og lúinn." time="6400"/> </SpeechActorMouth>

<!-- Vinnumadur -->
<StaticActorFace name="af_Vinnumadur_Stop" file="\SidaskiA\AnimatiA\VinnumaA\stop" prepare="false"/>
<StaticActorFace name="af_Vinnumadur_StopAnBrefs" file="\SidaskiA\AnimatiA\VinnumaA\stopanbA" prepare="false"/>
<CelledAnimated2DActorFace name="af_Vinnumadur_Talk" repeat="-1" file="\SidaskiA\AnimatiA\VinnumaA\talk" count="4" prepare="false" speed="150" random="true"/>
<CelledAnimated2DActorFace name="af_Vinnumadur_Gefur" repeat="1" file="\SidaskiA\AnimatiA\VinnumaA\gefbref" speed="225" count="6" prepare="false"/>
<Pseudo3DCollisionBox name="cb_Vinnumadur" x="150" y="30" z="250"/>
<StaticActor name="a_Vinnumadur" state="stop" x="1075" y="500" z="1" save="true" random="true">
	<State name="stop" face="af_Vinnumadur_Stop" collisionbox="cb_Vinnumadur"/>
	<State name="stopanbrefs" face="af_Vinnumadur_StopAnBrefs" collisionbox="cb_Vinnumadur" />
	<State name="gefur" face="af_Vinnumadur_Gefur"  collisionbox="cb_Vinnumadur"/>

	<State name="KomidTherSaelir" face="af_Vinnumadur_Talk" mouth="m_KomidTherSaelir" collisionbox="cb_Vinnumadur"/>
	<State name="KomidTherSaelirHerraGissur" face="af_Vinnumadur_Talk" mouth="m_KomidTherSaelirHerraGissur" collisionbox="cb_Vinnumadur"/>
	<State name="MerLidurAgaetlega" face="af_Vinnumadur_Talk" mouth="m_MerLidurAgaetlega" collisionbox="cb_Vinnumadur"/>
	<State name="JuSvoSannarlega" face="af_Vinnumadur_Talk" mouth="m_JuSvoSannarlega" collisionbox="cb_Vinnumadur"/>
	<State name="EgGetThviMidur" face="af_Vinnumadur_Talk" mouth="m_EgGetThviMidur" collisionbox="cb_Vinnumadur"/>
	<State name="VaaaThakkaTher" face="af_Vinnumadur_Talk" mouth="m_VaaaThakkaTher" collisionbox="cb_Vinnumadur"/>
	<State name="JaaEfThuLofar" face="af_Vinnumadur_Talk" mouth="m_JaaEfThuLofar" collisionbox="cb_Vinnumadur"/>
</StaticActor>
<ActorMoused actor="a_Vinnumadur" listener="sc" thf="vinnumann" taking="Hrinda vinnumanni" moving="Vinnumaður"/>
<PrepareQuantum	name="qp_FyrirUtan1" object="af_Vinnumadur_Stop" prepare="true"/>
<PrepareQuantum	name="qp_FyrirUtan2" object="af_Vinnumadur_StopAnBrefs" prepare="true"/>
<PrepareQuantum	name="qu_FyrirUtan1" object="af_Vinnumadur_Stop" prepare="false"/>
<PrepareQuantum	name="qu_FyrirUtan2" object="af_Vinnumadur_StopAnBrefs" prepare="false"/>
<PrepareQuantum	name="qp_FyrirUtan7" object="af_Vinnumadur_Gefur" prepare="true"/>
<PrepareQuantum	name="qp_FyrirUtan8" object="af_Vinnumadur_Talk" prepare="true"/>
<PrepareQuantum	name="qu_FyrirUtan7" object="af_Vinnumadur_Gefur" prepare="false"/>
<PrepareQuantum	name="qu_FyrirUtan8" object="af_Vinnumadur_Talk" prepare="false"/>

<!-- Conversation -->
<SentenceContainer name="conv_Vinnumadur" scene="s_FyrirUtan" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta -->
<StateQuantum name="q_StopVinnumadur" actor="a_Vinnumadur" state="stop" wait="false"/>
<StateQuantum name="q_VinnumadurGefur" actor="a_Vinnumadur" state="gefur" wait="true"/>
<StateQuantum name="q_StopVinnumadurAnBrefs" actor="a_Vinnumadur" state="stopanbrefs" wait="false"/>

<!-- Quanta for sentences -->
<StateQuantum name="q_KomidTherSaelir" actor="a_Vinnumadur" state="KomidTherSaelir" wait="true"/>
<StateQuantum name="q_KomidTherSaelirHerraGissur" actor="a_Vinnumadur" state="KomidTherSaelirHerraGissur" wait="true"/>
<StateQuantum name="q_MerLidurAgaetlega" actor="a_Vinnumadur" state="MerLidurAgaetlega" wait="true"/>
<StateQuantum name="q_JuSvoSannarlega" actor="a_Vinnumadur" state="JuSvoSannarlega" wait="true"/>
<StateQuantum name="q_EgGetThviMidur" actor="a_Vinnumadur" state="EgGetThviMidur" wait="true"/>
<StateQuantum name="q_VaaaThakkaTher" actor="a_Vinnumadur" state="VaaaThakkaTher" wait="true"/>
<StateQuantum name="q_JaaEfThuLofar" actor="a_Vinnumadur" state="JaaEfThuLofar" wait="true"/>

<MoveActorQuantum name="qs_Vinnumadur" actor="a_Vinnumadur" terrain="t_FyrirUtanl"/>

<StaticActorFace name="af_SendibrefU" file="\SidaskiA\Graphic\hlutir\sendibrB" prepare="true"/>
<StaticActor name="a_Sendibref" x="0" y="0" z="0" state="stop" save="true" random="true">
	<State name="taken" face="af_SendibrefI"/>
	<State name="use" face="af_SendibrefU"/>
</StaticActor>
<StateQuantum name="q_SendibrefTaken" actor="a_Sendibref" state="taken"/>
<MoveActorQuantum name="q_MoveSendibref2Inventory" actor="a_Sendibref" terrain="t_Inventory"/>
<ActorMoused actor="a_Sendibref" listener="sc" moving=" " thf="bréf til Jóns Arasonar" />

<!-- Ráðsmaðurinn-->

<Text name="a_radsmadur_acc" terrain="t_Corners" text=" " r="255" g="20" b="48" hilite="false"/>

<!-- Conversation -->
<SentenceContainer name="conv_Radsmadur" scene="s_Kirkja" polygon="p_Kirkja" zmin="801" zmax="1200"/>

<!-- Sentences -->
<SpeechActorMouth acc="a_radsmadur_acc" name="m_HvadErtThuAdGera" file="\sidaskiA\Media\radsmadA\hvadertA.wav">
	<Sentence text="Hvað ert þú að gera, Gissur?" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth acc="a_radsmadur_acc" name="m_AMedanEgEr" file="\sidaskiA\Media\radsmadA\amedaneA.wav">
	<Sentence text="Á meðan ég er ráðsmaður hér ..." time="0"/>
	<Sentence text="... fara þessir munir ekki út úr kirkjunni." time="2550"/>
	<Sentence text="Ef þú vilt halda friðinn, herra biskup, ..." time="6000"/>
	<Sentence text="... legg ég til að þú skilir þeim á sinn stað!" time="8700"/>
</SpeechActorMouth>


<!-- Actor -->
<StaticActorFace name="af_Radsmadur_Stop" file="\SidaskiA\AnimatiA\RadsmadA\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Radsmadur_Talk" repeat="-1" file="\SidaskiA\AnimatiA\RadsmadA\talk" count="3" prepare="false" random="true"/>
<StaticActor name="a_Radsmadur" state="stop" terrain="t_Kirkjal" x="890" y="350" z="100"  random="true">
	<State name="stop" face="af_Radsmadur_Stop" />
	<State name="HvadErtThuAdGera" face="af_Radsmadur_Talk" mouth="m_HvadErtThuAdGera"/>
	<State name="AMedanEgEr" face="af_Radsmadur_Talk" mouth="m_AMedanEgEr"/>
</StaticActor>
<ActorMoused actor="a_Radsmadur" listener="sc" thf="ráðsmann" moving="Ráðsmaður" taking="Hrinda ráðsmanni"/>
<PrepareQuantum	name="qp_Kirkja6" object="af_Radsmadur_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja6" object="af_Radsmadur_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Kirkja7" object="af_Radsmadur_Talk" prepare="true"/>
<PrepareQuantum	name="qu_Kirkja7" object="af_Radsmadur_Talk" prepare="false"/>

<!-- Quanta -->
<StateQuantum name="q_StopRadsmadur" actor="a_Radsmadur" state="stop" wait="false"/>

<!-- Quanta for sentences -->
<StateQuantum name="q_HvadErtThuAdGera" actor="a_Radsmadur" state="HvadErtThuAdGera" wait="true"/>
<StateQuantum name="q_AMedanEgEr" actor="a_Radsmadur" state="AMedanEgEr" wait="true"/>



<!-- Kristofer -->

<Text name="a_kristofer_acc" terrain="t_Corners" text=" " r="10" g="146" b="90" hilite="false"/>

<!-- Sentences -->
<SpeechActorMouth acc="a_kristofer_acc" name="m_HeillOgSaellHerra" file="\sidaskiA\Media\kristofA\HeillOgA.wav" >
	<Sentence text="Heill og sæll, herra Gissur Einarsson." time="0"/>
	<Sentence text="Kristján konungur biður að heilsa þér." time="3500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_HeillOgSaellHerra2" file="\sidaskiA\Media\kristofA\heillogB.wav" >
	<Sentence text="Heill og sæll, herra Gissur Einarsson." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_ThakkaTherFyrirHerra" file="\sidaskiA\Media\kristofA\ThakkaTA.wav" >
	<Sentence text="Þakka þér fyrir, herra Gissur, ..." time="0"/>
	<Sentence text="... og ég vil nota tækifærið ..." time="2450"/>
	<Sentence text="... og óska þér til hamingju ..." time="4400"/>
	<Sentence text="... með biskupsstólinn á Skálholti." time="6000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_BaraVelThakka" file="\sidaskiA\Media\kristofA\BaraVelA.wav" >
	<Sentence text="Bara vel, þakka þér fyrir." time="0"/>
	<Sentence text="Við fengum ágætan byr!" time="2000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_OgFulltingiMitt" file="\sidaskiA\Media\kristofA\OgFulltA.wav" >
	<Sentence text="Og fulltingi mitt færðu svo sannarlega." time="0"/>
	<Sentence text="Ég hef umboð konungs til að handtaka Ögmund Pálsson ..." time="3600"/>
	<Sentence text="... fyrir þátt sinn í morðinu á Diðriki frá Minden." time="7400"/>
	<Sentence text="Ég mun einnig hjálpa þér við að koma á ..." time="10650"/>
	<Sentence text="... lútherskri kirkjuskipan hér á landi." time="12950"/>
	<Sentence text="Ég frétti að refurinn hann Ögmundur ..." time="15650"/>
	<Sentence text="... hefði flúið frá Skálholti ..." time="17450"/>
	<Sentence text="... eftir að hann heyrði af komu minni til landsins." time="19050"/>
	<Sentence text="Veistu nokkuð hvar hann er niður kominn?" time="21450"/>
	</SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_ReykjavikAfHverju" file="\sidaskiA\Media\kristofA\ReykjavA.wav" >
	<Sentence text="Reykjavík!" time="0"/>
	<Sentence text="Af hverju ætti hann að hafa farið þangað?" time="1850"/>
	<Sentence text="Þar er ekkert annað en nokkrir fátæklegir bóndabæir." time="3920"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_ThadGeturVarla" file="\sidaskiA\Media\kristofA\ThadGetA.wav" >
	<Sentence text="Það getur varla staðist!" time="0"/>
	<Sentence text="Samkvæmt mínum upplýsingum ..." time="1900"/>
	<Sentence text="... flúði hann þaðan ..." time="3450"/>
	<Sentence text="... þegar hann heyrði af komu minni." time="4400"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_ThadGaetiVerid" file="\sidaskiA\Media\kristofA\ThadGaeA.wav" >
	<Sentence text="Það gæti verið rétt hjá þér!" time="0"/>
	<Sentence text="Ég, og mínir menn, leggjum strax af stað þangað ..." time="1900"/>
	<Sentence text="... og hefjum leit að manninum." time="4200"/>
	<Sentence text="En fyrst vil ég að þú takir við þessum dýrmæta steini ..." time="6000"/>
	<Sentence text="... sem eitt sinn var víst í eigu Marteins Lúthers." time="9600"/>
	<Sentence text="Hver veit nema hann eigi eftir að hjálpa þér í framtíðinni." time="12800"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_NeiEgHeldEkki" file="\sidaskiA\Media\kristofA\NeiEgHeA.wav" >
	<Sentence text="Nei, ég held ekki!" time="0"/>
	<Sentence text="Sérð þú hann?" time="1900"/>
	<Sentence text="Ekki ég!" time="3100"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_EgSemHeltAd" file="\sidaskiA\Media\kristofA\EgSemHeA.wav" >
	<Sentence text="Ég sem hélt að það væru engir augnlæknar á Íslandi!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_kristofer_acc" name="m_VeistuNokkudHvar" file="\sidaskiA\Media\kristofA\veistunA.wav" >
	<Sentence text="Veistu nokkuð hvar Ögmundur er niður kominn?" time="0"/>
	<Sentence text="Við verðum að handtaka hann!" time="3000"/> </SpeechActorMouth>

<!-- Kristofer -->
<StaticActorFace name="af_Kristofer_Stop" file="\SidaskiA\AnimatiA\KristofA\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Kristofer_Heilsar" repeat="2" file="\SidaskiA\AnimatiA\KristofA\heilsar" count="1" speed="300" prepare="false"/>
<CelledAnimated2DActorFace name="af_Kristofer_Talk" repeat="-1" file="\SidaskiA\AnimatiA\KristofA\talk" count="2" speed="150" prepare="false" random="true"/>
<CelledAnimated2DActorFace name="af_Kristofer_Gefur" repeat="1" file="\SidaskiA\AnimatiA\KristofA\gefurstA" count="7" speed="225" prepare="false" xoffset="-28" yoffset="0"/>
<Pseudo3DCollisionBox name="cb_Kristofer" x="90" y="30" z="270"/>
<StaticActor name="a_Kristofer" state="stop" x="450" y="530" z="1" save="true" random="true">
	<State name="stop" face="af_Kristofer_Stop" collisionbox="cb_Kristofer"/>
	<State name="heilsar" face="af_Kristofer_Heilsar" collisionbox="cb_Kristofer"/>
	<State name="gefur" face="af_Kristofer_Gefur" collisionbox="cb_Kristofer"/>

	<State name="HeillOgSaellHerra" face="af_Kristofer_Talk" mouth="m_HeillOgSaellHerra" collisionbox="cb_Kristofer"/>
	<State name="ThakkaTherFyrirHerra" face="af_Kristofer_Talk" mouth="m_ThakkaTherFyrirHerra" collisionbox="cb_Kristofer"/>
	<State name="BaraVelThakka" face="af_Kristofer_Talk" mouth="m_BaraVelThakka" collisionbox="cb_Kristofer"/>
	<State name="OgFulltingiMitt" face="af_Kristofer_Talk" mouth="m_OgFulltingiMitt" collisionbox="cb_Kristofer"/>
	<State name="ReykjavikAfHverju" face="af_Kristofer_Talk" mouth="m_ReykjavikAfHverju" collisionbox="cb_Kristofer"/>
	<State name="ThadGeturVarla" face="af_Kristofer_Talk" mouth="m_ThadGeturVarla" collisionbox="cb_Kristofer"/>
	<State name="ThadGaetiVerid" face="af_Kristofer_Talk" mouth="m_ThadGaetiVerid" collisionbox="cb_Kristofer"/>
	<State name="NeiEgHeldEkki" face="af_Kristofer_Talk" mouth="m_NeiEgHeldEkki" collisionbox="cb_Kristofer"/>
	<State name="EgSemHeltAd" face="af_Kristofer_Talk" mouth="m_EgSemHeltAd" collisionbox="cb_Kristofer"/>
	<State name="VeistuNokkudHvar" face="af_Kristofer_Talk" mouth="m_VeistuNokkudHvar" collisionbox="cb_Kristofer"/>
	<State name="HeillOgSaellHerra2" face="af_Kristofer_Talk" mouth="m_HeillOgSaellHerra2" collisionbox="cb_Kristofer"/>
</StaticActor>
<ActorMoused actor="a_Kristofer" listener="sc" moving="Kristófer Hvítfeldur" thf="Kristófer" taking="Hrinda Kristófer"/>
<StateQuantum name="q_StopKristofer" actor="a_Kristofer" state="stop" wait="false"/>
<StateQuantum name="q_KristoferHeilsar" actor="a_Kristofer" state="heilsar" wait="true"/>
<StateQuantum name="q_KristoferGefur" actor="a_Kristofer" state="gefur" wait="true"/>


<!-- Conversation -->
<SentenceContainer name="conv_Kristofer" scene="s_Kopavogur" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta for sentences -->
<StateQuantum name="q_HeillOgSaellHerra" actor="a_Kristofer" state="HeillOgSaellHerra" wait="true"/>
<StateQuantum name="q_HeillOgSaellHerra2" actor="a_Kristofer" state="HeillOgSaellHerra2" wait="true"/>
<StateQuantum name="q_ThakkaTherFyrirHerra" actor="a_Kristofer" state="ThakkaTherFyrirHerra" wait="true"/>
<StateQuantum name="q_BaraVelThakka" actor="a_Kristofer" state="BaraVelThakka" wait="true"/>
<StateQuantum name="q_OgFulltingiMitt" actor="a_Kristofer" state="OgFulltingiMitt" wait="true"/>
<StateQuantum name="q_ReykjavikAfHverju" actor="a_Kristofer" state="ReykjavikAfHverju" wait="true"/>
<StateQuantum name="q_ThadGeturVarla" actor="a_Kristofer" state="ThadGeturVarla" wait="true"/>
<StateQuantum name="q_ThadGaetiVerid" actor="a_Kristofer" state="ThadGaetiVerid" wait="true"/>
<StateQuantum name="q_NeiEgHeldEkki" actor="a_Kristofer" state="NeiEgHeldEkki" wait="true"/>
<StateQuantum name="q_EgSemHeltAd" actor="a_Kristofer" state="EgSemHeltAd" wait="true"/>
<StateQuantum name="q_VeistuNokkudHvar" actor="a_Kristofer" state="VeistuNokkudHvar" wait="true"/>

<PrepareQuantum	name="qp_Kopavogur7" object="af_Kristofer_Stop" prepare="true"/>
<PrepareQuantum	name="qp_Kopavogur8" object="af_Kristofer_Heilsar" prepare="true"/>
<PrepareQuantum	name="qp_Kopavogur9" object="af_Kristofer_Gefur" prepare="true"/>
<PrepareQuantum	name="qp_Kopavogur10" object="af_Kristofer_Talk" prepare="true"/>
<PrepareQuantum	name="qu_Kopavogur7" object="af_Kristofer_Stop" prepare="false"/>
<PrepareQuantum	name="qu_Kopavogur8" object="af_Kristofer_Heilsar" prepare="false"/>
<PrepareQuantum	name="qu_Kopavogur9" object="af_Kristofer_Gefur" prepare="false"/>
<PrepareQuantum	name="qu_Kopavogur10" object="af_Kristofer_Talk" prepare="false"/>

<MoveActorQuantum name="qs_Kristofer" actor="a_Kristofer" terrain="t_Kopavogurl"/>

<Sequence name="s_ShowKonungsmenn">
	<Quantum name="qs_Kristofer"/>
	<Quantum name="qs_Konungsmenn"/>
	<Quantum name="qs_Skip"/>
	<Quantum name="qs_Batur"/>
</Sequence>
<CheckConditionQuantum name="qs_KonungsmennAll" flag="f_Zero" wait="true">
	<Trigger value="0" seq="s_ShowKonungsmenn"/>
</CheckConditionQuantum>


<!-- Quanta -->
<UseText actor="a_SalmabokGaldur" actor2="a_Puki" listener="sc" text="Lesa galdraþulu í Nýja testamenti"/>
<ActorMoused actor="a_Fuli" listener="sc" moving="Þögull maður" thf="þöglan mann" />

<!-- Prepare Galdrabok -->
<PrepareQuantum name="qp_GaldrabokLarge" object="af_GaldrabokLarge" prepare="true"/>
<PrepareQuantum name="qu_GaldrabokLarge" object="af_GaldrabokLarge" prepare="false"/>

<!-- Prepare Sendibref -->
<PrepareQuantum name="qp_SendibrefLarge" object="af_SendibrefLarge" prepare="true"/>
<PrepareQuantum name="qu_SendibrefLarge" object="af_SendibrefLarge" prepare="false"/>

<!-- Prepare Bladsida -->
<PrepareQuantum name="qp_BladsidaLarge" object="af_BladsidaLarge" prepare="true"/>
<PrepareQuantum name="qu_BladsidaLarge" object="af_BladsidaLarge" prepare="false"/>

<Sequence name="sp_Map">
    <Quantum name="qp_Map1"/>
    <Quantum name="qp_Map2"/>
    <Quantum name="qp_Map3"/>
    <Quantum name="qp_Map4"/>
    <Quantum name="qp_Map5"/>
</Sequence>

<CheckConditionQuantum name="qp_Map" flag="f_Zero" wait="true">
    <Trigger value="0" seq="sp_Map"/>
</CheckConditionQuantum>

<Sequence name="su_Map">
    <Quantum name="qu_Map1"/>
    <Quantum name="qu_Map2"/>
    <Quantum name="qu_Map3"/>
    <Quantum name="qu_Map4"/>
    <Quantum name="qu_Map5"/>
</Sequence>

<CheckConditionQuantum name="qu_Map" flag="f_Zero" wait="true">
    <Trigger value="0" seq="su_Map"/>
</CheckConditionQuantum>

<Sequence name="su_Askur">
	<Quantum name="qu_Askur0"/>
	<Quantum name="qu_Askur1"/>
	<Quantum name="qu_Askur2"/>
	<Quantum name="qu_Askur3"/>
	<Quantum name="qu_Askur4"/>
</Sequence>
<CheckConditionQuantum name="qu_Askur" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Askur"/>
</CheckConditionQuantum>

<Sequence name="sp_Askur">
	<Quantum name="qp_Askur0"/>
	<Quantum name="qp_Askur1"/>
	<Quantum name="qp_Askur2"/>
	<Quantum name="qp_Askur3"/>
	<Quantum name="qp_Askur4"/>
</Sequence>
<CheckConditionQuantum name="qp_Askur" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Askur"/>
</CheckConditionQuantum>

<Sequence name="su_FyrirUtan">
	<Quantum name="qu_FyrirUtan0"/>
	<Quantum name="qu_FyrirUtan01"/>
	<Quantum name="qu_FyrirUtan1"/>
	<Quantum name="qu_FyrirUtan2"/>
	<Quantum name="qu_FyrirUtan3"/>
	<Quantum name="qu_FyrirUtan4"/>
	<Quantum name="qu_FyrirUtan5"/>
	<Quantum name="qu_FyrirUtan6"/>
	<Quantum name="qu_FyrirUtan7"/>
	<Quantum name="qu_FyrirUtan8"/>
</Sequence>
<CheckConditionQuantum name="qu_FyrirUtan" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_FyrirUtan"/>
</CheckConditionQuantum>

<Sequence name="sp_FyrirUtan">
	<Quantum name="qp_FyrirUtan0"/>
	<Quantum name="qp_FyrirUtan01"/>
	<Quantum name="qp_FyrirUtan1"/>
	<Quantum name="qp_FyrirUtan2"/>
	<Quantum name="qp_FyrirUtan3"/>
	<Quantum name="qp_FyrirUtan4"/>
	<Quantum name="qp_FyrirUtan5"/>
	<Quantum name="qp_FyrirUtan6"/>
	<Quantum name="qp_FyrirUtan7"/>
	<Quantum name="qp_FyrirUtan8"/>
</Sequence>
<CheckConditionQuantum name="qp_FyrirUtan" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_FyrirUtan"/>
</CheckConditionQuantum>

<Sequence name="sp_Kirkja">
	<Quantum name="qp_Kirkja0"/>
	<Quantum name="qp_Kirkja01"/>
	<Quantum name="qp_Kirkja1"/>
	<Quantum name="qp_Kirkja2"/>
	<Quantum name="qp_Kirkja3"/>
	<Quantum name="qp_Kirkja4"/>
	<Quantum name="qp_Kirkja5"/>
	<Quantum name="qp_Kirkja6"/>
	<Quantum name="qp_Kirkja7"/>
	<Quantum name="qp_Kirkja8"/>
	<Quantum name="qp_Kirkja9"/>
	<Quantum name="qp_Kirkja10"/>
</Sequence>
<CheckConditionQuantum name="qp_Kirkja" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Kirkja"/>
</CheckConditionQuantum>

<Sequence name="su_Kirkja">
	<Quantum name="qu_Kirkja0"/>
	<Quantum name="qu_Kirkja01"/>
	<Quantum name="qu_Kirkja1"/>
	<Quantum name="qu_Kirkja2"/>
	<Quantum name="qu_Kirkja3"/>
	<Quantum name="qu_Kirkja4"/>
	<Quantum name="qu_Kirkja5"/>
	<Quantum name="qu_Kirkja6"/>
	<Quantum name="qu_Kirkja7"/>
	<Quantum name="qu_Kirkja8"/>
	<Quantum name="qu_Kirkja9"/>
	<Quantum name="qu_Kirkja10"/>
</Sequence>
<CheckConditionQuantum name="qu_Kirkja" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Kirkja"/>
</CheckConditionQuantum>

<Sequence name="sp_HjaBryta">
	<Quantum name="qp_HjaBryta0"/>
	<Quantum name="qp_HjaBryta1"/>
	<Quantum name="qp_HjaBryta2"/>
	<Quantum name="qp_HjaBryta3"/>
	<Quantum name="qp_HjaBryta4"/>
	<Quantum name="qp_HjaBryta5"/>
	<Quantum name="qp_HjaBryta6"/>
	<Quantum name="qp_HjaBryta7"/>
	<Quantum name="qp_HjaBryta8"/>
	<Quantum name="qp_HjaBryta9"/>
	<Quantum name="qp_HjaBryta10"/>
</Sequence>
<CheckConditionQuantum name="qp_HjaBryta" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_HjaBryta"/>
</CheckConditionQuantum>

<Sequence name="su_HjaBryta">
	<Quantum name="qu_HjaBryta0"/>
	<Quantum name="qu_HjaBryta1"/>
	<Quantum name="qu_HjaBryta2"/>
	<Quantum name="qu_HjaBryta3"/>
	<Quantum name="qu_HjaBryta4"/>
	<Quantum name="qu_HjaBryta5"/>
	<Quantum name="qu_HjaBryta6"/>
	<Quantum name="qu_HjaBryta7"/>
	<Quantum name="qu_HjaBryta8"/>
	<Quantum name="qu_HjaBryta9"/>
	<Quantum name="qu_HjaBryta10"/>
</Sequence>
<CheckConditionQuantum name="qu_HjaBryta" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_HjaBryta"/>
</CheckConditionQuantum>

<Sequence name="sp_Svefnherbergi">
	<Quantum name="qp_Svefnherbergi0"/>
	<Quantum name="qp_Svefnherbergi1"/>
	<Quantum name="qp_Svefnherbergi2"/>
	<Quantum name="qp_Svefnherbergi3"/>
	<Quantum name="qp_Svefnherbergi4"/>
	<Quantum name="qp_Svefnherbergi5"/>
	<Quantum name="qp_Svefnherbergi6"/>
	<Quantum name="qp_Svefnherbergi7"/>
	<Quantum name="qp_Svefnherbergi8"/>
	<Quantum name="qp_Svefnherbergi9"/>
</Sequence>
<CheckConditionQuantum name="qp_Svefnherbergi" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Svefnherbergi"/>
</CheckConditionQuantum>

<Sequence name="su_Svefnherbergi">
	<Quantum name="qu_Svefnherbergi0"/>
	<Quantum name="qu_Svefnherbergi1"/>
	<Quantum name="qu_Svefnherbergi2"/>
	<Quantum name="qu_Svefnherbergi3"/>
	<Quantum name="qu_Svefnherbergi4"/>
	<Quantum name="qu_Svefnherbergi5"/>
	<Quantum name="qu_Svefnherbergi6"/>
	<Quantum name="qu_Svefnherbergi7"/>
	<Quantum name="qu_Svefnherbergi8"/>
	<Quantum name="qu_Svefnherbergi9"/>
</Sequence>
<CheckConditionQuantum name="qu_Svefnherbergi" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Svefnherbergi"/>
</CheckConditionQuantum>

<Sequence name="sp_Skrifstofa">
	<Quantum name="qp_Skrifstofa0"/>
	<Quantum name="qp_Skrifstofa1"/>
	<Quantum name="qp_Skrifstofa2"/>
	<Quantum name="qp_Skrifstofa3"/>
	<Quantum name="qp_Skrifstofa4"/>
	<Quantum name="qp_Skrifstofa5"/>
</Sequence>
<CheckConditionQuantum name="qp_Skrifstofa" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Skrifstofa"/>
</CheckConditionQuantum>

<Sequence name="su_Skrifstofa">
	<Quantum name="qu_Skrifstofa0"/>
	<Quantum name="qu_Skrifstofa1"/>
	<Quantum name="qu_Skrifstofa2"/>
	<Quantum name="qu_Skrifstofa3"/>
	<Quantum name="qu_Skrifstofa4"/>
	<Quantum name="qu_Skrifstofa5"/>
</Sequence>
<CheckConditionQuantum name="qu_Skrifstofa" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Skrifstofa"/>
</CheckConditionQuantum>

<Sequence name="sp_Kopavogur">
	<Quantum name="qp_Kopavogur0"/>
	<Quantum name="qp_Kopavogur1"/>
	<Quantum name="qp_Kopavogur2"/>
	<Quantum name="qp_Kopavogur3"/>
	<Quantum name="qp_Kopavogur4"/>
	<Quantum name="qp_Kopavogur5"/>
	<Quantum name="qp_Kopavogur6"/>
	<Quantum name="qp_Kopavogur7"/>
	<Quantum name="qp_Kopavogur8"/>
	<Quantum name="qp_Kopavogur9"/>
	<Quantum name="qp_Kopavogur10"/>
</Sequence>
<CheckConditionQuantum name="qp_Kopavogur" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Kopavogur"/>
</CheckConditionQuantum>

<Sequence name="su_Kopavogur">
	<Quantum name="qu_Kopavogur0"/>
	<Quantum name="qu_Kopavogur1"/>
	<Quantum name="qu_Kopavogur2"/>
	<Quantum name="qu_Kopavogur3"/>
	<Quantum name="qu_Kopavogur4"/>
	<Quantum name="qu_Kopavogur5"/>
	<Quantum name="qu_Kopavogur6"/>
	<Quantum name="qu_Kopavogur7"/>
	<Quantum name="qu_Kopavogur8"/>
	<Quantum name="qu_Kopavogur9"/>
	<Quantum name="qu_Kopavogur10"/>
</Sequence>
<CheckConditionQuantum name="qu_Kopavogur" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Kopavogur"/>
</CheckConditionQuantum>

<!-- Sviss á milli sena -->
<SwitchSceneQuantum name="q_ToInventory" scene="s_Inventory"/>
<SwitchSceneQuantum name="q_ToFyrirUtan" scene="s_FyrirUtan"/>
<SwitchSceneQuantum name="q_ToKirkja" scene="s_Kirkja"/>
<SwitchSceneQuantum name="q_ToHjaBryta" scene="s_HjaBryta"/>
<SwitchSceneQuantum name="q_ToSkrifstofa" scene="s_Skrifstofa"/>
<SwitchSceneQuantum name="q_ToSvefnherbergi" scene="s_Svefnherbergi"/>
<SwitchSceneQuantum name="q_ToKopavogur" scene="s_Kopavogur"/>
<SwitchSceneQuantum name="q_ToAskur" scene="s_Askur"/>
<SwitchSceneQuantum name="q_ToMap" scene="s_Map"/>
<SwitchSceneQuantum	name="q_ToBlack" scene="s_Black"/>


<!-- Gissur hingað og þangað -->

<!-- From Kirkju to Outside -->
<MoveActorQuantum name="q_MoveGissur2FyrirUtanFromKirkja" actor="a_Gissur" terrain="t_FyrirUtanl">
	<Location x="705" y="241" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissur2FyrirUtanFromKirkja" actor="a_Gissur" x="100" y="990" wait="true"/>

<!-- From HjaBryta to Outside -->
<SetDestinationQuantum name="q_WalkGissur2FyrirUtan" actor="a_Gissur" x="900" y="430" wait="true"/>
<MoveActorQuantum name="q_MoveGissur2FyrirUtanFromHjaBryta" actor="a_Gissur" terrain="t_FyrirUtanl">
	<Location x="300" y="400" z="1"/> </MoveActorQuantum>

<!-- From Skrifstofa to Outside -->
<SetDestinationQuantum name="q_WalkGissur2FyrirUtanFromSkrifstofa" actor="a_Gissur" x="300" y="1000" wait="true"/>
<MoveActorQuantum name="q_MoveGissur2FyrirUtanFromSkrifstofa" actor="a_Gissur" terrain="t_FyrirUtanl">
	<Location x="1200" y="562" z="1"/> </MoveActorQuantum>

<!-- From Kopavogur to Outside -->
<MoveActorQuantum name="q_MoveGissur2FyrirUtanFromKopavogur" actor="a_Gissur" terrain="t_FyrirUtanl">
	<Location x="230" y="950" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissur2FyrirUtanFromKopavogur" actor="a_Gissur" x="-200" y="550" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2FyrirUtanFromKopavogur2" actor="a_Gissur" x="210" y="460" wait="true"/>

<!-- From Outside to Bryta -->
<MoveActorQuantum name="q_MoveGissur2HjaBryta" actor="a_Gissur" terrain="t_HjaBrytal">
	<Location x="900" y="430" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissur2HjaBryta" actor="a_Gissur" x="660" y="435" wait="true"/>

<!-- From Outside to Office -->
<MoveActorQuantum name="q_MoveGissur2SkrifstofaFromFyrirUtan" actor="a_Gissur" terrain="t_Skrifstofal">
	<Location x="300" y="1000" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissur2SkrifstofaFromFyrirUtan" actor="a_Gissur" x="300" y="520" wait="true"/>

<!-- From Outside to Church -->
<MoveActorQuantum name="q_MoveGissur2KirkjaFromFyrirUtan" actor="a_Gissur" terrain="t_Kirkjal">
	<Location x="100" y="990" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissur2KirkjaFromFyrirUtan" actor="a_Gissur" x="300" y="550" wait="true"/>

<!-- From Outside to Kopavogur -->
<MoveActorQuantum name="q_MoveGissur2KopavogurFromFyrirUtan" actor="a_Gissur" terrain="t_Kopavogurl">
	<Location x="-200" y="550" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissur2KopavogurFromFyrirUtan" actor="a_Gissur" x="80" y="950" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2Kopavogur" actor="a_Gissur" x="190" y="510" wait="true"/>

<!-- From Office to Bedroom -->
<SetDestinationQuantum name="q_WalkGissur2SvefnherbergiFromSkrifstofa" actor="a_Gissur" x="930" y="580" wait="true"/>
<MoveActorQuantum name="q_MoveGissur2SvefnherbergiFromSkrifstofa" actor="a_Gissur" terrain="t_Svefnherbergil">
	<Location x="250" y="500" z="1"/> </MoveActorQuantum>

<!-- From Bedroom to Office -->
<MoveActorQuantum name="q_MoveGissur2SkrifstofaFromSvefnherbergi" actor="a_Gissur" terrain="t_Skrifstofal">
	<Location x="600" y="500" z="1"/> </MoveActorQuantum>

<!-- Toward Hilla in HjaBryta -->
<SetDestinationQuantum name="q_MoveGissur2wardHilla" actor="a_Gissur" x="665" y="410" wait="true"/>
<SetDestinationQuantum name="q_MoveGissur2wardHilla2" actor="a_Gissur" x="630" y="410" wait="true"/>

<SetDestinationQuantum name="q_MoveGissur2wardRadsmadur" actor="a_Gissur" x="710" y="550" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2SpecialSpot" actor="a_Gissur" x="735" y="370" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2SpecialSpot2" actor="a_Gissur" x="850" y="470" wait="true"/>

<SetDestinationQuantum name="q_WalkGissur2Vinnumadur" actor="a_Gissur" x="965" y="534" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2Kjaftakelling" actor="a_Gissur" x="586" y="536" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2Kristofer" actor="a_Gissur" x="360" y="573" wait="true"/>

<SetDestinationQuantum name="q_WalkGissur2HjaBrytaAA" actor="a_Gissur" x="131" y="392" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2KirkjaAA" actor="a_Gissur" x="700" y="192" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2SkrifstofaAA" actor="a_Gissur" x="1367" y="585" wait="true"/>
<SetDestinationQuantum name="q_WalkGissur2SkrifstofaBB" actor="a_Gissur" x="253" y="444" wait="true"/>


<!-- Hlutir -->
<MoveActorQuantum name="q_MoveKollur2Inventory" actor="a_Kollur" terrain="t_Inventory"/>

<MoveActorQuantum name="q_BirtaSkuffuSkrifstofu" actor="a_SkuffaSkrifstofaOpen" terrain="t_Skrifstofal" />
<MoveActorQuantum name="q_LokaSkuffuSkrifstofu" actor="a_SkuffaSkrifstofaOpen"/>

<MoveActorQuantum name="q_FelaSkuffuSkrifstofuClosed" actor="a_SkuffaSkrifstofaClosed"/>
<MoveActorQuantum name="q_SynaSkuffuSkrifstofuClosed" actor="a_SkuffaSkrifstofaClosed" terrain="t_Skrifstofal"/>

<UpdateQuantum name="q_UpdateInventory" terrain="t_Inventory" show="true"/>

<JMFActorMouth name="m_SkuffaLitil" file="\sidaskiA\Media\sfx\skuffa_A.wav" prepare="true"/>
<JMFActorMouth name="m_SkuffaStor" file="\sidaskiA\Media\sfx\skuffa_B.wav" prepare="true"/>
<JMFActorMouth name="m_Kopavogur" file="\sidaskiA\Media\sfx\kopavogA.wav" prepare="true" repeat="true"/>
<JMFActorMouth name="m_Hverfur" file="\sidaskiA\Media\sfx\hverfur.wav" prepare="true"/>
<StaticActor name="a_SFX" x="0" y="0" z="0" state="stop">
	<State name="skuffastor" mouth="m_SkuffaStor"/>
	<State name="skuffalitil" mouth="m_SkuffaLitil"/>
	<State name="kopavogur" mouth="m_Kopavogur"/>
	<State name="hverfur" mouth="m_Hverfur"/>
</StaticActor>
<StateQuantum name="q_StopSFX" actor="a_SFX" state="stop" wait="false"/>
<StateQuantum name="q_PlayKopavogur" actor="a_SFX" state="kopavogur" wait="false"/>
<StateQuantum name="q_PlaySkuffaSmall" actor="a_SFX" state="skuffalitil" wait="false"/>
<StateQuantum name="q_PlaySkuffaLarge" actor="a_SFX" state="skuffastor" wait="false"/>
<StateQuantum name="q_PlayHverfur" actor="a_SFX" state="hverfur" wait="false"/>

<JMFActorMouth name="m_Adallag" file="\sidaskiA\Media\3_000.wav" repeat="true" prepare="true"/>
<JMFActorMouth name="m_Kortlag" file="\sidaskiA\Media\3_kort.wav" repeat="true" prepare="true"/>
<FadeQuantum name="qf_Kortlag" mouth="m_Kortlag" goal="0.9" speed="0"/>
<PrepareQuantum name="qp_Kortlag" object="m_Kortlag" prepare="true"/>
<FadeQuantum name="qf_KortalagIn" mouth="m_Kortlag" goal="0.9" speed="100"/>
<FadeQuantum name="qf_KortalagOut" mouth="m_Kortlag" goal="0" speed="100"/>
<FadeQuantum name="qf_Adallag" mouth="m_Adallag" goal="0.25" speed="0"/>
<FadeQuantum name="qf_SilenceAdallag" mouth="m_Adallag" goal="0" speed="0"/>
<FadeQuantum name="qf_AdallagOut" mouth="m_Adallag" goal="0" speed="100"/>
<FadeQuantum name="qf_AdallagIn" mouth="m_Adallag" goal="0.25" speed="100"/>
<PrepareQuantum name="qp_Adallag" object="m_Adallag" prepare="true"/>
<StaticActor name="a_Adallag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Adallag"/>
	<State name="kort" mouth="m_Kortlag"/> </StaticActor>
<StateQuantum name="q_StopSong" actor="a_Adallag" state="stop" wait="false"/>
<StateQuantum name="q_PlaySong" actor="a_Adallag" state="play" wait="false"/>
<StateQuantum name="q_PlayKort" actor="a_Adallag" state="kort" wait="false"/>

<Sequence name="sr_Look1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Look1"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Look2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Look3"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Look4"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Look5"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Look6"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>

<CheckConditionQuantum name="q_RandomLook" flag="f_Random6" wait="true">
	<Trigger value="0" seq="sr_Look1"/>
	<Trigger value="1" seq="sr_Look2"/>
	<Trigger value="2" seq="sr_Look3"/>
	<Trigger value="3" seq="sr_Look4"/>
	<Trigger value="4" seq="sr_Look5"/>
	<Trigger value="5" seq="sr_Look6"/>
</CheckConditionQuantum>

<Sequence name="s_randomLook">
    <Quantum name="q_Randomize6"/>
    <Quantum name="q_RandomLook"/>
</Sequence>

<Sequence name="sr_Talk1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talk1"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talk2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talk3"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talk4"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talk5"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talk6"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talking"/>
</Sequence>

<CheckConditionQuantum name="q_RandomTalk" flag="f_Random6" wait="true">
	<Trigger value="0" seq="sr_Talk1"/>
	<Trigger value="1" seq="sr_Talk2"/>
	<Trigger value="2" seq="sr_Talk3"/>
	<Trigger value="3" seq="sr_Talk4"/>
	<Trigger value="4" seq="sr_Talk5"/>
	<Trigger value="5" seq="sr_Talk6"/>
</CheckConditionQuantum>

<Sequence name="s_randomTalk">
    <Quantum name="q_Randomize6"/>
    <Quantum name="q_RandomTalk"/>
</Sequence>

<Sequence name="sr_Use1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use1"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use3"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use4"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use5"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use6"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use7">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use7"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use8">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use8"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use9">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Use9"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<CheckConditionQuantum name="q_RandomUse" flag="f_Random9" wait="true">
	<Trigger value="0" seq="sr_Use1"/>
	<Trigger value="1" seq="sr_Use2"/>
	<Trigger value="2" seq="sr_Use3"/>
	<Trigger value="3" seq="sr_Use4"/>
	<Trigger value="4" seq="sr_Use5"/>
	<Trigger value="5" seq="sr_Use6"/>
	<Trigger value="6" seq="sr_Use7"/>
	<Trigger value="7" seq="sr_Use8"/>
	<Trigger value="8" seq="sr_Use9"/>
</CheckConditionQuantum>

<Sequence name="s_randomUse">
    <Quantum name="q_Randomize9"/>
    <Quantum name="q_RandomUse"/>
</Sequence>

<Sequence name="sr_Take1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take1"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take3"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take4"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take5"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take6"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take7">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take7"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take8">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take8"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take9">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take9"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take10">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take10"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take11">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take11"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take12">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take12"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take13">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Take13"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>

<CheckConditionQuantum name="q_RandomTake" flag="f_Random13" wait="true">
	<Trigger value="0" seq="sr_Take1"/>
	<Trigger value="1" seq="sr_Take2"/>
	<Trigger value="2" seq="sr_Take3"/>
	<Trigger value="3" seq="sr_Take4"/>
	<Trigger value="4" seq="sr_Take5"/>
	<Trigger value="5" seq="sr_Take6"/>
	<Trigger value="6" seq="sr_Take7"/>
	<Trigger value="7" seq="sr_Take8"/>
	<Trigger value="8" seq="sr_Take9"/>
	<Trigger value="9" seq="sr_Take10"/>
	<Trigger value="10" seq="sr_Take11"/>
	<Trigger value="11" seq="sr_Take12"/>
	<Trigger value="12" seq="sr_Take13"/>
</CheckConditionQuantum>

<Sequence name="s_randomTake">
    <Quantum name="q_Randomize13"/>
    <Quantum name="q_RandomTake"/>
</Sequence>

<Sequence name="sr_Bless1">
	<Quantum name="q_Bless1"/>
</Sequence>

<Sequence name="sr_Bless2">
	<Quantum name="q_Bless2"/>
</Sequence>

<Sequence name="sr_Bless3">
	<Quantum name="q_Bless3"/>
</Sequence>

<Sequence name="sr_Bless4">
	<Quantum name="q_Bless4"/>
</Sequence>

<Sequence name="sr_Bless5">
	<Quantum name="q_Bless5"/>
</Sequence>

<Sequence name="sr_Bless6">
	<Quantum name="q_Bless6"/>
</Sequence>

<CheckConditionQuantum name="q_RandomBless" flag="f_Random6" wait="true">
	<Trigger value="0" seq="sr_Bless1"/>
	<Trigger value="1" seq="sr_Bless2"/>
	<Trigger value="2" seq="sr_Bless3"/>
	<Trigger value="3" seq="sr_Bless4"/>
	<Trigger value="4" seq="sr_Bless5"/>
	<Trigger value="5" seq="sr_Bless6"/>
</CheckConditionQuantum>

<Sequence name="s_randomBless">
    <Quantum name="q_Randomize6"/>
    <Quantum name="q_RandomBless"/>
</Sequence>

<CheckConditionQuantum name="q_randomBless" flag="f_Zero" wait="true">
	<Trigger value="0" seq="s_randomBless"/>
</CheckConditionQuantum>


<Sequence name="s_ShowSalmabokLargeInv">
    <Quantum name="qu_Inventory"/>
    <Quantum name="qp_SalmabokLarge"/>
    <Quantum name="q_ShowSalmabokLargeInv"/>
</Sequence>
<Sequence name="s_ShowSalmabokLargeKirk">
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_Kirkja"/>
    <Quantum name="qp_SalmabokLarge"/>
    <Quantum name="q_ShowSalmabokLargeKirk"/>
    <Quantum name="q_ToKirkja"/>
    <Quantum name="q_CurrentSalmabok"/>
</Sequence>
<CheckConditionQuantum name="q_ShowSalmabokLarge" flag="f_Testament" wait="true">
	<Trigger value="0" seq="s_ShowSalmabokLargeKirk"/>
	<Trigger value="1" seq="s_ShowSalmabokLargeInv"/>
</CheckConditionQuantum>

<SetDestinationQuantum name="q_WalkGissur2Salmabok556" actor="a_Gissur" x="290" y="540" wait="true"/>
<Sequence name="s_wwowSalmabokLargeKirk">
    <Quantum name="q_WalkGissur2Salmabok556"/>
</Sequence>
<CheckConditionQuantum name="q_WalkGissur2Salmabok" flag="f_Testament" wait="true">
	<Trigger value="0" seq="s_wwowSalmabokLargeKirk"/>
</CheckConditionQuantum>


<Sequence name="s_ShowGaldrabokLargeInv">
<!--    <Quantum name="q_ToBlack"/>  -->
    <Quantum name="qu_Inventory"/>
    <Quantum name="qp_GaldrabokLarge"/>
    <Quantum name="q_ShowGaldrabokLargeInv"/>
</Sequence>
<Sequence name="s_ShowGaldrabokLargeSkrif">
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_Skrifstofa"/>
    <Quantum name="qp_GaldrabokLarge"/>
    <Quantum name="q_ShowGaldrabokLargeSkrif"/>
    <Quantum name="q_ToSkrifstofa"/>
    <Quantum name="q_CurrentGaldrabok"/>
</Sequence>
<CheckConditionQuantum name="q_ShowGaldrabokLarge" flag="f_Galdrabok" wait="true">
	<Trigger value="0" seq="s_ShowGaldrabokLargeSkrif"/>
	<Trigger value="1" seq="s_ShowGaldrabokLargeInv"/>
</CheckConditionQuantum>


<!-- Conversations -->
<!-- Conversation with Bryti -->
<SentenceContainer name="conv_Brytinn" scene="s_HjaBryta" polygon="p_All" zmin="801" zmax="1500"/>

<Text name="NeiAllsEnga" text="Nei, alls enga." terrain="conv_Brytinn" color="white"/>
	<ActorMoused actor="NeiAllsEnga" listener="sc"/>
<Text name="UmmmhEgHeld" text="Ummmh.. Ég held að hann vilji fá mig dæmdan frá embætti." terrain="conv_Brytinn" color="white"/>
	<ActorMoused actor="UmmmhEgHeld" listener="sc"/>
<Text name="HannGaetiReynt" text="Hann gæti reynt að kitla mig!" terrain="conv_Brytinn" color="white"/>
	<ActorMoused actor="HannGaetiReynt" listener="sc"/>
<Text name="Bless99" text="Bless!" terrain="conv_Brytinn" color="white"/>
	<ActorMoused actor="Bless99" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_NeiAllsEnga" actor="NeiAllsEnga"/>
<MoveActorQuantum name="qh_UmmmhEgHeld" actor="UmmmhEgHeld"/>
<MoveActorQuantum name="qh_HannGaetiReynt" actor="HannGaetiReynt"/>

<!-- Quanta for showing texts -->


<UpdateQuantum name="qh_TextBrytinn" terrain="conv_Brytinn" show="false"/>
<UpdateQuantum name="qs_TextBrytinn" terrain="conv_Brytinn" show="true"/>

<Sequence name="s_IncFlag">
	<Quantum name="q_BrytiInc"/>
</Sequence>

<CheckConditionQuantum name="q_CheckInc" flag="f_Bryti2" wait="true">
	<Trigger value="3" seq="s_IncFlag"/>
</CheckConditionQuantum>

<Sequence name="s_Flyttu">
	<Quantum name="q_FlyttuTherNuAdFjarlaegja"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_Thetta">
	<Quantum name="q_ThettaVarVelAfSer"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_HefurThuEinhverja">
	<Quantum name="q_HefurThuEinhverja"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="qs_TextBrytinn"/>
</Sequence>

<Sequence name="s_Hefur">
	<Quantum name="q_HefurThuKomist"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_NeiEnEgErAd"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_Drifdu">
	<Quantum name="q_DrifduThigNuAdHitta"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_NeiAllsEnga">
	<Quantum name="qh_TextBrytinn"/>
	<Quantum name="q_NeiAllsEnga"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_VidVerdumAdKomast"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="qh_NeiAllsEnga"/>
	<Quantum name="q_Bryti2Inc"/>
    <Quantum name="q_CheckInc"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="NeiAllsEnga" seq="s_NeiAllsEnga"/>

<Sequence name="s_UmmmhEgHeld">
	<Quantum name="qh_TextBrytinn"/>
	<Quantum name="q_UmmmhEgHeld"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_VidVerdumThaAd"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="qh_UmmmhEgHeld"/>
	<Quantum name="q_Bryti2Inc"/>
    <Quantum name="q_CheckInc"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="UmmmhEgHeld" seq="s_UmmmhEgHeld"/>

<Sequence name="s_HannGaetiReynt">
	<Quantum name="qh_TextBrytinn"/>
	<Quantum name="q_HannGaetiReynt"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErEkkertTilAd"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="qh_HannGaetiReynt"/>
	<Quantum name="q_Bryti2Inc"/>
    <Quantum name="q_CheckInc"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="HannGaetiReynt" seq="s_HannGaetiReynt"/>

<Sequence name="s_Bless99">
	<Quantum name="qh_TextBrytinn"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="Bless99" seq="s_Bless99"/>

<!-- Condition quanta -->
<CheckConditionQuantum name="q_TalkToBrytinn" flag="f_Bryti" wait="true">
	<Trigger value="0" seq="s_Flyttu"/>
	<Trigger value="1" seq="s_Thetta"/>
	<Trigger value="3" seq="s_HefurThuEinhverja"/>
	<Trigger value="4" seq="s_Hefur"/>
	<Trigger value="6" seq="s_Drifdu"/>
</CheckConditionQuantum>

<!-- Sequences for conversating with Bryti -->

<Sequence name="s_BeginConvBrytinn">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="q_Conversating"/>
	<Quantum name="q_TalkToBrytinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Brytinn" seq="s_BeginConvBrytinn"/>

<!-- Conversation with Oddur -->

<Text name="OddurAf" text="Oddur! Af hverju þýddir þú Nýja testamentið á íslensku?" terrain="conv_Oddur" color="white"/>
	<ActorMoused actor="OddurAf" listener="sc"/>
<Text name="HvernigForum" text="Hvernig förum við að því að koma á lútherskum sið á Íslandi?" terrain="conv_Oddur" color="white"/>
	<ActorMoused actor="HvernigForum" listener="sc"/>
<Text name="HvadEigumVid" text="Hvað eigum við að gera við Ögmund?" color="white"/>
	<ActorMoused actor="HvadEigumVid" listener="sc"/>
<Text name="AfHverjuErLutherstru" text="Af hverju er lútherstrú ekki komin á fyrst konungur hefur skipað svo fyrir?" terrain="conv_Oddur" color="white"/>
	<ActorMoused actor="AfHverjuErLutherstru" listener="sc"/>
<Text name="EgErBuinnAd" text="Af hverju vill Lúther banna helga muni?"  color="white"/>
	<ActorMoused actor="EgErBuinnAd" listener="sc"/>
<Text name="HverErThessiMarteinn" text="Hver er þessi Marteinn Lúther?" terrain="conv_Oddur" color="white"/>
	<ActorMoused actor="HverErThessiMarteinn" listener="sc"/>
<Text name="HvadaArEr" text="Hvaða ár er eiginlega?"  color="white"/>
	<ActorMoused actor="HvadaArEr" listener="sc"/>
<Text name="BlessOddur" text="Bless!" terrain="conv_Oddur" color="white"/>
	<ActorMoused actor="BlessOddur" listener="sc"/>


<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_BlessOddur" actor="BlessOddur"/>
<MoveActorQuantum name="qh_OddurAf" actor="OddurAf"/>
<MoveActorQuantum name="qh_HvernigForum" actor="HvernigForum"/>
<MoveActorQuantum name="qh_HvadEigumVid" actor="HvadEigumVid"/>
<MoveActorQuantum name="qh_AfHverjuErLutherstru" actor="AfHverjuErLutherstru"/>
<MoveActorQuantum name="qh_EgErBuinnAd" actor="EgErBuinnAd"/>
<MoveActorQuantum name="qh_HverErThessiMarteinn" actor="HverErThessiMarteinn"/>
<MoveActorQuantum name="qh_HvadaArEr" actor="HvadaArEr"/>


<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_BlessOddur" actor="BlessOddur" terrain="conv_Oddur"/>
<MoveActorQuantum name="qs_HvernigForum" actor="OddurAf" terrain="conv_Oddur"/>
<MoveActorQuantum name="qs_HvadEigumVid" actor="HvadEigumVid" terrain="conv_Oddur"/>
<MoveActorQuantum name="qs_AfHverjuErLutherstru" actor="AfHverjuErLutherstru" terrain="conv_Oddur"/>
<MoveActorQuantum name="qs_EgErBuinnAd" actor="EgErBuinnAd" terrain="conv_Oddur"/>
<MoveActorQuantum name="qs_HverErThessiMarteinn" actor="HverErThessiMarteinn" terrain="conv_Oddur"/>
<MoveActorQuantum name="qs_HvadaArEr" actor="HvadaArEr" terrain="conv_Oddur"/>


<UpdateQuantum name="qh_TextOddur" terrain="conv_Oddur" show="false"/>
<UpdateQuantum name="qs_TextOddur" terrain="conv_Oddur" show="true"/>

<!-- Sequences for conversating with Oddur -->

<!-- Oddur Af hverju þýddir -->
<Sequence name="s_OddurAf">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_OddurAf"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgHefAhyggjur"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qh_OddurAf"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="OddurAf" seq="s_OddurAf"/>

<!-- Hvernig förum við að því... -->
<Sequence name="s_HvernigForum">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_HvernigForum"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThuHefurBiskupsvald"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qs_HvadaArEr"/>
	<Quantum name="qh_HvernigForum"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvernigForum" seq="s_HvernigForum"/>

<!-- Hvað eigum við að gera... -->
<Sequence name="s_HvadEigumVid">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_HvadEigumVid"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_OgmundurErOrdinn"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_JaAudvitad"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_KristjanKonungurHlytur"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qh_HvadEigumVid"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadEigumVid" seq="s_HvadEigumVid"/>

<!-- Af hverju er lútherstrú -->
<Sequence name="s_AfHverjuErLutherstru">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_AfHverjuErLutherstru"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EinsOgThuManst"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_UhhNeiEg"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_HvadUmThadTha"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qs_HvadEigumVid"/>
	<Quantum name="qh_AfHverjuErLutherstru"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="AfHverjuErLutherstru" seq="s_AfHverjuErLutherstru"/>

<!-- Ég er búinn að gleyma ... -->
<Sequence name="s_EgErBuinnAd">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_EgErBuinnAd"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_LutherErAMoti"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qh_EgErBuinnAd"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="EgErBuinnAd" seq="s_EgErBuinnAd"/>


<!-- Hver er þessi Marteinn lúther -->
<Sequence name="s_HverErThessiMarteinn">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_HverErThessiMarteinn"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MjogFyndidHerra"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_AdSjalfsogduMan"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MarteinnLutherThekkir"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qs_EgErBuinnAd"/>
	<Quantum name="qh_HverErThessiMarteinn"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="HverErThessiMarteinn" seq="s_HverErThessiMarteinn"/>

<!-- Hvaða ár er eiginlega? -->
<Sequence name="s_HvadaArEr">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_HvadaArEr"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_NuErArid1540"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qh_HvadaArEr"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadaArEr" seq="s_HvadaArEr"/>

<Sequence name="s_BlessOddur">
	<Quantum name="qh_TextOddur"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="BlessOddur" seq="s_BlessOddur"/>

<Sequence name="s_BeginConvOddur">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_HeyrduOddur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_JaGissur"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="qs_TextOddur"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_OddurF" seq="s_BeginConvOddur"/>
<Reaction reactor="action_talk" actor="a_OddurT" seq="s_BeginConvOddur"/>

<!-- Conversation with Kjaftakelling -->

<Text name="GeturThuSagt" text="Getur þú sagt mér eitthvað um hagi Ögmundar?" terrain="conv_Kjaftakelling" color="white"/>
	<ActorMoused actor="GeturThuSagt" listener="sc"/>
<Text name="HvadErtThu" text="Hvað ert þú að gera hér?" terrain="conv_Kjaftakelling" color="white"/>
	<ActorMoused actor="HvadErtThu" listener="sc"/>
<Text name="BlessKjaftakelling" text="Bless!" terrain="conv_Kjaftakelling" color="white"/>
	<ActorMoused actor="BlessKjaftakelling" listener="sc"/>


<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_GeturThuSagt" actor="GeturThuSagt"/>
<MoveActorQuantum name="qh_HvadErtThu" actor="HvadErtThu"/>
<MoveActorQuantum name="qh_BlessKjaftakelling" actor="BlessKjaftakelling"/>


<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_BlessKjaftakelling" actor="BlessKjaftakelling" terrain="conv_Kjaftakelling"/>
<MoveActorQuantum name="qs_GeturThuSagt" actor="GeturThuSagt" terrain="conv_Kjaftakelling"/>
<MoveActorQuantum name="qs_HvadErtThu" actor="HvadErtThu" terrain="conv_Kjaftakelling"/>


<UpdateQuantum name="qh_TextKjaftakelling" terrain="conv_Kjaftakelling" show="false"/>
<UpdateQuantum name="qs_TextKjaftakelling" terrain="conv_Kjaftakelling" show="true"/>

<!-- Sequences for conversating with Kjaftakelling -->


<!-- Kjaftakelling Getur þú sagt mér eitthvað..? -->
<Sequence name="s_GeturThuSagt">
	<Quantum name="qh_TextKjaftakelling"/>
	<Quantum name="q_GeturThuSagt"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_JaVeistuJa"/>
	<Quantum name="q_StopKjaftakelling"/>
	<Quantum name="q_UhhHaFyrirgefdu"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_HverVeitHvad"/>
	<Quantum name="q_StopKjaftakelling"/>
	<Quantum name="q_GissurYppir"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_JaHannEyjolfur"/>
	<Quantum name="q_StopKjaftakelling"/>
	<Quantum name="q_HaHvadSagdirdu"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Ekkert"/>
	<Quantum name="q_StopKjaftakelling"/>
	<Quantum name="qs_TextKjaftakelling"/>
	<Quantum name="q_TalkedWithWoman1"/>
</Sequence>
<Reaction reactor="action_talk" actor="GeturThuSagt" seq="s_GeturThuSagt"/>

<!-- Hvað ert þú að gera hér? -->
<Sequence name="s_HvadErtThu">
	<Quantum name="qh_TextKjaftakelling"/>
	<Quantum name="q_HvadErtThu"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgErAdBidjaFyrir"/>
	<Quantum name="q_StopKjaftakelling"/>
	<Quantum name="qh_HvadErtThu"/>
	<Quantum name="qs_TextKjaftakelling"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadErtThu" seq="s_HvadErtThu"/>

<Sequence name="s_BlessKjaftakelling">
	<Quantum name="qh_TextKjaftakelling"/>
	<Quantum name="q_Bless"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="BlessKjaftakelling" seq="s_BlessKjaftakelling"/>

<Sequence name="s_BeginConvKjaftakelling">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="q_WalkGissur2Kjaftakelling"/>
    <Quantum name="q_StoppGissur"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="q_Conversating"/>
    <Quantum name="q_KomduSaelKona"/>
    <Quantum name="q_StopGissur"/>
	<Quantum name="q_KomduSaellHerraGissur"/>
	<Quantum name="q_StopKjaftakelling"/>
	<Quantum name="qs_TextKjaftakelling"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Kjaftakelling" seq="s_BeginConvKjaftakelling"/>

<!-- Conversation with Vinnumaður -->

<Text name="HvernigLidurTher" text="Hvernig líður þér hérna í Skálholti?" terrain="conv_Vinnumadur" color="white"/>
	<ActorMoused actor="HvernigLidurTher" listener="sc"/>
<Text name="AfHverjuStendur" text="Af hverju stendur þú bara hér?  Hefur þú ekkert þarfara að gera?" terrain="conv_Vinnumadur" color="white"/>
	<ActorMoused actor="AfHverjuStendur" listener="sc"/>
<Text name="MaEgNokkudSja" text="Má ég nokkuð sjá bréfið til Jóns Arasonar?"  color="white"/>
	<ActorMoused actor="MaEgNokkudSja" listener="sc"/>
<Text name="BlessVinnumadur" text="Bless!" terrain="conv_Vinnumadur" color="white"/>
	<ActorMoused actor="BlessVinnumadur" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_BlessVinnumadur" actor="BlessVinnumadur"/>
<MoveActorQuantum name="qh_HvernigLidurTher" actor="HvernigLidurTher"/>
<MoveActorQuantum name="qh_AfHverjuStendur" actor="AfHverjuStendur"/>
<MoveActorQuantum name="qh_MaEgNokkudSja" actor="MaEgNokkudSja"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_BlessVinnumadur" actor="BlessVinnumadur" terrain="conv_Vinnumadur"/>
<MoveActorQuantum name="qs_HvernigLidurTher" actor="HvernigLidurTher" terrain="conv_Vinnumadur"/>
<MoveActorQuantum name="qs_AfHverjuStendur" actor="AfHverjuStendur" terrain="conv_Vinnumadur"/>
<MoveActorQuantum name="qs_MaEgNokkudSja" actor="MaEgNokkudSja" terrain="conv_Vinnumadur"/>

<UpdateQuantum name="qh_TextVinnumadur" terrain="conv_Vinnumadur" show="false"/>
<UpdateQuantum name="qs_TextVinnumadur" terrain="conv_Vinnumadur" show="true"/>

<Sequence name="s_StopBref">
    <Quantum name="q_StopVinnumadur"/>
</Sequence>

<Sequence name="s_StopWithoutBref">
    <Quantum name="q_StopVinnumadurAnBrefs"/>
</Sequence>

<CheckConditionQuantum name="q_CheckStop" flag="f_Vinnumadur" wait="true">
	<Trigger value="0" seq="s_StopBref"/>
	<Trigger value="1" seq="s_StopWithoutBref"/>
</CheckConditionQuantum>

<!-- Sequences for conversating with Vinnumadur -->

<!-- Hvernig Líður þér hérna í skálholti -->
<Sequence name="s_HvernigLidurTher">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_TextVinnumadur"/>
	<Quantum name="q_HvernigLidurTher"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MerLidurAgaetlega"/>
	<Quantum name="q_CheckStop"/>
	<Quantum name="qh_HvernigLidurTher"/>
	<Quantum name="qs_TextVinnumadur"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvernigLidurTher" seq="s_HvernigLidurTher"/>

<!-- Af hverju stendur þú bara hér?  Hefur þú ekkert þarfara að gera? -->
<Sequence name="s_AfHverjuStendur">
	<Quantum name="qh_TextVinnumadur"/>
	<Quantum name="q_AfHverjuStendur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_JuSvoSannarlega"/>
	<Quantum name="q_StopVinnumadur"/>
	<Quantum name="qh_AfHverjuStendur"/>
    <Quantum name="qs_MaEgNokkudSja"/>
    <Quantum name="q_MoneyOK"/>
	<Quantum name="qs_TextVinnumadur"/>
</Sequence>
<Reaction reactor="action_talk" actor="AfHverjuStendur" seq="s_AfHverjuStendur"/>

<!-- Má ég nokkuð sjá bréfið til jóns Arasonar -->
<Sequence name="s_MaEgNokkudSja0">
	<Quantum name="qh_TextVinnumadur"/>
	<Quantum name="q_MaEgNokkudSja"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgGetThviMidur"/>
	<Quantum name="q_StopVinnumadur"/>
	<Quantum name="qs_TextVinnumadur"/>
</Sequence>

<!-- Má ég nokkuð sjá bréfið til jóns Arasonar2 -->
<Sequence name="s_MaEgNokkudSja1">
	<Quantum name="qh_TextVinnumadur"/>
	<Quantum name="qh_MaEgNokkudSja"/>
	<Quantum name="q_MaEgNokkudSja"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_JaaEfThuLofar"/>
	<Quantum name="q_StopVinnumadur"/>
	<Quantum name="q_VinnumadurGefur"/>
	<Quantum name="q_StopVinnumadurAnBrefs"/>
	<Quantum name="q_Vinnumadur1"/>
 	<Quantum name="q_SendibrefTaken"/>
 	<Quantum name="q_MoveSendibref2Inventory"/>
 	<Quantum name="q_UpdateInventory"/>
 	<Quantum name="q_Bryti5"/>
 	<Quantum name="qh_MaEgNokkudSja"/>
 	<Quantum name="q_Moving"/>
</Sequence>
<CheckConditionQuantum name="q_IfWorkerMoneyGiven" flag="f_MoneyGiven2Worker" wait="true">
	<Trigger value="0" seq="s_MaEgNokkudSja0"/>
	<Trigger value="1" seq="s_MaEgNokkudSja1"/>
</CheckConditionQuantum>
<Sequence name="s_IfWorkerMoneyGiven">
	<Quantum name="q_IfWorkerMoneyGiven"/>
</Sequence>
<Reaction reactor="action_talk" actor="MaEgNokkudSja" seq="s_IfWorkerMoneyGiven"/>

<!-- Má ég nokkuð sjá búið -->

<Sequence name="s_BlessVinnumadur">
	<Quantum name="qh_TextVinnumadur"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="BlessVinnumadur" seq="s_BlessVinnumadur"/>

<Sequence name="s_BeginConvVinnumadurLater">
	<Quantum name="q_KomduSaellVinnumadur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_KomidTherSaelirHerraGissur"/>
	<Quantum name="q_CheckStop"/>
	<Quantum name="qs_TextVinnumadur"/>
</Sequence>

<Sequence name="s_BeginConvVinnumadurFirst">
	<Quantum name="q_KomduSaellHver"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_KomidTherSaelir"/>
	<Quantum name="q_StopVinnumadur"/>
	<Quantum name="q_VinnumadurTalk1"/>
	<Quantum name="qs_TextVinnumadur"/>
</Sequence>

<CheckConditionQuantum name="q_CheckConvVinnumadur" flag="f_VinnumadurTalk" wait="true">
	<Trigger value="0" seq="s_BeginConvVinnumadurFirst"/>
	<Trigger value="1" seq="s_BeginConvVinnumadurLater"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvVinnumadur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_WalkGissur2Vinnumadur"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Conversating"/>
    <Quantum name="q_CheckConvVinnumadur"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Vinnumadur" seq="s_BeginConvVinnumadur"/>

<!-- Conversation with Kristofer -->

<ThemeFinishedQuantum name="q_Fin"/>

<Text name="TilHamingjuMedHirdstjora" text="Til hamingju með hirðstjóraembættið, herra Kristófer!" terrain="conv_Kristofer" color="white"/>
	<ActorMoused actor="TilHamingjuMedHirdstjora" listener="sc"/>
<Text name="HvernigGekkSiglingin" text="Hvernig gekk siglingin frá Danmörku?" terrain="conv_Kristofer" color="white"/>
	<ActorMoused actor="HvernigGekkSiglingin" listener="sc"/>
<Text name="MikidHefEgBedidLengi" text="Mikið hef ég beðið lengi eftir komu þinni." color="white"/>
	<ActorMoused actor="MikidHefEgBedidLengi" listener="sc"/>
<Text name="JaEgHeldAdHann" text="Já, ég held að hann sé staddur í Reykjavík að skoða hveri!" color="white"/>
	<ActorMoused actor="JaEgHeldAdHann" listener="sc"/>
<Text name="ErHannEkkiBara" text="Er hann ekki bara heima hjá sér í Skálholti?" color="white"/>
	<ActorMoused actor="ErHannEkkiBara" listener="sc"/>
<Text name="HannGaetiVeridHja" text="Hann gæti verið hjá systur sinni á Hjalla í Ölfusi!" color="white"/>
	<ActorMoused actor="HannGaetiVeridHja" listener="sc"/>
<Text name="ErHannEkkiHerI" text="Er hann ekki hér í Kópavogi?" color="white"/>
	<ActorMoused actor="ErHannEkkiHerI" listener="sc"/>
<Text name="HannErOrugglegaHja" text="Hann er örugglega hjá augnlækni." color="white"/>
	<ActorMoused actor="HannErOrugglegaHja" listener="sc"/>
<Text name="BlessKristofer" text="Bless!" terrain="conv_Kristofer" color="white"/>
	<ActorMoused actor="BlessKristofer" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_BlessKristofer" actor="BlessKristofer"/>
<MoveActorQuantum name="qh_TilHamingjuMedHirdstjora" actor="TilHamingjuMedHirdstjora"/>
<MoveActorQuantum name="qh_HvernigGekkSiglingin" actor="HvernigGekkSiglingin"/>
<MoveActorQuantum name="qh_MikidHefEgBedidLengi" actor="MikidHefEgBedidLengi"/>
<MoveActorQuantum name="qh_JaEgHeldAdHann" actor="JaEgHeldAdHann"/>
<MoveActorQuantum name="qh_ErHannEkkiBara" actor="ErHannEkkiBara"/>
<MoveActorQuantum name="qh_HannGaetiVeridHja" actor="HannGaetiVeridHja"/>
<MoveActorQuantum name="qh_ErHannEkkiHerI" actor="ErHannEkkiHerI"/>
<MoveActorQuantum name="qh_HannErOrugglegaHja" actor="HannErOrugglegaHja"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_BlessKristofer" actor="BlessKristofer" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_TilHamingjuMedHirdstjora" actor="TilHamingjuMedHirdstjora" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_HvernigGekkSiglingin" actor="HvernigGekkSiglingin" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_MikidHefEgBedidLengi" actor="MikidHefEgBedidLengi" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_JaEgHeldAdHann" actor="JaEgHeldAdHann" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_ErHannEkkiBara" actor="ErHannEkkiBara" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_HannGaetiVeridHja" actor="HannGaetiVeridHja" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_ErHannEkkiHerI" actor="ErHannEkkiHerI" terrain="conv_Kristofer"/>
<MoveActorQuantum name="qs_HannErOrugglegaHja" actor="HannErOrugglegaHja" terrain="conv_Kristofer"/>

<UpdateQuantum name="qh_TextKristofer" terrain="conv_Kristofer" show="false"/>
<UpdateQuantum name="qs_TextKristofer" terrain="conv_Kristofer" show="true"/>

<!-- Sequences for conversating with Kristofer -->

<!-- Til hamingju með hirðstjóraembættið herra Kristófer -->
<Sequence name="s_TilHamingjuMedHirdstjora">
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="qh_TilHamingjuMedHirdstjora"/>
	<Quantum name="q_TilHamingjuMedHirdstjora"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThakkaTherFyrirHerra"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="qs_MikidHefEgBedidLengi"/>
	<Quantum name="qs_TextKristofer"/>
</Sequence>
<Reaction reactor="action_talk" actor="TilHamingjuMedHirdstjora" seq="s_TilHamingjuMedHirdstjora"/>

<!-- Hvernig gekk siglingin frá Danmörku -->
<Sequence name="s_HvernigGekkSiglingin">
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="qh_HvernigGekkSiglingin"/>
	<Quantum name="q_HvernigGekkSiglingin"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_BaraVelThakka"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="qs_TextKristofer"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvernigGekkSiglingin" seq="s_HvernigGekkSiglingin"/>

<Sequence name="s_ShowSystir">
	<Quantum name="qs_HannGaetiVeridHja"/>
</Sequence>

<CheckConditionQuantum name="q_CheckSystir" flag="f_TalkedWithWoman" wait="true">
	<Trigger value="1" seq="s_ShowSystir"/>
</CheckConditionQuantum>

<!-- Mikið hef ég beðið lengi eftir komu ..-->
<Sequence name="s_MikidHefEgBedidLengi">
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="q_MikidHefEgBedidLengi"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_OgFulltingiMitt"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="qs_JaEgHeldAdHann"/>
	<Quantum name="qs_ErHannEkkiBara"/>
	<Quantum name="qs_ErHannEkkiHerI"/>
	<Quantum name="qs_HannErOrugglegaHja"/>
	<Quantum name="q_CheckSystir"/>
    <Quantum name="qh_TilHamingjuMedHirdstjora"/>
    <Quantum name="qh_HvernigGekkSiglingin"/>
    <Quantum name="qh_MikidHefEgBedidLengi"/>
	<Quantum name="q_KristoferTalk2"/>
	<Quantum name="qs_TextKristofer"/>
</Sequence>
<Reaction reactor="action_talk" actor="MikidHefEgBedidLengi" seq="s_MikidHefEgBedidLengi"/>

<!-- Já ég held að hann sé .. -->
<Sequence name="s_JaEgHeldAdHann">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_JaEgHeldAdHann"/>
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="q_JaEgHeldAdHann"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ReykjavikAfHverju"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="JaEgHeldAdHann" seq="s_JaEgHeldAdHann"/>

<!-- Er hann ekki bara heima hjá sér -->
<Sequence name="s_ErHannEkkiBara">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_ErHannEkkiBara"/>
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="q_ErHannEkkiBara"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThadGeturVarla"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="ErHannEkkiBara" seq="s_ErHannEkkiBara"/>

<!-- Hann gæti verið hjá systur sinni -->
<Sequence name="s_HannGaetiVeridHja">
	<Quantum name="qp_Gissur4"/>
	<Quantum name="qp_Gissur5"/>
	<Quantum name="qp_Gissur6"/>
	<Quantum name="qh_HannGaetiVeridHja"/>
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="q_HannGaetiVeridHja"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThadGaetiVerid"/>
	<Quantum name="q_KristoferGefur"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_GissurTekurStein"/>
	<Quantum name="q_GissurStopStein"/>
	<Quantum name="q_PlayHverfur"/>
	<Quantum name="q_GissurHverfur"/>
	<Quantum name="q_Freeze"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="q_StopSong"/>
	<Quantum name="q_StopSFX"/>
    <Quantum name="q_Fin"/>
</Sequence>
<Reaction reactor="action_talk" actor="HannGaetiVeridHja" seq="s_HannGaetiVeridHja"/>

<!-- Er hann ekki hér í Kópavogi -->
<Sequence name="s_ErHannEkkiHerI">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_ErHannEkkiHerI"/>
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="q_ErHannEkkiHerI"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_NeiEgHeldEkki"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="ErHannEkkiHerI" seq="s_ErHannEkkiHerI"/>

<!-- Hann er örugglega hjá augnlækni -->
<Sequence name="s_HannErOrugglegaHja">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_HannErOrugglegaHja"/>
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="q_HannErOrugglegaHja"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgSemHeltAd"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="HannErOrugglegaHja" seq="s_HannErOrugglegaHja"/>

<!-- Hann er örugglega hjá augnlækni -->
<Sequence name="s_BlessKristofer">
	<Quantum name="qh_TextKristofer"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="BlessKristofer" seq="s_BlessKristofer"/>

<Sequence name="s_BeginConvKristoferFirst">
	<Quantum name="q_HeillOgSaellHerra"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_SaellOgBlessadurHerra"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_KristoferTalk1"/>
	<Quantum name="qs_TextKristofer"/>
</Sequence>

<Sequence name="s_BeginConvKristoferLater">
	<Quantum name="q_SaellOgBlessadurHerra2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_HeillOgSaellHerra2"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="qs_TextKristofer"/>
</Sequence>

<Sequence name="s_KrissiAsks">
	<Quantum name="q_SaellOgBlessadurHerra2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_HeillOgSaellHerra2"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_VeistuNokkudHvar"/>
	<Quantum name="q_StopKristofer"/>
	<Quantum name="q_CheckSystir"/>
	<Quantum name="qs_TextKristofer"/>
</Sequence>

<CheckConditionQuantum name="q_CheckConvKristofer" flag="f_KristoferTalk" wait="true">
	<Trigger value="0" seq="s_BeginConvKristoferFirst"/>
	<Trigger value="1" seq="s_BeginConvKristoferLater"/>
	<Trigger value="2" seq="s_KrissiAsks"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvKristofer">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_WalkGissur2Kristofer"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Conversating"/>
    <Quantum name="q_CheckConvKristofer"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Kristofer" seq="s_BeginConvKristofer"/>


<UseText actor="a_SkaeriAskur" actor2="a_Ogmundur" listener="sc" text="Stinga Ögmund með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_OddurF" listener="sc" text="Stinga Odd með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_OddurT" listener="sc" text="Stinga Odd með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Vinnumadur" listener="sc" text="Stinga vinnumann með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Radsmadur" listener="sc" text="Stinga ráðsmanninn með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Brytinn" listener="sc" text="Stinga brytann með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Fuli" listener="sc" text="Stinga þögla manninn með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Kristofer" listener="sc" text="Stinga Kristófer með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Kjaftakelling" listener="sc" text="Stinga kjaftakerlingu með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Puki" listener="sc" text="Stinga púkann með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Konungsmenn" listener="sc" text="Stinga konungsmennina með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Gissur" listener="sc" text="Stinga mig með skærunum"/>
<UseText actor="a_SkaeriAskur" actor2="a_Sendibref" listener="sc" text="Klippa sendibréfið til Jóns Arasonar"/>

<UseText actor="a_Kollur" actor2="a_Ogmundur" listener="sc" text="Lemja Ögmund með kollinum"/>
<UseText actor="a_Kollur" actor2="a_OddurF" listener="sc" text="Lemja Odd með kollinum"/>
<UseText actor="a_Kollur" actor2="a_OddurT" listener="sc" text="Stinga Odd með skærunum"/>
<UseText actor="a_Kollur" actor2="a_Vinnumadur" listener="sc" text="Lemja vinnumanninn með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Radsmadur" listener="sc" text="Lemja ráðsmanninn með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Brytinn" listener="sc" text="Lemja brytann með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Fuli" listener="sc" text="Lemja þögla manninn með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Kristofer" listener="sc" text="Lemja Kristófer með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Kjaftakelling" listener="sc" text="Lemja kjaftakellinguna með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Puki" listener="sc" text="Lemja púkann með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Konungsmenn" listener="sc" text="Lemja konungsmennina með kollinum"/>
<UseText actor="a_Kollur" actor2="a_Gissur" listener="sc" text="Lemja mig með kollinum"/>

<UseText actor="a_PeningarAskur" actor2="a_Ogmundur" listener="sc" text="Gefa Ögmundi peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_OddurF" listener="sc" text="Gefa Oddi peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_OddurT" listener="sc" text="Gefa Oddi peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Vinnumadur" listener="sc" text="Gefa vinnumanninum peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Radsmadur" listener="sc" text="Gefa ráðsmanninum peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Brytinn" listener="sc" text="Gefa brytanum peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Fuli" listener="sc" text="Gefa þögla manninum peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Kristofer" listener="sc" text="Gefa Kristófer peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Kjaftakelling" listener="sc" text="Gefa kjaftakellingunni peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Puki" listener="sc" text="Múta púkanum með peningum"/>
<UseText actor="a_PeningarAskur" actor2="a_Konungsmenn" listener="sc" text="Gefa konungsmönnunum peninga"/>
<UseText actor="a_PeningarAskur" actor2="a_Gissur" listener="sc" text="Gefa mér peninga"/>

<UseText actor="a_PokiFullur" actor2="a_SkuffaSvefnherbergiOpen" listener="sc" text="Setja troðfullan pokann í skúffuna"/>

<UseText actor="a_TvinniAskur" actor2="a_Ogmundur" listener="sc" text="Sauma Ögmund saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Oddur" listener="sc" text="Sauma Odd saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Oddur" listener="sc" text="Sauma Odd saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Vinnumadur" listener="sc" text="Sauma vinnumanninn saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Radsmadur" listener="sc" text="Sauma ráðsmanninn saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Brytinn" listener="sc" text="Sauma brytann saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Fuli" listener="sc" text="Sauma þögla manninn saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Kristofer" listener="sc" text="Sauma Kristófer saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Kjaftakelling" listener="sc" text="Sauma fyrir kjaftinn á kjaftakellingunni"/>
<UseText actor="a_TvinniAskur" actor2="a_Puki" listener="sc" text="Sauma púkann saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Konungsmenn" listener="sc" text="Sauma konungsmennina saman"/>
<UseText actor="a_TvinniAskur" actor2="a_Gissur" listener="sc" text="Sauma mig saman"/>

<UseText actor="a_SkaeriAskur" actor2="a_Bok11" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok12" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok13" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok14" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok15" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok16" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok17" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok18" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok19" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok20" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok21" listener="sc" text="Klippa bókina í tætlur"/>
<UseText actor="a_SkaeriAskur" actor2="a_Baekur2" listener="sc" text="Klippa allar bækurnar í ofurlitla strimla!"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok22" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok23" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok24" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok25" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok26" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Bok27" listener="sc" text="Klippa bókina"/>
<UseText actor="a_SkaeriAskur" actor2="a_Mariumynd" listener="sc" text="Klippa Maríu út úr Maríumyndinni"/>
<UseText actor="a_SkaeriAskur" actor2="a_TvinniAskur" listener="sc" text="Klippa tvinnann"/>
<UseText actor="a_SkaeriAskur" actor2="a_Krossfiskur" listener="sc" text="Klippa krossfiskinn"/>


<!-- Reactions -->
<Sequence name="s_LookSkaeriAskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_ThettaEruFallegOg"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_SkaeriAskur" seq="s_LookSkaeriAskur"/>

<Sequence name="s_LookGissur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_KomduSaellVinnumadur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Gissur" seq="s_LookGissur"/>
<Reaction reactor="action_take" actor="a_Gissur" seq="s_LookGissur"/>
<Reaction reactor="action_talk" actor="a_Gissur" seq="s_LookGissur"/>


<Sequence name="s_LookTolurAskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_ThettaEruOskop"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_TolurAskur" seq="s_LookTolurAskur"/>

<Sequence name="s_LookTvinniAskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_NalOgTvinni"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_TvinniAskur" seq="s_LookTvinniAskur"/>

<Sequence name="s_LookPeningarAskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_ThettaEruMiklirPeningar"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_PeningarAskur" seq="s_LookPeningarAskur"/>

<Sequence name="s_LookOddur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErHannOddur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_OddurT" seq="s_LookOddur"/>
<Reaction reactor="action_look" actor="a_OddurF" seq="s_LookOddur"/>

<Sequence name="s_LookKaleikur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErKaleikur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Kaleikur" seq="s_LookKaleikur"/>

<Sequence name="s_LookSilfur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErBaraOskopVenjulegurKertastjaki"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Silfur" seq="s_LookSilfur"/>

<Sequence name="s_LookMariumynd">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErMyndAf"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Mariumynd" seq="s_LookMariumynd"/>

<Sequence name="s_LookEngill">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErStyttaAfEngli"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Engill" seq="s_LookEngill"/>

<Sequence name="s_LookKrossfiskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThadErEitthvadDularfullt"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Krossfiskur" seq="s_LookKrossfiskur"/>

<Sequence name="s_LookKjaftakelling">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_KonanErAdBidjast"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Kjaftakelling" seq="s_LookKjaftakelling"/>

<Sequence name="s_LookRadsmadur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErRadsmadurinn"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Radsmadur" seq="s_LookRadsmadur"/>

<Sequence name="s_LookOgmundur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_TharnaStendurOgmundur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Ogmundur" seq="s_LookOgmundur"/>

<Sequence name="s_LookFuli">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgVeitEkkert"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Fuli" seq="s_LookFuli"/>

<Sequence name="s_TalkFuli">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_NeiEgHeldAd"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Fuli" seq="s_TalkFuli"/>

<Sequence name="s_TalkRadsmadur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_NeiEgHeldAdEgSe"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Radsmadur" seq="s_TalkRadsmadur"/>

<Sequence name="s_LookBrytinn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErBrytinn"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Brytinn" seq="s_LookBrytinn"/>

<Sequence name="s_LookKonungsmenn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MikidEruMenn"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Konungsmenn" seq="s_LookKonungsmenn"/>

<Sequence name="s_TalkKonungsmenn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_SaelirFelagar"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Konungsmenn" seq="s_TalkKonungsmenn"/>

<Sequence name="s_LookKristofer">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErNyrHirdstjori"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Kristofer" seq="s_LookKristofer"/>

<Sequence name="s_LookVinnumadur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_VinnumadurinnVirdist"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Vinnumadur" seq="s_LookVinnumadur"/>

<Sequence name="s_LookPuki">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_HvadErThessiOfrynilegi"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Puki" seq="s_LookPuki"/>

<Sequence name="s_LookLykill">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_FlotturLykill"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Lykill" seq="s_LookLykill"/>

<Sequence name="s_LookPokiFullur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_PokinnErTrodfullur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_PokiFullur" seq="s_LookPokiFullur"/>

<Sequence name="s_LookPokiHalfFullur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_PokinnErEkkiTomur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_PokiHalfFullur" seq="s_LookPokiHalfFullur"/>

<Sequence name="s_LookPoki">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_TomurPoki"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Poki" seq="s_LookPoki"/>

<Sequence name="s_LookAskur2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThettaErFallegurAskur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Askur2" seq="s_LookAskur2"/>
<Reaction reactor="action_look" actor="a_AskurLitill" seq="s_LookAskur2"/>

<Sequence name="s_LookKollur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThessiKollur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Kollur" seq="s_LookKollur"/>

<Sequence name="s_LookSkilti">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ASkiltinuStendur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Skilti" seq="s_LookSkilti"/>

<Sequence name="s_TakeBaekur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgHefEkkertAdGera"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Baekur45" seq="s_TakeBaekur"/>
<Reaction reactor="action_take" actor="a_Baekur2" seq="s_TakeBaekur"/>

<Sequence name="s_TakeHuman">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Talk2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_OddurT" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_OddurF" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Brytinn" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Ogmundur" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Kristofer" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Konungsmenn" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Vinnumadur" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Radsmadur" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Kjaftakelling" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Fuli" seq="s_TakeHuman"/>


<!-- Miscellaneous reactions -->

<JMFActorMouth name="m_Byrjunarlag" file="\Landnam\Media\1_kort.wav" prepare="true" repeat="true"/>
<FadeQuantum name="qf_ByrjunarlagOut2" mouth="m_Byrjunarlag" goal="0" speed="150"/>
<FadeQuantum name="qf_ByrjunarlagIn" mouth="m_Byrjunarlag" goal="0.9" speed="100"/>
<PrepareQuantum name="qp_Byrjunarlag" object="m_Byrjunarlag" prepare="true"/>
<StaticActor name="a_Byrjunarlag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Byrjunarlag"/> </StaticActor>
<StateQuantum name="q_Byrjunarlag_stop" actor="a_Byrjunarlag" state="stop" wait="false"/>
<StateQuantum name="q_Byrjunarlag_play" actor="a_Byrjunarlag" state="play" wait="false"/>
<Scene name="s_BeginScene"/>
<SimplePseudo3DTerrain name="t_BeginScene" scene="s_BeginScene" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<StaticActorFace name="af_BeginScene" file="\sidaskiA\Graphic\byrjunaA"/>
<StaticActor name="a_BeginScene" terrain="t_BeginScene" x="0" y="5000" z="5000" state="stop">
	<State name="stop" face="af_BeginScene"/>
</StaticActor>
<PrepareQuantum name="qp_BeginScene" object="af_BeginScene" prepare="true"/>
<PrepareQuantum name="qu_BeginScene" object="af_BeginScene" prepare="false"/>
<SwitchSceneQuantum name="q_ToBeginScene" scene="s_BeginScene"/>

<!-- Hotspot between HjaBryta to FyrirUtan -->
<Sequence name="s_HjaBryta2FyrirUtan">
	<Quantum name="q_Freeze"/>
	<Quantum name="qh_HjaBryta2FyrirUtan"/>
	<Quantum name="q_WalkGissur2FyrirUtan"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_HjaBryta"/>
	<Quantum name="q_StopLogi"/>
	<Quantum name="qp_FyrirUtan"/>
	<Quantum name="q_MoveGissur2FyrirUtanFromHjaBryta"/>
	<Quantum name="q_ToFyrirUtan"/>
	<Quantum name="q_CurrentFyrirUtan"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_HjaBryta2FyrirUtan"/>
</Sequence>
<Reaction reactor="ac_HjaBryta2FyrirUtan" actor="a_Gissur" seq="s_HjaBryta2FyrirUtan"/>

<!-- Hotspot to determine when Ogmundur is to talk to Gissur -->
<Sequence name="s_Special">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Special"/>
	<Quantum name="q_GodanDaginnGissurHvernig"/>
	<Quantum name="q_StopOgmundur"/>
	<Quantum name="q_WalkGissur2SpecialSpot"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_BaraVel"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThuTalarBaraVid"/>
	<Quantum name="q_StopOgmundur"/>
	<Quantum name="q_JaEgGeri"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThuVerdurBaraAdGaeta"/>
	<Quantum name="q_StopOgmundur"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_ToKirkjaOk"/>
</Sequence>
<Reaction reactor="ac_Special" actor="a_Gissur" seq="s_Special"/>

<Sequence name="s_Special3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Special3"/>
	<Quantum name="q_ErThettaThuGissur"/>
	<Quantum name="q_StopOgmundur"/>
	<Quantum name="q_WalkGissur2SpecialSpot2"/>
	<Quantum name="q_WalkGissur2SpecialSpot"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_UmmhhJa"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_OgmundurPotar"/>
	<Quantum name="q_EgFrettiAdHelgirMunir"/>
	<Quantum name="q_StopOgmundur"/>
	<Quantum name="q_OgmundurPotar"/>
	<Quantum name="q_StopOgmundur"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_ToKirkjaOk"/>
</Sequence>
<Reaction reactor="ac_Special3" actor="a_Gissur" seq="s_Special3"/>

<!-- Hotspot between FyrirUtan to Skrifstofa -->
<Sequence name="s_FyrirUtan2Skrifstofa">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkGissur2SkrifstofaAA"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_FyrirUtan"/>
	<Quantum name="qp_Skrifstofa"/>
	<Quantum name="q_ToSkrifstofa"/>
	<Quantum name="qh_Skrifstofa2FyrirUtan"/>
	<Quantum name="q_MoveGissur2SkrifstofaFromFyrirUtan"/>
	<Quantum name="q_WalkGissur2SkrifstofaFromFyrirUtan"/>
	<Quantum name="qs_Skrifstofa2FyrirUtan"/>
	<Quantum name="q_CurrentSkrifstofa"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_FyrirUtan2SkrifstofaTT" seq="s_FyrirUtan2Skrifstofa"/>

<!-- Hotspot condition between Skrifstofa to FyrirUtan -->
<Sequence name="s_Skrifstofa2FyrirUtan">
	<Quantum name="q_Freeze"/>
	<Quantum name="qh_Skrifstofa2FyrirUtan"/>
	<Quantum name="q_WalkGissur2FyrirUtanFromSkrifstofa"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveGissur2FyrirUtanFromSkrifstofa"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Skrifstofa"/>
	<Quantum name="qp_FyrirUtan"/>
	<Quantum name="q_ToFyrirUtan"/>
	<Quantum name="q_CurrentFyrirUtan"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_Skrifstofa2FyrirUtan"/>
</Sequence>
<Reaction reactor="ac_Skrifstofa2FyrirUtan" actor="a_Gissur" seq="s_Skrifstofa2FyrirUtan"/>

<!-- Hotspot between Skrifstofa to Svefnherbergi -->
<Sequence name="s_Skrifstofa2Svefnherbergi">
	<Quantum name="q_Freeze"/>
	<Quantum name="qh_Skrifstofa2Svefnherbergi"/>
	<Quantum name="q_WalkGissur2SvefnherbergiFromSkrifstofa"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveGissur2SvefnherbergiFromSkrifstofa"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Skrifstofa"/>
	<Quantum name="qp_Svefnherbergi"/>
	<Quantum name="q_ToSvefnherbergi"/>
	<Quantum name="q_CurrentSvefnherbergi"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_Skrifstofa2Svefnherbergi"/>
</Sequence>
<Reaction reactor="ac_Skrifstofa2Svefnherbergi" actor="a_Gissur" seq="s_Skrifstofa2Svefnherbergi"/>

<!-- Hotspot between Svefnherbergi to Skrifstofa -->
<Sequence name="s_Svefnherbergi2Skrifstofa">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkGissur2SkrifstofaBB"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Svefnherbergi"/>
	<Quantum name="qp_Skrifstofa"/>
	<Quantum name="q_MoveGissur2SkrifstofaFromSvefnherbergi"/>

	<!-- Vantar labb! -->

	<Quantum name="q_ToSkrifstofa"/>
	<Quantum name="q_CurrentSkrifstofa"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Svefnherbergi2SkrifstofaTT" seq="s_Svefnherbergi2Skrifstofa"/>

<Sequence name="s_KonungsmennDans">
    <Quantum name="q_KonungsmennDans"/>
</Sequence>
<CheckConditionQuantum name="q_CheckKonungsmenn" flag="f_Bryti" wait="true">
	<Trigger value="6" seq="s_KonungsmennDans"/>
</CheckConditionQuantum>

<!-- Hotspot between FyrirUtan to Kopavogur -->
<Sequence name="s_FyrirUtan2Kopavogur">
	<Quantum name="q_Freeze"/>
	<Quantum name="qh_FyrirUtan2Kopavogur"/>
	<Quantum name="qh_Kopavogur2FyrirUtan"/>
	<Quantum name="q_WalkGissur2KopavogurFromFyrirUtan"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_FyrirUtan"/>
	<Quantum name="qf_AdallagOut"/>
	<Quantum name="qp_Map"/>
	<Quantum name="q_PlayKort"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="qs_Kop"/>
	<Quantum name="qf_KortalagIn"/>
	<Quantum name="q_PlayMap"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qf_KortalagOut"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qh_Kop"/>
	<Quantum name="qu_Map"/>
	<Quantum name="qp_Kopavogur"/>
    <Quantum name="q_CheckKonungsmenn"/>
	<Quantum name="q_MoveGissur2KopavogurFromFyrirUtan"/>
	<Quantum name="q_PlaySong"/>
	<Quantum name="q_ToKopavogur"/>
	<Quantum name="q_PlayKopavogur"/>
	<Quantum name="qf_AdallagIn"/>
	<Quantum name="q_WalkGissur2Kopavogur"/>
	<Quantum name="qs_FyrirUtan2Kopavogur"/>
	<Quantum name="qs_Kopavogur2FyrirUtan"/>
	<Quantum name="q_ToKopavogur1"/>
	<Quantum name="q_CurrentKopavogur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="ac_FyrirUtan2Kopavogur" actor="a_Gissur" seq="s_FyrirUtan2Kopavogur"/>

<Sequence name="s_KonungsmennDans2">
    <Quantum name="q_KonungsmennStop"/>
</Sequence>
<CheckConditionQuantum name="q_CheckKonungsmenn2" flag="f_Bryti" wait="true">
	<Trigger value="6" seq="s_KonungsmennDans2"/>
</CheckConditionQuantum>

<!-- Hotspot between Kopavogur to FyrirUtan -->
<Sequence name="s_Kopavogur2FyrirUtan">
	<Quantum name="q_Freeze"/>
	<Quantum name="qh_FyrirUtan2Kopavogur"/>
	<Quantum name="qh_Kopavogur2FyrirUtan"/>
	<Quantum name="q_WalkGissur2FyrirUtanFromKopavogur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qf_AdallagOut"/>
	<Quantum name="q_StopSFX"/>
	<Quantum name="qu_Kopavogur"/>
	<Quantum name="qp_Map"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="q_PlayKort"/>
	<Quantum name="qs_Skal"/>
	<Quantum name="qf_KortalagIn"/>
	<Quantum name="q_PlayMap2"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qf_KortalagOut"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qh_Skal"/>
	<Quantum name="qu_Map"/>
	<Quantum name="qp_FyrirUtan"/>
	<Quantum name="q_MoveGissur2FyrirUtanFromKopavogur"/>
	<Quantum name="q_PlaySong"/>
	<Quantum name="q_ToFyrirUtan"/>
	<Quantum name="qf_AdallagIn"/>
	<Quantum name="q_WalkGissur2FyrirUtanFromKopavogur2"/>
	<Quantum name="qs_FyrirUtan2Kopavogur"/>
	<Quantum name="qs_Kopavogur2FyrirUtan"/>
    <Quantum name="q_CheckKonungsmenn2"/>
	<Quantum name="q_ToKopavogur0"/>
	<Quantum name="q_CurrentFyrirUtan"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_KopavogurInc"/> </Sequence>
<Reaction reactor="ac_Kopavogur2FyrirUtan" actor="a_Gissur" seq="s_Kopavogur2FyrirUtan"/>

<!-- Hotspot between Kirkja and fyrir utan -->
<Sequence name="s_Kirkja2FyrirUtan">
	<Quantum name="q_Freeze"/>
	<Quantum name="qh_Kirkja2FyrirUtan"/>
	<Quantum name="q_WalkGissur2FyrirUtanFromKirkja"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Kirkja"/>
	<Quantum name="qp_FyrirUtan"/>
	<Quantum name="q_MoveGissur2FyrirUtanFromKirkja"/>
	<Quantum name="q_ToFyrirUtan"/>
	<Quantum name="q_CurrentFyrirUtan"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qh_Kirkja2FyrirUtan"/>
</Sequence>

<Sequence name="s_MovePoki2Vasi">
	<Quantum name="q_MovePoki2Inventory"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPoki81" flag="f_Poki" wait="true">
	<Trigger value="1" seq="s_MovePoki2Vasi"/>
</CheckConditionQuantum>

<Sequence name="s_KirkjaNot2FyrirUtan">
	<Quantum name="q_HvadErtThuAdGera"/>
	<Quantum name="q_StopRadsmadur"/>
	<Quantum name="q_MoveGissur2wardRadsmadur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_AMedanEgEr"/>
	<Quantum name="q_StopRadsmadur"/>
	<Quantum name="q_LatumThadGottHeita"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_SilfurStop"/>
	<Quantum name="q_EngillStop"/>
	<Quantum name="q_KaleikurStop"/>
	<Quantum name="q_MariumyndStop"/>
	<Quantum name="qs_Silfur"/>
	<Quantum name="qs_Engill"/>
	<Quantum name="qs_Kaleikur"/>
	<Quantum name="qs_Mariumynd"/>
	<Quantum name="qh_PokiHalfFullur"/>
	<Quantum name="q_CheckPoki81"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_GissurWhy"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_SacredItemNull"/>
	<Quantum name="q_SacredItemsInBagNull"/>
	<Quantum name="q_SilfurFromInventory"/>
	<Quantum name="q_KaleikurFromInventory"/>
	<Quantum name="q_EngillFromInventory"/>
	<Quantum name="q_MariumyndFromInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>

<CheckConditionQuantum name="q_IfSacredItemTaken" flag="f_SacredItemsTaken" wait="true">
	<Trigger value="0" seq="s_Kirkja2FyrirUtan"/>
	<Trigger value="1" seq="s_KirkjaNot2FyrirUtan"/>
	<Trigger value="2" seq="s_KirkjaNot2FyrirUtan"/>
	<Trigger value="3" seq="s_KirkjaNot2FyrirUtan"/>
	<Trigger value="4" seq="s_KirkjaNot2FyrirUtan"/>
</CheckConditionQuantum>

<Sequence name="s_LeavingKirkja">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_IfSacredItemTaken"/>
</Sequence>
<Reaction reactor="ac_Kirkja2FyrirUtan" actor="a_Gissur" seq="s_LeavingKirkja"/>

<Sequence name="s_GoKirkja">
	<Quantum name="q_WalkGissur2KirkjaAA"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToBlack"/>
    <Quantum name="qu_FyrirUtan"/>
	<Quantum name="qp_Kirkja"/>
	<Quantum name="qh_Kirkja2FyrirUtan"/>
	<Quantum name="q_MoveGissur2KirkjaFromFyrirUtan"/>
	<Quantum name="q_ToKirkja"/>
	<Quantum name="q_WalkGissur2KirkjaFromFyrirUtan"/>
	<Quantum name="qs_Kirkja2FyrirUtan"/>
	<Quantum name="q_CurrentKirkja"/>
</Sequence>

<CheckConditionQuantum name="q_CheckChurch" flag="f_Kirkja4" wait="true">
	<Trigger value="1" seq="s_GoKirkja"/>
</CheckConditionQuantum>

<!-- Hotspot between FyrirUtan to Kirkja -->
<Sequence name="s_FyrirUtan2Kirkja">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_CheckChurch"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_FyrirUtan2KirkjaTT" seq="s_FyrirUtan2Kirkja"/>

<Sequence name="s_Thu">
    <Quantum name="q_Conversating"/>
	<Quantum name="q_ThuHefurStadidThigVel"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_EdlilegaTharSem"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgErHraeddurUm"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_EgHeldAdOddur"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_BrytiInc"/>
	<Quantum name="qh_Ogmundur"/>
    <Quantum name="qs_Vinnumadur"/>
	<Quantum name="qs_TextBrytinn"/>
	<Quantum name="q_Conversating"/>
</Sequence>

<Sequence name="s_Hefur2">
    <Quantum name="q_Conversating"/>
	<Quantum name="q_HefurThuKomist"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_EgKomstYfirThettaBref"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EkkiOrvaentaGissur"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_OgmundurHefurLika"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_DrifduThigNuAdHitta"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_BrytiInc"/>
	<Quantum name="q_Moving"/>
 	<Quantum name="qs_KonungsmennAll"/>
</Sequence>

<CheckConditionQuantum name="q_CheckBryti" flag="f_Bryti" wait="true">
	<Trigger value="0" seq="s_Flyttu"/>
	<Trigger value="1" seq="s_Thetta"/>
	<Trigger value="2" seq="s_Thu"/>
	<Trigger value="3" seq="s_Hefur"/>
	<Trigger value="4" seq="s_Hefur"/>
	<Trigger value="5" seq="s_Hefur2"/>
	<Trigger value="6" seq="s_Drifdu"/>
</CheckConditionQuantum>

<!-- Hotspot between FyrirUtan to HjaBryta -->
<Sequence name="s_FyrirUtan2HjaBryta">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkGissur2HjaBrytaAA"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_FyrirUtan"/>
	<Quantum name="q_StartLogi"/>
	<Quantum name="qp_HjaBryta"/>
	<Quantum name="q_ToHjaBryta"/>
	<Quantum name="qh_HjaBryta2FyrirUtan"/>
	<Quantum name="q_MoveGissur2HjaBryta"/>
	<Quantum name="q_WalkGissur2HjaBryta"/>
	<Quantum name="qs_HjaBryta2FyrirUtan"/>
	<Quantum name="q_CheckBryti"/>
	<Quantum name="q_CurrentHjaBryta"/>
</Sequence>
<Reaction reactor="action_take" actor="a_FyrirUtan2HjaBrytaTT" seq="s_FyrirUtan2HjaBryta"/>

<!-- Hlutir -->

<Sequence name="s_LookAskurCantSee">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgNaeEkki"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_AskurLitill" seq="s_LookAskurCantSee"/>
<Reaction reactor="action_take" actor="a_Askur2" seq="s_LookAskurCantSee"/>

<Sequence name="s_UseKollurOnAskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveGissur2wardHilla2"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qp_Gissur1"/>
	<Quantum name="qp_Gissur2"/>
	<Quantum name="q_GissurStigur"/>
	<Quantum name="q_GissurStopStigur"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_HjaBryta"/>
	<Quantum name="qp_Askur"/>
	<Quantum name="q_ToAskur"/>
	<Quantum name="qu_Gissur1"/>
	<Quantum name="qu_Gissur2"/>
	<Quantum name="q_MoveKollur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_GissurNone"/>
	<Quantum name="q_Taking"/>
	<Quantum name="q_CurrentAskur"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Kollur" actor2="a_AskurLitill" seq="s_UseKollurOnAskur"/>
<Reaction reactor="action_use" actor="a_Kollur" actor2="a_Askur2" seq="s_UseKollurOnAskur"/>

<Sequence name="s_LeaveAskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Askur"/>
	<Quantum name="qp_HjaBryta"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ToHjaBryta"/>
	<Quantum name="q_MoveKollur2Inventory"/>
	<Quantum name="q_KollurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_CurrentHjaBryta"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Askur2HjaBryta" seq="s_LeaveAskur"/>
<Reaction reactor="action_take" actor="a_Askur2HjaBryta" seq="s_LeaveAskur"/>
<Reaction reactor="action_talk" actor="a_Askur2HjaBryta" seq="s_LeaveAskur"/>

<Sequence name="s_TakeKollur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_KollurTaken"/>
	<Quantum name="q_MoveKollur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Kollur" seq="s_TakeKollur"/>

<Sequence name="s_TakeSilfur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveSilfur2Inventory"/>
	<Quantum name="q_SilfurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_SacredItemTaken"/>
	<Quantum name="q_SilfurInInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Silfur" seq="s_TakeSilfur"/>

<Sequence name="s_TakeEngill">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveEngill2Inventory"/>
	<Quantum name="q_EngillTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_SacredItemTaken"/>
	<Quantum name="q_EngillInInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Engill" seq="s_TakeEngill"/>

<Sequence name="s_TakeKaleikur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveKaleikur2Inventory"/>
	<Quantum name="q_KaleikurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_SacredItemTaken"/>
	<Quantum name="q_KaleikurInInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Kaleikur" seq="s_TakeKaleikur"/>

<Sequence name="s_TakeSalmabok">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveSalmabok2Inventory"/>
	<Quantum name="q_SalmabokTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Testament1"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Salmabok" seq="s_TakeSalmabok"/>

<Sequence name="s_TakeMariumynd">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveMariumynd2Inventory"/>
	<Quantum name="q_MariumyndTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_SacredItemTaken"/>
	<Quantum name="q_MariumyndInInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Mariumynd" seq="s_TakeMariumynd"/>

<Sequence name="s_Poki2HalfFullur">
	<Quantum name="q_MovePoki"/>
	<Quantum name="qs_PokiHalfFullur"/>
</Sequence>

<Sequence name="s_Poki2Fullur">
	<Quantum name="qh_PokiHalfFullur"/>
	<Quantum name="qs_PokiFullur"/>
	<Quantum name="q_BrytiInc"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPoki83" flag="f_NumberSacredItemsInBag" wait="true">
	<Trigger value="1" seq="s_Poki2HalfFullur"/>
	<Trigger value="2" seq="s_Poki2HalfFullur"/>
	<Trigger value="3" seq="s_Poki2HalfFullur"/>
	<Trigger value="4" seq="s_Poki2Fullur"/>
</CheckConditionQuantum>

<Sequence name="s_PutSilfurInPoki">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Silfur"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_SacredItemInBag"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Silfur" actor2="a_Poki" seq="s_PutSilfurInPoki"/>
<Reaction reactor="action_use" actor="a_Silfur" actor2="a_PokiHalfFullur" seq="s_PutSilfurInPoki"/>

<Sequence name="s_SacredItemDown">
	<Quantum name="q_SacredItemInBag"/>
</Sequence>

<CheckConditionQuantum name="q_CheckSilfurDown" flag="f_SilfurInInventory" wait="true">
	<Trigger value="1" seq="s_SacredItemDown"/>
</CheckConditionQuantum>
<CheckConditionQuantum name="q_CheckEngillDown" flag="f_EngillInInventory" wait="true">
	<Trigger value="1" seq="s_SacredItemDown"/>
</CheckConditionQuantum>
<CheckConditionQuantum name="q_CheckKaleikurDown" flag="f_KaleikurInInventory" wait="true">
	<Trigger value="1" seq="s_SacredItemDown"/>
</CheckConditionQuantum>
<CheckConditionQuantum name="q_CheckMariumyndDown" flag="f_MariumyndInInventory" wait="true">
	<Trigger value="1" seq="s_SacredItemDown"/>
</CheckConditionQuantum>

<Sequence name="s_PutSilfurInPoki233">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Silfur"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_CheckSilfurDown"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_PokiHalfFullur" actor2="a_Silfur" seq="s_PutSilfurInPoki233"/>
<Reaction reactor="action_use" actor="a_Poki" actor2="a_Silfur" seq="s_PutSilfurInPoki233"/>

<Sequence name="s_PutEngillInPoki">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Engill"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_SacredItemInBag"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Engill" actor2="a_Poki" seq="s_PutEngillInPoki"/>
<Reaction reactor="action_use" actor="a_Engill" actor2="a_PokiHalfFullur" seq="s_PutEngillInPoki"/>

<Sequence name="s_PutEngillInPoki233">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Engill"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_CheckEngillDown"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Poki" actor2="a_Engill" seq="s_PutEngillInPoki233"/>
<Reaction reactor="action_use" actor="a_PokiHalfFullur" actor2="a_Engill" seq="s_PutEngillInPoki233"/>

<Sequence name="s_PutKaleikurInPoki">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Kaleikur"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_SacredItemInBag"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Kaleikur" actor2="a_Poki" seq="s_PutKaleikurInPoki"/>
<Reaction reactor="action_use" actor="a_Kaleikur" actor2="a_PokiHalfFullur" seq="s_PutKaleikurInPoki"/>

<Sequence name="s_PutKaleikurInPoki233">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Kaleikur"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_CheckKaleikurDown"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Poki" actor2="a_Kaleikur" seq="s_PutKaleikurInPoki233"/>
<Reaction reactor="action_use" actor="a_PokiHalfFullur" actor2="a_Kaleikur" seq="s_PutKaleikurInPoki233"/>

<Sequence name="s_PutMariumyndInPoki">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Mariumynd"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_SacredItemInBag"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Mariumynd" actor2="a_Poki" seq="s_PutMariumyndInPoki"/>
<Reaction reactor="action_use" actor="a_Mariumynd" actor2="a_PokiHalfFullur" seq="s_PutMariumyndInPoki"/>

<Sequence name="s_PutMariumyndInPoki233">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Mariumynd"/>
	<Quantum name="q_NumberSacredItemsInBag"/>
	<Quantum name="q_CheckMariumyndDown"/>
	<Quantum name="q_CheckPoki83"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Poki" actor2="a_Mariumynd" seq="s_PutMariumyndInPoki233"/>
<Reaction reactor="action_use" actor="a_PokiHalfFullur" actor2="a_Mariumynd" seq="s_PutMariumyndInPoki233"/>

<!-- Put skæri in inventory -->
<Sequence name="s_TakeSkaeri">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveSkaeri2Inventory"/>
	<Quantum name="q_SkaeriAskurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_SkaeriAskur" seq="s_TakeSkaeri"/>

<Sequence name="s_TakePeningar">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MovePeningar2Inventory"/>
	<Quantum name="q_PeningarAskurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_PeningarAskur" seq="s_TakePeningar"/>

<Sequence name="s_TakeTolur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveTolur2Inventory"/>
	<Quantum name="q_TolurAskurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_TolurAskur" seq="s_TakeTolur"/>

<Sequence name="s_TakeTvinni">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveTvinni2Inventory"/>
	<Quantum name="q_TvinniAskurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_TvinniAskur" seq="s_TakeTvinni"/>

<Sequence name="s_BirtaLykil">
	<Quantum name="q_BirtaLykil"/>
</Sequence>

<CheckConditionQuantum name="q_CheckShowLykill" flag="f_ShowLykill" wait="true">
	<Trigger value="0" seq="s_BirtaLykil"/>
</CheckConditionQuantum>

<Sequence name="s_FelaLykil">
	<Quantum name="q_FelaLykil"/>
</Sequence>

<CheckConditionQuantum name="q_CheckHideLykill" flag="f_HideLykill" wait="true">
	<Trigger value="0" seq="s_FelaLykil"/>
</CheckConditionQuantum>

<Sequence name="s_BirtaSkuffuSkrifstofu">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_FelaSkuffuSkrifstofuClosed"/>
	<Quantum name="q_PlaySkuffaSmall"/>
	<Quantum name="q_BirtaSkuffuSkrifstofu"/>
	<Quantum name="q_CheckShowLykill"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_SkuffaSkrifstofaClosed" seq="s_BirtaSkuffuSkrifstofu"/>

<Sequence name="s_LokaSkuffuSkrifstofu">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_CheckHideLykill"/>
	<Quantum name="q_LokaSkuffuSkrifstofu"/>
	<Quantum name="q_PlaySkuffaSmall"/>
	<Quantum name="q_SynaSkuffuSkrifstofuClosed"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_SkuffaSkrifstofaOpen" seq="s_LokaSkuffuSkrifstofu"/>

<Sequence name="s_TakeLykill">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveLykill2Inventory"/>
	<Quantum name="q_LykillTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_ShowLykill1"/>
	<Quantum name="q_HideLykill1"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Lykill" seq="s_TakeLykill"/>

<Sequence name="s_TakeGaldrabok">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveGaldrabok2Inventory"/>
	<Quantum name="q_GaldrabokTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Galdrabok1"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Galdrabok" seq="s_TakeGaldrabok"/>

<Sequence name="s_ShowGaldrabokLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ShowGaldrabokLarge"/>
	<Quantum name="q_ThessiGaldurHerEr"/>
	<Quantum name="q_GissurNone"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Galdrabok" seq="s_ShowGaldrabokLarge"/>

<Sequence name="s_ShowSendibrefLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="qu_Inventory"/>
    <Quantum name="qp_SendibrefLarge"/>
	<Quantum name="q_ShowSendibrefLarge"/>
	<Quantum name="q_ThettaErBref"/>
	<Quantum name="q_GissurNone"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Sendibref" seq="s_ShowSendibrefLarge"/>

<Sequence name="s_ShowBladsidaLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="qu_Inventory"/>
    <Quantum name="qp_BladsidaLarge"/>
	<Quantum name="qs_BladsidaLarge"/>
	<Quantum name="q_ThettaErBladsidan"/>
	<Quantum name="q_GissurNone"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Bladsida" seq="s_ShowBladsidaLarge"/>

<Sequence name="s_ShowSalmabokLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_WalkGissur2Salmabok"/>
	<Quantum name="q_ShowSalmabokLarge"/>
	<Quantum name="q_NyjaTestamentidHans"/>
	<Quantum name="q_GissurNone"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Salmabok" seq="s_ShowSalmabokLarge"/>

<Sequence name="s_ShowSalmabokLarge4">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qu_Inventory"/>
	<Quantum name="qp_SalmabokLargeGaldur"/>
    <Quantum name="q_ShowSalmabokLargeInv"/>
	<Quantum name="q_ThadErHaegt"/>
	<Quantum name="q_GissurNone"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_SalmabokGaldur" seq="s_ShowSalmabokLarge4"/>

<Sequence name="s_HideBladsidaLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="qu_BladsidaLarge"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="qp_Inventory"/>
	<Quantum name="qh_BladsidaLarge"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_BladsidaLarge" seq="s_HideBladsidaLarge"/>
<Reaction reactor="action_take" actor="a_BladsidaLarge" seq="s_HideBladsidaLarge"/>

<Sequence name="s_HideSendibrefLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="qu_SendibrefLarge"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="qp_Inventory"/>
	<Quantum name="q_HideSendibrefLarge"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_SendibrefLarge" seq="s_HideSendibrefLarge"/>
<Reaction reactor="action_take" actor="a_SendibrefLarge" seq="s_HideSendibrefLarge"/>

<Sequence name="s_UsualHide">
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_GaldrabokLarge"/>
    <Quantum name="qp_Skrifstofa"/>
	<Quantum name="q_HideGaldrabokLarge"/>
	<Quantum name="q_CurrentSkrifstofa"/>
	<Quantum name="q_ToSkrifstofa"/>
</Sequence>
<Sequence name="s_InvHide">
    <Quantum name="qu_GaldrabokLarge"/>
    <Quantum name="qp_Inventory"/>
	<Quantum name="q_HideGaldrabokLarge"/>
</Sequence>
<CheckConditionQuantum name="q_CheckWichHider" flag="f_Galdrabok" wait="true">
	<Trigger value="0" seq="s_UsualHide"/>
	<Trigger value="1" seq="s_InvHide"/>
</CheckConditionQuantum>
<Sequence name="s_HideGaldrabokLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StopGissur"/>
	<Quantum name="q_CheckWichHider"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_GaldrabokLarge" seq="s_HideGaldrabokLarge"/>
<Reaction reactor="action_take" actor="a_GaldrabokLarge" seq="s_HideGaldrabokLarge"/>
<Reaction reactor="action_talk" actor="a_GaldrabokLarge" seq="s_HideGaldrabokLarge"/>

<Sequence name="s_UsualHide2">
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_SalmabokLarge"/>
    <Quantum name="qp_Kirkja"/>
	<Quantum name="q_HideSalmabokLarge"/>
	<Quantum name="q_ToKirkja"/>
	<Quantum name="q_CurrentKirkja"/>
</Sequence>
<Sequence name="s_InvHide2">
    <Quantum name="qu_SalmabokLarge"/>
    <Quantum name="qp_Inventory"/>
	<Quantum name="q_HideSalmabokLarge"/>
</Sequence>
<CheckConditionQuantum name="q_CheckWichHider2" flag="f_Testament" wait="true">
	<Trigger value="0" seq="s_UsualHide2"/>
	<Trigger value="1" seq="s_InvHide2"/>
</CheckConditionQuantum>
<Sequence name="s_HideSalmabokLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StopGissur"/>
	<Quantum name="q_CheckWichHider2"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_SalmabokLarge" seq="s_HideSalmabokLarge"/>
<Reaction reactor="action_take" actor="a_SalmabokLarge" seq="s_HideSalmabokLarge"/>
<Reaction reactor="action_talk" actor="a_SalmabokLarge" seq="s_HideSalmabokLarge"/>

<Sequence name="s_ShowPuki">
	<Quantum name="qs_Puki"/>
	<Quantum name="q_ForkurPuki"/>
	<Quantum name="q_HaliPuki"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPuki" flag="f_Puki" wait="true">
	<Trigger value="0" seq="s_ShowPuki"/>
</CheckConditionQuantum>

<Sequence name="s_ShowPoki">
	<Quantum name="q_BirtaPoka"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPoki" flag="f_Poki" wait="true">
	<Trigger value="0" seq="s_ShowPoki"/>
</CheckConditionQuantum>

<Sequence name="s_ShowPokiFullur5">
	<Quantum name="q_MovePoki2Skuffa"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPoki45" flag="f_PokiPlacedOnSkuffa" wait="true">
	<Trigger value="1" seq="s_ShowPokiFullur5"/>
</CheckConditionQuantum>

<Sequence name="s_OpenSkuffaSvefnherbergi">
    <Quantum name="qh_SkuffaSvefnherbergiClosed1"/>
    <Quantum name="qh_SkuffaSvefnherbergiClosed2"/>
	<Quantum name="q_MoveLykill2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_PlaySkuffaLarge"/>
	<Quantum name="q_OpenSkuffaSvefnherbergi"/>
	<Quantum name="q_CheckPoki"/>
	<Quantum name="q_CheckPoki45"/>
	<Quantum name="q_CheckPuki"/>
</Sequence>

<Sequence name="s_OpenSkuffaSvefnherbergi4">
    <Quantum name="qh_SkuffaSvefnherbergiClosed1"/>
    <Quantum name="qh_SkuffaSvefnherbergiClosed2"/>
	<Quantum name="q_MoveLykill2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_PlaySkuffaLarge"/>
	<Quantum name="q_OpenSkuffaSvefnherbergi"/>
	<Quantum name="q_CheckPoki"/>
	<Quantum name="q_CheckPoki45"/>
	<Quantum name="q_CheckPuki"/>
	<Quantum name="q_SkuffanOpnadist"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_SkuffaLocked1"/>
</Sequence>

<Sequence name="s_SkuffaLaest3">
	<Quantum name="q_SkuffanErLaest"/>
	<Quantum name="q_StopGissur"/>
</Sequence>

<CheckConditionQuantum name="q_CheckLock" flag="f_SkuffaLocked" wait="true">
	<Trigger value="0" seq="s_SkuffaLaest3"/>
	<Trigger value="1" seq="s_OpenSkuffaSvefnherbergi"/>
</CheckConditionQuantum>

<Sequence name="s_CheckLock">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_CheckLock"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_SkuffaSvefnherbergiClosed2" seq="s_CheckLock"/>
<Reaction reactor="action_take" actor="a_SkuffaSvefnherbergiClosed1" seq="s_CheckLock"/>

<Sequence name="s_LockSkuffaSvefnherbergi">
	<Quantum name="q_SkuffaLocked0"/>
	<Quantum name="q_MoveLykill2Inventory"/>
	<Quantum name="q_SkuffanErNuLaest"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_UpdateInventory"/>
</Sequence>
<CheckConditionQuantum name="q_CheckLock65" flag="f_SkuffaLocked" wait="true">
	<Trigger value="0" seq="s_OpenSkuffaSvefnherbergi4"/>
    <Trigger value="1" seq="s_LockSkuffaSvefnherbergi"/>
</CheckConditionQuantum>
<Sequence name="s_OpenSkuffaSvefnherbergiCheck">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="q_CheckLock65"/>
    <Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Lykill" actor2="a_SkuffaSvefnherbergiClosed1" seq="s_OpenSkuffaSvefnherbergiCheck"/>
<Reaction reactor="action_use" actor="a_Lykill" actor2="a_SkuffaSvefnherbergiClosed2" seq="s_OpenSkuffaSvefnherbergiCheck"/>

<Sequence name="s_HidePoki">
	<Quantum name="q_MovePoki"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPoki2" flag="f_Poki" wait="true">
	<Trigger value="0" seq="s_HidePoki"/>
</CheckConditionQuantum>

<Sequence name="s_HidePokiFullur">
	<Quantum name="qh_PokiFullur"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPoki44" flag="f_PokiPlacedOnSkuffa" wait="true">
	<Trigger value="1" seq="s_HidePokiFullur"/>
</CheckConditionQuantum>

<Sequence name="s_LokaSkuffuSvefnherbergi">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="qs_SkuffaSvefnherbergiClosed1"/>
    <Quantum name="qs_SkuffaSvefnherbergiClosed2"/>
	<Quantum name="q_CloseSkuffaSvefnherbergi"/>
	<Quantum name="q_PlaySkuffaLarge"/>
	<Quantum name="qh_Puki"/>
	<Quantum name="q_StopPuki"/>
	<Quantum name="q_CheckPoki2"/>
	<Quantum name="q_CheckPoki44"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_SkuffaSvefnherbergiOpen" seq="s_LokaSkuffuSvefnherbergi"/>

<Sequence name="s_PutPokiInSkuffaFail">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_NeiEgHefThadSterklega"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MovePoki2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Poki" actor2="a_SkuffaSvefnherbergiOpen" seq="s_PutPokiInSkuffaFail"/>
<Reaction reactor="action_use" actor="a_PokiHalfFullur" actor2="a_SkuffaSvefnherbergiOpen" seq="s_PutPokiInSkuffaFail"/>

<!-- Setja poka í skuffu -->
<Sequence name="s_PutPokiInSkuffa">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_StopPokiFullur"/>
	<Quantum name="q_MovePoki2Skuffa"/>
	<Quantum name="q_PokiPlacedOnSkuffa1"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_BrytiInc"/>
    <Quantum name="q_ToKirkjaNo"/>
    <Quantum name="qs_Special3"/>
</Sequence>
<Reaction reactor="action_use" actor="a_PokiFullur" actor2="a_SkuffaSvefnherbergiOpen" seq="s_PutPokiInSkuffa"/>

<Sequence name="s_TakePokiFail56">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgLaetPokann"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_PokiFullur" seq="s_TakePokiFail56"/>

<Sequence name="s_BeginConvPuki">
	<Quantum name="q_Hlatur"/>
    <Quantum name="q_StopPuki"/>
    </Sequence>
<Reaction reactor="action_talk" actor="a_Puki" seq="s_BeginConvPuki"/>

<Sequence name="s_GiveMoney2Worker">
    <Quantum name="q_Conversating"/>
	<Quantum name="q_TaktuVidThessumPeningum"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="q_VaaaThakkaTher"/>
    <Quantum name="q_StopVinnumadur"/>
    <Quantum name="qh_PeningarAskur"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_MoneyGiven2Worker1"/>
    <Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_NoMoney">
    <Quantum name="q_Conversating"/>
    <Quantum name="q_AfHverjuAetti"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="q_MovePeningar2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Moving"/>
</Sequence>

<CheckConditionQuantum name="q_CheckMoney" flag="f_Money" wait="true">
	<Trigger value="0" seq="s_NoMoney"/>
	<Trigger value="1" seq="s_GiveMoney2Worker"/>
</CheckConditionQuantum>

<Sequence name="s_CheckMoney">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="q_CheckMoney"/>
</Sequence>
<Reaction reactor="action_use" actor="a_PeningarAskur" actor2="a_Vinnumadur" seq="s_CheckMoney"/>

<Sequence name="s_ToKopavogur44">
    <Quantum name="q_PlayKopavogur"/>
    <Quantum name="q_CheckKonungsmenn"/>
<!--    <Quantum name="q_StartOcean"/>  -->
</Sequence>

<Sequence name="s_ToHjaBryta444">
	<Quantum name="qp_HjaBryta"/>
	<Quantum name="q_ToHjaBryta"/>
	<Quantum name="q_StartLogi"/>
</Sequence>
<Sequence name="s_ToFyrirUtan444">
	<Quantum name="qp_FyrirUtan"/>
	<Quantum name="q_ToFyrirUtan"/>
</Sequence>
<Sequence name="s_ToKirkja444">
	<Quantum name="qp_Kirkja"/>
	<Quantum name="q_ToKirkja"/>
</Sequence>
<Sequence name="s_ToSkrifstofa444">
	<Quantum name="qp_Skrifstofa"/>
	<Quantum name="q_ToSkrifstofa"/>
</Sequence>
<Sequence name="s_ToSvefnherbergi444">
	<Quantum name="qp_Svefnherbergi"/>
	<Quantum name="q_ToSvefnherbergi"/>
</Sequence>
<Sequence name="s_ToKopavogur444">
	<Quantum name="qp_Kopavogur"/>
	<Quantum name="q_ToKopavogur"/>
</Sequence>
<Sequence name="s_ToAskur444">
	<Quantum name="qp_Askur"/>
	<Quantum name="q_ToAskur"/>
</Sequence>
<Sequence name="s_ToGaldrabok444">
	<Quantum name="qp_GaldrabokLarge"/>
	<Quantum name="q_ToSkrifstofa"/>
</Sequence>
<Sequence name="s_ToSalmabok444">
	<Quantum name="qp_SalmabokLarge"/>
	<Quantum name="q_ToKirkja"/>
</Sequence>
<Sequence name="s_ToByrjun444">
	<Quantum name="qp_BeginScene"/>
	<Quantum name="q_ToBeginScene"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPrepp" flag="f_CurrentScene" wait="true">
	<Trigger value="9" seq="s_ToHjaBryta444"/>
	<Trigger value="0" seq="s_ToByrjun444"/>
	<Trigger value="1" seq="s_ToFyrirUtan444"/>
	<Trigger value="2" seq="s_ToKirkja444"/>
	<Trigger value="3" seq="s_ToSkrifstofa444"/>
	<Trigger value="4" seq="s_ToSvefnherbergi444"/>
	<Trigger value="5" seq="s_ToKopavogur444"/>
	<Trigger value="6" seq="s_ToAskur444"/>
	<Trigger value="7" seq="s_ToGaldrabok444"/>
	<Trigger value="8" seq="s_ToSalmabok444"/>
</CheckConditionQuantum>
<Sequence name="s_prepare">
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_CheckPrepp"/>
</Sequence>

<Sequence name="s_LogiOn">
	<Quantum name="q_StartLogi"/>
</Sequence>
<CheckConditionQuantum name="q_CheckPrepare56b8" flag="f_CurrentScene" wait="true">
	<Trigger value="5" seq="s_ToKopavogur44"/>
	<Trigger value="9" seq="s_LogiOn"/>
</CheckConditionQuantum>

<Sequence name="s_Brydd">
	<Quantum name="q_Byrjunarlag_play"/>
</Sequence>
<Sequence name="s_UsualSong">
	<Quantum name="q_PlaySong"/>
</Sequence>
<CheckConditionQuantum name="q_CheckSong54" flag="f_CurrentScene" wait="true">
	<Trigger value="0" seq="s_Brydd"/>
	<Trigger value="1" seq="s_UsualSong"/>
	<Trigger value="2" seq="s_UsualSong"/>
	<Trigger value="3" seq="s_UsualSong"/>
	<Trigger value="4" seq="s_UsualSong"/>
	<Trigger value="5" seq="s_UsualSong"/>
	<Trigger value="6" seq="s_UsualSong"/>
	<Trigger value="7" seq="s_UsualSong"/>
	<Trigger value="8" seq="s_UsualSong"/>
	<Trigger value="9" seq="s_UsualSong"/>
</CheckConditionQuantum>

<Sequence name="s_always">
    <Quantum name="qp_Adallag"/>
    <Quantum name="qp_Byrjunarlag"/>
    <Quantum name="qf_Adallag"/>
    <Quantum name="qp_Kortlag"/>
    <Quantum name="qf_Kortlag"/>
    <Quantum name="q_CheckSong54"/>
	<Quantum name="q_CheckPrepare56b8"/>
</Sequence>

<Sequence name="s_final">
	<Quantum name="q_StopSong"/>
	<Quantum name="q_StopSFX"/>
</Sequence>

<Sequence name="s_begin">
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="qf_ByrjunarlagOut2"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_BeginScene"/>
	<Quantum name="qp_HjaBryta"/>
	<Quantum name="q_Byrjunarlag_stop"/>
	<Quantum name="q_PlaySong"/>
	<Quantum name="q_StartLogi"/>
	<Quantum name="q_ToHjaBryta"/>
	<Quantum name="q_CurrentHjaBryta"/>
	<Quantum name="q_Freeze"/>
	<Quantum name="q_KomidThidSaelir"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Hjalti"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_StartFuli"/>
    <Quantum name="q_KaeruFelagarNuEr"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_StopFuli"/>
	<Quantum name="q_ThadVerdurErfitt"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_NuHefurHerra"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_TilHamingjuMed"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_ThakkaTherFyrir"/>
	<Quantum name="q_StopOddur"/>
	<Quantum name="q_HaEg"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_JaThuEruMargir"/>
	<Quantum name="q_StopOddur"/>
    <Quantum name="q_ThuVerdurAd"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_StartFuli"/>
	<Quantum name="q_JaHeldurduThad"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_StopFuli"/>
	<Quantum name="q_OgmundurOgKatholskir"/>
	<Quantum name="q_StopBrytinn"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_BeginConvOgmundur">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="q_EgAEkkertVantalad"/>
	<Quantum name="q_StoppGissur"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Ogmundur" seq="s_BeginConvOgmundur"/>

<Reaction reactor="action_talk" actor="a_Puki" seq="s_PukiHlaer"/>
<Reaction reactor="action_take" actor="a_Puki" seq="s_PukiHlaer"/>

<Sequence name="s_PokiTakeSuccess">
	<Quantum name="q_MovePoki2Inventory"/>
	<Quantum name="q_PokiTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Poki1"/>
</Sequence>

<Sequence name="s_PokiTakeFail">
	<Quantum name="q_ForkurPuki"/>
	<Quantum name="q_ThennanPokaFaerdThu"/>
	<Quantum name="q_Hlatur2"/>
	<Quantum name="q_HoppPuki"/>
	<Quantum name="q_HaliPuki"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPoki5" flag="f_Puki" wait="true">
	<Trigger value="0" seq="s_PokiTakeFail"/>
	<Trigger value="1" seq="s_PokiTakeSuccess"/>
</CheckConditionQuantum>

<Sequence name="s_TakePoki">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_CheckPoki5"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Poki" seq="s_TakePoki"/>

<Sequence name="s_DoKrossfiskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
    <Quantum name="q_KrossfiskurDans"/>
    <Quantum name="q_KrossfiskurStop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Krossfiskur" seq="s_DoKrossfiskur"/>
<Reaction reactor="action_talk" actor="a_Krossfiskur" seq="s_DoKrossfiskur"/>


<Sequence name="s_Klippa">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Galdrabok"/>
	<Quantum name="q_MoveBladsida2Inventory"/>
	<Quantum name="q_MoveSkaeri2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_GodHugmynd"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_SkaeriAskur" actor2="a_Galdrabok" seq="s_Klippa"/>
<Reaction reactor="action_use" actor2="a_SkaeriAskur" actor="a_Galdrabok" seq="s_Klippa"/>

<Sequence name="s_Klippa23">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_EgFerNuEkki"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="q_MoveSkaeri2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_SkaeriAskur" actor2="a_Salmabok" seq="s_Klippa23"/>
<Reaction reactor="action_use" actor="a_SkaeriAskur" actor2="a_SalmabokGaldur" seq="s_Klippa23"/>

<Sequence name="s_Lima">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
	<Quantum name="q_StopGissur"/>
	<Quantum name="qh_Bladsida"/>
	<Quantum name="qh_Salmabok"/>
	<Quantum name="qs_SalmabokGaldur"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_SnidugtEgLaet"/>
    <Quantum name="q_StopGissur"/>
	<Quantum name="q_GaldurISalmabok"/>
	<Quantum name="q_Thula1"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Bladsida" actor2="a_Salmabok" seq="s_Lima"/>
<Reaction reactor="action_use" actor2="a_Bladsida" actor="a_Salmabok" seq="s_Lima"/>

<Sequence name="s_Kveða">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppGissur"/>
    <Quantum name="q_StopGissur"/>
    <Quantum name="qp_Gissur3"/>
    <Quantum name="qp_Gissur7"/>
    <Quantum name="qp_Gissur8"/>
    <Quantum name="q_GissurKPuka1"/>
	<Quantum name="q_ThuAumaJardneska"/>
	<Quantum name="q_Hlatur"/>
	<Quantum name="q_HaliPuki"/>
    <Quantum name="q_Sporddreki"/>
    <Quantum name="q_GissurKPuka3"/>
    <Quantum name="q_StopGissur"/>
	<Quantum name="q_ForkurPuki"/>
	<Quantum name="q_PukiHverfur"/>
	<Quantum name="qh_Puki"/>
	<Quantum name="q_StopPuki"/>
	<Quantum name="qs_SalmabokGaldur"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_EgErFeginnAdVeraLaus"/>
    <Quantum name="q_StopGissur"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_Puki1"/>
    <Quantum name="qu_Gissur3"/>
    <Quantum name="qu_Gissur7"/>
    <Quantum name="qu_Gissur8"/>
</Sequence>
<Reaction reactor="action_use" actor="a_SalmabokGaldur" actor2="a_Puki" seq="s_Kveða"/>

<SetPlayer object="sc" player="a_Gissur"/>
<SetPlayer object="s_FyrirUtan" player="a_Gissur"/>
<SetPlayer object="s_Kirkja" player="a_Gissur"/>

<BeginningScene scene="s_HjaBryta"/>

</Body>
