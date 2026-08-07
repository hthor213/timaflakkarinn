<?xml version="1.0" encoding="iso-8859-1"?>

<!DOCTYPE	Body			SYSTEM "scene.dtd">

<Body>

<!-- Flags -->
<!-- Flags for scene 1 -->

<!-- Beginning of conversation with Karli -->
<!-- 0 = first time -->
<!-- 1 = second time and thereafter -->
<ConditionFlag name="f_BeginConvKarli"/>

<!-- Hjorleifur found or not -->
<!-- 0 = not found -->
<!-- 1 = found -->
<ConditionFlag name="f_HjorleifurFound"/>
<SetFlagQuantum name="q_HjorleifurFound1" flag="f_HjorleifurFound" value="1"/>

<!-- Been to Hjorleifshofdi or not -->
<!-- 0 = not been there -->
<!-- 1 = been there, done that -->
<ConditionFlag name="f_HjorleifshofdiSeen"/>
<SetFlagQuantum name="q_HjorleifshofdiSeen1" flag="f_HjorleifshofdiSeen" value="1"/>

<ConditionFlag name="f_ShipDone"/>
<SetFlagQuantum name="q_ShipDone1" flag="f_ShipDone" value="1"/>


<!-- Current scene on -->
<!-- 0 = BeginScene -->
<!-- 1 = Ingolfshofdi -->
<!-- 2 = Hjorleifshofdi -->
<!-- 3 = SudurThjorsa -->
<!-- 4 = NordurThjorsa -->
<!-- 5 = Reykjavik -->
<!-- 6 = Skipingolfs -->
<ConditionFlag name="f_CurrentScene"/>
<SetFlagQuantum name="q_CurrentIngolfshofdi" flag="f_CurrentScene" value="1"/>
<SetFlagQuantum name="q_CurrentHjorleifshofdi" flag="f_CurrentScene" value="2"/>
<SetFlagQuantum name="q_CurrentSudurThjorsa" flag="f_CurrentScene" value="3"/>
<SetFlagQuantum name="q_CurrentNordurThjorsa" flag="f_CurrentScene" value="4"/>
<SetFlagQuantum name="q_CurrentReykjavik" flag="f_CurrentScene" value="5"/>
<SetFlagQuantum name="q_CurrentSkipingolfs" flag="f_CurrentScene" value="6"/>

<!-- End of conversation with Karli -->
<!-- 0 = first time (on ship) -->
<!-- 1 = secod time and thereafter -->
<ConditionFlag name="f_EndConvKarli"/>

<!-- Rope taken or not -->
<!-- 0 = not taken -->
<!-- 1 = taken -->
<ConditionFlag name="f_RopeTaken"/>
<SetFlagQuantum name="q_RopeTaken1" flag="f_RopeTaken" value="1"/>

<!-- Tree fallen or not -->
<!-- 0 = not fallen -->
<!-- 1 = fallen -->
<ConditionFlag name="f_TreeFallen"/>
<SetFlagQuantum name="q_TreeFallen1" flag="f_TreeFallen" value="1"/>

<!-- Reykjavik seen or not -->
<!-- 0 = not seen -->
<!-- 1 = seen -->
<ConditionFlag name="f_ReykjavikSeen"/>
<SetFlagQuantum name="q_ReykjavikSeen1" flag="f_ReykjavikSeen" value="1"/>

<!-- Sulur taken -->
<!-- 0 = none -->
<!-- 1 = one -->
<!-- 2 = two -->
<!-- 3 = three -->
<ConditionFlag name="f_SuluCount"/>
<IncrementFlagQuantum name="q_SulaTaken" flag="f_SuluCount"/>

<ConditionFlag name="f_Zero"/>

<ConditionFlag name="f_Random6"/>
<RandomSetFlagQuantum name="q_Randomize6" flag="f_Random6" low="0" high="5"/>

<ConditionFlag name="f_Random9"/>
<RandomSetFlagQuantum name="q_Randomize9" flag="f_Random9" low="0" high="8"/>

<ConditionFlag name="f_Random13"/>
<RandomSetFlagQuantum name="q_Randomize13" flag="f_Random13" low="0" high="12"/>

<ConditionFlag name="f_Karli8"/>
<SetFlagQuantum name="q_KarliUpper" flag="f_Karli8" value="1"/>
<SetFlagQuantum name="q_KarliLower" flag="f_Karli8" value="0"/>

<ConditionFlag name="f_PosGolli"/>
<SetFlagQuantum name="q_GolliMoved1" flag="f_PosGolli" value="1"/>

<Polygon name="p_All">
	<Point x="0" y="0"/>
	<Point x="800" y="0"/>
	<Point x="800" y="600"/>
	<Point x="0" y="600"/>
</Polygon>

<!-- Terrains and scenes -->
<!-- Inventory -->
<Scene name="s_Inventory"/>

<SimplePseudo3DTerrain name="t_InventoryBack" scene="s_Inventory" polygon="p_All" zmin="-7" zmax="0"/>
<Inventory name="t_Inventory" scene="s_Inventory" polygon="p_All" zmin="1" zmax="1500"/>

<StaticActorFace name="af_BigInventory" file="\Landnam\Graphic\InventoA\inventoA" prepare="true"/>
<StaticActor name="a_BigInventory" terrain="t_InventoryBack" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_BigInventory"/>
</StaticActor>
<StaticActorFace name="af_iBlom" file="\Landnam\Graphic\hjorleiA\iblom" prepare="true"/>
<StaticActorFace name="af_iStilkur" file="\Landnam\Graphic\hjorleiA\istilkur" prepare="true"/>
<StaticActorFace name="af_iDeigurHnifur" file="\Landnam\Graphic\hjorleiA\ideigurA" prepare="true"/>
<StaticActorFace name="af_iAxeAndRope" file="\Landnam\Graphic\IngolfsA\iAxeAndA" prepare="true"/>
<StaticActorFace name="af_Axe_Taken" file="\Landnam\Graphic\IngolfsA\iExi" prepare="true"/>
<StaticActorFace name="af_iKudungur" file="\Landnam\Graphic\IngolfsA\ikudungA" prepare="true"/>
<StaticActorFace name="af_Rope_Taken" file="\Landnam\Graphic\SkipingA\iRope" prepare="true"/>
<StaticActorFace name="af_iGreinKud" file="\Landnam\Graphic\sudurthA\ikudgreA" prepare="true"/>
<StaticActorFace name="af_iGrein" file="\Landnam\Graphic\sudurthA\igrein" prepare="true"/>

<!-- Black screen -->
<Scene name="s_Black"/>

<SimplePseudo3DTerrain name="t_Black" scene="s_Black" polygon="p_All" zmin="-7" zmax="0"/>

<Text name="a_StuttuSeinna" text="Stuttu síðar" color="white"/>
<MoveActorQuantum name="qs_StuttuSeinna" actor="a_StuttuSeinna" terrain="t_Black"> <Location x="330" y="8280" z="8000"/> </MoveActorQuantum>
<MoveActorQuantum name="qh_StuttuSeinna" actor="a_StuttuSeinna" />


<PauseQuantum name="q_4sec" time="2500"/>

<Scene name="s_Skipingolfs"/>

<Polygon name="p_Skipingolfs">
	<Point x="65" y="850"/>		<Point x="93" y="530"/>
	<Point x="213" y="451"/>	<Point x="250" y="489"/>
	<Point x="330" y="460"/>	<Point x="334" y="415"/>
	<Point x="490" y="418"/>	<Point x="532" y="533"/>
	<Point x="608" y="599"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Skipingolfs" scene="s_Skipingolfs" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Skipingolfsl" scene="s_Skipingolfs" polygon="p_Skipingolfs"
	zmin="-1" zmax="800" defaultscaling="1.0" scanline1="600" scaling2="0.95" scanline2="400"/>

<!-- Background music -->
<JMFActorMouth name="m_Skipslag" file="\Landnam\Media\1_skip.wav" repeat="true" prepare="true"/>
<FadeQuantum name="qf_Skipslag" mouth="m_Skipslag" goal="0.6" speed="0"/>
<FadeQuantum name="qf_SkipslagOut" mouth="m_Skipslag" goal="0" speed="100"/>
<FadeQuantum name="qf_SkipslagIn" mouth="m_Skipslag" goal="0.6" speed="100"/>

<PrepareQuantum name="qp_Skipslag" object="m_Skipslag" prepare="true"/>
<StaticActor name="a_Skipslag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Skipslag"/> </StaticActor>
<StateQuantum name="q_Skipslag_stop" actor="a_Skipslag" state="stop" wait="false"/>
<StateQuantum name="q_Skipslag_play" actor="a_Skipslag" state="play" wait="false"/>

<JMFActorMouth name="m_Adallag" file="\Landnam\Media\1_000.wav" repeat="true" prepare="true"/>
<FadeQuantum name="qf_Adallag" mouth="m_Adallag" goal="0.35" speed="0"/>
<FadeQuantum name="qf_SilenceAdallag" mouth="m_Adallag" goal="0" speed="0"/>
<FadeQuantum name="qf_AdallagOut" mouth="m_Adallag" goal="0" speed="100"/>
<FadeQuantum name="qf_AdallagIn" mouth="m_Adallag" goal="0.35" speed="100"/>
<PrepareQuantum name="qp_Adallag" object="m_Adallag" prepare="true"/>
<StaticActor name="a_Adallag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Adallag"/> </StaticActor>
<StateQuantum name="q_Adallag_stop" actor="a_Adallag" state="stop" wait="false"/>
<StateQuantum name="q_Adallag_play" actor="a_Adallag" state="play" wait="false"/>

<!-- Background for Ingolfs's ship -->
<StaticActorFace name="af_Skipingolfs" file="\Landnam\Graphic\SkipingA\skipingA" />
<StaticActor name="a_Skipingolfs" terrain="t_Skipingolfs" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_Skipingolfs"/>
</StaticActor>
<PrepareQuantum name="qp_Skipingolfs0" object="af_Skipingolfs" prepare="true"/>
<PrepareQuantum name="qu_Skipingolfs0" object="af_Skipingolfs" prepare="false"/>

<StaticActorFace name="af_Segl1" file="\Landnam\Graphic\SkipingA\Segl1" />
<StaticActor name="a_Segl1" terrain="t_Skipingolfs" x="0" y="600" z="600" state="stop">
	<State name="stop" face="af_Segl1"/>
</StaticActor>
<PrepareQuantum name="qp_Skipingolfs1" object="af_Segl1" prepare="true"/>
<PrepareQuantum name="qu_Skipingolfs1" object="af_Segl1" prepare="false"/>

<StaticActorFace name="af_Segl2" file="\Landnam\Graphic\SkipingA\Segl2"/>
<StaticActor name="a_Segl2" terrain="t_Skipingolfs" x="0" y="600" z="344" state="stop" random="true">
	<State name="stop" face="af_Segl2"/>
</StaticActor>
<PrepareQuantum name="qp_Skipingolfs2" object="af_Segl2" prepare="true"/>
<PrepareQuantum name="qu_Skipingolfs2" object="af_Segl2" prepare="false"/>


<!-- Tunnur -->
<TransparentActorFace name="af_Tunnur" width="140" height="111"/>
<StaticActor name="a_Tunnur" terrain="t_Skipingolfsl" x="360" y="302" z="0" state="stop" random="true">
	<State name="stop" face="af_Tunnur"/> </StaticActor>


<!-- Kista -->
<TransparentActorFace name="af_Kista" width="122" height="79"/>
<StaticActor name="a_Kista" terrain="t_Skipingolfsl" x="210" y="363" z="0" state="stop" random="true">
	<State name="stop" face="af_Kista"/> </StaticActor>

<!-- Rope -->
<Pseudo3DCollisionBox name="cb_Rope" x="100" y="10" z="80"/>
<StaticActorFace name="af_Rope1" file="\Landnam\Graphic\SkipingA\rope" />
<StaticActorFace name="af_Rope2" file="\Landnam\Graphic\IngolfsA\rope" />
<StaticActorFace name="af_uRope" file="\Landnam\Graphic\SkipingA\uRope" prepare="true"/>
<StaticActor name="a_Rope" terrain="t_Skipingolfsl" x="393" y="448" z="10" state="stop1" save="true" random="true">
	<State name="stop1" face="af_Rope1" collisionbox="cb_Rope"/>
	<State name="stop2" face="af_Rope2"/>
	<State name="taken" face="af_Rope_Taken"/>
	<State name="use" face="af_uRope"/>
</StaticActor>
<StateQuantum name="q_Rope_stop2" actor="a_Rope" state="stop2"/>
<StateQuantum name="q_Rope_Taken" actor="a_Rope" state="taken"/>
<PrepareQuantum name="qp_Skipingolfs3" object="af_Rope1" prepare="true"/>
<PrepareQuantum name="qu_Skipingolfs3" object="af_Rope1" prepare="false"/>
<PrepareQuantum name="qp_Ingolfshofdi7" object="af_Rope2" prepare="true"/>
<PrepareQuantum name="qu_Ingolfshofdi7" object="af_Rope2" prepare="false"/>

<StaticActorFace name="af_Sula" file="\Landnam\Graphic\sula_skA"/>
<StaticActor name="a_Sula" terrain="t_Skipingolfs" x="480" y="120" z="10" state="stop" save="true" random="true">
	<State name="stop" face="af_Sula"/>
</StaticActor>
<MoveActorQuantum name="q_HideSula" actor="a_Sula"/>
<PrepareQuantum name="qp_Skipingolfs4" object="af_Sula" prepare="true"/>
<PrepareQuantum name="qu_Skipingolfs4" object="af_Sula" prepare="false"/>

<SimplePseudo3DTerrain name="t_Corners" scene="s_Skipingolfs" polygon="p_All"
	zmin="900" zmax="2000" defaultscaling="1.0" scrolling="false"/>

<!-- State image in the corner -->
<StaticActorFace name="af_Moving" file="\Common\Graphic\moving" prepare="true"/>
<StaticActorFace name="af_Looking" file="\Common\Graphic\looking" prepare="true"/>
<StaticActorFace name="af_Taking" file="\Common\Graphic\taking" prepare="true"/>
<StaticActorFace name="af_Talking" file="\Common\Graphic\talking" prepare="true"/>
<StaticActorFace name="af_Freeze" file="\Common\Graphic\freeze" prepare="true"/>

<StaticActor name="a_States" terrain="t_Corners" x="0" y="1000" z="1000" state="freeze">
	<State name="moving" face="af_Moving"/>
	<State name="looking" face="af_Looking"/>
	<State name="taking" face="af_Taking"/>
	<State name="talking" face="af_Talking"/>
	<State name="freeze" face="af_Freeze"/>
</StaticActor>

<!-- Small inventory in the corner -->
<StaticActorFace name="af_SmallInventory" file="\Common\Graphic\inventoA" prepare="true"/>
<StaticActor name="a_SmallInventory" terrain="t_Corners" x="701" y="1500" z="1500" state="stop">
	<State name="stop" face="af_SmallInventory"/>
</StaticActor>


<Text name="a_Text" text=" " terrain="t_Corners" color="white" hilite="false"/>
<StateController name="sc"
	stateactor="a_States"
	inventoryactor="a_SmallInventory"
	textactor="a_Text"
	inventory="s_Inventory"/>
<!-- Let's register those who were made before the statecontroller -->
<ActorMoused actor="a_SmallInventory" listener="sc"/>
<ActorMoused actor="a_Rope" listener="sc" moving="Reipi" thf="reipi"/>
<ActorMoused actor="a_Tunnur" listener="sc" moving="Tunnur" thf="tunnur"/>
<ActorMoused actor="a_Kista" listener="sc" moving="Kista" thf="kistu"/>
<ActorMoused actor="a_Segl2" listener="sc" moving="Segl" thf="segl"/>
<ActorMoused actor="a_Sula" listener="sc" moving="Öndvegissúla Ingólfs" thf="öndvegissúlu"/>


<SwitchStateQuantum name="q_moving" state="Moving" controller="sc"/>
<SwitchStateQuantum name="q_taking" state="Taking" controller="sc"/>
<SwitchStateQuantum name="q_looking" state="Looking" controller="sc"/>
<SwitchStateQuantum name="q_talking" state="Talking" controller="sc"/>
<SwitchStateQuantum name="q_freeze" state="Freeze" controller="sc"/>
<SwitchStateQuantum name="q_using" state="Using" controller="sc"/>
<SwitchStateQuantum name="q_conversating" state="Conversating" controller="sc"/>

<Scene name="s_Map"/>

<SimplePseudo3DTerrain name="t_Map" scene="s_Map" polygon="p_All"
	zmin="0" zmax="20" defaultscaling="1.0"/>

<!-- Background music -->
<JMFActorMouth name="m_Kortalag" file="\Landnam\Media\1_kort.wav" prepare="true" repeat="true"/>
<FadeQuantum name="qf_KortalagOut" mouth="m_Kortalag" goal="0" speed="100"/>
<FadeQuantum name="qf_Kortalag" mouth="m_Kortalag" goal="0" speed="0"/>
<FadeQuantum name="qf_KortalagOut2" mouth="m_Kortalag" goal="0" speed="150"/>
<FadeQuantum name="qf_KortalagIn" mouth="m_Kortalag" goal="0.9" speed="100"/>
<PrepareQuantum name="qp_Kortalag" object="m_Kortalag" prepare="true"/>
<StaticActor name="a_Kortalag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Kortalag"/> </StaticActor>
<StateQuantum name="q_Kortalag_stop" actor="a_Kortalag" state="stop" wait="false"/>
<StateQuantum name="q_Kortalag_play" actor="a_Kortalag" state="play" wait="false"/>

<!-- Background for map -->
<StaticActorFace name="af_Map" file="\Common\Graphic\Map\map"/>
<StaticActor name="a_Map" terrain="t_Map" x="0" y="1010" z="1010" state="stop">
	<State name="stop" face="af_Map"/> </StaticActor>
<PrepareQuantum name="qp_Map1" object="af_Map" prepare="true"/>
<PrepareQuantum name="qu_Map1" object="af_Map" prepare="false"/>

<!-- MapPlaces -->
<StaticActorFace name="af_MapIngolfshofdi" file="\Common\Graphic\Map\IngolfsA"/>
<StaticActor name="a_MapIngolfshofdi" x="527" y="1453" z="1000" state="display" save="true">
	<State name="display" face="af_MapIngolfshofdi"/> </StaticActor>
<PrepareQuantum name="qp_Map2" object="af_MapIngolfshofdi" prepare="true"/>
<PrepareQuantum name="qu_Map2" object="af_MapIngolfshofdi" prepare="false"/>
<MoveActorQuantum name="qs_MapIngolfshofdi" actor="a_MapIngolfshofdi" terrain="t_Map"/>
<MoveActorQuantum name="qh_MapIngolfshofdi" actor="a_MapIngolfshofdi"/>

<StaticActorFace name="af_MapHjorleifshofdi" file="\Common\Graphic\Map\HjorleiA"/>
<StaticActor name="a_MapHjorleifshofdi" x="360" y="1535" z="1000" state="display" save="true">
	<State name="display" face="af_MapHjorleifshofdi"/> </StaticActor>
<MoveActorQuantum name="qs_MapHjorleifshofdi" actor="a_MapHjorleifshofdi" terrain="t_Map"/>
<MoveActorQuantum name="qh_MapHjorleifshofdi" actor="a_MapHjorleifshofdi"/>
<PrepareQuantum name="qp_Map3" object="af_MapHjorleifshofdi" prepare="true"/>
<PrepareQuantum name="qu_Map3" object="af_MapHjorleifshofdi" prepare="false"/>

<StaticActorFace name="af_MapThjorsa" file="\Common\Graphic\Map\Thjorsa"/>
<StaticActor name="a_MapThjorsa" x="356" y="1368" z="1000" state="display" save="true">
	<State name="display" face="af_MapThjorsa"/> </StaticActor>
<MoveActorQuantum name="qs_MapThjorsa" actor="a_MapThjorsa" terrain="t_Map"/>
<MoveActorQuantum name="qh_MapThjorsa" actor="a_MapThjorsa"/>
<PrepareQuantum name="qp_Map4" object="af_MapThjorsa" prepare="true"/>
<PrepareQuantum name="qu_Map4" object="af_MapThjorsa" prepare="false"/>

<StaticActorFace name="af_MapReykjavik" file="\Common\Graphic\Map\ReykjavA"/>
<StaticActor name="a_MapReykjavik" x="166" y="1376" z="1000" state="display" save="true">
	<State name="display" face="af_MapReykjavik"/> </StaticActor>
<MoveActorQuantum name="qs_MapReykjavik" actor="a_MapReykjavik" terrain="t_Map"/>
<MoveActorQuantum name="qh_MapReykjavik" actor="a_MapReykjavik"/>
<PrepareQuantum name="qp_Map5" object="af_MapReykjavik" prepare="true"/>
<PrepareQuantum name="qu_Map5" object="af_MapReykjavik" prepare="false"/>

<StaticActorFace name="af_MapVestmannaeyjar" file="\Common\Graphic\Map\VestmanA"/>
<StaticActor name="a_MapVestmannaeyjar" x="250" y="1550" z="1000" state="display" save="true">
	<State name="display" face="af_MapVestmannaeyjar"/> </StaticActor>
<MoveActorQuantum name="qs_MapVestmannaeyjar" actor="a_MapVestmannaeyjar" terrain="t_Map"/>
<MoveActorQuantum name="qh_MapVestmannaeyjar" actor="a_MapVestmannaeyjar"/>
<PrepareQuantum name="qp_Map11" object="af_MapVestmannaeyjar" prepare="true"/>
<PrepareQuantum name="qu_Map11" object="af_MapVestmannaeyjar" prepare="false"/>

<!-- MapAnim -->
<CelledAnimated2DActorFace name="af_ToIngolfshofdi" repeat="1" file="\Common\Graphic\Map\ToIngolA" count="4" speed="900"/>
<CelledAnimated2DActorFace name="af_IngolfshofdiToHjorleifshofdi" repeat="1" file="\Common\Graphic\Map\IngolfsB" count="6" speed="900"/>
<CelledAnimated2DActorFace name="af_HjorleifshofdiToIngolfshofdi" repeat="1" file="\Common\Graphic\Map\HjorleiB" count="6" speed="900"/>
<CelledAnimated2DActorFace name="af_HjorleifshofdiToThjorsa" repeat="1" file="\Common\Graphic\Map\HjorleiC" count="9" speed="900"/>
<CelledAnimated2DActorFace name="af_ThjorsaToReykjavik" repeat="1" file="\Common\Graphic\Map\ThjorsaA" count="27" speed="700"/>
<StaticActor name="a_MapAnim" state="stop" terrain="t_Map" x="565" y="1476" z="1000">
	<State name="ToIngolfshofdi" face="af_ToIngolfshofdi"/>
	<State name="IngolfshofdiToHjorleifshofdi" face="af_IngolfshofdiToHjorleifshofdi"/>
	<State name="HjorleifshofdiToIngolfshofdi" face="af_HjorleifshofdiToIngolfshofdi"/>
	<State name="HjorleifshofdiToThjorsa" face="af_HjorleifshofdiToThjorsa"/>
	<State name="ThjorsaToReykjavik" face="af_ThjorsaToReykjavik"/>
</StaticActor>
<MoveActorQuantum name="qh_MapAnim" actor="a_MapAnim"/>

<!-- Quanta for MapAnim -->
<StateQuantum name="q_MapAnim_stop" actor="a_MapAnim" state="stop" wait="false"/>

<StateQuantum name="q_MapAnim_ToIngolfshofdi" actor="a_MapAnim" state="ToIngolfshofdi" wait="true"/>
<PrepareQuantum name="qp_Map10" object="af_ToIngolfshofdi" prepare="true"/>
<PrepareQuantum name="qu_Map10" object="af_ToIngolfshofdi" prepare="false"/>
<MoveActorQuantum name="q_MoveMapAnim4ToIngolfshofdi" actor="a_MapAnim" terrain="t_Map">
	<Location x="565" y="1476" z="1000"/> </MoveActorQuantum>

<StateQuantum name="q_MapAnim_IngolfshofdiToHjorleifshofdi" actor="a_MapAnim" state="IngolfshofdiToHjorleifshofdi" wait="true"/>
<PrepareQuantum name="qp_Map6" object="af_IngolfshofdiToHjorleifshofdi" prepare="true"/>
<PrepareQuantum name="qu_Map6" object="af_IngolfshofdiToHjorleifshofdi" prepare="false"/>
<MoveActorQuantum name="q_MoveMapAnim4IngolfshofdiToHjorleifshofdi" actor="a_MapAnim" terrain="t_Map">
	<Location x="398" y="1462" z="1000"/> </MoveActorQuantum>

<StateQuantum name="q_MapAnim_HjorleifshofdiToIngolfshofdi" actor="a_MapAnim" state="HjorleifshofdiToIngolfshofdi" wait="true"/>
<PrepareQuantum name="qp_Map7" object="af_HjorleifshofdiToIngolfshofdi" prepare="true"/>
<PrepareQuantum name="qu_Map7" object="af_HjorleifshofdiToIngolfshofdi" prepare="false"/>
<MoveActorQuantum name="q_MoveMapAnim4HjorleifshofdiToIngolfshofdi" actor="a_MapAnim" terrain="t_Map">
	<Location x="398" y="1462" z="1000"/> </MoveActorQuantum>

<StateQuantum name="q_MapAnim_HjorleifshofdiToThjorsa" actor="a_MapAnim" state="HjorleifshofdiToThjorsa" wait="true"/>
<PrepareQuantum name="qp_Map8" object="af_HjorleifshofdiToThjorsa" prepare="true"/>
<PrepareQuantum name="qu_Map8" object="af_HjorleifshofdiToThjorsa" prepare="false"/>
<MoveActorQuantum name="q_MoveMapAnim4HjorleifshofdiToThjorsa" actor="a_MapAnim" terrain="t_Map">
	<Location x="282" y="1400" z="1000"/> </MoveActorQuantum>

<StateQuantum name="q_MapAnim_ThjorsaToReykjavik" actor="a_MapAnim" state="ThjorsaToReykjavik" wait="true"/>
<PrepareQuantum name="qp_Map9" object="af_ThjorsaToReykjavik" prepare="true"/>
<PrepareQuantum name="qu_Map9" object="af_ThjorsaToReykjavik" prepare="false"/>
<MoveActorQuantum name="q_MoveMapAnim4ThjorsaToReykjavik" actor="a_MapAnim" terrain="t_Map">
	<Location x="102" y="1318" z="1000"/> </MoveActorQuantum>

<Scene name="s_Ingolfshofdi"/>

<Polygon name="p_Ingolfshofdi">
	<Point x="-250" y="599"/>
	<Point x="-250" y="483"/>
	<Point x="0" y="483"/>
	<Point x="177" y="424"/>
	<Point x="260" y="424"/>
	<Point x="260" y="470"/>
	<Point x="680" y="476"/>
	<Point x="688" y="541"/>
	<Point x="799" y="550"/>
	<Point x="799" y="599"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Ingolfshofdi" scene="s_Ingolfshofdi" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="0.65"/>
<SimplePseudo3DTerrain name="t_Ingolfshofdil" scene="s_Ingolfshofdi" polygon="p_Ingolfshofdi"
	zmin="-1" zmax="1500" defaultscaling="0.65" scaling2="0.55" scanline1="580" scanline2="420"/>

<!-- Background for Ingolfshofdi -->
<StaticActorFace name="af_Ingolfshofdi" file="\Landnam\Graphic\ingolfsA\ingolfsA"/>
<StaticActor name="a_Ingolfshofdi" terrain="t_Ingolfshofdi" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_Ingolfshofdi"/>
</StaticActor>
<PrepareQuantum name="qp_Ingolfshofdi1" object="af_Ingolfshofdi" prepare="true"/>
<PrepareQuantum name="qu_Ingolfshofdi1" object="af_Ingolfshofdi" prepare="false"/>

<!-- Kofi -->
<TransparentActorFace name="af_Kofi" width="157" height="206"/>
<StaticActor name="a_Kofi" terrain="t_Ingolfshofdil" x="0" y="221" z="0" state="stop" random="true">
	<State name="stop" face="af_Kofi"/> </StaticActor>
<ActorMoused actor="a_Kofi" listener="sc" moving="Hús" thf="hús"/>

<!-- Batur -->
<TransparentActorFace name="af_Batur" width="94" height="64"/>
<StaticActor name="a_Batur" terrain="t_Ingolfshofdil" x="706" y="450" z="0" state="stop" random="true">
	<State name="stop" face="af_Batur"/> </StaticActor>
<ActorMoused actor="a_Batur" listener="sc" moving="Bátur" thf="bát"/>

<!-- Sea -->
<CelledAnimated2DActorFace name="af_Sea" file="\Landnam\AnimatiA\sea\sea" repeat="-1" count="4" speed="300"/>
<StaticActor name="a_Sea" terrain="t_Ingolfshofdi" x="295" y="-2" z="-161" state="none" >
	<State name="sea" face="af_Sea"/>
</StaticActor>
<StateQuantum name="q_Sea_sea" actor="a_Sea" state="sea"/>
<StateQuantum name="q_Sea_none" actor="a_Sea" state="none"/>
<PrepareQuantum name="qp_Ingolfshofdi2" object="af_Sea" prepare="true"/>
<PrepareQuantum name="qu_Ingolfshofdi2" object="af_Sea" prepare="false"/>

<!-- Axe -->
<StaticActorFace name="af_Axe" file="\Landnam\Graphic\IngolfsA\exiidruA"/>
<StaticActorFace name="af_uAxe" file="\Landnam\Graphic\IngolfsA\uExi" prepare="true"/>
<Pseudo3DCollisionBox name="cb_Axe" x="100" y="10" z="80"/>
<StaticActor name="a_Axe" x="305" y="364" z="70" state="stop" save="true" random="true">
	<State name="stop" face="af_Axe"/>
	<State name="taken" face="af_Axe_Taken"/>
	<State name="use" face="af_uAxe"/> </StaticActor>
<StateQuantum name="q_Axe_Taken" actor="a_Axe" state="taken"/>
<ActorMoused actor="a_Axe" listener="sc" moving="Exi" thf="exi"/>
<PrepareQuantum name="qp_Ingolfshofdi3" object="af_Axe" prepare="true"/>
<PrepareQuantum name="qu_Ingolfshofdi3" object="af_Axe" prepare="false"/>

<!-- AxeAndRope -->
<StaticActorFace name="af_uAxeAndRope" file="\Landnam\Graphic\IngolfsA\uAxeAndA" prepare="true"/>
<Pseudo3DCollisionBox name="cb_AxeAndRope" x="100" y="10" z="80"/>
<StaticActor name="a_AxeAndRope" x="300" y="460" z="10" state="taken" save="true" random="true">
	<State name="taken" face="af_iAxeAndRope"/>
	<State name="use" face="af_uAxeAndRope"/> </StaticActor>
