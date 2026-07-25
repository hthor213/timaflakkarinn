<?xml version="1.0" encoding="iso-8859-1"?>

<!DOCTYPE	Body			SYSTEM "scene.dtd" []>

<Body>

<!-- Flags -->

<!-- Flags for scene 2 -->

<!-- Beginning of conversation with Gissur -->
<!-- 0 = first time -->
<!-- 1 = second time and thereafter -->
<ConditionFlag name="f_BeginConvGissurHviti"/>

<!-- Beginning of conversation with Hestasvein -->
<!-- 0 = first time -->
<!-- 1 = second time and thereafter -->
<ConditionFlag name="f_BeginConvHestaSveinn"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence MittVidfraega has not been said -->
<!-- 1 = the sentence MittVidfraega has been said -->
<ConditionFlag name="f_SentenceMittVidfraega"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence ThettaGull has not been said -->
<!-- 1 = the sentence ThettaGull has been said -->
<ConditionFlag name="f_SentenceThettaGull"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence ThennanGullfallegaThorshamar has not been said -->
<!-- 1 = the sentence ThennanGullfallegaThorshamar has been said -->
<ConditionFlag name="f_SentenceThennanGullfallegaThorshamar"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence FleiraHef has not been said -->
<!-- 1 = the sentence FleiraHef has been said -->
<ConditionFlag name="f_SentenceFleiraHef"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence HvadErtThuAdGera has not been said -->
<!-- 1 = the sentence HvadErtThuAdGera has been said -->
<ConditionFlag name="f_SentenceHvadErtThuAdGera"/>
<SetFlagQuantum name="q_HvadErtThuAdGera2" flag="f_SentenceHvadErtThuAdGera" value="2"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence JaejaHallur has not been said -->
<!-- 1 = the sentence JaejaHallur has been said -->
<ConditionFlag name="f_SentenceJaejaHallur"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence AfHverjuVilt has not been said -->
<!-- 1 = the sentence AfHverjuVilt has been said -->
<ConditionFlag name="f_SentenceAfHverjuVilt"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence HvernigListTherA has not been said -->
<!-- 1 = the sentence HvernigListTherA has been said -->
<ConditionFlag name="f_SentenceHvernigListTherA"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence ThuErtLogsogumadur has not been said -->
<!-- 1 = the sentence ThuErtLogsogumadur has been said -->
<ConditionFlag name="f_SentenceThuErtLogsogumadur"/>

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence MaEgEiga has not been said -->
<!-- 1 = the sentence MaEgEiga has been said -->
<ConditionFlag name="f_SentenceMaEgEigaFeldinn"/>

<!-- Flag to determine what is to happen at logberg when Hjalti goes there from Hja hestasveini-->
<!-- 0 = Hjalti is going there for the first time -->
<!-- 1 = Hjalti has been there for the first time and is alone -->
<!-- 2 = Hjalti has Thorgeir with him -->
<!-- 3 = Hjalti has given the fur to Thorgeir and everyone are at logberg again -->
<ConditionFlag name="f_LogbergFromHjaHestasveini"/>
<SetFlagQuantum name="q_LogbergFromHjaHestasveini1" flag="f_LogbergFromHjaHestasveini" value="1"/>
<SetFlagQuantum name="q_LogbergFromHjaHestasveini2" flag="f_LogbergFromHjaHestasveini" value="2"/>
<SetFlagQuantum name="q_LogbergFromHjaHestasveini3" flag="f_LogbergFromHjaHestasveini" value="3"/>

<!-- Flag to determine what is to happen at logberg when Hjalti goes there from Kristnar Budir -->
<!-- 0 = Nothing special is to happen -->
<!-- 1 = Hjalti has Hallur with him -->
<ConditionFlag name="f_LogbergFromKristnarBudir"/>
<SetFlagQuantum name="q_LogbergFromKristnarBudir0" flag="f_LogbergFromKristnarBudir" value="0"/>
<SetFlagQuantum name="q_LogbergFromKristnarBudir1" flag="f_LogbergFromKristnarBudir" value="1"/>

<!-- Flag to determine what is to happen at HjaHestasveini when Hjalti goes there from Heidnar Budir -->
<!-- 0 = Nothing special is to happen -->
<!-- 1 = Hjalti has Toggi with him -->
<ConditionFlag name="f_HjaHestasveiniFromHeidnarBudir"/>
<SetFlagQuantum name="q_HjaHestasveiniFromHeidnarBudir0" flag="f_HjaHestasveiniFromHeidnarBudir" value="0"/>
<SetFlagQuantum name="q_HjaHestasveiniFromHeidnarBudir1" flag="f_HjaHestasveiniFromHeidnarBudir" value="1"/>

<!-- Flag to determine what is to happen at HjaHestasveini when Hjalti goes there from Heidnar Budir -->
<!-- 0 = Nothing special is to happen -->
<!-- 1 = Hjalti has Toggi with him -->
<ConditionFlag name="f_HjaHestasveiniFromLogberg"/>
<SetFlagQuantum name="q_HjaHestasveiniFromLogberg0" flag="f_HjaHestasveiniFromLogberg" value="0"/>
<SetFlagQuantum name="q_HjaHestasveiniFromLogberg1" flag="f_HjaHestasveiniFromLogberg" value="1"/>

<!-- Flag to determine what is to happen at KristnarBudir when Hjalti goes there from Logberg -->
<!-- 0 = Nothing special is to happen -->
<!-- 1 = The first time: Gissur is to speak with Hallur -->
<!-- 2 = Hjalti has Hallur with him -->
<ConditionFlag name="f_KristnarBudirFromLogberg"/>
<SetFlagQuantum name="q_KristnarBudirFromLogberg0" flag="f_KristnarBudirFromLogberg" value="0"/>
<SetFlagQuantum name="q_KristnarBudirFromLogberg1" flag="f_KristnarBudirFromLogberg" value="1"/>
<SetFlagQuantum name="q_KristnarBudirFromLogberg2" flag="f_KristnarBudirFromLogberg" value="2"/>

<!-- Flag to determine what is to happen at HeidnarBudir when Hjalti goes there from HjaHestasveini -->
<!-- 0 = Nothing special is to happen -->
<!-- 1 = The first time: Gissur is to speak with Toggi -->
<!-- 2 = Hjalti has Toggi with him -->
<ConditionFlag name="f_HeidnarBudirFromHjaHestasveini"/>
<SetFlagQuantum name="q_HeidnarBudirFromHjaHestasveini0" flag="f_HeidnarBudirFromHjaHestasveini" value="0"/>
<SetFlagQuantum name="q_HeidnarBudirFromHjaHestasveini1" flag="f_HeidnarBudirFromHjaHestasveini" value="1"/>
<SetFlagQuantum name="q_HeidnarBudirFromHjaHestasveini2" flag="f_HeidnarBudirFromHjaHestasveini" value="2"/>

<ConditionFlag name="f_BeginConvVolva"/>
<IncrementFlagQuantum name="q_BeginConvVolvaInc" flag="f_BeginConvVolva"/>
<SetFlagQuantum name="q_BeginConvVolva3" flag="f_BeginConvVolva" value="3" />

<!-- Flag to determine if this sentence has been added to the conversation between hjalti and hestasveinn -->
<!-- 0 = the sentence GeturThuNokkudUtskyrt has not been said -->
<!-- 1 = the sentence GeturThuNokkudUtskyrt has been said -->
<ConditionFlag name="f_SentenceGeturThuNokkudUtskyrt"/>
<SetFlagQuantum name="q_GeturThuNokkudUtskyrt1" flag="f_SentenceGeturThuNokkudUtskyrt" value="1"/>
<SetFlagQuantum name="q_GeturThuNokkudUtskyrt0" flag="f_SentenceGeturThuNokkudUtskyrt" value="0"/>

<!-- Flag to determine the position of Hallur -->
<!-- 0 Hallur is at kristnar budir -->
<!-- 1 Hallur is at logberg -->
<ConditionFlag name="f_HallurStadsetning"/>
<SetFlagQuantum name="q_HallurStadsetning0" flag="f_HallurStadsetning" value="0"/>
<SetFlagQuantum name="q_HallurStadsetning1" flag="f_HallurStadsetning" value="1"/>

<!-- Flag to determine the position of Toggi -->
<!-- 0 Toggi is at heidnar budir -->
<!-- 1 Toggi is at logberg -->
<!-- 2 Toggi is at hjahestasveini -->
<ConditionFlag name="f_ToggiStadsetning"/>
<SetFlagQuantum name="q_ToggiStadsetning0" flag="f_ToggiStadsetning" value="0"/>
<SetFlagQuantum name="q_ToggiStadsetning1" flag="f_ToggiStadsetning" value="1"/>
<SetFlagQuantum name="q_ToggiStadsetning2" flag="f_ToggiStadsetning" value="2"/>

<ConditionFlag name="f_VolvaSnu"/>
<SetFlagQuantum name="q_VolvaSnu1" flag="f_VolvaSnu" value="1"/>
<SetFlagQuantum name="q_VolvaSnu0" flag="f_VolvaSnu" value="0"/>

<ConditionFlag name="f_Feldur"/>
<SetFlagQuantum name="q_Feldur1" flag="f_Feldur" value="1"/>

<ConditionFlag name="f_Zero"/>

<ConditionFlag name="f_Random6"/>
<RandomSetFlagQuantum name="q_Randomize6" flag="f_Random6" low="0" high="5"/>

<ConditionFlag name="f_Random9"/>
<RandomSetFlagQuantum name="q_Randomize9" flag="f_Random9" low="0" high="8"/>

<ConditionFlag name="f_Random13"/>
<RandomSetFlagQuantum name="q_Randomize13" flag="f_Random13" low="0" high="12"/>

<ConditionFlag name="f_CS"/>
<SetFlagQuantum name="q_CSHjaVolvu" flag="f_CS" value="4"/>
<SetFlagQuantum name="q_CSHjaHestasveini" flag="f_CS" value="7"/>
<SetFlagQuantum name="q_CSErnaRunir" flag="f_CS" value="8"/>
<SetFlagQuantum name="q_CSLogberg" flag="f_CS" value="1"/>
<SetFlagQuantum name="q_CSHeidnarBudir" flag="f_CS" value="2"/>
<SetFlagQuantum name="q_CSKristnarBudir" flag="f_CS" value="3"/>
<SetFlagQuantum name="q_CSRunir" flag="f_CS" value="5"/>
<SetFlagQuantum name="q_CSLetur" flag="f_CS" value="6"/>
<SetFlagQuantum name="q_CSBeginScene" flag="f_CS" value="0"/>


<Polygon name="p_All">
	<Point x="0" y="0"/>
	<Point x="800" y="0"/>
	<Point x="800" y="600"/>
	<Point x="0" y="600"/>
</Polygon>

<!-- Terrains and scenes -->

<!-- Inventory for scene 2 -->
<Scene name="s_Inventory"/>

<SimplePseudo3DTerrain name="t_InventoryBack" scene="s_Inventory" polygon="p_All" zmin="-7" zmax="0"/>
<Inventory name="t_Inventory" scene="s_Inventory" polygon="p_All" zmin="1" zmax="1500"/>

<StaticActorFace name="af_BigInventory" file="\KristniA\Graphic\inventoA\inventoA" prepare="true" transparent="false"/>
<StaticActor name="a_BigInventory" terrain="t_InventoryBack" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_BigInventory"/>
</StaticActor>

<StaticActorFace name="af_PeningurI" file="\KristniA\Graphic\inventoA\peningur" prepare="true"/>
<StaticActorFace name="af_PokarI" file="\KristniA\Graphic\inventoA\pokar" prepare="true"/>
<StaticActorFace name="af_FeldurI" file="\KristniA\Graphic\inventoA\feldur" prepare="true"/>


<!-- Black screen -->
<Scene name="s_Black"/>

<SimplePseudo3DTerrain name="t_Black" scene="s_Black" polygon="p_All" zmin="-7" zmax="0"/>

<Text name="a_NaestaMorgun" text="Næsta morgun." color="white"/>
<MoveActorQuantum name="qs_NaestaMorgun" actor="a_NaestaMorgun" terrain="t_Black"> <Location x="350" y="1280" z="1000"/> </MoveActorQuantum>
<MoveActorQuantum name="qh_NaestaMorgun" actor="a_NaestaMorgun" />

<Text name="a_StuttuSeinna" text="Stuttu seinna á Lögbergi." color="white"/>
<MoveActorQuantum name="qs_StuttuSeinna" actor="a_StuttuSeinna" terrain="t_Black"> <Location x="330" y="1280" z="1000"/> </MoveActorQuantum>
<MoveActorQuantum name="qh_StuttuSeinna" actor="a_StuttuSeinna" />

<PauseQuantum name="q_4sec" time="2500"/>

<Scene name="s_HjaHestasveini"/>

<Polygon name="p_HjaHestasveini">
	<Point x="-600" y="475"/>
	<Point x="-600" y="601"/>
	<Point x="1451" y="601"/>
	<Point x="1451" y="405"/>
	<Point x="801" y="405"/>
	<Point x="455" y="430"/>
	<Point x="420" y="500"/>
	<Point x="275" y="500"/>
	<Point x="240" y="440"/>
	<Point x="-1" y="475"/>
</Polygon>

<SimplePseudo3DTerrain name="t_HjaHestasveini" scene="s_HjaHestasveini" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_HjaHestasveinil" scene="s_HjaHestasveini" polygon="p_HjaHestasveini"
	zmin="0" zmax="800" defaultscaling="1.0" scaling2="1.1" scanline1="600" scanline2="750"/>

<!-- Background for hja hestasveini -->
<StaticActorFace name="af_HjaHestasveini" file="\KristniA\Graphic\hjahestA" transparent="false"/>
<StaticActor name="a_HjaHestasveini" terrain="t_HjaHestasveini" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_HjaHestasveini"/>
</StaticActor>
<PrepareQuantum	name="qp_HjaHestasveini1" object="af_HjaHestasveini" prepare="true"/>
<PrepareQuantum	name="qu_HjaHestasveini1" object="af_HjaHestasveini" prepare="false"/>

<Pseudo3DCollisionBox name="cb_HjaHestasveini2HeidnarBudir" x="4" y="70" z="10"/>
<TransparentActorFace name="af_HjaHestasveini2HeidnarBudir" width="50" height="300"/>
<StaticActor name="a_HjaHestasveini2HeidnarBudir" terrain="t_HjaHestasveinil" x="20" y="565" z="1" state="stop"
		collision="ac_HjaHestasveini2HeidnarBudir">
	<State name="stop" collisionbox="cb_HjaHestasveini2HeidnarBudir"/>
</StaticActor>
<MoveActorQuantum name="qh_HotspotHjaHestasveini2HeidnarBudir" actor="a_HjaHestasveini2HeidnarBudir" />
<MoveActorQuantum name="qs_HotspotHjaHestasveini2HeidnarBudir" actor="a_HjaHestasveini2HeidnarBudir" terrain="t_HjaHestasveinil"/>
<StaticActor name="a_HjaHestasveini2HeidnarBudirFF" terrain="t_HjaHestasveinil" x="0" y="900" z="600" state="stop">
	<State name="stop" face="af_HjaHestasveini2HeidnarBudir"/>
</StaticActor>

<Pseudo3DCollisionBox name="cb_HjaHestasveini2Logberg" x="4" y="180" z="10"/>
<TransparentActorFace name="af_HjaHestasveini2Logberg" width="50" height="300"/>
<StaticActor name="a_HjaHestasveini2Logberg" terrain="t_HjaHestasveinil" x="780" y="505" z="1" state="stop"
		collision="ac_HjaHestasveini2Logberg">
	<State name="stop" collisionbox="cb_HjaHestasveini2Logberg" />
</StaticActor>
<MoveActorQuantum name="qh_HotspotHjaHestasveini2Logberg" actor="a_HjaHestasveini2Logberg" />
<MoveActorQuantum name="qs_HotspotHjaHestasveini2Logberg" actor="a_HjaHestasveini2Logberg" terrain="t_HjaHestasveinil"/>
<StaticActor name="a_HjaHestasveini2LogbergFF" terrain="t_HjaHestasveinil" x="750" y="900" z="600" state="stop">
	<State name="stop" face="af_HjaHestasveini2Logberg"/>
</StaticActor>

<StaticActorFace name="af_FeldurU" file="\KristniA\Graphic\use\feldur" prepare="true"/>
<StaticActor name="a_Feldur" state="taken" x="180" y="349" z="-40" save="true" random="true">
	<State name="taken" face="af_FeldurI" />
	<State name="use" face="af_FeldurU" />
</StaticActor>
<StateQuantum name="q_FeldurTaken" actor="a_Feldur" state="taken"/>

<TransparentActorFace name="af_Skilti" width="79" height="125"/>
<StaticActor name="a_Skilti" terrain="t_HjaHestasveinil" x="667" y="290" z="0" state="stop" random="true">
	<State name="stop" face="af_Skilti"/>
</StaticActor>



<SimplePseudo3DTerrain name="t_Corners" scene="s_HjaHestasveini" polygon="p_All"
	zmin="1000" zmax="2000" defaultscaling="1.0" scrolling="false"/>

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
<StaticActor name="a_SmallInventory" terrain="t_Corners" x="701" y="1000" z="1000" state="stop">
	<State name="stop" face="af_SmallInventory"/>
</StaticActor>


<Text name="a_Text" terrain="t_Corners" text=" " hilite="false" color="yellow"/>

<StateController name="sc" stateactor="a_States" inventoryactor="a_SmallInventory" inventory="s_Inventory" textactor="a_Text"/>
<ActorMoused actor="a_SmallInventory" listener="sc"/>

<SwitchStateQuantum name="q_Moving" state="Moving" controller="sc"/>
<SwitchStateQuantum name="q_Taking" state="Taking" controller="sc"/>
<SwitchStateQuantum name="q_Looking" state="Looking" controller="sc"/>
<SwitchStateQuantum name="q_Talking" state="Talking" controller="sc"/>
<SwitchStateQuantum name="q_Freeze" state="Freeze" controller="sc"/>
<SwitchStateQuantum name="q_Using" state="Using" controller="sc"/>
<SwitchStateQuantum name="q_Conversating" state="Conversating" controller="sc"/>

<ActorMoused actor="a_HjaHestasveini2HeidnarBudirFF" listener="sc" moving="Til heiðinna búða" looking="Til heiðinna búða" taking=" " talking=" "/>
<ActorMoused actor="a_HjaHestasveini2LogbergFF" listener="sc" moving="Til Lögbergs" looking="Til Lögbergs" taking=" " talking=" "/>
<ActorMoused actor="a_Feldur" listener="sc" thf="feld" moving="Feldur" />
<ActorMoused actor="a_Skilti" listener="sc" thf="skilti" moving="Skilti"/>



<Text name="a_Ymsir_acc" terrain="t_Corners" text=" " r="74" g="156" b="14" hilite="false"/>

<Scene name="s_Logberg"/>

<Polygon name="p_Logberg">
	<Point x="-600" y="460"/>
	<Point x="296" y="400"/>
	<Point x="1411" y="400"/>
	<Point x="1411" y="601"/>
	<Point x="-600" y="601"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Logberg" scene="s_Logberg" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Logbergl" scene="s_Logberg" polygon="p_Logberg"
	zmin="0" zmax="800" defaultscaling="0.6" scaling2="0.7" scanline1="500" scanline2="570"/>

<!-- Background for Logberg -->
<StaticActorFace name="af_Logberg" file="\KristniA\Graphic\logberg" transparent="false"/>
<StaticActor name="a_Logberg" terrain="t_Logberg" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Logberg"/>
</StaticActor>
<PrepareQuantum	name="qp_Logberg1" object="af_Logberg"	prepare="true"/>
<PrepareQuantum	name="qu_Logberg1" object="af_Logberg"	prepare="false"/>

<Pseudo3DCollisionBox name="cb_Logberg2HjaHestasveini" x="4" y="168" z="10"/>
<TransparentActorFace name="af_Logberg2HjaHestasveini" width="50" height="300"/>
<StaticActor name="a_Logberg2HjaHestasveini" terrain="t_Logbergl" x="20" y="516" z="1" state="stop"
		collision="ac_Logberg2HjaHestasveini">
	<State name="stop" collisionbox="cb_Logberg2HjaHestasveini"/>
</StaticActor>
<MoveActorQuantum name="qh_HotspotLogberg2HjaHestasveini" actor="a_Logberg2HjaHestasveini" />
<MoveActorQuantum name="qs_HotspotLogberg2HjaHestasveini" actor="a_Logberg2HjaHestasveini" terrain="t_Logbergl"/>
<StaticActor name="a_Logberg2HjaHestasveiniFF" terrain="t_Logbergl" x="0" y="900" z="600" state="stop">
	<State name="stop" face="af_Logberg2HjaHestasveini"/>
</StaticActor>
<ActorMoused actor="a_Logberg2HjaHestasveiniFF" listener="sc" moving="Til hestasveins" looking="Til hestasveins" taking=" " talking=" "/>

<Pseudo3DCollisionBox name="cb_Logberg2KristnarBudir" x="4" y="194" z="10"/>
<TransparentActorFace name="af_Logberg2KristnarBudir" width="50" height="300"/>
<StaticActor name="a_Logberg2KristnarBudir" terrain="t_Logbergl" x="780" y="502" z="1" state="stop"
		collision="ac_Logberg2KristnarBudir">
	<State name="stop" collisionbox="cb_Logberg2KristnarBudir"/>
</StaticActor>
<MoveActorQuantum name="qh_HotspotLogberg2KristnarBudir" actor="a_Logberg2KristnarBudir" />
<MoveActorQuantum name="qs_HotspotLogberg2KristnarBudir" actor="a_Logberg2KristnarBudir" terrain="t_Logbergl"/>
<StaticActor name="a_Logberg2KristnarBudirFF" terrain="t_Logbergl" x="750" y="900" z="600" state="stop">
	<State name="stop" face="af_Logberg2KristnarBudir"/>
</StaticActor>
<ActorMoused actor="a_Logberg2KristnarBudirFF" listener="sc" moving="Til kristinna búða" looking="Til kristinna búða" taking=" " talking=" "/>

<SpeechActorMouth acc="a_Ymsir_acc" name="m_ThadErKominnUpp" file="\kristniA\Media\ymsir\thaderkA.wav" >
	<Sentence text="Þær fregnir voru að berast að..." time="0"/>
	<Sentence text="... það sé kominn upp jarðeldur á Reykjanesi." time="1800"/> </SpeechActorMouth>
<StaticActorFace name="af_Eldmadur_Stop" file="\KristniA\AnimatiA\eldmadur\stop" />
<CelledAnimated2DActorFace name="af_Eldmadur_Talk" file="\KristniA\AnimatiA\eldmadur\talk" repeat="-1" count="7" speed="225"/>
<CelledAnimated2DActorFace name="af_Eldmadur_Sprikl" file="\KristniA\AnimatiA\eldmadur\sprikl" repeat="-1" count="3" speed="150"/>
<StaticActor name="a_Eldmadur" terrain="t_Logbergl" x="220" y="300" z="1" state="stop" save="true">
	<State name="stop" face="af_Eldmadur_Stop"/>
	<State name="rifast" face="af_Eldmadur_Sprikl"/>
	<State name="ThadErKominnUpp" face="af_Eldmadur_Talk" mouth="m_ThadErKominnUpp"/>
</StaticActor>
<PrepareQuantum	name="qp_Logberg2" object="af_Eldmadur_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Logberg2" object="af_Eldmadur_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Logberg3" object="af_Eldmadur_Talk" prepare="true"/>
<PrepareQuantum	name="qu_Logberg3" object="af_Eldmadur_Talk" prepare="false"/>
<PrepareQuantum	name="qp_Logberg4" object="af_Eldmadur_Sprikl" prepare="true"/>
<PrepareQuantum	name="qu_Logberg4" object="af_Eldmadur_Sprikl" prepare="false"/>

<StateQuantum name="q_StopEldmadur" actor="a_Eldmadur" state="stop" wait="false"/>
<StateQuantum name="q_RifastEldmadur" actor="a_Eldmadur" state="rifast" wait="false"/>
<StateQuantum name="q_ThadErKominnUpp" actor="a_Eldmadur" state="ThadErKominnUpp" wait="true"/>

<SpeechActorMouth acc="a_Ymsir_acc" name="m_EigiErUndur" file="\kristniA\Media\ymsir\eigieruA.wav" >
	<Sentence text="Eigi er undur að goðin reiðist tölum slíkum." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Ymsir_acc" name="m_GissurOgHjaltiHafaMaelt" file="\kristniA\Media\ymsir\gissuroA.wav" >
	<Sentence text="Gissur og Hjalti hafa mælt vel en við..." time="0"/>
	<Sentence text="... munum áfram halda tryggð við Þór og Frey." time="3200"/>
	<Sentence text="Lögin munu standa eins og þau eru ..." time="6850"/>
	<Sentence text="... og hafa alltaf verið." time="9050"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Ymsir_acc" name="m_HeyrHeyr" file="\kristniA\Media\ymsir\heyrheyr.wav" >
	<Sentence text="Heyr! Heyr! Já! Já!" time="0"/> </SpeechActorMouth>
<StaticActorFace name="af_Vikingur_Stop" file="\KristniA\AnimatiA\vikingur\stop" />
<CelledAnimated2DActorFace name="af_Vikingur_Talk" file="\KristniA\AnimatiA\vikingur\talk" repeat="-1" count="2" speed="150"/>
<CelledAnimated2DActorFace name="af_Vikingur_Skegg" file="\KristniA\AnimatiA\vikingur\skegg" repeat="2" count="3" speed="150"/>
<CelledAnimated2DActorFace name="af_Vikingur_Hjalmur" file="\KristniA\AnimatiA\vikingur\hjalmur" repeat="-1" count="2" speed="225"/>
<PrepareQuantum	name="qp_Logberg5" object="af_Vikingur_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Logberg5" object="af_Vikingur_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Logberg6" object="af_Vikingur_Talk" prepare="true"/>
<PrepareQuantum	name="qu_Logberg6" object="af_Vikingur_Talk" prepare="false"/>
<PrepareQuantum	name="qp_Logberg7" object="af_Vikingur_Skegg" prepare="true"/>
<PrepareQuantum	name="qu_Logberg7" object="af_Vikingur_Skegg" prepare="false"/>
<PrepareQuantum	name="qp_Logberg8" object="af_Vikingur_Hjalmur" prepare="true"/>
<PrepareQuantum	name="qu_Logberg8" object="af_Vikingur_Hjalmur" prepare="false"/>

<StaticActor name="a_Vikingur" terrain="t_Logbergl" x="200" y="520" z="130" state="stop" save="true">
	<State name="stop" face="af_Vikingur_Stop"/>
	<State name="hjalmur" face="af_Vikingur_Hjalmur"/>
	<State name="skegg" face="af_Vikingur_Skegg"/>
	<State name="EigiErUndur" face="af_Vikingur_Talk" mouth="m_EigiErUndur"/>
	<State name="GissurOgHjaltiHafaMaelt" face="af_Vikingur_Talk" mouth="m_GissurOgHjaltiHafaMaelt"/>
	<State name="HeyrHeyr" face="af_Vikingur_Hjalmur" mouth="m_HeyrHeyr"/>
</StaticActor>

<StateQuantum name="q_StopVikingur" actor="a_Vikingur" state="stop" wait="false"/>
<StateQuantum name="q_HjalmurVikingur" actor="a_Vikingur" state="hjalmur" wait="false"/>
<StateQuantum name="q_SkeggVikingur" actor="a_Vikingur" state="skegg" wait="true"/>
<StateQuantum name="q_EigiErUndur" actor="a_Vikingur" state="EigiErUndur" wait="true"/>
<StateQuantum name="q_GissurOgHjaltiHafaMaelt" actor="a_Vikingur" state="GissurOgHjaltiHafaMaelt" wait="true"/>
<StateQuantum name="q_HeyrHeyr" actor="a_Vikingur" state="HeyrHeyr" wait="true"/>

<SpeechActorMouth acc="a_Ymsir_acc" name="m_UmHvadReiddust" file="\kristniA\Media\ymsir\umhvadrA.wav" >
	<Sentence text="Um hvað reiddust goðin þá er hér ..." time="0"/>
	<Sentence text="... brann hraunið er nú stöndum vér á?" time="2900"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Ymsir_acc" name="m_Sammala" file="\kristniA\Media\ymsir\sammala.wav" >
	<Sentence text="Já! Já! Við erum sammála!" time="0"/> </SpeechActorMouth>
<StaticActorFace name="af_Snorri_Stop" file="\KristniA\AnimatiA\snorri\stop" prepare="true"/>
<CelledAnimated2DActorFace name="af_Snorri_Talk" file="\KristniA\AnimatiA\snorri\talk" repeat="-1" count="2" speed="150"/>
<CelledAnimated2DActorFace name="af_Snorri_Skegg" file="\KristniA\AnimatiA\snorri\skegg" repeat="2" count="2" speed="150"/>
<CelledAnimated2DActorFace name="af_Snorri_Enni" file="\KristniA\AnimatiA\snorri\enni" repeat="-1" count="2" speed="225"/>
<PrepareQuantum	name="qp_Logberg9" object="af_Snorri_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Logberg9" object="af_Snorri_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Logberg10" object="af_Snorri_Talk" prepare="true"/>
<PrepareQuantum	name="qu_Logberg10" object="af_Snorri_Talk" prepare="false"/>
<PrepareQuantum	name="qp_Logberg11" object="af_Snorri_Skegg" prepare="true"/>
<PrepareQuantum	name="qu_Logberg11" object="af_Snorri_Skegg" prepare="false"/>
<PrepareQuantum	name="qp_Logberg12" object="af_Snorri_Enni" prepare="true"/>
<PrepareQuantum	name="qu_Logberg12" object="af_Snorri_Enni" prepare="false"/>

<StaticActor name="a_Snorri" terrain="t_Logbergl" x="550" y="550" z="150" state="stop" save="true">
	<State name="stop" face="af_Snorri_Stop"/>
	<State name="enni" face="af_Snorri_Enni"/>
	<State name="skegg" face="af_Snorri_Skegg"/>
	<State name="UmHvadReiddust" face="af_Snorri_Talk" mouth="m_UmHvadReiddust"/>
	<State name="Sammala" face="af_Snorri_Enni" mouth="m_Sammala"/>
</StaticActor>

<StateQuantum name="q_StopSnorri" actor="a_Snorri" state="stop" wait="false"/>
<StateQuantum name="q_EnniSnorri" actor="a_Snorri" state="enni" wait="false"/>
<StateQuantum name="q_SkeggSnorri" actor="a_Snorri" state="skegg" wait="true"/>
<StateQuantum name="q_UmHvadReiddust" actor="a_Snorri" state="UmHvadReiddust" wait="true"/>
<StateQuantum name="q_Sammala" actor="a_Snorri" state="Sammala" wait="true"/>



<Scene name="s_HeidnarBudir"/>

<Polygon name="p_HeidnarBudir">
	<Point x="1401" y="601"/>
	<Point x="1401" y="498"/>
	<Point x="240" y="498"/>
	<Point x="230" y="400"/>
	<Point x="-150" y="50"/>
	<Point x="-150" y="460"/>
	<Point x="120" y="480"/>
	<Point x="100" y="601"/>
</Polygon>

<SimplePseudo3DTerrain name="t_HeidnarBudir" scene="s_HeidnarBudir" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_HeidnarBudirl" scene="s_HeidnarBudir" polygon="p_HeidnarBudir"
	zmin="0" zmax="800" defaultscaling="0.7" scaling2="0.8" scanline1="500" scanline2="570"/>

<!-- Background for HeidnarBudir -->
<StaticActorFace name="af_HeidnarBudir" file="\KristniA\Graphic\heidnarA" transparent="false"/>
<StaticActor name="a_HeidnarBudir" terrain="t_HeidnarBudir" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_HeidnarBudir"/>
</StaticActor>
<PrepareQuantum	name="qp_HeidnarBudir1" object="af_HeidnarBudir" prepare="true"/>
<PrepareQuantum	name="qu_HeidnarBudir1" object="af_HeidnarBudir" prepare="false"/>

<Pseudo3DCollisionBox name="cb_HeidnarBudir2HjaVolvu" x="50" y="20" z="4"/>
<TransparentActorFace name="af_HeidnarBudir2HjaVolvu" width="139" height="216" />
<StaticActor name="a_HeidnarBudir2HjaVolvu" terrain="t_HeidnarBudirl" x="165" y="515" z="1" state="stop"
		collision="ac_HeidnarBudir2HjaVolvu" save="true">
	<State name="stop" collisionbox="cb_HeidnarBudir2HjaVolvu"/>
</StaticActor>
<StaticActor name="a_Trans2HjaVolvu" x="118" y="461" z="150" state="stop" save="true">
	<State name="stop" face="af_HeidnarBudir2HjaVolvu"/>
</StaticActor>
<ActorMoused actor="a_Trans2HjaVolvu" listener="sc" moving="Fara bak við skálann" looking="Fara bak við skálann" taking=" " talking=" "/>
<MoveActorQuantum name="qh_HotspotHeidnarBudir2HjaVolvu" actor="a_HeidnarBudir2HjaVolvu" />
<MoveActorQuantum name="qs_HotspotHeidnarBudir2HjaVolvu" actor="a_HeidnarBudir2HjaVolvu" terrain="t_HeidnarBudirl"/>
<MoveActorQuantum name="qs_Trans2HjaVolvu" actor="a_Trans2HjaVolvu" terrain="t_HeidnarBudirl"/>

<Pseudo3DCollisionBox name="cb_HeidnarBudir2HjaHestasveini" x="4" y="100" z="10"/>
<TransparentActorFace name="af_HeidnarBudir2HjaHestasveini" width="50" height="300"/>
<StaticActor name="a_HeidnarBudir2HjaHestasveini" x="780" y="550" z="1" state="stop" terrain="t_HeidnarBudirl"
		collision="ac_HeidnarBudir2HjaHestasveini">
	<State name="stop" collisionbox="cb_HeidnarBudir2HjaHestasveini"/>
</StaticActor>
<MoveActorQuantum name="qh_HotspotHeidnarBudir" actor="a_HeidnarBudir2HjaHestasveini" />
<MoveActorQuantum name="qs_HotspotHeidnarBudir" actor="a_HeidnarBudir2HjaHestasveini" terrain="t_HeidnarBudirl"/>
<StaticActor name="a_HeidnarBudir2HjaHestasveiniFF" x="750" y="900" z="600" state="stop" terrain="t_HeidnarBudirl">
	<State name="stop" face="af_HeidnarBudir2HjaHestasveini"/>
</StaticActor>
<ActorMoused actor="a_HeidnarBudir2HjaHestasveiniFF" listener="sc" moving="Til hestasveins" looking="Til hestasveins" taking=" " talking=" "/>

<StaticActorFace name="af_Peningur" file="\KristniA\Graphic\peningur"/>
<StaticActorFace name="af_PeningurU" file="\KristniA\Graphic\use\peningur" prepare="true"/>
<StaticActor name="a_Peningur" terrain="t_HeidnarBudir" x="647" y="472" z="1" state="stop" save="true" random="true">
	<State name="stop" face="af_Peningur"/>
	<State name="taken" face="af_PeningurI"/>
	<State name="use" face="af_PeningurU"/>
</StaticActor>
<StateQuantum name="q_PeningurTaken" actor="a_Peningur" state="taken"/>
<ActorMoused actor="a_Peningur" listener="sc" thf="pening" moving="Peningur"/>
<PrepareQuantum	name="qp_HeidnarBudir2" object="af_Peningur" prepare="true"/>
<PrepareQuantum	name="qu_HeidnarBudir2" object="af_Peningur" prepare="false"/>

<StaticActorFace name="af_Skali" file="\KristniA\Graphic\skali" />
<StaticActor name="a_Skali" terrain="t_HeidnarBudir" x="0" y="460" z="254" state="stop" >
	<State name="stop" face="af_Skali"/>
</StaticActor>
<PrepareQuantum	name="qu_HeidnarBudir3" object="af_Skali" prepare="false"/>
<PrepareQuantum	name="qp_HeidnarBudir3" object="af_Skali" prepare="true"/>


<Pseudo3DCollisionBox name="cb_Pokar" x="90" y="50" z="95"/>
<StaticActorFace name="af_Pokar" file="\KristniA\Graphic\pokar" />
<StaticActorFace name="af_PokarU" file="\KristniA\Graphic\use\pokar" prepare="true"/>
<StaticActor name="a_Pokar" terrain="t_HeidnarBudirl" x="165" y="516" z="8" state="stop" save="true" random="true">
	<State name="stop" face="af_Pokar" collisionbox="cb_Pokar"/>
	<State name="taken" face="af_PokarI"/>
	<State name="use" face="af_PokarU"/>
</StaticActor>
<StateQuantum name="q_PokarTaken" actor="a_Pokar" state="taken"/>
<ActorMoused actor="a_Pokar" listener="sc" moving="Pokar" thf="poka"/>
<PrepareQuantum	name="qu_HeidnarBudir4" object="af_Pokar" prepare="false"/>
<PrepareQuantum	name="qp_HeidnarBudir4" object="af_Pokar" prepare="true"/>


<Scene name="s_KristnarBudir"/>

<Polygon name="p_KristnarBudir">
	<Point x="-550" y="500"/>
	<Point x="645" y="485"/>
	<Point x="745" y="601"/>
	<Point x="-550" y="601"/>
</Polygon>

<SimplePseudo3DTerrain name="t_KristnarBudir" scene="s_KristnarBudir" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_KristnarBudirl" scene="s_KristnarBudir" polygon="p_KristnarBudir"
	zmin="0" zmax="800" defaultscaling="0.7" scaling2="0.8" scanline1="500" scanline2="700"/>

<!-- Background for KristnarBudir -->
<StaticActorFace name="af_KristnarBudir" file="\KristniA\Graphic\kristnaA" transparent="false"/>
<StaticActor name="a_KristnarBudir" terrain="t_KristnarBudir" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_KristnarBudir"/>
</StaticActor>
<PrepareQuantum	name="qp_KristnarBudir"	object="af_KristnarBudir"	prepare="true"/>
<PrepareQuantum	name="qu_KristnarBudir"	object="af_KristnarBudir"	prepare="false"/>

<Pseudo3DCollisionBox name="cb_KristnarBudir2Logberg" x="4" y="88" z="10"/>
<TransparentActorFace name="af_KristnarBudir2Logberg" width="50" height="300"/>
<StaticActor name="a_KristnarBudir2Logberg" terrain="t_KristnarBudirl" x="20" y="556" z="1" state="stop"
		collision="ac_KristnarBudir2Logberg">
	<State name="stop" collisionbox="cb_KristnarBudir2Logberg"/>
</StaticActor>
<MoveActorQuantum name="qh_HotspotKristnarBudir2Logberg" actor="a_KristnarBudir2Logberg" />
<MoveActorQuantum name="qs_HotspotKristnarBudir2Logberg" actor="a_KristnarBudir2Logberg" terrain="t_KristnarBudirl"/>
<StaticActor name="a_KristnarBudir2LogbergFF" terrain="t_KristnarBudirl" x="0" y="900" z="600" state="stop">
	<State name="stop" face="af_KristnarBudir2Logberg"/>
</StaticActor>
<ActorMoused actor="a_KristnarBudir2LogbergFF" listener="sc" moving="Til Lögbergs" looking="Til Lögbergs" taking=" " talking=" "/>

<TransparentActorFace name="af_Runir" width="55" height="53"/>
<StaticActor name="a_Runir" terrain="t_KristnarBudirl" x="400" y="340" z="1" state="stop">
	<State name="stop" face="af_Runir"/>
</StaticActor>
<ActorMoused actor="a_Runir" listener="sc" moving="Steinristur" thf="steinristur"/>

<TransparentActorFace name="af_Letur" width="65" height="50"/>
<StaticActor name="a_Letur" terrain="t_KristnarBudirl" x="510" y="350" z="1" state="stop">
	<State name="stop" face="af_Letur"/>
</StaticActor>
<ActorMoused actor="a_Letur" listener="sc" thf="steinristur" moving="Steinristur"/>

<TransparentActorFace name="af_Tjald" width="157" height="308"/>
<StaticActor name="a_Tjald" terrain="t_KristnarBudirl" x="644" y="242" z="1" state="stop" random="true">
	<State name="stop" face="af_Tjald"/>
</StaticActor>
<ActorMoused actor="a_Tjald" listener="sc" thf="tjald" moving="Tjald"/>



<Scene name="s_HjaVolvu"/>

<Polygon name="p_HjaVolvu">
	<Point x="250" y="595"/>
	<Point x="300" y="545"/>
	<Point x="495" y="545"/>
	<Point x="507" y="507"/>
	<Point x="801" y="532"/>
	<Point x="1201" y="532"/>
	<Point x="1201" y="601"/>
	<Point x="770" y="601"/>
	<Point x="770" y="595"/>
</Polygon>

<SimplePseudo3DTerrain name="t_HjaVolvu" scene="s_HjaVolvu" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_HjaVolvul" scene="s_HjaVolvu" polygon="p_HjaVolvu"
	zmin="0" zmax="800" defaultscaling="1.0" scaling2="1.1" scanline1="500" scanline2="800"/>

<!-- Background for HjaVolvu -->
<StaticActorFace name="af_HjaVolvu" file="\KristniA\Graphic\hjavolvu" transparent="false"/>
<StaticActor name="a_HjaVolvu" terrain="t_HjaVolvu" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_HjaVolvu"/>
</StaticActor>
<PrepareQuantum	name="qp_HjaVolvu" object="af_HjaVolvu" prepare="true"/>
<PrepareQuantum	name="qu_HjaVolvu" object="af_HjaVolvu" prepare="false"/>

<Pseudo3DCollisionBox name="cb_HjaVolvu2HeidnarBudir" x="4" y="60" z="10"/>
<TransparentActorFace name="af_HjaVolvu2HeidnarBudir" width="50" height="480" />
<StaticActor name="a_HjaVolvu2HeidnarBudir" terrain="t_HjaVolvul" x="780" y="570" z="1" state="stop"
		collision="ac_HjaVolvu2HeidnarBudir">
	<State name="stop" collisionbox="cb_HjaVolvu2HeidnarBudir" />
</StaticActor>
<MoveActorQuantum name="qh_HotspotHjaVolvu2HeidnarBudir" actor="a_HjaVolvu2HeidnarBudir"/>
<MoveActorQuantum name="qs_HotspotHjaVolvu2HeidnarBudir" actor="a_HjaVolvu2HeidnarBudir" terrain="t_HjaVolvul"/>
<StaticActor name="a_HjaVolvu2HeidnarBudirFF" terrain="t_HjaVolvul" x="750" y="820" z="700" state="stop">
	<State name="stop" face="af_HjaVolvu2HeidnarBudir" />
</StaticActor>
<ActorMoused actor="a_HjaVolvu2HeidnarBudirFF" listener="sc" moving="Til heiðinna búða" looking="Til heiðinna búða" taking=" " talking=" "/>

<TransparentActorFace name="af_Pottur" width="78" height="102"/>
<StaticActor name="a_Pottur" terrain="t_HjaVolvul" x="223" y="359" z="0" state="stop" random="true">
	<State name="stop" face="af_Pottur"/>
</StaticActor>
<ActorMoused actor="a_Pottur" listener="sc" thf="pott" moving="Pottur"/>

<TransparentActorFace name="af_Letrun" width="101" height="61"/>
<StaticActor name="a_Letrun" terrain="t_HjaVolvul" x="124" y="472" z="0" state="stop" random="true">
	<State name="stop" face="af_Letrun"/>
</StaticActor>
<ActorMoused actor="a_Letrun" listener="sc" thf="áletrun" moving="Áletrun"/>

<TransparentActorFace name="af_Trog" width="57" height="56"/>
<StaticActor name="a_Trog" terrain="t_HjaVolvul" x="118" y="401" z="0" state="stop" random="true">
	<State name="stop" face="af_Trog"/>
</StaticActor>
<ActorMoused actor="a_Trog" listener="sc" thf="trog" moving="Trog"/>

<TransparentActorFace name="af_Ledur" width="85" height="180"/>
<StaticActor name="a_Ledur" terrain="t_HjaVolvul" x="145" y="99" z="100" state="stop" random="true">
	<State name="stop" face="af_Ledur"/>
</StaticActor>
<ActorMoused actor="a_Ledur" listener="sc" thf="leður" moving="Leður"/>

<TransparentActorFace name="af_PottaFest" width="59" height="283"/>
<StaticActor name="a_PottaFest" terrain="t_HjaVolvul" x="233" y="103" z="0" state="stop" random="true">
	<State name="stop" face="af_PottaFest"/>
</StaticActor>
<ActorMoused actor="a_PottaFest" listener="sc" thf="pottsfestingu" moving="PottsFesting"/>



<Scene name="s_Runir"/>

<Polygon name="p_Runir">
	<Point x="-1" y="-400"/>
	<Point x="801" y="-400"/>
	<Point x="801" y="601"/>
	<Point x="-1" y="601"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Runir" scene="s_Runir" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Runirl" scene="s_Runir" polygon="p_Runir"
	zmin="0" zmax="800" defaultscaling="0.7"/>

<!-- Background for Runir -->
<StaticActorFace name="af_Runir2" file="\KristniA\Graphic\runir" transparent="false"/>
<StaticActor name="a_Runir2" terrain="t_Runir" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Runir2"/>
</StaticActor>
<ActorMoused actor="a_Runir2" listener="sc" looking="Til baka" moving="Til baka" talking="Til baka" taking="Til baka"/>

<Pseudo3DCollisionBox name="cb_Runir2KristnarBudir" x="760" y="10" z="10"/>
<StaticActor name="a_Runir2KristnarBudir" terrain="t_Runirl" x="400" y="-144" z="1" state="stop"
		collision="ac_Runir2KristnarBudir">
	<State name="stop" collisionbox="cb_Runir2KristnarBudir"/>
</StaticActor>

<PrepareQuantum	name="qp_Runir" object="af_Runir2" prepare="true"/>
<PrepareQuantum	name="qu_Runir" object="af_Runir2" prepare="false"/>

<SwitchSceneQuantum	name="q_ToRunir" scene="s_Runir"/>

<Scene name="s_ErnaRunir"/>

<SimplePseudo3DTerrain name="t_ErnaRunir" scene="s_ErnaRunir" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_ErnaRunirl" scene="s_ErnaRunir" polygon="p_Runir"
	zmin="0" zmax="800" defaultscaling="0.7"/>

<!-- Background for ErnaRunir -->
<StaticActorFace name="af_ErnaRunir" file="\KristniA\Graphic\storerna" transparent="false"/>
<StaticActor name="a_ErnaRunir" terrain="t_ErnaRunir" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_ErnaRunir"/>
</StaticActor>
<ActorMoused actor="a_ErnaRunir" listener="sc" looking="Til baka" moving="Til baka" talking="Til baka" taking="Til baka"/>

<Pseudo3DCollisionBox name="cb_Runir2HjaVolvu" x="760" y="10" z="10"/>
<StaticActor name="a_Runir2HjaVolvu" terrain="t_ErnaRunirl" x="400" y="-144" z="1" state="stop"
		collision="ac_Runir2HjaVolvu">
	<State name="stop" collisionbox="cb_Runir2HjaVolvu"/>
</StaticActor>

<PrepareQuantum	name="qp_ErnaRunir" object="af_ErnaRunir" prepare="true"/>
<PrepareQuantum	name="qu_ErnaRunir" object="af_ErnaRunir" prepare="false"/>

<SwitchSceneQuantum	name="q_ToErnaRunir" scene="s_ErnaRunir"/>

<Scene name="s_Letur"/>

<SimplePseudo3DTerrain name="t_Letur" scene="s_Letur" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Leturl" scene="s_Letur" polygon="p_Runir"
	zmin="0" zmax="800" defaultscaling="0.7"/>

<!-- Background for Letur -->
<StaticActorFace name="af_Letur2" file="\KristniA\Graphic\letur" transparent="false"/>
<StaticActor name="a_Letur2" terrain="t_Letur" x="0" y="0" z="0" state="stop">
	<State name="stop" face="af_Letur2"/>
</StaticActor>
<ActorMoused actor="a_Letur2" listener="sc" looking="Til baka" moving="Til baka" talking="Til baka" taking="Til baka"/>

<Pseudo3DCollisionBox name="cb_Letur2KristnarBudir" x="760" y="10" z="10"/>
<StaticActor name="a_Letur2KristnarBudir" terrain="t_Leturl" x="400" y="-144" z="1" state="stop"
		collision="ac_Letur2KristnarBudir">
	<State name="stop" collisionbox="cb_Letur2KristnarBudir"/>
</StaticActor>

<PrepareQuantum	name="qp_Letur" object="af_Letur2" prepare="true"/>
<PrepareQuantum	name="qu_Letur" object="af_Letur2" prepare="false"/>

<SwitchSceneQuantum	name="q_ToLetur" scene="s_Letur"/>

<!-- Actors -->

<!-- Hjalti -->

<Text name="a_Hjalti_acc" terrain="t_Corners" text=" " color="white" hilite="false"/>

<SpeechActorMouth name="m_saell" file="\Landnam\Media\vifill\saell.wav" acc="a_Hjalti_acc">
	<Sentence text="Sæll!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HvarErumVid" file="\kristniA\Media\hjalti\hvareruA.wav">
	<Sentence text="Hvar erum við staddir?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_Gissur" file="\kristniA\Media\hjalti\gissur2.wav">
	<Sentence text="Sæll!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HvadErUmAdVera" file="\kristniA\Media\hjalti\hvaderuA.wav">
	<Sentence text="Hvað er um að vera?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HvadaArEr" file="\kristniA\Media\hjalti\hvadaarA.wav" >
	<Sentence text="Hvaða ár er eiginlega núna?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_NuJa" file="\kristniA\Media\hjalti\nuja.wav" >
	<Sentence text="Nú já!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_NeiNeiAllsEkki" file="\kristniA\Media\hjalti\neineiaA.wav" >
	<Sentence text="Nei, nei! Alls ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_BidduBiddu" file="\kristniA\Media\hjalti\biddubiA.wav" >
	<Sentence text="Bíddu bíddu, af hverju?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HeHeHe" file="\kristniA\Media\hjalti\hehehe.wav" >
	<Sentence text="He he he!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HverErtThu" file="\kristniA\Media\hjalti\hverertA.wav" >
	<Sentence text="Hver ert þú?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_AfHverjuVillOlafur" file="\kristniA\Media\hjalti\afhverjA.wav" >
	<Sentence text="Af hverju vill Ólafur Tryggvason Noregskonungur láta kristna Íslendinga? ..." time="0"/>
	<Sentence text="...Mega þeir ekki trúa því sem þeir vilja?" time="4205"/></SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_AfHverjuErEkkiIFinu" file="\kristniA\Media\hjalti\afhverjB.wav" >
	<Sentence text="Af hverju er ekki í fínu lagi að sumir Íslendingar ..." time="0"/>
	<Sentence text="... trúi á heiðnu goðin en aðrir á Jesúm Krist?" time="2300"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_TruirThuAKrist" file="\kristniA\Media\hjalti\truirthA.wav" >
	<Sentence text="Trúir þú á Krist?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HvernigEigumVid" file="\kristniA\Media\hjalti\hvernigA.wav" >
	<Sentence text="Hvernig eigum við að fara að því að kristna Íslendinga?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HvadErAlthingi" file="\kristniA\Media\hjalti\hvaderaA.wav" >
	<Sentence text="Hvað er Alþingi?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_AudvitadThadVita" file="\kristniA\Media\hjalti\audvitaA.wav" >
	<Sentence text="Auðvitað, það vita nú allir." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_JaErThad" file="\kristniA\Media\hjalti\jaerthad.wav" >
	<Sentence text="Já er það! Merkilegt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_JaThuMeinarThaaad" file="\kristniA\Media\hjalti\jathumeA.wav" >
	<Sentence text="Já! Þú meinar það." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HaEg" file="\kristniA\Media\hjalti\haeg.wav" >
	<Sentence text="Ha ég? Nei, nei, nei!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_AudvitadManEgEftirThvi" file="\kristniA\Media\hjalti\audvitaB.wav" >
	<Sentence text="Auðvitað man ég eftir því." time="0"/>
	<Sentence text="Hvaða vitleysa er þetta eiginlega í mér?" time="2580"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_SaellHver" file="\kristniA\Media\hjalti\saellhvA.wav" >
	<Sentence text="Sæll! Hver ert þú?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_ErFallegiFeldurinn" file="\kristniA\Media\hjalti\erfalleA.wav" >
	<Sentence text="Er fallegi feldurinn þinn til sölu?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_HvadErtThuAdGera" file="\kristniA\Media\hjalti\hvadertA.wav" >
	<Sentence text="Hvað ert þú eiginlega að gera hér?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_MaEgEigaFeldinn" file="\kristniA\Media\hjalti\maegeigA.wav" >
	<Sentence text="Má ég eiga feldinn þinn?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_MittVidfraega" file="\kristniA\Media\hjalti\mittvidA.wav" >
	<Sentence text="Mitt víðfræga, fallega og indæla bros ..." time="0"/>
	<Sentence text="... og kannski smá söng." time="3254"/>
	<Sentence text="La la la la la la la lí lú la." time="5000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_Ekkert" file="\kristniA\Media\hjalti\ekkert.wav" >
	<Sentence text="Ekkert!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_ThettaGull" file="\kristniA\Media\hjalti\thettagA.wav" >
	<Sentence text="Þetta gull sem mér áskotnaðist." time="0"/>
	<Sentence text="Ég hef heyrt að það sé mjög hlýtt." time="3000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_ThennanGullfallegaThorshamar" file="\kristniA\Media\hjalti\thennanA.wav" >
	<Sentence text="Þennan gullfallega Þórshamar." time="0"/>
	<Sentence text="Það hvíslaði því einhver að mér að hann sé úr ..." time="3200"/>
	<Sentence text="... fínasta gulli!" time="5122"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_FleiraHef" file="\kristniA\Media\hjalti\fleirahA.wav" >
	<Sentence text="Fleira hef ég ekki að bjóða þér nema þá kannski ..." time="0"/>
	<Sentence text="... þennan fátæklega kross." time="3050"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_GissurHvitiHefurLog" file="\kristniA\Media\hjalti\gissurhA.wav" >
	<Sentence text="Gissu hvíti hefur lög að mæla, ..." time="0"/>
	<Sentence text="... en það eru líka aðrar ástæður fyrir því ..." time="2160"/>
	<Sentence text="... að hér láti allir skírast til kristni." time="4320"/>
	<Sentence text="Það er hætt við því að Ísland muni loga í ófriði ..." time="7320"/>
	<Sentence text="... ef við látum tvenn trúarbrögð viðgangast hér samhliða." time="10563"/>
	<Sentence text="Til að friður haldist hér á landi verðum við að hafa ..." time="14417"/>
	<Sentence text="... eina trú og ein lög." time="17466"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc"  name="m_GeturThuNokkudUtskyrt" file="\kristniA\Media\hjalti\geturthA.wav" >
	<Sentence text="Getur þú nokkuð útskýrt fyrir mér ..." time="0"/>
	<Sentence text="... um hvað deilurnar snúast?" time="1585"/></SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_HvadErKlukkan" file="\kristniA\Media\hjalti\hvaderkA.wav" >
	<Sentence text="Hvað er klukkan?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_NuHofumVidSagt" file="\kristniA\Media\hjalti\nuhofumA.wav" >
	<Sentence text="Nú höfum við sagt okkur úr lögum við heiðna menn ..." time="0"/>
	<Sentence text="... og þú verður að segja upp ný lög fyrir kristna ..." time="2500"/>
	<Sentence text="... menn á Íslandi því að þú ert okkar lögspakastur." time="4348"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_JaejaHallur" file="\kristniA\Media\hjalti\jaejahaA.wav" >
	<Sentence text="Jæja Hallur, hvernig hangir hann?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_AfHverjuVilt" file="\kristniA\Media\hjalti\afhverjC.wav" >
	<Sentence text="Af hverju vilt þú ekki segja upp lög fyrir kristna menn?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_EgHefSvolitidMerkilegt" file="\kristniA\Media\hjalti\eghefsvA.wav" >
	<Sentence text="Ég hef svolítið merkilegt að sýna þér." time="0"/>
	<Sentence text="Vilt þú fylgja mér?" time="1990"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_BidduHerEftir" file="\kristniA\Media\hjalti\bidduheA.wav" >
	<Sentence text="Bíddu hér eftir mér." time="0"/>
	<Sentence text="Ég þarf aðeins að víkja mér frá." time="943" /> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_EgErBuinnAdGleymaHvad" file="\kristniA\Media\hjalti\egerbuiA.wav" >
	<Sentence text="Ég er búinn að gleyma hvað það var sem ég ..." time="0"/>
	<Sentence text="... ætlaði að sýna þér. Þú getur snúið til baka" time="1570"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_EgErBuinnAdGleyma" file="\kristniA\Media\hjalti\egerbuiB.wav" >
	<Sentence text="Ég er búinn að gleyma hvað það var sem ég ætlaði að sýna þér." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_OJaThaad" file="\kristniA\Media\hjalti\ojathaad.wav" >
	<Sentence text="Ó, já! Það!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_HvernigListTherA" file="\kristniA\Media\hjalti\hvernigB.wav" >
	<Sentence text="Hvernig líst þér á að láta skírast til kristinnar trúar?" time="0"/>
	<Sentence text="Kristur er voldugri en Þór og Freyr til samans." time="2924"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThuErtLogsogumadur" file="\kristniA\Media\hjalti\thuertlA.wav" >
	<Sentence text="Þú ert lögsögumaður Alþingis ..." time="0"/>
	<Sentence text="... og lögvitrastur allra á Íslandi. ..." time="2000"/>
	<Sentence text="... Sérð þú einhver ráð í þessari erfiðu stöðu?" time="4355"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_EgLumaAMjog" file="\kristniA\Media\hjalti\eglumaaA.wav" >
	<Sentence text="Ég luma á mjög ljúffengu skyri hér steinsnar frá." time="0"/>
	<Sentence text="Vilt þú fylgja mér?" time="4485"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_AeFyrirgefdu" file="\kristniA\Media\hjalti\aefyrirA.wav" >
	<Sentence text="Æ, fyrirgefðu Þorgeir, en ég man það núna ..." time="0"/>
	<Sentence text="... að ég kláraði allt skyrið í gærkveldi." time="3550"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ViltuVeraSvoVaenn" file="\kristniA\Media\hjalti\viltuveA.wav" >
	<Sentence text="Viltu vera svo vænn að bíða eftir mér hér." time="0"/>
	<Sentence text="Ég ætla að sækja skyrið." time="2411"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_HvadaNidurstodu" file="\kristniA\Media\hjalti\hvadaniA.wav" >
	<Sentence text="Hvaða niðurstöðu komust þið Hallur að?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_HversVegnaStendurThu" file="\kristniA\Media\hjalti\hversveA.wav" >
	<Sentence text="Hvers vegna stendur þú hér og gerir ekkert annað?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_HaMi" file="\kristniA\Media\hjalti\hami.wav" >
	<Sentence text="Ha, mi- mi- mig?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_EgUtvegadi" file="\kristniA\Media\hjalti\egutvegA.wav" >
	<Sentence text="Ég útvegaði þér þennan feld ..." time="0"/>
	<Sentence text="... til þess að þér yrði ekki kalt og þú gætir fengið frið ..." time="2850"/>
	<Sentence text="... til þess að hugsa málið í góðu tómi." time="5780"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Ja" file="\kristniA\Media\hjalti\ja.wav" >
	<Sentence text="Jæja já!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Hjalti_acc" name="m_SaellVifillHeitiEg" file="\kristniA\Media\hjalti\SaellViA.wav" >
	<Sentence text="Sæll! Vífill heiti ég." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Gissur2" file="\kristniA\Media\hjalti\Gissur.wav" >
	<Sentence text="Gissur!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_HvarEruThessirHestar" file="\kristniA\Media\hjalti\HvarEruB.wav" >
	<Sentence text="Hvar eru þessir hestar sem þú þykist vera að gæta?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_EgVilEkkiTruflaHann" file="\kristniA\Media\hjalti\EgVilEkA.wav" >
	<Sentence text="Ég vil ekki trufla hann meira." time="0"/>
	<Sentence text="Hann virðist svo ánægður núna, ..." time="1663"/>
	<Sentence text="... eftir að hann fékk krossinn." time="3250"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_MaEgEigaVidThigOrdHallur" file="\kristniA\Media\hjalti\MaEgEigB.wav" >
	<Sentence text="Má ég eiga við þig orð Hallur?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_SjaldanVeldurEinn" file="\kristniA\Media\hjalti\SjaldanA.wav" >
	<Sentence text="Sjaldan veldur einn þá tveir deila." time="0"/>
	<Sentence text="Hvað ætli þetta þýði nú eiginlega?" time="3540"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_HerErEitthvadRist" file="\kristniA\Media\hjalti\HerErEiA.wav" >
	<Sentence text="Hér er eitthvað rist í steininn." time="0"/>
	<Sentence text="Það er bara verst að ég skil ekkert hvað þetta merkir." time="2580"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThettaErHannHallur" file="\kristniA\Media\hjalti\ThettaEA.wav" >
	<Sentence text="Þetta er hann Hallur á Síðu." time="0"/>
	<Sentence text="Hann er leiðtogi kristinna manna á Íslandi." time="1652"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThettaErBaraTengdapabbi" file="\kristniA\Media\hjalti\ThettaEB.wav" >
	<Sentence text="Þetta er tengdapabbi, Gissur hvíti." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThettaErThorgeir" file="\kristniA\Media\hjalti\ThettaEC.wav" >
	<Sentence text="Þetta er Þorgeir Ljósvetningagoði, ..." time="0"/>
	<Sentence text="... lögsögumaður okkar Íslendinga." time="2050"/>
	<Sentence text="Hann er líka lögfróðastur allra á Íslandi." time="4013"/>
	<Sentence text="Það er bara verst að hann er heiðinn." time="6385"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThettaErLitid" file="\kristniA\Media\hjalti\ThettaED.wav" >
	<Sentence text="Þetta er lítið Þórshamarshálsmen." time="0"/>
	<Sentence text="Einhver af þeim heiðnu hlýtur að hafa ..." time="3000"/>
	<Sentence text="... misst það í látunum á Lögbergi." time="4500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_KrossinnSemErna" file="\kristniA\Media\hjalti\KrossinA.wav" >
	<Sentence text="Krossinn sem Erna seiðkona gaf mér er bráðfallegur." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThettaErHlyji" file="\kristniA\Media\hjalti\ThettaEE.wav" >
	<Sentence text="Þetta er hlýji og góði feldurinn ..." time="0"/>
	<Sentence text="... sem ég fékk hjá hestasveininum." time="2067"/>
	<Sentence text="Nú verður mér aldrei kalt framar!" time="3970"/>  </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThadErMerkilegt" file="\kristniA\Media\hjalti\thadermA.wav" >
	<Sentence text="Það er merkilegt hvað þessar seiðkonur ..." time="0"/>
	<Sentence text="... eru allar bráðhuggulegar." time="1980"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThettaErHestasveinn" file="\kristniA\Media\hjalti\thettaeF.wav" >
	<Sentence text="Þetta er hestasveinn Halls á Síðu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_FallegMynt" file="\kristniA\Media\hjalti\fallegmA.wav" >
	<Sentence text="Falleg mynt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_ThettaEruBaraVenjulegir" file="\kristniA\Media\hjalti\thettaeG.wav" >
	<Sentence text="Þetta eru bara venjulegir sandpokar." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Thorgeir" file="\kristniA\Media\hjalti\thorgeir.wav" >
	<Sentence text="Þorgeir!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take1" file="\common\Media\take\take1.wav" >
	<Sentence text="Láttu ekki svona!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take2" file="\common\Media\take\take2.wav" >
	<Sentence text="Ég gæti aldrei haldið á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take3" file="\common\Media\take\take3.wav" >
	<Sentence text="Ég gæti aldrei haldið á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take4" file="\common\Media\take\take4.wav" >
	<Sentence text="Ekki þessa vitleysu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take5" file="\common\Media\take\take5.wav" >
	<Sentence text="Gengur ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take6" file="\common\Media\take\take6.wav" >
	<Sentence text="Ég hef engan áhuga á þessu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take7" file="\common\Media\take\take7.wav" >
	<Sentence text="Nei! Ég þarf þetta ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take8" file="\common\Media\take\take8.wav" >
	<Sentence text="Nei, hættu nú alveg!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take9" file="\common\Media\take\take9.wav" >
	<Sentence text="Nei! Þetta þarf ég ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take10" file="\common\Media\take\take10.wav" >
	<Sentence text="Nei! Þetta þarf ég ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take11" file="\common\Media\take\take11.wav" >
	<Sentence text="Það væri gaman að eiga þetta." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take12" file="\common\Media\take\take12.wav" >
	<Sentence text="Til hvers ætti ég að nota þennan hlut?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Take13" file="\common\Media\take\take13.wav" >
	<Sentence text="Til hvers ætti ég að nota þennan hlut?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Hjalti_acc" name="m_Look1" file="\common\Media\look\look1.wav" >
	<Sentence text="Veistu ekki hvað þetta er?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Look2" file="\common\Media\look\look2.wav" >
	<Sentence text="Mikið er þetta fallegt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Look3" file="\common\Media\look\look3.wav" >
	<Sentence text="Það væri gaman að eiga þetta!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Look4" file="\common\Media\look\look4.wav" >
	<Sentence text="Þetta er nú ansi fallegt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Look5" file="\common\Media\look\look5.wav" >
	<Sentence text="Veistu ekki hvað þetta er?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Look6" file="\common\Media\look\look6.wav" >
	<Sentence text="Ég hef engan áhuga á þessu!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Hjalti_acc" name="m_Talk1" file="\common\Media\talk\talk1.wav" >
	<Sentence text="Ekki þessa vitleysu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Talk2" file="\common\Media\talk\talk2.wav" >
	<Sentence text="Láttu ekki svona!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Talk3" file="\common\Media\talk\talk3.wav" >
	<Sentence text="Þetta er líklega versta hugmynd ..." time="0"/>
	<Sentence text="... sem ég hef nokkru sinni heyrt!" time="2015"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Talk4" file="\common\Media\talk\talk4.wav" >
	<Sentence text="Nei, hættu nú alveg!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Talk5" file="\common\Media\talk\talk5.wav" >
	<Sentence text="Nei! Þetta gengur ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Talk6" file="\common\Media\talk\talk6.wav" >
	<Sentence text="Ég held að það sé kominn tími til að sumir ..." time="0"/>
	<Sentence text="... hætti að spila tölvuleiki." time="2340"/>
	<Sentence text="Ég á bara að gera tóma vitleysu!" time="4750"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use1" file="\common\Media\use\use1.wav" >
	<Sentence text="Ég þarf ekki að nota þetta hér!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use2" file="\common\Media\use\use2.wav" >
	<Sentence text="Ekki vera að þessu rugli." time="0"/>
	<Sentence text="Ég er búinn að reyna þetta!" time="1720"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use3" file="\common\Media\use\use3.wav" >
	<Sentence text="Frábær hugmynd ..." time="0"/>
	<Sentence text="... eða nei, kannski ekki!" time="1350"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use4" file="\common\Media\use\use4.wav" >
	<Sentence text="Gengur ekki!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use5" file="\common\Media\use\use5.wav" >
	<Sentence text="Nei! Þetta gengur ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use6" file="\common\Media\use\use6.wav" >
	<Sentence text="Ég held að það sé kominn tími til að sumir ..." time="0"/>
	<Sentence text="... hætti að spila tölvuleiki." time="2340"/>
	<Sentence text="Ég á bara að gera tóma vitleysu!" time="4750"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use7" file="\common\Media\use\use7.wav" >
	<Sentence text="Þetta er líklega versta hugmynd ..." time="0"/>
	<Sentence text="... sem ég hef nokkru sinni heyrt!" time="2035"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use8" file="\common\Media\use\use8.wav" >
	<Sentence text="Þetta tvennt gengur ekki saman!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Use9" file="\common\Media\use\use9.wav" >
	<Sentence text="Þetta tvennt passar ekki saman!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth acc="a_Hjalti_acc" name="m_Bless2" file="\common\Media\bless\bless2.wav" >
	<Sentence text="Mér er ekki til setunnar boðið!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless2" object="m_Bless2" prepare="false"/>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Bless3" file="\common\Media\bless\bless3.wav" >
	<Sentence text="Ég þarf að þjóta!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless3" object="m_Bless3" prepare="false"/>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Bless4" file="\common\Media\bless\bless4.wav" >
	<Sentence text="Það var gaman að tala við þig!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless4" object="m_Bless4" prepare="false"/>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Bless5" file="\common\Media\bless\bless5.wav" >
	<Sentence text="Við þyrftum endilega að borða hádegismat saman einhvern tímann ..." time="0"/>
	<Sentence text="... en því miður er ég á hraðferð núna!" time="3228"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless5" object="m_Bless5" prepare="false"/>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Bless6" file="\common\Media\bless\bless6.wav" >
	<Sentence text="Sjáumst síðar!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless6" object="m_Bless6" prepare="false"/>
<SpeechActorMouth acc="a_Hjalti_acc" name="m_Bless1" file="\common\Media\bless\bless1.wav" >
	<Sentence text="Bless!" time="0"/> </SpeechActorMouth>
<PrepareQuantum name="qu_Bless1" object="m_Bless1" prepare="false"/>

<StaticActorFace name="af_Hjalti_Stop" file="\KristniA\AnimatiA\hjalti\stop" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Right" repeat="-1" file="\kristniA\AnimatiA\hjalti\right" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Left" repeat="-1" file="\kristniA\AnimatiA\hjalti\left" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Front" repeat="-1" file="\kristniA\AnimatiA\hjalti\front" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Back" repeat="-1" file="\kristniA\AnimatiA\hjalti\back" count="6" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Stop2right" repeat="1" file="\kristniA\AnimatiA\hjalti\stop2riA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Stop2left" repeat="1" file="\kristniA\AnimatiA\hjalti\stop2leA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Stop2back" repeat="1" file="\kristniA\AnimatiA\hjalti\stop2baA" count="1" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hjalti_Talk" repeat="-1" file="\kristniA\AnimatiA\hjalti\talk" count="4" prepare="true" speed="150" random="true"/>

<CelledAnimated2DActorFace name="af_Hjalti_SynirKross" repeat="1" file="\kristniA\AnimatiA\hjalti\synirkrA" count="6" prepare="false" speed="225" />
<CelledAnimated2DActorFace name="af_Hjalti_GefurKross" repeat="1" file="\kristniA\AnimatiA\hjalti\gefurkrA" count="3" prepare="false" speed="225" xoffset="-77" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Hjalti_KrossDingl" repeat="4" file="\kristniA\AnimatiA\hjalti\krossdiA" count="2" prepare="false" speed="150" />
<CelledAnimated2DActorFace name="af_Hjalti_TekurStein" repeat="1" file="\kristniA\AnimatiA\hjalti\tekurstA" count="6" prepare="false" speed="225" xoffset="-51" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Hjalti_Hverfur" repeat="1" file="\kristniA\AnimatiA\hjalti\hverfur" count="6" prepare="false" speed="450" xoffset="-4" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Hjalti_Why" repeat="1" file="\kristniA\AnimatiA\hjalti\why" count="3" prepare="true" speed="225" xoffset="-35" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Hjalti_Yppir" repeat="1" file="\kristniA\AnimatiA\hjalti\yppir" count="3" prepare="true" speed="225" xoffset="-35" yoffset="0"/>
<StaticActorFace name="af_Hjalti_StopStein" file="\kristniA\AnimatiA\hjalti\stopsteA" prepare="false" />
<CelledAnimated2DActorFace name="af_Hjalti_GefurFeld" repeat="1" file="\kristniA\AnimatiA\hjalti\gefurfeA" count="7" prepare="false" speed="225" xoffset="-66" yoffset="0"/>

<Pseudo3DCollisionBox name="cb_Hjalti" x="95" y="30" z="292"/>