<ActorMoused actor="a_AxeAndRope" listener="sc" moving="Exi bundin við reipi" thf="exi bundna við reipi"/>

<Pseudo3DCollisionBox name="cb_Ingolfshofdi2Hjorleifshofdi" x="40" y="112" z="10"/>
<StaticActor name="a_Ingolfshofdi2Hjorleifshofdi" terrain="t_Ingolfshofdil" x="25" y="541" z="10" state="stop"
		collision="ac_Ingolfshofdi2Hjorleifshofdi">
	<State name="stop" collisionbox="cb_Ingolfshofdi2Hjorleifshofdi"/> </StaticActor>
<TransparentActorFace name="af_Ingolfshofdi2Hjorleifshofdi" width="84" height="121"/>
<StaticActor name="ta_Ingolfshofdi2Hjorleifshofdi" terrain="t_Ingolfshofdil" x="0" y="479" z="0" state="stop">
	<State name="stop" face="af_Ingolfshofdi2Hjorleifshofdi"/> </StaticActor>
<ActorMoused actor="ta_Ingolfshofdi2Hjorleifshofdi" listener="sc" moving="Til Hjörleifshöfða" looking=" " taking=" " talking=" "/>

<!-- Hallveig -->
<CelledAnimated2DActorFace name="af_HallveigPrjona" repeat="-1" file="\Landnam\AnimatiA\hallveig\prjon" count="2" speed="150" />
<StaticActor name="a_Hallveig" terrain="t_Ingolfshofdi" x="171" y="172" z="-90" state="none" save="true" random="true">
	<State name="prjona" face="af_HallveigPrjona"/>
</StaticActor>
<ActorMoused actor="a_Hallveig" listener="sc" moving="Hallveig, kona Ingólfs Arnarsonar" thf="Hallveigu"/>
<MoveActorQuantum name="q_HideHallveig" actor="a_Hallveig"/>
<MoveActorQuantum name="q_ShowHallveig" actor="a_Hallveig" terrain="t_Ingolfshofdi"/>
<StateQuantum name="q_Hallveig_prjona" actor="a_Hallveig" state="prjona"/>
<StateQuantum name="q_Hallveig_none" actor="a_Hallveig" state="none"/>
<PrepareQuantum name="qp_Ingolfshofdi4" object="af_HallveigPrjona" prepare="true"/>
<PrepareQuantum name="qu_Ingolfshofdi4" object="af_HallveigPrjona" prepare="false"/>

<StaticActorFace name="af_Kudungur" file="\Landnam\Graphic\IngolfsA\kudungur"/>
<StaticActorFace name="af_uKudungur" file="\Landnam\Graphic\IngolfsA\ukudungA" prepare="true"/>
<StaticActor name="a_Kudungur" terrain="t_Ingolfshofdi" x="758" y="542" z="10" state="stop" save="true" random="true">
	<State name="stop" face="af_Kudungur"/>
	<State name="taken" face="af_iKudungur"/>
	<State name="use" face="af_uKudungur"/>
</StaticActor>
<ActorMoused actor="a_Kudungur" listener="sc" moving="Kuðungur" thf="kuðung"/>
<StateQuantum name="q_Kudungur_Taken" actor="a_Kudungur" state="taken"/>
<MoveActorQuantum name="qh_Kudungur" actor="a_Kudungur"/>
<PrepareQuantum name="qp_Ingolfshofdi5" object="af_Kudungur" prepare="true"/>
<PrepareQuantum name="qu_Ingolfshofdi5" object="af_Kudungur" prepare="false"/>

<StaticActorFace name="af_GollaDrumbur" file="\Landnam\Graphic\IngolfsA\golladrA" />
<StaticActor name="a_GollaDrumbur" x="247" y="305" z="10" state="stop" save="true" random="true">
	<State name="stop" face="af_GollaDrumbur"/>
</StaticActor>
<ActorMoused actor="a_GollaDrumbur" listener="sc" moving="Drumbur" thf="drumb"/>
<MoveActorQuantum name="q_ShowGollaDrumbur" actor="a_GollaDrumbur" terrain="t_Ingolfshofdi"/>
<PrepareQuantum name="qp_Ingolfshofdi6" object="af_GollaDrumbur" prepare="true"/>
<PrepareQuantum name="qu_Ingolfshofdi6" object="af_GollaDrumbur" prepare="false"/>


<Scene name="s_Hjorleifshofdi"/>

<Polygon name="p_Hjorleifshofdi">
	<Point x="-400" y="599"/>
	<Point x="-400" y="373"/>
	<Point x="0" y="373"/>
	<Point x="175" y="314"/>
	<Point x="600" y="280"/>
	<Point x="1300" y="280"/>
	<Point x="1300" y="368"/>
	<Point x="799" y="368"/>
	<Point x="618" y="500"/>
	<Point x="545" y="512"/>
	<Point x="545" y="599"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Hjorleifshofdi" scene="s_Hjorleifshofdi" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="0.65"/>
<SimplePseudo3DTerrain name="t_Hjorleifshofdil" scene="s_Hjorleifshofdi" polygon="p_Hjorleifshofdi"
	zmin="-1" zmax="1500" defaultscaling="0.7" scanline1="600" scaling2="0.58" scanline2="200"/>

<!-- Background for Hjorleifshofdi -->
<StaticActorFace name="af_Hjorleifshofdi" file="\Landnam\Graphic\hjorleiA\hjorleiA"/>
<StaticActor name="a_Hjorleifshofdi" terrain="t_Hjorleifshofdi" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_Hjorleifshofdi"/>
</StaticActor>
<PrepareQuantum name="qp_Hjorleifshofdi0" object="af_Hjorleifshofdi" prepare="true"/>
<PrepareQuantum name="qu_Hjorleifshofdi0" object="af_Hjorleifshofdi" prepare="false"/>

<!-- Bush -->
<StaticActorFace name="af_Bush" file="\Landnam\Graphic\hjorleiA\runni"/>
<StaticActor name="a_Bush" terrain="t_Hjorleifshofdil" x="531" y="645" z="200" state="stop" save="true">
	<State name="stop" face="af_Bush"/>
</StaticActor>
<ActorMoused actor="a_Bush" listener="sc" moving="Runni" thf="runna" taking="Færa runna"/>
<PrepareQuantum name="qp_Hjorleifshofdi4" object="af_Bush" prepare="true"/>
<PrepareQuantum name="qu_Hjorleifshofdi4" object="af_Bush" prepare="false"/>

<!-- Hus -->
<TransparentActorFace name="af_Hus" width="148" height="205"/>
<StaticActor name="a_Hus" terrain="t_Hjorleifshofdil" x="0" y="116" z="0" state="stop" random="true">
	<State name="stop" face="af_Hus"/> </StaticActor>
<ActorMoused actor="a_Hus" listener="sc" moving="Hús" thf="hús"/>

<!-- Skreid -->
<TransparentActorFace name="af_Skreid" width="175" height="80"/>
<StaticActor name="a_Skreid" terrain="t_Hjorleifshofdil" x="126" y="138" z="0" state="stop" random="true">
	<State name="stop" face="af_Skreid"/> </StaticActor>
<ActorMoused actor="a_Skreid" listener="sc" moving="Skreið" thf="skreið"/>

<!-- Hjorleifur -->
<TransparentActorFace name="af_Hjorleifur" width="123" height="82"/>
<StaticActor name="a_Hjorleifur" terrain="t_Hjorleifshofdil" x="566" y="408" z="-100" state="stop" random="true">
	<State name="stop" face="af_Hjorleifur"/> </StaticActor>
<ActorMoused actor="a_Hjorleifur" listener="sc" moving="Hjörleifur" thf="Hjörleif"/>


<!-- Hot spot for moving to Ingolfshofdi -->
<Pseudo3DCollisionBox name="cb_Hjorleifshofdi2Ingolfshofdi" x="40" y="84" z="10"/>
<StaticActor name="a_Hjorleifshofdi2Ingolfshofdi" terrain="t_Hjorleifshofdil" x="775" y="324" z="10" state="stop"
		collision="ac_Hjorleifshofdi2Ingolfshofdi">
	<State name="stop" collisionbox="cb_Hjorleifshofdi2Ingolfshofdi"/> </StaticActor>
<TransparentActorFace name="af_Hjorleifshofdi2Ingolfshofdi" width="93" height="120"/>
<StaticActor name="ta_Hjorleifshofdi2Ingolfshofdi" terrain="t_Hjorleifshofdil" x="707" y="267" z="0" state="stop">
	<State name="stop" face="af_Hjorleifshofdi2Ingolfshofdi"/> </StaticActor>
<ActorMoused actor="ta_Hjorleifshofdi2Ingolfshofdi" listener="sc" moving="Til Ingólfshöfða" thf=" " looking=" " taking=" " talking=" "/>

<!-- Hot spot for moving to SudurThjorsa -->
<Pseudo3DCollisionBox name="cb_Hjorleifshofdi2SudurThjorsa" x="50" y="222" z="10"/>
<StaticActor name="a_Hjorleifshofdi2SudurThjorsa" terrain="t_Hjorleifshofdil" x="30" y="486" z="10" state="stop"
		collision="ac_Hjorleifshofdi2SudurThjorsa">
	<State name="stop" collisionbox="cb_Hjorleifshofdi2SudurThjorsa"/> </StaticActor>
<TransparentActorFace name="af_Hjorleifshofdi2SudurThjorsa" width="88" height="234"/>
<StaticActor name="ta_Hjorleifshofdi2SudurThjorsa" terrain="t_Hjorleifshofdil" x="0" y="366" z="0" state="stop">
	<State name="stop" face="af_Hjorleifshofdi2SudurThjorsa"/> </StaticActor>
<ActorMoused actor="ta_Hjorleifshofdi2SudurThjorsa" listener="sc" moving="Til Þjórsár" thf=" " looking=" " taking=" " talking=" "/>
<MoveActorQuantum name="q_MoveHjorleifshofdi2SudurThjorsaIn" actor="a_Hjorleifshofdi2SudurThjorsa" terrain="t_Hjorleifshofdil"/>
<MoveActorQuantum name="q_MoveHjorleifshofdi2SudurThjorsaOut" actor="a_Hjorleifshofdi2SudurThjorsa"/>

<!-- Hot spot for moving to Reykjavik -->
<Pseudo3DCollisionBox name="cb_Hjorleifshofdi2Reykjavik" x="50" y="216" z="10"/>
<StaticActor name="a_Hjorleifshofdi2Reykjavik" x="30" y="487" z="10" state="stop"
		collision="ac_Hjorleifshofdi2Reykjavik">
	<State name="stop" collisionbox="cb_Hjorleifshofdi2Reykjavik"/> </StaticActor>
<TransparentActorFace name="af_Hjorleifshofdi2Reykjavik" width="88" height="234"/>
<StaticActor name="ta_Hjorleifshofdi2Reykjavik" x="0" y="366" z="0" state="stop">
	<State name="stop" face="af_Hjorleifshofdi2Reykjavik"/> </StaticActor>
<ActorMoused actor="ta_Hjorleifshofdi2Reykjavik" listener="sc" moving="Til Reykjavíkur" thf=" " looking=" " taking=" " talking=" "/>
<MoveActorQuantum name="q_MoveHjorleifshofdi2ReykjavikIn" actor="a_Hjorleifshofdi2Reykjavik" terrain="t_Hjorleifshofdil"/>
<MoveActorQuantum name="q_MoveHjorleifshofdi2ReykjavikOut" actor="a_Hjorleifshofdi2Reykjavik"/>

<StaticActorFace name="af_Blom" file="\Landnam\Graphic\hjorleiA\blom" />
<StaticActorFace name="af_uBlom" file="\Landnam\Graphic\hjorleiA\ublom" prepare="true"/>
<StaticActor name="a_Blom" terrain="t_Hjorleifshofdi" x="163" y="44" z="-200" state="stop" save="true" random="true">
	<State name="stop" face="af_Blom"/>
	<State name="taken" face="af_iBlom"/>
	<State name="use" face="af_uBlom"/>
</StaticActor>
<ActorMoused actor="a_Blom" listener="sc" moving="Blóm" thf="blóm"/>
<StateQuantum name="q_Blom_Taken" actor="a_Blom" state="taken"/>
<MoveActorQuantum name="q_HideBlom" actor="a_Blom"/>
<PrepareQuantum name="qp_Hjorleifshofdi3" object="af_Blom" prepare="true"/>
<PrepareQuantum name="qu_Hjorleifshofdi3" object="af_Blom" prepare="false"/>

<StaticActorFace name="af_DeigurHnifur" file="\Landnam\Graphic\hjorleiA\deigurhA" prepare="false"/>
<StaticActorFace name="af_uDeigurHnifur" file="\Landnam\Graphic\hjorleiA\udeigurA" prepare="true"/>
<StaticActor name="a_DeigurHnifur" terrain="t_Hjorleifshofdi" x="115" y="370" z="10" state="stop" save="true" random="true">
	<State name="stop" face="af_DeigurHnifur"/>
	<State name="taken" face="af_iDeigurHnifur"/>
	<State name="use" face="af_uDeigurHnifur"/>
</StaticActor>
<ActorMoused actor="a_DeigurHnifur" listener="sc" moving="Hnífur" thf="hníf"/>
<StateQuantum name="q_DeigurHnifur_Taken" actor="a_DeigurHnifur" state="taken"/>
<PrepareQuantum name="qp_Hjorleifshofdi2" object="af_DeigurHnifur" prepare="true"/>
<PrepareQuantum name="qu_Hjorleifshofdi2" object="af_DeigurHnifur" prepare="false"/>

<StaticActorFace name="af_uStilkur" file="\Landnam\Graphic\hjorleiA\ustilkur" prepare="true"/>
<StaticActor name="a_Stilkur" x="23" y="325" z="10" state="stop" save="true" random="true">
	<State name="taken" face="af_iStilkur"/>
	<State name="use" face="af_uStilkur"/>
</StaticActor>
<ActorMoused actor="a_Stilkur" listener="sc" moving="Stilkar" thf="stilka"/>
<StateQuantum name="q_Stilkur_Taken" actor="a_Stilkur" state="taken"/>

<Text name="a_Extra_acc" terrain="t_Corners" text=" " color="white" hilite="false"/>

<SpeechActorMouth name="m_Kind" file="\Landnam\Media\sfx\jarm.wav" acc="a_Extra_acc" >
    <Sentence text=" " time="0"/> </SpeechActorMouth>
<CelledAnimated2DActorFace name="af_Kind" repeat="1" file="\Landnam\AnimatiA\sheep\kind" count="5" speed="225"/>
<StaticActor name="a_Kind" x="61" y="266" z="0" state="stop" >
	<State name="peek" face="af_Kind" mouth="m_Kind"/>
</StaticActor>
<StateQuantum name="q_Kind" actor="a_Kind" state="peek" wait="true"/>
<StateQuantum name="q_KindStop" actor="a_Kind" state="stop" wait="false"/>
<MoveActorQuantum name="qh_Kind" actor="a_Kind" />
<MoveActorQuantum name="qs_Kind" actor="a_Kind" terrain="t_Hjorleifshofdil"/>
<PrepareQuantum name="qp_Hjorleifshofdi1" object="af_Kind" prepare="true"/>
<PrepareQuantum name="qu_Hjorleifshofdi1" object="af_Kind" prepare="false"/>


<!-- transparent aukahlutir -->

<TransparentActorFace name="af_runni2" width="193" height="78"/>
<StaticActor name="a_runni2" terrain="t_Hjorleifshofdil" x="600" y="132" z="0" state="stop" random="true">
	<State name="stop" face="af_runni2"/> </StaticActor>
<ActorMoused actor="a_runni2" listener="sc" moving="Runni" thf="runna"/>

<TransparentActorFace name="af_Fjall" width="329" height="84"/>
<StaticActor name="a_Fjall" terrain="t_Hjorleifshofdil" x="265" y="94" z="0" state="stop" random="true">
	<State name="stop" face="af_Fjall"/> </StaticActor>
<ActorMoused actor="a_Fjall" listener="sc" moving="Fjall" thf="fjall"/>

<TransparentActorFace name="af_thak" width="36" height="47"/>
<StaticActor name="a_thak" terrain="t_Hjorleifshofdil" x="0" y="130" z="30" state="stop" random="true">
	<State name="stop" face="af_thak"/> </StaticActor>
<ActorMoused actor="a_thak" listener="sc" moving="Þak" thf="þak"/>

<TransparentActorFace name="af_runni3" width="118" height="111"/>
<StaticActor name="a_runni3" terrain="t_Hjorleifshofdil" x="681" y="465" z="0" state="stop" random="true">
	<State name="stop" face="af_runni3"/> </StaticActor>
<ActorMoused actor="a_runni3" listener="sc" moving="Runni" thf="runna"/>

<TransparentActorFace name="af_hmmm" width="94" height="78"/>
<StaticActor name="a_hmmm" terrain="t_Hjorleifshofdil" x="500" y="300" z="0" state="stop" random="true">
	<State name="stop" face="af_hmmm"/> </StaticActor>
<ActorMoused actor="a_hmmm" listener="sc" moving="Hmmm... Hvað er þetta?" thf="hmmm"/>

<ScrollingScene name="s_SudurThjorsa" width="800" height="1500"/>

<Polygon name="p_SudurThjorsa">
	<Point x="350" y="1499"/>
	<Point x="204" y="1130"/>
	<Point x="416" y="560"/>
	<Point x="451" y="380"/>
	<Point x="313" y="0"/>
	<Point x="313" y="-250"/>
	<Point x="690" y="-250"/>
	<Point x="690" y="0"/>
	<Point x="708" y="126"/>
	<Point x="725" y="184"/>
	<Point x="725" y="241"/>
	<Point x="706" y="241"/>
	<Point x="654" y="351"/>
	<Point x="620" y="502"/>
	<Point x="659" y="627"/>
	<Point x="692" y="877"/>
	<Point x="799" y="897"/>
	<Point x="1400" y="897"/>
	<Point x="1400" y="1499"/>
</Polygon>

<SimplePseudo3DTerrain name="t_SudurThjorsa" scene="s_SudurThjorsa" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="0.65"/>
<SimplePseudo3DTerrain name="t_SudurThjorsal" scene="s_SudurThjorsa" polygon="p_SudurThjorsa"
	zmin="-1" zmax="1500" defaultscaling="0.65"/>

<!-- Background sound -->
<JMFActorMouth name="m_RiverSound" file="\Landnam\Media\sfx\River.wav" repeat="true" prepare="true"/>
<StaticActor name="a_RiverSound" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_RiverSound"/> </StaticActor>
<StateQuantum name="q_RiverSound_stop" actor="a_RiverSound" state="stop" wait="false"/>
<StateQuantum name="q_RiverSound_play" actor="a_RiverSound" state="play" wait="false"/>

<!-- Background for SudurThjorsa -->
<StaticActorFace name="af_SudurThjorsa" file="\Landnam\Graphic\SudurThA\riverloA"/>
<StaticActor name="a_SudurThjorsa" terrain="t_SudurThjorsa" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_SudurThjorsa"/>
</StaticActor>
<PrepareQuantum name="qp_SudurThjorsa1" object="af_SudurThjorsa" prepare="true"/>
<PrepareQuantum name="qu_SudurThjorsa1" object="af_SudurThjorsa" prepare="false"/>

<!-- River1 -->
<CelledAnimated2DActorFace name="af_River1" file="\Landnam\AnimatiA\river1\river1" repeat="-1" count="6" speed="100"/>
<MovingActor name="a_River1" terrain="t_SudurThjorsa" x="26" y="912" z="0" state="none">
	<State name="river" face="af_River1"/>
</MovingActor>
<StateQuantum name="q_River1_river" actor="a_River1" state="river"/>
<StateQuantum name="q_River1_none" actor="a_River1" state="none"/>
<PrepareQuantum name="qp_SudurThjorsa2" object="af_River1" prepare="true"/>
<PrepareQuantum name="qu_SudurThjorsa2" object="af_River1" prepare="false"/>

<!-- River2 -->
<CelledAnimated2DActorFace name="af_River2" file="\Landnam\AnimatiA\river2\river2" repeat="-1" count="6" speed="100"/>
<MovingActor name="a_River2" terrain="t_SudurThjorsa" x="150" y="250" z="0" state="none">
	<State name="river" face="af_River2"/>
</MovingActor>
<StateQuantum name="q_River2_river" actor="a_River2" state="river"/>
<StateQuantum name="q_River2_none" actor="a_River2" state="none"/>
<PrepareQuantum name="qp_SudurThjorsa3" object="af_River2" prepare="true"/>
<PrepareQuantum name="qu_SudurThjorsa3" object="af_River2" prepare="false"/>

<!-- Skogur1 -->
<TransparentActorFace name="af_Skogur1" width="117" height="541"/>
<StaticActor name="a_Skogur1" terrain="t_SudurThjorsal" x="682" y="301" z="0" state="stop"  random="true">
	<State name="stop" face="af_Skogur1"/> </StaticActor>
<ActorMoused actor="a_Skogur1" listener="sc" moving="Skógur" thf="skóg"/>

<!-- Skogur2 -->
<TransparentActorFace name="af_Skogur2" width="91" height="131"/>
<StaticActor name="a_Skogur2" terrain="t_SudurThjorsal" x="709" y="0" z="0" state="stop" random="true">
	<State name="stop" face="af_Skogur2"/> </StaticActor>
<ActorMoused actor="a_Skogur2" listener="sc" moving="Skógur" thf="skóg"/>

<StaticActorFace name="af_Grein" file="\Landnam\Graphic\sudurthA\grein" prepare="false"/>
<StaticActorFace name="af_uGrein" file="\Landnam\Graphic\sudurthA\ugrein" prepare="true"/>
<StaticActor name="a_Grein" terrain="t_SudurThjorsal" x="730" y="187" z="15" state="stop" save="true" random="true">
	<State name="stop" face="af_Grein"/>
	<State name="taken" face="af_iGrein"/>
	<State name="use" face="af_uGrein"/>
</StaticActor>
<ActorMoused actor="a_Grein" listener="sc" moving="Trjágrein" thf="trjágrein"/>
<StateQuantum name="q_Grein_Taken" actor="a_Grein" state="taken"/>
<PrepareQuantum name="qp_SudurThjorsa4" object="af_Grein" prepare="true"/>
<PrepareQuantum name="qu_SudurThjorsa4" object="af_Grein" prepare="false"/>
<MoveActorQuantum name="qh_Grein" actor="a_Grein" />
<MoveActorQuantum name="q_MoveGrein2Inventory" actor="a_Grein" terrain="t_Inventory"/>

<StaticActorFace name="af_uGreinKud" file="\Landnam\Graphic\sudurthA\ukudgreA" prepare="true"/>
<StaticActor name="a_GreinKud" x="23" y="325" z="10" state="taken" save="true" random="true">
 	<State name="taken" face="af_iGreinKud"/>
  	<State name="use" face="af_uGreinKud"/>
</StaticActor>
<ActorMoused actor="a_GreinKud" listener="sc" moving=" " thf="kuðung með grein"/>
<MoveActorQuantum name="qh_GreinKud" actor="a_GreinKud" />
<MoveActorQuantum name="qs_GreinKud" actor="a_GreinKud" terrain="t_Inventory"/>

<!-- Hotspot to Hjorleifshofdi -->
<Pseudo3DCollisionBox name="cb_SudurThjorsa2Hjorleifshofdi" x="40" y="596" z="10"/>
<StaticActor name="a_SudurThjorsa2Hjorleifshofdi" terrain="t_SudurThjorsal" x="775" y="1198" z="10" state="stop"
		collision="ac_SudurThjorsa2Hjorleifshofdi">
	<State name="stop" collisionbox="cb_SudurThjorsa2Hjorleifshofdi"/> </StaticActor>
<TransparentActorFace name="af_SudurThjorsa2Hjorleifshofdi" width="113" height="621"/>
<StaticActor name="ta_SudurThjorsa2Hjorleifshofdi" terrain="t_SudurThjorsal" x="687" y="879" z="10" state="stop">
	<State name="stop" face="af_SudurThjorsa2Hjorleifshofdi"/> </StaticActor>
<ActorMoused actor="ta_SudurThjorsa2Hjorleifshofdi" listener="sc" moving="Til Hjörleifshöfða" looking=" " taking=" " talking=" "/>
<MoveActorQuantum name="qh_SudurThjorsa2Hjorleifshofdi" actor="a_SudurThjorsa2Hjorleifshofdi" />
<MoveActorQuantum name="qs_SudurThjorsa2Hjorleifshofdi" actor="a_SudurThjorsa2Hjorleifshofdi" terrain="t_SudurThjorsal"/>

<!-- Hotspot to NordurThjorsa -->
<Pseudo3DCollisionBox name="cb_SudurThjorsa2NordurThjorsa" x="234" y="80" z="10"/>
<StaticActor name="a_SudurThjorsa2NordurThjorsa" terrain="t_SudurThjorsal" x="570" y="155" z="10" state="stop"
		collision="ac_SudurThjorsa2NordurThjorsa">
	<State name="stop" collisionbox="cb_SudurThjorsa2NordurThjorsa"/> </StaticActor>
<TransparentActorFace name="af_SudurThjorsa2NordurThjorsa" width="403" height="231"/>
<StaticActor name="ta_SudurThjorsa2NordurThjorsa" terrain="t_SudurThjorsal" x="312" y="0" z="0" state="stop">
	<State name="stop" face="af_SudurThjorsa2NordurThjorsa"/> </StaticActor>
<ActorMoused actor="ta_SudurThjorsa2NordurThjorsa" listener="sc" moving="Upp með ánni" looking=" " taking=" " talking=" "/>


<ScrollingScene name="s_NordurThjorsa" width="1200" height="900"/>

<Polygon name="p_AusturNordurThjorsa">
	<Point x="704" y="899"/>
	<Point x="571" y="780"/>
	<Point x="374" y="630"/>
	<Point x="385" y="600"/>
	<Point x="817" y="600"/>
	<Point x="946" y="708"/>
	<Point x="1000" y="775"/>
	<Point x="1037" y="899"/>
	<Point x="1037" y="1500"/>
	<Point x="704" y="1500"/>
</Polygon>

<Polygon name="p_VesturNordurThjorsa">
	<Point x="-250" y="215"/>		<Point x="240" y="212"/>
	<Point x="240" y="612"/>	<Point x="240" y="759"/>
	<Point x="240" y="899"/>	<Point x="-250" y="899"/>
</Polygon>

<SimplePseudo3DTerrain name="t_NordurThjorsa" scene="s_NordurThjorsa" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="0.65"/>
<SimplePseudo3DTerrain name="t_AusturNordurThjorsal" scene="s_NordurThjorsa" polygon="p_AusturNordurThjorsa"
	zmin="-1" zmax="1500" defaultscaling="0.65"/>
<SimplePseudo3DTerrain name="t_VesturNordurThjorsal" scene="s_NordurThjorsa" polygon="p_VesturNordurThjorsa"
	zmin="-1" zmax="1500" defaultscaling="0.65"/>

<!-- Background for northern Thjorsa -->
<StaticActorFace name="af_NordurThjorsa1" file="\Landnam\Graphic\NordurTA\NordurTA"/>
<StaticActor name="a_NordurThjorsa1" terrain="t_NordurThjorsa" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_NordurThjorsa1"/> </StaticActor>
<StaticActorFace name="af_NordurThjorsa2" file="\Landnam\Graphic\NordurTA\NordurTB"/>
<StaticActor name="a_NordurThjorsa2" terrain="t_NordurThjorsa" x="800" y="-1" z="-1" state="stop">
	<State name="stop" face="af_NordurThjorsa2"/> </StaticActor>
<PrepareQuantum name="qp_NordurThjorsa1" object="af_NordurThjorsa1" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa1" object="af_NordurThjorsa1" prepare="false"/>
<PrepareQuantum name="qp_NordurThjorsa2" object="af_NordurThjorsa2" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa2" object="af_NordurThjorsa2" prepare="false"/>

<!-- Drumbur -->
<StaticActorFace name="af_Drumbur" file="\Landnam\Graphic\NordurTA\Drumbur" />
<StaticActor name="a_Drumbur" x="388" y="725" z="0" state="stop" random="true" save="true">
	<State name="stop" face="af_Drumbur"/> </StaticActor>
<PrepareQuantum name="qp_NordurThjorsa3" object="af_Drumbur" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa3" object="af_Drumbur" prepare="false"/>
<ActorMoused actor="a_Drumbur" listener="sc" moving="Drumbur" thf="drumb"/>

<StaticActorFace name="af_Drumbur2" file="\Landnam\Graphic\NordurTA\Drumbur2" />
<MovingActor name="a_Drumbur2" x="82" y="755" z="0" state="stop">
	<State name="stop" face="af_Drumbur2"/>
	<State name="front" face="af_Drumbur2"/>
</MovingActor>
<MoveActorQuantum name="qs_Drumbur2" actor="a_Drumbur2" terrain="t_AusturNordurThjorsal"/>
<MoveActorQuantum name="qh_Drumbur2" actor="a_Drumbur2"/>
<PrepareQuantum name="qp_NordurThjorsa8" object="af_Drumbur2" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa8" object="af_Drumbur2" prepare="false"/>
<SetDestinationQuantum name="q_DrumburDrift" actor="a_Drumbur2" x="82" y="900" wait="false" speed="90"/>

<!-- Tre1 -->
<StaticActorFace name="af_Tre1" file="\Landnam\Graphic\NordurTA\tre1" />
<StaticActor name="a_Tre1" terrain="t_AusturNordurThjorsal" x="500" y="330" z="0" state="stop" random="true">
	<State name="stop" face="af_Tre1"/> </StaticActor>
<ActorMoused actor="a_Tre1" listener="sc" moving="Tré" thf="tré"/>
<PrepareQuantum name="qp_NordurThjorsa4" object="af_Tre1" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa4" object="af_Tre1" prepare="false"/>

<!-- Tre2 -->
<StaticActorFace name="af_Tre2" file="\Landnam\Graphic\NordurTA\tre2" />
<StaticActor name="a_Tre2" terrain="t_AusturNordurThjorsal" x="593" y="295" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Tre2"/> </StaticActor>
<ActorMoused actor="a_Tre2" listener="sc" moving="Tré" thf="tré"/>
<PrepareQuantum name="qp_NordurThjorsa5" object="af_Tre2" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa5" object="af_Tre2" prepare="false"/>

<!-- Stubbur2 -->
<StaticActorFace name="af_Stubbur2" file="\Landnam\Graphic\NordurTA\stubbur2"/>
<StaticActor name="a_Stubbur2" x="601" y="520" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Stubbur2"/> </StaticActor>
<ActorMoused actor="a_Stubbur2" listener="sc" moving="Tré" thf="tré"/>
<PrepareQuantum name="qp_NordurThjorsa6" object="af_Stubbur2" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa6" object="af_Stubbur2" prepare="false"/>