<MovingActor name="a_Hjalti" state="stop" terrain="t_HjaHestasveinil" x="500" y="540" z="1" scaling="dynamic" save="true" speed="90" random="true">
	<State name="stop" face="af_Hjalti_Stop" collisionbox="cb_Hjalti"/>
	<State name="right" face="af_Hjalti_Right" collisionbox="cb_Hjalti"/>
	<State name="left" face="af_Hjalti_Left" collisionbox="cb_Hjalti"/>
	<State name="front" face="af_Hjalti_Front" collisionbox="cb_Hjalti"/>
	<State name="back" face="af_Hjalti_Back" collisionbox="cb_Hjalti"/>
	<State name="stop2right" face="af_Hjalti_Stop2right" collisionbox="cb_Hjalti"/>
	<State name="stop2left" face="af_Hjalti_Stop2left" collisionbox="cb_Hjalti"/>
	<State name="stop2back" face="af_Hjalti_Stop2back" collisionbox="cb_Hjalti"/>
	<State name="synirkross" face="af_Hjalti_SynirKross" collisionbox="cb_Hjalti"/>
	<State name="krossdingl" face="af_Hjalti_KrossDingl" collisionbox="cb_Hjalti"/>
	<State name="gefurkross" face="af_Hjalti_GefurKross" collisionbox="cb_Hjalti"/>
	<State name="tekurstein" face="af_Hjalti_TekurStein" collisionbox="cb_Hjalti"/>
	<State name="hverfur" face="af_Hjalti_Hverfur" collisionbox="cb_Hjalti"/>
	<State name="why" face="af_Hjalti_Why" collisionbox="cb_Hjalti"/>
	<State name="yppir" face="af_Hjalti_Yppir" collisionbox="cb_Hjalti"/>
	<State name="stopstein" face="af_Hjalti_StopStein" collisionbox="cb_Hjalti"/>
	<State name="gefurfeld" face="af_Hjalti_GefurFeld" collisionbox="cb_Hjalti"/>

	<State name="Bless2" face="af_Hjalti_Talk" mouth="m_Bless2" collisionbox="cb_Hjalti"/>
	<State name="Bless3" face="af_Hjalti_Talk" mouth="m_Bless3" collisionbox="cb_Hjalti"/>
	<State name="Bless4" face="af_Hjalti_Talk" mouth="m_Bless4" collisionbox="cb_Hjalti"/>
	<State name="Bless5" face="af_Hjalti_Talk" mouth="m_Bless5" collisionbox="cb_Hjalti"/>
	<State name="Bless6" face="af_Hjalti_Talk" mouth="m_Bless6" collisionbox="cb_Hjalti"/>
	<State name="Bless1" face="af_Hjalti_Talk" mouth="m_Bless1" collisionbox="cb_Hjalti"/>

	<State name="Look1" face="af_Hjalti_Talk" mouth="m_Look1" collisionbox="cb_Hjalti"/>
	<State name="Look2" face="af_Hjalti_Talk" mouth="m_Look2" collisionbox="cb_Hjalti"/>
	<State name="Look3" face="af_Hjalti_Talk" mouth="m_Look3" collisionbox="cb_Hjalti"/>
	<State name="Look4" face="af_Hjalti_Talk" mouth="m_Look4" collisionbox="cb_Hjalti"/>
	<State name="Look5" face="af_Hjalti_Talk" mouth="m_Look5" collisionbox="cb_Hjalti"/>
	<State name="Look6" face="af_Hjalti_Talk" mouth="m_Look6" collisionbox="cb_Hjalti"/>

	<State name="Talk1" face="af_Hjalti_Talk" mouth="m_Talk1" collisionbox="cb_Hjalti"/>
	<State name="Talk2" face="af_Hjalti_Talk" mouth="m_Talk2" collisionbox="cb_Hjalti"/>
	<State name="Talk3" face="af_Hjalti_Talk" mouth="m_Talk3" collisionbox="cb_Hjalti"/>
	<State name="Talk4" face="af_Hjalti_Talk" mouth="m_Talk4" collisionbox="cb_Hjalti"/>
	<State name="Talk5" face="af_Hjalti_Talk" mouth="m_Talk5" collisionbox="cb_Hjalti"/>
	<State name="Talk6" face="af_Hjalti_Talk" mouth="m_Talk6" collisionbox="cb_Hjalti"/>

	<State name="Take1" face="af_Hjalti_Talk" mouth="m_Take1" collisionbox="cb_Hjalti"/>
	<State name="Take2" face="af_Hjalti_Talk" mouth="m_Take2" collisionbox="cb_Hjalti"/>
	<State name="Take3" face="af_Hjalti_Talk" mouth="m_Take3" collisionbox="cb_Hjalti"/>
	<State name="Take4" face="af_Hjalti_Talk" mouth="m_Take4" collisionbox="cb_Hjalti"/>
	<State name="Take5" face="af_Hjalti_Talk" mouth="m_Take5" collisionbox="cb_Hjalti"/>
	<State name="Take6" face="af_Hjalti_Talk" mouth="m_Take6" collisionbox="cb_Hjalti"/>
	<State name="Take7" face="af_Hjalti_Talk" mouth="m_Take7" collisionbox="cb_Hjalti"/>
	<State name="Take8" face="af_Hjalti_Talk" mouth="m_Take8" collisionbox="cb_Hjalti"/>
	<State name="Take9" face="af_Hjalti_Talk" mouth="m_Take9" collisionbox="cb_Hjalti"/>
	<State name="Take10" face="af_Hjalti_Talk" mouth="m_Take10" collisionbox="cb_Hjalti"/>
	<State name="Take11" face="af_Hjalti_Talk" mouth="m_Take11" collisionbox="cb_Hjalti"/>
	<State name="Take12" face="af_Hjalti_Talk" mouth="m_Take12" collisionbox="cb_Hjalti"/>
	<State name="Take13" face="af_Hjalti_Talk" mouth="m_Take13" collisionbox="cb_Hjalti"/>

	<State name="Use1" face="af_Hjalti_Talk" mouth="m_Use1" collisionbox="cb_Hjalti"/>
	<State name="Use2" face="af_Hjalti_Talk" mouth="m_Use2" collisionbox="cb_Hjalti"/>
	<State name="Use3" face="af_Hjalti_Talk" mouth="m_Use3" collisionbox="cb_Hjalti"/>
	<State name="Use4" face="af_Hjalti_Talk" mouth="m_Use4" collisionbox="cb_Hjalti"/>
	<State name="Use5" face="af_Hjalti_Talk" mouth="m_Use5" collisionbox="cb_Hjalti"/>
	<State name="Use6" face="af_Hjalti_Talk" mouth="m_Use6" collisionbox="cb_Hjalti"/>
	<State name="Use7" face="af_Hjalti_Talk" mouth="m_Use7" collisionbox="cb_Hjalti"/>
	<State name="Use8" face="af_Hjalti_Talk" mouth="m_Use8" collisionbox="cb_Hjalti"/>
	<State name="Use9" face="af_Hjalti_Talk" mouth="m_Use9" collisionbox="cb_Hjalti"/>

	<State name="SaellVifillHeitiEg" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_SaellVifillHeitiEg"/>
	<State name="Gissur2" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_Gissur2"/>
	<State name="HvarEruThessirHestar" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvarEruThessirHestar"/>
	<State name="EgVilEkkiTruflaHann" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_EgVilEkkiTruflaHann"/>
	<State name="MaEgEigaVidThigOrdHallur" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_MaEgEigaVidThigOrdHallur"/>
	<State name="SjaldanVeldurEinn" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_SjaldanVeldurEinn"/>
	<State name="HerErEitthvadRist" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HerErEitthvadRist"/>
	<State name="ThettaErHannHallur" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaErHannHallur"/>
	<State name="ThettaErBaraTengdapabbi" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaErBaraTengdapabbi"/>
	<State name="ThettaErThorgeir" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaErThorgeir"/>
	<State name="ThettaErLitid" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaErLitid"/>
	<State name="KrossinnSemErna" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_KrossinnSemErna"/>
	<State name="ThettaErHlyji" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaErHlyji"/>
	<State name="ThadErMerkilegt" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThadErMerkilegt"/>
	<State name="ThettaErHestasveinn" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaErHestasveinn"/>
	<State name="ThettaEruBaraVenjulegir" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaEruBaraVenjulegir"/>
	<State name="FallegMynt" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_FallegMynt"/>
	<State name="Thorgeir" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_Thorgeir"/>

	<State name="HvarErumVid" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvarErumVid"/>
	<State name="Gissur" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_Gissur"/>
	<State name="HvadErUmAdVera" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvadErUmAdVera"/>
	<State name="HverErtThu" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HverErtThu"/>
	<State name="HvadaArEr" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvadaArEr"/>
	<State name="NuJa" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_NuJa"/>
	<State name="NeiNeiAllsEkki" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_NeiNeiAllsEkki"/>
	<State name="BidduBiddu" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_BidduBiddu"/>
	<State name="HeHeHe" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HeHeHe"/>
	<State name="AfHverjuVillOlafur" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_AfHverjuVillOlafur"/>
	<State name="AfHverjuErEkkiIFinu" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_AfHverjuErEkkiIFinu"/>
	<State name="TruirThuAKrist" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_TruirThuAKrist"/>
	<State name="HvernigEigumVid" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvernigEigumVid"/>
	<State name="HvadErAlthingi" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvadErAlthingi"/>
	<State name="AudvitadThadVita" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_AudvitadThadVita"/>
	<State name="JaErThad" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_JaErThad"/>
	<State name="JaThuMeinarThaaad" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_JaThuMeinarThaaad"/>
	<State name="HaEg" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HaEg"/>
	<State name="AudvitadManEgEftirThvi" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_AudvitadManEgEftirThvi"/>
	<State name="SaellHver" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_SaellHver"/>
	<State name="ErFallegiFeldurinn" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ErFallegiFeldurinn"/>
	<State name="HvadErtThuAdGera" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvadErtThuAdGera"/>
	<State name="MaEgEigaFeldinn" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_MaEgEigaFeldinn"/>
	<State name="MittVidfraega" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_MittVidfraega"/>
	<State name="Ekkert" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_Ekkert"/>
	<State name="ThettaGull" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThettaGull"/>
	<State name="ThennanGullfallegaThorshamar" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThennanGullfallegaThorshamar"/>
	<State name="FleiraHef" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_FleiraHef"/>
	<State name="GissurHvitiHefurLog" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_GissurHvitiHefurLog"/>
	<State name="GeturThuNokkudUtskyrt" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_GeturThuNokkudUtskyrt"/>
	<State name="HvadErKlukkan" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvadErKlukkan"/>
	<State name="NuHofumVidSagt" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_NuHofumVidSagt"/>
	<State name="JaejaHallur" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_JaejaHallur"/>
	<State name="AfHverjuVilt" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_AfHverjuVilt"/>
	<State name="EgHefSvolitidMerkilegt" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_EgHefSvolitidMerkilegt"/>
	<State name="BidduHerEftir" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_BidduHerEftir"/>
	<State name="EgErBuinnAdGleymaHvad" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_EgErBuinnAdGleymaHvad"/>
	<State name="EgErBuinnAdGleyma" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_EgErBuinnAdGleyma"/>
	<State name="OJaThaad" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_OJaThaad"/>
	<State name="HvernigListTherA" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvernigListTherA"/>
	<State name="ThuErtLogsogumadur" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ThuErtLogsogumadur"/>
	<State name="EgLumaAMjog" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_EgLumaAMjog"/>
	<State name="AeFyrirgefdu" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_AeFyrirgefdu"/>
	<State name="ViltuVeraSvoVaenn" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_ViltuVeraSvoVaenn"/>
	<State name="HvadaNidurstodu" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HvadaNidurstodu"/>
	<State name="HversVegnaStendurThu" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HversVegnaStendurThu"/>
	<State name="HaMi" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_HaMi"/>
	<State name="EgUtvegadi" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_EgUtvegadi"/>
	<State name="Ja" face="af_Hjalti_Talk" collisionbox="cb_Hjalti" mouth="m_Ja"/>
</MovingActor>
<ActorMoused actor="a_Hjalti" listener="sc" looking="Hjalti Skeggjason (Ég)" taking="Klappa mér" talking="Tala við sjálfan mig" thf="mig" moving=" " />

<!-- Quanta -->
<StateQuantum name="q_StopHjalti" actor="a_Hjalti" state="stop" wait="false"/>
<StopActorQuantum name="q_StoppHjalti" actor="a_Hjalti"/>

<StateQuantum name="q_HjaltiGefurKross" actor="a_Hjalti" state="gefurkross" wait="true"/>
<StateQuantum name="q_HjaltiGefurFeld" actor="a_Hjalti" state="gefurfeld" wait="true"/>
<StateQuantum name="q_HjaltiSynirKross" actor="a_Hjalti" state="synirkross" wait="true"/>
<StateQuantum name="q_HjaltiKrossDingl" actor="a_Hjalti" state="krossdingl" wait="true"/>
<StateQuantum name="q_HjaltiTekurStein" actor="a_Hjalti" state="tekurstein" wait="true"/>
<StateQuantum name="q_HjaltiHverfur" actor="a_Hjalti" state="hverfur" wait="true"/>
<StateQuantum name="q_HjaltiWhy" actor="a_Hjalti" state="why" wait="true"/>
<StateQuantum name="q_HjaltiYppir" actor="a_Hjalti" state="yppir" wait="true"/>
<StateQuantum name="q_HjaltiStoppStein" actor="a_Hjalti" state="stopstein" wait="false"/>

<StateQuantum name="q_SaellVifillHeitiEg" actor="a_Hjalti" state="SaellVifillHeitiEg" wait="true"/>
<StateQuantum name="q_Gissur2" actor="a_Hjalti" state="Gissur2" wait="true"/>
<StateQuantum name="q_HvarEruThessirHestar" actor="a_Hjalti" state="HvarEruThessirHestar" wait="true"/>
<StateQuantum name="q_EgVilEkkiTruflaHann" actor="a_Hjalti" state="EgVilEkkiTruflaHann" wait="true"/>
<StateQuantum name="q_MaEgEigaVidThigOrdHallur" actor="a_Hjalti" state="MaEgEigaVidThigOrdHallur" wait="true"/>
<StateQuantum name="q_SjaldanVeldurEinn" actor="a_Hjalti" state="SjaldanVeldurEinn" wait="true"/>
<StateQuantum name="q_HerErEitthvadRist" actor="a_Hjalti" state="HerErEitthvadRist" wait="true"/>
<StateQuantum name="q_ThettaErHannHallur" actor="a_Hjalti" state="ThettaErHannHallur" wait="true"/>
<StateQuantum name="q_ThettaErBaraTengdapabbi" actor="a_Hjalti" state="ThettaErBaraTengdapabbi" wait="true"/>
<StateQuantum name="q_ThettaErThorgeir" actor="a_Hjalti" state="ThettaErThorgeir" wait="true"/>
<StateQuantum name="q_ThettaErLitid" actor="a_Hjalti" state="ThettaErLitid" wait="true"/>
<StateQuantum name="q_KrossinnSemErna" actor="a_Hjalti" state="KrossinnSemErna" wait="true"/>
<StateQuantum name="q_ThettaErHlyji" actor="a_Hjalti" state="ThettaErHlyji" wait="true"/>
<StateQuantum name="q_ThadErMerkilegt" actor="a_Hjalti" state="ThadErMerkilegt" wait="true"/>
<StateQuantum name="q_ThettaErHestasveinn" actor="a_Hjalti" state="ThettaErHestasveinn" wait="true"/>
<StateQuantum name="q_ThettaEruBaraVenjulegir" actor="a_Hjalti" state="ThettaEruBaraVenjulegir" wait="true"/>
<StateQuantum name="q_FallegMynt" actor="a_Hjalti" state="FallegMynt" wait="true"/>
<StateQuantum name="q_Thorgeir" actor="a_Hjalti" state="Thorgeir" wait="true"/>

<StateQuantum name="q_HvarErumVid" actor="a_Hjalti" state="HvarErumVid" wait="true"/>
<StateQuantum name="q_Gissur" actor="a_Hjalti" state="Gissur" wait="true"/>
<StateQuantum name="q_HverErtThu" actor="a_Hjalti" state="HverErtThu" wait="true"/>
<StateQuantum name="q_HvadErUmAdVera" actor="a_Hjalti" state="HvadErUmAdVera" wait="true"/>
<StateQuantum name="q_HvadaArEr" actor="a_Hjalti" state="HvadaArEr" wait="true"/>
<StateQuantum name="q_NuJa" actor="a_Hjalti" state="NuJa" wait="true"/>
<StateQuantum name="q_NeiNeiAllsEkki" actor="a_Hjalti" state="NeiNeiAllsEkki" wait="true"/>
<StateQuantum name="q_BidduBiddu" actor="a_Hjalti" state="BidduBiddu" wait="true"/>
<StateQuantum name="q_HeHeHe" actor="a_Hjalti" state="HeHeHe" wait="true"/>
<StateQuantum name="q_AfHverjuVillOlafur" actor="a_Hjalti" state="AfHverjuVillOlafur" wait="true"/>
<StateQuantum name="q_AfHverjuErEkkiIFinu" actor="a_Hjalti" state="AfHverjuErEkkiIFinu" wait="true"/>
<StateQuantum name="q_TruirThuAKrist" actor="a_Hjalti" state="TruirThuAKrist" wait="true"/>
<StateQuantum name="q_HvernigEigumVid" actor="a_Hjalti" state="HvernigEigumVid" wait="true"/>
<StateQuantum name="q_HvadErAlthingi" actor="a_Hjalti" state="HvadErAlthingi" wait="true"/>
<StateQuantum name="q_AudvitadThadVita" actor="a_Hjalti" state="AudvitadThadVita" wait="true"/>
<StateQuantum name="q_JaErThad" actor="a_Hjalti" state="JaErThad" wait="true"/>
<StateQuantum name="q_JaThuMeinarThaaad" actor="a_Hjalti" state="JaThuMeinarThaaad" wait="true"/>
<StateQuantum name="q_HaEg" actor="a_Hjalti" state="HaEg" wait="true"/>
<StateQuantum name="q_AudvitadManEgEftirThvi" actor="a_Hjalti" state="AudvitadManEgEftirThvi" wait="true"/>
<StateQuantum name="q_SaellHver" actor="a_Hjalti" state="SaellHver" wait="true"/>
<StateQuantum name="q_ErFallegiFeldurinn" actor="a_Hjalti" state="ErFallegiFeldurinn" wait="true"/>
<StateQuantum name="q_HvadErtThuAdGera" actor="a_Hjalti" state="HvadErtThuAdGera" wait="true"/>
<StateQuantum name="q_MaEgEigaFeldinn" actor="a_Hjalti" state="MaEgEigaFeldinn" wait="true"/>
<StateQuantum name="q_MittVidfraega" actor="a_Hjalti" state="MittVidfraega" wait="true"/>
<StateQuantum name="q_Ekkert" actor="a_Hjalti" state="Ekkert" wait="true"/>
<StateQuantum name="q_ThettaGull" actor="a_Hjalti" state="ThettaGull" wait="true"/>
<StateQuantum name="q_ThennanGullfallegaThorshamar" actor="a_Hjalti" state="ThennanGullfallegaThorshamar" wait="true"/>
<StateQuantum name="q_FleiraHef" actor="a_Hjalti" state="FleiraHef" wait="true"/>
<StateQuantum name="q_GissurHvitiHefurLog" actor="a_Hjalti" state="GissurHvitiHefurLog" wait="true"/>
<StateQuantum name="q_GeturThuNokkudUtskyrt" actor="a_Hjalti" state="GeturThuNokkudUtskyrt" wait="true"/>
<StateQuantum name="q_HvadErKlukkan" actor="a_Hjalti" state="HvadErKlukkan" wait="true"/>
<StateQuantum name="q_NuHofumVidSagt" actor="a_Hjalti" state="NuHofumVidSagt" wait="true"/>
<StateQuantum name="q_JaejaHallur" actor="a_Hjalti" state="JaejaHallur" wait="true"/>
<StateQuantum name="q_AfHverjuVilt" actor="a_Hjalti" state="AfHverjuVilt" wait="true"/>
<StateQuantum name="q_EgHefSvolitidMerkilegt" actor="a_Hjalti" state="EgHefSvolitidMerkilegt" wait="true"/>
<StateQuantum name="q_BidduHerEftir" actor="a_Hjalti" state="BidduHerEftir" wait="true"/>
<StateQuantum name="q_EgErBuinnAdGleymaHvad" actor="a_Hjalti" state="EgErBuinnAdGleymaHvad" wait="true"/>
<StateQuantum name="q_EgErBuinnAdGleyma" actor="a_Hjalti" state="EgErBuinnAdGleyma" wait="true"/>
<StateQuantum name="q_OJaThaad" actor="a_Hjalti" state="OJaThaad" wait="true"/>
<StateQuantum name="q_HvernigListTherA" actor="a_Hjalti" state="HvernigListTherA" wait="true"/>
<StateQuantum name="q_ThuErtLogsogumadur" actor="a_Hjalti" state="ThuErtLogsogumadur" wait="true"/>
<StateQuantum name="q_EgLumaAMjog" actor="a_Hjalti" state="EgLumaAMjog" wait="true"/>
<StateQuantum name="q_AeFyrirgefdu" actor="a_Hjalti" state="AeFyrirgefdu" wait="true"/>
<StateQuantum name="q_ViltuVeraSvoVaenn" actor="a_Hjalti" state="ViltuVeraSvoVaenn" wait="true"/>
<StateQuantum name="q_HvadaNidurstodu" actor="a_Hjalti" state="HvadaNidurstodu" wait="true"/>
<StateQuantum name="q_HversVegnaStendurThu" actor="a_Hjalti" state="HversVegnaStendurThu" wait="true"/>
<StateQuantum name="q_HaMi" actor="a_Hjalti" state="HaMi" wait="true"/>
<StateQuantum name="q_EgUtvegadi" actor="a_Hjalti" state="EgUtvegadi" wait="true"/>
<StateQuantum name="q_Ja" actor="a_Hjalti" state="Ja" wait="true"/>

<StateQuantum name="q_Bless1" actor="a_Hjalti" state="Bless1" wait="true"/>
<StateQuantum name="q_Bless2" actor="a_Hjalti" state="Bless2" wait="true"/>
<StateQuantum name="q_Bless3" actor="a_Hjalti" state="Bless3" wait="true"/>
<StateQuantum name="q_Bless4" actor="a_Hjalti" state="Bless4" wait="true"/>
<StateQuantum name="q_Bless5" actor="a_Hjalti" state="Bless5" wait="true"/>
<StateQuantum name="q_Bless6" actor="a_Hjalti" state="Bless6" wait="true"/>

<StateQuantum name="q_Look1" actor="a_Hjalti" state="Look1" wait="true"/>
<StateQuantum name="q_Look2" actor="a_Hjalti" state="Look2" wait="true"/>
<StateQuantum name="q_Look3" actor="a_Hjalti" state="Look3" wait="true"/>
<StateQuantum name="q_Look4" actor="a_Hjalti" state="Look4" wait="true"/>
<StateQuantum name="q_Look5" actor="a_Hjalti" state="Look5" wait="true"/>
<StateQuantum name="q_Look6" actor="a_Hjalti" state="Look6" wait="true"/>

<StateQuantum name="q_Talk1" actor="a_Hjalti" state="Talk1" wait="true"/>
<StateQuantum name="q_Talk2" actor="a_Hjalti" state="Talk2" wait="true"/>
<StateQuantum name="q_Talk3" actor="a_Hjalti" state="Talk3" wait="true"/>
<StateQuantum name="q_Talk4" actor="a_Hjalti" state="Talk4" wait="true"/>
<StateQuantum name="q_Talk5" actor="a_Hjalti" state="Talk5" wait="true"/>
<StateQuantum name="q_Talk6" actor="a_Hjalti" state="Talk6" wait="true"/>

<StateQuantum name="q_Use1" actor="a_Hjalti" state="Use1" wait="true"/>
<StateQuantum name="q_Use2" actor="a_Hjalti" state="Use2" wait="true"/>
<StateQuantum name="q_Use3" actor="a_Hjalti" state="Use3" wait="true"/>
<StateQuantum name="q_Use4" actor="a_Hjalti" state="Use4" wait="true"/>
<StateQuantum name="q_Use5" actor="a_Hjalti" state="Use5" wait="true"/>
<StateQuantum name="q_Use6" actor="a_Hjalti" state="Use6" wait="true"/>
<StateQuantum name="q_Use7" actor="a_Hjalti" state="Use7" wait="true"/>
<StateQuantum name="q_Use8" actor="a_Hjalti" state="Use8" wait="true"/>
<StateQuantum name="q_Use9" actor="a_Hjalti" state="Use9" wait="true"/>

<StateQuantum name="q_Take1" actor="a_Hjalti" state="Take1" wait="true"/>
<StateQuantum name="q_Take2" actor="a_Hjalti" state="Take2" wait="true"/>
<StateQuantum name="q_Take3" actor="a_Hjalti" state="Take3" wait="true"/>
<StateQuantum name="q_Take4" actor="a_Hjalti" state="Take4" wait="true"/>
<StateQuantum name="q_Take5" actor="a_Hjalti" state="Take5" wait="true"/>
<StateQuantum name="q_Take6" actor="a_Hjalti" state="Take6" wait="true"/>
<StateQuantum name="q_Take7" actor="a_Hjalti" state="Take7" wait="true"/>
<StateQuantum name="q_Take8" actor="a_Hjalti" state="Take8" wait="true"/>
<StateQuantum name="q_Take9" actor="a_Hjalti" state="Take9" wait="true"/>
<StateQuantum name="q_Take10" actor="a_Hjalti" state="Take10" wait="true"/>
<StateQuantum name="q_Take11" actor="a_Hjalti" state="Take11" wait="true"/>
<StateQuantum name="q_Take12" actor="a_Hjalti" state="Take12" wait="true"/>
<StateQuantum name="q_Take13" actor="a_Hjalti" state="Take13" wait="true"/>

<PrepareQuantum	name="qp_Hjalti1" object="af_Hjalti_SynirKross" prepare="true"/>
<PrepareQuantum	name="qu_Hjalti1" object="af_Hjalti_SynirKross" prepare="false"/>
<PrepareQuantum	name="qp_Hjalti2" object="af_Hjalti_KrossDingl" prepare="true"/>
<PrepareQuantum	name="qu_Hjalti2" object="af_Hjalti_KrossDingl" prepare="false"/>
<PrepareQuantum	name="qp_Hjalti3" object="af_Hjalti_GefurKross" prepare="true"/>
<PrepareQuantum	name="qu_Hjalti3" object="af_Hjalti_GefurKross" prepare="false"/>
<PrepareQuantum	name="qp_Hjalti4" object="af_Hjalti_TekurStein" prepare="true"/>
<PrepareQuantum	name="qu_Hjalti4" object="af_Hjalti_TekurStein" prepare="false"/>
<PrepareQuantum	name="qp_Hjalti5" object="af_Hjalti_Hverfur" prepare="true"/>
<PrepareQuantum	name="qu_Hjalti5" object="af_Hjalti_Hverfur" prepare="false"/>
<PrepareQuantum	name="qp_Hjalti6" object="af_Hjalti_StopStein" prepare="true"/>
<PrepareQuantum	name="qu_Hjalti6" object="af_Hjalti_StopStein" prepare="false"/>
<PrepareQuantum	name="qp_Hjalti7" object="af_Hjalti_GefurFeld" prepare="true"/>
<PrepareQuantum	name="qu_Hjalti7" object="af_Hjalti_GefurFeld" prepare="false"/>


<!-- Gissur hviti -->

<Text name="a_GissurHviti_acc" terrain="t_Corners" text=" " r="216" g="0" b="28" hilite="false"/>

<SpeechActorMouth acc="a_GissurHviti_acc" name="m_ErTherFaridAdForlast" file="\kristniA\Media\gissurhA\ertherfA.wav" >
	<Sentence text="Er þér farið að förlast Hjalti Skeggjason?" time="0"/>
	<Sentence text="Við erum staddir á Alþingi Íslendinga á Þingvöllum." time="3085"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_MjogFyndid" file="\kristniA\Media\gissurhA\mjogfynA.wav" >
	<Sentence text="Mjög fyndið Hjalti Skeggjason." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_ErtThuBuinn" file="\kristniA\Media\gissurhA\ertthubA.wav" >
	<Sentence text="Ert þú búinn að gleyma því að við hétum ..." time="0"/>
	<Sentence text="... Ólafi Tryggvasyni Noregskonungi því ..." time="2273"/>
	<Sentence text="... að koma á kristinni trú á Íslandi." time="5400"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_OlafurNoregsKonungur" file="\kristniA\Media\gissurhA\olafurnA.wav" >
	<Sentence text="Ólafur Noregskonungur hefur hótað að drepa ..." time="0"/>
	<Sentence text="... Íslendinga í Noregi ef okkur tekst ekki ..." time="1983"/>
	<Sentence text="... ætlunarverkið. Kristnir fylgismenn okkar hér á ..." time="4160"/>
	<Sentence text="... Alþingi eru fjölmargir en það eru fleiri sem enn..." time="6852"/>
	<Sentence text="... trúa á heiðnu goðin og þeim verðum við að ..." time="9900"/>
	<Sentence text="... snúa til kristni." time="12400"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_VeistuThadEkki" file="\kristniA\Media\gissurhA\veistutA.wav" >
	<Sentence text="Veistu það ekki, Hjalti Skeggjason?" time="0"/>
	<Sentence text="Við erum staddir á Alþingi Íslendinga ..." time="2450"/>
	<Sentence text="... á Þingvöllum til þess að reyna að fá ..." time="4500"/>
	<Sentence text="... Íslendinga til að taka kristna trú." time="6617"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_NuVidHetum" file="\kristniA\Media\gissurhA\nuvidheA.wav" >
	<Sentence text="Nú við hétum Ólafi Tryggvasyni Noregskonungi ..." time="0"/>
	<Sentence text="... að kristna alla Íslendinga." time="3166"/>
	<Sentence text="Ef það tekst ekki er Ólafur vís til að ..." time="5530"/>
	<Sentence text="... standa við hótanir sínar ..." time="7420"/>
	<Sentence text="... og drepa Íslendinga í Noregi." time="8990"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_EgHeitiGissurHviti" file="\kristniA\Media\gissurhA\egheitiA.wav" >
	<Sentence text="Ég heiti Gissur hvíti Teitsson." time="0"/>
	<Sentence text="Þykist þú allt í einu ekki þekkja tengdaföður þinn?" time="2500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_ThadEruLidin" file="\kristniA\Media\gissurhA\thaderuA.wav" >
	<Sentence text="Það eru liðin eitt þúsund ár frá fæðingu Krists." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_OlafurTryggvasonVar" file="\kristniA\Media\gissurhA\olafurtA.wav" >
	<Sentence text="Ólafur Tryggvason var víkingahöfðingi í Noregi ..." time="0"/>
	<Sentence text="... og lét skírast til kristni ..." time="3400"/>
	<Sentence text="... áður en hann varð konungur." time="4500"/>
	<Sentence text="Þegar hann braust til valda í Noregi árið 995 ..." time="6200"/>
	<Sentence text="... hóf hann strax að kristna Norðmenn." time="9622"/>
	<Sentence text="Eins og þú veist þá eru Íslendingar ..." time="11870"/>
	<Sentence text="... komnir af Norðmönnum." time="13310"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_TilDaemis" file="\kristniA\Media\gissurhA\tildaemA.wav" >
	<Sentence text="Til dæmis erum við Ólafur konungur ..." time="0"/>
	<Sentence text="... þremenningar að frændsemi." time="2000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_OlafurVillNuKristna" file="\kristniA\Media\gissurhA\olafurvA.wav" >
	<Sentence text="Ólafur vill nú kristna alla Íslendinga líka, ..." time="0"/>
	<Sentence text="... því hann þolir ekki að þeir sem eru ..." time="2710"/>
	<Sentence text="svo skyldir Norðmönnum, séu heiðnir." time="4026"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_VegnaThessAdThaVaeri" file="\kristniA\Media\gissurhA\vegnathA.wav" >
	<Sentence text="Vegna þess að þá væri ómögulegt að ákveða ..." time="0"/>
	<Sentence text="... hvort ætti að dæma eftir heiðnum ..." time="1880"/>
	<Sentence text="... eða kristnum lögum ..." time="3690"/>
	<Sentence text="... þegar heiðinn og kristinn mann greindi á um eitthvað." time="5100"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_LogOgReglur" file="\kristniA\Media\gissurhA\logogreA.wav" >
	<Sentence text="Lög og reglur heiðinna og kristinna ..." time="0"/>
	<Sentence text="... eru nefnilega talsvert ólík ..." time="2200"/>
	<Sentence text="... og hætt er við miklum deilum á milli þeirra ..." time="4120"/>
	<Sentence text="... ef hér verða bæði trúarbrögðin áfram." time="6330"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_AdSjalfsogduErt" file="\kristniA\Media\gissurhA\adsjalfA.wav" >
	<Sentence text="Að sjálfsögðu." time="0"/>
	<Sentence text="Ert þú nokkuð farinn að efast ..." time="2000"/>
	<Sentence text="... um trú þína, Hjalti?" time="3620"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_ThuHlyturAdMuna" file="\kristniA\Media\gissurhA\thuhlytA.wav" >
	<Sentence text="Þú hlýtur að muna eftir því þegar Þangbrandur, ..." time="0"/>
	<Sentence text="... prestur Ólafs Noregskonungs, ..." time="2640"/>
	<Sentence text="... kom hingað til lands og skírði okkur báða." time="4500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_EgVonaAdThuSjair" file="\kristniA\Media\gissurhA\egvonaaA.wav" >
	<Sentence text="Ég vona að þú sjáir ekki eftir því ..." time="0"/>
	<Sentence text="... að hafa kastað heiðni." time="1580"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_HerAAlthingiEru" file="\kristniA\Media\gissurhA\heraaltA.wav" >
	<Sentence text="Hér á Alþingi eru saman komnir allir ..." time="0"/>
	<Sentence text="... goðar og höfðingjar Íslands." time="1750"/>
	<Sentence text="Margir þeirra eru kristnir fylgismenn okkar ..." time="3630"/>
	<Sentence text="... en fleiri eru þó ennþá heiðnir." time="6267"/>
	<Sentence text="Ef okkur tekst einhvern veginn að telja ..." time="9400"/>
	<Sentence text="... heiðnu goðana á að taka kristni ..." time="10830"/>
	<Sentence text="... munu þeir sjá til þess að allt fólk ..." time="12750"/>
	<Sentence text="... í goðorðum þeirra muni líka skírast." time="14330"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_AlthingiErNokkurs" file="\kristniA\Media\gissurhA\althingA.wav" >
	<Sentence text="Alþingi er nokkurs konar þjóðþing Íslendinga." time="0"/>
	<Sentence text="Hingað koma allir höfðingjar landsins ..." time="3030"/>
	<Sentence text="... saman á hverju sumri til þess að ..." time="4880"/>
	<Sentence text="... dæma í deilumálum landsmanna eftir lögunum." time="6410"/>
	<Sentence text="Auk þess kemur fólk hingað til að skemmta sér ..." time="9357"/>
	<Sentence text="... og skiptast á almæltum tíðindum." time="11110"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_EgBidVidstadda" file="\kristniA\Media\gissurhA\egbidviA.wav" >
	<Sentence text="Ég bið viðstadda um þögn!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_EgGissur" file="\kristniA\Media\gissurhA\eggissur.wav" >
	<Sentence text="Ég, Gissur hvíti Teitsson, og tengdasonur minn ..." time="0"/>
	<Sentence text="... Hjalti Skeggjason erum nýkomnir frá Noregi." time="4640"/>
	<Sentence text="Ólafur Tryggvason hefur hótað að drepa Íslendinga í Noregi ..." time="8770"/>
	<Sentence text="... ef heiðni verður áfram við lýði hér á landi." time="13100"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_EkkiGetEgLengur" file="\kristniA\Media\gissurhA\ekkigetA.wav" >
	<Sentence text="Ekki get ég lengur unað heiðnum lögum ..." time="0"/>
	<Sentence text="... og hér með segi ég mig úr lögum við alla heiðna menn ..." time="4000"/>
	<Sentence text="... og vænti þess að aðrir kristnir menn geri slíkt hið sama." time="7465"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_DeilurnarSnuast" file="\kristniA\Media\gissurhA\deilurnA.wav" >
	<Sentence text="Deilurnar snúast um það hvora trúna ..." time="0"/>
	<Sentence text="... skuli hafa hér á Íslandi." time="2232"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_LoginEins" file="\kristniA\Media\gissurhA\logineiA.wav" >
	<Sentence text="Lögin, eins og þau eru nú, ..." time="0"/>
	<Sentence text="... taka ekkert tillit til okkar kristnu mannanna ... " time="1554"/>
	<Sentence text="... og því getum við ekki sætt okkur lengur við að vera í lögum ..." time="4320"/>
	<Sentence text="... með heiðnum mönnum ..." time="7250"/>
	<Sentence text="... og höfum sagt okkur úr lögum við þá." time="8660"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_HaHvadErKlukkanHvad" file="\kristniA\Media\gissurhA\hahvadeA.wav" >
	<Sentence text="Ha! Hvað er klukkan. Hvað er það?" time="0"/>
	<Sentence text="Það eina sem ég veit er að þú ert ekki ..." time="4350"/>
	<Sentence text="... með sjálfum þér þessa dagana." time="5500"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_HeillOgSaellThorgeir" file="\kristniA\Media\gissurhA\heillogA.wav" >
	<Sentence text="Heill og sæll, Þorgeir Ljósvetningagoði!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_SaellHallurASidu" file="\kristniA\Media\gissurhA\saellhaA.wav" >
	<Sentence text="Sæll Hallur á Síðu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_JaHjalti" file="\kristniA\Media\gissurhA\jahjalti.wav" >
	<Sentence text="Já, Hjalti!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_GissurHviti_acc" name="m_VifillErtThu" file="\kristniA\Media\gissurhA\vifilleA.wav" >
	<Sentence text="Vífill! Ert þú með hita Hjalti Skeggjason?" time="0"/> </SpeechActorMouth>

<StaticActorFace name="af_GissurHviti_Stop" file="\kristniA\AnimatiA\gissurhA\stop" prepare="true" />
<CelledAnimated2DActorFace name="af_GissurHviti_Talk" repeat="-1" file="\kristniA\AnimatiA\gissurhA\talk" count="4" prepare="true" random="true"/>
<CelledAnimated2DActorFace name="af_GissurHviti_Left" repeat="-1" file="\kristniA\AnimatiA\gissurhA\left" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_GissurHviti_Right" repeat="-1" file="\kristniA\AnimatiA\gissurhA\right" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_GissurHviti_Stop2Left" repeat="1" file="\kristniA\AnimatiA\gissurhA\stop2leA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="af_GissurHviti_Stop2Right" repeat="1" file="\kristniA\AnimatiA\gissurhA\stop2riA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="af_GissurHviti_Andvarp" repeat="1" file="\kristniA\AnimatiA\gissurhA\andvarp" count="3" prepare="true"/>

<Pseudo3DCollisionBox name="cb_GissurHviti" x="110" y="25" z="250"/>

<MovingActor name="a_GissurHviti" state="stop" terrain="t_HjaHestasveinil" x="200" y="555" z="1" scaling="dynamic" save="true" speed="90" random="true">
	<State name="stop" face="af_GissurHviti_Stop" collisionbox="cb_GissurHviti"/>
	<State name="left" face="af_GissurHviti_Left" collisionbox="cb_GissurHviti"/>
	<State name="right" face="af_GissurHviti_Right" collisionbox="cb_GissurHviti"/>
	<State name="Stop2Left" face="af_GissurHviti_Stop2Left" collisionbox="cb_GissurHviti"/>
	<State name="Stop2Right" face="af_GissurHviti_Stop2Right" collisionbox="cb_GissurHviti"/>

	<State name="andvarp" face="af_GissurHviti_Andvarp" collisionbox="cb_GissurHviti"/>
	<State name="ErTherFaridAdForlast" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_ErTherFaridAdForlast"/>
	<State name="MjogFyndid" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_MjogFyndid"/>
	<State name="ErtThuBuinn" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_ErtThuBuinn"/>
	<State name="OlafurNoregsKonungur" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_OlafurNoregsKonungur"/>
	<State name="VeistuThadEkki" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_VeistuThadEkki"/>
	<State name="NuVidHetum" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_NuVidHetum"/>
	<State name="EgHeitiGissurHviti" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_EgHeitiGissurHviti"/>
	<State name="ThadEruLidin" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_ThadEruLidin"/>
	<State name="OlafurTryggvasonVar" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_OlafurTryggvasonVar"/>
	<State name="TilDaemis" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_TilDaemis"/>
	<State name="OlafurVillNuKristna" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_OlafurVillNuKristna"/>
	<State name="VegnaThessAdThaVaeri" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_VegnaThessAdThaVaeri"/>
	<State name="LogOgReglur" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_LogOgReglur"/>
	<State name="AdSjalfsogduErt" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_AdSjalfsogduErt"/>
	<State name="ThuHlyturAdMuna" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_ThuHlyturAdMuna"/>
	<State name="EgVonaAdThuSjair" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_EgVonaAdThuSjair"/>
	<State name="HerAAlthingiEru" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_HerAAlthingiEru"/>
	<State name="AlthingiErNokkurs" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_AlthingiErNokkurs"/>
	<State name="EgBidVidstadda" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_EgBidVidstadda"/>
	<State name="EgGissur" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_EgGissur"/>
	<State name="EkkiGetEgLengur" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_EkkiGetEgLengur"/>
	<State name="DeilurnarSnuast" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_DeilurnarSnuast"/>
	<State name="LoginEins" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_LoginEins"/>
	<State name="HaHvadErKlukkanHvad" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_HaHvadErKlukkanHvad"/>
	<State name="HeillOgSaellThorgeir" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_HeillOgSaellThorgeir"/>
	<State name="SaellHallurASidu" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_SaellHallurASidu"/>
	<State name="JaHjalti" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_JaHjalti"/>
	<State name="VifillErtThu" face="af_GissurHviti_Talk" collisionbox="cb_GissurHviti" mouth="m_VifillErtThu"/>

</MovingActor>

<ActorMoused actor="a_GissurHviti" listener="sc" moving="Gissur hvíti" looking="Gissur hvíti" taking="Hrinda Gissur hvíta" talking="Tala við Gissur hvíta" thf="Gissur hvíta"/>

<!-- Conversation -->
<SentenceContainer name="conv_GissurHviti" scene="s_HjaHestasveini" polygon="p_HjaHestasveini" zmin="801" zmax="1500" save="true"/>

<!-- Quanta -->
<StateQuantum name="q_StopGissurHviti" actor="a_GissurHviti" state="stop" wait="false"/>
<StateQuantum name="q_AndvarpGissurHviti" actor="a_GissurHviti" state="andvarp" wait="true"/>

<StateQuantum name="q_ErTherFaridAdForlast" actor="a_GissurHviti" state="ErTherFaridAdForlast" wait="true"/>
<StateQuantum name="q_MjogFyndid" actor="a_GissurHviti" state="MjogFyndid" wait="true"/>
<StateQuantum name="q_ErtThuBuinn" actor="a_GissurHviti" state="ErtThuBuinn" wait="true"/>
<StateQuantum name="q_OlafurNoregsKonungur" actor="a_GissurHviti" state="OlafurNoregsKonungur" wait="true"/>
<StateQuantum name="q_VeistuThadEkki" actor="a_GissurHviti" state="VeistuThadEkki" wait="true"/>
<StateQuantum name="q_NuVidHetum" actor="a_GissurHviti" state="NuVidHetum" wait="true"/>
<StateQuantum name="q_EgHeitiGissurHviti" actor="a_GissurHviti" state="EgHeitiGissurHviti" wait="true"/>
<StateQuantum name="q_ThadEruLidin" actor="a_GissurHviti" state="ThadEruLidin" wait="true"/>
<StateQuantum name="q_OlafurTryggvasonVar" actor="a_GissurHviti" state="OlafurTryggvasonVar" wait="true"/>
<StateQuantum name="q_TilDaemis" actor="a_GissurHviti" state="TilDaemis" wait="true"/>
<StateQuantum name="q_OlafurVillNuKristna" actor="a_GissurHviti" state="OlafurVillNuKristna" wait="true"/>
<StateQuantum name="q_VegnaThessAdThaVaeri" actor="a_GissurHviti" state="VegnaThessAdThaVaeri" wait="true"/>
<StateQuantum name="q_LogOgReglur" actor="a_GissurHviti" state="LogOgReglur" wait="true"/>
<StateQuantum name="q_AdSjalfsogduErt" actor="a_GissurHviti" state="AdSjalfsogduErt" wait="true"/>
<StateQuantum name="q_ThuHlyturAdMuna" actor="a_GissurHviti" state="ThuHlyturAdMuna" wait="true"/>
<StateQuantum name="q_EgVonaAdThuSjair" actor="a_GissurHviti" state="EgVonaAdThuSjair" wait="true"/>
<StateQuantum name="q_HerAAlthingiEru" actor="a_GissurHviti" state="HerAAlthingiEru" wait="true"/>
<StateQuantum name="q_AlthingiErNokkurs" actor="a_GissurHviti" state="AlthingiErNokkurs" wait="true"/>
<StateQuantum name="q_EgBidVidstadda" actor="a_GissurHviti" state="EgBidVidstadda" wait="true"/>
<StateQuantum name="q_EgGissur" actor="a_GissurHviti" state="EgGissur" wait="true"/>
<StateQuantum name="q_EkkiGetEgLengur" actor="a_GissurHviti" state="EkkiGetEgLengur" wait="true"/>
<StateQuantum name="q_DeilurnarSnuast" actor="a_GissurHviti" state="DeilurnarSnuast" wait="true"/>
<StateQuantum name="q_LoginEins" actor="a_GissurHviti" state="LoginEins" wait="true"/>
<StateQuantum name="q_HaHvadErKlukkanHvad" actor="a_GissurHviti" state="HaHvadErKlukkanHvad" wait="true"/>
<StateQuantum name="q_HeillOgSaellThorgeir" actor="a_GissurHviti" state="HeillOgSaellThorgeir" wait="true"/>
<StateQuantum name="q_SaellHallurASidu" actor="a_GissurHviti" state="SaellHallurASidu" wait="true"/>
<StateQuantum name="q_JaHjalti" actor="a_GissurHviti" state="JaHjalti" wait="true"/>
<StateQuantum name="q_VifillErtThu" actor="a_GissurHviti" state="VifillErtThu" wait="true"/>


<!-- HestaSveinn -->

<Text name="a_Hestasveinn_acc" terrain="t_Corners" text=" " r="132" g="108" b="84" hilite="false"/>

<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_HeillOgSaellHjaltiEg" file="\kristniA\Media\hestasvA\heillogA.wav" >
	<Sentence text="Heill og sæll Hjalti!" time="0"/>
	<Sentence text="Ég er hestasveinn Halls á Síðu." time="2400"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_HvadHefurThuAdBjoda" file="\kristniA\Media\hestasvA\hvadhefA.wav" >
	<Sentence text="Hvað hefur þú að bjóða fyrir feldinn?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_ErtuBlindur" file="\kristniA\Media\hestasvA\ertubliA.wav" >
	<Sentence text="Ertu blindur? Þeir eru beint fyrir framan þig!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_NuEgErAdGaeta" file="\kristniA\Media\hestasvA\nuegeraA.wav" >
	<Sentence text="Nú, ég er að gæta hesta ..." time="0"/>
	<Sentence text="... Halls á Síðu á meðan hann er ..." time="2030"/>
	<Sentence text="... á Lögbergi, hvað annað!" time="4200"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_JaAudvitadSvo" file="\kristniA\Media\hestasvA\jaaudviA.wav" >
	<Sentence text="Já auðvitað!" time="0"/>
	<Sentence text="Svo verð ég bara hér og frýs í hel." time="1900"/>
	<Sentence text="Nei! Það kemur alls ekki til greina." time="5500"/>
	<Sentence text="Nema náttúrulega þú eigir eitthvert... " time="8450"/>
	<Sentence text="... gull sem ég gæti yljað mér á ..." time="10100"/>
	<Sentence text="... um hjartarætur í staðinn." time="11870"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_KaupaSkalEi" file="\kristniA\Media\hestasvA\kaupaskA.wav" >
	<Sentence text="Kaupa skal ei nema kaupandi ei á morgun komi!" time="0"/>
	<Sentence text="Áttu eitthvað annað?" time="4900"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_NeiTakkOft" file="\kristniA\Media\hestasvA\neitakkA.wav" >
	<Sentence text="Nei takk! Oft hefur mér verið ..." time="0"/>
	<Sentence text="... boðið meira fyrir þennan feld ..." time="3150"/>
	<Sentence text="... enda er hann hlýr og góður." time="5315"/>
	<Sentence text="En hef ég látið hann af hendi?" time="7520"/>
	<Sentence text="Nei, ó nei, öldungis ekki." time="9450"/>
	<Sentence text="Áttu kannski eitthvað annað?" time="13800"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_ThettaMen" file="\kristniA\Media\hestasvA\thettamA.wav" >
	<Sentence text="Þetta men!? Ertu ekki með öllum mjalla?" time="0"/>
	<Sentence text="Ég er sannkristinn maður eins og ..." time="3850"/>
	<Sentence text="... Hallur á Síðu og vil ekki sjá ..." time="5350"/>
	<Sentence text="... þetta heiðna drasl." time="7030"/>
	<Sentence text="Hefur þú eitthvað fleira?" time="8530"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_Uhhh" file="\kristniA\Media\hestasvA\uhhh.wav" >
	<Sentence text="Seldur! Seldur!" time="0"/>
	<Sentence text="Þokkalega! Þokkalega!" time="1350"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_OgThaFaerdu" file="\kristniA\Media\hestasvA\ogthafaA.wav" >
	<Sentence text="Og þá færðu heldur ekkert!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hestasveinn_acc" name="m_SaellHjalti" file="\kristniA\Media\hestasvA\saellhjA.wav" >
	<Sentence text="Sæll Hjalti!" time="0"/> </SpeechActorMouth>

<StaticActorFace name="af_HestaSveinn_Stop" file="\KristniA\AnimatiA\hestasvA\stop" prepare="true"/>
<StaticActorFace name="af_HestaSveinn_StopKross" file="\KristniA\AnimatiA\hestasvA\stopkroA" />
<CelledAnimated2DActorFace name="af_HestaSveinn_Talk" repeat="-1" file="\kristniA\AnimatiA\hestasvA\talk" count="4" random="true"/>
<CelledAnimated2DActorFace name="af_HestaSveinn_No" repeat="4" file="\kristniA\AnimatiA\hestasvA\no" count="4" />
<CelledAnimated2DActorFace name="af_HestaSveinn_Hissa" repeat="1" file="\kristniA\AnimatiA\hestasvA\hissa" count="3" speed="150"/>
<CelledAnimated2DActorFace name="af_HestaSveinn_HissaTalk" repeat="-1" file="\kristniA\AnimatiA\hestasvA\hissataA" count="4" random="true"/>
<PrepareQuantum	name="qp_HjaHestasveini2" object="af_HestaSveinn_Stop" prepare="true"/>
<PrepareQuantum	name="qu_HjaHestasveini2" object="af_HestaSveinn_Stop" prepare="false"/>
<PrepareQuantum	name="qp_HjaHestasveini3" object="af_HestaSveinn_StopKross" prepare="true"/>
<PrepareQuantum	name="qu_HjaHestasveini3" object="af_HestaSveinn_StopKross" prepare="false"/>
<PrepareQuantum	name="qp_HjaHestasveini4" object="af_HestaSveinn_Talk" prepare="true"/>
<PrepareQuantum	name="qu_HjaHestasveini4" object="af_HestaSveinn_Talk" prepare="false"/>
<PrepareQuantum	name="qp_HjaHestasveini5" object="af_HestaSveinn_No" prepare="true"/>
<PrepareQuantum	name="qu_HjaHestasveini5" object="af_HestaSveinn_No" prepare="false"/>
<PrepareQuantum	name="qp_HjaHestasveini6" object="af_HestaSveinn_Hissa" prepare="true"/>
<PrepareQuantum	name="qu_HjaHestasveini6" object="af_HestaSveinn_Hissa" prepare="false"/>
<PrepareQuantum	name="qp_HjaHestasveini7" object="af_HestaSveinn_HissaTalk" prepare="true"/>
<PrepareQuantum	name="qu_HjaHestasveini7" object="af_HestaSveinn_HissaTalk" prepare="false"/>

<StaticActor name="a_HestaSveinn" terrain="t_HjaHestasveinil" x="290" y="482" z="211" state="stop" save="true" random="true">
	<State name="stop" face="af_HestaSveinn_Stop" />
	<State name="stopkross" face="af_HestaSveinn_StopKross" />
	<State name="no" face="af_HestaSveinn_No" />
	<State name="hissa" face="af_HestaSveinn_Hissa" />
	<State name="hissatalk" face="af_HestaSveinn_HissaTalk" />
	<State name="HeillOgSaellHjaltiEg" face="af_HestaSveinn_Talk" mouth="m_HeillOgSaellHjaltiEg"/>
	<State name="HvadHefurThuAdBjoda" face="af_HestaSveinn_Talk" mouth="m_HvadHefurThuAdBjoda"/>
	<State name="NuEgErAdGaeta" face="af_HestaSveinn_Talk" mouth="m_NuEgErAdGaeta"/>
	<State name="JaAudvitadSvo" face="af_HestaSveinn_Talk" mouth="m_JaAudvitadSvo"/>
	<State name="KaupaSkalEi" face="af_HestaSveinn_Talk" mouth="m_KaupaSkalEi"/>
	<State name="NeiTakkOft" face="af_HestaSveinn_Talk" mouth="m_NeiTakkOft"/>
	<State name="ThettaMen" face="af_HestaSveinn_Talk" mouth="m_ThettaMen"/>
	<State name="Uhhh" face="af_HestaSveinn_HissaTalk" mouth="m_Uhhh"/>
	<State name="OgThaFaerdu" face="af_HestaSveinn_Talk" mouth="m_OgThaFaerdu"/>
	<State name="SaellHjalti" face="af_HestaSveinn_Talk" mouth="m_SaellHjalti"/>
	<State name="ErtuBlindur" face="af_HestaSveinn_Talk" mouth="m_ErtuBlindur"/>
</StaticActor>
<ActorMoused actor="a_HestaSveinn" moving="Hestasveinn" listener="sc" thf="hestasvein" looking="Hestasveinn Halls á Síðu" taking="Hrinda hestasveini"/>

<!-- Conversation -->
<SentenceContainer name="conv_HestaSveinn" scene="s_HjaHestasveini" polygon="p_HjaHestasveini" zmin="801" zmax="1500" save="true"/>

<!-- Quanta -->
<StateQuantum name="q_StopHestaSveinn" actor="a_HestaSveinn" state="stop" wait="false"/>
<StateQuantum name="q_StopKrossHestaSveinn" actor="a_HestaSveinn" state="stopkross" wait="false"/>
<StateQuantum name="q_HissaHestaSveinn" actor="a_HestaSveinn" state="hissa" wait="false"/>
<StateQuantum name="q_NoHestaSveinn" actor="a_HestaSveinn" state="no" wait="true"/>

<StateQuantum name="q_HeillOgSaellHjaltiEg" actor="a_HestaSveinn" state="HeillOgSaellHjaltiEg" wait="true"/>
<StateQuantum name="q_HvadHefurThuAdBjoda" actor="a_HestaSveinn" state="HvadHefurThuAdBjoda" wait="true"/>
<StateQuantum name="q_NuEgErAdGaeta" actor="a_HestaSveinn" state="NuEgErAdGaeta" wait="true"/>
<StateQuantum name="q_ErtuBlindur" actor="a_HestaSveinn" state="ErtuBlindur" wait="true"/>
<StateQuantum name="q_JaAudvitadSvo" actor="a_HestaSveinn" state="JaAudvitadSvo" wait="true"/>
<StateQuantum name="q_KaupaSkalEi" actor="a_HestaSveinn" state="KaupaSkalEi" wait="true"/>
<StateQuantum name="q_NeiTakkOft" actor="a_HestaSveinn" state="NeiTakkOft" wait="true"/>
<StateQuantum name="q_ThettaMen" actor="a_HestaSveinn" state="ThettaMen" wait="true"/>
<StateQuantum name="q_Uhhh" actor="a_HestaSveinn" state="Uhhh" wait="true"/>
<StateQuantum name="q_OgThaFaerdu" actor="a_HestaSveinn" state="OgThaFaerdu" wait="true"/>
<StateQuantum name="q_SaellHjalti" actor="a_HestaSveinn" state="SaellHjalti" wait="true"/>


<!-- HeidnirLogberg -->


<StaticActorFace name="af_HeidnirLogberg_Stop" file="\KristniA\AnimatiA\heidnirA\stop" />
<CelledAnimated2DActorFace speed="300" name="af_HeidnirLogberg_Rifast" repeat="-1" file="\kristniA\AnimatiA\heidnirA\rifast" count="3" />
<CelledAnimated2DActorFace speed="225" name="af_HeidnirLogberg_Walk" repeat="-1" file="\kristniA\AnimatiA\heidnirA\walk" count="2" />
<PrepareQuantum	name="qp_Logberg16" object="af_HeidnirLogberg_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Logberg16" object="af_HeidnirLogberg_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Logberg17" object="af_HeidnirLogberg_Rifast" prepare="true"/>
<PrepareQuantum	name="qu_Logberg17" object="af_HeidnirLogberg_Rifast" prepare="false"/>
<PrepareQuantum	name="qp_Logberg18" object="af_HeidnirLogberg_Walk" prepare="true"/>
<PrepareQuantum	name="qu_Logberg18" object="af_HeidnirLogberg_Walk" prepare="false"/>

<MovingActor name="a_HeidnirLogberg" state="stop" terrain="t_Logbergl" x="125" y="350" z="1" save="true">
	<State name="stop" face="af_HeidnirLogberg_Stop" />
	<State name="walk" face="af_HeidnirLogberg_Walk" />
	<State name="rifast" face="af_HeidnirLogberg_Rifast" />
</MovingActor>

<!-- Quanta -->
<StateQuantum name="q_StopHeidnirLogberg" actor="a_HeidnirLogberg" state="stop" wait="false"/>
<StateQuantum name="q_RifastHeidnirLogberg" actor="a_HeidnirLogberg" state="rifast" wait="false"/>
<StateQuantum name="q_WalkHeidnirLogberg" actor="a_HeidnirLogberg" state="walk" wait="false"/>

<SetDestinationQuantum name="q_BurtHeidnirLogberg" x="-250" y="370" speed="100" wait="false" actor="a_HeidnirLogberg"/>
<SetDestinationQuantum name="q_BurtHeidnirLogberg2" x="-250" y="370" speed="100" wait="true" actor="a_HeidnirLogberg"/>

<StaticActorFace name="af_Thorshamar" file="\KristniA\Graphic\thorshaA" prepare="true"/>
<StaticActorFace name="af_ThorshamarI" file="\KristniA\Graphic\inventoA\thorshaA" prepare="true"/>
<StaticActorFace name="af_ThorshamarU" file="\KristniA\Graphic\use\thorshaA" prepare="true"/>
<StaticActor name="a_Thorshamar" state="stop" terrain="t_Logbergl" x="180" y="349" z="-90" save="true" random="true">
	<State name="stop" face="af_Thorshamar" />
	<State name="taken" face="af_ThorshamarI" />
	<State name="use" face="af_ThorshamarU" />
</StaticActor>
<StateQuantum name="q_ThorshamarTaken" actor="a_Thorshamar" state="taken"/>
<ActorMoused actor="a_Thorshamar" listener="sc" thf="Þórshamar" moving="Þórshamarshálsmen" />

<StaticActorFace name="af_KrossI" file="\KristniA\Graphic\inventoA\kross" prepare="true"/>
<StaticActorFace name="af_KrossU" file="\KristniA\Graphic\use\kross" prepare="true"/>
<StaticActor name="a_Kross" state="taken" x="180" y="349" z="-40" save="true" random="true">
	<State name="taken" face="af_KrossI" />
	<State name="use" face="af_KrossU" />
</StaticActor>
<StateQuantum name="q_KrossTaken" actor="a_Kross" state="taken" />
<ActorMoused actor="a_Kross" listener="sc" thf="kross" moving=" "/>



<!-- KristnirLogberg -->

<StaticActorFace name="af_KristnirLogberg_Stop" file="\KristniA\AnimatiA\kristniA\stop" />
<CelledAnimated2DActorFace speed="300" name="af_KristnirLogberg_Rifast" repeat="-1" file="\kristniA\AnimatiA\kristniA\rifast" count="2" />
<CelledAnimated2DActorFace speed="225" name="af_KristnirLogberg_Walk" repeat="-1" file="\kristniA\AnimatiA\kristniA\walk" count="2" />
<PrepareQuantum	name="qp_Logberg13" object="af_KristnirLogberg_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Logberg13" object="af_KristnirLogberg_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Logberg14" object="af_KristnirLogberg_Rifast" prepare="true"/>
<PrepareQuantum	name="qu_Logberg14" object="af_KristnirLogberg_Rifast" prepare="false"/>
<PrepareQuantum	name="qp_Logberg15" object="af_KristnirLogberg_Walk" prepare="true"/>
<PrepareQuantum	name="qu_Logberg15" object="af_KristnirLogberg_Walk" prepare="false"/>

<MovingActor name="a_KristnirLogberg" state="stop" terrain="t_Logbergl" x="505" y="350" z="1" save="true">
	<State name="stop" face="af_KristnirLogberg_Stop" />
	<State name="walk" face="af_KristnirLogberg_Walk" />
	<State name="rifast" face="af_KristnirLogberg_Rifast" />
</MovingActor>

<!-- Quanta -->
<StateQuantum name="q_StopKristnirLogberg" actor="a_KristnirLogberg" state="stop" wait="false"/>
<StateQuantum name="q_RifastKristnirLogberg" actor="a_KristnirLogberg" state="rifast" wait="false"/>
<StateQuantum name="q_WalkKristnirLogberg" actor="a_KristnirLogberg" state="walk" wait="false"/>

<SetDestinationQuantum name="q_BurtKristnirLogberg" x="805" y="350" speed="100" wait="false" actor="a_KristnirLogberg"/>



<!-- Hallur -->

<Text name="a_Hallur_acc" terrain="t_Corners" text=" " r="200" g="30" b="30" hilite="false"/>

<SpeechActorMouth acc="a_Hallur_acc" name="m_HeilirOgSaelir" file="\kristniA\Media\hallur\heiliroA.wav" >
	<Sentence text="Heilir og sælir!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_VelMaeltudThidFyrirHond" file="\kristniA\Media\hallur\velmaelA.wav" >
	<Sentence text="Vel mæltuð þið fyrir hönd kristinna manna ..." time="0"/>
	<Sentence text="... á Lögbergi en nú er úr vöndu að ráða." time="1868"/>
	<Sentence text="Ég tel það ekki heillavænlegt ..." time="4750"/>
	<Sentence text="... að tvenn lög ríki hér á landi ..." time="6272"/>
	<Sentence text="... og mun því ekki segja upp ný lög ..." time="8463"/>
	<Sentence text="... fyrir kristna menn." time="10400"/>
	<Sentence text="Við verðum að freista þess ..." time="11793"/>
	<Sentence text="... að ná samningum við þá heiðnu." time="13512"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_HannHangirThurr" file="\kristniA\Media\hallur\hannhanA.wav" >
	<Sentence text="Hann hangir þurr að sinni ..." time="0"/>
	<Sentence text="... en ég held hann fari að þykkna upp á morgun." time="1855"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_Vegna" file="\kristniA\Media\hallur\vegna.wav" >
	<Sentence text="Vegna þess að ég held að það muni ..." time="0"/>
	<Sentence text="... koma af stað miklum ófriði ..." time="1400"/>
	<Sentence text="... ef við höfum tvenn trúarbrögð." time="3830"/>
	<Sentence text="Við verðum að reyna að komast að ..." time="5900"/>
	<Sentence text="... samkomulagi við þá heiðnu." time="7050"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_AlltI" file="\kristniA\Media\hallur\allti.wav" >
	<Sentence text="Allt í lagi. Við komumst hvort eð er ..." time="0"/>
	<Sentence text="... ekki að niðurstöðu í þessu erfiða ..." time="2500"/>
	<Sentence text="... máli með því að hanga hér." time="4600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_GottOg" file="\kristniA\Media\hallur\gottog.wav" >
	<Sentence text="Gott og vel.  En ekki vera lengi." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_Gott" file="\kristniA\Media\hallur\gott.wav" >
	<Sentence text="Gott og vel!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_AdSjalfsogduHjaltiHvad" file="\kristniA\Media\hallur\adsjalfA.wav" >
	<Sentence text="Að sjálfsögðu Hjalti.  Hvað liggur þér á hjarta?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_Drostu" file="\kristniA\Media\hallur\drostu.wav" >
	<Sentence text="Dróstu mig alla þessa leið til einskis?" time="0"/>
	<Sentence text="Ég er farinn!" time="2850"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_Neeeiiii" file="\kristniA\Media\hallur\neeeiiii.wav" >
	<Sentence text="Nei, ég held að ég sé ekki vinsæll ..." time="0"/>
	<Sentence text="... meðal heiðingjanna um þessar mundir." time="2180"/>
	<Sentence text="Ég sný við hér!" time="4400"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Hallur_acc" name="m_KomduSaellThorgeirLjosvetningagodiMer" file="\kristniA\Media\hallur\komdusaA.wav" >
	<Sentence text="Komdu sæll, Þorgeir Ljósvetningagoði!" time="0"/>
	<Sentence text="Mér er mikill vandi á höndum." time="2550"/>
	<Sentence text="Ég hef verið beðinn um að ..." time="4750"/>
	<Sentence text="... segja upp ný lög fyrir kristna menn ..." time="5680"/>
	<Sentence text="... en ég er ekki eins lögfróður og þú." time="8160"/>
	<Sentence text="Ég var að vona að þú værir ..." time="10696"/>
	<Sentence text="... fáanlegur til að segja upp ný lög ..." time="11900"/>
	<Sentence text="... fyrir kristna menn eða ein lög fyrir..." time="13868"/>
	<Sentence text="... alla Íslendinga sem taka bæði tillit..." time="16900"/>
	<Sentence text="... til kristinna og heiðinna manna." time="19200"/> </SpeechActorMouth>

<StaticActorFace name="af_Hallur_Stop" file="\KristniA\AnimatiA\hallur\stop" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hallur_Stop2Left" file="\KristniA\AnimatiA\hallur\stop2leA" prepare="true" count="1" repeat="1"/>
<CelledAnimated2DActorFace name="af_Hallur_Stop2Right" file="\KristniA\AnimatiA\hallur\stop2riA" prepare="true" count="1" repeat="1"/>
<CelledAnimated2DActorFace name="af_Hallur_Talk" repeat="-1" file="\kristniA\AnimatiA\hallur\talk" count="2" prepare="true" speed="225"/>
<CelledAnimated2DActorFace name="af_Hallur_Right" repeat="-1" file="\kristniA\AnimatiA\hallur\right" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Hallur_Left" repeat="-1" file="\kristniA\AnimatiA\hallur\left" count="8" prepare="true"/>

<Pseudo3DCollisionBox name="cb_Hallur" x="140" y="30" z="305"/>

<MovingActor name="a_Hallur" state="stop" terrain="t_Logbergl" x="700" y="540" z="15" scaling="dynamic" save="true" random="true">
	<State name="stop" face="af_Hallur_Stop" collisionbox="cb_Hallur"/>
	<State name="left" face="af_Hallur_Left" collisionbox="cb_Hallur"/>
	<State name="right" face="af_Hallur_Right" collisionbox="cb_Hallur"/>
	<State name="stop2left" face="af_Hallur_Stop2Left" collisionbox="cb_Hallur"/>
	<State name="stop2right" face="af_Hallur_Stop2Right" collisionbox="cb_Hallur"/>

	<State name="HeilirOgSaelir" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_HeilirOgSaelir"/>
	<State name="VelMaeltudThidFyrirHond" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_VelMaeltudThidFyrirHond"/>
	<State name="HannHangirThurr" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_HannHangirThurr"/>
	<State name="Vegna" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_Vegna"/>
	<State name="AlltI" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_AlltI"/>
	<State name="GottOg" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_GottOg"/>
	<State name="Drostu" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_Drostu"/>
	<State name="AdSjalfsogduHjaltiHvad" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_AdSjalfsogduHjaltiHvad"/>
	<State name="Neeeiiii" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_Neeeiiii"/>
	<State name="Gott" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_Gott"/>
	<State name="KomduSaellThorgeirLjosvetningagodiMer" face="af_Hallur_Talk" collisionbox="cb_Hallur" mouth="m_KomduSaellThorgeirLjosvetningagodiMer"/>

</MovingActor>

<ActorMoused actor="a_Hallur" listener="sc" looking="Hallur á Síðu" moving="Hallur á Síðu" thf="Hall á Síðu" taking="Hrinda Halli á Síðu"/>

<!-- Conversation -->
<SentenceContainer name="conv_Hallur" scene="s_KristnarBudir" polygon="p_All" zmin="801" zmax="1500" save="true"/>

<!-- Quanta -->
<StateQuantum name="q_StopHallur" actor="a_Hallur" state="stop" wait="false"/>

<StateQuantum name="q_HeilirOgSaelir" actor="a_Hallur" state="HeilirOgSaelir" wait="true"/>
<StateQuantum name="q_VelMaeltudThidFyrirHond" actor="a_Hallur" state="VelMaeltudThidFyrirHond" wait="true"/>
<StateQuantum name="q_HannHangirThurr" actor="a_Hallur" state="HannHangirThurr" wait="true"/>
<StateQuantum name="q_Vegna" actor="a_Hallur" state="Vegna" wait="true"/>
<StateQuantum name="q_AlltI" actor="a_Hallur" state="AlltI" wait="true"/>
<StateQuantum name="q_GottOg" actor="a_Hallur" state="GottOg" wait="true"/>
<StateQuantum name="q_Drostu" actor="a_Hallur" state="Drostu" wait="true"/>
<StateQuantum name="q_AdSjalfsogduHjaltiHvad" actor="a_Hallur" state="AdSjalfsogduHjaltiHvad" wait="true"/>
<StateQuantum name="q_Neeeiiii" actor="a_Hallur" state="Neeeiiii" wait="true"/>
<StateQuantum name="q_Gott" actor="a_Hallur" state="Gott" wait="true"/>
<StateQuantum name="q_KomduSaellThorgeirLjosvetningagodiMer" actor="a_Hallur" state="KomduSaellThorgeirLjosvetningagodiMer" wait="true"/>

<SetDestinationQuantum name="q_BurtHallur" actor="a_Hallur" x="850" y="500" wait="false" speed="80"/>



<!-- Toggi -->

<Text name="a_Toggi_acc" terrain="t_Corners" text=" " r="101" g="47" b="215" hilite="false"/>