<!-- DrumburOgBand -->
<StaticActorFace name="af_DrumburOgBand" file="\Landnam\Graphic\NordurTA\DrumburA"/>
<StaticActor name="a_DrumburOgBand" x="82" y="310" z="0" state="stop">
	<State name="stop" face="af_DrumburOgBand"/> </StaticActor>
<PrepareQuantum name="qp_NordurThjorsa7" object="af_DrumburOgBand" prepare="true"/>
<PrepareQuantum name="qu_NordurThjorsa7" object="af_DrumburOgBand" prepare="false"/>

<!-- FlyExi -->
<CelledAnimated2DActorFace name="af_FlyExi" file="\Landnam\AnimatiA\Vifill\exiflygA" repeat="1" speed="150" count="5"/>
<StaticActor name="a_FlyExi" x="140" y="260" z="0" state="none" terrain="t_AusturNordurThjorsal">
	<State name="fly" face="af_FlyExi"/> </StaticActor>
<StateQuantum name="q_FlyExi" actor="a_FlyExi" state="fly" wait="true"/>
<StateQuantum name="q_StopFly" actor="a_FlyExi" state="none" wait="false"/>
<PrepareQuantum name="qp_Fly" object="af_FlyExi" prepare="true"/>
<PrepareQuantum name="qu_Fly" object="af_FlyExi" prepare="false"/>

<!-- Tre3 -->
<TransparentActorFace name="af_Tre3" width="136" height="232"/>
<StaticActor name="a_Tre3" terrain="t_NordurThjorsa" x="0" y="189" z="0" state="stop" random="true">
	<State name="stop" face="af_Tre3"/> </StaticActor>
<ActorMoused actor="a_Tre3" listener="sc" moving="Tré" thf="tré"/>

<!-- Rock -->
<TransparentActorFace name="af_Rock" width="127" height="106"/>
<StaticActor name="a_Rock" terrain="t_NordurThjorsa" x="0" y="417" z="0" state="stop" random="true">
	<State name="stop" face="af_Rock"/>
</StaticActor>
<ActorMoused actor="a_Rock" listener="sc" moving="Steinn" thf="stein"/>

<!-- Skogur3 -->
<TransparentActorFace name="af_Skogur3" width="305" height="322"/>
<StaticActor name="a_Skogur3" terrain="t_NordurThjorsa" x="892" y="344" z="0" state="stop" random="true">
	<State name="stop" face="af_Skogur3"/> </StaticActor>
<ActorMoused actor="a_Skogur3" listener="sc" moving="Skógur" thf="skóg"/>


<!-- Hotspot to SudurThjorsa -->
<Pseudo3DCollisionBox name="cb_NordurThjorsa2SudurThjorsa" x="306" y="40" z="10"/>
<StaticActor name="a_NordurThjorsa2SudurThjorsa" terrain="t_VesturNordurThjorsal" x="859" y="875" z="10" state="stop"
		collision="ac_NordurThjorsa2SudurThjorsa">
	<State name="stop" collisionbox="cb_NordurThjorsa2SudurThjorsa"/> </StaticActor>
<TransparentActorFace name="af_NordurThjorsa2SudurThjorsa" width="435" height="68"/>
<StaticActor name="ta_NordurThjorsa2SudurThjorsa" terrain="t_VesturNordurThjorsal" x="652" y="831" z="0" state="stop">
	<State name="stop" face="af_NordurThjorsa2SudurThjorsa"/> </StaticActor>
<ActorMoused actor="ta_NordurThjorsa2SudurThjorsa" listener="sc" moving="Niður með ánni" looking=" " taking=" " talking=" "/>


<UseText listener="sc" actor="a_Axe" actor2="a_Rope" text="Binda exi við reipi"/>
<UseText listener="sc" actor="a_Rope" actor2="a_Axe" text="Binda exi við reipi"/>
<UseText listener="sc" actor="a_Axe" actor2="a_Rock" text="Kasta exi í stein"/>
<UseText listener="sc" actor="a_Axe" actor2="a_Tre3" text="Kasta exi í tre"/>
<UseText listener="sc" actor="a_AxeAndRope" actor2="a_Rock" text="Kasta exi með reipi yfir ána"/>
<UseText listener="sc" actor="a_AxeAndRope" actor2="a_Tre3" text="Kasta exi með reipi í tré"/>

<Scene name="s_Reykjavik"/>

<Polygon name="p_Reykjavik">
	<Point x="500" y="452"/>
	<Point x="1200" y="456"/>
	<Point x="1200" y="600"/>
	<Point x="160" y="600"/>
	<Point x="160" y="555"/>
	<Point x="520" y="555"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Reykjavik" scene="s_Reykjavik" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="0.65"/>
<SimplePseudo3DTerrain name="t_Reykjavikl" scene="s_Reykjavik" polygon="p_Reykjavik"
	zmin="-1" zmax="1500" defaultscaling="0.65" scanline1="580" scaling2="0.6" scanline2="400"/>

<!-- Background for Reykjavik -->
<StaticActorFace name="af_Reykjavik" file="\Landnam\Graphic\ReykjavA\ReykjavA"/>
<StaticActor name="a_Reykjavik" terrain="t_Reykjavik" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_Reykjavik"/> </StaticActor>
<PrepareQuantum name="qp_Reykjavik1" object="af_Reykjavik" prepare="true"/>
<PrepareQuantum name="qu_Reykjavik1" object="af_Reykjavik" prepare="false"/>

<!-- Sea2 -->
<CelledAnimated2DActorFace name="af_Sea2" file="\Landnam\AnimatiA\sea\sea2" repeat="-1" count="4" speed="300"/>
<StaticActor name="a_Sea2" terrain="t_Reykjavik" x="0" y="-110" z="-400" state="none" >
	<State name="sea" face="af_Sea2"/>
</StaticActor>
<StateQuantum name="q_Sea2_sea" actor="a_Sea2" state="sea"/>
<StateQuantum name="q_Sea2_none" actor="a_Sea2" state="none"/>
<PrepareQuantum name="qp_Reykjavik6" object="af_Sea2" prepare="true"/>
<PrepareQuantum name="qu_Reykjavik6" object="af_Sea2" prepare="false"/>

<!-- IngibjorgSolrun -->
<StaticActorFace name="af_IngibjorgSolrun" file="\Landnam\Graphic\ReykjavA\Runni"/>
<StaticActor name="a_IngibjorgSolrun" terrain="t_Reykjavik" x="681" y="600" z="199" state="stop" random="true">
	<State name="stop" face="af_IngibjorgSolrun"/> </StaticActor>
<ActorMoused actor="a_IngibjorgSolrun" listener="sc" moving="Til Hjörleifshöfða" looking=" " taking=" " talking=" "/>
<PrepareQuantum name="qp_Reykjavik2" object="af_IngibjorgSolrun" prepare="true"/>
<PrepareQuantum name="qu_Reykjavik2" object="af_IngibjorgSolrun" prepare="false"/>

<!-- Sula1 -->
<StaticActorFace name="af_Sula1" file="\Landnam\Graphic\ReykjavA\Sula1" />
<StaticActor name="a_Sula1" terrain="t_Reykjavik" x="172" y="427" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Sula1"/> </StaticActor>
<ActorMoused actor="a_Sula1" listener="sc" moving="Rekaviður" thf="rekavið" talking="Borða rekavið"/>
<PrepareQuantum name="qp_Reykjavik3" object="af_Sula1" prepare="true"/>
<PrepareQuantum name="qu_Reykjavik3" object="af_Sula1" prepare="false"/>

<!-- Sula2 -->
<StaticActorFace name="af_Sula2" file="\Landnam\Graphic\ReykjavA\Sula2" />
<StaticActor name="a_Sula2" terrain="t_Reykjavik" x="127" y="468" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Sula2"/> </StaticActor>
<ActorMoused actor="a_Sula2" listener="sc" moving="Rekaviður" thf="rekavið" talking="Borða rekavið"/>
<PrepareQuantum name="qp_Reykjavik4" object="af_Sula2" prepare="true"/>
<PrepareQuantum name="qu_Reykjavik4" object="af_Sula2" prepare="false"/>

<!-- Sula3 -->
<StaticActorFace name="af_Sula3" file="\Landnam\Graphic\ReykjavA\Sula3" />
<StaticActor name="a_Sula3" terrain="t_Reykjavik" x="333" y="358" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Sula3"/> </StaticActor>
<ActorMoused actor="a_Sula3" listener="sc" moving="Rekaviður" thf="rekavið" talking="Borða rekavið"/>
<PrepareQuantum name="qp_Reykjavik5" object="af_Sula3" prepare="true"/>
<PrepareQuantum name="qu_Reykjavik5" object="af_Sula3" prepare="false"/>

<!-- Hot spot for moving to Hjorleifshofdi -->
<Pseudo3DCollisionBox name="cb_Reykjavik2Hjorleifshofdi" x="50" y="140" z="10"/>
<TransparentActorFace name="af_Reykjavik2Hjorleifshofdi" width="60" height="160"/>
<StaticActor name="a_Reykjavik2Hjorleifshofdi3" terrain="t_Reykjavikl" x="750" y="528" z="0" state="stop" collision="ac_Reykjavik2Hjorleifshofdi">
	<State name="stop" collisionbox="cb_Reykjavik2Hjorleifshofdi"/>
</StaticActor>
<StaticActor name="a_Reykjavik2Hjorleifshofdi" terrain="t_Reykjavikl" x="740" y="440" z="0" state="stop" >
	<State name="stop" face="af_Reykjavik2Hjorleifshofdi"/>
</StaticActor>
<ActorMoused actor="a_Reykjavik2Hjorleifshofdi" listener="sc" moving="Til Hjörleifshöfða" looking=" " taking=" " talking=" "/>
<MoveActorQuantum name="qh_Reykjavik2Hjorleifshofdi" actor="a_Reykjavik2Hjorleifshofdi3" />
<MoveActorQuantum name="qs_Reykjavik2Hjorleifshofdi" actor="a_Reykjavik2Hjorleifshofdi3" terrain="t_Reykjavikl"/>




<!-- Actors -->
<!-- Vifill -->

<Text name="a_Vifill_acc" terrain="t_Corners" text=" " color="white" hilite="false"/>

<SpeechActorMouth name="m_saell" file="\Landnam\Media\vifill\saell.wav" acc="a_Vifill_acc">
	<Sentence text="Sæll!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hannhefurveriddrepinn" file="\Landnam\Media\vifill\hannhefA.wav" acc="a_Vifill_acc">
	<Sentence text="Hann hefur verið drepinn!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hvaderum" file="\Landnam\Media\vifill\hvaderum.wav" acc="a_Vifill_acc">
	<Sentence text="Hvað er um að vera?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hvarerumvid" file="\Landnam\Media\vifill\hvareruA.wav" acc="a_Vifill_acc">
	<Sentence text="Hvar erum við?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hvadaarer" file="\Landnam\Media\vifill\hvadaarA.wav" acc="a_Vifill_acc">
	<Sentence text="Hvaða ár er eiginlega?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_denniheitieg" file="\Landnam\Media\vifill\denniheA.wav" acc="a_Vifill_acc">
	<Sentence text="Sæll! Denni heiti ég, hvað heitir þú?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_bless" file="\Landnam\Media\vifill\bless.wav" acc="a_Vifill_acc">
	<Sentence text="Bless!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_bless_river" file="\common\Media\bless\bless1.wav" acc="a_Vifill_acc">
	<Sentence text="Bless!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_bless_rvk" file="\common\Media\bless\bless4.wav" acc="a_Vifill_acc">
	<Sentence text="Það var gaman að tala við þig!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_hvernigdattingolfi" file="\Landnam\Media\vifill\hvernigA.wav" acc="a_Vifill_acc">
	<Sentence text="Hvernig datt Ingólfi í hug að nema land á Íslandi?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_afhverjuheitir1" file="\Landnam\Media\vifill\afhverjA.wav" acc="a_Vifill_acc">
	<Sentence text="Af hverju heitir fóstbróðir Ingólfs Hjörleifur?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_afhverjuheitir2" file="\Landnam\Media\vifill\afhverjB.wav" acc="a_Vifill_acc">
	<Sentence text="Af hverju heitir landið Ísland?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_afhverjudrapu" file="\Landnam\Media\vifill\afhverjC.wav" acc="a_Vifill_acc">
	<Sentence text="Af hverju drápu Ingólfur og Hjörleifur Hólmstein og Herstein, syni Atla jarls?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hvarerhjorleifur" file="\Landnam\Media\vifill\hvarerhA.wav" acc="a_Vifill_acc">
	<Sentence text="Hvar er Hjörleifur?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_einhverjahugmynd" file="\Landnam\Media\vifill\einhverA.wav" acc="a_Vifill_acc">
	<Sentence text="Hefurðu einhverja hugmynd um ..." time="0"/>
	<Sentence text="... hvar öndvegissúlurnar munu vera niður komnar?" time="1400"/> </SpeechActorMouth>
<SpeechActorMouth name="m_egnenniekki" file="\Landnam\Media\vifill\egnenniA.wav" acc="a_Vifill_acc">
	<Sentence text="Æi, ég nenni ekki að leita að þessum öndvegissúlum ..." time="0"/>
	<Sentence text="... eigum við ekki bara að leggja okkur?" time="4800"/> </SpeechActorMouth>
<SpeechActorMouth name="m_thadergott" file="\Landnam\Media\vifill\thadergA.wav" acc="a_Vifill_acc">
	<Sentence text="Ohhh! Það er gott að vera kominn með fast land undir fæturna ..." time="0"/>
	<Sentence text="... hér vil ég vera!" time="6300"/> </SpeechActorMouth>

<SpeechActorMouth name="m_draugabaerinn" file="\Landnam\Media\vifill\draugabA.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er nú meiri draugabærinn!" time="0"/>
	<Sentence text="Það er ekki nokkur sála hér!" time="3200"/>
	<Sentence text="Er þetta eitthvert grín!?!" time="6000"/> </SpeechActorMouth>
<SpeechActorMouth name="m_gestrisni" file="\Landnam\Media\vifill\gestrisA.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta nær ekki nokkurri átt!" time="0"/>
	<Sentence text="Hvers konar gestrisni er þetta eiginlega!" time="2700"/>
	<Sentence text="Enginn heima og ekki einu sinni heitt á könnunni!" time="5300"/> </SpeechActorMouth>
<SpeechActorMouth name="m_honumadbana" file="\Landnam\Media\vifill\honumadA.wav" acc="a_Vifill_acc">
	<Sentence text="Hvað ætli hafi orðið honum að bana?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_lataingolfvita" file="\Landnam\Media\vifill\lataingA.wav" acc="a_Vifill_acc">
	<Sentence text="Þurfum við ekki að láta Ingólf vita?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_holdumaframleitinni" file="\Landnam\Media\vifill\holdumaA.wav" acc="a_Vifill_acc">
	<Sentence text="Höldum áfram að leita að súlunum." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_fundumhjorleif" file="\Landnam\Media\vifill\fundumhA.wav" acc="a_Vifill_acc">
	<Sentence text="Við fundum Hjörleif dauðan dagleið vestar. Hann hefur verið drepinn!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_nennumekki" file="\Landnam\Media\vifill\nennumeA.wav" acc="a_Vifill_acc">
	<Sentence text="Við nennum ekki að leita lengur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_villtumst" file="\Landnam\Media\vifill\villtumA.wav" acc="a_Vifill_acc">
	<Sentence text="Við villtumst." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_asporid" file="\Landnam\Media\vifill\asporid.wav" acc="a_Vifill_acc">
	<Sentence text="Við erum komnir á sporið." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_godraddyr" file="\Landnam\Media\vifill\godraddA.wav" acc="a_Vifill_acc">
	<Sentence text="Nú eru góð ráð dýr. Hvernig eigum við að komast yfir þetta stórfljót?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_syndayfir" file="\Landnam\Media\vifill\syndayfA.wav" acc="a_Vifill_acc">
	<Sentence text="Eigum við ekki bara að synda yfir?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_smidadfleka" file="\Landnam\Media\vifill\smidadfA.wav" acc="a_Vifill_acc">
	<Sentence text="Gætum við ekki smíðað fleka?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ekkilengra" file="\Landnam\Media\vifill\ekkilenA.wav" acc="a_Vifill_acc">
	<Sentence text="Nú komumst við ekki lengra upp með ánni. Kanntu einhver ráð?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_sjadusulurnar" file="\Landnam\Media\vifill\sjadusuA.wav" acc="a_Vifill_acc">
	<Sentence text="Sjáðu allar öndvegissúlurnar." time="0"/>
	<Sentence text="Það hafa greinilega fleiri gert eins og Ingólfur og kastað öndvegissúlum fyrir borð." time="2000"/> </SpeechActorMouth>

<!-- insert -->

<SpeechActorMouth name="m_ekkiveraadthessurugli" file="\Landnam\Media\vifill\ekkiverA.wav" acc="a_Vifill_acc">
	<Sentence text="Ekki vera að þessu rugli ..." time="0"/>
	<Sentence text="... ég er búinn að reyna þetta!" time="1687"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_bandidnaerekkitakiatrenu" file="\Landnam\Media\vifill\bandidnA.wav" acc="a_Vifill_acc">
	<Sentence text="Bandið nær ekki taki á trénu!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_bandidrennurafsteininum" file="\Landnam\Media\vifill\bandidrA.wav" acc="a_Vifill_acc">
	<Sentence text="Bandið rennur af steininum!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_bidduviderthettaekki" file="\Landnam\Media\vifill\bidduviA.wav" acc="a_Vifill_acc">
	<Sentence text="Bíddu við! Er þetta ekki öndveigissúla Ingólfs?!??" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_efvidgaetumkomist" file="\Landnam\Media\vifill\efvidgaA.wav" acc="a_Vifill_acc">
	<Sentence text="Ef við gætum komist yfir ána ..." time="0"/>
	<Sentence text="... þá er ég viss um að við gætum fundið öndveigissúlurnar!" time="2000"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_egerekkithyrsturnuna" file="\Landnam\Media\vifill\egerekkA.wav" acc="a_Vifill_acc">
	<Sentence text="Ég er ekki þyrstur núna!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_eggaetialdreihaldidathessu" file="\Landnam\Media\vifill\eggaetiA.wav" acc="a_Vifill_acc">
	<Sentence text="Ég gæti aldrei haldið á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_eggetekkitogadtreidnidur" file="\Landnam\Media\vifill\eggetekA.wav" acc="a_Vifill_acc">
	<Sentence text="Ég get ekki togað tréð niður með bandinu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_eggetekkitogadtre" file="\Landnam\Media\vifill\eggetekB.wav" acc="a_Vifill_acc">
	<Sentence text="Ég get ekki togað tréð niður!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_ahugaverdurrunni" file="\Landnam\Media\vifill\ahugaveA.wav" acc="a_Vifill_acc">
	<Sentence text="Áhugaverður runni. Það er eitthvað bogið við hann!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_enfallegurkadall" file="\Landnam\Media\vifill\enfalleA.wav" acc="a_Vifill_acc">
	<Sentence text="En fallegur kaðall!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_fallegttre" file="\Landnam\Media\vifill\fallegtA.wav" acc="a_Vifill_acc">
	<Sentence text="Hm... Fallegt tré!" time="0"/>
	<Sentence text="Ætli það verði ennþá hér eftir þúsund ár?" time="3290"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_ingolfurmyndibrjalast" file="\Landnam\Media\vifill\ingolfuA.wav" acc="a_Vifill_acc">
	<Sentence text="Ingólfur myndi brjálast ef ég tæki kistuna!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_neiegtharfekkithetta" file="\Landnam\Media\vifill\neiegthA.wav" acc="a_Vifill_acc">
	<Sentence text="Nei ég þarf ekki þetta!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_neihaettunualveg" file="\Landnam\Media\vifill\neihaetA.wav" acc="a_Vifill_acc">
	<Sentence text="Nei hættu nú alveg!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_neithettatharfegekki" file="\Landnam\Media\vifill\neithetA.wav" acc="a_Vifill_acc">
	<Sentence text="Nei, þetta þarf ég ekki!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_oxinfestistekkividsteininn" file="\Landnam\Media\vifill\oxinfesA.wav" acc="a_Vifill_acc">
	<Sentence text="Öxin festist ekki við steininn!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_thaderinnihusinu" file="\Landnam\Media\vifill\tahaderA.wav" acc="a_Vifill_acc">
	<Sentence text="Það er ekkert merkilegt inni í húsinu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_thadertunnur" file="\Landnam\Media\vifill\thadertA.wav" acc="a_Vifill_acc">
	<Sentence text="Hmm... Það er ekkert merkilegt við þessar tunnur!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_thadvaerigamanadeiga" file="\Landnam\Media\vifill\thadvaeA.wav" acc="a_Vifill_acc">
	<Sentence text="Það væri gaman að eiga þetta!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_thettatvenntekki" file="\Landnam\Media\vifill\thettatA.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta tvennt gengur ekki saman!" time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_tilhversthennanhlut" file="\Landnam\Media\vifill\tilhverA.wav" acc="a_Vifill_acc">
	<Sentence text="Til hvers ætti ég að nota þennan hlut?" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_mikideruthettafalleg" file="\Landnam\Media\vifill\mikiderA.wav" acc="a_Vifill_acc">
	<Sentence text="Mikið eru þetta falleg blóm!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_frabaertgreinin" file="\Landnam\Media\vifill\frabaerA.wav" acc="a_Vifill_acc">
	<Sentence text="Frábært! Greinin er nú komin í kuðunginn!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_heyrdukarli" file="\Landnam\Media\vifill\heyrdukA.wav" acc="a_Vifill_acc">
	<Sentence text="Heyrðu Karli!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_hunersvoupptekin" file="\Landnam\Media\vifill\hunersvA.wav" acc="a_Vifill_acc">
	<Sentence text="Hún er svo upptekin við að prjóna." time="0"/>
	<Sentence text="Ég held að ég sé ekkert að trufla hana." time="1911"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_jaejanueregbuinn" file="\Landnam\Media\vifill\jaejanuA.wav" acc="a_Vifill_acc">
	<Sentence text="Jæja, nú er ég búinn að höggva, aflima og snyrta tréð." time="0"/>
	<Sentence text="Var ég ekki fljótur?" time="3450"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_afsakduhusbondi" file="\Landnam\Media\vifill\afsakduA.wav" acc="a_Vifill_acc">
	<Sentence text="Afsakaðu, húsbóndi!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_mikideruthettaljotir" file="\Landnam\Media\vifill\mikiderB.wav" acc="a_Vifill_acc">
	<Sentence text="Mikið eru þetta ljótir stilkar!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_nueregbuinnadbinda" file="\Landnam\Media\vifill\nueregbA.wav" acc="a_Vifill_acc">
	<Sentence text="Hmm... Nú er ég búinn að binda reipið við öxina!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_ondvegissulan" file="\Landnam\Media\vifill\ondvegiA.wav" acc="a_Vifill_acc">
	<Sentence text="Öndveigissúlan hans Ingólfs er risastór!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_snjallraediegsker" file="\Landnam\Media\vifill\snjallrA.wav" acc="a_Vifill_acc">
	<Sentence text="Snjallræði! Ég sker blómin í sundur!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thadereitthvadovenjulegt" file="\Landnam\Media\vifill\thadereA.wav" acc="a_Vifill_acc">
	<Sentence text="Það er eitthvað óvenjulegt við þennan kuðung!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thekkirthuekkiingolf" file="\Landnam\Media\vifill\thekkirA.wav" acc="a_Vifill_acc">
	<Sentence text="Þekkir þú ekki Ingólf Arnarson, húsbónda minn?" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thessihnifurer" file="\Landnam\Media\vifill\thessihA.wav" acc="a_Vifill_acc">
	<Sentence text="Þessi hnífur er kolryðgaður og gjörsamlega ónothæfur!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaer" file="\Landnam\Media\vifill\thettaer.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er... Ég veit eiginlega ekki hvað þetta er." time="0"/>
	<Sentence text="Kuðungur með trjágrein?" time="4465"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaerbaravenjulegurrunni" file="\Landnam\Media\vifill\thettaeA.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er bara venjulegur runni!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaerhallveig" file="\Landnam\Media\vifill\thettaeB.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er Hallveig, kona Ingólfs." time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaernubarahann" file="\Landnam\Media\vifill\thettaeC.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er nú bara hann Karli!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaeroxin" file="\Landnam\Media\vifill\thettaeD.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er öxin hans Ingófs!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaeroxinhans" file="\Landnam\Media\vifill\thettaeE.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er öxin hans Ingólfs með reipið hans bundið við hana!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaerreipidhans" file="\Landnam\Media\vifill\thettaeF.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er reipið hans Ingólfs!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaertrjadrumburinn" file="\Landnam\Media\vifill\thettaeG.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er trjádrumburinn sem ég hjó áðan!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettaertrjagrein" file="\Landnam\Media\vifill\thettaeH.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta er trjágrein!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_thettavarrosalegt" file="\Landnam\Media\vifill\thettavA.wav" acc="a_Vifill_acc">
	<Sentence text="Þetta var rosalegt! En við komumst yfir." time="0"/>
</SpeechActorMouth>

<SpeechActorMouth name="m_afsakadu" file="\Landnam\Media\vifill\afsakadA.wav" acc="a_Vifill_acc">
	<Sentence text="Afsakaðu húsbóndi!" time="0"/>
</SpeechActorMouth>

<SpeechActorMouth acc="a_Vifill_acc" name="m_Take1" file="\common\Media\take\take3.wav" >
	<Sentence text="Ég gæti aldrei haldið á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Take2" file="\common\Media\take\take4.wav" >
	<Sentence text="Ekki þessa vitleysu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Take3" file="\common\Media\take\take5.wav" >
	<Sentence text="Gengur ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Take4" file="\common\Media\take\take6.wav" >
	<Sentence text="Ég hef engan áhuga á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Take5" file="\common\Media\take\take9.wav" >
	<Sentence text="Nei! Þetta þarf ég ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Take6" file="\common\Media\take\take10.wav" >
	<Sentence text="Nei! Þetta þarf ég ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Take7" file="\common\Media\take\take12.wav" >
	<Sentence text="Til hvers ætti ég að nota þennan hlut?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Vifill_acc" name="m_Use1" file="\common\Media\use\use1.wav" >
	<Sentence text="Ég þarf ekki að nota þetta hér!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Use2" file="\common\Media\use\use5.wav" >
	<Sentence text="Nei! Þetta gengur ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Use3" file="\common\Media\use\use3.wav" >
	<Sentence text="Frábær hugmynd ..." time="0"/>
	<Sentence text="... eða nei, kannski ekki!" time="1350"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Use4" file="\common\Media\use\use6.wav" >
	<Sentence text="Ég held að það sé kominn tími til að sumir ..." time="0"/>
	<Sentence text="... hætti að spila tölvuleiki." time="2340"/>
	<Sentence text="Ég á bara að gera tóma vitleysu!" time="4750"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Use5" file="\landnam\Media\vifill\use5.wav" >
	<Sentence text="Gengur ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Use6" file="\landnam\Media\vifill\use6.wav" >
	<Sentence text="Ég þori því alls ekki!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Vifill_acc" name="m_Talk1" file="\common\Media\talk\talk1.wav" >
	<Sentence text="Ekki þessa vitleysu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Talk2" file="\common\Media\talk\talk2.wav" >
	<Sentence text="Láttu ekki svona!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Talk3" file="\common\Media\talk\talk3.wav" >
	<Sentence text="Þetta er líklega versta hugmynd ..." time="0"/>
	<Sentence text="... sem ég hef nokkru sinni heyrt!" time="2015"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Talk4" file="\common\Media\talk\talk4.wav" >
	<Sentence text="Nei, hættu nú alveg!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Vifill_acc" name="m_Look1" file="\common\Media\look\look2.wav" >
	<Sentence text="Mikið er þetta fallegt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Look2" file="\common\Media\look\look3.wav" >
	<Sentence text="Það væri gaman að eiga þetta!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Look3" file="\common\Media\look\look5.wav" >
	<Sentence text="Veistu ekki hvað þetta er?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Look4" file="\common\Media\look\look6.wav" >
	<Sentence text="Ég hef engan áhuga á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Vifill_acc" name="m_Look5" file="\landnam\Media\vifill\look5.wav" >
	<Sentence text="Veistu ekki hvað þetta er?" time="0"/> </SpeechActorMouth>


<!-- Miscellaneous sentences -->
<SpeechActorMouth name="m_neihaettunu" file="\Landnam\Media\misc\neihaetA.wav" acc="a_Vifill_acc">
	<Sentence text="Nei hættu nú alveg!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_tynast" file="\Landnam\Media\misc\tynast.wav" acc="a_Vifill_acc">
	<Sentence text="Ég myndi bara týnast inni í skóginum." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_tharfekki" file="\Landnam\Media\misc\tharfekA.wav" acc="a_Vifill_acc">
	<Sentence text="Nei, ég þarf ekki þetta." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ekkertmerkilegt" file="\Landnam\Media\misc\ekkertmA.wav" acc="a_Vifill_acc">
	<Sentence text="Það er ekkert merkilegt inni í húsinu." time="0"/> </SpeechActorMouth>

<StaticActorFace name="vifill_stop" file="\Landnam\AnimatiA\vifill\stop" prepare="true"/>
<CelledAnimated2DActorFace name="vifill_right" repeat="-1" file="\Landnam\AnimatiA\vifill\right" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="vifill_left" repeat="-1" file="\Landnam\AnimatiA\vifill\left" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="vifill_front" repeat="-1" file="\Landnam\AnimatiA\vifill\front" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="vifill_back" repeat="-1" file="\Landnam\AnimatiA\vifill\back" count="6" prepare="true"/>

<CelledAnimated2DActorFace name="vifill_stop2right" repeat="1" file="\Landnam\AnimatiA\vifill\stop2riA" count="6" prepare="true"/>
<CelledAnimated2DActorFace name="vifill_stop2left" repeat="1" file="\Landnam\AnimatiA\vifill\stop2leA" count="6" prepare="true"/>
<CelledAnimated2DActorFace name="vifill_stop2back" repeat="1" file="\Landnam\AnimatiA\vifill\stop2baA" count="4" prepare="true"/>

<CelledAnimated2DActorFace name="vifill_talk" repeat="-1" file="\Landnam\AnimatiA\vifill\talk" count="4" prepare="true" xoffset="-18" yoffset="0" speed="75" random="true"/>
<CelledAnimated2DActorFace name="vifill_kiss" repeat="-1" file="\Landnam\AnimatiA\vifill\kiss" count="2" prepare="true" speed="300"/>
<CelledAnimated2DActorFace name="vifill_kissd" repeat="1" file="\Landnam\AnimatiA\vifill\kissd" count="1" prepare="true" speed="300"/>
<CelledAnimated2DActorFace name="vifill_kissu" repeat="1" file="\Landnam\AnimatiA\vifill\kissu" count="1" prepare="true" speed="300"/>