<SpeechActorMouth acc="a_Toggi_acc" name="m_KomidThidSaelirGissurOg" file="\kristniA\Media\toggi\komidthA.wav" >
	<Sentence text="Komið þið sælir, Gissur og Hjalti!" time="0"/>
	<Sentence text="Þið tveir hafið heldur en ekki ..." time="2400"/>
	<Sentence text="... komið málum vorum í óefni." time="4100"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_IslendingarEruNuKlofnir" file="\kristniA\Media\toggi\islendiA.wav" >
	<Sentence text="Íslendingar eru nú klofnir í tvær fylkingar ..." time="0"/>
	<Sentence text="...  og við blasa deilur og vandræði sem ..." time="2700"/>
	<Sentence text="... ekki sér fyrir endann á" time="4680"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_EgErEkkiEinnAfTheim" file="\kristniA\Media\toggi\egerekkA.wav" >
	<Sentence text="Ég er ekki einn af þeim sem láta glepjast ..." time="0"/>
	<Sentence text="... af einhverjum tískutrúarbrögðum." time="2180"/>
	<Sentence text="Gömlu goðin halda tryggð minni að sinni." time="4900"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_UrVondu" file="\kristniA\Media\toggi\urvondu.wav" >
	<Sentence text="Úr vöndu er að ráða því það getur haft ..." time="0"/>
	<Sentence text="... ískyggilegar afleiðingar að hafa tvenn lög ..." time="1573"/>
	<Sentence text="... hér á þessu litla landi." time="3850"/>
	<Sentence text="Það er þó lítið sem ég get gert nú ..." time="6370"/>
	<Sentence text="... þegar allir kristnir menn hafa sagt sig úr ..." time="8000"/>
	<Sentence text="... lögum við okkur hina." time="10400"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_SjaldanHefEgSkyrinu" file="\kristniA\Media\toggi\sjaldanA.wav" >
	<Sentence text="Sjaldan hef ég skyrinu neitað!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_JaEnMerErEkkertKalt" file="\kristniA\Media\toggi\jaenmerA.wav" >
	<Sentence text="Já en mér er ekkert kalt.  Mér er funheitt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_JaHjaltiHvadErTher" file="\kristniA\Media\toggi\jahjaltA.wav" >
	<Sentence text="Já, Hjalti. Hvað er þér á höndum?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_ThettaVarTher" file="\kristniA\Media\toggi\thettavA.wav" >
	<Sentence text="Þetta var þér líkt Hjalti." time="0"/>
	<Sentence text="Ekkert nema svik og prettir. Ég er farinn!" time="2940"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_ThettaVar" file="\kristniA\Media\toggi\thettavB.wav" >
	<Sentence text="Þetta var þér líkt Hjalti." time="0"/>
	<Sentence text="Ekkert nema svik og prettir!" time="2940"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_JaejaThaEnEkki" file="\kristniA\Media\toggi\jaejathA.wav" >
	<Sentence text="Jæja þá. En ekki vera lengi." time="0"/>
	<Sentence text="Ég er kominn með vatn í munninn." time="2600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_ThuHefurLogAd" file="\kristniA\Media\toggi\thuhefuA.wav" >
	<Sentence text="Þú hefur lög að mæla Hallur, ..." time="0"/>
	<Sentence text="... okkur er mikill vandi á höndum." time="2100"/>
	<Sentence text="Það er þó skref í rétta átt að ræða ..." time="4770"/>
	<Sentence text="... málin á yfirvegaðan hátt." time="7040"/>
	<Sentence text="Ég mun nú íhuga þetta mál vandlega ..." time="10000"/>
	<Sentence text="... í ró og næði áður en ég get gefið þér svar." time="12050"/>
	<Sentence text="Vertu sæll að sinni!" time="15550"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_HallurASiduBad" file="\kristniA\Media\toggi\halluraA.wav" >
	<Sentence text="Hallur á Síðu bað mig um að segja upp lögin ..." time="0"/>
	<Sentence text="... fyrir kristna menn." time="2720"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_EgTharfNuAdFaTima" file="\kristniA\Media\toggi\egtharfA.wav" >
	<Sentence text="Ég þarf nú að fá tíma til að ..." time="0"/>
	<Sentence text="... hugleiða málið í góðu tómi." time="1250"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_VegnaThessAdMerErSvoKalt" file="\kristniA\Media\toggi\vegnathA.wav" >
	<Sentence text="Vegna þess að mér er svo kalt." time="0"/>
	<Sentence text="Ég get ekki hugsað í þessum kulda." time="2600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_ThettaVarEinmitt" file="\kristniA\Media\toggi\thettavC.wav" >
	<Sentence text="Þetta var einmitt það sem mig vantaði." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_LoksinsHef" file="\kristniA\Media\toggi\loksinsA.wav" >
	<Sentence text="Loksins hef ég komist að niðurstöðu." time="0"/>
	<Sentence text="Þið skuluð allir fylgja mér til Lögbergs." time="3900"/>
	<Sentence text="Þar mun ég ávarpa þingheim." time="6780"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_KaeruLandar" file="\kristniA\Media\toggi\kaerulaA.wav" >
	<Sentence text="Kæru landar, heiðnir og kristnir." time="0"/>
	<Sentence text="Í allan gærdag og alla nótt hef ég hugleitt þau vandræði ..." time="2360"/>
	<Sentence text="... sem að okkur steðja." time="6230"/>
	<Sentence text="Ef við höfum ekki ein lög áfram í landinu..." time="8135"/>
	<Sentence text="... þá mun glundroði ráða hér ríkjum og allt í óefni fara." time="11885"/>
	<Sentence text="Bæði í Danmörku og Noregi hafa deilur af þessum toga ..." time="16700"/>
	<Sentence text="... valdið miklum ófriði sem stóð í mörg ár." time="20600"/>
	<Sentence text="Ég legg það því til að við miðlum málum á þann veg ..." time="24232"/>
	<Sentence text="... að báðir hafi nokkuð til síns máls." time="28300"/>
	<Sentence text="Það mun verða satt er vér slítum í sundur lögin ..." time="32130"/>
	<Sentence text="... að vér munum slíta og friðinn." time="35600"/>
	<Sentence text="Eru allir viðstaddir reiðubúnir að hlýða úrskurði mínum?" time="38730"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_HerEftirSkulu" file="\kristniA\Media\toggi\hereftiA.wav" >
	<Sentence text="Hér eftir skulu allir sem búa á ..." time="0"/>
	<Sentence text="... Íslandi vera kristnir og taka skírn." time="3170"/>
	<Sentence text="Áfram verður þó leyfilegt að ..." time="7350"/>
	<Sentence text="... bera út börn og eta hrossakjöt." time="8900"/>
	<Sentence text="Einnig mega menn áfram blóta goðin ..." time="13000"/>
	<Sentence text="... en aðeins ef enginn annar sér það." time="15600"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_ThettaHefdiAldreiGengid" file="\kristniA\Media\toggi\thettahA.wav" >
	<Sentence text="Gissur og Hjalti!" time="0"/>
	<Sentence text="Þetta hefði aldrei gengið svona vel án ykkar hjálpar" time="1200"/>
	<Sentence text="Þið hafið reynst löndum ykkar vel." time="4050"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Toggi_acc" name="m_EgHeldAdEgAettiEkki" file="\kristniA\Media\toggi\egheldaA.wav" >
	<Sentence text="Ég held að ég ætti ekki að fara yfir í..." time="0"/>
	<Sentence text="... búðir kristinna manna.  Ég sný við hér." time="2000"/> </SpeechActorMouth>

<StaticActorFace name="af_Toggi_Stop" file="\KristniA\AnimatiA\toggi\stop" prepare="true"/>
<StaticActorFace name="af_Toggi_StopFeld" file="\KristniA\AnimatiA\toggi\stopfeld" prepare="false"/>
<CelledAnimated2DActorFace name="af_Toggi_Talk" repeat="-1" file="\kristniA\AnimatiA\toggi\talk" count="4" prepare="true" random="true"/>
<CelledAnimated2DActorFace name="af_Toggi_TalkFeld" repeat="-1" file="\kristniA\AnimatiA\toggi\talkfeld" count="3" prepare="false" random="true"/>
<CelledAnimated2DActorFace name="af_Toggi_Right" repeat="-1" file="\kristniA\AnimatiA\toggi\right" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Toggi_Left" repeat="-1" file="\kristniA\AnimatiA\toggi\left" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="af_Toggi_Skelfur" repeat="-1" file="\kristniA\AnimatiA\toggi\skelfur" count="2" prepare="false" xoffset="10" yoffset="0" random="true"/>
<CelledAnimated2DActorFace name="af_Toggi_GefurStein" repeat="1" file="\kristniA\AnimatiA\toggi\gefurstA" count="5" prepare="false" xoffset="-2" yoffset="0" />

<Pseudo3DCollisionBox name="cb_Toggi" x="128" y="30" z="298"/>

<MovingActor name="a_Toggi" state="stop" terrain="t_Logbergl" x="440" y="445" z="15" scaling="dynamic" save="true" random="true">
	<State name="stop" face="af_Toggi_Stop" collisionbox="cb_Toggi"/>
	<State name="stopfeld" face="af_Toggi_StopFeld" collisionbox="cb_Toggi"/>
	<State name="gefurstein" face="af_Toggi_GefurStein" collisionbox="cb_Toggi"/>
	<State name="skelfur" face="af_Toggi_Skelfur" collisionbox="cb_Toggi"/>
	<State name="left" face="af_Toggi_Left" collisionbox="cb_Toggi"/>
	<State name="right" face="af_Toggi_Right" collisionbox="cb_Toggi"/>

	<State name="KomidThidSaelirGissurOg" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_KomidThidSaelirGissurOg"/>
	<State name="IslendingarEruNuKlofnir" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_IslendingarEruNuKlofnir"/>
	<State name="EgErEkkiEinnAfTheim" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_EgErEkkiEinnAfTheim"/>
	<State name="UrVondu" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_UrVondu"/>
	<State name="SjaldanHefEgSkyrinu" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_SjaldanHefEgSkyrinu"/>
	<State name="ThettaVarTher" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_ThettaVarTher"/>
	<State name="ThettaVar" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_ThettaVar"/>
	<State name="JaejaThaEnEkki" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_JaejaThaEnEkki"/>
	<State name="ThuHefurLogAd" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_ThuHefurLogAd"/>
	<State name="HallurASiduBad" face="af_Toggi_Skelfur" collisionbox="cb_Toggi" mouth="m_HallurASiduBad"/>
	<State name="EgTharfNuAdFaTima" face="af_Toggi_Skelfur" collisionbox="cb_Toggi" mouth="m_EgTharfNuAdFaTima"/>
	<State name="VegnaThessAdMerErSvoKalt" face="af_Toggi_Skelfur" collisionbox="cb_Toggi" mouth="m_VegnaThessAdMerErSvoKalt"/>
	<State name="ThettaVarEinmitt" face="af_Toggi_TalkFeld" collisionbox="cb_Toggi" mouth="m_ThettaVarEinmitt"/>
	<State name="LoksinsHef" face="af_Toggi_TalkFeld" collisionbox="cb_Toggi" mouth="m_LoksinsHef"/>
	<State name="KaeruLandar" face="af_Toggi_TalkFeld" collisionbox="cb_Toggi" mouth="m_KaeruLandar"/>
	<State name="HerEftirSkulu" face="af_Toggi_TalkFeld" collisionbox="cb_Toggi" mouth="m_HerEftirSkulu"/>
	<State name="ThettaHefdiAldreiGengid" face="af_Toggi_TalkFeld" collisionbox="cb_Toggi" mouth="m_ThettaHefdiAldreiGengid"/>
	<State name="EgHeldAdEgAettiEkki" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_EgHeldAdEgAettiEkki"/>
	<State name="JaHjaltiHvadErTher" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_JaHjaltiHvadErTher"/>
	<State name="JaHjaltiHvadErTherFeldur" face="af_Toggi_Skelfur" collisionbox="cb_Toggi" mouth="m_JaHjaltiHvadErTher"/>
	<State name="JaEnMerErEkkertKalt" face="af_Toggi_Talk" collisionbox="cb_Toggi" mouth="m_JaEnMerErEkkertKalt"/>

</MovingActor>

<ActorMoused actor="a_Toggi" listener="sc" moving="Þorgeir Ljósvetningagoði" looking="Þorgeir Ljósvetningagoði" taking="Hrinda Þorgeiri Ljósvetningagoða" talking="Tala við Þorgeir Ljósvetningagoða" thf="Þorgeir Ljósvetningagoða"/>

<!-- Conversation -->
<SentenceContainer name="conv_Toggi" scene="s_HeidnarBudir" polygon="p_All" zmin="801" zmax="1500" save="true"/>

<!-- Quanta -->
<StateQuantum name="q_StopToggi" actor="a_Toggi" state="stop" wait="false"/>
<StateQuantum name="q_StopFeldToggi" actor="a_Toggi" state="stopfeld" wait="false"/>
<StateQuantum name="q_ToggiSkelfur" actor="a_Toggi" state="skelfur" wait="false"/>
<StateQuantum name="q_ToggiGefurStein" actor="a_Toggi" state="gefurstein" wait="true"/>

<StateQuantum name="q_JaHjaltiHvadErTher" actor="a_Toggi" state="JaHjaltiHvadErTher" wait="true"/>
<StateQuantum name="q_JaHjaltiHvadErTherFeldur" actor="a_Toggi" state="JaHjaltiHvadErTherFeldur" wait="true"/>
<StateQuantum name="q_JaEnMerErEkkertKalt" actor="a_Toggi" state="JaEnMerErEkkertKalt" wait="true"/>
<StateQuantum name="q_KomidThidSaelirGissurOg" actor="a_Toggi" state="KomidThidSaelirGissurOg" wait="true"/>
<StateQuantum name="q_IslendingarEruNuKlofnir" actor="a_Toggi" state="IslendingarEruNuKlofnir" wait="true"/>
<StateQuantum name="q_EgErEkkiEinnAfTheim" actor="a_Toggi" state="EgErEkkiEinnAfTheim" wait="true"/>
<StateQuantum name="q_UrVondu" actor="a_Toggi" state="UrVondu" wait="true"/>
<StateQuantum name="q_SjaldanHefEgSkyrinu" actor="a_Toggi" state="SjaldanHefEgSkyrinu" wait="true"/>
<StateQuantum name="q_ThettaVarTher" actor="a_Toggi" state="ThettaVarTher" wait="true"/>
<StateQuantum name="q_ThettaVar" actor="a_Toggi" state="ThettaVar" wait="true"/>
<StateQuantum name="q_JaejaThaEnEkki" actor="a_Toggi" state="JaejaThaEnEkki" wait="true"/>
<StateQuantum name="q_ThuHefurLogAd" actor="a_Toggi" state="ThuHefurLogAd" wait="true"/>
<StateQuantum name="q_HallurASiduBad" actor="a_Toggi" state="HallurASiduBad" wait="true"/>
<StateQuantum name="q_EgTharfNuAdFaTima" actor="a_Toggi" state="EgTharfNuAdFaTima" wait="true"/>
<StateQuantum name="q_VegnaThessAdMerErSvoKalt" actor="a_Toggi" state="VegnaThessAdMerErSvoKalt" wait="true"/>
<StateQuantum name="q_ThettaVarEinmitt" actor="a_Toggi" state="ThettaVarEinmitt" wait="true"/>
<StateQuantum name="q_LoksinsHef" actor="a_Toggi" state="LoksinsHef" wait="true"/>
<StateQuantum name="q_KaeruLandar" actor="a_Toggi" state="KaeruLandar" wait="true"/>
<StateQuantum name="q_HerEftirSkulu" actor="a_Toggi" state="HerEftirSkulu" wait="true"/>
<StateQuantum name="q_ThettaHefdiAldreiGengid" actor="a_Toggi" state="ThettaHefdiAldreiGengid" wait="true"/>
<StateQuantum name="q_EgHeldAdEgAettiEkki" actor="a_Toggi" state="EgHeldAdEgAettiEkki" wait="true"/>

<SetDestinationQuantum name="q_BurtToggi" actor="a_Toggi" x="-100" y="480" wait="true" speed="130"/>

<PrepareQuantum name="qp_Toggi1" object="af_Toggi_Skelfur" prepare="true"/>
<PrepareQuantum name="qp_Toggi2" object="af_Toggi_StopFeld" prepare="true"/>
<PrepareQuantum name="qp_Toggi3" object="af_Toggi_TalkFeld" prepare="true"/>
<PrepareQuantum name="qp_Toggi4" object="af_Toggi_GefurStein" prepare="true"/>


<!-- Volva -->

<Text name="a_Volva_acc" terrain="t_Corners" text=" " r="232" g="136" b="88" hilite="false"/>

<SpeechActorMouth acc="a_Volva_acc" name="m_HvernigDirfistu" file="\kristniA\Media\volva\hvernigA.wav" >
	<Sentence text="Hvernig dirfistu að trufla mig við iðju mína." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Volva_acc" name="m_HvadDregurThigHingad" file="\kristniA\Media\volva\hvaddreA.wav" >
	<Sentence text="Hvað dregur þig hingað, ungi maður?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Volva_acc" name="m_OgMedThettaFallegaHalsmen" file="\kristniA\Media\volva\ogmedthA.wav" >
	<Sentence text="Og með þetta fallega hálsmen." time="0"/>
	<Sentence text="Ég þekki vanda þinn og get ..." time="2750"/>
	<Sentence text="... boðið þér lausn á honum." time="4900"/>
	<Sentence text="En fyrst verður þú að geta hvað ég heiti." time="7000"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Volva_acc" name="m_ThettaVarNuAlltOf" file="\kristniA\Media\volva\thettavA.wav" >
	<Sentence text="Þetta var nú allt of auðvelt." time="0"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Volva_acc" name="m_EgThekkiVanda" file="\kristniA\Media\volva\egthekkA.wav" >
	<Sentence text="Ég þekki vanda þinn og get ..." time="0"/>
    	<Sentence text="... boðið þér lausn á honum." time="2100"/>
   	<Sentence text="En fyrst verður þú að geta hvað ég heiti." time="4150"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Volva_acc" name="m_FaduMer" file="\kristniA\Media\volva\fadumer.wav" >
	<Sentence text="Fáðu mér nú Þórshamarshálsmenið ..." time="0"/>
   	<Sentence text="... sem ég veit að þú hefur í fórum þínum." time="1870"/> </SpeechActorMouth>
<SpeechActorMouth acc="a_Volva_acc" name="m_GettuBetur" file="\kristniA\Media\volva\gettubeA.wav" >
	<Sentence text="Gettu betur!" time="0"/> </SpeechActorMouth>

<StaticActorFace name="af_Volva_Stop" file="\KristniA\AnimatiA\volva\stop" prepare="false"/>
<StaticActorFace name="af_Volva_Stop2" file="\KristniA\AnimatiA\volva\stop2" prepare="false" xoffset="-48" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Volva_Talk" repeat="-1" file="\kristniA\AnimatiA\volva\talk" count="2" prepare="false" speed="225" random="true"/>
<CelledAnimated2DActorFace name="af_Volva_Snu" repeat="1" file="\kristniA\AnimatiA\volva\snu" count="4" prepare="false" speed="225" xoffset="-48" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Volva_SnuKross" repeat="1" file="\kristniA\AnimatiA\volva\snu2" count="3" prepare="false" speed="300" xoffset="-97" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Volva_Kross" repeat="1" file="\kristniA\AnimatiA\volva\kross" count="4" prepare="false" speed="300" xoffset="-97" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Volva_Dyfir" repeat="4" file="\kristniA\AnimatiA\volva\dyfir" count="2" prepare="false" speed="450" xoffset="-97" yoffset="0"/>
<CelledAnimated2DActorFace name="af_Volva_StopKross" repeat="2" file="\kristniA\AnimatiA\volva\stopkroA" count="1" prepare="false" speed="750" xoffset="-97" yoffset="0"/>

<StaticActor name="a_Volva" state="stop2" terrain="t_HjaVolvul" x="325" y="180" z="1" save="true" random="true">
	<State name="stop" face="af_Volva_Stop" />
	<State name="stop2" face="af_Volva_Stop2" />
	<State name="snu" face="af_Volva_Snu" />
	<State name="snuKross" face="af_Volva_SnuKross"/>
	<State name="kross" face="af_Volva_Kross" />
	<State name="dyfir" face="af_Volva_Dyfir"/>
	<State name="stopkross" face="af_Volva_StopKross"/>

	<State name="HvernigDirfistu" face="af_Volva_Talk" mouth="m_HvernigDirfistu"/>
	<State name="HvadDregurThigHingad" face="af_Volva_Talk" mouth="m_HvadDregurThigHingad"/>
	<State name="OgMedThettaFallegaHalsmen" face="af_Volva_Talk" mouth="m_OgMedThettaFallegaHalsmen"/>
	<State name="ThettaVarNuAlltOf" face="af_Volva_Talk" mouth="m_ThettaVarNuAlltOf"/>
	<State name="GettuBetur" face="af_Volva_Talk" mouth="m_GettuBetur"/>
	<State name="EgThekkiVanda" face="af_Volva_Talk" mouth="m_EgThekkiVanda"/>
	<State name="FaduMer" face="af_Volva_Talk" mouth="m_FaduMer"/>

</StaticActor>

<ActorMoused actor="a_Volva" listener="sc" looking="Seiðkona" taking="Hrinda seiðkonu" talking="Tala við seiðkonu" thf="seiðkonu" moving="Seiðkona"/>

<!-- Conversation -->
<SentenceContainer name="conv_Volva" scene="s_HjaVolvu" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta -->
<StateQuantum name="q_StopVolva" actor="a_Volva" state="stop" wait="false"/>
<StateQuantum name="q_StopVolva2" actor="a_Volva" state="stop2" wait="false"/>
<StateQuantum name="q_KrossVolva" actor="a_Volva" state="kross" wait="true"/>
<StateQuantum name="q_DyfirVolva" actor="a_Volva" state="dyfir" wait="true"/>
<StateQuantum name="q_SnuVolva" actor="a_Volva" state="snu" wait="true"/>
<StateQuantum name="q_SnuKrossVolva" actor="a_Volva" state="snuKross" wait="true"/>
<StateQuantum name="q_StopKrossVolva" actor="a_Volva" state="stopkross" wait="true"/>

<StateQuantum name="q_HvernigDirfistu" actor="a_Volva" state="HvernigDirfistu" wait="true"/>
<StateQuantum name="q_HvadDregurThigHingad" actor="a_Volva" state="HvadDregurThigHingad" wait="true"/>
<StateQuantum name="q_OgMedThettaFallegaHalsmen" actor="a_Volva" state="OgMedThettaFallegaHalsmen" wait="true"/>
<StateQuantum name="q_ThettaVarNuAlltOf" actor="a_Volva" state="ThettaVarNuAlltOf" wait="true"/>
<StateQuantum name="q_EgThekkiVanda" actor="a_Volva" state="EgThekkiVanda" wait="true"/>
<StateQuantum name="q_GettuBetur" actor="a_Volva" state="GettuBetur" wait="true"/>
<StateQuantum name="q_FaduMer" actor="a_Volva" state="FaduMer" wait="true"/>


<PrepareQuantum	name="qp_Volva1" object="af_Volva_Kross" prepare="true"/>
<PrepareQuantum	name="qu_Volva1" object="af_Volva_Kross" prepare="false"/>
<PrepareQuantum	name="qp_Volva2" object="af_Volva_SnuKross" prepare="true"/>
<PrepareQuantum	name="qu_Volva2" object="af_Volva_SnuKross" prepare="false"/>
<PrepareQuantum	name="qp_Volva3" object="af_Volva_Dyfir" prepare="true"/>
<PrepareQuantum	name="qu_Volva3" object="af_Volva_Dyfir" prepare="false"/>
<PrepareQuantum	name="qp_Volva4" object="af_Volva_Talk" prepare="true"/>
<PrepareQuantum	name="qu_Volva4" object="af_Volva_Talk" prepare="false"/>
<PrepareQuantum	name="qp_Volva5" object="af_Volva_Snu" prepare="true"/>
<PrepareQuantum	name="qu_Volva5" object="af_Volva_Snu" prepare="false"/>
<PrepareQuantum	name="qp_Volva6" object="af_Volva_Stop" prepare="true"/>
<PrepareQuantum	name="qu_Volva6" object="af_Volva_Stop" prepare="false"/>
<PrepareQuantum	name="qp_Volva7" object="af_Volva_Stop2" prepare="true"/>
<PrepareQuantum	name="qu_Volva7" object="af_Volva_Stop2" prepare="false"/>
<PrepareQuantum	name="qp_Volva8" object="af_Volva_StopKross" prepare="true"/>
<PrepareQuantum	name="qu_Volva8" object="af_Volva_StopKross" prepare="false"/>

<Sequence name="sp_Volva">
	<Quantum name="qp_Volva1"/>
	<Quantum name="qp_Volva2"/>
	<Quantum name="qp_Volva3"/>
	<Quantum name="qp_Volva4"/>
	<Quantum name="qp_Volva5"/>
	<Quantum name="qp_Volva6"/>
	<Quantum name="qp_Volva7"/>
	<Quantum name="qp_Volva8"/>
</Sequence>
<CheckConditionQuantum name="qp_Volva" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Volva"/>
</CheckConditionQuantum>

<Sequence name="su_Volva">
	<Quantum name="qu_Volva1"/>
	<Quantum name="qu_Volva2"/>
	<Quantum name="qu_Volva3"/>
	<Quantum name="qu_Volva4"/>
	<Quantum name="qu_Volva5"/>
	<Quantum name="qu_Volva6"/>
	<Quantum name="qu_Volva7"/>
	<Quantum name="qu_Volva8"/>
</Sequence>
<CheckConditionQuantum name="qu_Volva" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Volva"/>
</CheckConditionQuantum>


<!-- Quanta -->

<JMFActorMouth name="m_Adallag" file="\kristniA\Media\2_000.wav" repeat="true" prepare="true"/>
<FadeQuantum name="qf_Adallag" mouth="m_Adallag" goal="0.27" speed="0"/>
<PrepareQuantum name="qp_Adallag" object="m_Adallag" prepare="true"/>
<StaticActor name="a_Adallag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Adallag"/> </StaticActor>
<StateQuantum name="q_StopSong" actor="a_Adallag" state="stop" wait="false"/>
<StateQuantum name="q_PlaySong" actor="a_Adallag" state="play" wait="false"/>

<Sequence name="sp_HeidnarBudir">
    <Quantum name="qp_HeidnarBudir1"/>
    <Quantum name="qp_HeidnarBudir2"/>
    <Quantum name="qp_HeidnarBudir3"/>
    <Quantum name="qp_HeidnarBudir4"/>
</Sequence>

<CheckConditionQuantum name="qp_HeidnarBudir" flag="f_Zero" wait="true">
    <Trigger value="0" seq="sp_HeidnarBudir"/>
</CheckConditionQuantum>

<Sequence name="su_HeidnarBudir">
    <Quantum name="qu_HeidnarBudir1"/>
    <Quantum name="qu_HeidnarBudir2"/>
    <Quantum name="qu_HeidnarBudir3"/>
    <Quantum name="qu_HeidnarBudir4"/>
</Sequence>

<CheckConditionQuantum name="qu_HeidnarBudir" flag="f_Zero" wait="true">
    <Trigger value="0" seq="su_HeidnarBudir"/>
</CheckConditionQuantum>

<Sequence name="sp_HjaHestasveini">
    <Quantum name="qp_HjaHestasveini1"/>
    <Quantum name="qp_HjaHestasveini2"/>
    <Quantum name="qp_HjaHestasveini3"/>
    <Quantum name="qp_HjaHestasveini4"/>
    <Quantum name="qp_HjaHestasveini5"/>
    <Quantum name="qp_HjaHestasveini6"/>
    <Quantum name="qp_HjaHestasveini7"/>
</Sequence>

<CheckConditionQuantum name="qp_HjaHestasveini" flag="f_Zero" wait="true">
    <Trigger value="0" seq="sp_HjaHestasveini"/>
</CheckConditionQuantum>

<Sequence name="su_HjaHestasveini">
    <Quantum name="qu_HjaHestasveini1"/>
    <Quantum name="qu_HjaHestasveini2"/>
    <Quantum name="qu_HjaHestasveini3"/>
    <Quantum name="qu_HjaHestasveini4"/>
    <Quantum name="qu_HjaHestasveini5"/>
    <Quantum name="qu_HjaHestasveini6"/>
    <Quantum name="qu_HjaHestasveini7"/>
</Sequence>

<CheckConditionQuantum name="qu_HjaHestasveini" flag="f_Zero" wait="true">
    <Trigger value="0" seq="su_HjaHestasveini"/>
</CheckConditionQuantum>

<Sequence name="sp_Logberg">
    <Quantum name="qp_Logberg1"/>
    <Quantum name="qp_Logberg2"/>
    <Quantum name="qp_Logberg3"/>
    <Quantum name="qp_Logberg4"/>
    <Quantum name="qp_Logberg5"/>
    <Quantum name="qp_Logberg6"/>
    <Quantum name="qp_Logberg7"/>
    <Quantum name="qp_Logberg8"/>
    <Quantum name="qp_Logberg9"/>
    <Quantum name="qp_Logberg10"/>
    <Quantum name="qp_Logberg11"/>
    <Quantum name="qp_Logberg12"/>
    <Quantum name="qp_Logberg13"/>
    <Quantum name="qp_Logberg14"/>
    <Quantum name="qp_Logberg15"/>
    <Quantum name="qp_Logberg16"/>
    <Quantum name="qp_Logberg17"/>
    <Quantum name="qp_Logberg18"/>
</Sequence>
<CheckConditionQuantum name="qp_Logberg" flag="f_Zero" wait="true">
    <Trigger value="0" seq="sp_Logberg"/>
</CheckConditionQuantum>
<Sequence name="su_Logberg">
    <Quantum name="qu_Logberg1"/>
    <Quantum name="qu_Logberg2"/>
    <Quantum name="qu_Logberg3"/>
    <Quantum name="qu_Logberg4"/>
    <Quantum name="qu_Logberg5"/>
    <Quantum name="qu_Logberg6"/>
    <Quantum name="qu_Logberg7"/>
    <Quantum name="qu_Logberg8"/>
    <Quantum name="qu_Logberg9"/>
    <Quantum name="qu_Logberg10"/>
    <Quantum name="qu_Logberg11"/>
    <Quantum name="qu_Logberg12"/>
    <Quantum name="qu_Logberg13"/>
    <Quantum name="qu_Logberg14"/>
    <Quantum name="qu_Logberg15"/>
    <Quantum name="qu_Logberg16"/>
    <Quantum name="qu_Logberg17"/>
    <Quantum name="qu_Logberg18"/>
</Sequence>

<CheckConditionQuantum name="qu_Logberg" flag="f_Zero" wait="true">
    <Trigger value="0" seq="su_Logberg"/>
</CheckConditionQuantum>

<SwitchSceneQuantum	name="q_ToBlack" scene="s_Black"/>
<SwitchSceneQuantum	name="q_ToLogberg" scene="s_Logberg"/>
<SwitchSceneQuantum	name="q_ToHjaHestasveini" scene="s_HjaHestasveini"/>
<SwitchSceneQuantum	name="q_ToKristnarBudir" scene="s_KristnarBudir"/>
<SwitchSceneQuantum	name="q_ToHeidnarBudir"	scene="s_HeidnarBudir"/>
<SwitchSceneQuantum	name="q_ToHjaVolvu"	scene="s_HjaVolvu"/>

<!-- Move items to nowhere -->
<MoveActorQuantum name="q_MoveKross" actor="a_Kross"/>
<MoveActorQuantum name="q_MoveThorshamar" actor="a_Thorshamar"/>
<MoveActorQuantum name="q_MoveFeldur" actor="a_Feldur"/>
<MoveActorQuantum name="q_MovePokar" actor="a_Pokar"/>

<!-- Move items to the inventory -->
<MoveActorQuantum name="q_MovePeningur2Inventory" actor="a_Peningur" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveThorshamar2Inventory" actor="a_Thorshamar" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MovePokar2Inventory" actor="a_Pokar" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveKross2Inventory" actor="a_Kross" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveFeldur2Inventory" actor="a_Feldur" terrain="t_Inventory"/>

<!-- Move items to a specific place -->

<MoveActorQuantum name="q_MoveHallur2Logberg" actor="a_Hallur" terrain="t_Logbergl">
	<Location x="700" y="540" z="15"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveToggi2Logberg" actor="a_Toggi" terrain="t_Logbergl">
	<Location x="440" y="445" z="15"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHeidnirLogberg2Logberg" actor="a_HeidnirLogberg" terrain="t_Logbergl">
    <Location x="125" y="350" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveKristnirLogberg2Logberg" actor="a_KristnirLogberg" terrain="t_Logbergl">
    <Location x="505" y="350" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveVikingur2Logberg" actor="a_Vikingur" terrain="t_Logbergl">
    <Location x="200" y="550" z="150"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveEldmadur2Logberg" actor="a_Eldmadur" terrain="t_Logbergl">
    <Location x="220" y="300" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSnorri2Logberg" actor="a_Snorri" terrain="t_Logbergl">
    <Location x="550" y="550" z="150"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveGissurHviti2LogbergFin" actor="a_GissurHviti" terrain="t_Logbergl">
    <Location x="360" y="550" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHjalti2LogbergFin" actor="a_Hjalti" terrain="t_Logbergl">
    <Location x="530" y="550" z="1"/> </MoveActorQuantum>

<MoveActorQuantum name="q_MoveHallur2KristnarBudir"	actor="a_Hallur" terrain="t_KristnarBudirl">
	<Location x="380" y="530" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveToggi2HeidnarBudir" actor="a_Toggi" terrain="t_HeidnarBudirl">
	<Location x="410" y="520" z="1"/> </MoveActorQuantum>

<MoveActorQuantum name="q_MoveHjalti2HjaHestasveiniFromHeidnarBudir" actor="a_Hjalti" terrain="t_HjaHestasveinil">
	<Location x="-75" y="550" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2HjaHestasveiniFromHeidnarBudir" actor="a_Hjalti" wait="true" x="500" y="560" />
<SetDestinationQuantum name="q_WalkHjalti2HjaHestasveiniFromHeidnarBudirNew" actor="a_Hjalti" wait="true" x="930" y="560" />
<MoveActorQuantum name="q_MoveGissurHviti2HjaHestasveiniFromHeidnarBudir" actor="a_GissurHviti"	terrain="t_HjaHestasveinil">
	<Location x="-200" y="550" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissurHviti2HjaHestasveiniFromHeidnarBudir" actor="a_GissurHviti" wait="false" x="250" y="510" speed="95"/>
<MoveActorQuantum name="q_MoveToggi2HjaHestasveiniFromHeidnarBudir" actor="a_Toggi"	terrain="t_HjaHestasveinil">
	<Location x="-350" y="550" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkToggi2HjaHestasveiniFromHeidnarBudir" actor="a_Toggi" wait="false" x="125" y="550" speed="85"/>

<MoveActorQuantum name="q_MoveHjalti2LogbergFromHjaHestasveini"	actor="a_Hjalti" terrain="t_Logbergl">
	<Location x="-90" y="580" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2LogbergFromHjaHestasveini" actor="a_Hjalti" wait="true" x="525" y="550" />
<SetDestinationQuantum name="q_WalkHjalti2LogbergFromHjaHestasveiniNew" actor="a_Hjalti" wait="true" x="950" y="550" />
<SetDestinationQuantum name="q_WalkHjalti2Toggi" actor="a_Hjalti" wait="true" x="520" y="440" />
<MoveActorQuantum name="q_MoveGissurHviti2LogbergFromHjaHestasveini" actor="a_GissurHviti" terrain="t_Logbergl">
	<Location x="-180" y="580" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissurHviti2LogbergFromHjaHestasveini" actor="a_GissurHviti" wait="false" x="370" y="550" speed="87"/>
<MoveActorQuantum name="q_MoveToggi2LogbergFromHjaHestasveini" actor="a_Toggi" terrain="t_Logbergl">
	<Location x="-285" y="500" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkToggi2LogbergFromHjaHestasveini" actor="a_Toggi" wait="false" x="150" y="500" speed="84"/>
<SetDestinationQuantum name="q_WalkToggiAwayFromLogberg" actor="a_Toggi" wait="true" x="-150" y="500" speed="90"/>
<SetDestinationQuantum name="q_WalkToggiAwayFromLogberg2" actor="a_Toggi" wait="false" x="-150" y="500" speed="90"/>
<SetDestinationQuantum name="q_WalkHallur2Toggi" actor="a_Hallur" wait="true" x="250" y="500" speed="90"/>

<MoveActorQuantum name="q_MoveHjalti2LogbergFromKristnarBudir" actor="a_Hjalti"	terrain="t_Logbergl">
	<Location x="1000" y="560" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2LogbergFromKristnarBudir" actor="a_Hjalti" wait="false" x="530" y="550" />
<SetDestinationQuantum name="q_WalkHjalti2LogbergFromKristnarBudirNew" actor="a_Hjalti" wait="true" x="-120" y="550" />
<MoveActorQuantum name="q_MoveGissurHviti2LogbergFromKristnarBudir"	actor="a_GissurHviti" terrain="t_Logbergl">
	<Location x="900" y="560" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissurHviti2LogbergFromKristnarBudir" actor="a_GissurHviti" wait="true" x="360" y="550" speed="93"/>
<MoveActorQuantum name="q_MoveHallur2LogbergFromKristnarBudir"	actor="a_Hallur" terrain="t_Logbergl">
	<Location x="1100" y="560" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHallur2LogbergFromKristnarBudir" actor="a_Hallur" wait="false" x="650" y="500" speed="87"/>
<SetDestinationQuantum name="q_WalkHallurAway" actor="a_Hallur" wait="true" x="900" y="500" speed="90"/>

<MoveActorQuantum name="q_MoveHjalti2HjaHestasveiniFromLogberg"	actor="a_Hjalti" terrain="t_HjaHestasveinil">
	<Location x="1050" y="550" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHjalti2HjaHestasveiniFromLogberg5" actor="a_Hjalti" terrain="t_HjaHestasveinil">
	<Location x="1275" y="550" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2HjaHestasveiniFromLogberg" actor="a_Hjalti" wait="false" x="500" y="550" />
<SetDestinationQuantum name="q_WalkHjalti2HjaHestasveiniFromLogbergNew" actor="a_Hjalti" wait="true" x="-110" y="580" />
<MoveActorQuantum name="q_MoveGissurHviti2HjaHestasveiniFromLogberg" actor="a_GissurHviti" terrain="t_HjaHestasveinil">
	<Location x="900" y="550" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveGissurHviti2HjaHestasveiniFromLogberg5" actor="a_GissurHviti" terrain="t_HjaHestasveinil">
	<Location x="1060" y="550" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissurHviti2HjaHestasveiniFromLogberg" actor="a_GissurHviti" wait="true" x="250" y="510" speed="93"/>
<SetDestinationQuantum name="q_WalkGissurHviti2HjaHestasveiniFromLogberg2" actor="a_GissurHviti" wait="false" x="250" y="510" speed="93"/>
<MoveActorQuantum name="q_MoveToggi2HjaHestasveiniFromLogberg" actor="a_Toggi" terrain="t_HjaHestasveinil">
	<Location x="890" y="550" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkToggi2HjaHestasveiniFromLogberg" actor="a_Toggi" wait="true" x="125" y="550" speed="85"/>
<SetDestinationQuantum name="q_WalkToggiAwayFromHjaHestasveini" actor="a_Toggi" wait="true" x="-150" y="583" speed="90"/>

<MoveActorQuantum name="q_MoveHjalti2HeidnarBudirFromHjaVolvu" actor="a_Hjalti"	terrain="t_HeidnarBudirl">
	<Location x="30" y="390" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2HeidnarBudirFromHjaVolvu1" actor="a_Hjalti" wait="true" x="185" y="440" />
<SetDestinationQuantum name="q_WalkHjalti2HeidnarBudirFromHjaVolvu2" actor="a_Hjalti" wait="true" x="220" y="540" />
<SetDestinationQuantum name="q_WalkHjalti2HeidnarBudirFromHjaVolvu3" actor="a_Hjalti" wait="true" x="550" y="584" />

<MoveActorQuantum name="q_MoveHjalti2HeidnarBudirFromHjaHestasveini" actor="a_Hjalti" terrain="t_HeidnarBudirl">
	<Location x="990" y="584" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2HeidnarBudirFromHjaHestasveini" actor="a_Hjalti" wait="false" x="550" y="560" />
<SetDestinationQuantum name="q_WalkHjalti2HeidnarBudirFromHjaHestasveiniNew" actor="a_Hjalti" wait="true" x="-130" y="560" />
<MoveActorQuantum name="q_MoveGissurHviti2HeidnarBudirFromHjaHestasveini" actor="a_GissurHviti"	terrain="t_HeidnarBudirl">
	<Location x="850" y="584" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissurHviti2HeidnarBudirFromHjaHestasveini" actor="a_GissurHviti" wait="true" x="250" y="575" speed="93"/>
<SetDestinationQuantum name="q_WalkGissurHviti2HeidnarBudirFromHjaHestasveini3" actor="a_GissurHviti" wait="false" x="250" y="575" speed="93"/>
<MoveActorQuantum name="q_MoveToggi2HeidnarBudirFromHjaHestasveini" actor="a_Toggi"	terrain="t_HeidnarBudirl">
	<Location x="1140" y="520" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkToggi2HeidnarBudirFromHjaHestasveini" actor="a_Toggi" wait="true" x="410" y="520" speed="85"/>

<SetDestinationQuantum name="q_WalkHjaltiBehindHouse1" actor="a_Hjalti" wait="true" x="185" y="440" />
<SetDestinationQuantum name="q_WalkHjaltiBehindHouse2" actor="a_Hjalti" wait="true" x="-100" y="390" />
<MoveActorQuantum name="q_MoveHjalti2HjaVolvu" actor="a_Hjalti"	terrain="t_HjaVolvul">
	<Location x="900" y="570" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2HjaVolvu" actor="a_Hjalti" wait="true" x="600" y="570" />

<MoveActorQuantum name="q_MoveHjalti2KristnarBudir"	actor="a_Hjalti" terrain="t_KristnarBudirl">
	<Location x="-120" y="575" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHjalti2KristnarBudir" actor="a_Hjalti" wait="true" x="480" y="555" />
<SetDestinationQuantum name="q_WalkHjalti2KristnarBudirNew" actor="a_Hjalti" wait="true" x="900" y="555" />
<MoveActorQuantum name="q_MoveGissurHviti2KristnarBudir" actor="a_GissurHviti" terrain="t_KristnarBudirl">
	<Location x="-250" y="555" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkGissurHviti2KristnarBudir" actor="a_GissurHviti" wait="false" x="200" y="555" speed="85"/>
<MoveActorQuantum name="q_MoveHallur2KristnarBudirF" actor="a_Hallur" terrain="t_KristnarBudirl">
	<Location x="-370" y="540" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHallur2KristnarBudir" actor="a_Hallur" wait="false" x="380" y="530" speed="80"/>

<MoveActorQuantum name="q_MoveHjalti2Runir"	actor="a_Hjalti" terrain="t_Runirl">
	<Location x="400" y="-200" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHjalti2ErnaRunir"	actor="a_Hjalti" terrain="t_ErnaRunirl">
	<Location x="400" y="-200" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHjalti2Letur"	actor="a_Hjalti" terrain="t_Leturl">
	<Location x="400" y="-200" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHjalti2KristnarBudirFromRunir" actor="a_Hjalti" terrain="t_KristnarBudirl">
	<Location x="520" y="560" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHjalti2HjaVolvuFromRunir" actor="a_Hjalti" terrain="t_HjaVolvul">
	<Location x="550" y="570" z="1"/> </MoveActorQuantum>

<MoveActorQuantum name="q_MoveEldmadur2HeidnarBudir" actor="a_Eldmadur">
	<Location x="350" y="250" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSnorri2KristnarBudir"	actor="a_Snorri">
	<Location x="400" y="450" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveVikingur2HeidnarBudir" actor="a_Vikingur">
	<Location x="450" y="280" z="1"/> </MoveActorQuantum>

<MoveTerrainQuantum	name="q_MoveConvGissurHvitiLogberg"	terrain="conv_GissurHviti" scene="s_Logberg"/>
<MoveTerrainQuantum	name="q_MoveConvGissurHvitiHjaHestasveini" terrain="conv_GissurHviti" scene="s_HjaHestasveini"/>
<MoveTerrainQuantum	name="q_MoveConvGissurHvitiHeidnarBudir" terrain="conv_GissurHviti"	scene="s_HeidnarBudir"/>
<MoveTerrainQuantum	name="q_MoveConvGissurHvitiKristnarBudir" terrain="conv_GissurHviti" scene="s_KristnarBudir"/>

<MoveTerrainQuantum	name="q_MoveConvHallurKristnarBudir" terrain="conv_Hallur" scene="s_KristnarBudir"/>
<MoveTerrainQuantum	name="q_MoveConvHallurLogberg" terrain="conv_Hallur" scene="s_Logberg"/>

<MoveTerrainQuantum	name="q_MoveConvToggiHeidnarBudir" terrain="conv_Toggi" scene="s_HeidnarBudir"/>
<MoveTerrainQuantum	name="q_MoveConvToggiLogberg" terrain="conv_Toggi" scene="s_Logberg"/>
<MoveTerrainQuantum	name="q_MoveConvToggiHjaHestasveini" terrain="conv_Toggi" scene="s_HjaHestasveini"/>

<UpdateQuantum name="q_UpdateInventory"	terrain="t_Inventory" show="true"/>

<SetDestinationQuantum name="q_WalkHjalti2Hestasveinn1" actor="a_Hjalti" wait="true" x="500" y="583" />
<SetDestinationQuantum name="q_WalkHjalti2Hestasveinn2" actor="a_Hjalti" wait="true" x="500" y="550" />

<SetDestinationQuantum name="q_WalkHjalti2Volva" actor="a_Hjalti" wait="true" x="516" y="558" />

<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiKristnarBudir1" actor="a_Hjalti" wait="true" x="315" y="583" />
<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiKristnarBudir2" actor="a_Hjalti" wait="true" x="315" y="565" />
<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiHjaHestasveini1" actor="a_Hjalti" wait="true" x="360" y="583" />
<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiHjaHestasveini2" actor="a_Hjalti" wait="true" x="360" y="555" />
<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiLogberg1" actor="a_Hjalti" wait="true" x="460" y="583" />
<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiLogberg2" actor="a_Hjalti" wait="true" x="460" y="560" />
<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiHeidnarBudir1" actor="a_Hjalti" wait="true" x="355" y="583" />
<SetDestinationQuantum name="q_WalkHjalti2GissurHvitiHeidnarBudir2" actor="a_Hjalti" wait="true" x="355" y="565" />

<SetDestinationQuantum name="q_WalkHjalti2ToggiHjaHestasveini1" actor="a_Hjalti" wait="true" x="195" y="584" />
<SetDestinationQuantum name="q_WalkHjalti2ToggiHjaHestasveini2" actor="a_Hjalti" wait="true" x="195" y="565" />
<SetDestinationQuantum name="q_WalkHjalti2ToggiLogberg1" actor="a_Hjalti" wait="true" x="190" y="573" />
<SetDestinationQuantum name="q_WalkHjalti2ToggiLogberg2" actor="a_Hjalti" wait="true" x="190" y="530" />
<SetDestinationQuantum name="q_WalkHjalti2ToggiHeidnarBudir1" actor="a_Hjalti" wait="true" x="490" y="583" />
<SetDestinationQuantum name="q_WalkHjalti2ToggiHeidnarBudir2" actor="a_Hjalti" wait="true" x="490" y="540" />

<SetDestinationQuantum name="q_WalkHjalti2HallurKristnarBudir1" actor="a_Hjalti" wait="true" x="460" y="583" />
<SetDestinationQuantum name="q_WalkHjalti2HallurKristnarBudir2" actor="a_Hjalti" wait="true" x="460" y="545" />
<SetDestinationQuantum name="q_WalkHjalti2HallurLogberg1" actor="a_Hjalti" wait="true" x="710" y="573" />
<SetDestinationQuantum name="q_WalkHjalti2HallurLogberg2" actor="a_Hjalti" wait="true" x="710" y="520" />

<Sequence name="sr_Look1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Look1"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Look2"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Look3"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Look4"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Look5"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Look6"/>
	<Quantum name="q_StopHjalti"/>
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
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talk1"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talk2"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talk3"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talk4"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talk5"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talk6"/>
	<Quantum name="q_StopHjalti"/>
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
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use1"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use2"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use3"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use4"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use5"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use6"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use7">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use7"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use8">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use8"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use9">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Use9"/>
	<Quantum name="q_StopHjalti"/>
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
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take1"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take2"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take3"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take4"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take5"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take6"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take7">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take7"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take8">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take8"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take9">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take9"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take10">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take10"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take11">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take11"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take12">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take12"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take13">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Take13"/>
	<Quantum name="q_StopHjalti"/>
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

<SpeechActorMouth name="m_Hnegg" file="\kristniA\Media\sfx\hestar.wav" acc="a_Hallur_acc">
	<Sentence text=" " time="0"/> </SpeechActorMouth>
<JMFActorMouth name="m_Deilur" file="\kristniA\Media\sfx\deilur.wav" repeat="true"/>
<JMFActorMouth name="m_Suda" file="\kristniA\Media\sfx\suda.wav" repeat="true"/>
<JMFActorMouth name="m_Hverfur" file="\sidaskiA\Media\sfx\hverfur.wav" />
<StaticActor name="a_SFX" x="0" y="0" z="0" state="stop">
	<State name="hnegg" mouth="m_Hnegg"/>
	<State name="deilur" mouth="m_Deilur"/>
	<State name="suda" mouth="m_Suda"/>
	<State name="hverfur" mouth="m_Hverfur"/>
</StaticActor>
<StateQuantum name="q_StopSFX" actor="a_SFX" state="stop" wait="false"/>
<StateQuantum name="q_Hnegg" actor="a_SFX" state="hnegg" wait="true"/>
<StateQuantum name="q_Suda" actor="a_SFX" state="suda" wait="false"/>
<StateQuantum name="q_Hverfur" actor="a_SFX" state="hverfur" wait="false"/>
<StateQuantum name="q_Quarell" actor="a_SFX" state="deilur" wait="false"/>
<FadeQuantum name="q_FadeKlidurOut" mouth="m_Deilur" goal="0" speed="50"/>


<!-- Conversations -->

<!-- Conversation with GissurHviti -->

<Text name="HvarErumVid" text="Hvar erum við staddir?" terrain="conv_GissurHviti" color="white"/>
	<ActorMoused actor="HvarErumVid" listener="sc"/>
<Text name="HvadErUmAdVera" text="Hvað er um að vera?" terrain="conv_GissurHviti" color="white"/>
	<ActorMoused actor="HvadErUmAdVera" listener="sc"/>
<Text name="HvadaArEr" text="Hvaða ár er eiginlega núna?" terrain="conv_GissurHviti" color="white"/>
	<ActorMoused actor="HvadaArEr" listener="sc"/>
<Text name="Bless" text="Bless!" terrain="conv_GissurHviti" color="white"/>
	<ActorMoused actor="Bless" listener="sc"/>
<Text name="AfHverjuVillOlafur" text="Af hverju vill Ólafur Tryggvason láta kristna Íslendinga?"  color="white"/>
	<ActorMoused actor="AfHverjuVillOlafur" listener="sc"/>
<Text name="AfHverjuErEkkiIFinu" text="Af hverju er ekki í fínu lagi að sumir Íslendingar trúi á heiðnu goðin?"  color="white"/>
	<ActorMoused actor="AfHverjuErEkkiIFinu" listener="sc"/>
<Text name="TruirThuAKrist" text="Trúir þú á Krist?" color="white" />
	<ActorMoused actor="TruirThuAKrist" listener="sc"/>
<Text name="HvernigEigumVid" text="Hvernig eigum við að fara að því að kristna Íslendinga?" color="white" />
	<ActorMoused actor="HvernigEigumVid" listener="sc"/>
<Text name="HvadErAlthingi" text="Hvað er Alþingi?" color="white" />
	<ActorMoused actor="HvadErAlthingi" listener="sc"/>
<Text name="GeturThuNokkudUtskyrt" text="Getur þú nokkuð útskýrt fyrir mér um hvað deilurnar snúast?" color="white" />
	<ActorMoused actor="GeturThuNokkudUtskyrt" listener="sc"/>
<Text name="HvadErKlukkan" text="Hvað er klukkan?" color="white"/>
	<ActorMoused actor="HvadErKlukkan" listener="sc"/>


<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_HvadErUmAdVera" actor="HvadErUmAdVera"/>
<MoveActorQuantum name="qh_HvarErumVid" actor="HvarErumVid"/>
<MoveActorQuantum name="qh_HvadaArEr" actor="HvadaArEr"/>
<MoveActorQuantum name="qh_Bless" actor="Bless"/>
<MoveActorQuantum name="qh_AfHverjuVillOlafur" actor="AfHverjuVillOlafur"/>
<MoveActorQuantum name="qh_AfHverjuErEkkiIFinu" actor="AfHverjuErEkkiIFinu"/>
<MoveActorQuantum name="qh_TruirThuAKrist" actor="TruirThuAKrist"/>
<MoveActorQuantum name="qh_HvernigEigumVid" actor="HvernigEigumVid"/>
<MoveActorQuantum name="qh_HvadErAlthingi" actor="HvadErAlthingi"/>
<MoveActorQuantum name="qh_GeturThuNokkudUtskyrt" actor="GeturThuNokkudUtskyrt"/>
<MoveActorQuantum name="qh_HvadErKlukkan" actor="HvadErKlukkan"/>


<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_HvadErUmAdVera" actor="HvadErUmAdVera" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_HvarErumVid" actor="HvarErumVid" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_HvadaArEr" actor="HvadaArEr" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_Bless" actor="Bless" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_AfHverjuVillOlafur" actor="AfHverjuVillOlafur" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_AfHverjuErEkkiIFinu" actor="AfHverjuErEkkiIFinu" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_TruirThuAKrist" actor="TruirThuAKrist" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_HvernigEigumVid" actor="HvernigEigumVid" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_HvadErAlthingi" actor="HvadErAlthingi" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_GeturThuNokkudUtskyrt" actor="GeturThuNokkudUtskyrt" terrain="conv_GissurHviti"/>
<MoveActorQuantum name="qs_HvadErKlukkan" actor="HvadErKlukkan" terrain="conv_GissurHviti"/>


<UpdateQuantum name="qh_TextGissurHviti" terrain="conv_GissurHviti" show="false"/>
<UpdateQuantum name="qs_TextGissurHviti" terrain="conv_GissurHviti" show="true"/>

<SetFlagQuantum name="q_BeginConvGissurHviti1" flag="f_BeginConvGissurHviti" value="1"/>


<Sequence name="s_HvarErumVid">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_HvarErumVid"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ErTherFaridAdForlast"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_NuJa"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ErtThuBuinn"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_NeiNeiAllsEkki"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_OlafurNoregsKonungur"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qs_AfHverjuVillOlafur"/>
	<Quantum name="qs_AfHverjuErEkkiIFinu"/>
	<Quantum name="qh_HvarErumVid"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvarErumVid" seq="s_HvarErumVid"/>

<Sequence name="s_HvadErUmAdVera">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_HvadErUmAdVera"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_VeistuThadEkki"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_BidduBiddu"/>
	<Quantum name="q_HjaltiWhy"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_NuVidHetum"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qs_TruirThuAKrist"/>
	<Quantum name="qs_HvernigEigumVid"/>
	<Quantum name="qs_HvadErAlthingi"/>
	<Quantum name="qh_HvadErUmAdVera"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadErUmAdVera" seq="s_HvadErUmAdVera"/>

<Sequence name="s_HvadaArEr">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_HvadaArEr"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThadEruLidin"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qh_HvadaArEr"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadaArEr" seq="s_HvadaArEr"/>

<Sequence name="s_GeturThuNokkudUtskyrt">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_GeturThuNokkudUtskyrt"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_DeilurnarSnuast"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_Ja"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_LoginEins"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qh_GeturThuNokkudUtskyrt"/>
	<Quantum name="q_GeturThuNokkudUtskyrt0"/>
	<Quantum name="qs_HvadErKlukkan"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="GeturThuNokkudUtskyrt" seq="s_GeturThuNokkudUtskyrt"/>

<Sequence name="s_HvadErKlukkan">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_HvadErKlukkan"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HaHvadErKlukkanHvad"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_HjaltiYppir"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_HvadErKlukkan"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadErKlukkan" seq="s_HvadErKlukkan"/>


<Sequence name="s_AfHverjuVillOlafur">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_AfHverjuVillOlafur"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_OlafurTryggvasonVar"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_AudvitadThadVita"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_TilDaemis"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_JaErThad"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_OlafurVillNuKristna"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qh_AfHverjuVillOlafur"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="AfHverjuVillOlafur" seq="s_AfHverjuVillOlafur"/>

<Sequence name="s_AfHverjuErEkkiIFinu">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_AfHverjuErEkkiIFinu"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_VegnaThessAdThaVaeri"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_JaThuMeinarThaaad"/>
	<Quantum name="q_HjaltiYppir"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_LogOgReglur"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qh_AfHverjuErEkkiIFinu"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="AfHverjuErEkkiIFinu" seq="s_AfHverjuErEkkiIFinu"/>

<Sequence name="s_TruirThuAKrist">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_TruirThuAKrist"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_AdSjalfsogduErt"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_HaEg"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThuHlyturAdMuna"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_AudvitadManEgEftirThvi"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_EgVonaAdThuSjair"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qh_TruirThuAKrist"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="TruirThuAKrist" seq="s_TruirThuAKrist"/>

<Sequence name="s_HvernigEigumVid">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_HvernigEigumVid"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HerAAlthingiEru"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qh_HvernigEigumVid"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvernigEigumVid" seq="s_HvernigEigumVid"/>

<Sequence name="s_HvadErAlthingi">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_HvadErAlthingi"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_AlthingiErNokkurs"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="qh_HvadErAlthingi"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadErAlthingi" seq="s_HvadErAlthingi"/>

<Sequence name="s_Bless">
	<Quantum name="qh_TextGissurHviti"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="Bless" seq="s_Bless"/>

<Sequence name="s_AddGeturThuNokkudUtskyrt">
	<Quantum name="qs_GeturThuNokkudUtskyrt"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceGeturThuNokkudUtskyrt" flag="f_SentenceGeturThuNokkudUtskyrt" wait="true">
	<Trigger value="1" seq="s_AddGeturThuNokkudUtskyrt"/>
</CheckConditionQuantum>

<Sequence name="s_HverErtThu">
    <Quantum name="q_SaellVifillHeitiEg"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_VifillErtThu"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_HverErtThu"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MjogFyndid"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_HeHeHe"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_EgHeitiGissurHviti"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_BeginConvGissurHviti1"/>
	<Quantum name="q_SentenceGeturThuNokkudUtskyrt"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>

<Sequence name="s_Gissur">
	<Quantum name="q_Gissur2"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_JaHjalti"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_SentenceGeturThuNokkudUtskyrt"/>
	<Quantum name="qs_TextGissurHviti"/>
</Sequence>

<CheckConditionQuantum name="q_BeginConvGissurHviti" flag="f_BeginConvGissurHviti">
	<Trigger value="0" seq="s_HverErtThu"/>
	<Trigger value="1" seq="s_Gissur"/>
</CheckConditionQuantum>

<Sequence name="s_WalkHjalti2GissurHvitiLogberg">
	<Quantum name="q_WalkHjalti2GissurHvitiLogberg1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2GissurHvitiLogberg2"/>
</Sequence>

<Sequence name="s_WalkHjalti2GissurHvitiHeidnarBudir">
	<Quantum name="q_WalkHjalti2GissurHvitiHeidnarBudir1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2GissurHvitiHeidnarBudir2"/>
</Sequence>

<Sequence name="s_WalkHjalti2GissurHvitiHjaHestasveini">
	<Quantum name="q_WalkHjalti2GissurHvitiHjaHestasveini1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2GissurHvitiHjaHestasveini2"/>
</Sequence>

<Sequence name="s_WalkHjalti2GissurHvitiKristnarBudir">
	<Quantum name="q_WalkHjalti2GissurHvitiKristnarBudir1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2GissurHvitiKristnarBudir2"/>
</Sequence>

<CheckConditionQuantum name="q_CheckGissurHviti92" flag="f_CS" wait="true">
	<Trigger value="1" seq="s_WalkHjalti2GissurHvitiLogberg"/>
	<Trigger value="2" seq="s_WalkHjalti2GissurHvitiHeidnarBudir"/>
	<Trigger value="7" seq="s_WalkHjalti2GissurHvitiHjaHestasveini"/>
	<Trigger value="3" seq="s_WalkHjalti2GissurHvitiKristnarBudir"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvGissurHviti">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckGissurHviti92"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_BeginConvGissurHviti"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_GissurHviti" seq="s_BeginConvGissurHviti"/>



<!-- Conversation with HestaSveinn -->

<Text name="ErFallegiFeldurinn" text="Er fallegi feldurinn þinn til sölu?" terrain="conv_HestaSveinn" color="white"/>
	<ActorMoused actor="ErFallegiFeldurinn" listener="sc"/>
<Text name="HvadErtThuAdGera" text="Hvað ert þú að gera hér?" terrain="conv_HestaSveinn" color="white"/>
	<ActorMoused actor="HvadErtThuAdGera" listener="sc"/>
<Text name="MaEgEigaFeldinn" text="Má ég eiga feldinn þinn?" terrain="conv_HestaSveinn" color="white"/>
	<ActorMoused actor="MaEgEigaFeldinn" listener="sc"/>
<Text name="BlessSveinn" text="Bless!" terrain="conv_HestaSveinn" color="white"/>
	<ActorMoused actor="BlessSveinn" listener="sc"/>
<Text name="MittVidfraega" text="Mitt víðfræga, fallega og indæla bros!" color="white"/>
	<ActorMoused actor="MittVidfraega" listener="sc"/>
<Text name="ThettaGull" text="Þetta gull sem mér áskotnaðist!" color="white"/>
	<ActorMoused actor="ThettaGull" listener="sc"/>
<Text name="ThennanGullfallegaThorshamar" text="Þennan gullfallega Þórshamar!" color="white"/>
	<ActorMoused actor="ThennanGullfallegaThorshamar" listener="sc"/>
<Text name="FleiraHef" text="Þennan fátæklega kross!" color="white"/>
	<ActorMoused actor="FleiraHef" listener="sc"/>
<Text name="Ekkert" text="Ekkert!" color="white"/>
	<ActorMoused actor="Ekkert" listener="sc"/>
<Text name="HvarEru" text="Hvar eru þessi hestar sem þú þykist vera að gæta?" color="white"/>
	<ActorMoused actor="HvarEru" listener="sc"/>


<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_ErFallegiFeldurinn" actor="ErFallegiFeldurinn"/>
<MoveActorQuantum name="qh_HvadErtThuAdGera" actor="HvadErtThuAdGera"/>
<MoveActorQuantum name="qh_MaEgEigaFeldinn" actor="MaEgEigaFeldinn"/>
<MoveActorQuantum name="qh_BlessSveinn" actor="BlessSveinn"/>
<MoveActorQuantum name="qh_ThettaGull" actor="ThettaGull"/>
<MoveActorQuantum name="qh_ThennanGullfallegaThorshamar" actor="ThennanGullfallegaThorshamar"/>
<MoveActorQuantum name="qh_MittVidfraega" actor="MittVidfraega"/>
<MoveActorQuantum name="qh_Ekkert" actor="Ekkert"/>
<MoveActorQuantum name="qh_FleiraHef" actor="FleiraHef"/>
<MoveActorQuantum name="qh_HvarEru" actor="HvarEru"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_ErFallegiFeldurinn" actor="ErFallegiFeldurinn" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_HvadErtThuAdGera" actor="HvadErtThuAdGera" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_MaEgEigaFeldinn" actor="MaEgEigaFeldinn" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_BlessSveinn" actor="BlessSveinn" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_ThettaGull" actor="ThettaGull" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_ThennanGullfallegaThorshamar" actor="ThennanGullfallegaThorshamar" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_MittVidfraega" actor="MittVidfraega" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_Ekkert" actor="Ekkert" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_FleiraHef" actor="FleiraHef" terrain="conv_HestaSveinn"/>
<MoveActorQuantum name="qs_HvarEru" actor="HvarEru" terrain="conv_HestaSveinn"/>

<UpdateQuantum name="qh_TextHestaSveinn" terrain="conv_HestaSveinn" show="false"/>
<UpdateQuantum name="qs_TextHestaSveinn" terrain="conv_HestaSveinn" show="true"/>

<SetFlagQuantum name="q_BeginConvHestaSveinn1" flag="f_BeginConvHestaSveinn" value="1"/>
<SetFlagQuantum name="q_BeginConvHestaSveinn2" flag="f_BeginConvHestaSveinn" value="2"/>
<SetFlagQuantum name="q_MaEgEigaFeldinn1" flag="f_SentenceMaEgEigaFeldinn" value="1"/>
<SetFlagQuantum name="q_HvadErtThuAdGera1" flag="f_SentenceHvadErtThuAdGera" value="1"/>
<SetFlagQuantum name="q_MittVidfraega1" flag="f_SentenceMittVidfraega" value="1"/>
<SetFlagQuantum name="q_ThettaGull1" flag="f_SentenceThettaGull" value="1"/>
<SetFlagQuantum name="q_ThettaGull2" flag="f_SentenceThettaGull" value="2"/>
<SetFlagQuantum name="q_ThennanGullfallegaThorshamar1" flag="f_SentenceThennanGullfallegaThorshamar" value="1"/>
<SetFlagQuantum name="q_ThennanGullfallegaThorshamar2" flag="f_SentenceThennanGullfallegaThorshamar" value="2"/>
<SetFlagQuantum name="q_FleiraHef2" flag="f_SentenceFleiraHef" value="2"/>

<Sequence name="s_AddMittVidfraega">
	<Quantum name="qs_MittVidfraega"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceMittVidfraega" flag="f_SentenceMittVidfraega" wait="true">
	<Trigger value="0" seq="s_AddMittVidfraega"/>
</CheckConditionQuantum>

<Sequence name="s_AddThettaGull">
	<Quantum name="qs_ThettaGull"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceThettaGull" flag="f_SentenceThettaGull" wait="true">
	<Trigger value="2" seq="s_AddThettaGull"/>
</CheckConditionQuantum>

<Sequence name="s_AddThennanGullfallegaThorshamar">
	<Quantum name="qs_ThennanGullfallegaThorshamar"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceThennanGullfallegaThorshamar" flag="f_SentenceThennanGullfallegaThorshamar" wait="true">
	<Trigger value="2" seq="s_AddThennanGullfallegaThorshamar"/>
</CheckConditionQuantum>

<Sequence name="s_AddFleiraHef">
	<Quantum name="qs_FleiraHef"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceFleiraHef" flag="f_SentenceFleiraHef" wait="true">
	<Trigger value="2" seq="s_AddFleiraHef"/>
</CheckConditionQuantum>

<Sequence name="s_AddMaEgEigaFeldinn">
	<Quantum name="qs_MaEgEigaFeldinn"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceMaEgEigaFeldinn" flag="f_SentenceMaEgEigaFeldinn" wait="true">
	<Trigger value="0" seq="s_AddMaEgEigaFeldinn"/>
</CheckConditionQuantum>

<Sequence name="s_AddHvarEru">
	<Quantum name="qs_HvarEru"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceHvarEru" flag="f_SentenceHvadErtThuAdGera" wait="true">
	<Trigger value="1" seq="s_AddHvarEru"/>
</CheckConditionQuantum>

<Sequence name="s_AddHvadErtThuAdGera">
	<Quantum name="qs_HvadErtThuAdGera"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceHvadErtThuAdGera" flag="f_SentenceHvadErtThuAdGera" wait="true">
	<Trigger value="0" seq="s_AddHvadErtThuAdGera"/>
</CheckConditionQuantum>

<Sequence name="s_ErFallegiFeldurinn">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_ErFallegiFeldurinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HvadHefurThuAdBjoda"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_ErFallegiFeldurinn"/>
	<Quantum name="qh_HvadErtThuAdGera"/>
	<Quantum name="qh_MaEgEigaFeldinn"/>
	<Quantum name="qh_HvarEru"/>
	<Quantum name="q_SentenceMittVidfraega"/>
	<Quantum name="q_SentenceThettaGull"/>
	<Quantum name="q_SentenceThennanGullfallegaThorshamar"/>
	<Quantum name="q_SentenceFleiraHef"/>
	<Quantum name="qs_Ekkert"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="ErFallegiFeldurinn" seq="s_ErFallegiFeldurinn"/>

<Sequence name="s_Ekkert">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_Ekkert"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_OgThaFaerdu"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_Ekkert"/>
	<Quantum name="qh_MittVidfraega"/>
	<Quantum name="qh_ThettaGull"/>
	<Quantum name="qh_ThennanGullfallegaThorshamar"/>
	<Quantum name="qh_FleiraHef"/>
	<Quantum name="q_SentenceHvadErtThuAdGera"/>
	<Quantum name="q_SentenceHvarEru"/>
	<Quantum name="q_SentenceMaEgEigaFeldinn"/>
	<Quantum name="qs_ErFallegiFeldurinn"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="Ekkert" seq="s_Ekkert"/>

<Sequence name="s_HvadErtThuAdGera">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_HvadErtThuAdGera"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_NuEgErAdGaeta"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_HvadErtThuAdGera"/>
	<Quantum name="q_HvadErtThuAdGera1"/>
	<Quantum name="qs_HvarEru"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadErtThuAdGera" seq="s_HvadErtThuAdGera"/>

<Sequence name="s_HvarEru">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_HvarEruThessirHestar"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ErtuBlindur"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="q_Hnegg"/>
	<Quantum name="q_StopSFX"/>
	<Quantum name="q_HjaltiWhy"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_HvarEru"/>
	<Quantum name="q_HvadErtThuAdGera2"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvarEru" seq="s_HvarEru"/>

<Sequence name="s_MaEgEigaFeldinn">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_MaEgEigaFeldinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_JaAudvitadSvo"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_MaEgEigaFeldinn"/>
	<Quantum name="q_MaEgEigaFeldinn1"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="MaEgEigaFeldinn" seq="s_MaEgEigaFeldinn"/>

<Sequence name="s_MittVidfraega">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_MittVidfraega"/>
	<Quantum name="q_HjaltiYppir"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_NoHestaSveinn"/>
	<Quantum name="q_KaupaSkalEi"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_MittVidfraega"/>
	<Quantum name="q_MittVidfraega1"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="MittVidfraega" seq="s_MittVidfraega"/>

<Sequence name="s_ThennanGullfallegaThorshamar">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_ThennanGullfallegaThorshamar"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_NoHestaSveinn"/>
	<Quantum name="q_ThettaMen"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_ThennanGullfallegaThorshamar"/>
	<Quantum name="q_ThennanGullfallegaThorshamar1"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="ThennanGullfallegaThorshamar" seq="s_ThennanGullfallegaThorshamar"/>

<Sequence name="s_FleiraHef">
	<Quantum name="qp_Hjalti1"/>
	<Quantum name="qp_Hjalti2"/>
	<Quantum name="qp_Hjalti3"/>
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_FleiraHef"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HjaltiSynirKross"/>
	<Quantum name="q_HissaHestaSveinn"/>
	<Quantum name="q_HjaltiKrossDingl"/>
	<Quantum name="q_Uhhh"/>
	<Quantum name="q_HjaltiGefurKross"/>
	<Quantum name="q_StopKrossHestaSveinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_FleiraHef"/>
	<Quantum name="qh_ThettaGull"/>
	<Quantum name="qh_Ekkert"/>
	<Quantum name="qh_ThennanGullfallegaThorshamar"/>
	<Quantum name="qh_MittVidfraega"/>
	<Quantum name="qh_BlessSveinn"/>
	<Quantum name="q_MoveFeldur2Inventory"/>
	<Quantum name="q_MoveKross"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_BeginConvHestaSveinn2"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qu_Hjalti1"/>
	<Quantum name="qu_Hjalti2"/>
	<Quantum name="qu_Hjalti3"/>
</Sequence>
<Reaction reactor="action_talk" actor="FleiraHef" seq="s_FleiraHef"/>

<Sequence name="s_ThettaGull">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="q_ThettaGull"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_NoHestaSveinn"/>
	<Quantum name="q_NeiTakkOft"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_ThettaGull"/>
	<Quantum name="q_ThettaGull1"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="ThettaGull" seq="s_ThettaGull"/>

<Sequence name="s_BlessSveinn">
	<Quantum name="qh_TextHestaSveinn"/>
	<Quantum name="qh_MittVidfraega"/>
	<Quantum name="qh_ThettaGull"/>
	<Quantum name="qh_ThennanGullfallegaThorshamar"/>
	<Quantum name="qh_FleiraHef"/>
	<Quantum name="qh_Ekkert"/>
	<Quantum name="qs_ErFallegiFeldurinn"/>
	<Quantum name="q_SentenceMaEgEigaFeldinn"/>
	<Quantum name="q_SentenceHvadErtThuAdGera"/>
	<Quantum name="q_SentenceHvarEru"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="BlessSveinn" seq="s_BlessSveinn"/>

<Sequence name="s_SaellHver">
	<Quantum name="q_SaellHver"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HeillOgSaellHjaltiEg"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="q_BeginConvHestaSveinn1"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>

<Sequence name="s_Saell">
	<Quantum name="q_Gissur"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_SaellHjalti"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qs_TextHestaSveinn"/>
</Sequence>

<Sequence name="s_TalkFinished">
    <Quantum name="q_EgVilEkkiTruflaHann"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Moving"/>
</Sequence>

<CheckConditionQuantum name="q_BeginConvHestaSveinn" flag="f_BeginConvHestaSveinn" >
	<Trigger value="0" seq="s_SaellHver"/>
	<Trigger value="1" seq="s_Saell"/>
	<Trigger value="2" seq="s_TalkFinished"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvHestaSveinn">
    <Quantum name="q_Conversating"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2Hestasveinn1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2Hestasveinn2"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_BeginConvHestaSveinn"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_HestaSveinn" seq="s_BeginConvHestaSveinn"/>



<!-- Conversation with Hallur -->

<Text name="JaejaHallur" text="Jæja Hallur, hvernig hangir hann?" terrain="conv_Hallur" color="white"/>
	<ActorMoused actor="JaejaHallur" listener="sc"/>
<Text name="AfHverjuVilt" text="Af hverju vilt þú ekki segja upp lög fyrir kristna menn?" terrain="conv_Hallur" color="white"/>
	<ActorMoused actor="AfHverjuVilt" listener="sc"/>
<Text name="EgHefSvolitidMerkilegt" text="Ég hef svolítið merkilegt að sýna þér.  Vilt þú fylgja mér?" terrain="conv_Hallur" color="white"/>
	<ActorMoused actor="EgHefSvolitidMerkilegt" listener="sc"/>
<Text name="Bless5" text="Bless!" terrain="conv_Hallur" color="white"/>
	<ActorMoused actor="Bless5" listener="sc"/>
<Text name="BidduHerEftir" text="Bíddu hér eftir mér.  Ég þarf aðeins að víkja mér frá." color="white" />
	<ActorMoused actor="BidduHerEftir" listener="sc"/>
<Text name="EgErBuinnAdGleymaHvad" text="Ég er búinn að gleyma hvað það var sem ég ætlaði að sýna þér." color="white"/>
	<ActorMoused actor="EgErBuinnAdGleymaHvad" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_AfHverjuVilt" actor="AfHverjuVilt"/>
<MoveActorQuantum name="qh_JaejaHallur" actor="JaejaHallur"/>
<MoveActorQuantum name="qh_EgHefSvolitidMerkilegt" actor="EgHefSvolitidMerkilegt"/>
<MoveActorQuantum name="qh_Bless5" actor="Bless5"/>
<MoveActorQuantum name="qh_BidduHerEftir" actor="BidduHerEftir"/>
<MoveActorQuantum name="qh_EgErBuinnAdGleymaHvad" actor="EgErBuinnAdGleymaHvad"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_AfHverjuVilt" actor="AfHverjuVilt" terrain="conv_Hallur"/>
<MoveActorQuantum name="qs_JaejaHallur" actor="JaejaHallur" terrain="conv_Hallur"/>
<MoveActorQuantum name="qs_EgHefSvolitidMerkilegt" actor="EgHefSvolitidMerkilegt" terrain="conv_Hallur"/>
<MoveActorQuantum name="qs_Bless5" actor="Bless5" terrain="conv_Hallur"/>
<MoveActorQuantum name="qs_BidduHerEftir" actor="BidduHerEftir" terrain="conv_Hallur"/>
<MoveActorQuantum name="qs_EgErBuinnAdGleymaHvad" actor="EgErBuinnAdGleymaHvad" terrain="conv_Hallur"/>