<CelledAnimated2DActorFace name="vifill_stoned" repeat="1" file="\Landnam\AnimatiA\vifill\stoned" count="6" prepare="true" speed="150"/>
<CelledAnimated2DActorFace name="vifill_vanish" repeat="1" file="\Landnam\AnimatiA\vifill\vanish" count="6" prepare="true" speed="150"/>
<CelledAnimated2DActorFace name="vifill_throw" repeat="1" file="\Landnam\AnimatiA\vifill\throw" count="4" prepare="true" xoffset="-77" yoffset="0" speed="150"/>

<Pseudo3DCollisionBox name="vifill_cb" x="100" y="15" z="292"/>

<MovingActor name="vifill" state="stop" terrain="t_Skipingolfsl" x="300" y="570" z="10" scaling="dynamic" save="true" random="true">
	<State name="stop" face="vifill_stop" collisionbox="vifill_cb"/>
	<State name="right" face="vifill_right" collisionbox="vifill_cb"/>
	<State name="left" face="vifill_left" collisionbox="vifill_cb"/>
	<State name="front" face="vifill_front" collisionbox="vifill_cb"/>
	<State name="back" face="vifill_back" collisionbox="vifill_cb"/>
	<State name="stop2right" face="vifill_stop2right" collisionbox="vifill_cb"/>
	<State name="stop2left" face="vifill_stop2left" collisionbox="vifill_cb"/>
	<State name="stop2back" face="vifill_stop2back" collisionbox="vifill_cb"/>

	<State name="kissu" face="vifill_kissu" collisionbox="vifill_cb"/>
	<State name="kissd" face="vifill_kissd" collisionbox="vifill_cb"/>
	<State name="stoned" face="vifill_stoned" collisionbox="vifill_cb"/>
	<State name="vanish" face="vifill_vanish" collisionbox="vifill_cb"/>
	<State name="throw" face="vifill_throw" collisionbox="vifill_cb"/>

	<State name="saell" face="vifill_talk" collisionbox="vifill_cb" mouth="m_saell"/>
	<State name="hannhefurveriddrepinn" face="vifill_talk" collisionbox="vifill_cb" mouth="m_hannhefurveriddrepinn"/>
	<State name="hvaderum" face="vifill_talk" collisionbox="vifill_cb" mouth="m_hvaderum"/>
	<State name="hvarerumvid" face="vifill_talk" collisionbox="vifill_cb" mouth="m_hvarerumvid"/>
	<State name="hvadaarer" face="vifill_talk" collisionbox="vifill_cb" mouth="m_hvadaarer"/>
	<State name="denniheitieg" face="vifill_talk" collisionbox="vifill_cb" mouth="m_denniheitieg"/>

	<State name="bless" face="vifill_talk" collisionbox="vifill_cb" mouth="m_bless"/>
	<State name="bless_river" face="vifill_talk" collisionbox="vifill_cb" mouth="m_bless_river"/>
	<State name="bless_rvk" face="vifill_talk" collisionbox="vifill_cb" mouth="m_bless_rvk"/>

	<State name="Look1" face="vifill_talk" mouth="m_Look1" collisionbox="vifill_cb"/>
	<State name="Look2" face="vifill_talk" mouth="m_Look2" collisionbox="vifill_cb"/>
	<State name="Look3" face="vifill_talk" mouth="m_Look3" collisionbox="vifill_cb"/>
	<State name="Look4" face="vifill_talk" mouth="m_Look4" collisionbox="vifill_cb"/>
	<State name="Look5" face="vifill_talk" mouth="m_Look5" collisionbox="vifill_cb"/>

	<State name="Talk1" face="vifill_talk" mouth="m_Talk1" collisionbox="vifill_cb"/>
	<State name="Talk2" face="vifill_talk" mouth="m_Talk2" collisionbox="vifill_cb"/>
	<State name="Talk3" face="vifill_talk" mouth="m_Talk3" collisionbox="vifill_cb"/>
	<State name="Talk4" face="vifill_talk" mouth="m_Talk4" collisionbox="vifill_cb"/>

	<State name="Take1" face="vifill_talk" mouth="m_Take1" collisionbox="vifill_cb"/>
	<State name="Take2" face="vifill_talk" mouth="m_Take2" collisionbox="vifill_cb"/>
	<State name="Take3" face="vifill_talk" mouth="m_Take3" collisionbox="vifill_cb"/>
	<State name="Take4" face="vifill_talk" mouth="m_Take4" collisionbox="vifill_cb"/>
	<State name="Take5" face="vifill_talk" mouth="m_Take5" collisionbox="vifill_cb"/>
	<State name="Take6" face="vifill_talk" mouth="m_Take6" collisionbox="vifill_cb"/>
	<State name="Take7" face="vifill_talk" mouth="m_Take7" collisionbox="vifill_cb"/>

	<State name="Use1" face="vifill_talk" mouth="m_Use1" collisionbox="vifill_cb"/>
	<State name="Use2" face="vifill_talk" mouth="m_Use2" collisionbox="vifill_cb"/>
	<State name="Use3" face="vifill_talk" mouth="m_Use3" collisionbox="vifill_cb"/>
	<State name="Use4" face="vifill_talk" mouth="m_Use4" collisionbox="vifill_cb"/>
	<State name="Use5" face="vifill_talk" mouth="m_Use5" collisionbox="vifill_cb"/>
	<State name="Use6" face="vifill_talk" mouth="m_Use6" collisionbox="vifill_cb"/>

	<State name="hvernigdattingolfi" face="vifill_talk" collisionbox="vifill_cb" mouth="m_hvernigdattingolfi"/>
	<State name="afhverjuheitir1" face="vifill_talk" collisionbox="vifill_cb" mouth="m_afhverjuheitir1"/>
	<State name="afhverjuheitir2" face="vifill_talk" collisionbox="vifill_cb" mouth="m_afhverjuheitir2"/>
	<State name="afhverjudrapu" face="vifill_talk" collisionbox="vifill_cb" mouth="m_afhverjudrapu"/>
	<State name="hvarerhjorleifur" face="vifill_talk" collisionbox="vifill_cb" mouth="m_hvarerhjorleifur"/>

	<State name="einhverjahugmynd" face="vifill_talk" collisionbox="vifill_cb" mouth="m_einhverjahugmynd"/>
	<State name="egnenniekki" face="vifill_talk" collisionbox="vifill_cb" mouth="m_egnenniekki"/>
	<State name="thadergott" face="vifill_kiss" collisionbox="vifill_cb" mouth="m_thadergott"/>

	<State name="draugabaerinn" face="vifill_talk" collisionbox="vifill_cb" mouth="m_draugabaerinn"/>
	<State name="gestrisni" face="vifill_talk" collisionbox="vifill_cb" mouth="m_gestrisni"/>
	<State name="honumadbana" face="vifill_talk" collisionbox="vifill_cb" mouth="m_honumadbana"/>
	<State name="lataingolfvita" face="vifill_talk" collisionbox="vifill_cb" mouth="m_lataingolfvita"/>
	<State name="holdumaframleitinni" face="vifill_talk" collisionbox="vifill_cb" mouth="m_holdumaframleitinni"/>

	<State name="fundumhjorleif" face="vifill_talk" collisionbox="vifill_cb" mouth="m_fundumhjorleif"/>
	<State name="nennumekki" face="vifill_talk" collisionbox="vifill_cb" mouth="m_nennumekki"/>
	<State name="villtumst" face="vifill_talk" collisionbox="vifill_cb" mouth="m_villtumst"/>
	<State name="asporid" face="vifill_talk" collisionbox="vifill_cb" mouth="m_asporid"/>

	<State name="syndayfir" face="vifill_talk" collisionbox="vifill_cb" mouth="m_syndayfir"/>
	<State name="smidadfleka" face="vifill_talk" collisionbox="vifill_cb" mouth="m_smidadfleka"/>
	<State name="ekkilengra" face="vifill_talk" collisionbox="vifill_cb" mouth="m_ekkilengra"/>

	<State name="sjadusulurnar" face="vifill_talk" collisionbox="vifill_cb" mouth="m_sjadusulurnar"/>


	<State name="neihaettunu" face="vifill_talk" collisionbox="vifill_cb" mouth="m_neihaettunu"/>
	<State name="tynast" face="vifill_talk" collisionbox="vifill_cb" mouth="m_tynast"/>
	<State name="tharfekki" face="vifill_talk" collisionbox="vifill_cb" mouth="m_tharfekki"/>
	<State name="ekkertmerkilegt" face="vifill_talk" collisionbox="vifill_cb" mouth="m_ekkertmerkilegt"/>

	<!-- insert -->
	<State name="ekkiveraadthessurugli" face="vifill_talk" collisionbox="vifill_cb" mouth="m_ekkiveraadthessurugli"/>
	<State name="bandidnaerekkitakiatrenu" face="vifill_talk" collisionbox="vifill_cb" mouth="m_bandidnaerekkitakiatrenu"/>
	<State name="bandidrennurafsteininum" face="vifill_talk" collisionbox="vifill_cb" mouth="m_bandidrennurafsteininum"/>
	<State name="bidduviderthettaekki" face="vifill_talk" collisionbox="vifill_cb" mouth="m_bidduviderthettaekki"/>
	<State name="efvidgaetumkomist" face="vifill_talk" collisionbox="vifill_cb" mouth="m_efvidgaetumkomist"/>
	<State name="egerekkithyrsturnuna" face="vifill_talk" collisionbox="vifill_cb" mouth="m_egerekkithyrsturnuna"/>
	<State name="eggaetialdreihaldidathessu" face="vifill_talk" collisionbox="vifill_cb" mouth="m_eggaetialdreihaldidathessu"/>
	<State name="eggetekkitogadtreidnidur" face="vifill_talk" collisionbox="vifill_cb" mouth="m_eggetekkitogadtreidnidur"/>
	<State name="ahugaverdurrunni" face="vifill_talk" collisionbox="vifill_cb" mouth="m_ahugaverdurrunni"/>
	<State name="enfallegurkadall" face="vifill_talk" collisionbox="vifill_cb" mouth="m_enfallegurkadall"/>
	<State name="fallegttre" face="vifill_talk" collisionbox="vifill_cb" mouth="m_fallegttre"/>
	<State name="ingolfurmyndibrjalast" face="vifill_talk" collisionbox="vifill_cb" mouth="m_ingolfurmyndibrjalast"/>
	<State name="neiegtharfekkithetta" face="vifill_talk" collisionbox="vifill_cb" mouth="m_neiegtharfekkithetta"/>
	<State name="neihaettunualveg" face="vifill_talk" collisionbox="vifill_cb" mouth="m_neihaettunualveg"/>
	<State name="neithettatharfegekki" face="vifill_talk" collisionbox="vifill_cb" mouth="m_neithettatharfegekki"/>
	<State name="oxinfestistekkividsteininn" face="vifill_talk" collisionbox="vifill_cb" mouth="m_oxinfestistekkividsteininn"/>
	<State name="thaderinnihusinu" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thaderinnihusinu"/>
	<State name="thadertunnur" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thadertunnur"/>
	<State name="thadvaerigamanadeiga" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thadvaerigamanadeiga"/>
	<State name="thettatvenntekki" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettatvenntekki"/>
	<State name="tilhversthennanhlut" face="vifill_talk" collisionbox="vifill_cb" mouth="m_tilhversthennanhlut"/>
	<State name="mikideruthettafalleg" face="vifill_talk" collisionbox="vifill_cb" mouth="m_mikideruthettafalleg"/>
	<State name="frabaertgreinin" face="vifill_talk" collisionbox="vifill_cb" mouth="m_frabaertgreinin"/>
	<State name="heyrdukarli" face="vifill_talk" collisionbox="vifill_cb" mouth="m_heyrdukarli"/>
	<State name="hunersvoupptekin" face="vifill_talk" collisionbox="vifill_cb" mouth="m_hunersvoupptekin"/>
	<State name="jaejanueregbuinn" face="vifill_talk" collisionbox="vifill_cb" mouth="m_jaejanueregbuinn"/>
	<State name="afsakduhusbondi" face="vifill_talk" collisionbox="vifill_cb" mouth="m_afsakduhusbondi"/>
	<State name="mikideruthettaljotir" face="vifill_talk" collisionbox="vifill_cb" mouth="m_mikideruthettaljotir"/>
	<State name="nueregbuinnadbinda" face="vifill_talk" collisionbox="vifill_cb" mouth="m_nueregbuinnadbinda"/>
	<State name="ondvegissulan" face="vifill_talk" collisionbox="vifill_cb" mouth="m_ondvegissulan"/>
	<State name="snjallraediegsker" face="vifill_talk" collisionbox="vifill_cb" mouth="m_snjallraediegsker"/>
	<State name="thadereitthvadovenjulegt" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thadereitthvadovenjulegt"/>
	<State name="thekkirthuekkiingolf" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thekkirthuekkiingolf"/>
	<State name="thessihnifurer" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thessihnifurer"/>
	<State name="thettaer" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaer"/>
	<State name="thettaerbaravenjulegurrunni" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaerbaravenjulegurrunni"/>
	<State name="thettaerhallveig" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaerhallveig"/>
	<State name="thettaernubarahann" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaernubarahann"/>
	<State name="thettaeroxin" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaeroxin"/>
	<State name="thettaeroxinhans" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaeroxinhans"/>
	<State name="thettaerreipidhans" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaerreipidhans"/>
	<State name="thettaertrjadrumburinn" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaertrjadrumburinn"/>
	<State name="thettaertrjagrein" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettaertrjagrein"/>
	<State name="thettavarrosalegt" face="vifill_talk" collisionbox="vifill_cb" mouth="m_thettavarrosalegt"/>
	<State name="eggetekkitogadtre" face="vifill_talk" collisionbox="vifill_cb" mouth="m_eggetekkitogadtre"/>
	<State name="afsakadu" face="vifill_talk" collisionbox="vifill_cb" mouth="m_afsakadu"/>
</MovingActor>
<ActorMoused actor="vifill" listener="sc" moving="Vífill" taking="Klappa mér" thf="Vífil"/>

<!-- Quanta -->
<StateQuantum name="q_stopvifill" actor="vifill" state="stop" wait="false"/>
<StopActorQuantum name="q_StoppVifill" actor="vifill"/>
<StateQuantum name="q_Vifill_kissd" actor="vifill" state="kissd" wait="true"/>
<StateQuantum name="q_Vifill_kissu" actor="vifill" state="kissu" wait="true"/>
<StateQuantum name="q_Vifill_throw" actor="vifill" state="throw" wait="true"/>
<StateQuantum name="q_Vifill_vanish" actor="vifill" state="vanish" wait="true"/>
<StateQuantum name="q_Vifill_stoned" actor="vifill" state="stoned" wait="true"/>
<StateQuantum name="q_Vifill_none" actor="vifill" state="none" wait="true"/>

<StateQuantum name="q_saell" actor="vifill" state="saell" wait="true"/>
<StateQuantum name="q_hannhefurveriddrepinn" actor="vifill" state="hannhefurveriddrepinn" wait="true"/>
<StateQuantum name="q_denniheitieg" actor="vifill" state="denniheitieg" wait="true"/>
<StateQuantum name="q_hvaderum" actor="vifill" state="hvaderum" wait="true"/>
<StateQuantum name="q_hvarerumvid" actor="vifill" state="hvarerumvid" wait="true"/>
<StateQuantum name="q_hvadaarer" actor="vifill" state="hvadaarer" wait="true"/>
<StateQuantum name="q_tilhversthennanhlut" actor="vifill" state="tilhversthennanhlut" wait="true"/>

<StateQuantum name="q_bless" actor="vifill" state="bless" wait="true"/>
<StateQuantum name="q_bless_river" actor="vifill" state="bless_river" wait="true"/>
<StateQuantum name="q_bless_rvk" actor="vifill" state="bless_rvk" wait="true"/>

<StateQuantum name="q_hvernigdattingolfi" actor="vifill" state="hvernigdattingolfi" wait="true"/>
<StateQuantum name="q_afhverjuheitir1" actor="vifill" state="afhverjuheitir1" wait="true"/>
<StateQuantum name="q_afhverjuheitir2" actor="vifill" state="afhverjuheitir2" wait="true"/>
<StateQuantum name="q_afhverjudrapu" actor="vifill" state="afhverjudrapu" wait="true"/>
<StateQuantum name="q_hvarerhjorleifur" actor="vifill" state="hvarerhjorleifur" wait="true"/>

<StateQuantum name="q_einhverjahugmynd" actor="vifill" state="einhverjahugmynd" wait="true"/>
<StateQuantum name="q_egnenniekki" actor="vifill" state="egnenniekki" wait="true"/>
<StateQuantum name="q_thadergott" actor="vifill" state="thadergott" wait="true"/>

<StateQuantum name="q_draugabaerinn" actor="vifill" state="draugabaerinn" wait="true"/>
<StateQuantum name="q_gestrisni" actor="vifill" state="gestrisni" wait="true"/>
<StateQuantum name="q_honumadbana" actor="vifill" state="honumadbana" wait="true"/>
<StateQuantum name="q_lataingolfvita" actor="vifill" state="lataingolfvita" wait="true"/>
<StateQuantum name="q_holdumaframleitinni" actor="vifill" state="holdumaframleitinni" wait="true"/>

<StateQuantum name="q_fundumhjorleif" actor="vifill" state="fundumhjorleif" wait="true"/>
<StateQuantum name="q_nennumekki" actor="vifill" state="nennumekki" wait="true"/>
<StateQuantum name="q_villtumst" actor="vifill" state="villtumst" wait="true"/>
<StateQuantum name="q_asporid" actor="vifill" state="asporid" wait="true"/>

<StateQuantum name="q_syndayfir" actor="vifill" state="syndayfir" wait="true"/>
<StateQuantum name="q_smidadfleka" actor="vifill" state="smidadfleka" wait="true"/>
<StateQuantum name="q_ekkilengra" actor="vifill" state="ekkilengra" wait="true"/>

<StateQuantum name="q_sjadusulurnar" actor="vifill" state="sjadusulurnar" wait="true"/>

<StateQuantum name="q_neihaettunu" actor="vifill" state="neihaettunu" wait="true"/>
<StateQuantum name="q_tynast" actor="vifill" state="tynast" wait="true"/>
<StateQuantum name="q_ekkertmerkilegt" actor="vifill" state="ekkertmerkilegt" wait="true"/>
<StateQuantum name="q_tharfekki" actor="vifill" state="tharfekki" wait="true"/>

<StateQuantum name="q_Look1" actor="vifill" state="Look1" wait="true"/>
<StateQuantum name="q_Look2" actor="vifill" state="Look2" wait="true"/>
<StateQuantum name="q_Look3" actor="vifill" state="Look3" wait="true"/>
<StateQuantum name="q_Look4" actor="vifill" state="Look4" wait="true"/>
<StateQuantum name="q_Look5" actor="vifill" state="Look5" wait="true"/>

<StateQuantum name="q_Talk1" actor="vifill" state="Talk1" wait="true"/>
<StateQuantum name="q_Talk2" actor="vifill" state="Talk2" wait="true"/>
<StateQuantum name="q_Talk3" actor="vifill" state="Talk3" wait="true"/>
<StateQuantum name="q_Talk4" actor="vifill" state="Talk4" wait="true"/>

<StateQuantum name="q_Use1" actor="vifill" state="Use1" wait="true"/>
<StateQuantum name="q_Use2" actor="vifill" state="Use2" wait="true"/>
<StateQuantum name="q_Use3" actor="vifill" state="Use3" wait="true"/>
<StateQuantum name="q_Use4" actor="vifill" state="Use4" wait="true"/>
<StateQuantum name="q_Use5" actor="vifill" state="Use5" wait="true"/>
<StateQuantum name="q_Use6" actor="vifill" state="Use6" wait="true"/>

<StateQuantum name="q_Take1" actor="vifill" state="Take1" wait="true"/>
<StateQuantum name="q_Take2" actor="vifill" state="Take2" wait="true"/>
<StateQuantum name="q_Take3" actor="vifill" state="Take3" wait="true"/>
<StateQuantum name="q_Take4" actor="vifill" state="Take4" wait="true"/>
<StateQuantum name="q_Take5" actor="vifill" state="Take5" wait="true"/>
<StateQuantum name="q_Take6" actor="vifill" state="Take6" wait="true"/>
<StateQuantum name="q_Take7" actor="vifill" state="Take7" wait="true"/>



<!-- insert -->
<StateQuantum name="q_ekkiveraadthessurugli" actor="vifill" state="ekkiveraadthessurugli" wait="true"/>
<StateQuantum name="q_afsakadu" actor="vifill" state="afsakadu" wait="true"/>
<StateQuantum name="q_bandidnaerekkitakiatrenu" actor="vifill" state="bandidnaerekkitakiatrenu" wait="true"/>
<StateQuantum name="q_bandidrennurafsteininum" actor="vifill" state="bandidrennurafsteininum" wait="true"/>
<StateQuantum name="q_bidduviderthettaekki" actor="vifill" state="bidduviderthettaekki" wait="true"/>
<StateQuantum name="q_efvidgaetumkomist" actor="vifill" state="efvidgaetumkomist" wait="true"/>
<StateQuantum name="q_egerekkithyrsturnuna" actor="vifill" state="egerekkithyrsturnuna" wait="true"/>
<StateQuantum name="q_eggaetialdreihaldidathessu" actor="vifill" state="eggaetialdreihaldidathessu" wait="true"/>
<StateQuantum name="q_eggetekkitogadtreidnidur" actor="vifill" state="eggetekkitogadtreidnidur" wait="true"/>
<StateQuantum name="q_ahugaverdurrunni" actor="vifill" state="ahugaverdurrunni" wait="true"/>
<StateQuantum name="q_enfallegurkadall" actor="vifill" state="enfallegurkadall" wait="true"/>
<StateQuantum name="q_fallegttre" actor="vifill" state="fallegttre" wait="true"/>
<StateQuantum name="q_ingolfurmyndibrjalast" actor="vifill" state="ingolfurmyndibrjalast" wait="true"/>
<StateQuantum name="q_neiegtharfekkithetta" actor="vifill" state="neiegtharfekkithetta" wait="true"/>
<StateQuantum name="q_neihaettunualveg" actor="vifill" state="neihaettunualveg" wait="true"/>
<StateQuantum name="q_neithettatharfegekki" actor="vifill" state="neithettatharfegekki" wait="true"/>
<StateQuantum name="q_oxinfestistekkividsteininn" actor="vifill" state="oxinfestistekkividsteininn" wait="true"/>
<StateQuantum name="q_thaderinnihusinu" actor="vifill" state="thaderinnihusinu" wait="true"/>
<StateQuantum name="q_thadertunnur" actor="vifill" state="thadertunnur" wait="true"/>
<StateQuantum name="q_thadvaerigamanadeiga" actor="vifill" state="thadvaerigamanadeiga" wait="true"/>
<StateQuantum name="q_thettatvenntekki" actor="vifill" state="thettatvenntekki" wait="true"/>
<StateQuantum name="q_mikideruthettafalleg" actor="vifill" state="mikideruthettafalleg" wait="true"/>
<StateQuantum name="q_frabaertgreinin" actor="vifill" state="frabaertgreinin" wait="true"/>
<StateQuantum name="q_heyrdukarli" actor="vifill" state="heyrdukarli" wait="true"/>
<StateQuantum name="q_hunersvoupptekin" actor="vifill" state="hunersvoupptekin" wait="true"/>
<StateQuantum name="q_jaejanueregbuinn" actor="vifill" state="jaejanueregbuinn" wait="true"/>
<StateQuantum name="q_afsakduhusbondi" actor="vifill" state="afsakduhusbondi" wait="true"/>
<StateQuantum name="q_mikideruthettaljotir" actor="vifill" state="mikideruthettaljotir" wait="true"/>
<StateQuantum name="q_nueregbuinnadbinda" actor="vifill" state="nueregbuinnadbinda" wait="true"/>
<StateQuantum name="q_ondvegissulan" actor="vifill" state="ondvegissulan" wait="true"/>
<StateQuantum name="q_snjallraediegsker" actor="vifill" state="snjallraediegsker" wait="true"/>
<StateQuantum name="q_thadereitthvadovenjulegt" actor="vifill" state="thadereitthvadovenjulegt" wait="true"/>
<StateQuantum name="q_thekkirthuekkiingolf" actor="vifill" state="thekkirthuekkiingolf" wait="true"/>
<StateQuantum name="q_thessihnifurer" actor="vifill" state="thessihnifurer" wait="true"/>
<StateQuantum name="q_thettaer" actor="vifill" state="thettaer" wait="true"/>
<StateQuantum name="q_thettaerbaravenjulegurrunni" actor="vifill" state="thettaerbaravenjulegurrunni" wait="true"/>
<StateQuantum name="q_thettaerhallveig" actor="vifill" state="thettaerhallveig" wait="true"/>
<StateQuantum name="q_thettaernubarahann" actor="vifill" state="thettaernubarahann" wait="true"/>
<StateQuantum name="q_thettaeroxin" actor="vifill" state="thettaeroxin" wait="true"/>
<StateQuantum name="q_thettaeroxinhans" actor="vifill" state="thettaeroxinhans" wait="true"/>
<StateQuantum name="q_thettaerreipidhans" actor="vifill" state="thettaerreipidhans" wait="true"/>
<StateQuantum name="q_thettaertrjadrumburinn" actor="vifill" state="thettaertrjadrumburinn" wait="true"/>
<StateQuantum name="q_thettaertrjagrein" actor="vifill" state="thettaertrjagrein" wait="true"/>
<StateQuantum name="q_thettavarrosalegt" actor="vifill" state="thettavarrosalegt" wait="true"/>
<StateQuantum name="q_eggetekkitogadtre" actor="vifill" state="eggetekkitogadtre" wait="true"/>

<!-- Misc anim Vifill (not to be scaled) -->
<CelledAnimated2DActorFace name="af_Vifill_YfirFljot" repeat="1" file="\Landnam\AnimatiA\vifill\yfirfljA" count="9" speed="500"/>

<MovingActor name="a_MiscVifill" state="stop" x="0" y="0" z="0">
	<State name="YfirFljot" face="af_Vifill_YfirFljot"/>
</MovingActor>

<!-- Quanta for Misc Vifill -->
<StateQuantum name="q_MiscVifill_stop" actor="a_MiscVifill" state="stop" wait="false"/>

<StateQuantum name="q_MiscVifill_YfirFljot" actor="a_MiscVifill" state="YfirFljot" wait="true"/>
<PrepareQuantum name="qp_YfirFljot" object="af_Vifill_YfirFljot" prepare="true"/>
<PrepareQuantum name="qu_YfirFljot" object="af_Vifill_YfirFljot" prepare="false"/>
<MoveActorQuantum name="q_MoveMiscVifill4YfirFljot" actor="a_MiscVifill" terrain="t_NordurThjorsa">
	<Location x="25" y="310" z="0"/> </MoveActorQuantum>

<!-- Karli -->

<Text name="a_Karli_acc" terrain="t_Corners" text=" " r="0" g="255" b="0" hilite="false"/>

<StaticActorFace name="karli_stop" file="\Landnam\AnimatiA\karli\stop" prepare="true"/>
<CelledAnimated2DActorFace name="karli_right" repeat="-1" file="\Landnam\AnimatiA\karli\right" count="8" prepare="true" speed="60"/>
<CelledAnimated2DActorFace name="karli_left" repeat="-1" file="\Landnam\AnimatiA\karli\left" count="8" prepare="true" speed="60"/>
<CelledAnimated2DActorFace name="karli_talk" repeat="-1" file="\Landnam\AnimatiA\karli\talk" count="5" prepare="true" speed="150" random="true"/>
<CelledAnimated2DActorFace name="Karli_sigh" repeat="1" file="\Landnam\AnimatiA\karli\sigh" count="4" prepare="true" speed="150"/>

<SpeechActorMouth name="m_vifill" file="\Landnam\Media\karli\hvad.wav" acc="a_Karli_acc">
	<Sentence text="Hvað!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ordinnendanlegarugladur" file="\Landnam\Media\karli\ordinneA.wav" acc="a_Karli_acc">
	<Sentence text="Denni?!? Ertu orðinn endanlega ruglaður Vífill?" time="0"/>
	<Sentence text="Ég heiti Karli og við erum þrælar Ingólfs Arnarsonar á leið til Íslands." time="3300"/>
	<Sentence text="Mér finnast þessar sjóferðir líka þreytandi ..." time="8600"/>
	<Sentence text="... en er þetta ekki einum of mikið af því góða?" time="10900"/> </SpeechActorMouth>
<SpeechActorMouth name="m_alltofspenntur" file="\Landnam\Media\karli\alltofsA.wav" acc="a_Karli_acc">
	<Sentence text="Þú ert allt of spenntur Vífill!" time="0"/>
	<Sentence text="Það hefur ekkert markvert gerst hér ..." time="2450"/>
	<Sentence text="... síðan við lögðum af stað frá Noregi í síðasta mánuði." time="4900"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ordinnalvarlegasjoveikur" file="\Landnam\Media\karli\ordinnaA.wav" acc="a_Karli_acc">
	<Sentence text="Ég held að þú sért orðinn alvarlega sjóveikur Vífill." time="0"/>
	<Sentence text="Rétt eins og í gær, fyrradag og marga daga þar á undan ..." time="3100"/>
	<Sentence text="... þá erum við á skipi Ingólfs Arnarsonar á leiðinni til Íslands ..." time="7150"/>
	<Sentence text="... til að nema land." time="11400"/> </SpeechActorMouth>
<SpeechActorMouth name="m_umthadbil874" file="\Landnam\Media\karli\umthadbA.wav" acc="a_Karli_acc">
	<Sentence text="Það er svona um það bil 874." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_buinnadgleyma" file="\Landnam\Media\karli\buinnadA.wav" acc="a_Karli_acc">
	<Sentence text="Ertu búinn að gleyma öllu?" time="0"/>
	<Sentence text="Ingólfur og Hjörleifur fóstbróðir hans ..." time="1900"/>
	<Sentence text="... urðu að láta Atla jarl fá allar sínar jarðir heima í Noregi ..." time="4600"/>
	<Sentence text="... til að ná sáttum við hann eftir að þeir drápu syni hans, Herstein og Hólmstein." time="8300"/>
	<Sentence text="Ingólfur og Hjörleifur ákváðu því að nema land á Íslandi ..." time="13600"/>
	<Sentence text="... sem Hrafna-Flóki fann og við fórum til í fyrrasumar ..." time="16900"/>
	<Sentence text="... með Ingólfi og Hjörleifi eins og þú manst." time="20000"/>
	<Sentence text="Við erum bara þrælar Ingólfs og getum engu ráðið um þetta." time="22500"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hetfyrstleifur" file="\Landnam\Media\karli\hetfyrsA.wav" acc="a_Karli_acc">
	<Sentence text="Hann hét fyrst Leifur en eftir að hann fór í víking til Írlands..." time="0"/>
	<Sentence text="... og fann þar lýsandi sverð hefur hann verið kallaður Hjörleifur." time="3400"/>
	<Sentence text="Hjör er nefnilega oft notað í ljóðum fyrir sverð." time="7500"/> </SpeechActorMouth>