<SetFlagQuantum name="q_AfHverjuVilt1" flag="f_SentenceAfHverjuVilt" value="1"/>
<SetFlagQuantum name="q_JaejaHallur1" flag="f_SentenceJaejaHallur" value="1"/>

<Sequence name="s_AddJaejaHallur">
	<Quantum name="qs_JaejaHallur"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceJaejaHallur" flag="f_SentenceJaejaHallur" wait="false">
	<Trigger value="0" seq="s_AddJaejaHallur"/>
</CheckConditionQuantum>

<Sequence name="s_AddAfHverjuVilt">
	<Quantum name="qs_AfHverjuVilt"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceAfHverjuVilt" flag="f_SentenceAfHverjuVilt" wait="true">
	<Trigger value="0" seq="s_AddAfHverjuVilt"/>
</CheckConditionQuantum>

<UpdateQuantum name="qh_TextHallur" terrain="conv_Hallur" show="false"/>
<UpdateQuantum name="qs_TextHallur" terrain="conv_Hallur" show="true"/>

<Sequence name="s_JaejaHallur">
	<Quantum name="qh_TextHallur"/>
	<Quantum name="q_JaejaHallur"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HannHangirThurr"/>
	<Quantum name="q_StopHallur"/>
	<Quantum name="qh_JaejaHallur"/>
	<Quantum name="q_JaejaHallur1"/>
	<Quantum name="qs_TextHallur"/>
</Sequence>
<Reaction reactor="action_talk" actor="JaejaHallur" seq="s_JaejaHallur"/>

<Sequence name="s_AfHverjuVilt">
	<Quantum name="qh_TextHallur"/>
	<Quantum name="q_AfHverjuVilt"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Vegna"/>
	<Quantum name="q_StopHallur"/>
	<Quantum name="qh_AfHverjuVilt"/>
	<Quantum name="q_AfHverjuVilt1"/>
	<Quantum name="qs_TextHallur"/>
</Sequence>
<Reaction reactor="action_talk" actor="AfHverjuVilt" seq="s_AfHverjuVilt"/>

<Sequence name="s_EgHefSvolitidMerkilegt">
	<Quantum name="qh_TextHallur"/>
	<Quantum name="q_EgHefSvolitidMerkilegt"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_AlltI"/>
	<Quantum name="q_StopHallur"/>
	<Quantum name="qh_EgHefSvolitidMerkilegt"/>
	<Quantum name="qh_AfHverjuVilt"/>
	<Quantum name="qh_JaejaHallur"/>
	<Quantum name="qs_BidduHerEftir"/>
	<Quantum name="qs_EgErBuinnAdGleymaHvad"/>
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_LogbergFromKristnarBudir1"/>
	<Quantum name="q_KristnarBudirFromLogberg2"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="EgHefSvolitidMerkilegt" seq="s_EgHefSvolitidMerkilegt"/>

<Sequence name="s_BidduHerEftir">
	<Quantum name="qh_TextHallur"/>
	<Quantum name="q_BidduHerEftir"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_GottOg"/>
	<Quantum name="q_StopHallur"/>
	<Quantum name="qh_BidduHerEftir"/>
	<Quantum name="qh_EgErBuinnAdGleymaHvad"/>
	<Quantum name="q_SentenceAfHverjuVilt"/>
	<Quantum name="q_SentenceJaejaHallur"/>
	<Quantum name="qs_EgHefSvolitidMerkilegt"/>
	<Quantum name="q_LogbergFromKristnarBudir0"/>
	<Quantum name="q_KristnarBudirFromLogberg0"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="BidduHerEftir" seq="s_BidduHerEftir"/>

<Sequence name="s_WalkHallurAway">
    <Quantum name="q_Freeze"/>
	<Quantum name="qh_HotspotLogberg2KristnarBudir"/>
    <Quantum name="q_WalkHallurAway"/>
    <Quantum name="q_MoveHallur2KristnarBudir"/>
    <Quantum name="q_MoveConvHallurKristnarBudir"/>
    <Quantum name="q_HallurStadsetning0"/>
	<Quantum name="qs_HotspotLogberg2KristnarBudir"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForHallur" flag="f_HallurStadsetning" wait="true">
	<Trigger value="1" seq="s_WalkHallurAway"/>
</CheckConditionQuantum>

<Sequence name="s_HallurTalk1">
	<Quantum name="q_EgErBuinnAdGleymaHvad"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Drostu"/>
	<Quantum name="q_StopHallur"/>
</Sequence>

<Sequence name="s_HallurTalk2">
	<Quantum name="q_EgErBuinnAdGleyma"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Gott"/>
	<Quantum name="q_StopHallur"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForHallur59" flag="f_HallurStadsetning" wait="true">
	<Trigger value="1" seq="s_HallurTalk1"/>
	<Trigger value="0" seq="s_HallurTalk2"/>
</CheckConditionQuantum>

<Sequence name="s_EgErBuinnAdGleymaHvad">
	<Quantum name="qh_TextHallur"/>
	<Quantum name="q_CheckForHallur59"/>
	<Quantum name="qh_EgErBuinnAdGleymaHvad"/>
	<Quantum name="qh_BidduHerEftir"/>
	<Quantum name="q_SentenceAfHverjuVilt"/>
	<Quantum name="q_SentenceJaejaHallur"/>
	<Quantum name="qs_EgHefSvolitidMerkilegt"/>
	<Quantum name="q_KristnarBudirFromLogberg0"/>
	<Quantum name="q_LogbergFromKristnarBudir0"/>
	<Quantum name="q_CheckForHallur"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="EgErBuinnAdGleymaHvad" seq="s_EgErBuinnAdGleymaHvad"/>

<Sequence name="s_Bless5">
	<Quantum name="qh_TextHallur"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="Bless5" seq="s_Bless5"/>

<Sequence name="s_WalkHjalti2HallurLogberg">
	<Quantum name="q_WalkHjalti2HallurLogberg1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2HallurLogberg2"/>
</Sequence>

<Sequence name="s_WalkHjalti2HallurKristnarBudir">
	<Quantum name="q_WalkHjalti2HallurKristnarBudir1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2HallurKristnarBudir2"/>
</Sequence>

<CheckConditionQuantum name="q_CheckHallur92" flag="f_CS" wait="true">
	<Trigger value="1" seq="s_WalkHjalti2HallurLogberg"/>
	<Trigger value="3" seq="s_WalkHjalti2HallurKristnarBudir"/>
</CheckConditionQuantum>

<Sequence name="s_GreetHallur">
	<Quantum name="q_MaEgEigaVidThigOrdHallur"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_AdSjalfsogduHjaltiHvad"/>
	<Quantum name="q_StopHallur"/>
</Sequence>

<CheckConditionQuantum name="q_CheckHallur64" flag="f_LogbergFromKristnarBudir" wait="true">
	<Trigger value="0" seq="s_GreetHallur"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvHallur">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckHallur92"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckHallur64"/>
	<Quantum name="qs_TextHallur"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Hallur" seq="s_BeginConvHallur"/>


<!-- Conversation with Toggi -->

<ThemeFinishedQuantum name="q_ThemeFin"/>

<Text name="HvernigListTherA" text="Hvernig líst þér á að láta skírast til kristinnar trúar?" terrain="conv_Toggi" color="white"/>
	<ActorMoused actor="HvernigListTherA" listener="sc"/>
<Text name="ThuErtLogsogumadur" text="Sérð þú einhver ráð í þessari erfiðu stöðu?" terrain="conv_Toggi" color="white"/>
	<ActorMoused actor="ThuErtLogsogumadur" listener="sc"/>
<Text name="EgLumaAMjog" text="Ég luma á mjög ljúffengu skyri hér steinsnar frá. Vilt þú fylgja mér?" terrain="conv_Toggi" color="white"/>
	<ActorMoused actor="EgLumaAMjog" listener="sc"/>
<Text name="Bless9" text="Bless!" terrain="conv_Toggi" color="white"/>
	<ActorMoused actor="Bless9" listener="sc"/>
<Text name="ViltuVeraSvoVaenn" text="Viltu vera svo vænn að bíða eftir mér hér?" color="white" />
	<ActorMoused actor="ViltuVeraSvoVaenn" listener="sc"/>
<Text name="AeFyrirgefdu" text="Æ, fyrirgefðu Þorgeir, en ég man það núna að ég kláraði allt skyrið í gærkveldi." color="white"/>
	<ActorMoused actor="AeFyrirgefdu" listener="sc"/>
<Text name="HvadaNidurstodu" text="Hvada niðurstöðu komust þið Hallur að?" color="white"/>
	<ActorMoused actor="HvadaNidurstodu" listener="sc"/>
<Text name="HversVegnaStendurThu" text="Hvers vegna stendur þú hér og gerir ekkert annað?" color="white"/>
	<ActorMoused actor="HversVegnaStendurThu" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_ThuErtLogsogumadur" actor="ThuErtLogsogumadur"/>
<MoveActorQuantum name="qh_HvernigListTherA" actor="HvernigListTherA"/>
<MoveActorQuantum name="qh_EgLumaAMjog" actor="EgLumaAMjog"/>
<MoveActorQuantum name="qh_Bless9" actor="Bless9"/>
<MoveActorQuantum name="qh_ViltuVeraSvoVaenn" actor="ViltuVeraSvoVaenn"/>
<MoveActorQuantum name="qh_AeFyrirgefdu" actor="AeFyrirgefdu"/>
<MoveActorQuantum name="qh_HvadaNidurstodu" actor="HvadaNidurstodu"/>
<MoveActorQuantum name="qh_HversVegnaStendurThu" actor="HversVegnaStendurThu"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_ThuErtLogsogumadur" actor="ThuErtLogsogumadur" terrain="conv_Toggi"/>
<MoveActorQuantum name="qs_HvernigListTherA" actor="HvernigListTherA" terrain="conv_Toggi"/>
<MoveActorQuantum name="qs_EgLumaAMjog" actor="EgLumaAMjog" terrain="conv_Toggi"/>
<MoveActorQuantum name="qs_Bless9" actor="Bless9" terrain="conv_Toggi"/>
<MoveActorQuantum name="qs_ViltuVeraSvoVaenn" actor="ViltuVeraSvoVaenn" terrain="conv_Toggi"/>
<MoveActorQuantum name="qs_AeFyrirgefdu" actor="AeFyrirgefdu" terrain="conv_Toggi"/>
<MoveActorQuantum name="qs_HvadaNidurstodu" actor="HvadaNidurstodu" terrain="conv_Toggi"/>
<MoveActorQuantum name="qs_HversVegnaStendurThu" actor="HversVegnaStendurThu" terrain="conv_Toggi"/>

<SetFlagQuantum name="q_ThuErtLogsogumadur1" flag="f_SentenceThuErtLogsogumadur" value="1"/>
<SetFlagQuantum name="q_HvernigListTherA1" flag="f_SentenceHvernigListTherA" value="1"/>

<Sequence name="s_AddHvernigListTherA">
	<Quantum name="qs_HvernigListTherA"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceHvernigListTherA" flag="f_SentenceHvernigListTherA" wait="true">
	<Trigger value="0" seq="s_AddHvernigListTherA"/>
</CheckConditionQuantum>

<Sequence name="s_AddThuErtLogsogumadur">
	<Quantum name="qs_ThuErtLogsogumadur"/>
</Sequence>

<CheckConditionQuantum name="q_SentenceThuErtLogsogumadur" flag="f_SentenceThuErtLogsogumadur" wait="true">
	<Trigger value="0" seq="s_AddThuErtLogsogumadur"/>
</CheckConditionQuantum>

<UpdateQuantum name="qh_TextToggi" terrain="conv_Toggi" show="false"/>
<UpdateQuantum name="qs_TextToggi" terrain="conv_Toggi" show="true"/>

<Sequence name="s_HvernigListTherA">
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_HvernigListTherA"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_EgErEkkiEinnAfTheim"/>
	<Quantum name="q_StopToggi"/>
	<Quantum name="qh_HvernigListTherA"/>
	<Quantum name="q_HvernigListTherA1"/>
	<Quantum name="qs_TextToggi"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvernigListTherA" seq="s_HvernigListTherA"/>

<Sequence name="s_HvadaNidurstodu">
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_HvadaNidurstodu"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HallurASiduBad"/>
	<Quantum name="q_Ja"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_EgTharfNuAdFaTima"/>
	<Quantum name="qh_HvadaNidurstodu"/>
	<Quantum name="qs_TextToggi"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadaNidurstodu" seq="s_HvadaNidurstodu"/>

<Sequence name="s_HversVegnaStendurThu">
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_HversVegnaStendurThu"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_VegnaThessAdMerErSvoKalt"/>
	<Quantum name="q_HjaltiWhy"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qs_TextToggi"/>
</Sequence>
<Reaction reactor="action_talk" actor="HversVegnaStendurThu" seq="s_HversVegnaStendurThu"/>

<Sequence name="s_ThuErtLogsogumadur">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_ThuErtLogsogumadur"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_UrVondu"/>
	<Quantum name="q_StopToggi"/>
	<Quantum name="qh_ThuErtLogsogumadur"/>
	<Quantum name="q_ThuErtLogsogumadur1"/>
	<Quantum name="qs_TextToggi"/>
</Sequence>
<Reaction reactor="action_talk" actor="ThuErtLogsogumadur" seq="s_ThuErtLogsogumadur"/>

<Sequence name="s_EgLumaAMjog">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_EgLumaAMjog"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_SjaldanHefEgSkyrinu"/>
	<Quantum name="q_StopToggi"/>
	<Quantum name="qh_EgLumaAMjog"/>
	<Quantum name="qh_ThuErtLogsogumadur"/>
	<Quantum name="qh_HvernigListTherA"/>
	<Quantum name="qs_ViltuVeraSvoVaenn"/>
	<Quantum name="qs_AeFyrirgefdu"/>
	<Quantum name="q_HjaHestasveiniFromHeidnarBudir1"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini2"/>
	<Quantum name="q_LogbergFromHjaHestasveini2"/>
	<Quantum name="q_HjaHestasveiniFromLogberg1"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="EgLumaAMjog" seq="s_EgLumaAMjog"/>

<Sequence name="s_ViltuVeraSvoVaenn">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_ViltuVeraSvoVaenn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_JaejaThaEnEkki"/>
	<Quantum name="q_StopToggi"/>
	<Quantum name="qh_ViltuVeraSvoVaenn"/>
	<Quantum name="qh_AeFyrirgefdu"/>
	<Quantum name="q_SentenceThuErtLogsogumadur"/>
	<Quantum name="q_SentenceHvernigListTherA"/>
	<Quantum name="qs_EgLumaAMjog"/>
	<Quantum name="q_HjaHestasveiniFromLogberg0"/>
	<Quantum name="q_HjaHestasveiniFromHeidnarBudir0"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini0"/>
	<Quantum name="q_LogbergFromHjaHestasveini1"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="ViltuVeraSvoVaenn" seq="s_ViltuVeraSvoVaenn"/>

<Sequence name="s_WalkToggiAwayFromHjaHestasveini">
    <Quantum name="q_Freeze"/>
	<Quantum name="qh_HotspotHjaHestasveini2HeidnarBudir"/>
    <Quantum name="q_WalkToggiAwayFromHjaHestasveini"/>
    <Quantum name="q_MoveToggi2HeidnarBudir"/>
	<Quantum name="qs_HotspotHjaHestasveini2HeidnarBudir"/>
	<Quantum name="q_MoveConvToggiHeidnarBudir"/>
	<Quantum name="q_ToggiStadsetning0"/>
</Sequence>

<Sequence name="s_WalkToggiAwayFromLogberg">
    <Quantum name="q_Freeze"/>
	<Quantum name="qh_HotspotLogberg2HjaHestasveini"/>
    <Quantum name="q_WalkToggiAwayFromLogberg"/>
    <Quantum name="q_MoveToggi2HeidnarBudir"/>
	<Quantum name="qs_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="q_MoveConvToggiHeidnarBudir"/>
	<Quantum name="q_ToggiStadsetning0"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForToggi" flag="f_ToggiStadsetning" wait="true">
	<Trigger value="1" seq="s_WalkToggiAwayFromLogberg"/>
	<Trigger value="2" seq="s_WalkToggiAwayFromHjaHestasveini"/>
</CheckConditionQuantum>

<Sequence name="s_ToggiTalk2">
	<Quantum name="q_ThettaVarTher"/>
	<Quantum name="q_StopToggi"/>
</Sequence>

<Sequence name="s_ToggiTalk1">
	<Quantum name="q_ThettaVar"/>
	<Quantum name="q_StopToggi"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForToggi34" flag="f_ToggiStadsetning" wait="true">
	<Trigger value="1" seq="s_ToggiTalk2"/>
	<Trigger value="0" seq="s_ToggiTalk1"/>
	<Trigger value="2" seq="s_ToggiTalk2"/>
</CheckConditionQuantum>

<Sequence name="s_AeFyrirgefdu">
	<Quantum name="q_Conversating"/>
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_AeFyrirgefdu"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckForToggi34"/>
	<Quantum name="qh_AeFyrirgefdu"/>
	<Quantum name="qh_ViltuVeraSvoVaenn"/>
	<Quantum name="qs_EgLumaAMjog"/>
	<Quantum name="q_SentenceThuErtLogsogumadur"/>
	<Quantum name="q_SentenceHvernigListTherA"/>
	<Quantum name="q_HjaHestasveiniFromLogberg0"/>
	<Quantum name="q_HjaHestasveiniFromHeidnarBudir0"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini0"/>
	<Quantum name="q_LogbergFromHjaHestasveini1"/>
	<Quantum name="q_CheckForToggi"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="AeFyrirgefdu" seq="s_AeFyrirgefdu"/>

<Sequence name="s_Bless9">
	<Quantum name="qh_TextToggi"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="Bless9" seq="s_Bless9"/>

<Sequence name="s_WalkHjalti2ToggiLogberg">
	<Quantum name="q_WalkHjalti2ToggiLogberg1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2ToggiLogberg2"/>
</Sequence>

<Sequence name="s_WalkHjalti2ToggiHeidnarBudir">
	<Quantum name="q_WalkHjalti2ToggiHeidnarBudir1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2ToggiHeidnarBudir2"/>
</Sequence>

<Sequence name="s_WalkHjalti2ToggiHjaHestasveini">
	<Quantum name="q_WalkHjalti2ToggiHjaHestasveini1"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2ToggiHjaHestasveini2"/>
</Sequence>

<CheckConditionQuantum name="q_CheckToggi92" flag="f_CS" wait="true">
	<Trigger value="1" seq="s_WalkHjalti2ToggiLogberg"/>
	<Trigger value="2" seq="s_WalkHjalti2ToggiHeidnarBudir"/>
	<Trigger value="7" seq="s_WalkHjalti2ToggiHjaHestasveini"/>
</CheckConditionQuantum>

<Sequence name="s_GreetUsual">
	<Quantum name="q_JaHjaltiHvadErTher"/>
	<Quantum name="q_StopToggi"/>
</Sequence>

<Sequence name="s_GreetFur">
	<Quantum name="q_JaHjaltiHvadErTherFeldur"/>
	<Quantum name="q_ToggiSkelfur"/>
</Sequence>

<CheckConditionQuantum name="q_CheckFeldur50" flag="f_Feldur" wait="true">
	<Trigger value="1" seq="s_GreetFur"/>
	<Trigger value="0" seq="s_GreetUsual"/>
</CheckConditionQuantum>

<Sequence name="s_GreetToggi">
	<Quantum name="q_Thorgeir"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckFeldur50"/>
</Sequence>

<CheckConditionQuantum name="q_CheckToggi64" flag="f_HjaHestasveiniFromHeidnarBudir" wait="true">
	<Trigger value="0" seq="s_GreetToggi"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvToggi">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckToggi92"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckToggi64"/>
	<Quantum name="qs_TextToggi"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Toggi" seq="s_BeginConvToggi"/>



<!-- Conversation with Volva -->

<Text name="Bless19" text="Bless!" terrain="conv_Volva" color="white"/>
	<ActorMoused actor="Bless19" listener="sc"/>
<Text name="ThuHeitir" text="Þú heitir.." terrain="conv_Volva" color="white"/>
	<ActorMoused actor="ThuHeitir" listener="sc"/>

<MoveActorQuantum name="qh_ThuHeitir" actor="ThuHeitir"/>
<MoveActorQuantum name="qh_Bless19" actor="Bless19"/>

<MoveActorQuantum name="qs_Bless19" actor="Bless19" terrain="conv_Volva"/>
<MoveActorQuantum name="qs_ThuHeitir" actor="ThuHeitir" terrain="conv_Volva"/>

<UpdateQuantum name="qh_TextVolva" terrain="conv_Volva" show="false"/>
<UpdateQuantum name="qs_TextVolva" terrain="conv_Volva" show="true"/>

<GuessQuantum name="q_Guess"/>

<Sequence name="s_VolvaSnuSnu">
	<Quantum name="q_SnuVolva"/>
	<Quantum name="q_StopVolva"/>
    <Quantum name="q_VolvaSnu1"/>
</Sequence>

<CheckConditionQuantum name="q_VolvaSnuSnu" flag="f_VolvaSnu" wait="true">
	<Trigger value="0" seq="s_VolvaSnuSnu"/>
</CheckConditionQuantum>

<Sequence name="s_HvadDregurThigHingad">
    <Quantum name="q_VolvaSnuSnu"/>
	<Quantum name="q_HvadDregurThigHingad"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="q_HaMi"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_OgMedThettaFallegaHalsmen"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="q_BeginConvVolvaInc"/>
	<Quantum name="qs_TextVolva"/>
</Sequence>

<Sequence name="s_EgThekkiVanda">
    <Quantum name="q_VolvaSnuSnu"/>
	<Quantum name="q_EgThekkiVanda"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="qs_TextVolva"/>
</Sequence>

<Sequence name="s_HvernigDirfistu">
    <Quantum name="q_VolvaSnuSnu"/>
	<Quantum name="q_HvernigDirfistu"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="q_Moving"/>
</Sequence>

<CheckConditionQuantum name="q_BeginConvVolva" flag="f_BeginConvVolva" wait="true">
	<Trigger value="0" seq="s_HvernigDirfistu"/>
	<Trigger value="1" seq="s_HvadDregurThigHingad"/>
	<Trigger value="2" seq="s_EgThekkiVanda"/>
	<Trigger value="3" seq="s_HvernigDirfistu"/>
</CheckConditionQuantum>

<Sequence name="s_BeginConvVolva">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_WalkHjalti2Volva"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_BeginConvVolva"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Volva" seq="s_BeginConvVolva"/>

<Sequence name="s_GuessCorrect">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_ThettaVarNuAlltOf"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="q_FaduMer"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="q_SnuKrossVolva"/>
	<Quantum name="q_DyfirVolva"/>
	<Quantum name="q_KrossVolva"/>
	<Quantum name="q_StopKrossVolva"/>
	<Quantum name="q_MoveThorshamar"/>
	<Quantum name="q_ThennanGullfallegaThorshamar1"/>
	<Quantum name="q_MoveKross2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_FleiraHef2"/>
	<Quantum name="q_BeginConvVolva3"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_GuessWrong">
    <Quantum name="q_Conversating"/>
    <Quantum name="q_GettuBetur"/>
	<Quantum name="q_StopVolva"/>
	<Quantum name="qs_TextVolva"/>
</Sequence>

<Sequence name="s_Bless19">
	<Quantum name="qh_TextVolva"/>
	<Quantum name="q_randomBless"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="Bless19" seq="s_Bless19"/>

<Sequence name="s_ThuHeitir">
	<Quantum name="qh_TextVolva"/>
	<Quantum name="q_Freeze"/>
	<Quantum name="q_Guess"/>
</Sequence>
<Reaction reactor="action_talk" actor="ThuHeitir" seq="s_ThuHeitir"/>

<!-- Reactions -->

<Sequence name="s_LookPokar">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaEruBaraVenjulegir"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Pokar" seq="s_LookPokar"/>

<Sequence name="s_LookPeningur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_FallegMynt"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Peningur" seq="s_LookPeningur"/>

<Sequence name="s_LookHestasveinn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaErHestasveinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_HestaSveinn" seq="s_LookHestasveinn"/>

<Sequence name="s_LookVolva">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThadErMerkilegt"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Volva" seq="s_LookVolva"/>

<Sequence name="s_LookFeldur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaErHlyji"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Feldur" seq="s_LookFeldur"/>

<Sequence name="s_LookKross">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_KrossinnSemErna"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Kross" seq="s_LookKross"/>

<Sequence name="s_LookThorshamar">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaErLitid"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Thorshamar" seq="s_LookThorshamar"/>

<Sequence name="s_LookToggi">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaErThorgeir"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Toggi" seq="s_LookToggi"/>

<Sequence name="s_LookHallur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaErHannHallur"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Hallur" seq="s_LookHallur"/>

<Sequence name="s_LookHjalti">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Gissur"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Hjalti" seq="s_LookHjalti"/>
<Reaction reactor="action_talk" actor="a_Hjalti" seq="s_LookHjalti"/>
<Reaction reactor="action_take" actor="a_Hjalti" seq="s_LookHjalti"/>

<Sequence name="s_LookGissurHviti">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaErBaraTengdapabbi"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_GissurHviti" seq="s_LookGissurHviti"/>

<Sequence name="s_TakeHuman">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Talk2"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_GissurHviti" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Volva" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Hjalti" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Toggi" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_HestaSveinn" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Hallur" seq="s_TakeHuman"/>
<Reaction reactor="action_take" actor="a_Hjalti" seq="s_TakeHuman"/>


<!-- Miscellaneous reactions and Quanta-->

<JMFActorMouth name="m_Kortalag" file="\Landnam\Media\1_kort.wav" prepare="true" repeat="true"/>
<FadeQuantum name="qf_KortalagOut2" mouth="m_Kortalag" goal="0" speed="150"/>
<FadeQuantum name="qf_KortalagIn" mouth="m_Kortalag" goal="0.9" speed="100"/>
<PrepareQuantum name="qp_Kortalag" object="m_Kortalag" prepare="true"/>
<StaticActor name="a_Kortalag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Kortalag"/> </StaticActor>
<StateQuantum name="q_Kortalag_stop" actor="a_Kortalag" state="stop" wait="false"/>
<StateQuantum name="q_Kortalag_play" actor="a_Kortalag" state="play" wait="false"/>

<Scene name="s_BeginScene"/>

<SimplePseudo3DTerrain name="t_BeginScene" scene="s_BeginScene" polygon="p_All"
	zmin="-7" zmax="0" defaultscaling="1.0"/>

<StaticActorFace name="af_BeginScene" file="\kristniA\Graphic\byrjunaA"/>
<StaticActor name="a_BeginScene" terrain="t_BeginScene" x="0" y="5000" z="5000" state="stop">
	<State name="stop" face="af_BeginScene"/>
</StaticActor>
<PrepareQuantum name="qp_BeginScene" object="af_BeginScene" prepare="true"/>
<PrepareQuantum name="qu_BeginScene" object="af_BeginScene" prepare="false"/>
<SwitchSceneQuantum name="q_ToBeginScene" scene="s_BeginScene"/>

<Sequence name="s_LogbergFromKristnarBudirNothing">
	<Quantum name="q_MoveHjalti2LogbergFromKristnarBudir"/>
	<Quantum name="q_MoveGissurHviti2LogbergFromKristnarBudir"/>
	<Quantum name="q_WalkHjalti2LogbergFromKristnarBudir"/>
	<Quantum name="q_WalkGissurHviti2LogbergFromKristnarBudir"/>
</Sequence>

<Sequence name="s_HallurToggiTalk">
    <Quantum name="q_WalkHallur2Toggi"/>
    <Quantum name="q_KomduSaellThorgeirLjosvetningagodiMer"/>
    <Quantum name="q_StopHallur"/>
    <Quantum name="q_ThuHefurLogAd"/>
    <Quantum name="q_StopToggi"/>
	<Quantum name="qh_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="qh_HotspotLogberg2KristnarBudir"/>
    <Quantum name="q_WalkToggiAwayFromLogberg2"/>
    <Quantum name="q_WalkHallurAway"/>
    <Quantum name="q_MoveToggi2HeidnarBudir"/>
	<Quantum name="q_ToggiSkelfur"/>
    <Quantum name="q_MoveHallur2KristnarBudir"/>
   	<Quantum name="qh_EgErBuinnAdGleymaHvad"/>
	<Quantum name="qh_BidduHerEftir"/>
	<Quantum name="q_SentenceAfHverjuVilt"/>
	<Quantum name="q_SentenceJaejaHallur"/>
	<Quantum name="qh_EgHefSvolitidMerkilegt"/>
	<Quantum name="q_ThuErtLogsogumadur1"/>
	<Quantum name="q_KristnarBudirFromLogberg0"/>
	<Quantum name="q_LogbergFromKristnarBudir0"/>
	<Quantum name="qh_AeFyrirgefdu"/>
	<Quantum name="qh_ViltuVeraSvoVaenn"/>
	<Quantum name="qh_EgLumaAMjog"/>
	<Quantum name="qh_ThuErtLogsogumadur"/>
	<Quantum name="qh_HvernigListTherA"/>
	<Quantum name="q_HjaHestasveiniFromLogberg0"/>
	<Quantum name="q_HjaHestasveiniFromHeidnarBudir0"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini0"/>
	<Quantum name="q_LogbergFromHjaHestasveini1"/>
	<Quantum name="qs_HvadaNidurstodu"/>
	<Quantum name="qs_HversVegnaStendurThu"/>
	<Quantum name="q_MoveConvHallurKristnarBudir"/>
	<Quantum name="q_MoveConvToggiHeidnarBudir"/>
	<Quantum name="qp_Toggi1"/>
	<Quantum name="qs_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="qs_HotspotLogberg2KristnarBudir"/>
	<Quantum name="q_Feldur1"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForAction2" flag="f_ToggiStadsetning" wait="true">
	<Trigger value="1" seq="s_HallurToggiTalk"/>
</CheckConditionQuantum>

<Sequence name="s_HallurFollowingFromKristnarBudir">
	<Quantum name="q_MoveHjalti2LogbergFromKristnarBudir"/>
	<Quantum name="q_MoveGissurHviti2LogbergFromKristnarBudir"/>
	<Quantum name="q_MoveHallur2LogbergFromKristnarBudir"/>
	<Quantum name="q_HallurStadsetning1"/>
	<Quantum name="q_WalkHallur2LogbergFromKristnarBudir"/>
	<Quantum name="q_WalkHjalti2LogbergFromKristnarBudir"/>
	<Quantum name="q_WalkGissurHviti2LogbergFromKristnarBudir"/>
	<Quantum name="q_MoveConvHallurLogberg"/>
	<Quantum name="q_CheckForAction2"/>
</Sequence>

<Sequence name="s_HjaHestasveiniFromHeidnarBudirNothing">
	<Quantum name="q_MoveHjalti2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_MoveGissurHviti2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_WalkGissurHviti2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_WalkHjalti2HjaHestasveiniFromHeidnarBudir"/>
</Sequence>

<Sequence name="s_ToggiFollowingFromHeidnarBudir">
	<Quantum name="q_MoveHjalti2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_MoveGissurHviti2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_MoveToggi2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_ToggiStadsetning2"/>
	<Quantum name="q_WalkToggi2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_WalkGissurHviti2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_WalkHjalti2HjaHestasveiniFromHeidnarBudir"/>
	<Quantum name="q_MoveConvToggiHjaHestasveini"/>
</Sequence>

<CheckConditionQuantum name="q_HjaHestasveiniFromHeidnarBudir" flag="f_HjaHestasveiniFromHeidnarBudir" wait="true">
	<Trigger value="0" seq="s_HjaHestasveiniFromHeidnarBudirNothing"/>
	<Trigger value="1" seq="s_ToggiFollowingFromHeidnarBudir"/>
</CheckConditionQuantum>

<Sequence name="s_HjaHestasveiniFromLogbergNothing">
	<Quantum name="q_MoveHjalti2HjaHestasveiniFromLogberg"/>
	<Quantum name="q_MoveGissurHviti2HjaHestasveiniFromLogberg"/>
	<Quantum name="q_WalkHjalti2HjaHestasveiniFromLogberg"/>
	<Quantum name="q_WalkGissurHviti2HjaHestasveiniFromLogberg"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForAction" flag="f_HallurStadsetning" wait="true">
	<Trigger value="1" seq="s_HallurToggiTalk"/>
</CheckConditionQuantum>

<Sequence name="s_ToggiFollowingFromLogberg">
	<Quantum name="q_MoveHjalti2HjaHestasveiniFromLogberg5"/>
	<Quantum name="q_MoveGissurHviti2HjaHestasveiniFromLogberg5"/>
	<Quantum name="q_MoveToggi2HjaHestasveiniFromLogberg"/>
	<Quantum name="q_ToggiStadsetning2"/>
	<Quantum name="q_WalkHjalti2HjaHestasveiniFromLogberg"/>
	<Quantum name="q_WalkGissurHviti2HjaHestasveiniFromLogberg2"/>
	<Quantum name="q_WalkToggi2HjaHestasveiniFromLogberg"/>
	<Quantum name="q_MoveConvToggiHjaHestasveini"/>
</Sequence>

<CheckConditionQuantum name="q_HjaHestasveiniFromLogberg" flag="f_HjaHestasveiniFromLogberg" wait="true">
	<Trigger value="0" seq="s_HjaHestasveiniFromLogbergNothing"/>
	<Trigger value="1" seq="s_ToggiFollowingFromLogberg"/>
</CheckConditionQuantum>

<Sequence name="s_KristnarBudirFromLogbergNothing">
	<Quantum name="q_MoveHjalti2KristnarBudir"/>
	<Quantum name="q_MoveGissurHviti2KristnarBudir"/>
	<Quantum name="q_WalkGissurHviti2KristnarBudir"/>
	<Quantum name="q_WalkHjalti2KristnarBudir"/>
</Sequence>

<Sequence name="s_HallurFollowingFromLogberg">
	<Quantum name="q_MoveHjalti2KristnarBudir"/>
	<Quantum name="q_MoveGissurHviti2KristnarBudir"/>
	<Quantum name="q_MoveHallur2KristnarBudirF"/>
	<Quantum name="q_HallurStadsetning0"/>
	<Quantum name="q_WalkHallur2KristnarBudir"/>
	<Quantum name="q_WalkGissurHviti2KristnarBudir"/>
	<Quantum name="q_WalkHjalti2KristnarBudir"/>
	<Quantum name="q_MoveConvHallurKristnarBudir"/>
</Sequence>

<Sequence name="s_KristnarBudirFirst">
	<Quantum name="q_MoveHjalti2KristnarBudir"/>
	<Quantum name="q_MoveGissurHviti2KristnarBudir"/>
	<Quantum name="q_WalkGissurHviti2KristnarBudir"/>
	<Quantum name="q_WalkHjalti2KristnarBudir"/>
	<Quantum name="q_SaellHallurASidu"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_HeilirOgSaelir"/>
	<Quantum name="q_StopHallur"/>
	<Quantum name="q_NuHofumVidSagt"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_VelMaeltudThidFyrirHond"/>
	<Quantum name="q_StopHallur"/>
	<Quantum name="q_KristnarBudirFromLogberg0"/>
</Sequence>

<CheckConditionQuantum name="q_KristnarBudirFromLogberg" flag="f_KristnarBudirFromLogberg" wait="true">
	<Trigger value="0" seq="s_KristnarBudirFromLogbergNothing"/>
	<Trigger value="1" seq="s_KristnarBudirFirst"/>
	<Trigger value="2" seq="s_HallurFollowingFromLogberg"/>
</CheckConditionQuantum>

<CheckConditionQuantum name="q_LogbergFromKristnarBudir" flag="f_LogbergFromKristnarBudir" wait="true">
	<Trigger value="0" seq="s_LogbergFromKristnarBudirNothing"/>
	<Trigger value="1" seq="s_HallurFollowingFromKristnarBudir"/>
</CheckConditionQuantum>

<Sequence name="s_HeidnarBudirFromHjaHestasveiniNothing">
	<Quantum name="q_MoveHjalti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_MoveGissurHviti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_WalkHjalti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_WalkGissurHviti2HeidnarBudirFromHjaHestasveini"/>
</Sequence>

<Sequence name="s_ToggiFollowingFromHjaHestasveini2">
	<Quantum name="q_MoveHjalti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_MoveGissurHviti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_MoveToggi2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_ToggiStadsetning0"/>
	<Quantum name="q_WalkHjalti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_WalkGissurHviti2HeidnarBudirFromHjaHestasveini3"/>
	<Quantum name="q_WalkToggi2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_MoveConvToggiHeidnarBudir"/>
</Sequence>

<Sequence name="s_HeidnarBudirFirst">
	<Quantum name="q_MoveHjalti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_MoveGissurHviti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_WalkHjalti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_WalkGissurHviti2HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="q_HeillOgSaellThorgeir"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_KomidThidSaelirGissurOg"/>
	<Quantum name="q_StopToggi"/>
	<Quantum name="q_OJaThaad"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_IslendingarEruNuKlofnir"/>
	<Quantum name="q_StopToggi"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini0"/>
</Sequence>

<CheckConditionQuantum name="q_HeidnarBudirFromHjaHestasveini" flag="f_HeidnarBudirFromHjaHestasveini" wait="true">
	<Trigger value="0" seq="s_HeidnarBudirFromHjaHestasveiniNothing"/>
	<Trigger value="1" seq="s_HeidnarBudirFirst"/>
	<Trigger value="2" seq="s_ToggiFollowingFromHjaHestasveini2"/>
</CheckConditionQuantum>

<Sequence name="s_ToggiThorirEkki2">
    <Quantum name="q_EgHeldAdEgAettiEkki"/>
    <Quantum name="q_StopToggi"/>
	<Quantum name="qh_HotspotLogberg2HjaHestasveini"/>
    <Quantum name="q_WalkToggiAwayFromLogberg"/>
    <Quantum name="q_MoveToggi2HeidnarBudir"/>
	<Quantum name="qs_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="qh_AeFyrirgefdu"/>
	<Quantum name="qh_ViltuVeraSvoVaenn"/>
	<Quantum name="qs_EgLumaAMjog"/>
	<Quantum name="q_SentenceThuErtLogsogumadur"/>
	<Quantum name="q_SentenceHvernigListTherA"/>
	<Quantum name="q_HjaHestasveiniFromLogberg0"/>
	<Quantum name="q_HjaHestasveiniFromHeidnarBudir0"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini0"/>
	<Quantum name="q_LogbergFromHjaHestasveini1"/>
	<Quantum name="q_MoveConvToggiHeidnarBudir"/>
	<Quantum name="q_ToggiStadsetning0"/>
</Sequence>

<CheckConditionQuantum name="q_CheckThorgeir2" flag="f_HeidnarBudirFromHjaHestasveini" wait="true">
	<Trigger value="2" seq="s_ToggiThorirEkki2"/>
</CheckConditionQuantum>

<Sequence name="s_ToggiThorirEkki">
    <Quantum name="q_CheckThorgeir2"/>
</Sequence>

<CheckConditionQuantum name="q_CheckThorgeir" flag="f_ToggiStadsetning" wait="true">
	<Trigger value="1" seq="s_ToggiThorirEkki"/>
</CheckConditionQuantum>

<Sequence name="s_HallurThorirEkki2">
    <Quantum name="q_Neeeiiii"/>
    <Quantum name="q_StopHallur"/>
	<Quantum name="qh_HotspotLogberg2KristnarBudir"/>
    <Quantum name="q_WalkHallurAway"/>
    <Quantum name="q_MoveHallur2KristnarBudir"/>
	<Quantum name="qs_HotspotLogberg2KristnarBudir"/>
	<Quantum name="qh_EgErBuinnAdGleymaHvad"/>
	<Quantum name="qh_BidduHerEftir"/>
	<Quantum name="q_SentenceAfHverjuVilt"/>
	<Quantum name="q_SentenceJaejaHallur"/>
	<Quantum name="qs_EgHefSvolitidMerkilegt"/>
	<Quantum name="q_KristnarBudirFromLogberg0"/>
	<Quantum name="q_LogbergFromKristnarBudir0"/>
	<Quantum name="q_MoveConvHallurKristnarBudir"/>
	<Quantum name="q_HallurStadsetning0"/>
</Sequence>

<CheckConditionQuantum name="q_CheckSiduHallur2" flag="f_KristnarBudirFromLogberg" wait="true">
	<Trigger value="2" seq="s_HallurThorirEkki2"/>
</CheckConditionQuantum>

<Sequence name="s_HallurThorirEkki">
    <Quantum name="q_CheckSiduHallur2"/>
</Sequence>

<CheckConditionQuantum name="q_CheckSiduHallur" flag="f_HallurStadsetning" wait="true">
	<Trigger value="1" seq="s_HallurThorirEkki"/>
</CheckConditionQuantum>

<Sequence name="s_LogbergDeilur">
	<Quantum name="q_MoveHjalti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_MoveGissurHviti2LogbergFromHjaHestasveini"/>
    <Quantum name="q_EnniSnorri"/>
    <Quantum name="q_HjalmurVikingur"/>
    <Quantum name="q_RifastEldmadur"/>
    <Quantum name="q_RifastKristnirLogberg"/>
    <Quantum name="q_RifastHeidnirLogberg"/>
	<Quantum name="q_Quarell"/>
	<Quantum name="q_WalkGissurHviti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_WalkHjalti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_EgBidVidstadda"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_StopHeidnirLogberg"/>
    <Quantum name="q_FadeKlidurOut"/>
	<Quantum name="q_StopSFX"/>
	<Quantum name="q_StopKristnirLogberg"/>
	<Quantum name="q_StopEldmadur"/>
	<Quantum name="q_StopVikingur"/>
	<Quantum name="q_StopSnorri"/>
	<Quantum name="q_EgGissur"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_GissurHvitiHefurLog"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThadErKominnUpp"/>
	<Quantum name="q_StopEldmadur"/>
	<Quantum name="q_SkeggVikingur"/>
	<Quantum name="q_EigiErUndur"/>
	<Quantum name="q_StopVikingur"/>
	<Quantum name="q_SkeggSnorri"/>
	<Quantum name="q_UmHvadReiddust"/>
	<Quantum name="q_StopSnorri"/>
	<Quantum name="q_SkeggVikingur"/>
	<Quantum name="q_GissurOgHjaltiHafaMaelt"/>
	<Quantum name="q_RifastEldmadur"/>
	<Quantum name="q_RifastHeidnirLogberg"/>
	<Quantum name="q_HeyrHeyr"/>
	<Quantum name="q_StopVikingur"/>
	<Quantum name="q_StopHeidnirLogberg"/>
	<Quantum name="q_StopEldmadur"/>
	<Quantum name="q_EkkiGetEgLengur"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_RifastKristnirLogberg"/>
	<Quantum name="q_Sammala"/>
	<Quantum name="q_StopSnorri"/>
	<Quantum name="q_BurtKristnirLogberg"/>
	<Quantum name="q_WalkKristnirLogberg"/>
	<Quantum name="q_BurtHallur"/>
	<Quantum name="q_MoveVikingur2HeidnarBudir"/>
	<Quantum name="q_MoveEldmadur2HeidnarBudir"/>
	<Quantum name="q_MoveSnorri2KristnarBudir"/>
	<Quantum name="q_WalkHeidnirLogberg"/>
	<Quantum name="q_BurtHeidnirLogberg"/>
	<Quantum name="q_BurtToggi"/>
	<Quantum name="q_MoveHallur2KristnarBudir"/>
	<Quantum name="q_MoveToggi2HeidnarBudir"/>
    <Quantum name="q_StopKristnirLogberg"/>
    <Quantum name="q_StopHeidnirLogberg"/>
	<Quantum name="q_KristnarBudirFromLogberg1"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini1"/>
	<Quantum name="q_GeturThuNokkudUtskyrt1"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_LogbergFromHjaHestasveini1"/>
</Sequence>

<Sequence name="s_LogbergEinn">
	<Quantum name="q_MoveHjalti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_MoveGissurHviti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_WalkGissurHviti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_WalkHjalti2LogbergFromHjaHestasveini"/>
</Sequence>

<Sequence name="s_ToggiFollowingFromHjaHestasveini">
	<Quantum name="q_MoveHjalti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_MoveGissurHviti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_MoveToggi2LogbergFromHjaHestasveini"/>
	<Quantum name="q_ToggiStadsetning1"/>
	<Quantum name="q_HjaHestasveiniFromLogberg1"/>
	<Quantum name="q_WalkToggi2LogbergFromHjaHestasveini"/>
	<Quantum name="q_WalkGissurHviti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_WalkHjalti2LogbergFromHjaHestasveini"/>
	<Quantum name="q_MoveConvToggiLogberg"/>
	<Quantum name="q_CheckForAction"/>
</Sequence>

<CheckConditionQuantum name="q_LogbergFromHjaHestasveini" flag="f_LogbergFromHjaHestasveini" wait="true">
	<Trigger value="0" seq="s_LogbergDeilur"/>
	<Trigger value="1" seq="s_LogbergEinn"/>
    <Trigger value="2" seq="s_ToggiFollowingFromHjaHestasveini"/>
</CheckConditionQuantum>

<Sequence name="s_LookRunir">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_KristnarBudir"/>
	<Quantum name="qp_Runir"/>
	<Quantum name="q_ToRunir"/>
	<Quantum name="q_HerErEitthvadRist"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MoveHjalti2Runir"/>
	<Quantum name="q_CSRunir"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_look" actor="a_Runir" seq="s_LookRunir"/>

<Sequence name="s_LookErnaRunir">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_HjaVolvu"/>
	<Quantum name="qp_ErnaRunir"/>
	<Quantum name="q_ToErnaRunir"/>
	<Quantum name="q_HerErEitthvadRist"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MoveHjalti2ErnaRunir"/>
	<Quantum name="q_CSErnaRunir"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_look" actor="a_Letrun" seq="s_LookErnaRunir"/>

<Sequence name="s_LookLetur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_KristnarBudir"/>
	<Quantum name="qp_Letur"/>
	<Quantum name="q_ToLetur"/>
	<Quantum name="q_SjaldanVeldurEinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MoveHjalti2Letur"/>
	<Quantum name="q_CSLetur"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_look" actor="a_Letur" seq="s_LookLetur"/>

<Sequence name="s_UsePeningurOnHestasvein">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkHjalti2Hestasveinn1"/>
	<Quantum name="q_WalkHjalti2Hestasveinn2"/>
	<Quantum name="q_ErFallegiFeldurinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HvadHefurThuAdBjoda"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="q_ThettaGull"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_NeiTakkOft"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_ThettaGull"/>
	<Quantum name="q_ThettaGull1"/>
	<Quantum name="q_MovePeningur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_Peningur" actor2="a_HestaSveinn" seq="s_UsePeningurOnHestasvein"/>

<Sequence name="s_UseThorshamarOnHestasvein">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkHjalti2Hestasveinn1"/>
	<Quantum name="q_WalkHjalti2Hestasveinn2"/>
	<Quantum name="q_ErFallegiFeldurinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HvadHefurThuAdBjoda"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="q_ThennanGullfallegaThorshamar"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_ThettaMen"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qh_ThennanGullfallegaThorshamar"/>
	<Quantum name="q_ThennanGullfallegaThorshamar1"/>
	<Quantum name="q_MoveThorshamar2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_Thorshamar" actor2="a_HestaSveinn" seq="s_UseThorshamarOnHestasvein"/>

<Sequence name="s_DoFeldur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_EgUtvegadi"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qp_Hjalti7"/>
	<Quantum name="q_HjaltiGefurFeld"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qp_Toggi3"/>
	<Quantum name="qp_Toggi2"/>
	<Quantum name="q_ThettaVarEinmitt"/>
	<Quantum name="q_StopFeldToggi"/>
    <Quantum name="q_4sec"/>
	<Quantum name="q_Freeze"/>
    <Quantum name="qs_NaestaMorgun"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="qp_HeidnarBudir"/>
	<Quantum name="qu_Hjalti7"/>
    <Quantum name="q_ToHeidnarBudir"/>
    <Quantum name="qh_NaestaMorgun"/>
    <Quantum name="q_LoksinsHef"/>
	<Quantum name="q_StopFeldToggi"/>
    <Quantum name="qs_StuttuSeinna"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="qu_HeidnarBudir"/>
    <Quantum name="qp_Logberg"/>
    <Quantum name="q_ToLogberg"/>
    <Quantum name="qh_StuttuSeinna"/>
    <Quantum name="q_MoveHallur2Logberg"/>
    <Quantum name="q_MoveEldmadur2Logberg"/>
    <Quantum name="q_MoveVikingur2Logberg"/>
    <Quantum name="q_MoveSnorri2Logberg"/>
    <Quantum name="q_MoveKristnirLogberg2Logberg"/>
    <Quantum name="q_MoveHeidnirLogberg2Logberg"/>
    <Quantum name="q_MoveToggi2Logberg"/>
    <Quantum name="q_MoveGissurHviti2LogbergFin"/>
    <Quantum name="q_MoveHjalti2LogbergFin"/>
    <Quantum name="q_ToLogberg"/>
    <Quantum name="q_KaeruLandar"/>
	<Quantum name="q_StopFeldToggi"/>
    <Quantum name="q_HjalmurVikingur"/>
    <Quantum name="q_RifastEldmadur"/>
    <Quantum name="q_RifastKristnirLogberg"/>
    <Quantum name="q_RifastHeidnirLogberg"/>
	<Quantum name="q_Sammala"/>
	<Quantum name="q_StopHeidnirLogberg"/>
	<Quantum name="q_StopKristnirLogberg"/>
	<Quantum name="q_StopEldmadur"/>
	<Quantum name="q_StopVikingur"/>
	<Quantum name="q_StopSnorri"/>
	<Quantum name="q_HerEftirSkulu"/>
	<Quantum name="q_StopFeldToggi"/>

<!--   Hér kemur svo taut og muldur  -->

	<Quantum name="q_BurtKristnirLogberg"/>
	<Quantum name="q_WalkKristnirLogberg"/>
	<Quantum name="q_MoveVikingur2HeidnarBudir"/>
	<Quantum name="q_MoveEldmadur2HeidnarBudir"/>
	<Quantum name="q_MoveSnorri2KristnarBudir"/>
	<Quantum name="q_WalkHeidnirLogberg"/>
	<Quantum name="q_BurtHeidnirLogberg2"/>
    <Quantum name="q_StopKristnirLogberg"/>
    <Quantum name="q_StopHeidnirLogberg"/>
    <Quantum name="q_WalkHjalti2Toggi"/>
    <Quantum name="q_StopHjalti"/>
    <Quantum name="q_ThettaHefdiAldreiGengid"/>
	<Quantum name="q_StopFeldToggi"/>
    <Quantum name="qp_Toggi4"/>
    <Quantum name="qp_Hjalti4"/>
    <Quantum name="qp_Hjalti6"/>
    <Quantum name="q_ToggiGefurStein"/>
    <Quantum name="q_HjaltiTekurStein"/>
	<Quantum name="q_StopFeldToggi"/>
    <Quantum name="q_4sec"/>
    <Quantum name="qu_Hjalti4"/>
    <Quantum name="qu_Hjalti6"/>
    <Quantum name="qp_Hjalti5"/>
    <Quantum name="q_Hverfur"/>
    <Quantum name="q_HjaltiHverfur"/>
    <Quantum name="qu_Hjalti5"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="q_StopSong"/>
    <Quantum name="q_StopSFX"/>
    <Quantum name="q_ThemeFin"/>
</Sequence>

<Sequence name="s_Back">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_EgUtvegadi"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_JaEnMerErEkkertKalt"/>
    <Quantum name="q_StopToggi"/>
    <Quantum name="q_MoveFeldur2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Moving"/>
</Sequence>

<CheckConditionQuantum name="q_CheckFeldur" flag="f_Feldur" wait="true">
	<Trigger value="1" seq="s_DoFeldur"/>
	<Trigger value="0" seq="s_Back"/>
</CheckConditionQuantum>

<Sequence name="s_UseFeldurOnToggi">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckToggi92"/>
	<Quantum name="q_CheckFeldur"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Feldur" actor2="a_Toggi" seq="s_UseFeldurOnToggi"/>

<Sequence name="s_UseKrossOnHestasvein">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkHjalti2Hestasveinn1"/>
	<Quantum name="q_WalkHjalti2Hestasveinn2"/>
	<Quantum name="q_ErFallegiFeldurinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HvadHefurThuAdBjoda"/>
	<Quantum name="q_StopHestaSveinn"/>
	<Quantum name="qp_Hjalti1"/>
	<Quantum name="qp_Hjalti2"/>
	<Quantum name="qp_Hjalti3"/>
	<Quantum name="q_FleiraHef"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_HjaltiSynirKross"/>
	<Quantum name="q_HissaHestaSveinn"/>
	<Quantum name="q_HjaltiKrossDingl"/>
	<Quantum name="q_Uhhh"/>
	<Quantum name="q_HjaltiGefurKross"/>
	<Quantum name="q_StopKrossHestaSveinn"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_FleiraHef"/>
	<Quantum name="qh_ThettaGull"/>
	<Quantum name="qh_Ekkert"/>
	<Quantum name="qh_ThennanGullfallegaThorshamar"/>
	<Quantum name="qh_MittVidfraega"/>
	<Quantum name="qh_BlessSveinn"/>
	<Quantum name="q_MoveFeldur2Inventory"/>
	<Quantum name="q_MoveKross"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_BeginConvHestaSveinn2"/>
	<Quantum name="qu_Hjalti1"/>
	<Quantum name="qu_Hjalti2"/>
	<Quantum name="qu_Hjalti3"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_Kross" actor2="a_HestaSveinn" seq="s_UseKrossOnHestasvein"/>

<!-- Take up Peningur -->
<Sequence name="s_TakePeningur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MovePeningur2Inventory"/>
	<Quantum name="q_PeningurTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_ThettaGull2"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Peningur" seq="s_TakePeningur"/>

<!-- Take up Thorshamar -->
<Sequence name="s_TakeThorshamar">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveThorshamar2Inventory"/>
	<Quantum name="q_ThorshamarTaken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_ThennanGullfallegaThorshamar2"/>
	<Quantum name="q_BeginConvVolvaInc"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Thorshamar" seq="s_TakeThorshamar"/>

<!-- Take up Pokar -->
<Sequence name="s_TakePokar">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MovePokar"/>
	<Quantum name="q_PokarTaken"/>
	<Quantum name="q_MovePokar2Inventory"/>
	<Quantum name="qs_Trans2HjaVolvu"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Pokar" seq="s_TakePokar"/>

<!-- Hotspot between HjaHestasveini and Logberg -->
<Sequence name="s_HjaHestasveini2Logberg">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_HotspotHjaHestasveini2Logberg"/>
	<Quantum name="q_WalkHjalti2LogbergFromHjaHestasveiniNew"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_HjaHestasveini"/>
	<Quantum name="qp_Logberg"/>
	<Quantum name="q_ToLogberg"/>
	<Quantum name="qh_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="q_LogbergFromHjaHestasveini"/>
	<Quantum name="qs_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="q_MoveConvGissurHvitiLogberg"/>
	<Quantum name="q_CSLogberg"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_HotspotHjaHestasveini2Logberg"/>
 </Sequence>
<Reaction reactor="ac_HjaHestasveini2Logberg" actor="a_Hjalti" seq="s_HjaHestasveini2Logberg"/>

<!-- Hotspot between Runir and KristnarBudir -->
<Sequence name="s_Runir2KristnarBudir">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MoveHjalti2KristnarBudirFromRunir"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_Runir"/>
	<Quantum name="qp_KristnarBudir"/>
	<Quantum name="q_ToKristnarBudir"/>
	<Quantum name="q_CSKristnarBudir"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="ac_Runir2KristnarBudir" actor="a_Hjalti" seq="s_Runir2KristnarBudir"/>
<Reaction reactor="action_take" actor="a_Runir2" seq="s_Runir2KristnarBudir"/>
<Reaction reactor="action_talk" actor="a_Runir2" seq="s_Runir2KristnarBudir"/>
<Reaction reactor="action_look" actor="a_Runir2" seq="s_Runir2KristnarBudir"/>

<Sequence name="s_Runir2HjaVolvu">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MoveHjalti2HjaVolvuFromRunir"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_ErnaRunir"/>
	<Quantum name="qp_HjaVolvu"/>
	<Quantum name="q_ToHjaVolvu"/>
	<Quantum name="q_CSHjaVolvu"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="ac_Runir2HjaVolvu" actor="a_Hjalti" seq="s_Runir2HjaVolvu"/>
<Reaction reactor="action_take" actor="a_ErnaRunir" seq="s_Runir2HjaVolvu"/>
<Reaction reactor="action_talk" actor="a_ErnaRunir" seq="s_Runir2HjaVolvu"/>
<Reaction reactor="action_look" actor="a_ErnaRunir" seq="s_Runir2HjaVolvu"/>


<!-- Hotspot between Letur and KristnarBudir -->
<Sequence name="s_Letur2KristnarBudir">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MoveHjalti2KristnarBudirFromRunir"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_Letur"/>
	<Quantum name="qp_KristnarBudir"/>
	<Quantum name="q_ToKristnarBudir"/>
	<Quantum name="q_CSKristnarBudir"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="ac_Letur2KristnarBudir" actor="a_Hjalti" seq="s_Letur2KristnarBudir"/>
<Reaction reactor="action_take" actor="a_Letur2" seq="s_Letur2KristnarBudir"/>
<Reaction reactor="action_talk" actor="a_Letur2" seq="s_Letur2KristnarBudir"/>
<Reaction reactor="action_look" actor="a_Letur2" seq="s_Letur2KristnarBudir"/>

<!-- Hotspot between Logberg and KristnarBudir -->
<Sequence name="s_Logberg2KristnarBudir">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckThorgeir"/>
	<Quantum name="qh_HotspotLogberg2KristnarBudir"/>
	<Quantum name="q_WalkHjalti2KristnarBudirNew"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_Logberg"/>
	<Quantum name="qp_KristnarBudir"/>
	<Quantum name="q_ToKristnarBudir"/>
	<Quantum name="qh_HotspotKristnarBudir2Logberg"/>
    <Quantum name="q_KristnarBudirFromLogberg"/>
    <Quantum name="qs_HotspotKristnarBudir2Logberg"/>
	<Quantum name="q_MoveConvGissurHvitiKristnarBudir"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_HotspotLogberg2KristnarBudir"/>
	<Quantum name="q_CSKristnarBudir"/>
</Sequence>
<Reaction reactor="ac_Logberg2KristnarBudir" actor="a_Hjalti" seq="s_Logberg2KristnarBudir"/>

<!-- Hotspot between Logberg and HjaHestasveini -->
<Sequence name="s_Logberg2HjaHestasveini">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_CheckSiduHallur"/>
	<Quantum name="qh_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="q_WalkHjalti2HjaHestasveiniFromLogbergNew"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_Logberg"/>
	<Quantum name="qp_HjaHestasveini"/>
	<Quantum name="q_ToHjaHestasveini"/>
	<Quantum name="qh_HotspotHjaHestasveini2Logberg"/>
    <Quantum name="q_HjaHestasveiniFromLogberg"/>
	<Quantum name="qs_HotspotHjaHestasveini2Logberg"/>
	<Quantum name="q_MoveConvGissurHvitiHjaHestasveini"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_HotspotLogberg2HjaHestasveini"/>
	<Quantum name="q_CSHjaHestasveini"/>
</Sequence>
<Reaction reactor="ac_Logberg2HjaHestasveini" actor="a_Hjalti" seq="s_Logberg2HjaHestasveini"/>

<Sequence name="s_PrepareShiver">
	<Quantum name="qp_Toggi1"/>
</Sequence>
<Reaction reactor="ac_Logberg2HjaHestasveini" actor="a_Hjalti" seq="s_Logberg2HjaHestasveini"/>

<CheckConditionQuantum name="q_CheckShiver" flag="f_Feldur" wait="true">
	<Trigger value="1" seq="s_PrepareShiver"/>
</CheckConditionQuantum>

<!-- Hotspot between HjaHestasveini and HeidnarBudir -->
<Sequence name="s_HjaHestasveini2HeidnarBudir">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_HotspotHjaHestasveini2HeidnarBudir"/>
	<Quantum name="q_WalkHjalti2HeidnarBudirFromHjaHestasveiniNew"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_HjaHestasveini"/>
	<Quantum name="qp_HeidnarBudir"/>
	<Quantum name="q_CheckShiver"/>
	<Quantum name="q_ToHeidnarBudir"/>
	<Quantum name="qh_HotspotHeidnarBudir"/>
	<Quantum name="q_HeidnarBudirFromHjaHestasveini"/>
	<Quantum name="qs_HotspotHeidnarBudir"/>
	<Quantum name="q_MoveConvGissurHvitiHeidnarBudir"/>
	<Quantum name="q_CSHeidnarBudir"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_HotspotHjaHestasveini2HeidnarBudir"/>
</Sequence>
<Reaction reactor="ac_HjaHestasveini2HeidnarBudir" actor="a_Hjalti" seq="s_HjaHestasveini2HeidnarBudir"/>

<!-- Hotspot between HeidnarBudir and HjaHestasveini-->
<Sequence name="s_HeidnarBudir2HjaHestasveini">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_HotspotHeidnarBudir"/>
	<Quantum name="q_WalkHjalti2HjaHestasveiniFromHeidnarBudirNew"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_HeidnarBudir"/>
	<Quantum name="qp_HjaHestasveini"/>
	<Quantum name="q_ToHjaHestasveini"/>
	<Quantum name="qh_HotspotHjaHestasveini2HeidnarBudir"/>
    <Quantum name="q_HjaHestasveiniFromHeidnarBudir"/>
    <Quantum name="q_MoveConvGissurHvitiHjaHestasveini"/>
	<Quantum name="qs_HotspotHjaHestasveini2HeidnarBudir"/>
	<Quantum name="q_CSHjaHestasveini"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_HotspotHeidnarBudir"/>
</Sequence>
<Reaction reactor="ac_HeidnarBudir2HjaHestasveini" actor="a_Hjalti" seq="s_HeidnarBudir2HjaHestasveini"/>

<!-- Hotspot between HeidnarBudir and HjaVolvu -->
<Sequence name="s_HeidnarBudir2HjaVolvu">
	<Quantum name="q_Freeze"/>
	<Quantum name="qh_HotspotHeidnarBudir2HjaVolvu"/>
	<Quantum name="q_WalkHjaltiBehindHouse1"/>
	<Quantum name="q_WalkHjaltiBehindHouse2"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_VolvaSnu0"/>
	<Quantum name="q_StopVolva2"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_HeidnarBudir"/>
	<Quantum name="qp_HjaVolvu"/>
	<Quantum name="qp_Volva"/>
	<Quantum name="q_Suda"/>
	<Quantum name="q_ToHjaVolvu"/>
	<Quantum name="qh_HotspotHjaVolvu2HeidnarBudir"/>
	<Quantum name="q_MoveHjalti2HjaVolvu"/>
	<Quantum name="q_WalkHjalti2HjaVolvu"/>
	<Quantum name="qs_HotspotHjaVolvu2HeidnarBudir"/>
	<Quantum name="q_CSHjaVolvu"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="ac_HeidnarBudir2HjaVolvu" actor="a_Hjalti" seq="s_HeidnarBudir2HjaVolvu"/>

<!-- Hotspot between KristnarBudir and Logberg -->
<Sequence name="s_KristnarBudir2Logberg">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="qh_HotspotKristnarBudir2Logberg"/>
	<Quantum name="q_WalkHjalti2LogbergFromKristnarBudirNew"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_KristnarBudir"/>
	<Quantum name="qp_Logberg"/>
	<Quantum name="q_ToLogberg"/>
	<Quantum name="qh_HotspotLogberg2KristnarBudir"/>
	<Quantum name="q_LogbergFromKristnarBudir"/>
	<Quantum name="qs_HotspotLogberg2KristnarBudir"/>
	<Quantum name="q_MoveConvGissurHvitiLogberg"/>
	<Quantum name="q_CSLogberg"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qs_HotspotKristnarBudir2Logberg"/>
</Sequence>
<Reaction reactor="ac_KristnarBudir2Logberg" actor="a_Hjalti" seq="s_KristnarBudir2Logberg"/>

<!-- Hotspot between HjaVolvu and HeidnarBudir -->
<Sequence name="s_HjaVolvu2HeidnarBudir">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppHjalti"/>
	<Quantum name="q_StopHjalti"/>
    <Quantum name="q_ToBlack"/>
	<Quantum name="qu_HjaVolvu"/>
	<Quantum name="qu_Volva"/>
	<Quantum name="qp_HeidnarBudir"/>
	<Quantum name="q_CheckShiver"/>
	<Quantum name="q_StopSFX"/>
	<Quantum name="q_ToHeidnarBudir"/>
	<Quantum name="q_MoveHjalti2HeidnarBudirFromHjaVolvu"/>
	<Quantum name="q_WalkHjalti2HeidnarBudirFromHjaVolvu1"/>
	<Quantum name="q_WalkHjalti2HeidnarBudirFromHjaVolvu2"/>
	<Quantum name="q_WalkHjalti2HeidnarBudirFromHjaVolvu3"/>
	<Quantum name="qs_HotspotHeidnarBudir2HjaVolvu"/>
	<Quantum name="q_CSHeidnarBudir"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="ac_HjaVolvu2HeidnarBudir" actor="a_Hjalti" seq="s_HjaVolvu2HeidnarBudir"/>

<Sequence name="s_BullSull">
	<Quantum name="q_Suda"/>
</Sequence>
<CheckConditionQuantum name="q_CheckVolvaSull" flag="f_CS" wait="true">
	<Trigger value="4" seq="s_BullSull"/>
	<Trigger value="8" seq="s_BullSull"/>
</CheckConditionQuantum>

<Sequence name="song_Kort">
	<Quantum name="q_Kortalag_play"/>
</Sequence>
<Sequence name="s_PlaySong">
	<Quantum name="q_PlaySong"/>
</Sequence>
<CheckConditionQuantum name="q_CheckSong" flag="f_CS" wait="true">
	<Trigger value="0" seq="song_Kort"/>
	<Trigger value="1" seq="s_PlaySong"/>
	<Trigger value="2" seq="s_PlaySong"/>
	<Trigger value="3" seq="s_PlaySong"/>
	<Trigger value="4" seq="s_PlaySong"/>
	<Trigger value="5" seq="s_PlaySong"/>
	<Trigger value="6" seq="s_PlaySong"/>
	<Trigger value="7" seq="s_PlaySong"/>
	<Trigger value="8" seq="s_PlaySong"/>
</CheckConditionQuantum>
<Sequence name="s_always">
    <Quantum name="qp_Adallag"/>
    <Quantum name="qp_Kortalag"/>
    <Quantum name="qf_Adallag"/>
	<Quantum name="q_CheckSong"/>
	<Quantum name="q_CheckVolvaSull"/>
</Sequence>

<Sequence name="s_final">
    <Quantum name="q_StopSong"/>
    <Quantum name="q_StopSFX"/>
</Sequence>

<Sequence name="s_begin">
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="qf_KortalagOut2"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_BeginScene"/>
	<Quantum name="qp_HjaHestasveini"/>
	<Quantum name="q_CSHjaHestasveini"/>
	<Quantum name="q_Kortalag_stop"/>
	<Quantum name="q_PlaySong"/>
	<Quantum name="q_ToHjaHestasveini"/>
	<Quantum name="q_Freeze"/>
    <Quantum name="q_SaellVifillHeitiEg"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_VifillErtThu"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_HverErtThu"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_MjogFyndid"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_HeHeHe"/>
	<Quantum name="q_StopHjalti"/>
	<Quantum name="q_EgHeitiGissurHviti"/>
	<Quantum name="q_StopGissurHviti"/>
	<Quantum name="q_BeginConvGissurHviti1"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_PLogberg">
	<Quantum name="qp_Logberg"/>
	<Quantum name="q_ToLogberg"/>
</Sequence>
<Sequence name="s_PLetur">
	<Quantum name="qp_Letur"/>
	<Quantum name="q_ToLetur"/>
</Sequence>
<Sequence name="s_PRunir">
	<Quantum name="qp_Runir"/>
	<Quantum name="q_ToRunir"/>
</Sequence>
<Sequence name="s_PErnaRunir">
	<Quantum name="qp_ErnaRunir"/>
	<Quantum name="q_ToErnaRunir"/>
</Sequence>
<Sequence name="s_PHjaVolvu">
	<Quantum name="qp_HjaVolvu"/>
	<Quantum name="q_ToHjaVolvu"/>
</Sequence>
<Sequence name="s_PKristnarBudir">
	<Quantum name="qp_KristnarBudir"/>
	<Quantum name="q_ToKristnarBudir"/>
</Sequence>
<Sequence name="s_PHeidnarBudir">
	<Quantum name="qp_HeidnarBudir"/>
	<Quantum name="q_ToHeidnarBudir"/>
</Sequence>
<Sequence name="s_PHjaHestasveini">
	<Quantum name="qp_HjaHestasveini"/>
	<Quantum name="q_ToHjaHestasveini"/>
</Sequence>
<Sequence name="s_PBeginScene">
	<Quantum name="qp_BeginScene"/>
	<Quantum name="q_ToBeginScene"/>
</Sequence>
<CheckConditionQuantum name="q_CheckPrepp" flag="f_CS" wait="true">
	<Trigger value="1" seq="s_PLogberg"/>
	<Trigger value="7" seq="s_PHjaHestasveini"/>
	<Trigger value="8" seq="s_PErnaRunir"/>
	<Trigger value="2" seq="s_PHeidnarBudir"/>
	<Trigger value="3" seq="s_PKristnarBudir"/>
	<Trigger value="4" seq="s_PHjaVolvu"/>
	<Trigger value="5" seq="s_PRunir"/>
	<Trigger value="6" seq="s_PLetur"/>
	<Trigger value="0" seq="s_PBeginScene"/>
</CheckConditionQuantum>
<Sequence name="s_prepare">
    <Quantum name="q_ToBlack"/>
	<Quantum name="q_CheckPrepp"/>
</Sequence>


<UseText actor="a_Kross" actor2="a_Volva" listener="sc" text="Gefa Völvu krossinn"/>
<UseText actor="a_Kross" actor2="a_HestaSveinn" listener="sc" text="Gefa hestasveini krossinn"/>
<UseText actor="a_Kross" actor2="a_Hjalti" listener="sc" text="Gefa mér krossinn"/>
<UseText actor="a_Kross" actor2="a_GissurHviti" listener="sc" text="Gefa Gissuri krossinn"/>
<UseText actor="a_Kross" actor2="a_Hallur" listener="sc" text="Gefa Halli á Síðu krossinn"/>
<UseText actor="a_Kross" actor2="a_Toggi" listener="sc" text="Gefa Þorgeiri Ljósvetningagoða krossinn"/>

<UseText actor="a_Thorshamar" actor2="a_Volva" listener="sc" text="Gefa Völvu Þórshamar"/>
<UseText actor="a_Thorshamar" actor2="a_HestaSveinn" listener="sc" text="Gefa hestasveini Þórshamar"/>
<UseText actor="a_Thorshamar" actor2="a_Hjalti" listener="sc" text="Gefa mér Þórshamar"/>
<UseText actor="a_Thorshamar" actor2="a_GissurHviti" listener="sc" text="Gefa Gissuri Þórshamar"/>
<UseText actor="a_Thorshamar" actor2="a_Hallur" listener="sc" text="Gefa Halli á Síðu Þórshamar"/>
<UseText actor="a_Thorshamar" actor2="a_Toggi" listener="sc" text="Gefa Þorgeiri Ljósvetningagoða Þórshamar"/>

<UseText actor="a_Peningur" actor2="a_Volva" listener="sc" text="Gefa Völvu pening"/>
<UseText actor="a_Peningur" actor2="a_HestaSveinn" listener="sc" text="Gefa hestasveini pening"/>
<UseText actor="a_Peningur" actor2="a_Hjalti" listener="sc" text="Gefa mér pening"/>
<UseText actor="a_Peningur" actor2="a_GissurHviti" listener="sc" text="Gefa Gissuri pening"/>
<UseText actor="a_Peningur" actor2="a_Hallur" listener="sc" text="Gefa Halli á Síðu pening"/>
<UseText actor="a_Peningur" actor2="a_Toggi" listener="sc" text="Gefa Þorgeiri Ljósvetningagoða pening"/>

<UseText actor="a_Feldur" actor2="a_Volva" listener="sc" text="Gefa Völvu feldinn"/>
<UseText actor="a_Feldur" actor2="a_HestaSveinn" listener="sc" text="Gefa hestasveini feldinn"/>
<UseText actor="a_Feldur" actor2="a_Hjalti" listener="sc" text="Gefa mér feldinn"/>
<UseText actor="a_Feldur" actor2="a_GissurHviti" listener="sc" text="Gefa Gissuri feldinn"/>
<UseText actor="a_Feldur" actor2="a_Hallur" listener="sc" text="Gefa Halli á Síðu feldinn"/>
<UseText actor="a_Feldur" actor2="a_Toggi" listener="sc" text="Gefa Þorgeiri Ljósvetningagoða feldinn"/>

<!-- SetPlayer -->

<SetPlayer object="sc" player="a_Hjalti"/>

<BeginningScene scene="s_HjaHestasveini"/>
</Body>