<SpeechActorMouth name="m_naddoddurvikingurkom" file="\Landnam\Media\karli\naddoddA.wav" acc="a_Karli_acc">
	<Sentence text="Naddoddur víkingur kom fyrst til Íslands og nefndi það Snæland ..." time="0"/>
	<Sentence text="... því hann sá mikinn snjó á fjöllum." time="3700"/>
	<Sentence text="Síðan kom Garðar Svavarsson hinn sænski til landsins ..." time="6300"/>
	<Sentence text="... og kallaði Garðarshólma í höfuðið á sér." time="9350"/>
	<Sentence text="Hrafna-Flóki Vilgerðsson fór næst til landsins og sá ís í hafinu við landið ..." time="12500"/>
	<Sentence text="... og síðan hefur það verið kallað Ísland." time="17100"/> </SpeechActorMouth>
<SpeechActorMouth name="m_theirvoruvinir" file="\Landnam\Media\karli\theirvoA.wav" acc="a_Karli_acc">
	<Sentence text="Þeir voru vinir þangað til Hólmsteinn bað Helgu, systur Ingólfs." time="0"/>
	<Sentence text="Hjörleifur vildi líka eiga Helgu og varð mjög reiður." time="4600"/>
	<Sentence text="Skömmu seinna drápu Ingólfur og Hjörleifur þá Herstein og Hólmstein." time="8200"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hefurduekkitekid" file="\Landnam\Media\karli\hefurduA.wav" acc="a_Karli_acc">
	<Sentence text="Vífill! Hefurðu ekki tekið eftir skipinu ..." time="0"/>
	<Sentence text="... sem hefur siglt við hlið okkar frá því að við lögðum af stað frá Noregi?" time="3000"/> </SpeechActorMouth>

<SpeechActorMouth name="m_besttruad" file="\Landnam\Media\karli\besttruA.wav" acc="a_Karli_acc">
	<Sentence text="Ég gæti nú best trúað því að Ingólfur vilji sjá súlurnar sínar aftur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_lattuekkisvona" file="\Landnam\Media\karli\lattuekA.wav" acc="a_Karli_acc">
	<Sentence text="Láttu ekki svona Vífill." time="0"/>
	<Sentence text="Komum okkur af stað." time="1000"/> </SpeechActorMouth>

<SpeechActorMouth name="m_solarlandaferd" file="\Landnam\Media\karli\solarlaA.wav" acc="a_Karli_acc">
	<Sentence text="Það ber ekki mikið á Hjörleifi og hans fólki ..." time="0"/>
	<Sentence text="... ætli það sé í sólarlandaferð?" time="2900"/>
	<Sentence text="Nema þetta sé bara eins og þú segir ..." time="5100"/>
	<Sentence text="... eitthvert grín?!?!" time="6000"/> </SpeechActorMouth>
<SpeechActorMouth name="m_brugdidserfra" file="\Landnam\Media\karli\brugdidA.wav" acc="a_Karli_acc">
	<Sentence text="Fólkið hlýtur að hafa brugðið sér frá." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_onei" file="\Landnam\Media\karli\onei.wav" acc="a_Karli_acc">
	<Sentence text="Ónei, þarna liggur Hjörleifur, fóstbróðir Ingólfs, dauður!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_matareitrun" file="\Landnam\Media\karli\matareiA.wav" acc="a_Karli_acc">
	<Sentence text="Mér sýnist hann hafa fengið sverð í gegnum hjartað ..." time="0"/>
	<Sentence text="... en ég er náttúrúlega enginn sérfræðingur." time="3500"/>
	<Sentence text="Kannski var það matareitrun?!?" time="5700"/> </SpeechActorMouth>
<SpeechActorMouth name="m_thuraedur" file="\Landnam\Media\karli\thuraedA.wav" acc="a_Karli_acc">
	<Sentence text="Jú! Ætli það sé ekki ráðlegt. Þú ræður." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_tilosa" file="\Landnam\Media\karli\tilosa.wav" acc="a_Karli_acc">
	<Sentence text="Allar ár renna til ósa, en þær hljóta að eiga sér upptök einhvers staðar." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_thufyrst" file="\Landnam\Media\karli\thufyrst.wav" acc="a_Karli_acc">
	<Sentence text="Þú fyrst." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_fleka" file="\Landnam\Media\karli\fleka.wav" acc="a_Karli_acc">
	<Sentence text="Fleka? Í þessum straumi mundum við fljótt berast út í hafsauga." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_spurtingolf" file="\Landnam\Media\karli\spurtinA.wav" acc="a_Karli_acc">
	<Sentence text="Við gætum spurt Ingólf ráða!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ondvegissulur" file="\Landnam\Media\karli\ondvegiA.wav" acc="a_Karli_acc">
	<Sentence text="Öndvegissúlur? Er þetta ekki bara rekaviður?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_tilills" file="\Landnam\Media\karli\tilills.wav" acc="a_Karli_acc">
	<Sentence text="Til ills fórum vér um góð héruð er vér skulum byggja útnes þetta." time="0"/> </SpeechActorMouth>

<Pseudo3DCollisionBox name="karli_cb" x="102" y="15" z="220"/>

<MovingActor name="karli" state="stop" terrain="t_Skipingolfsl" x="500" y="570" z="10" scaling="dynamic" save="true" random="true">
	<State name="stop" face="karli_stop" collisionbox="karli_cb"/>
	<State name="left" face="karli_left" collisionbox="karli_cb"/>
	<State name="right" face="karli_right" collisionbox="karli_cb"/>

	<State name="sigh" face="Karli_sigh" collisionbox="karli_cb"/>

	<State name="vifill" face="karli_talk" collisionbox="karli_cb" mouth="m_vifill"/>
	<State name="ordinnendanlegarugladur" face="karli_talk" collisionbox="karli_cb" mouth="m_ordinnendanlegarugladur"/>
	<State name="alltofspenntur" face="karli_talk" collisionbox="karli_cb" mouth="m_alltofspenntur"/>
	<State name="ordinnalvarlegasjoveikur" face="karli_talk" collisionbox="karli_cb" mouth="m_ordinnalvarlegasjoveikur"/>
	<State name="umthadbil874" face="karli_talk" collisionbox="karli_cb" mouth="m_umthadbil874"/>
	<State name="buinnadgleyma" face="karli_talk" collisionbox="karli_cb" mouth="m_buinnadgleyma"/>
	<State name="hetfyrstleifur" face="karli_talk" collisionbox="karli_cb" mouth="m_hetfyrstleifur"/>
	<State name="naddoddurvikingurkom" face="karli_talk" collisionbox="karli_cb" mouth="m_naddoddurvikingurkom"/>
	<State name="theirvoruvinir" face="karli_talk" collisionbox="karli_cb" mouth="m_theirvoruvinir"/>
	<State name="hefurduekkitekid" face="karli_talk" collisionbox="karli_cb" mouth="m_hefurduekkitekid"/>

	<State name="besttruad" face="karli_talk" collisionbox="karli_cb" mouth="m_besttruad"/>
	<State name="lattuekkisvona" face="karli_talk" collisionbox="karli_cb" mouth="m_lattuekkisvona"/>

	<State name="solarlandaferd" face="karli_talk" collisionbox="karli_cb" mouth="m_solarlandaferd"/>
	<State name="brugdidserfra" face="karli_talk" collisionbox="karli_cb" mouth="m_brugdidserfra"/>
	<State name="onei" face="karli_talk" collisionbox="karli_cb" mouth="m_onei"/>
	<State name="matareitrun" face="karli_talk" collisionbox="karli_cb" mouth="m_matareitrun"/>
	<State name="thuraedur" face="karli_talk" collisionbox="karli_cb" mouth="m_thuraedur"/>

	<State name="tilosa" face="karli_talk" collisionbox="karli_cb" mouth="m_tilosa"/>
	<State name="thufyrst" face="karli_talk" collisionbox="karli_cb" mouth="m_thufyrst"/>
	<State name="fleka" face="karli_talk" collisionbox="karli_cb" mouth="m_fleka"/>
	<State name="spurtingolf" face="karli_talk" collisionbox="karli_cb" mouth="m_spurtingolf"/>

	<State name="ondvegissulur" face="karli_talk" collisionbox="karli_cb" mouth="m_ondvegissulur"/>
	<State name="tilills" face="karli_talk" collisionbox="karli_cb" mouth="m_tilills"/>
</MovingActor>

<ActorMoused actor="karli" listener="sc" moving="Karli" looking="Skoða Karla" taking="Hrinda Karla" talking="Tala við Karla" thf="Karla"/>

<!-- Conversation in ship, gollahofdi and hjollahofdi-->
<SentenceContainer name="conv_karli" scene="s_Skipingolfs" polygon="p_All" zmin="801" zmax="1500" save="true"/>
<UpdateQuantum name="q_hidetextkarli" terrain="conv_karli" show="false"/>
<UpdateQuantum name="q_showtextkarli" terrain="conv_karli" show="true"/>

<!-- Conversation at the river -->
<SentenceContainer name="conv_karli_river" scene="s_SudurThjorsa" polygon="p_All" zmin="801" zmax="1500" save="true"/>
<UpdateQuantum name="q_hidetextkarli_river" terrain="conv_karli_river" show="false"/>
<UpdateQuantum name="q_showtextkarli_river" terrain="conv_karli_river" show="true"/>

<!-- Conversation in Reykjavik -->
<SentenceContainer name="conv_karli_rvk" scene="s_Reykjavik" polygon="p_All" zmin="801" zmax="1500" save="true"/>
<UpdateQuantum name="q_hidetextkarli_rvk" terrain="conv_karli_rvk" show="false"/>
<UpdateQuantum name="q_showtextkarli_rvk" terrain="conv_karli_rvk" show="true"/>


<!-- Quanta -->
<StateQuantum name="q_stopkarli" actor="karli" state="stop" wait="false"/>
<StateQuantum name="q_Karli_Sigh" actor="karli" state="sigh" wait="true"/>

<StateQuantum name="q_vifill" actor="karli" state="vifill" wait="true"/>
<StateQuantum name="q_ordinnendanlegarugladur" actor="karli" state="ordinnendanlegarugladur" wait="true"/>
<StateQuantum name="q_alltofspenntur" actor="karli" state="alltofspenntur" wait="true"/>
<StateQuantum name="q_ordinnalvarlegasjoveikur" actor="karli" state="ordinnalvarlegasjoveikur" wait="true"/>
<StateQuantum name="q_umthadbil874" actor="karli" state="umthadbil874" wait="true"/>
<StateQuantum name="q_buinnadgleyma" actor="karli" state="buinnadgleyma" wait="true"/>
<StateQuantum name="q_hetfyrstleifur" actor="karli" state="hetfyrstleifur" wait="true"/>
<StateQuantum name="q_naddoddurvikingurkom" actor="karli" state="naddoddurvikingurkom" wait="true"/>
<StateQuantum name="q_theirvoruvinir" actor="karli" state="theirvoruvinir" wait="true"/>
<StateQuantum name="q_hefurduekkitekid" actor="karli" state="hefurduekkitekid" wait="true"/>

<StateQuantum name="q_besttruad" actor="karli" state="besttruad" wait="true"/>
<StateQuantum name="q_lattuekkisvona" actor="karli" state="lattuekkisvona" wait="true"/>

<StateQuantum name="q_solarlandaferd" actor="karli" state="solarlandaferd" wait="true"/>
<StateQuantum name="q_brugdidserfra" actor="karli" state="brugdidserfra" wait="true"/>
<StateQuantum name="q_onei" actor="karli" state="onei" wait="true"/>
<StateQuantum name="q_matareitrun" actor="karli" state="matareitrun" wait="true"/>
<StateQuantum name="q_thuraedur" actor="karli" state="thuraedur" wait="true"/>

<StateQuantum name="q_tilosa" actor="karli" state="tilosa" wait="true"/>
<StateQuantum name="q_thufyrst" actor="karli" state="thufyrst" wait="true"/>
<StateQuantum name="q_fleka" actor="karli" state="fleka" wait="true"/>
<StateQuantum name="q_spurtingolf" actor="karli" state="spurtingolf" wait="true"/>

<StateQuantum name="q_ondvegissulur" actor="karli" state="ondvegissulur" wait="true"/>
<StateQuantum name="q_tilills" actor="karli" state="tilills" wait="true"/>

<!-- Ingolfur -->
<StaticActorFace name="ingolfur_stop" file="\Landnam\AnimatiA\ingolfur\stop" prepare="true"/>
<StaticActorFace name="ingolfur_stop_ship" file="\Landnam\AnimatiA\ingolfur\stopship" prepare="true"/>

<StaticActorFace name="ingolfur_chopstop" file="\Landnam\AnimatiA\ingolfur\chopstop" prepare="true"/>
<CelledAnimated2DActorFace name="ingolfur_talk" repeat="-1" file="\Landnam\AnimatiA\ingolfur\talk" count="3" prepare="true" speed="150" random="true" xoffset="-25" yoffset="0"/>
<CelledAnimated2DActorFace name="ingolfur_chop" repeat="-1" file="\Landnam\AnimatiA\ingolfur\chop" count="3" prepare="true" speed="150"
	xoffset="-37" yoffset="-32"/>
<CelledAnimated2DActorFace name="ingolfur_choptalk" repeat="-1" file="\Landnam\AnimatiA\ingolfur\choptalk" count="4" prepare="true" speed="150" random="true"/>
<CelledAnimated2DActorFace name="ingolfur_shiptalk" repeat="-1" file="\Landnam\AnimatiA\ingolfur\shiptalk" count="3" prepare="true" speed="150" random="true"/>
<CelledAnimated2DActorFace name="ingolfur_ship_right" repeat="-1" file="\Landnam\AnimatiA\ingolfur\right" count="8" prepare="true" speed="150"/>
<CelledAnimated2DActorFace name="ingolfur_left" repeat="-1" file="\Landnam\AnimatiA\ingolfur\left" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="ingolfur_push" repeat="1" file="\Landnam\AnimatiA\ingolfur\push" count="10" prepare="true" speed="225"
	xoffset="0" yoffset="-60"/>
<CelledAnimated2DActorFace name="ingolfur_give" repeat="1" file="\Landnam\AnimatiA\ingolfur\give" count="5" prepare="true" speed="150"
	xoffset="-25" yoffset="-3"/>
<!--
<CelledAnimated2DActorFace name="ingolfur_stop2right" repeat="1" file="\Landnam\AnimatiA\ingolfur\stop2riA" count="1" prepare="true"/>
-->
<CelledAnimated2DActorFace name="ingolfur_back" repeat="-1" file="\Landnam\AnimatiA\ingolfur\back\back" count="6" prepare="true" speed="150"/>

<Text name="a_Ingolfur_acc" terrain="t_Corners" text=" " r="30" g="50" b="240" hilite="false"/>

<SpeechActorMouth name="m_skipsfelagarnusjaum" file="\Landnam\Media\ingolfur\skipsfeA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Skipsfélagar nú sjáum við loks til Íslands ..." time="0"/>
	<Sentence text="... og því er tími til kominn að kasta öndvegissúlum ..." time="3679"/>
	<Sentence text="... mínum fyrir borð til heilla." time="6766"/>
	<Sentence text="Mun ég reisa mér bú, stórt og mikið ..." time="8982"/>
	<Sentence text="... þar sem þær koma að landi." time="12278"/>
</SpeechActorMouth>


<SpeechActorMouth name="m_vifillogkarli" file="\Landnam\Media\ingolfur\vifilloA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Vífill og Karli!" time="0"/>
	<Sentence text="Ég fel ykkur það verkefni að finna öndvegissúlur mínar." time="1400"/>
	<Sentence text="Ef þið hittið Hjörleif fóstbróður minn ..." time="4700"/>
	<Sentence text="... sem kom vonandi að landi á sama tíma og við ..." time="7200"/>
	<Sentence text="... þá berið honum kveðju mína." time="10100"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ollumlikindum" file="\Landnam\Media\ingolfur\ollumliA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Þær eru að öllum líkindum vestanmegin við okkur." time="0"/>
	<Sentence text="Mér sýndist þær stefna þangað." time="3500"/> </SpeechActorMouth>

<SpeechActorMouth name="m_hafidthidfundid" file="\Landnam\Media\ingolfur\hafidthA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Hafið þið fundið öndvegissúlurnar mínar?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_illtidindi" file="\Landnam\Media\ingolfur\illtidiA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Það þykja mér ill tíðindi. Fylgið mér þangað strax!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_hortugheit" file="\Landnam\Media\ingolfur\hortughA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Hvaða hortugheit eru þetta, drengur. Er þér ekki annt um líf þitt?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_leitidivestri" file="\Landnam\Media\ingolfur\leitidiA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Leitið í vestri, þær eiga að vera þar." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_rettiandi" file="\Landnam\Media\ingolfur\rettianA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Þetta er hinn rétti andi. Leitið og þér munið finna." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_vestmennirnir" file="\Landnam\Media\ingolfur\vestmenA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Vestmennirnir, þrælar Hjörleifs, hafa greinilega orðið honum að bana." time="0"/>
	<Sentence text="Lítið lagðist hér fyrir góðan dreng er þrælar skyldu að bana verða ..." time="6300"/>
	<Sentence text="... og sé ég svo hverjum verða ef eigi vill blóta." time="11800"/>
	<Sentence text="Ég mun leita banamenn Hjörleifs uppi og hefna hans." time="15700"/>
	<Sentence text="Mér finnst líklegt að þeir hafi flúið til eyjanna hér fyrir sunnan land ..." time="21100"/>
	<Sentence text="... því skip Hjörleifs er horfið." time="25700"/>
	<Sentence text="Þið skuluð hins vegar halda áfram að leita að öndvegissúlunum." time="28900"/> </SpeechActorMouth>

<SpeechActorMouth name="m_velhafidthid" file="\Landnam\Media\ingolfur\velhafiA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Vel hafið þið þjónað mér." time="0"/>
	<Sentence text="Hér mun ég nema land." time="3800"/> </SpeechActorMouth>
<SpeechActorMouth name="m_tryggithraell" file="\Landnam\Media\ingolfur\tryggitA.wav" acc="a_Ingolfur_acc">
	<Sentence text="Vífill, minn tryggi þræll." time="0"/>
	<Sentence text="Þú hefur ávallt reynst mér vel ..." time="3700"/>
	<Sentence text="... og ég held að tími sé kominn til að þú fáir frelsi." time="6600"/> </SpeechActorMouth>

<Pseudo3DCollisionBox name="cb_ingolfur_skip" x="115" y="15" z="390"/>
<Pseudo3DCollisionBox name="cb_ingolfur" x="115" y="15" z="216"/>

<MovingActor name="ingolfur" state="none" x="125" y="1187" z="327" save="true" random="true" terrain="t_Ingolfshofdil">
	<State name="stop" face="ingolfur_stop" collisionbox="cb_ingolfur"/>
	<State name="left" face="ingolfur_left" collisionbox="cb_ingolfur"/>

	<State name="give" face="ingolfur_give" collisionbox="cb_ingolfur"/>
	<State name="chop" face="ingolfur_chop"/>
	<State name="chopstop" face="ingolfur_chopstop"/>
	<State name="vifillogkarli" face="ingolfur_choptalk" mouth="m_vifillogkarli"/>
	<State name="ollumlikindum" face="ingolfur_choptalk" mouth="m_ollumlikindum"/>
	<State name="hafidthidfundid" face="ingolfur_choptalk" mouth="m_hafidthidfundid"/>
	<State name="illtidindi" face="ingolfur_choptalk" mouth="m_illtidindi"/>
	<State name="hortugheit" face="ingolfur_choptalk" mouth="m_hortugheit"/>
	<State name="leitidivestri" face="ingolfur_choptalk" mouth="m_leitidivestri"/>
	<State name="rettiandi" face="ingolfur_choptalk" mouth="m_rettiandi"/>
	<State name="vestmennirnir" face="ingolfur_talk" collisionbox="cb_ingolfur" mouth="m_vestmennirnir"/>

	<State name="hafidthidfundid2" face="ingolfur_talk" collisionbox="cb_ingolfur" mouth="m_hafidthidfundid"/>
	<State name="hortugheit2" face="ingolfur_talk" collisionbox="cb_ingolfur" mouth="m_hortugheit"/>
	<State name="leitidivestri2" face="ingolfur_talk" collisionbox="cb_ingolfur" mouth="m_leitidivestri"/>
	<State name="rettiandi2" face="ingolfur_talk" collisionbox="cb_ingolfur" mouth="m_rettiandi"/>

	<State name="velhafidthid" face="ingolfur_talk" collisionbox="cb_ingolfur" mouth="m_velhafidthid"/>
	<State name="tryggithraell" face="ingolfur_talk" collisionbox="cb_ingolfur" mouth="m_tryggithraell"/>
</MovingActor>

<ActorMoused actor="ingolfur" listener="sc" moving="Ingólfur" looking="Skoða Ingólf" taking="Taka Ingólf" talking="Tala við Ingólf" thf="Ingólf"/>


<MovingActor name="ingolfur2" state="stop" x="125" y="1187" z="327" save="true">
	<State name="right" face="ingolfur_ship_right"/>
	<State name="back" face="ingolfur_back"/>
	<State name="stop" face="ingolfur_stop_ship"/>
	<State name="push" face="ingolfur_push"/>
	<State name="skipsfelagarnusjaum" face="ingolfur_shiptalk" mouth="m_skipsfelagarnusjaum"/>
</MovingActor>
<StateQuantum name="q_stopingolfur_ship" actor="ingolfur2" state="stop" wait="false"/>



<!-- Conversation -->
<SentenceContainer name="conv_ingo" scene="s_Skipingolfs" polygon="p_All" zmin="801" zmax="1500" save="true"/>

<UpdateQuantum name="q_hidetextingo" terrain="conv_ingo" show="false"/>
<UpdateQuantum name="q_showtextingo" terrain="conv_ingo" show="true"/>

<!-- Quanta -->
<StateQuantum name="q_hideingolfur" actor="ingolfur" state="none" wait="false"/>
<StateQuantum name="q_stopingolfur" actor="ingolfur" state="stop" wait="false"/>

<StateQuantum name="q_Ingolfur_ChopStop" actor="ingolfur" state="chopstop" wait="false"/>
<StateQuantum name="q_Ingolfur_Chop" actor="ingolfur" state="chop" wait="false"/>
<StateQuantum name="q_Ingolfur_push" actor="ingolfur2" state="push" wait="true"/>
<StateQuantum name="q_Ingolfur_give" actor="ingolfur" state="give" wait="true"/>

<StateQuantum name="q_skipsfelagarnusjaum" actor="ingolfur2" state="skipsfelagarnusjaum" wait="true"/>
<StateQuantum name="q_vifillogkarli" actor="ingolfur" state="vifillogkarli" wait="true"/>
<StateQuantum name="q_ollumlikindum" actor="ingolfur" state="ollumlikindum" wait="true"/>

<StateQuantum name="q_hafidthidfundid" actor="ingolfur" state="hafidthidfundid" wait="true"/>
<StateQuantum name="q_illtidindi" actor="ingolfur" state="illtidindi" wait="true"/>
<StateQuantum name="q_hortugheit" actor="ingolfur" state="hortugheit" wait="true"/>
<StateQuantum name="q_leitidivestri" actor="ingolfur" state="leitidivestri" wait="true"/>
<StateQuantum name="q_rettiandi" actor="ingolfur" state="rettiandi" wait="true"/>
<StateQuantum name="q_vestmennirnir" actor="ingolfur" state="vestmennirnir" wait="true"/>

<StateQuantum name="q_hafidthidfundid2" actor="ingolfur" state="hafidthidfundid2" wait="true"/>
<StateQuantum name="q_hortugheit2" actor="ingolfur" state="hortugheit2" wait="true"/>
<StateQuantum name="q_leitidivestri2" actor="ingolfur" state="leitidivestri2" wait="true"/>
<StateQuantum name="q_rettiandi2" actor="ingolfur" state="rettiandi2" wait="true"/>

<StateQuantum name="q_velhafidthid" actor="ingolfur" state="velhafidthid" wait="true"/>
<StateQuantum name="q_tryggithraell" actor="ingolfur" state="tryggithraell" wait="true"/>


<!-- Quanta -->
<Scene name="s_BeginScene"/>

<SimplePseudo3DTerrain name="t_BeginScene" scene="s_BeginScene" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>

<StaticActorFace name="af_BeginScene" file="\Landnam\Graphic\byrjunaA"/>
<StaticActor name="a_BeginScene" terrain="t_BeginScene" x="0" y="5000" z="5000" state="stop">
	<State name="stop" face="af_BeginScene"/>
</StaticActor>
<PrepareQuantum name="qp_BeginScene" object="af_BeginScene" prepare="true"/>
<PrepareQuantum name="qu_BeginScene" object="af_BeginScene" prepare="false"/>

<SwitchSceneQuantum name="q_ToBlack" scene="s_Black"/>
<SwitchSceneQuantum name="q_ToIngolfshofdi" scene="s_Ingolfshofdi"/>
<SwitchSceneQuantum name="q_ToMap" scene="s_Map"/>
<SwitchSceneQuantum name="q_ToHjorleifshofdi" scene="s_Hjorleifshofdi"/>
<SwitchSceneQuantum name="q_ToSudurThjorsa" scene="s_SudurThjorsa"/>
<SwitchSceneQuantum name="q_ToNordurThjorsa" scene="s_NordurThjorsa"/>
<SwitchSceneQuantum name="q_ToReykjavik" scene="s_Reykjavik"/>
<SwitchSceneQuantum name="q_ToSkipingolfs" scene="s_Skipingolfs"/>
<SwitchSceneQuantum name="q_ToBeginScene" scene="s_BeginScene"/>

<MoveActorQuantum name="q_MoveBush" actor="a_Bush"/>
<MoveActorQuantum name="q_MoveTre2" actor="a_Tre2"/>
<MoveActorQuantum name="q_MoveStubbur22NordurThjorsa" actor="a_Stubbur2" terrain="t_VesturNordurThjorsal"/>
<MoveActorQuantum name="q_MoveDrumbur" actor="a_Drumbur"/>
<MoveActorQuantum name="q_MoveDrumbur2NordurThjorsa" actor="a_Drumbur" terrain="t_NordurThjorsa"/>
<MoveActorQuantum name="q_MoveDrumburOgBand2NordurThjorsa" actor="a_DrumburOgBand" terrain="t_NordurThjorsa"/>
<MoveActorQuantum name="q_MoveSula1" actor="a_Sula1"/>
<MoveActorQuantum name="q_MoveSula2" actor="a_Sula2"/>
<MoveActorQuantum name="q_MoveSula3" actor="a_Sula3"/>
<MoveActorQuantum name="q_MoveVifill" actor="vifill"/>
<MoveActorQuantum name="q_MoveKarli" actor="karli"/>

<MoveActorQuantum name="q_MoveRope" actor="a_Rope"/>
<MoveActorQuantum name="q_MoveRope2Ingolfshofdi" actor="a_Rope" terrain="t_Ingolfshofdil">
	<Location x="740" y="475" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveRope2Inventory" actor="a_Rope" terrain="t_Inventory"/>

<MoveActorQuantum name="q_MoveAxe" actor="a_Axe"/>
<MoveActorQuantum name="q_MoveAxe2Ingolfshofdi" actor="a_Axe" terrain="t_Ingolfshofdil"/>
<MoveActorQuantum name="q_MoveAxe2Inventory" actor="a_Axe" terrain="t_Inventory"/>
<!-- kuðungur -->
<MoveActorQuantum name="q_MoveKudungur2Inventory" actor="a_Kudungur" terrain="t_Inventory"/>
<!-- kuðungur done -->
<MoveActorQuantum name="q_MoveAxeAndRope" actor="a_AxeAndRope"/>
<MoveActorQuantum name="q_MoveAxeAndRope2Inventory" actor="a_AxeAndRope" terrain="t_Inventory"/>

<!-- Skipingolfs -->
<MoveActorQuantum name="q_MoveIngolfur2Skipingolfs" actor="ingolfur2" terrain="t_Skipingolfs">
	<Location x="125" y="1187" z="327"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkVifillToKarliSkipingolfs" actor="vifill" x="375" y="570" wait="true"/>
<SetDestinationQuantum name="q_WalkIngolfurSkipIngolfs1" actor="ingolfur2" x="200" y="1130" wait="true" speed="130"/>
<SetDestinationQuantum name="q_WalkIngolfurSkipIngolfs2" actor="ingolfur2" x="165" y="520" wait="true" speed="130"/>
<SetDestinationQuantum name="q_WalkIngolfurSkipIngolfs3" actor="ingolfur2" x="415" y="500" wait="true" speed="130"/>

<!-- Ingolfshofdi -->
<MoveActorQuantum name="q_MoveVifill2Ingolfshofdi" actor="vifill" terrain="t_Ingolfshofdil">
	<Location x="150" y="550" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarli2Ingolfshofdi" actor="karli" terrain="t_Ingolfshofdil">
	<Location x="500" y="550" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveIngolfur2Ingolfshofdi" actor="ingolfur" terrain="t_Ingolfshofdil">
	<Location x="292" y="254" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveVifillHjorleifshofdi2Ingolfshofdi" actor="vifill" terrain="t_Ingolfshofdil">
	<Location x="-180" y="530" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarliHjorleifshofdi2Ingolfshofdi" actor="karli" terrain="t_Ingolfshofdil">
	<Location x="-60" y="550" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkVifillIngolfshofdi" actor="vifill" x="150" y="550" wait="false"/>
<SetDestinationQuantum name="q_WalkKarliIngolfshofdi" actor="karli" x="500" y="550" wait="true" speed="80"/>
<SetDestinationQuantum name="q_WalkVifillToKarliIngolfshofdi" actor="vifill" x="360" y="550" wait="true"/>
<SetDestinationQuantum name="q_WalkVifill2GolliIngolfshofdi" actor="vifill" x="200" y="480" wait="true"/>
<MoveActorQuantum name="q_MoveIngolfshofdi2HjorleifshofdiIn" actor="a_Ingolfshofdi2Hjorleifshofdi" terrain="t_Ingolfshofdil"/>
<MoveActorQuantum name="q_MoveIngolfshofdi2HjorleifshofdiOut" actor="a_Ingolfshofdi2Hjorleifshofdi"/>
<SetDestinationQuantum name="q_WalkVifillIngolfshofdiOut" actor="vifill" x="-60" y="550" wait="true"/>

<!-- Hjorleifshofdi -->
<MoveActorQuantum name="q_MoveVifillIngolfshofdi2Hjorleifshofdi" actor="vifill" terrain="t_Hjorleifshofdil">
	<Location x="845" y="290" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarliIngolfshofdi2Hjorleifshofdi" actor="karli" terrain="t_Hjorleifshofdil">
	<Location x="950" y="290" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveVifillSudurThjorsa2Hjorleifshofdi" actor="vifill" terrain="t_Hjorleifshofdil">
	<Location x="-220" y="500" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarliSudurThjorsa2Hjorleifshofdi" actor="karli" terrain="t_Hjorleifshofdil">
	<Location x="-100" y="550" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveIngolfur2Hjorleifshofdi" actor="ingolfur" terrain="t_Hjorleifshofdil">
	<Location x="860" y="290" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkVifillHjorleifshofdi" actor="vifill" x="310" y="450" wait="true"/>
<SetDestinationQuantum name="q_WalkKarliHjorleifshofdi" actor="karli" x="400" y="435" wait="false" speed="70"/>
<SetDestinationQuantum name="q_WalkVifillHjorleifshofdi2b" actor="vifill" x="310" y="450" wait="false"/>
<SetDestinationQuantum name="q_WalkKarliHjorleifshofdi2b" actor="karli" x="400" y="435" wait="true" speed="80"/>
<SetDestinationQuantum name="q_WalkIngolfurHjorleifshofdi" actor="ingolfur" x="500" y="470" wait="true"/>

<SetDestinationQuantum name="q_WalkVifill2GolliHjorleifshofdi" actor="vifill" x="350" y="510" wait="true"/>

<SetDestinationQuantum name="q_WalkVifillToKarliHjorleifshofdi1" actor="vifill" x="300" y="470" wait="true"/>
<SetDestinationQuantum name="q_WalkVifillToKarliHjorleifshofdi2" actor="vifill" x="300" y="450" wait="true"/>
<SetDestinationQuantum name="q_WalkVifillBush" actor="vifill" x="490" y="510" wait="true"/>
<SetDestinationQuantum name="q_WalkKarliBush" actor="karli" x="580" y="440" wait="true"/>
<MoveActorQuantum name="q_MoveHjorleifshofdi2IngolfshofdiIn" actor="a_Hjorleifshofdi2Ingolfshofdi" terrain="t_Hjorleifshofdil"/>
<MoveActorQuantum name="q_MoveHjorleifshofdi2IngolfshofdiOut" actor="a_Hjorleifshofdi2Ingolfshofdi"/>
<SetDestinationQuantum name="q_WalkVifillHjorleifshofdiOutRight" actor="vifill" x="860" y="330" wait="true"/>
<SetDestinationQuantum name="q_WalkVifillHjorleifshofdiOutLeft" actor="vifill" x="-60" y="480" wait="true"/>

<!-- deigur hnífur -->
<MoveActorQuantum name="q_MoveDeigurHnifur2Inventory" actor="a_DeigurHnifur" terrain="t_Inventory"/>
<!-- deigur hnífur done -->
<!-- blóm -->
<MoveActorQuantum name="q_MoveBlom2Inventory" actor="a_Blom" terrain="t_Inventory"/>
<!-- blóm done -->
<!-- stilkur -->
<MoveActorQuantum name="q_MoveStilkur2Inventory" actor="a_Stilkur" terrain="t_Inventory"/>


<!-- SudurThjorsa -->
<MoveActorQuantum name="q_MoveVifillHjorleifshofdi2SudurThjorsa" actor="vifill" terrain="t_SudurThjorsal">
	<Location x="900" y="1100" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarliHjorleifshofdi2SudurThjorsa" actor="karli" terrain="t_SudurThjorsal">
	<Location x="1020" y="1100" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkKarli2SudurThjorsaA" actor="karli" speed="70" x="580" y="1100" wait="false"/>
<SetDestinationQuantum name="q_WalkVifill2SudurThjorsaA" actor="vifill" x="450" y="1100" wait="true"/>
<MoveActorQuantum name="q_MoveVifillNordurThjorsa2SudurThjorsa" actor="vifill" terrain="t_SudurThjorsal">
	<Location x="530" y="-30" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarliNordurThjorsa2SudurThjorsa" actor="karli" terrain="t_SudurThjorsal">
	<Location x="580" y="1100" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkVifillToKarliSudurThjorsa" actor="vifill" x="450" y="1100" wait="true"/>
<MoveActorQuantum name="q_MoveSudurThjorsa2HjorleifshofdiIn" actor="a_SudurThjorsa2Hjorleifshofdi" terrain="t_SudurThjorsal"/>
<MoveActorQuantum name="q_MoveSudurThjorsa2HjorleifshofdiOut" actor="a_SudurThjorsa2Hjorleifshofdi"/>
<SetDestinationQuantum name="q_WalkVifillSudurThjorsaOutRight" actor="vifill" x="860" y="1180" wait="true"/>
<MoveActorQuantum name="q_MoveSudurThjorsa2NordurThjorsaIn" actor="a_SudurThjorsa2NordurThjorsa" terrain="t_SudurThjorsal"/>
<MoveActorQuantum name="q_MoveSudurThjorsa2NordurThjorsaOut" actor="a_SudurThjorsa2NordurThjorsa"/>
<SetDestinationQuantum name="q_WalkVifillSudurThjorsaOutUp" actor="vifill" x="520" y="-60" wait="true"/>

<!-- NordurThjorsa -->
<MoveActorQuantum name="q_MoveVifill2NordurThjorsa" actor="vifill" terrain="t_AusturNordurThjorsal">
	<Location x="880" y="1030" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarli2NordurThjorsa" actor="karli" terrain="t_AusturNordurThjorsal">
	<Location x="1000" y="975" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarli2SudurThjorsaBB" actor="karli" terrain="t_SudurThjorsal">
	<Location x="610" y="275" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkVifill2SudurThjorsaBB" actor="vifill" x="515" y="305" wait="true"/>
<SetDestinationQuantum name="q_WalkVifillToKarliSudurThjorsa8" actor="vifill" x="535" y="265" wait="true"/>
<SetDestinationQuantum name="q_WalkVifillThrow" actor="vifill" x="400" y="625" wait="true"/>

<MoveActorQuantum name="q_ShowVifillAtAusturThjorsa" actor="vifill" terrain="t_AusturNordurThjorsal">
	<Location x="192" y="520" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_ShowKarliAtAusturThjorsa" actor="karli" terrain="t_AusturNordurThjorsal">
	<Location x="50" y="726" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkVifillOutAusturThjorsa" actor="vifill" x="-150" y="656" wait="true"/>
<SetDestinationQuantum name="q_WalkKarliOutAusturThjorsa" actor="karli" x="-150" y="736" wait="false"/>

<SetDestinationQuantum name="q_WalkKarliNordurThjorsa" actor="karli" x="520" y="700" wait="true"/>

<SetDestinationQuantum name="q_WalkKarli2NordurThjorsaA" actor="karli" x="655" y="635" wait="false"/>
<SetDestinationQuantum name="q_WalkVifill2NordurThjorsaA" actor="vifill" x="580" y="665" wait="true"/>

<SetDestinationQuantum name="q_WalkVifillToKarliNordurThjorsa" actor="vifill" x="590" y="665" wait="true"/>
<MoveActorQuantum name="q_MoveNordurThjorsa2SudurThjorsaIn" actor="a_NordurThjorsa2SudurThjorsa" terrain="t_AusturNordurThjorsal"/>
<MoveActorQuantum name="q_MoveNordurThjorsa2SudurThjorsaOut" actor="a_NordurThjorsa2SudurThjorsa"/>
<SetDestinationQuantum name="q_WalkVifillNordurThjorsaOutDown" actor="vifill" x="920" y="1190" wait="true"/>


<!-- Reykjavik -->
<MoveActorQuantum name="q_MoveVifill2Reykjavik" actor="vifill" terrain="t_Reykjavikl">
	<Location x="900" y="530" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKarli2Reykjavik" actor="karli" terrain="t_Reykjavikl">
	<Location x="1010" y="525" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkKarli2ReykjavikA" actor="karli" speed="75" x="630" y="525" wait="false"/>
<SetDestinationQuantum name="q_WalkVifill2ReykjavikA" actor="vifill" x="560" y="530" wait="true"/>

<MoveActorQuantum name="q_MoveIngolfur2Reykjavik" actor="ingolfur" terrain="t_Reykjavikl">
	<Location x="960" y="480" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkVifillToKarliReykjavik" actor="vifill" x="560" y="530" wait="true"/>
<SetDestinationQuantum name="q_WalkGolli2TalkSpot" actor="ingolfur" x="650" y="480" wait="true"/>
<SetDestinationQuantum name="q_WalkVifill2GolliReykjavik" actor="vifill" x="550" y="512" wait="true"/>

<SetDestinationQuantum name="q_WalkVifillReykjavikOutRight" actor="vifill" x="900" y="520" wait="true"/>
<SetDestinationQuantum name="q_WalkKarliReykjavikOutRight" actor="karli" x="900" y="520" wait="true"/>

<MoveTerrainQuantum name="q_MoveConvKarli2Ingolfshofdi" terrain="conv_karli" scene="s_Ingolfshofdi"/>
<MoveTerrainQuantum name="q_MoveConvKarli2Hjorleifshofdi" terrain="conv_karli" scene="s_Hjorleifshofdi"/>
<MoveTerrainQuantum name="q_MoveConvKarli_River2NordurThjorsa" terrain="conv_karli_river" scene="s_NordurThjorsa"/>
<MoveTerrainQuantum name="q_MoveConvKarli_River2SudurThjorsa" terrain="conv_karli_river" scene="s_SudurThjorsa"/>
<MoveTerrainQuantum name="q_MoveConvIngo2Ingolfshofdi" terrain="conv_ingo" scene="s_Ingolfshofdi"/>
<MoveTerrainQuantum name="q_MoveConvIngo2Hjorleifshofdi" terrain="conv_ingo" scene="s_Hjorleifshofdi"/>

<UpdateQuantum name="q_UpdateInventory" terrain="t_Inventory" show="true"/>

<Sequence name="su_Hjorleifshofdi">
	<Quantum name="qu_Hjorleifshofdi0"/>
	<Quantum name="qu_Hjorleifshofdi1"/>
	<Quantum name="qu_Hjorleifshofdi2"/>
	<Quantum name="qu_Hjorleifshofdi3"/>
	<Quantum name="qu_Hjorleifshofdi4"/>
</Sequence>
<CheckConditionQuantum name="qu_Hjorleifshofdi" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Hjorleifshofdi"/>
</CheckConditionQuantum>

<Sequence name="sp_Hjorleifshofdi">
	<Quantum name="qp_Hjorleifshofdi0"/>
	<Quantum name="qp_Hjorleifshofdi1"/>
	<Quantum name="qp_Hjorleifshofdi2"/>
	<Quantum name="qp_Hjorleifshofdi3"/>
	<Quantum name="qp_Hjorleifshofdi4"/>
</Sequence>
<CheckConditionQuantum name="qp_Hjorleifshofdi" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Hjorleifshofdi"/>
</CheckConditionQuantum>

<Sequence name="su_Skipingolfs">
	<Quantum name="qu_Skipingolfs0"/>
	<Quantum name="qu_Skipingolfs1"/>
	<Quantum name="qu_Skipingolfs2"/>
	<Quantum name="qu_Skipingolfs3"/>
	<Quantum name="qu_Skipingolfs4"/>
</Sequence>
<CheckConditionQuantum name="qu_Skipingolfs" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Skipingolfs"/>
</CheckConditionQuantum>

<Sequence name="sp_Skipingolfs">
	<Quantum name="qp_Skipingolfs0"/>
	<Quantum name="qp_Skipingolfs1"/>
	<Quantum name="qp_Skipingolfs2"/>
	<Quantum name="qp_Skipingolfs3"/>
	<Quantum name="qp_Skipingolfs4"/>
</Sequence>
<CheckConditionQuantum name="qp_Skipingolfs" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Skipingolfs"/>
</CheckConditionQuantum>

<Sequence name="su_Ingolfshofdi">
	<Quantum name="qu_Ingolfshofdi1"/>
	<Quantum name="qu_Ingolfshofdi2"/>
	<Quantum name="qu_Ingolfshofdi3"/>
	<Quantum name="qu_Ingolfshofdi4"/>
	<Quantum name="qu_Ingolfshofdi5"/>
	<Quantum name="qu_Ingolfshofdi6"/>
	<Quantum name="qu_Ingolfshofdi7"/>
</Sequence>
<CheckConditionQuantum name="qu_Ingolfshofdi" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Ingolfshofdi"/>
</CheckConditionQuantum>

<Sequence name="sp_Ingolfshofdi">
	<Quantum name="qp_Ingolfshofdi1"/>
	<Quantum name="qp_Ingolfshofdi2"/>
	<Quantum name="qp_Ingolfshofdi3"/>
	<Quantum name="qp_Ingolfshofdi4"/>
	<Quantum name="qp_Ingolfshofdi5"/>
	<Quantum name="qp_Ingolfshofdi6"/>
	<Quantum name="qp_Ingolfshofdi7"/>
</Sequence>
<CheckConditionQuantum name="qp_Ingolfshofdi" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Ingolfshofdi"/>
</CheckConditionQuantum>

<Sequence name="su_Reykjavik">
	<Quantum name="qu_Reykjavik1"/>
	<Quantum name="qu_Reykjavik2"/>
	<Quantum name="qu_Reykjavik3"/>
	<Quantum name="qu_Reykjavik4"/>
	<Quantum name="qu_Reykjavik5"/>
	<Quantum name="qu_Reykjavik6"/>
</Sequence>
<CheckConditionQuantum name="qu_Reykjavik" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Reykjavik"/>
</CheckConditionQuantum>

<Sequence name="sp_Reykjavik">
	<Quantum name="qp_Reykjavik1"/>
	<Quantum name="qp_Reykjavik2"/>
	<Quantum name="qp_Reykjavik3"/>
	<Quantum name="qp_Reykjavik4"/>
	<Quantum name="qp_Reykjavik5"/>
	<Quantum name="qp_Reykjavik6"/>
</Sequence>
<CheckConditionQuantum name="qp_Reykjavik" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Reykjavik"/>
</CheckConditionQuantum>

<Sequence name="su_NordurThjorsa">
	<Quantum name="qu_NordurThjorsa1"/>
	<Quantum name="qu_NordurThjorsa2"/>
	<Quantum name="qu_NordurThjorsa3"/>
	<Quantum name="qu_NordurThjorsa4"/>
	<Quantum name="qu_NordurThjorsa5"/>
	<Quantum name="qu_NordurThjorsa6"/>
	<Quantum name="qu_NordurThjorsa7"/>
	<Quantum name="qu_NordurThjorsa8"/>
</Sequence>
<CheckConditionQuantum name="qu_NordurThjorsa" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_NordurThjorsa"/>
</CheckConditionQuantum>

<Sequence name="sp_NordurThjorsa">
	<Quantum name="qp_NordurThjorsa1"/>
	<Quantum name="qp_NordurThjorsa2"/>
	<Quantum name="qp_NordurThjorsa3"/>
	<Quantum name="qp_NordurThjorsa4"/>
	<Quantum name="qp_NordurThjorsa5"/>
	<Quantum name="qp_NordurThjorsa6"/>
	<Quantum name="qp_NordurThjorsa7"/>
	<Quantum name="qp_NordurThjorsa8"/>
</Sequence>
<CheckConditionQuantum name="qp_NordurThjorsa" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_NordurThjorsa"/>
</CheckConditionQuantum>

<Sequence name="su_SudurThjorsa">
	<Quantum name="qu_SudurThjorsa1"/>
	<Quantum name="qu_SudurThjorsa2"/>
	<Quantum name="qu_SudurThjorsa3"/>
	<Quantum name="qu_SudurThjorsa4"/>
</Sequence>
<CheckConditionQuantum name="qu_SudurThjorsa" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_SudurThjorsa"/>
</CheckConditionQuantum>

<Sequence name="sp_SudurThjorsa">
	<Quantum name="qp_SudurThjorsa1"/>
	<Quantum name="qp_SudurThjorsa2"/>
	<Quantum name="qp_SudurThjorsa3"/>
	<Quantum name="qp_SudurThjorsa4"/>
</Sequence>
<CheckConditionQuantum name="qp_SudurThjorsa" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_SudurThjorsa"/>
</CheckConditionQuantum>

<Sequence name="su_Map">
	<Quantum name="qu_Map1"/>
	<Quantum name="qu_Map2"/>
	<Quantum name="qu_Map3"/>
	<Quantum name="qu_Map4"/>
	<Quantum name="qu_Map5"/>
	<Quantum name="qu_Map6"/>
	<Quantum name="qu_Map7"/>
	<Quantum name="qu_Map8"/>
	<Quantum name="qu_Map10"/>
	<Quantum name="qu_Map11"/>
</Sequence>
<CheckConditionQuantum name="qu_Map" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Map"/>
</CheckConditionQuantum>

<Sequence name="sp_Map">
	<Quantum name="qp_Map1"/>
	<Quantum name="qp_Map2"/>
	<Quantum name="qp_Map3"/>
	<Quantum name="qp_Map4"/>
	<Quantum name="qp_Map5"/>
	<Quantum name="qp_Map6"/>
	<Quantum name="qp_Map7"/>
	<Quantum name="qp_Map8"/>
	<Quantum name="qp_Map10"/>
	<Quantum name="qp_Map11"/>
</Sequence>
<CheckConditionQuantum name="qp_Map" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Map"/>
</CheckConditionQuantum>

<JMFActorMouth name="m_Splass" file="\tyrkjarA\Media\sfx\splass.wav" />
<JMFActorMouth name="m_Donk" file="\landnam\Media\sfx\donk.wav" />
<JMFActorMouth name="m_Hverfur" file="\sidaskiA\Media\sfx\hverfur.wav" />
<StaticActor name="a_SFX" x="0" y="0" z="0" state="stop">
	<State name="splass" mouth="m_Splass"/>
	<State name="donk" mouth="m_Donk"/>
	<State name="hverfur" mouth="m_Hverfur"/>
</StaticActor>
<StateQuantum name="q_StopSFX" actor="a_SFX" state="stop" wait="false"/>
<StateQuantum name="q_PlaySplass" actor="a_SFX" state="splass" wait="false"/>
<StateQuantum name="q_PlayHverfur" actor="a_SFX" state="hverfur" wait="false"/>
<StateQuantum name="q_PlayDonk" actor="a_SFX" state="donk" wait="false"/>

<Sequence name="sr_Look1">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thadvaerigamanadeiga"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/>
</Sequence>

<Sequence name="sr_Look2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Look2"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/>
</Sequence>

<Sequence name="sr_Look3">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Look3"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/>
</Sequence>

<Sequence name="sr_Look4">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Look4"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/>
</Sequence>

<Sequence name="sr_Look5">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Look1"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/>
</Sequence>

<Sequence name="sr_Look6">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Look5"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/>
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
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neihaettunualveg"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_talking"/>
</Sequence>

<Sequence name="sr_Talk2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neihaettunu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_talking"/>
</Sequence>

<Sequence name="sr_Talk3">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Talk3"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_talking"/>
</Sequence>

<Sequence name="sr_Talk4">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Talk4"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_talking"/>
</Sequence>

<Sequence name="sr_Talk5">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Talk1"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_talking"/>
</Sequence>

<Sequence name="sr_Talk6">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Talk2"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_talking"/>
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
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ekkiveraadthessurugli"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettatvenntekki"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use3">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neihaettunu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use4">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Use4"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use5">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Use5"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use6">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Use6"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use7">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Use1"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use8">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Use2"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Use9">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Use3"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
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
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_eggaetialdreihaldidathessu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neiegtharfekkithetta"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take3">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neithettatharfegekki"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take4">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thadvaerigamanadeiga"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take5">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_tilhversthennanhlut"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take6">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_tharfekki"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take7">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take7"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take8">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take6"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take9">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take5"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take10">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take4"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take11">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take3"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take12">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take2"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
</Sequence>

<Sequence name="sr_Take13">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take1"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/>
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


<!-- Conversations -->
<!-- Conversation with Karli -->

<Text name="hvaderum" text="Hvað er um að vera?" terrain="conv_karli" color="white"/>
	<ActorMoused actor="hvaderum" listener="sc"/>
<Text name="hvarerumvid" text="Hvar erum við?" terrain="conv_karli" color="white"/>
	<ActorMoused actor="hvarerumvid" listener="sc"/>
<Text name="hvadaarer" text="Hvaða ár er eiginlega?" terrain="conv_karli" color="white"/>
	<ActorMoused actor="hvadaarer" listener="sc"/>
<Text name="bless" text="Bless!" terrain="conv_karli" color="white"/>
	<ActorMoused actor="bless" listener="sc"/>
<Text name="bless_river" text="Bless!" terrain="conv_karli_river" color="white"/>
	<ActorMoused actor="bless_river" listener="sc"/>
<Text name="bless_rvk" text="Bless!" terrain="conv_karli_rvk" color="white"/>
	<ActorMoused actor="bless_rvk" listener="sc"/>


<Text name="hvernigdattingolfi" text="Hvernig datt Ingólfi í hug að nema land á Íslandi!?" color="white"/>
	<ActorMoused actor="hvernigdattingolfi" listener="sc"/>
<Text name="afhverjuheitir1" text="Af hverju heitir fóstbróðir Ingólfs Hjörleifur?" color="white"/>
	<ActorMoused actor="afhverjuheitir1" listener="sc"/>
<Text name="afhverjuheitir2" text="Af hverju heitir landið Ísland?" color="white"/>
	<ActorMoused actor="afhverjuheitir2" listener="sc"/>
<Text name="afhverjudrapu" text="Af hverju drápu Ingólfur og Hjörleifur Hólmstein og Herstein, syni Atla jarls?" color="white"/>
	<ActorMoused actor="afhverjudrapu" listener="sc"/>
<Text name="hvarerhjorleifur" text="Hvar er Hjörleifur?" color="white"/>
	<ActorMoused actor="hvarerhjorleifur" listener="sc"/>

<Text name="egnenniekki" text="Ég nenni ekki að leita að þessum öndvegissúlum!" color="white"/>
	<ActorMoused actor="egnenniekki" listener="sc"/>
<Text name="thadergott" text="Það er gott að vera kominn með fast land undir fæturna, hér vil ég vera!" color="white"/>
	<ActorMoused actor="thadergott" listener="sc"/>

<Text name="draugabaerinn" text="Þetta er nú meiri draugabærinn!" color="white"/>
	<ActorMoused actor="draugabaerinn" listener="sc"/>
<Text name="gestrisni" text="Hvers konar gestrisni er þetta eiginlega?!" color="white"/>
	<ActorMoused actor="gestrisni" listener="sc"/>
<Text name="honumadbana" text="Hvað ætli hafi orðið honum að bana?" color="white"/>
	<ActorMoused actor="honumadbana" listener="sc"/>
<Text name="lataingolfvita" text="Þurfum við ekki að láta Ingólf vita?" color="white"/>
	<ActorMoused actor="lataingolfvita" listener="sc"/>
<Text name="holdumaframleitinni" text="Höldum áfram að leita að súlunum." color="white"/>
	<ActorMoused actor="holdumaframleitinni" listener="sc"/>

<Text name="syndayfir" text="Eigum við ekki bara að synda yfir?" terrain="conv_karli_river" color="white"/>
	<ActorMoused actor="syndayfir" listener="sc"/>
<Text name="smidadfleka" text="Gætum við ekki smíðað fleka?" terrain="conv_karli_river" color="white"/>
	<ActorMoused actor="smidadfleka" listener="sc"/>
<Text name="ekkilengra" text="Nú komumst við ekki lengra upp með ánni. Kanntu einhver ráð?" color="white"/>
	<ActorMoused actor="ekkilengra" listener="sc"/>

<Text name="sjadusulurnar" text="Sjáðu allar öndvegissúlurnar!" terrain="conv_karli_rvk" color="white"/>
	<ActorMoused actor="sjadusulurnar" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="q_hhvaderum" actor="hvaderum"/>
<MoveActorQuantum name="q_hhvarerumvid" actor="hvarerumvid"/>
<MoveActorQuantum name="q_hhvadaarer" actor="hvadaarer"/>
<MoveActorQuantum name="q_hbless" actor="bless"/>
<MoveActorQuantum name="q_hbless_river" actor="bless_river"/>
<MoveActorQuantum name="q_hbless_rvk" actor="bless_rvk"/>

<MoveActorQuantum name="q_hhvernigdattingolfi" actor="hvernigdattingolfi"/>
<MoveActorQuantum name="q_hafhverjuheitir1" actor="afhverjuheitir1"/>
<MoveActorQuantum name="q_hafhverjuheitir2" actor="afhverjuheitir2"/>
<MoveActorQuantum name="q_hafhverjudrapu" actor="afhverjudrapu"/>
<MoveActorQuantum name="q_hhvarerhjorleifur" actor="hvarerhjorleifur"/>

<MoveActorQuantum name="q_hegnenniekki" actor="egnenniekki"/>
<MoveActorQuantum name="q_hthadergott" actor="thadergott"/>

<MoveActorQuantum name="q_hdraugabaerinn" actor="draugabaerinn"/>
<MoveActorQuantum name="q_hgestrisni" actor="gestrisni"/>
<MoveActorQuantum name="q_hhonumadbana" actor="honumadbana"/>
<MoveActorQuantum name="q_hlataingolfvita" actor="lataingolfvita"/>
<MoveActorQuantum name="q_hholdumaframleitinni" actor="holdumaframleitinni"/>

<MoveActorQuantum name="q_hsyndayfir" actor="syndayfir"/>
<MoveActorQuantum name="q_hsmidadfleka" actor="smidadfleka"/>
<MoveActorQuantum name="q_hekkilengra" actor="ekkilengra"/>

<MoveActorQuantum name="q_hsjadusulurnar" actor="sjadusulurnar"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="q_sbless_river" actor="bless_river" terrain="conv_karli_river"/>
<MoveActorQuantum name="q_sbless_rvk" actor="bless_rvk" terrain="conv_karli_rvk"/>


<MoveActorQuantum name="q_shvernigdattingolfi" actor="hvernigdattingolfi" terrain="conv_karli"/>
<MoveActorQuantum name="q_safhverjuheitir1" actor="afhverjuheitir1" terrain="conv_karli"/>
<MoveActorQuantum name="q_safhverjuheitir2" actor="afhverjuheitir2" terrain="conv_karli"/>
<MoveActorQuantum name="q_safhverjudrapu" actor="afhverjudrapu" terrain="conv_karli"/>
<MoveActorQuantum name="q_shvarerhjorleifur" actor="hvarerhjorleifur" terrain="conv_karli"/>

<MoveActorQuantum name="q_segnenniekki" actor="egnenniekki" terrain="conv_karli"/>
<MoveActorQuantum name="q_sthadergott" actor="thadergott" terrain="conv_karli"/>

<MoveActorQuantum name="q_sdraugabaerinn" actor="draugabaerinn" terrain="conv_karli"/>
<MoveActorQuantum name="q_sgestrisni" actor="gestrisni" terrain="conv_karli"/>
<MoveActorQuantum name="q_shonumadbana" actor="honumadbana" terrain="conv_karli"/>
<MoveActorQuantum name="q_slataingolfvita" actor="lataingolfvita" terrain="conv_karli"/>
<MoveActorQuantum name="q_sholdumaframleitinni" actor="holdumaframleitinni" terrain="conv_karli"/>

<MoveActorQuantum name="q_ssyndayfir" actor="syndayfir" terrain="conv_karli_river"/>
<MoveActorQuantum name="q_ssmidadfleka" actor="smidadfleka" terrain="conv_karli_river"/>
<MoveActorQuantum name="q_sekkilengra" actor="ekkilengra" terrain="conv_karli_river"/>

<MoveActorQuantum name="q_ssjadusulurnar" actor="sjadusulurnar" terrain="conv_karli_rvk"/>

<!-- -->

<SetFlagQuantum name="q_BeginConvKarli1" flag="f_BeginConvKarli" value="1"/>
<SetFlagQuantum name="q_EndConvKarli1" flag="f_EndConvKarli" value="1"/>

<Sequence name="s_showtextkarli">
	<Quantum name="q_showtextkarli"/>
</Sequence>
<Sequence name="s_showtextkarli_river">
	<Quantum name="q_sbless_river"/>
	<Quantum name="q_showtextkarli_river"/>
</Sequence>
<Sequence name="s_showtextkarli_rvk">
	<Quantum name="q_sbless_rvk"/>
	<Quantum name="q_showtextkarli_rvk"/>
</Sequence>

<CheckConditionQuantum name="q_showwhattext" flag="f_CurrentScene">
	<Trigger value="6" seq="s_showtextkarli"/>
	<Trigger value="1" seq="s_showtextkarli"/>
	<Trigger value="2" seq="s_showtextkarli"/>
	<Trigger value="3" seq="s_showtextkarli_river"/>
	<Trigger value="4" seq="s_showtextkarli_river"/>
	<Trigger value="5" seq="s_showtextkarli_rvk"/>
</CheckConditionQuantum>

<Sequence name="s_saell">
    <Quantum name="q_stopvifill"/>
	<Quantum name="q_conversating"/>
	<Quantum name="q_heyrdukarli"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_vifill"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_showwhattext"/>
</Sequence>

<CheckConditionQuantum name="q_BeginConvKarli" flag="f_BeginConvKarli">
	<Trigger value="1" seq="s_saell"/>
</CheckConditionQuantum>

<Sequence name="s_WalkVifillToKarliSkipingolfs"> <Quantum name="q_WalkVifillToKarliSkipingolfs"/> </Sequence>
<Sequence name="s_WalkVifillToKarliIngholfshofdi"> <Quantum name="q_WalkVifillToKarliIngolfshofdi"/> </Sequence>
<Sequence name="s_WalkVifillToKarliHjorleifshofdi">
    <Quantum name="q_WalkVifillToKarliHjorleifshofdi1"/>
    <Quantum name="q_StoppVifill"/>
    <Quantum name="q_stopvifill"/>
    <Quantum name="q_WalkVifillToKarliHjorleifshofdi2"/>
</Sequence>
<Sequence name="s_WalkVifillToKarliSudurThjorsa">
    <Quantum name="q_WalkVifillToKarliSudurThjorsa"/>
</Sequence>
<Sequence name="s_WalkVifillToKarliSudurThjorsa3">
    <Quantum name="q_WalkVifillToKarliSudurThjorsa8"/>
</Sequence>
<CheckConditionQuantum name="q_CheckKalli" flag="f_Karli8" wait="true">
	<Trigger value="0" seq="s_WalkVifillToKarliSudurThjorsa"/>
	<Trigger value="1" seq="s_WalkVifillToKarliSudurThjorsa3"/>
</CheckConditionQuantum>
<Sequence name="s_WalkVifillToKarliSudurThjorsa2">
    <Quantum name="q_CheckKalli"/>
</Sequence>
<Sequence name="s_WalkVifillToKarliNordurThjorsa"> <Quantum name="q_WalkVifillToKarliNordurThjorsa"/> </Sequence>
<Sequence name="s_WalkVifillToKarliReykjavik"> <Quantum name="q_WalkVifillToKarliReykjavik"/> </Sequence>

<CheckConditionQuantum name="q_WalkVifillToKarli" flag="f_CurrentScene" wait="true">
	<Trigger value="6" seq="s_WalkVifillToKarliSkipingolfs"/>
	<Trigger value="1" seq="s_WalkVifillToKarliIngholfshofdi"/>
	<Trigger value="2" seq="s_WalkVifillToKarliHjorleifshofdi"/>
	<Trigger value="3" seq="s_WalkVifillToKarliSudurThjorsa2"/>
	<Trigger value="4" seq="s_WalkVifillToKarliNordurThjorsa"/>
	<Trigger value="5" seq="s_WalkVifillToKarliReykjavik"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvKarli">
    <Quantum name="q_freeze"/>
    <Quantum name="q_StoppVifill"/>
    <Quantum name="q_stopvifill"/>
	<Quantum name="q_WalkVifillToKarli"/>
    <Quantum name="q_StoppVifill"/>
    <Quantum name="q_stopvifill"/>
	<Quantum name="q_BeginConvKarli"/> </Sequence>
<Reaction reactor="action_talk" actor="karli" seq="s_BeginConvKarli"/>

<Sequence name="s_hvaderum">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hvaderum"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Karli_Sigh"/>
	<Quantum name="q_alltofspenntur"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hhvaderum"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="hvaderum" seq="s_hvaderum"/>

<Sequence name="s_hvarerumvid">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hvarerumvid"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ordinnalvarlegasjoveikur"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_shvernigdattingolfi"/>
	<Quantum name="q_hhvarerumvid"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="hvarerumvid" seq="s_hvarerumvid"/>

<Sequence name="s_hvadaarer">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hvadaarer"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_umthadbil874"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hhvadaarer"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="hvadaarer" seq="s_hvadaarer"/>

<Sequence name="s_hvernigdattingolfi">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hvernigdattingolfi"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_buinnadgleyma"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hhvernigdattingolfi"/>
	<Quantum name="q_safhverjuheitir1"/>
	<Quantum name="q_safhverjuheitir2"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="hvernigdattingolfi" seq="s_hvernigdattingolfi"/>

<Sequence name="s_afhverjuheitir1">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_afhverjuheitir1"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_hetfyrstleifur"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hafhverjuheitir1"/>
	<Quantum name="q_safhverjudrapu"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="afhverjuheitir1" seq="s_afhverjuheitir1"/>

<Sequence name="s_ShowHjolliText">
	<Quantum name="q_shvarerhjorleifur"/>
</Sequence>

<CheckConditionQuantum name="q_FromShip" flag="f_ShipDone" wait="true">
	<Trigger value="0" seq="s_ShowHjolliText"/>
</CheckConditionQuantum>

<Sequence name="s_afhverjuheitir2">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_afhverjuheitir2"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_naddoddurvikingurkom"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hafhverjuheitir2"/>
	<Quantum name="q_FromShip"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="afhverjuheitir2" seq="s_afhverjuheitir2"/>

<Sequence name="s_hvarerhjorleifur">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hvarerhjorleifur"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_hefurduekkitekid"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hhvarerhjorleifur"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="hvarerhjorleifur" seq="s_hvarerhjorleifur"/>

<Sequence name="s_afhverjudrapu">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_afhverjudrapu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_theirvoruvinir"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hafhverjudrapu"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="afhverjudrapu" seq="s_afhverjudrapu"/>

<Sequence name="s_bless3">
	<Quantum name="q_Rope_stop2"/>
	<Quantum name="q_MoveRope2Ingolfshofdi"/>
</Sequence>

<CheckConditionQuantum name="q_RopeTaken" flag="f_RopeTaken">
	<Trigger value="0" seq="s_bless3"/> </CheckConditionQuantum>

<Sequence name="s_bless1">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_bless"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveIngolfur2Skipingolfs"/>
	<Quantum name="q_stopingolfur_ship"/>
	<Quantum name="q_WalkIngolfurSkipIngolfs2"/>
	<Quantum name="q_WalkIngolfurSkipIngolfs3"/>
	<Quantum name="q_stopingolfur_ship"/>
	<Quantum name="q_skipsfelagarnusjaum"/>
	<Quantum name="q_stopingolfur_ship"/>
	<Quantum name="q_HideSula"/>
	<Quantum name="q_Ingolfur_push"/>
	<Quantum name="q_PlaySplass"/>
	<Quantum name="q_4sec"/>
    <Quantum name="qf_SkipslagOut"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_Skipslag_stop"/>
	<Quantum name="qu_Skipingolfs"/>
	<Quantum name="qp_Map"/>
	<Quantum name="qf_Kortalag"/>
	<Quantum name="q_Kortalag_play"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="qf_KortalagIn"/>
	<Quantum name="q_MoveMapAnim4ToIngolfshofdi"/>
	<Quantum name="q_MapAnim_ToIngolfshofdi"/>
	<Quantum name="qs_MapIngolfshofdi"/>
	<Quantum name="q_hhvaderum"/>
	<Quantum name="q_hhvarerumvid"/>
	<Quantum name="q_Ahvarerhjorleifur"/>
	<Quantum name="q_MoveVifill2Ingolfshofdi"/>
	<Quantum name="q_MoveKarli2Ingolfshofdi"/>
	<Quantum name="q_Ingolfur_ChopStop"/>
	<Quantum name="q_MoveIngolfur2Ingolfshofdi"/>
	<Quantum name="q_RopeTaken"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qf_KortalagOut"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_Map"/>
	<Quantum name="q_MapAnim_stop"/>
	<Quantum name="qp_Ingolfshofdi"/>
	<Quantum name="q_Hallveig_prjona"/>
	<Quantum name="q_Sea_sea"/>
	<Quantum name="q_Kortalag_stop"/>
	<Quantum name="qf_SilenceAdallag"/>
	<Quantum name="q_Adallag_play"/>
	<Quantum name="q_ToIngolfshofdi"/>
	<Quantum name="q_MoveConvKarli2Ingolfshofdi"/>
	<Quantum name="q_MoveConvIngo2Ingolfshofdi"/>
	<Quantum name="q_EndConvKarli1"/>
	<Quantum name="qf_AdallagIn"/>
	<Quantum name="q_vifillogkarli"/>
	<Quantum name="q_Ingolfur_Chop"/>
	<Quantum name="q_ShipDone1"/>
	<Quantum name="q_segnenniekki"/>
	<Quantum name="q_sthadergott"/>

	<Quantum name="q_hhvarerhjorleifur"/>
	<Quantum name="q_shvernigdattingolfi"/>
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_CurrentIngolfshofdi"/>
	<Quantum name="q_moving"/>
</Sequence>

<Sequence name="s_hidetextkarli1">
	<Quantum name="q_hidetextkarli"/>
</Sequence>
<Sequence name="s_hidetextkarli2">
	<Quantum name="q_hidetextkarli_river"/>
</Sequence>
<Sequence name="s_hidetextkarli3">
	<Quantum name="q_hidetextkarli_rvk"/>
</Sequence>

<CheckConditionQuantum name="q_HideWhatText" flag="f_CurrentScene">
	<Trigger value="1" seq="s_hidetextkarli1"/>
	<Trigger value="2" seq="s_hidetextkarli1"/>
	<Trigger value="3" seq="s_hidetextkarli2"/>
	<Trigger value="4" seq="s_hidetextkarli2"/>
	<Trigger value="5" seq="s_hidetextkarli3"/>
</CheckConditionQuantum>

<Sequence name="s_bless2">
	<Quantum name="q_HideWhatText"/>
	<Quantum name="q_bless"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_moving"/>
</Sequence>

<CheckConditionQuantum name="q_EndConvKarli" flag="f_EndConvKarli">
	<Trigger value="0" seq="s_bless1"/>
	<Trigger value="1" seq="s_bless2"/> </CheckConditionQuantum>

<Sequence name="s_EndConvKarli">
	<Quantum name="q_EndConvKarli"/> </Sequence>
<Reaction reactor="action_talk" actor="bless" seq="s_EndConvKarli"/>
<Reaction reactor="action_talk" actor="bless_river" seq="s_EndConvKarli"/>
<Reaction reactor="action_talk" actor="bless_rvk" seq="s_EndConvKarli"/>

<Sequence name="s_egnenniekki">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_egnenniekki"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_besttruad"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hegnenniekki"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="egnenniekki" seq="s_egnenniekki"/>

<Sequence name="s_thadergott">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_Vifill_kissd"/>
	<Quantum name="q_thadergott"/>
	<Quantum name="q_Vifill_kissu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_lattuekkisvona"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hthadergott"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="thadergott" seq="s_thadergott"/>

<Sequence name="s_draugabaerinn">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_draugabaerinn"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_solarlandaferd"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hdraugabaerinn"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="draugabaerinn" seq="s_draugabaerinn"/>

<Sequence name="s_gestrisni">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_gestrisni"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_brugdidserfra"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hgestrisni"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="gestrisni" seq="s_gestrisni"/>

<Sequence name="s_honumadbana">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_honumadbana"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_matareitrun"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hhonumadbana"/>
	<Quantum name="q_showtextkarli"/> </Sequence>
<Reaction reactor="action_talk" actor="honumadbana" seq="s_honumadbana"/>

<Sequence name="s_lataingolfvita">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_lataingolfvita"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thuraedur"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hlataingolfvita"/>
	<Quantum name="q_hholdumaframleitinni"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_talk" actor="lataingolfvita" seq="s_lataingolfvita"/>

<Sequence name="s_holdumaframleitinni">
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_holdumaframleitinni"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thuraedur"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hlataingolfvita"/>
	<Quantum name="q_hholdumaframleitinni"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_talk" actor="holdumaframleitinni" seq="s_holdumaframleitinni"/>

<Sequence name="s_syndayfir">
	<Quantum name="q_hidetextkarli_river"/>
	<Quantum name="q_syndayfir"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thufyrst"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hsyndayfir"/>
	<Quantum name="q_showtextkarli_river"/> </Sequence>
<Reaction reactor="action_talk" actor="syndayfir" seq="s_syndayfir"/>

<Sequence name="s_smidadfleka">
	<Quantum name="q_hidetextkarli_river"/>
	<Quantum name="q_smidadfleka"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_fleka"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hsmidadfleka"/>
	<Quantum name="q_showtextkarli_river"/> </Sequence>
<Reaction reactor="action_talk" actor="smidadfleka" seq="s_smidadfleka"/>

<Sequence name="s_ekkilengra">
	<Quantum name="q_hidetextkarli_river"/>
	<Quantum name="q_ekkilengra"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_spurtingolf"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hekkilengra"/>
	<Quantum name="q_showtextkarli_river"/> </Sequence>
<Reaction reactor="action_talk" actor="ekkilengra" seq="s_ekkilengra"/>

<Sequence name="s_sjadusulurnar_rvk">
	<Quantum name="q_hidetextkarli_rvk"/>
	<Quantum name="q_sjadusulurnar"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ondvegissulur"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_hsjadusulurnar"/>
	<Quantum name="q_showtextkarli_rvk"/> </Sequence>
<Reaction reactor="action_talk" actor="sjadusulurnar" seq="s_sjadusulurnar_rvk"/>


<!-- Conversation with Ingolfur -->

<Text name="einhverjahugmynd" text="Hvar eru öndvegissúlurnar?" terrain="conv_ingo" color="white"/>
	<ActorMoused actor="einhverjahugmynd" listener="sc"/>
<Text name="fundumhjorleif" text="Við fundum Hjörleif dauðan dagleið vestar. Hann hefur verið drepinn!" color="white"/>
	<ActorMoused actor="fundumhjorleif" listener="sc"/>
<Text name="nennumekki" text="Við nennum ekki að leita lengur." color="white"/>
	<ActorMoused actor="nennumekki" listener="sc"/>
<Text name="villtumst" text="Við villtumst." color="white"/>
	<ActorMoused actor="villtumst" listener="sc"/>
<Text name="asporid" text="Við erum komnir á sporið." color="white"/>
	<ActorMoused actor="asporid" listener="sc"/>
<Text name="blessingo" text="Bless!" terrain="conv_ingo" color="white"/>
	<ActorMoused actor="blessingo" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="q_heinhverjahugmynd" actor="einhverjahugmynd"/>
<MoveActorQuantum name="q_hfundumhjorleif" actor="fundumhjorleif"/>
<MoveActorQuantum name="q_hnennumekki" actor="nennumekki"/>
<MoveActorQuantum name="q_hvilltumst" actor="villtumst"/>
<MoveActorQuantum name="q_hasporid" actor="asporid"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="q_seinhverjahugmynd" actor="einhverjahugmynd" terrain="conv_ingo"/>
<MoveActorQuantum name="q_sfundumhjorleif" actor="fundumhjorleif" terrain="conv_ingo"/>
<MoveActorQuantum name="q_snennumekki" actor="nennumekki" terrain="conv_ingo"/>
<MoveActorQuantum name="q_svilltumst" actor="villtumst" terrain="conv_ingo"/>
<MoveActorQuantum name="q_sasporid" actor="asporid" terrain="conv_ingo"/>

<Sequence name="s_hafidthidfundid">
	<Quantum name="q_hafidthidfundid"/>
</Sequence>
<CheckConditionQuantum name="q_CheckHjorleifshofdiSeen" flag="f_HjorleifshofdiSeen" wait="true">
	<Trigger value="1" seq="s_hafidthidfundid"/> </CheckConditionQuantum>
<Sequence name="s_hafidthidfundid0">
	<Quantum name="q_CheckHjorleifshofdiSeen"/>
	<Quantum name="q_Ingolfur_ChopStop"/> </Sequence>
<Sequence name="s_hafidthidfundid1">
	<Quantum name="q_hafidthidfundid2"/>
	<Quantum name="q_stopingolfur"/> </Sequence>
<CheckConditionQuantum name="qc_hafidthidfundid" flag="f_CurrentScene" wait="true">
	<Trigger value="1" seq="s_hafidthidfundid0"/>
	<Trigger value="2" seq="s_hafidthidfundid1"/> </CheckConditionQuantum>

<Sequence name="s_WalkVifill2GolliIngolfshofdi">
	<Quantum name="q_WalkVifill2GolliIngolfshofdi"/>
</Sequence>
<Sequence name="s_WalkVifill2GolliHjorleifshofdi">
	<Quantum name="q_WalkVifill2GolliHjorleifshofdi"/>
</Sequence>
<CheckConditionQuantum name="q_CheckWalk2Golli" flag="f_PosGolli" wait="true">
	<Trigger value="0" seq="s_WalkVifill2GolliIngolfshofdi"/>
	<Trigger value="1" seq="s_WalkVifill2GolliHjorleifshofdi"/> </CheckConditionQuantum>
<Sequence name="s_BeginIngo">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_CheckWalk2Golli"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
    <Quantum name="q_conversating"/>
	<Quantum name="q_afsakadu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qc_hafidthidfundid"/>
	<Quantum name="q_showtextingo"/> </Sequence>
<Reaction reactor="action_talk" actor="ingolfur" seq="s_BeginIngo"/>

<Sequence name="s_einhverjahugmynd">
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_einhverjahugmynd"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ollumlikindum"/>
	<Quantum name="q_Ingolfur_ChopStop"/>
	<Quantum name="q_heinhverjahugmynd"/>
	<Quantum name="q_showtextingo"/> </Sequence>
<Reaction reactor="action_talk" actor="einhverjahugmynd" seq="s_einhverjahugmynd"/>

<Sequence name="s_fundumhjorleif">
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_fundumhjorleif"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_illtidindi"/>
	<Quantum name="q_Ingolfur_ChopStop"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Ingolfshofdi"/>
	<Quantum name="q_hfundumhjorleif"/>
	<Quantum name="q_MoveHjorleifshofdi2IngolfshofdiOut"/>
	<Quantum name="q_MoveVifillIngolfshofdi2Hjorleifshofdi"/>
	<Quantum name="q_MoveKarliIngolfshofdi2Hjorleifshofdi"/>
	<Quantum name="q_MoveAxe2Ingolfshofdi"/>
	<Quantum name="q_ShowGollaDrumbur"/>
	<Quantum name="q_HideHallveig"/>
	<Quantum name="qp_Hjorleifshofdi"/>
	<Quantum name="q_ToHjorleifshofdi"/>
	<Quantum name="q_CurrentHjorleifshofdi"/>
	<Quantum name="q_MoveConvKarli2Hjorleifshofdi"/>
	<Quantum name="q_MoveConvIngo2Hjorleifshofdi"/>
	<Quantum name="q_freeze"/>
	<Quantum name="q_WalkKarliHjorleifshofdi"/>
	<Quantum name="q_WalkVifillHjorleifshofdi"/>
	<Quantum name="q_MoveIngolfur2Hjorleifshofdi"/>
	<Quantum name="q_stopingolfur"/>
	<Quantum name="q_WalkIngolfurHjorleifshofdi"/>
	<Quantum name="q_MoveHjorleifshofdi2IngolfshofdiIn"/>
	<Quantum name="q_vestmennirnir"/>
	<Quantum name="q_stopingolfur"/>
	<Quantum name="q_GolliMoved1"/>
	<Quantum name="q_moving"/>
	<Quantum name="qs_MapVestmannaeyjar"/>
</Sequence>
<Reaction reactor="action_talk" actor="fundumhjorleif" seq="s_fundumhjorleif"/>

<Sequence name="s_nennumekki0">
	<Quantum name="q_hortugheit"/>
	<Quantum name="q_Ingolfur_ChopStop"/> </Sequence>
<Sequence name="s_nennumekki1">
	<Quantum name="q_hortugheit2"/>
	<Quantum name="q_stopingolfur"/> </Sequence>
<CheckConditionQuantum name="qc_nennumekki" flag="f_CurrentScene" wait="true">
	<Trigger value="1" seq="s_nennumekki0"/>
	<Trigger value="2" seq="s_nennumekki1"/> </CheckConditionQuantum>
<Sequence name="s_nennumekki">
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_nennumekki"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qc_nennumekki"/>
	<Quantum name="q_hnennumekki"/>
	<Quantum name="q_showtextingo"/> </Sequence>
<Reaction reactor="action_talk" actor="nennumekki" seq="s_nennumekki"/>

<Sequence name="s_villtumst0">
	<Quantum name="q_leitidivestri"/>
	<Quantum name="q_Ingolfur_ChopStop"/> </Sequence>
<Sequence name="s_villtumst1">
	<Quantum name="q_leitidivestri2"/>
	<Quantum name="q_stopingolfur"/> </Sequence>
<CheckConditionQuantum name="qc_villtumst" flag="f_CurrentScene" wait="true">
	<Trigger value="1" seq="s_villtumst0"/>
	<Trigger value="2" seq="s_villtumst1"/> </CheckConditionQuantum>
<Sequence name="s_villtumst">
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_villtumst"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qc_villtumst"/>
	<Quantum name="q_hvilltumst"/>
	<Quantum name="q_showtextingo"/> </Sequence>
<Reaction reactor="action_talk" actor="villtumst" seq="s_villtumst"/>

<Sequence name="s_asporid0">
	<Quantum name="q_rettiandi"/>
	<Quantum name="q_Ingolfur_ChopStop"/> </Sequence>
<Sequence name="s_asporid1">
	<Quantum name="q_rettiandi2"/>
	<Quantum name="q_stopingolfur"/> </Sequence>
<CheckConditionQuantum name="qc_asporid" flag="f_CurrentScene" wait="true">
	<Trigger value="1" seq="s_asporid0"/>
	<Trigger value="2" seq="s_asporid1"/> </CheckConditionQuantum>
<Sequence name="s_asporid">
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_asporid"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qc_asporid"/>
	<Quantum name="q_hasporid"/>
	<Quantum name="q_showtextingo"/> </Sequence>
<Reaction reactor="action_talk" actor="asporid" seq="s_asporid"/>

<Sequence name="s_blessingo0">
	<Quantum name="q_Ingolfur_Chop"/> </Sequence>
<Sequence name="s_blessingo1">
	<Quantum name="q_stopingolfur"/> </Sequence>
<CheckConditionQuantum name="qc_blessingo" flag="f_CurrentScene" wait="true">
	<Trigger value="1" seq="s_blessingo0"/>
	<Trigger value="2" seq="s_blessingo1"/> </CheckConditionQuantum>
<Sequence name="s_blessingo">
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_bless"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qc_blessingo"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_talk" actor="blessingo" seq="s_blessingo"/>



<!-- Reactions -->
<ThemeFinishedQuantum name="q_ThemeFin"/>

<!-- Miscellaneous reactions -->

<!-- Karli -->
<!-- Look at Karli-->
<Sequence name="s_LookKarli">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaernubarahann"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="karli" seq="s_LookKarli"/>

<!-- Hjorleifur -->
<!-- Look at Hjorleifur-->
<Sequence name="s_LookHjorleifur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_hannhefurveriddrepinn"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Hjorleifur" seq="s_LookHjorleifur"/>

<!-- Take at Hjorleifur-->
<Sequence name="s_TakeHjorleifur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Take1"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Hjorleifur" seq="s_TakeHjorleifur"/>

<!-- Look at Vifill-->
<Sequence name="s_LookVifill">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_saell"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="vifill" seq="s_LookVifill"/>
<Reaction reactor="action_take" actor="vifill" seq="s_randomTake"/>
<Reaction reactor="action_talk" actor="vifill" seq="s_LookVifill"/>

<!-- Take up Karli (Push)-->
<Sequence name="s_TakeKarli">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neihaettunu"/>      <!-- Ath -->
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="karli" seq="s_TakeKarli"/>

<!-- Tunnur -->
<!-- Look at Tunnur -->
<Sequence name="s_LookTunnur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thadertunnur"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Tunnur" seq="s_LookTunnur"/>

<!-- Drumbur -->
<!-- Look at Drumbur -->
<Sequence name="s_LookDrumbur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaertrjadrumburinn"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Drumbur" seq="s_LookDrumbur"/>

<!-- Look at Stilkur -->
<Sequence name="s_LookStilkur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_mikideruthettaljotir"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Stilkur" seq="s_LookStilkur"/>

<!-- Look at Grein -->
<Sequence name="s_LookGrein">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaertrjagrein"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Grein" seq="s_LookGrein"/>

<!-- Look at GreinKud -->
<Sequence name="s_LookGreinKud">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaer"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_GreinKud" seq="s_LookGreinKud"/>

<!-- Take up the Tunnur -->
<Sequence name="s_TakeTunnur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_egerekkithyrsturnuna"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Tunnur" seq="s_TakeTunnur"/>
<!-- Talk to Tunnur -->
<Sequence name="s_LookGolli">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thekkirthuekkiingolf"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="ingolfur" seq="s_LookGolli"/>

<!-- Kista -->
<!-- Look at Kista -->
<Sequence name="s_LookKista">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neithettatharfegekki"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Kista" seq="s_LookKista"/>
<!-- Take up the Kista -->
<Sequence name="s_TakeKista">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ingolfurmyndibrjalast"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_talking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Kista" seq="s_TakeKista"/>
<!-- Talk to Kista -->

<!-- Öndvegissúlur -->
<!-- Look at súla -->
<Sequence name="s_LookSula">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ondvegissulan"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Sula" seq="s_LookSula"/>
<!-- Take up Súla -->
<Sequence name="s_TakeSula">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_eggaetialdreihaldidathessu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Sula" seq="s_TakeSula"/>

<!-- Rope -->
<!-- Look at rope -->
<Sequence name="s_LookRope">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaerreipidhans"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Rope" seq="s_LookRope"/>
<!-- Take up the rope -->
<Sequence name="s_TakeRope">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveRope"/>
	<Quantum name="q_Rope_Taken"/>
	<Quantum name="q_MoveRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_RopeTaken1"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Rope" seq="s_TakeRope"/>

<!-- Take up the grein -->
<Sequence name="s_TakeGrein">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveGrein2Inventory"/>
	<Quantum name="q_Grein_Taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Grein" seq="s_TakeGrein"/>

<!-- Kofi -->
<!-- Look at Kofi -->
<Sequence name="s_LookKofi">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thaderinnihusinu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Kofi" seq="s_LookKofi"/>
<!-- Take up the Kofi -->
<Sequence name="s_TakeKofi">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thaderinnihusinu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Kofi" seq="s_TakeKofi"/>

<Sequence name="s_KindAll">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qs_Kind"/>
	<Quantum name="q_Kind"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qh_Kind"/>
	<Quantum name="q_KindStop"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Hus" seq="s_KindAll"/>
<Reaction reactor="action_look" actor="a_Hus" seq="s_KindAll"/>

<!-- Take up the Batur -->
<Sequence name="s_TakeBatur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_eggaetialdreihaldidathessu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Batur" seq="s_TakeBatur"/>

<!-- Kuðungur -->
<!-- Look at Kuðungur -->
<Sequence name="s_LookKudungur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thadereitthvadovenjulegt"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Kudungur" seq="s_LookKudungur"/>
<!-- Take up Kuðungur -->
<Sequence name="s_TakeKudungur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveKudungur2Inventory"/>
	<Quantum name="q_Kudungur_Taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Kudungur" seq="s_TakeKudungur"/>

<Sequence name="s_TalkHallveig">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_hunersvoupptekin"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_talk" actor="a_Hallveig" seq="s_TalkHallveig"/>
<Reaction reactor="action_take" actor="a_Hallveig" seq="s_TalkHallveig"/>

<Sequence name="s_LookHallveig">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaerhallveig"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Hallveig" seq="s_LookHallveig"/>

<Sequence name="s_LookRunni2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaerbaravenjulegurrunni"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_runni2" seq="s_LookRunni2"/>
<Reaction reactor="action_look" actor="a_runni3" seq="s_LookRunni2"/>

<!-- Axe -->
<!-- Look at Axe -->
<Sequence name="s_LookAxe">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaeroxin"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Axe" seq="s_LookAxe"/>
<Sequence name="s_LookAxeAndRope">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thettaeroxinhans"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_AxeAndRope" seq="s_LookAxeAndRope"/>
<!-- Take up the axe -->
<Sequence name="s_TakeAxe">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveAxe2Inventory"/>
	<Quantum name="q_Axe_Taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Axe" seq="s_TakeAxe"/>

<Sequence name="s_Chop">
    <Quantum name="qs_StuttuSeinna"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_MoveTre2"/>
	<Quantum name="q_MoveStubbur22NordurThjorsa"/>
	<Quantum name="q_MoveDrumbur2NordurThjorsa"/>
	<Quantum name="q_TreeFallen1"/>
	<Quantum name="q_MoveAxe2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_4sec"/>
	<Quantum name="q_ToNordurThjorsa"/>
	<Quantum name="qh_StuttuSeinna"/>
	<Quantum name="q_jaejanueregbuinn"/>
	<Quantum name="q_stopvifill"/>
</Sequence>

<Sequence name="s_Chop2">
    <Quantum name="q_ToBlack"/>
    <Quantum name="qs_StuttuSeinna"/>
    <Quantum name="q_4sec"/>
	<Quantum name="q_MoveTre2"/>
	<Quantum name="q_MoveStubbur22NordurThjorsa"/>
	<Quantum name="q_MoveDrumbur2NordurThjorsa"/>
	<Quantum name="q_TreeFallen1"/>
	<Quantum name="q_MoveAxeAndRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_4sec"/>
	<Quantum name="q_ToNordurThjorsa"/>
	<Quantum name="qh_StuttuSeinna"/>
	<Quantum name="q_jaejanueregbuinn"/>
	<Quantum name="q_stopvifill"/>
</Sequence>

<Sequence name="s_NoChop">
	<Quantum name="q_Use3"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveAxe2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
</Sequence>
<Sequence name="s_NoChop2">
	<Quantum name="q_Use3"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveAxeAndRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Axe" seq="s_TakeAxe"/>

<CheckConditionQuantum name="q_CheckTreeFallen" flag="f_TreeFallen" wait="true">
	<Trigger value="0" seq="s_Chop"/>
	<Trigger value="1" seq="s_NoChop"/>
</CheckConditionQuantum>

<CheckConditionQuantum name="q_CheckTreeFallen2" flag="f_TreeFallen" wait="true">
	<Trigger value="0" seq="s_Chop2"/>
	<Trigger value="1" seq="s_NoChop2"/>
</CheckConditionQuantum>

<!-- Use the axe on the tre2-->
<Sequence name="s_UseAxeOnTre2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_CheckTreeFallen"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_Axe" actor2="a_Tre2" seq="s_UseAxeOnTre2"/>
<Reaction reactor="action_use" actor="a_Axe" actor2="a_Tre1" seq="s_UseAxeOnTre2"/>

<Sequence name="s_KudGrein8">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qh_Grein"/>
	<Quantum name="qh_Kudungur"/>
	<Quantum name="qs_GreinKud"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_frabaertgreinin"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_use" actor="a_Grein" actor2="a_Kudungur" seq="s_KudGrein8"/>
<Reaction reactor="action_use" actor2="a_Grein" actor="a_Kudungur" seq="s_KudGrein8"/>

<Sequence name="s_UseAxeAndRopeOnTre2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_CheckTreeFallen2"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_AxeAndRope" actor2="a_Tre2" seq="s_UseAxeAndRopeOnTre2"/>
<Reaction reactor="action_use" actor="a_AxeAndRope" actor2="a_Tre1" seq="s_UseAxeAndRopeOnTre2"/>

<!-- Bush -->
<!-- Look at Bush -->
<Sequence name="s_LookBush">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ahugaverdurrunni"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Bush" seq="s_LookBush"/>
<!-- Take the bush away -->
<Sequence name="s_TakeBush">
	<Quantum name="q_freeze"/>
	<Quantum name="q_WalkVifillBush"/>
	<Quantum name="q_MoveBush"/>
	<Quantum name="q_WalkKarliBush"/>
	<Quantum name="q_onei"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_WalkKarliHjorleifshofdi"/>
	<Quantum name="q_HjorleifurFound1"/>
	<Quantum name="q_hdraugabaerinn"/>
	<Quantum name="q_hgestrisni"/>
	<Quantum name="q_shonumadbana"/>
	<Quantum name="q_slataingolfvita"/>
	<Quantum name="q_sholdumaframleitinni"/>
	<Quantum name="q_sfundumhjorleif"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Bush" seq="s_TakeBush"/>
<!-- Talk to Bush -->
<Sequence name="s_TalkBush">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neihaettunu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="action_talk" actor="a_Bush" seq="s_TalkBush"/>

<!-- Deigur hnífur -->
<!-- Look at deigur hnífur -->
<Sequence name="s_LookDeigurHnifur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_thessihnifurer"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_DeigurHnifur" seq="s_LookDeigurHnifur"/>
<!-- Take up Deigur hnífur -->
<Sequence name="s_TakeDeigurHnifur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveDeigurHnifur2Inventory"/>
	<Quantum name="q_DeigurHnifur_Taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_DeigurHnifur" seq="s_TakeDeigurHnifur"/>

<!-- Blóm -->
<!-- Look at blóm -->
<Sequence name="s_LookBlom">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_mikideruthettafalleg"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Blom" seq="s_LookBlom"/>
<!-- Take up blóm -->
<Sequence name="s_TakeBlom">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveBlom2Inventory"/>
	<Quantum name="q_Blom_Taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Blom" seq="s_TakeBlom"/>

<!-- Skera blóm -->
<Sequence name="s_SkeraBlom">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_snjallraediegsker"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_HideBlom"/>
	<Quantum name="q_Stilkur_Taken"/>
	<Quantum name="q_MoveStilkur2Inventory"/>
	<Quantum name="q_MoveDeigurHnifur2Inventory"/>
	<Quantum name="q_DeigurHnifur_Taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_DeigurHnifur" actor2="a_Blom" seq="s_SkeraBlom"/>
<Reaction reactor="action_use" actor="a_Blom" actor2="a_DeigurHnifur" seq="s_SkeraBlom"/>

<!-- Skreid -->
<!-- Look at Skreid -->
<Sequence name="s_LookSkreid">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_neihaettunu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Skreid" seq="s_LookSkreid"/>

<!-- Skogur -->
<!-- Look at Skogur -->
<Sequence name="s_LookSkogur">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_tynast"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Skogur1" seq="s_LookSkogur"/>
<Reaction reactor="action_look" actor="a_Skogur2" seq="s_LookSkogur"/>

<!-- Use rope on axe or vice versa -->
<Sequence name="s_UseAxeOnRope">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveAxeAndRope2Inventory"/>
	<Quantum name="q_MoveAxe"/>
	<Quantum name="q_MoveRope"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_nueregbuinnadbinda"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_use" actor="a_Axe" actor2="a_Rope" seq="s_UseAxeOnRope"/>
<Reaction reactor="action_use" actor="a_Rope" actor2="a_Axe" seq="s_UseAxeOnRope"/>

<!-- Use the axe and rope on the Tre3 -->
<Sequence name="s_UseAxeAndRopeOnTre30">
	<Quantum name="q_freeze"/>
	<Quantum name="q_Use5"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveAxeAndRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/>
</Sequence>

<Sequence name="s_UseAxeAndRopeOnTre31">
	<Quantum name="q_freeze"/>
	<Quantum name="qh_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_WalkVifillThrow"/>
	<Quantum name="q_hidetextkarli_river"/>
	<Quantum name="q_hidetextkarli_rvk"/>
	<Quantum name="qp_YfirFljot"/>
	<Quantum name="qp_Fly"/>
	<Quantum name="q_Vifill_throw"/>
    <Quantum name="q_FlyExi"/>
	<Quantum name="q_PlayDonk"/>
	<Quantum name="q_StopFly"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveMiscVifill4YfirFljot"/>
	<Quantum name="q_MoveVifill"/>
	<Quantum name="q_MoveKarli"/>
	<Quantum name="q_MoveDrumbur"/>
	<Quantum name="q_MiscVifill_YfirFljot"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveDrumburOgBand2NordurThjorsa"/>
	<Quantum name="qs_Drumbur2"/>
	<Quantum name="q_DrumburDrift"/>
	<Quantum name="q_MiscVifill_stop"/>
	<Quantum name="q_ShowVifillAtAusturThjorsa"/>
	<Quantum name="q_ShowKarliAtAusturThjorsa"/>
	<Quantum name="q_thettavarrosalegt"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_WalkKarliOutAusturThjorsa"/>
	<Quantum name="q_WalkVifillOutAusturThjorsa"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qh_Drumbur2"/>
	<Quantum name="qf_AdallagOut"/>
	<Quantum name="q_Adallag_stop"/>
	<Quantum name="qu_NordurThjorsa"/>
	<Quantum name="q_MoveVifill2Reykjavik"/>
	<Quantum name="q_MoveKarli2Reykjavik"/>
	<Quantum name="qu_YfirFljot"/>
	<Quantum name="q_hidetextkarli_rvk"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="qp_Map"/>
	<Quantum name="qp_Map9"/>
	<Quantum name="q_RiverSound_stop"/>
	<Quantum name="qf_Kortalag"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="q_Kortalag_play"/>
	<Quantum name="qf_KortalagIn"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="q_MoveMapAnim4ThjorsaToReykjavik"/>
	<Quantum name="q_MapAnim_ThjorsaToReykjavik"/>
	<Quantum name="qs_MapReykjavik"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qf_KortalagOut"/>
	<Quantum name="q_MapAnim_stop"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="q_Sea2_sea"/>
	<Quantum name="qu_Map"/>
	<Quantum name="qu_Map9"/>
	<Quantum name="q_Kortalag_stop"/>
	<Quantum name="qf_SilenceAdallag"/>
	<Quantum name="q_Adallag_play"/>
	<Quantum name="qp_Reykjavik"/>
	<Quantum name="q_Sea2_sea"/>
	<Quantum name="q_ToReykjavik"/>
	<Quantum name="qf_AdallagIn"/>
	<Quantum name="q_CurrentReykjavik"/>
	<Quantum name="q_WalkKarli2ReykjavikA"/>
	<Quantum name="q_WalkVifill2ReykjavikA"/>
	<Quantum name="qs_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_moving"/>
	<Quantum name="qu_Fly"/>
    <Quantum name="q_MoveHjorleifshofdi2SudurThjorsaOut"/>
    <Quantum name="q_MoveHjorleifshofdi2ReykjavikIn"/>
</Sequence>

<CheckConditionQuantum name="q_TreeFallen" flag="f_TreeFallen">
	<Trigger value="0" seq="s_UseAxeAndRopeOnTre30"/>
	<Trigger value="1" seq="s_UseAxeAndRopeOnTre31"/> </CheckConditionQuantum>
<Sequence name="s_UseAxeAndRopeOnTre3">
    <Quantum name="q_freeze"/>
    <Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_TreeFallen"/> </Sequence>
<Reaction reactor="action_use" actor="a_AxeAndRope" actor2="a_Tre3" seq="s_UseAxeAndRopeOnTre3"/>
<Reaction reactor="action_use" actor="a_AxeAndRope" actor2="a_Rock" seq="s_UseAxeAndRopeOnTre3"/>

<Sequence name="s_UseAxeOnRock">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_Use5"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveAxe2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Axe" actor2="a_Rock" seq="s_UseAxeOnRock"/>

<!-- Tree -->
<!-- Look at Tree -->
<Sequence name="s_LookTree">
	<Quantum name="q_freeze"/>
	<Quantum name="q_fallegttre"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_looking"/> </Sequence>
<Reaction reactor="action_look" actor="a_Tre1" seq="s_LookTree"/>
<Reaction reactor="action_look" actor="a_Tre2" seq="s_LookTree"/>
<!-- Take up the Tree -->
<Sequence name="s_TakeTree">
	<Quantum name="q_freeze"/>
	<Quantum name="q_eggetekkitogadtre"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Tre1" seq="s_TakeTree"/>
<Reaction reactor="action_take" actor="a_Tre2" seq="s_TakeTree"/>

<!-- Take up the Rock -->
<Sequence name="s_TakeRock">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_eggaetialdreihaldidathessu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Rock" seq="s_TakeRock"/>

<Sequence name="s_UseRopeOnTree">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_eggetekkitogadtreidnidur"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Rope" actor2="a_Tre1" seq="s_UseRopeOnTree"/>
<Reaction reactor="action_use" actor="a_Rope" actor2="a_Tre3" seq="s_UseRopeOnTree"/>

<Sequence name="s_UseRopeOnRock">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_bandidrennurafsteininum"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Rope" actor2="a_Rock" seq="s_UseRopeOnRock"/>

<Sequence name="s_UseRopeOnTree30">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_bandidnaerekkitakiatrenu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Rope" actor2="a_Tre3" seq="s_UseRopeOnTree30"/>

<Sequence name="s_UseRopeOnTree1">
	<Quantum name="q_freeze"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_bandidnaerekkitakiatrenu"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveRope2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Rope" actor2="a_Tre1" seq="s_UseRopeOnTree1"/>

<!-- All sulur taken -->
<Sequence name="s_Finido">
	<Quantum name="qh_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_MoveIngolfur2Reykjavik"/>
	<Quantum name="q_WalkGolli2TalkSpot"/>
	<Quantum name="q_WalkVifill2GolliReykjavik"/>
	<Quantum name="q_velhafidthid"/>
	<Quantum name="q_stopingolfur"/>
	<Quantum name="q_tilills"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="qh_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_WalkKarliReykjavikOutRight"/>
	<Quantum name="q_MoveKarli2Ingolfshofdi"/>
	<Quantum name="q_tryggithraell"/>
	<Quantum name="q_Ingolfur_give"/>
	<Quantum name="q_stopingolfur"/>
	<Quantum name="q_Vifill_stoned"/>
	<Quantum name="q_PlayHverfur"/>
	<Quantum name="q_Vifill_vanish"/>
	<Quantum name="q_MoveVifill"/>
	<Quantum name="q_4sec"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="q_Adallag_stop"/>
	<Quantum name="q_ThemeFin"/>
<!-- End of Landnam -->
</Sequence>

<Sequence name="s_NotFinido">
	<Quantum name="q_moving"/>
</Sequence>

<!-- Check sulucount -->
<CheckConditionQuantum name="q_CheckSulur" flag="f_SuluCount">
	<Trigger value="1" seq="s_NotFinido"/>
	<Trigger value="2" seq="s_NotFinido"/>
	<Trigger value="3" seq="s_Finido"/> </CheckConditionQuantum>

<!-- Take Sula1 -->
<Sequence name="s_TakeSula1">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveSula1"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_SulaTaken"/>
	<Quantum name="q_CheckSulur"/>
	</Sequence>
<Reaction reactor="action_take" actor="a_Sula1" seq="s_TakeSula1"/>

<!-- Take Sula2 -->
<Sequence name="s_TakeSula2">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveSula2"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_SulaTaken"/>
	<Quantum name="q_CheckSulur"/>
	</Sequence>
<Reaction reactor="action_take" actor="a_Sula2" seq="s_TakeSula2"/>

<!-- Take Sula3 -->
<Sequence name="s_TakeSula3">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveSula3"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_SulaTaken"/>
	<Quantum name="q_CheckSulur"/>
	</Sequence>
<Reaction reactor="action_take" actor="a_Sula3" seq="s_TakeSula3"/>


<!-- =========== Hotspots =========== -->


<!-- Hotspot between Ingolfshofdi and Hjorleifshofdi -->
<Sequence name="s_HjorleifshofdiFirstTime">
	<Quantum name="q_HjorleifshofdiSeen1"/>
	<Quantum name="q_hegnenniekki"/>
	<Quantum name="q_hthadergott"/>
	<Quantum name="q_sdraugabaerinn"/>
	<Quantum name="q_sgestrisni"/>
	<Quantum name="q_snennumekki"/>
	<Quantum name="q_svilltumst"/>
	<Quantum name="q_sasporid"/>
</Sequence>
<CheckConditionQuantum name="q_CheckHjorleifshofdiFirstTime" flag="f_HjorleifshofdiSeen" wait="true">
	<Trigger value="0" seq="s_HjorleifshofdiFirstTime"/>
</CheckConditionQuantum>
<Sequence name="s_Ingolfshofdi2Hjorleifshofdi">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveIngolfshofdi2HjorleifshofdiOut"/>
	<Quantum name="q_WalkVifillIngolfshofdiOut"/>
	<Quantum name="q_MoveIngolfshofdi2HjorleifshofdiIn"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qf_AdallagOut"/>
	<Quantum name="q_Adallag_stop"/>
	<Quantum name="qu_Ingolfshofdi"/>
	<Quantum name="qp_Map"/>
	<Quantum name="qf_Kortalag"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="q_Kortalag_play"/>
	<Quantum name="qf_KortalagIn"/>
	<Quantum name="q_MoveMapAnim4IngolfshofdiToHjorleifshofdi"/>
	<Quantum name="q_MapAnim_IngolfshofdiToHjorleifshofdi"/>
	<Quantum name="qs_MapHjorleifshofdi"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qf_KortalagOut"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_Map"/>
	<Quantum name="qp_Hjorleifshofdi"/>
	<Quantum name="q_MoveHjorleifshofdi2IngolfshofdiOut"/>
	<Quantum name="q_MoveVifillIngolfshofdi2Hjorleifshofdi"/>
	<Quantum name="q_MoveKarliIngolfshofdi2Hjorleifshofdi"/>
	<Quantum name="q_Kortalag_stop"/>
	<Quantum name="qf_SilenceAdallag"/>
	<Quantum name="q_Adallag_play"/>
	<Quantum name="q_ToHjorleifshofdi"/>
	<Quantum name="q_MapAnim_stop"/>
	<Quantum name="q_MoveConvKarli2Hjorleifshofdi"/>
	<Quantum name="q_CheckHjorleifshofdiFirstTime"/>
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_Hallveig_none"/>
	<Quantum name="q_Sea_none"/>
	<Quantum name="qf_AdallagIn"/>
	<Quantum name="q_CurrentHjorleifshofdi"/>
	<Quantum name="q_WalkKarliHjorleifshofdi"/>
	<Quantum name="q_WalkVifillHjorleifshofdi"/>
	<Quantum name="q_MoveHjorleifshofdi2IngolfshofdiIn"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="ac_Ingolfshofdi2Hjorleifshofdi" actor="vifill" seq="s_Ingolfshofdi2Hjorleifshofdi"/>

<!-- Hotspot between Hjorleifshofdi and Ingolfshofdi -->
<Sequence name="s_Hjorleifshofdi2Ingolfshofdi">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveHjorleifshofdi2IngolfshofdiOut"/>
	<Quantum name="q_WalkVifillHjorleifshofdiOutRight"/>
	<Quantum name="q_MoveHjorleifshofdi2IngolfshofdiIn"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qf_AdallagOut"/>
	<Quantum name="q_Adallag_stop"/>
	<Quantum name="qu_Hjorleifshofdi"/>
	<Quantum name="qp_Map"/>
	<Quantum name="qf_Kortalag"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="q_Kortalag_play"/>
	<Quantum name="qf_KortalagIn"/>
	<Quantum name="q_MoveMapAnim4HjorleifshofdiToIngolfshofdi"/>
	<Quantum name="q_MapAnim_HjorleifshofdiToIngolfshofdi"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qf_KortalagOut"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="q_MapAnim_stop"/>
	<Quantum name="qu_Map"/>
	<Quantum name="qp_Ingolfshofdi"/>
	<Quantum name="q_Hallveig_prjona"/>
	<Quantum name="q_Sea_sea"/>
	<Quantum name="q_MoveIngolfshofdi2HjorleifshofdiOut"/>
	<Quantum name="q_MoveVifillHjorleifshofdi2Ingolfshofdi"/>
	<Quantum name="q_MoveKarliHjorleifshofdi2Ingolfshofdi"/>
	<Quantum name="q_Kortalag_stop"/>
	<Quantum name="qf_SilenceAdallag"/>
	<Quantum name="q_Adallag_play"/>
	<Quantum name="q_ToIngolfshofdi"/>
	<Quantum name="q_MoveConvKarli2Ingolfshofdi"/>
	<Quantum name="q_heinhverjahugmynd"/>
	<Quantum name="q_hdraugabaerinn"/>
	<Quantum name="q_hgestrisni"/>
	<Quantum name="q_hhonumadbana"/>
	<Quantum name="q_hlataingolfvita"/>
	<Quantum name="q_hholdumaframleitinni"/>
	<Quantum name="q_snennumekki"/>
	<Quantum name="q_svilltumst"/>
	<Quantum name="q_sasporid"/>
	<Quantum name="q_CurrentIngolfshofdi"/>
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="qf_AdallagIn"/>
	<Quantum name="q_WalkVifillIngolfshofdi"/>
	<Quantum name="q_WalkKarliIngolfshofdi"/>
	<Quantum name="q_MoveIngolfshofdi2HjorleifshofdiIn"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="ac_Hjorleifshofdi2Ingolfshofdi" actor="vifill" seq="s_Hjorleifshofdi2Ingolfshofdi"/>

<!-- Hotspot between Hjorleifshofdi and SudurThjorsa -->
<Sequence name="s_Hjorleifshofdi2SudurThjorsa">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveHjorleifshofdi2SudurThjorsaOut"/>
	<Quantum name="q_WalkVifillHjorleifshofdiOutLeft"/>
	<Quantum name="q_MoveHjorleifshofdi2SudurThjorsaIn"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qf_AdallagOut"/>
	<Quantum name="q_Adallag_stop"/>
	<Quantum name="qu_Hjorleifshofdi"/>
	<Quantum name="qp_Map"/>
	<Quantum name="qf_Kortalag"/>
	<Quantum name="q_ToMap"/>
	<Quantum name="q_Kortalag_play"/>
	<Quantum name="qf_KortalagIn"/>
	<Quantum name="q_MoveMapAnim4HjorleifshofdiToThjorsa"/>
	<Quantum name="q_MapAnim_HjorleifshofdiToThjorsa"/>
	<Quantum name="qs_MapThjorsa"/>
	<Quantum name="q_4sec"/>
	<Quantum name="qf_KortalagOut"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_MapAnim_stop"/>
	<Quantum name="qu_Map"/>
	<Quantum name="qh_SudurThjorsa2Hjorleifshofdi"/>
    <Quantum name="q_MoveVifillHjorleifshofdi2SudurThjorsa"/>
	<Quantum name="q_MoveKarliHjorleifshofdi2SudurThjorsa"/>
	<Quantum name="q_Kortalag_stop"/>
	<Quantum name="qf_SilenceAdallag"/>
	<Quantum name="q_Adallag_play"/>
	<Quantum name="q_RiverSound_play"/>
	<Quantum name="qp_SudurThjorsa"/>
	<Quantum name="q_River1_river"/>
	<Quantum name="q_River2_river"/>
	<Quantum name="q_ToSudurThjorsa"/>
    <Quantum name="q_MoveVifillHjorleifshofdi2SudurThjorsa"/>
	<Quantum name="q_ssyndayfir"/>
	<Quantum name="q_ssmidadfleka"/>
	<Quantum name="q_CurrentSudurThjorsa"/>
	<Quantum name="q_hidetextkarli_river"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="qf_AdallagIn"/>
    <Quantum name="q_WalkKarli2SudurThjorsaA"/>
    <Quantum name="q_WalkVifill2SudurThjorsaA"/>
	<Quantum name="qs_SudurThjorsa2Hjorleifshofdi"/>
	<Quantum name="q_KarliLower"/>
	<Quantum name="q_moving"/>
</Sequence>
<Reaction reactor="ac_Hjorleifshofdi2SudurThjorsa" actor="vifill" seq="s_Hjorleifshofdi2SudurThjorsa"/>

<!-- Hotspot between Hjorleifshofdi and Reykjavik -->
<Sequence name="s_Hjorleifshofdi2Reykjavik">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveHjorleifshofdi2ReykjavikOut"/>
	<Quantum name="q_WalkVifillHjorleifshofdiOutLeft"/>
	<Quantum name="q_MoveHjorleifshofdi2ReykjavikIn"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_Sea2_sea"/>
    <Quantum name="qh_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_MoveVifill2Reykjavik"/>
	<Quantum name="q_MoveKarli2Reykjavik"/>
	<Quantum name="qu_Hjorleifshofdi"/>
	<Quantum name="qp_Reykjavik"/>
	<Quantum name="q_ToReykjavik"/>
	<Quantum name="q_WalkKarli2ReykjavikA"/>
	<Quantum name="q_WalkVifill2ReykjavikA"/>
	<Quantum name="q_ssyndayfir"/>
	<Quantum name="q_ssmidadfleka"/>
	<Quantum name="q_CurrentReykjavik"/>
	<Quantum name="q_hidetextkarli_rvk"/>
	<Quantum name="q_hidetextingo"/>
    <Quantum name="qs_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="ac_Hjorleifshofdi2Reykjavik" actor="vifill" seq="s_Hjorleifshofdi2Reykjavik"/>

<!-- Hotspot between SudurThjorsa and Hjorleifshofdi -->
<Sequence name="s_SudurThjorsa2Hjorleifshofdi">
	<Quantum name="q_freeze"/>
	<Quantum name="q_RiverSound_stop"/>
	<Quantum name="q_MoveSudurThjorsa2HjorleifshofdiOut"/>
	<Quantum name="q_MoveHjorleifshofdi2SudurThjorsaOut"/>
	<Quantum name="q_WalkVifillSudurThjorsaOutRight"/>
	<Quantum name="q_MoveSudurThjorsa2HjorleifshofdiIn"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_SudurThjorsa"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_MoveVifillSudurThjorsa2Hjorleifshofdi"/>
	<Quantum name="q_MoveKarliSudurThjorsa2Hjorleifshofdi"/>
	<Quantum name="qp_Hjorleifshofdi"/>
	<Quantum name="q_ToHjorleifshofdi"/>
	<Quantum name="q_hsyndayfir"/>
	<Quantum name="q_hsmidadfleka"/>
	<Quantum name="q_hekkilengra"/>
	<Quantum name="q_River1_none"/>
	<Quantum name="q_River2_none"/>
	<Quantum name="q_CurrentHjorleifshofdi"/>
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_WalkVifillHjorleifshofdi2b"/>
	<Quantum name="q_WalkKarliHjorleifshofdi2b"/>
	<Quantum name="q_MoveHjorleifshofdi2SudurThjorsaIn"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="ac_SudurThjorsa2Hjorleifshofdi" actor="vifill" seq="s_SudurThjorsa2Hjorleifshofdi"/>

<!-- Hotspot between SudurThjorsa and NordurThjorsa -->
<Sequence name="s_SudurThjorsa2NordurThjorsa">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveSudurThjorsa2NordurThjorsaOut"/>
	<Quantum name="q_MoveNordurThjorsa2SudurThjorsaOut"/>
	<Quantum name="q_WalkVifillSudurThjorsaOutUp"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_MoveVifill2NordurThjorsa"/>
	<Quantum name="q_MoveKarli2NordurThjorsa"/>
	<Quantum name="qu_SudurThjorsa"/>
	<Quantum name="qp_NordurThjorsa"/>
	<Quantum name="q_MoveConvKarli_River2NordurThjorsa"/>
	<Quantum name="q_sekkilengra"/>
	<Quantum name="q_hidetextkarli_river"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_ToNordurThjorsa"/>
	<Quantum name="q_MoveVifill2NordurThjorsa"/>
	<Quantum name="q_CurrentNordurThjorsa"/>
	<Quantum name="q_WalkKarli2NordurThjorsaA"/>
	<Quantum name="q_WalkVifill2NordurThjorsaA"/>
	<Quantum name="q_MoveNordurThjorsa2SudurThjorsaIn"/>
	<Quantum name="q_moving"/>
	<Quantum name="q_River1_none"/>
	<Quantum name="q_River2_none"/>
	<Quantum name="q_MoveSudurThjorsa2NordurThjorsaIn"/>
</Sequence>
<Reaction reactor="ac_SudurThjorsa2NordurThjorsa" actor="vifill" seq="s_SudurThjorsa2NordurThjorsa"/>

<!-- Hotspot between NordurThjorsa and SudurThjorsa -->
<Sequence name="s_NordurThjorsa2SudurThjorsa">
	<Quantum name="q_freeze"/>
	<Quantum name="q_MoveNordurThjorsa2SudurThjorsaOut"/>
	<Quantum name="q_MoveSudurThjorsa2NordurThjorsaOut"/>
	<Quantum name="q_WalkVifillNordurThjorsaOutDown"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_NordurThjorsa"/>
	<Quantum name="qp_SudurThjorsa"/>
	<Quantum name="q_MoveVifillNordurThjorsa2SudurThjorsa"/>
	<Quantum name="q_MoveKarli2SudurThjorsaBB"/>
	<Quantum name="q_MoveConvKarli_River2SudurThjorsa"/>
	<Quantum name="q_River1_river"/>
	<Quantum name="q_River2_river"/>
	<Quantum name="q_KarliUpper"/>
	<Quantum name="q_ToSudurThjorsa"/>
	<Quantum name="q_MoveVifillNordurThjorsa2SudurThjorsa"/>
	<Quantum name="q_WalkVifill2SudurThjorsaBB"/>
	<Quantum name="q_CurrentSudurThjorsa"/>
	<Quantum name="q_hekkilengra"/>
	<Quantum name="q_hidetextkarli_river"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_MoveSudurThjorsa2NordurThjorsaIn"/>
	<Quantum name="q_moving"/>
	<Quantum name="q_MoveNordurThjorsa2SudurThjorsaIn"/>
</Sequence>
<Reaction reactor="ac_NordurThjorsa2SudurThjorsa" actor="vifill" seq="s_NordurThjorsa2SudurThjorsa"/>


<!-- Hotspot between Reykjavik and Hjorleifshofdi -->
<Sequence name="s_Reykjavik2Hjorleifshofdi">
	<Quantum name="q_freeze"/>
	<Quantum name="qh_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_MoveHjorleifshofdi2ReykjavikOut"/>
	<Quantum name="q_WalkVifillReykjavikOutRight"/>
	<Quantum name="q_StoppVifill"/>
	<Quantum name="q_stopvifill"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_Sea2_none"/>
	<Quantum name="q_MoveVifillSudurThjorsa2Hjorleifshofdi"/>
	<Quantum name="q_MoveKarliSudurThjorsa2Hjorleifshofdi"/>
	<Quantum name="qu_Reykjavik"/>
	<Quantum name="q_Sea2_none"/>
	<Quantum name="qp_Hjorleifshofdi"/>
	<Quantum name="qs_Reykjavik2Hjorleifshofdi"/>
	<Quantum name="q_ToHjorleifshofdi"/>
	<Quantum name="q_CurrentHjorleifshofdi"/>
	<Quantum name="q_hidetextkarli"/>
	<Quantum name="q_hidetextingo"/>
	<Quantum name="q_WalkVifillHjorleifshofdi2b"/>
	<Quantum name="q_WalkKarliHjorleifshofdi2b"/>
	<Quantum name="q_MoveHjorleifshofdi2ReykjavikIn"/>
	<Quantum name="q_moving"/> </Sequence>
<Reaction reactor="ac_Reykjavik2Hjorleifshofdi" actor="vifill" seq="s_Reykjavik2Hjorleifshofdi"/>

<Sequence name="sp_SudurThjorsa88">
	<Quantum name="qp_SudurThjorsa"/>
	<Quantum name="q_ToSudurThjorsa"/>
</Sequence>
<Sequence name="sp_Reykjavik88">
	<Quantum name="qp_Reykjavik"/>
	<Quantum name="q_ToReykjavik"/>
</Sequence>
<Sequence name="sp_Hjorleifshofdi88">
	<Quantum name="qp_Hjorleifshofdi"/>
	<Quantum name="q_ToHjorleifshofdi"/>
</Sequence>
<Sequence name="sp_Ingolfshofdi88">
	<Quantum name="qp_Ingolfshofdi"/>
	<Quantum name="q_ToIngolfshofdi"/>
</Sequence>
<Sequence name="sp_Skipingolfs88">
	<Quantum name="qp_Skipingolfs"/>
	<Quantum name="q_ToSkipingolfs"/>
</Sequence>
<Sequence name="sp_NordurThjorsa88">
	<Quantum name="qp_NordurThjorsa"/>
	<Quantum name="q_ToNordurThjorsa"/>
</Sequence>
<Sequence name="sp_BeginScene">
	<Quantum name="qp_BeginScene"/>
	<Quantum name="q_ToBeginScene"/>
</Sequence>
<CheckConditionQuantum name="q_CheckPrepare" flag="f_CurrentScene" wait="true">
	<Trigger value="6" seq="sp_Skipingolfs88"/>
	<Trigger value="1" seq="sp_Ingolfshofdi88"/>
	<Trigger value="2" seq="sp_Hjorleifshofdi88"/>
	<Trigger value="3" seq="sp_SudurThjorsa88"/>
	<Trigger value="4" seq="sp_NordurThjorsa88"/>
	<Trigger value="5" seq="sp_Reykjavik88"/>
	<Trigger value="0" seq="sp_BeginScene"/>
</CheckConditionQuantum>
<Sequence name="s_prepare">
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_CheckPrepare"/>
</Sequence>

<Sequence name="song_Skipingolfs">
	<Quantum name="q_Skipslag_play"/>
</Sequence>
<Sequence name="song_Usual">
	<Quantum name="q_Adallag_play"/>
</Sequence>
<Sequence name="song_Kort">
	<Quantum name="q_Kortalag_play"/>
</Sequence>
<Sequence name="s_Sea1">
	<Quantum name="q_Adallag_play"/>
	<Quantum name="q_Sea_sea"/>
</Sequence>
<Sequence name="s_Sea2">
	<Quantum name="q_Adallag_play"/>
	<Quantum name="q_Sea2_sea"/>
</Sequence>
<CheckConditionQuantum name="q_CheckSong" flag="f_CurrentScene" wait="true">
	<Trigger value="6" seq="song_Skipingolfs"/>
	<Trigger value="1" seq="s_Sea1"/>
	<Trigger value="2" seq="song_Usual"/>
	<Trigger value="0" seq="song_Kort"/>
	<Trigger value="3" seq="song_Usual"/>
	<Trigger value="4" seq="song_Usual"/>
	<Trigger value="5" seq="s_Sea2"/>
</CheckConditionQuantum>
<Sequence name="s_always">
    <Quantum name="qp_Skipslag"/>
    <Quantum name="qf_Skipslag"/>
    <Quantum name="qp_Adallag"/>
    <Quantum name="qf_Adallag"/>
	<Quantum name="q_CheckSong"/>
</Sequence>

<Sequence name="s_begin">
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="qf_KortalagOut2"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_BeginScene"/>
	<Quantum name="qp_Skipingolfs"/>
	<Quantum name="q_Kortalag_stop"/>
	<Quantum name="q_Skipslag_play"/>
	<Quantum name="q_ToSkipingolfs"/>
	<Quantum name="q_freeze"/>
	<Quantum name="q_denniheitieg"/>
	<Quantum name="q_stopvifill"/>
	<Quantum name="q_ordinnendanlegarugladur"/>
	<Quantum name="q_stopkarli"/>
	<Quantum name="q_BeginConvKarli1"/>
    <Quantum name="q_CurrentSkipingolfs"/>
	<Quantum name="q_moving"/>
</Sequence>

<Sequence name="s_final">
	<Quantum name="q_Adallag_stop"/>
	<Quantum name="q_Skipslag_stop"/>
</Sequence>



<SetPlayer object="sc" player="vifill"/>
<SetPlayer object="s_SudurThjorsa" player="vifill"/>
<SetPlayer object="s_NordurThjorsa" player="vifill"/>

<BeginningScene scene="s_Skipingolfs"/>

</Body>
