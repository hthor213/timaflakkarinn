<?xml version="1.0" encoding="iso-8859-1"?>

<!DOCTYPE	Body			SYSTEM "scene.dtd" []>

<Body>
<!-- Flags for Tyrkjaran -->

<!-- Current scene on -->
<!-- 9 = Kot -->
<!-- 1 = UtanHusid -->
<!-- 2 = DansktHus -->
<!-- 3 = UtanDanskaHusid -->
<!-- 4 = Fjaran -->
<!-- 5 = Dekkid -->
<!-- 6 = Kaetan -->
<!-- 7 = UtanHelli -->
<!-- 8 = Innihellir -->
<ConditionFlag name="f_CurrentScene"/>
<SetFlagQuantum name="q_CurrentKot" flag="f_CurrentScene" value="9"/>
<SetFlagQuantum name="q_CurrentUtanHusid" flag="f_CurrentScene" value="1"/>
<SetFlagQuantum name="q_CurrentDansktHus" flag="f_CurrentScene" value="2"/>
<SetFlagQuantum name="q_CurrentUtanDanskaHusid" flag="f_CurrentScene" value="3"/>
<SetFlagQuantum name="q_CurrentFjaran" flag="f_CurrentScene" value="4"/>
<SetFlagQuantum name="q_CurrentDekkid" flag="f_CurrentScene" value="5"/>
<SetFlagQuantum name="q_CurrentKaetan" flag="f_CurrentScene" value="6"/>
<SetFlagQuantum name="q_CurrentUtanHelli" flag="f_CurrentScene" value="7"/>
<SetFlagQuantum name="q_CurrentInnihellir" flag="f_CurrentScene" value="8"/>

<!-- Askur taken or not -->
<!-- 0 = not taken -->
<!-- 1 = taken -->
<ConditionFlag name="f_AskurTaken"/>
<SetFlagQuantum name="q_AskurTaken1" flag="f_AskurTaken" value="1"/>
<SetFlagQuantum name="q_AskurTaken2" flag="f_AskurTaken" value="2"/>
<IncrementFlagQuantum name="q_AskurInc" flag="f_AskurTaken" />

<!-- Tappi taken or not -->
<!-- 0 = not taken -->
<!-- 1 = taken -->
<ConditionFlag name="f_TappiTaken"/>
<SetFlagQuantum name="q_TappiTaken1" flag="f_TappiTaken" value="1"/>

<!-- Sigrun tied or not (applies only in DansktHus) -->
<!-- 1 = tied -->
<!-- 0 = not tied -->
<ConditionFlag name="f_SigrunTied"/>
<SetFlagQuantum name="q_SigrunTied1" flag="f_SigrunTied" value="1"/>
<SetFlagQuantum name="q_SigrunTied0" flag="f_SigrunTied" value="0"/>

<!-- Sigrun played dead or not -->
<!-- 0 = has not played -->
<!-- 1 = has played -->
<ConditionFlag name="f_PlayDead"/>
<SetFlagQuantum name="q_PlayDead1" flag="f_PlayDead" value="1"/>

<!-- Batur sunken or not -->
<!-- 0 = not sunken -->
<!-- 1 = sunken -->
<ConditionFlag name="f_BaturTaken"/>
<SetFlagQuantum name="q_BaturTaken1" flag="f_BaturTaken" value="1"/>

<!-- Glerflaska taken or not -->
<!-- 0 = not taken -->
<!-- 1 = taken -->
<ConditionFlag name="f_GlerflaskaTaken"/>
<SetFlagQuantum name="q_GlerflaskaTaken1" flag="f_GlerflaskaTaken" value="1"/>

<!-- Las broken or not -->
<!-- 0 = not broken -->
<!-- 1 = broken -->
<ConditionFlag name="f_LasBroken"/>
<SetFlagQuantum name="q_LasBroken1" flag="f_LasBroken" value="1"/>

<!-- Halldora saved or not -->
<!-- 0 = not saved -->
<!-- 1 = saved -->
<ConditionFlag name="f_HalldoraSaved"/>
<SetFlagQuantum name="q_HalldoraSaved1" flag="f_HalldoraSaved" value="1"/>
<SetFlagQuantum name="q_HalldoraSaved2" flag="f_HalldoraSaved" value="2"/>

<!-- States of Steinn1-6 -->
<!-- 0 to 5 = not correct solution -->
<!-- 6 = correct solution -->
<ConditionFlag name="f_SteinnGame"/>
<IncrementFlagQuantum name="q_IncSteinnGame" flag="f_SteinnGame"/>
<DecrementFlagQuantum name="q_DecSteinnGame" flag="f_SteinnGame"/>
<SetFlagQuantum name="q_SteinnGame=3" flag="f_SteinnGame" value="3"/>

<!-- State of Steinn1 -->
<!-- 0 = in -->
<!-- 1 = cener -->
<!-- 2 = out -->
<ConditionFlag name="f_StateSteinn1"/>
<SetFlagQuantum name="q_StateSteinn1=0" flag="f_StateSteinn1" value="0"/>
<SetFlagQuantum name="q_StateSteinn1=1" flag="f_StateSteinn1" value="1"/>
<SetFlagQuantum name="q_StateSteinn1=2" flag="f_StateSteinn1" value="2"/>

<!-- State of Steinn2 -->
<!-- 0 = in -->
<!-- 1 = cener -->
<!-- 2 = out -->
<ConditionFlag name="f_StateSteinn2"/>
<SetFlagQuantum name="q_StateSteinn2=0" flag="f_StateSteinn2" value="0"/>
<SetFlagQuantum name="q_StateSteinn2=1" flag="f_StateSteinn2" value="1"/>
<SetFlagQuantum name="q_StateSteinn2=2" flag="f_StateSteinn2" value="2"/>

<!-- State of Steinn3 -->
<!-- 0 = in -->
<!-- 1 = cener -->
<!-- 2 = out -->
<ConditionFlag name="f_StateSteinn3"/>
<SetFlagQuantum name="q_StateSteinn3=0" flag="f_StateSteinn3" value="0"/>
<SetFlagQuantum name="q_StateSteinn3=1" flag="f_StateSteinn3" value="1"/>
<SetFlagQuantum name="q_StateSteinn3=2" flag="f_StateSteinn3" value="2"/>

<!-- State of Steinn4 -->
<!-- 0 = in -->
<!-- 1 = cener -->
<!-- 2 = out -->
<ConditionFlag name="f_StateSteinn4"/>
<SetFlagQuantum name="q_StateSteinn4=0" flag="f_StateSteinn4" value="0"/>
<SetFlagQuantum name="q_StateSteinn4=1" flag="f_StateSteinn4" value="1"/>
<SetFlagQuantum name="q_StateSteinn4=2" flag="f_StateSteinn4" value="2"/>

<!-- State of Steinn5 -->
<!-- 0 = in -->
<!-- 1 = cener -->
<!-- 2 = out -->
<ConditionFlag name="f_StateSteinn5"/>
<SetFlagQuantum name="q_StateSteinn5=0" flag="f_StateSteinn5" value="0"/>
<SetFlagQuantum name="q_StateSteinn5=1" flag="f_StateSteinn5" value="1"/>
<SetFlagQuantum name="q_StateSteinn5=2" flag="f_StateSteinn5" value="2"/>

<!-- State of Steinn6 -->
<!-- 0 = in -->
<!-- 1 = cener -->
<!-- 2 = out -->
<ConditionFlag name="f_StateSteinn6"/>
<SetFlagQuantum name="q_StateSteinn6=0" flag="f_StateSteinn6" value="0"/>
<SetFlagQuantum name="q_StateSteinn6=1" flag="f_StateSteinn6" value="1"/>
<SetFlagQuantum name="q_StateSteinn6=2" flag="f_StateSteinn6" value="2"/>

<ConditionFlag name="f_MomTalk"/>
<SetFlagQuantum name="q_MomTalk1" flag="f_MomTalk" value="1"/>

<ConditionFlag name="f_DHSec"/>
<SetFlagQuantum name="q_DHSec1" flag="f_DHSec" value="1"/>

<ConditionFlag name="f_ConvStrakur"/>
<SetFlagQuantum name="q_ConvStrakur1" flag="f_ConvStrakur" value="1"/>
<SetFlagQuantum name="q_ConvStrakur2" flag="f_ConvStrakur" value="2"/>

<ConditionFlag name="f_JohnDead"/>
<SetFlagQuantum name="q_JohnDead1" flag="f_JohnDead" value="1"/>

<ConditionFlag name="f_KaetaFirst"/>
<SetFlagQuantum name="q_KaetaFirst1" flag="f_KaetaFirst" value="1"/>

<ConditionFlag name="f_Random6"/>
<RandomSetFlagQuantum name="q_Randomize6" flag="f_Random6" low="0" high="5"/>

<ConditionFlag name="f_Random10"/>
<RandomSetFlagQuantum name="q_Randomize10" flag="f_Random10" low="0" high="9"/>

<ConditionFlag name="f_Random5"/>
<RandomSetFlagQuantum name="q_Randomize5" flag="f_Random5" low="0" high="4"/>

<ConditionFlag name="f_Random4"/>
<RandomSetFlagQuantum name="q_Randomize4" flag="f_Random4" low="0" high="3"/>

<ConditionFlag name="f_Random7"/>
<RandomSetFlagQuantum name="q_Randomize7" flag="f_Random7" low="0" high="6"/>

<ConditionFlag name="f_Zero"/>

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

<StaticActorFace name="af_BigInventory" file="\tyrkjarA\Graphic\InventoA\inventoA" prepare="true"/>
<StaticActor name="a_BigInventory" terrain="t_InventoryBack" x="0" y="-1" z="-1" state="stop">
	<State name="stop" face="af_BigInventory"/>
</StaticActor>
<PrepareQuantum	name="qp_Inventory" object="af_BigInventory" prepare="true"/>
<PrepareQuantum	name="qu_Inventory" object="af_BigInventory" prepare="false"/>

<StaticActorFace name="af_iKadall" file="\TyrkjarA\Graphic\utanhusA\iKadall" prepare="true"/>
<StaticActorFace name="af_i2Reipi" file="\TyrkjarA\Graphic\utanhusA\i2reipi" prepare="true"/>
<StaticActorFace name="af_iDansktReipi" file="\TyrkjarA\Graphic\DansktHA\iDansktA" prepare="true"/>
<StaticActorFace name="af_iPrik" file="\TyrkjarA\Graphic\DansktHA\iPrik" prepare="true"/>
<StaticActorFace name="af_iPrikOgReipi" file="\TyrkjarA\Graphic\DansktHA\iPrikOgA" prepare="true"/>
<StaticActorFace name="af_iKubein" file="\TyrkjarA\Graphic\DansktHA\iKubein" prepare="true"/>
<StaticActorFace name="af_iGlerflaska" file="\TyrkjarA\Graphic\Dekkid\iGlerflA" prepare="true"/>
<StaticActorFace name="af_iFloskuBrot" file="\TyrkjarA\Graphic\Dekkid\iFloskuA" prepare="true"/>
<StaticActorFace name="af_iEdalsteinn" file="\TyrkjarA\Graphic\Dekkid\iEdalstA" prepare="true"/>
<StaticActorFace name="af_iBrot1" file="\TyrkjarA\Graphic\Dekkid\iBrot1" prepare="true"/>
<StaticActorFace name="af_iFlaska" file="\TyrkjarA\Graphic\Fjaran\iFlaska" prepare="true"/>
<StaticActorFace name="af_iFloskuskeyti" file="\TyrkjarA\Graphic\Fjaran\iFloskuA" prepare="true"/>
<StaticActorFace name="af_iTimaSteinn" file="\TyrkjarA\Graphic\innihelA\iTimaStA" prepare="true"/>
<StaticActorFace name="af_iTimaSteinnSulta" file="\TyrkjarA\Graphic\innihelA\iTimaStB" prepare="true"/>
<StaticActorFace name="af_iBrotSulta" file="\TyrkjarA\Graphic\dekkid\iBrotsuA" prepare="true"/>
<StaticActorFace name="af_iTyrknesktReipi" file="\TyrkjarA\Graphic\Kaetan\iTyrkneA" prepare="true"/>
<StaticActorFace name="af_iTappi" file="\TyrkjarA\Graphic\Kot\iTappi" prepare="true"/>
<StaticActorFace name="af_iTunna" file="\TyrkjarA\Graphic\Kot\iTunna" prepare="true"/>
<StaticActorFace name="af_iTunnaMedTappa" file="\TyrkjarA\Graphic\Kot\iTunnaMA" prepare="true"/>
<StaticActorFace name="af_iAskur" file="\TyrkjarA\Graphic\Kot\iAskur" prepare="true"/>
<StaticActorFace name="af_iSkeid" file="\TyrkjarA\Graphic\Kot\iSkeid" prepare="true"/>
<StaticActorFace name="af_iBraud" file="\TyrkjarA\Graphic\Kot\iBraud" prepare="true"/>

<UpdateQuantum name="q_UpdateInventory" terrain="t_Inventory" show="true"/>

<!-- Black screen -->
<Scene name="s_Black"/>

<SimplePseudo3DTerrain name="t_Black" scene="s_Black" polygon="p_All" zmin="-7" zmax="0"/>

<PauseQuantum name="q_4sec" time="2500"/>

<ScrollingScene name="s_Kot" width="1200" height="600"/>

<Polygon name="p_Kot">
	<Point x="0" y="601"/>
	<Point x="0" y="370"/>
	<Point x="390" y="370"/>
	<Point x="410" y="415"/>
	<Point x="560" y="415"/>
	<Point x="600" y="395"/>
	<Point x="765" y="395"/>
	<Point x="1200" y="601"/>
</Polygon>

<!-- Background music -->
<JMFActorMouth name="m_Adallag" file="\TyrkjarA\Media\4_000.wav" repeat="true" prepare="true"/>
<FadeQuantum name="qf_Adallag" mouth="m_Adallag" goal="0.45" speed="0"/>
<PrepareQuantum name="qp_Adallag" object="m_Adallag" prepare="true"/>
<StaticActor name="a_Adallag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Adallag"/> </StaticActor>
<StateQuantum name="q_Adallag_stop" actor="a_Adallag" state="stop" wait="false"/>
<StateQuantum name="q_Adallag_play" actor="a_Adallag" state="play" wait="false"/>

<SimplePseudo3DTerrain name="t_Kot" scene="s_Kot" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_Kotl" scene="s_Kot" polygon="p_Kot"
	zmin="-1" zmax="1500" defaultscaling="1.0" scaling2="0.75" scanline1="600" scanline2="385"/>

<!-- Background for Kot -->
<StaticActorFace name="af_Kot1" file="\TyrkjarA\Graphic\Kot\Kot1"/>
<StaticActor name="a_Kot1" terrain="t_Kot" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Kot1"/> </StaticActor>
<StaticActorFace name="af_Kot2" file="\TyrkjarA\Graphic\Kot\Kot2"/>
<StaticActor name="a_Kot2" terrain="t_Kot" x="800" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Kot2"/> </StaticActor>
<PrepareQuantum name="qp_Kot1" object="af_Kot1" prepare="true"/>
<PrepareQuantum name="qu_Kot1" object="af_Kot1" prepare="false"/>
<PrepareQuantum name="qp_Kot2" object="af_Kot2" prepare="true"/>
<PrepareQuantum name="qu_Kot2" object="af_Kot2" prepare="false"/>

<!-- Bord -->
<Pseudo3DCollisionBox name="cb_Bord" x="377" y="110" z="313"/>
<StaticActorFace name="af_Bord" file="\TyrkjarA\Graphic\Kot\Bord" />
<StaticActor name="a_Bord" terrain="t_Kotl" x="189" y="544" z="0" state="stop">
	<State name="stop" face="af_Bord" collisionbox="cb_Bord"/> </StaticActor>
<PrepareQuantum name="qp_Kot3" object="af_Bord" prepare="true"/>
<PrepareQuantum name="qu_Kot3" object="af_Bord" prepare="false"/>

<!-- Trog -->
<Pseudo3DCollisionBox name="cb_Trog" x="114" y="20" z="131"/>
<StaticActorFace name="af_Trog" file="\TyrkjarA\Graphic\Kot\Trog" />
<StaticActor name="a_Trog" terrain="t_Kotl" x="850" y="473" z="0" state="stop" random="true">
	<State name="stop" face="af_Trog" collisionbox="cb_Trog"/>
	<State name="taken" face="af_Trog"/> </StaticActor>
<StateQuantum name="q_Trog_taken" actor="a_Trog" state="taken"/>
<PrepareQuantum name="qp_Kot4" object="af_Trog" prepare="true"/>
<PrepareQuantum name="qu_Kot4" object="af_Trog" prepare="false"/>

<!-- OpinHurd -->
<StaticActorFace name="af_OpinHurd" file="\TyrkjarA\Graphic\Kot\OpinHurd"/>
<StaticActor name="a_OpinHurd" x="913" y="600" z="490" state="stop" save="true">
	<State name="stop" face="af_OpinHurd"/> </StaticActor>
<MoveActorQuantum name="q_MoveOpinHurd2Kot" actor="a_OpinHurd" terrain="t_Kotl"/>
<MoveActorQuantum name="q_MoveOpinHurd" actor="a_OpinHurd"/>
<PrepareQuantum name="qp_Kot5" object="af_OpinHurd" prepare="true"/>
<PrepareQuantum name="qu_Kot5" object="af_OpinHurd" prepare="false"/>

<!-- Thump -->
<JMFActorMouth name="m_Thump" file="\TyrkjarA\Media\Sfx\Thump.wav" prepare="true"/>
<StaticActor name="a_Thump" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Thump"/> </StaticActor>
<StateQuantum name="q_Thump_play" actor="a_Thump" state="play" wait="false"/>

<!-- Tappi -->
<StaticActorFace name="af_Tappi" file="\TyrkjarA\Graphic\Kot\Tappi"/>
<StaticActorFace name="af_uTappi" file="\TyrkjarA\Graphic\Kot\uTappi" prepare="true"/>
<StaticActor name="a_Tappi" terrain="t_Kotl" x="709" y="430" z="20" state="stop" save="true" random="true">
	<State name="stop" face="af_Tappi"/>
	<State name="use" face="af_uTappi"/>
	<State name="taken" face="af_iTappi"/> </StaticActor>
<StateQuantum name="q_Tappi_taken" actor="a_Tappi" state="taken"/>
<PrepareQuantum name="qp_Kot6" object="af_Tappi" prepare="true"/>
<PrepareQuantum name="qu_Kot6" object="af_Tappi" prepare="false"/>

<!-- Tunna -->
<Pseudo3DCollisionBox name="cb_Tunna" x="127" y="20" z="144"/>
<StaticActorFace name="af_Tunna" file="\TyrkjarA\Graphic\Kot\Tunna"/>
<StaticActorFace name="af_uTunna" file="\TyrkjarA\Graphic\Kot\uTunna" prepare="true"/>
<StaticActor name="a_Tunna" terrain="t_Kotl" x="700" y="420" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Tunna" collisionbox="cb_Tunna" />
	<State name="use" face="af_uTunna" />
	<State name="taken" face="af_iTunna"/> </StaticActor>
<StateQuantum name="q_Tunna_taken" actor="a_Tunna" state="taken"/>
<PrepareQuantum name="qp_Kot7" object="af_Tunna" prepare="true"/>
<PrepareQuantum name="qu_Kot7" object="af_Tunna" prepare="false"/>

<!-- TunnaLekur -->
<JMFActorMouth name="m_TunnaLekur" file="\TyrkjarA\Media\Sfx\Spill.wav" prepare="true"/>
<CelledAnimated2DActorFace name="af_TunnaLekur" count="5" repeat="1" speed="250" file="\TyrkjarA\AnimatiA\TunnaLeA\TunnaLeA"/>
<StaticActorFace name="af_TunnaLekur2" file="\TyrkjarA\AnimatiA\TunnaleA\TunnaLeB"/>
<StaticActor name="a_TunnaLekur" terrain="t_Kotl" x="555" y="381" z="-15" state="none" save="true">
	<State name="go" face="af_TunnaLekur" mouth="m_TunnaLekur"/>
	<State name="stop" face="af_TunnaLekur2"/>
	</StaticActor>
<StateQuantum name="q_TunnaLekur_go" actor="a_TunnaLekur" state="go"/>
<StateQuantum name="q_TunnaLekur_stop" actor="a_TunnaLekur" state="stop"/>
<PrepareQuantum name="qp_Kot8" object="af_TunnaLekur" prepare="true"/>
<PrepareQuantum name="qu_Kot8" object="af_TunnaLekur" prepare="false"/>
<PrepareQuantum name="qp_Kot13" object="af_TunnaLekur2" prepare="true"/>
<PrepareQuantum name="qu_Kot13" object="af_TunnaLekur2" prepare="false"/>

<!-- TunnaMedTappa -->
<StaticActorFace name="af_uTunnaMedTappa" file="\TyrkjarA\Graphic\Kot\uTunnaMA" prepare="true"/>
<StaticActor name="a_TunnaMedTappa" x="700" y="420" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_iTunnaMedTappa"/>
	<State name="use" face="af_uTunnaMedTappa"/> </StaticActor>

<!-- Askur (with spoon when not taken) -->
<StaticActorFace name="af_Askur" file="\TyrkjarA\Graphic\Kot\Askur"/>
<StaticActorFace name="af_uAskur" file="\TyrkjarA\Graphic\Kot\uAskur" prepare="true"/>
<StaticActor name="a_Askur" terrain="t_Kotl" x="196" y="151" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Askur"/>
	<State name="use" face="af_uAskur"/>
	<State name="taken" face="af_iAskur"/> </StaticActor>
<StateQuantum name="q_Askur_taken" actor="a_Askur" state="taken"/>
<PrepareQuantum name="qp_Kot9" object="af_Askur" prepare="true"/>
<PrepareQuantum name="qu_Kot9" object="af_Askur" prepare="false"/>

<!-- Skeid -->
<StaticActorFace name="af_uSkeid" file="\TyrkjarA\Graphic\Kot\uSkeid" prepare="true"/>
<StaticActor name="a_Skeid" x="196" y="151" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_iSkeid"/>
	<State name="use" face="af_uSkeid"/> </StaticActor>

<!-- Brauð -->
<StaticActorFace name="af_Braud" file="\TyrkjarA\Graphic\Kot\Braud" />
<StaticActorFace name="af_uBraud" file="\TyrkjarA\Graphic\Kot\uBraud" prepare="true"/>
<StaticActor name="a_Braud" terrain="t_Kotl" x="129" y="186" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Braud"/>
	<State name="use" face="af_uBraud"/>
	<State name="taken" face="af_iBraud"/> </StaticActor>
<StateQuantum name="q_Braud_taken" actor="a_Braud" state="taken"/>
<PrepareQuantum name="qp_Kot10" object="af_Braud" prepare="true"/>
<PrepareQuantum name="qu_Kot10" object="af_Braud" prepare="false"/>

<!-- KotHurd -->
<TransparentActorFace name="af_KotHurd" width="111" height="370"/>
<StaticActor name="a_KotHurd" terrain="t_Kot" x="996" y="139" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_KotHurd"/> </StaticActor>

<!-- KotAskur1 -->
<TransparentActorFace name="af_KotAskur1" width="62" height="29"/>
<StaticActor name="a_KotAskur1" terrain="t_Kotl" x="129" y="128" z="0" state="stop" random="true">
	<State name="stop" face="af_KotAskur1"/> </StaticActor>

<!-- KotAskur2 -->
<TransparentActorFace name="af_KotAskur2" width="65" height="25"/>
<StaticActor name="a_KotAskur2" terrain="t_Kotl" x="225" y="118" z="0" state="stop" random="true">
	<State name="stop" face="af_KotAskur2"/> </StaticActor>

<!-- KotKrus1 -->
<TransparentActorFace name="af_KotKrus1" width="37" height="40"/>
<StaticActor name="a_KotKrus1" terrain="t_Kotl" x="268" y="165" z="0" state="stop" random="true">
	<State name="stop" face="af_KotKrus1"/> </StaticActor>

<!-- KotSkal1 -->
<TransparentActorFace name="af_KotSkal1" width="37" height="26"/>
<StaticActor name="a_KotSkal1" terrain="t_Kotl" x="256" y="258" z="30" state="stop" random="true">
	<State name="stop" face="af_KotSkal1"/> </StaticActor>

<!-- KotPokar1 -->
<TransparentActorFace name="af_KotPokar1" width="152" height="187"/>
<StaticActor name="a_KotPokar1" terrain="t_Kotl" x="401" y="220" z="0" state="stop" random="true">
	<State name="stop" face="af_KotPokar1"/> </StaticActor>

<!-- KotTunnur1 -->
<TransparentActorFace name="af_KotTunnur1" width="189" height="133"/>
<StaticActor name="a_KotTunnur1" terrain="t_Kotl" x="595" y="242" z="0" state="stop" random="true">
	<State name="stop" face="af_KotTunnur1"/> </StaticActor>

<!-- KotGluggi1 -->
<TransparentActorFace name="af_KotGluggi1" width="53" height="112"/>
<StaticActor name="a_KotGluggi1" terrain="t_Kotl" x="803" y="140" z="0" state="stop" random="true">
	<State name="stop" face="af_KotGluggi1"/> </StaticActor>

<SimplePseudo3DTerrain name="t_Corners" scene="s_Kot" polygon="p_All"
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
<StaticActor name="a_SmallInventory" terrain="t_Corners" x="701" y="900" z="900" state="stop">
	<State name="stop" face="af_SmallInventory"/>
</StaticActor>

<Text name="a_Text" text=" " color="white" terrain="t_Corners" hilite="false"/>

<StateController name="sc"
	stateactor="a_States"
	inventoryactor="a_SmallInventory"
	inventory="s_Inventory"
	textactor="a_Text"/>
<!-- Let's register those who were made before the statecontroller -->
<ActorMoused actor="a_SmallInventory" listener="sc"/>

<SwitchStateQuantum name="q_Moving" state="Moving" controller="sc"/>
<SwitchStateQuantum name="q_Taking" state="Taking" controller="sc"/>
<SwitchStateQuantum name="q_Looking" state="Looking" controller="sc"/>
<SwitchStateQuantum name="q_Talking" state="Talking" controller="sc"/>
<SwitchStateQuantum name="q_Freeze" state="Freeze" controller="sc"/>
<SwitchStateQuantum name="q_Using" state="Using" controller="sc"/>
<SwitchStateQuantum name="q_Conversating" state="Conversating" controller="sc"/>

<ActorMoused actor="a_Askur" listener="sc" moving="Askur" thf="ask"/>
<ActorMoused actor="a_Skeid" listener="sc" moving="Skeið" thf="skeið"/>
<ActorMoused actor="a_Tappi" listener="sc" moving="Tappi" thf="tappa"/>
<ActorMoused actor="a_Tunna" listener="sc" moving="Tunna" thf="tunnu"/>
<ActorMoused actor="a_TunnaMedTappa" listener="sc" moving="Tunna" thf="tunnu"/>
<ActorMoused actor="a_Braud" listener="sc" moving="Brauð" thf="brauð"/>
<ActorMoused actor="a_KotHurd" listener="sc" moving="Hurð" thf="hurð" taking="Opna dyr"/>

<ActorMoused actor="a_KotAskur1" listener="sc" moving="Askurinn hennar mömmu" thf="askinn hennar mömmu"/>
<ActorMoused actor="a_KotAskur2" listener="sc" moving="Askurinn hennar Halldóru" thf="askinn hennar Halldóru"/>
<ActorMoused actor="a_KotKrus1" listener="sc" moving="Krús" thf="krús"/>
<ActorMoused actor="a_KotSkal1" listener="sc" moving="Skál" thf="skál"/>
<ActorMoused actor="a_KotPokar1" listener="sc" moving="Pokar" thf="poka"/>
<ActorMoused actor="a_KotTunnur1" listener="sc" moving="Tunnur" thf="tunnur"/>
<ActorMoused actor="a_KotGluggi1" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>
<ActorMoused actor="a_Trog" listener="sc" moving="Trog" thf="trog"/>

<Text name="a_Halldora_acc" terrain="t_Corners" text=" " color="green" hilite="false"/>

<ScrollingScene name="s_UtanHusid" width="1600" height="600"/>

<Polygon name="p_UtanHusid">
	<Point x="-200" y="600"/>
	<Point x="-200" y="500"/>
	<Point x="80" y="500"/>
	<Point x="200" y="535"/>
	<Point x="400" y="460"/>
	<Point x="510" y="410"/>
	<Point x="700" y="330"/>
	<Point x="1340" y="330"/>
	<Point x="1450" y="490"/>
	<Point x="1800" y="490"/>
	<Point x="1800" y="600"/>
</Polygon>

<SimplePseudo3DTerrain name="t_UtanHusid" scene="s_UtanHusid" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="0.6"/>
<SimplePseudo3DTerrain name="t_UtanHusidl" scene="s_UtanHusid" polygon="p_UtanHusid"
	zmin="-1" zmax="1500" defaultscaling="0.6" scaling2="0.5" scanline1="520" scanline2="320"/>

<!-- Background for UtanHusid -->
<StaticActorFace name="af_UtanHusid1" file="\TyrkjarA\Graphic\UtanHusA\UtanHusA"/>
<StaticActor name="a_UtanHusid1" terrain="t_UtanHusid" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_UtanHusid1"/> </StaticActor>
<StaticActorFace name="af_UtanHusid2" file="\TyrkjarA\Graphic\UtanHusA\UtanHusB"/>
<StaticActor name="a_UtanHusid2" terrain="t_UtanHusid" x="800" y="-2" z="-2" state="stop">
	<State name="stop" face="af_UtanHusid2"/> </StaticActor>
<PrepareQuantum name="qp_UtanHusid1" object="af_UtanHusid1" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid1" object="af_UtanHusid1" prepare="false"/>
<PrepareQuantum name="qp_UtanHusid2" object="af_UtanHusid2" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid2" object="af_UtanHusid2" prepare="false"/>

<!-- BundnirMenn -->
<StaticActorFace name="af_BundnirMenn_stop" file="\TyrkjarA\AnimatiA\BundnirA\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_BundnirMennTalk" file="\TyrkjarA\AnimatiA\BundnirA\talk" repeat="-1" count="2" speed="150" prepare="false"/>
<SpeechActorMouth name="m_Hjalp1" file="\TyrkjarA\Media\nonames\hjalp2.wav" acc="a_Halldora_acc">
	<Sentence text=" " time="0"/> </SpeechActorMouth>
<Pseudo3DCollisionBox name="cb_BundnirMenn" x="234" y="50" z="147"/>
<StaticActor name="a_BundnirMenn" x="1084" y="423" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_BundnirMenn_stop" collisionbox="cb_BundnirMenn"/>
	<State name="talk" face="af_BundnirMennTalk" collisionbox="cb_BundnirMenn" mouth="m_Hjalp1"/> </StaticActor>
<MoveActorQuantum name="q_MoveBundnirMenn2UtanHusid" actor="a_BundnirMenn" terrain="t_UtanHusidl"/>
<MoveActorQuantum name="qh_BundnirMenn" actor="a_BundnirMenn" />
<StateQuantum name="q_BundnirMenn_Stop" actor="a_BundnirMenn" state="stop" wait="false"/>
<StateQuantum name="q_BundnirMenn_Talk" actor="a_BundnirMenn" state="talk" wait="true"/>
<PrepareQuantum name="qp_UtanHusid3" object="af_BundnirMenn_stop" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid3" object="af_BundnirMenn_stop" prepare="false"/>
<PrepareQuantum name="qp_UtanHusid4" object="af_BundnirMennTalk" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid4" object="af_BundnirMennTalk" prepare="false"/>
<ActorMoused listener="sc" actor="a_BundnirMenn" moving="Bundnir menn" thf="bundna menn" taking="Leysa bundna menn"/>

<!-- DansktReipi -->
<StaticActorFace name="af_Kadall" file="\TyrkjarA\Graphic\utanhusA\Kadall" prepare="false"/>
<StaticActorFace name="af_uKadall" file="\TyrkjarA\Graphic\utanhusA\uKadall" prepare="true"/>
<Pseudo3DCollisionBox name="cb_Kadall" x="181" y="90" z="58"/>
<StaticActor name="a_Kadall" x="1084" y="423" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Kadall" collisionbox="cb_Kadall"/>
	<State name="taken" face="af_iKadall"/>
	<State name="use" face="af_uKadall"/>
</StaticActor>
<StateQuantum name="q_Kadall_taken" actor="a_Kadall" state="taken"/>
<ActorMoused actor="a_Kadall" listener="sc" moving="Kaðall" thf="kaðal"/>
<MoveActorQuantum name="qs_Kadall" actor="a_Kadall" terrain="t_UtanHusidl"/>
<MoveActorQuantum name="qh_Kadall" actor="a_Kadall" />
<MoveActorQuantum name="q_MoveKadall2Inventory" actor="a_Kadall" terrain="t_Inventory"/>
<PrepareQuantum name="qp_UtanHusid5" object="af_Kadall" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid5" object="af_Kadall" prepare="false"/>

<StaticActorFace name="af_u2Reipi" file="\TyrkjarA\Graphic\utanhusA\u2reipi" prepare="true"/>
<StaticActor name="a_2Reipi" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_i2Reipi"/>
	<State name="use" face="af_u2Reipi"/>
</StaticActor>
<ActorMoused actor="a_2Reipi" listener="sc" moving=" " thf="langt reipi"/>
<MoveActorQuantum name="q_Move2Reipi2Inventory" actor="a_2Reipi" terrain="t_Inventory"/>

<CelledAnimated2DActorFace name="af_BundinnMadur1" file="\TyrkjarA\AnimatiA\BundnirA\flyja1" repeat="1" count="4" speed="150" prepare="false"/>
<CelledAnimated2DActorFace name="af_Sky1" file="\TyrkjarA\AnimatiA\BundnirA\sky1" repeat="2" count="1" speed="150" prepare="false" xoffset="-25" yoffset="20"/>
<MovingActor name="a_BundinnMadur1" x="1117" y="322" z="100" state="none" save="true">
	<State name="flyja" face="af_BundinnMadur1"/>
	<State name="sky" face="af_Sky1"/> </MovingActor>
<StateQuantum name="q_BundinnMadur1Flyr" actor="a_BundinnMadur1" state="flyja" wait="true"/>
<StateQuantum name="q_BundinnMadur1Flyr2" actor="a_BundinnMadur1" state="sky" wait="true"/>
<MoveActorQuantum name="qh_BundinnMadur1" actor="a_BundinnMadur1" />
<MoveActorQuantum name="qs_BundinnMadur1" actor="a_BundinnMadur1" terrain="t_UtanHusidl"/>
<PrepareQuantum name="qp_UtanHusid6" object="af_BundinnMadur1" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid6" object="af_BundinnMadur1" prepare="false"/>
<PrepareQuantum name="qp_UtanHusid7" object="af_Sky1" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid7" object="af_Sky1" prepare="false"/>

<CelledAnimated2DActorFace name="af_BundinnMadur2" file="\TyrkjarA\AnimatiA\BundnirA\flyja2" repeat="1" count="4" speed="150" prepare="false"/>
<CelledAnimated2DActorFace name="af_Sky2" file="\TyrkjarA\AnimatiA\BundnirA\sky2" repeat="2" count="1" speed="150" prepare="false" xoffset="-25" yoffset="20"/>
<MovingActor name="a_BundinnMadur2" x="954" y="307" z="100" state="none" save="true">
	<State name="flyja" face="af_BundinnMadur2"/>
	<State name="sky" face="af_Sky2"/> </MovingActor>
<StateQuantum name="q_BundinnMadur2Flyr" actor="a_BundinnMadur2" state="flyja" wait="false"/>
<StateQuantum name="q_BundinnMadur2Flyr2" actor="a_BundinnMadur2" state="sky" wait="false"/>
<MoveActorQuantum name="qh_BundinnMadur2" actor="a_BundinnMadur2" />
<MoveActorQuantum name="qs_BundinnMadur2" actor="a_BundinnMadur2" terrain="t_UtanHusidl"/>
<PrepareQuantum name="qp_UtanHusid8" object="af_BundinnMadur2" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid8" object="af_BundinnMadur2" prepare="false"/>
<PrepareQuantum name="qp_UtanHusid9" object="af_Sky2" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid9" object="af_Sky2" prepare="false"/>

<!-- Tyrki1 -->
<StaticActorFace name="af_Tyrki1" file="\TyrkjarA\Graphic\UtanHusA\Tyrki" prepare="false"/>
<CelledAnimated2DActorFace name="af_Tyrki1_left" repeat="-1" file="\TyrkjarA\Graphic\UtanHusA\left" count="8" prepare="false"/>
<MovingActor name="a_Tyrki1" terrain="t_UtanHusid" x="1100" y="300" z="0" state="stop" speed="80" save="true">
	<State name="stop" face="af_Tyrki1"/>
	<State name="left" face="af_Tyrki1_left"/>
</MovingActor>
<StateQuantum name="q_Tyrki1Stop" actor="a_Tyrki1" state="stop" wait="false"/>
<MoveActorQuantum name="q_MoveTyrki1" actor="a_Tyrki1"/>
<PrepareQuantum name="qp_UtanHusid10" object="af_Tyrki1" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid10" object="af_Tyrki1" prepare="false"/>
<PrepareQuantum name="qp_UtanHusid11" object="af_Tyrki1_left" prepare="true"/>
<PrepareQuantum name="qu_UtanHusid11" object="af_Tyrki1_left" prepare="false"/>

<!-- UtiHurd -->
<TransparentActorFace name="af_UtiHurd" width="90" height="142"/>
<StaticActor name="a_UtiHurd" terrain="t_UtanHusid" x="406" y="257" z="0" state="stop" random="true">
	<State name="stop" face="af_UtiHurd"/> </StaticActor>
<ActorMoused actor="a_UtiHurd" listener="sc" moving="Hurð" thf="hurð" taking="Opna dyr"/>

<!-- Hot spot for moving to UtanHelli -->
<TransparentActorFace name="af_UtanHusid2UtanHelli" width="200" height="144"/>
<StaticActor name="ta_UtanHusid2UtanHelli" x="0" y="956" z="500" state="stop" terrain="t_UtanHusidl">
	<State name="stop" face="af_UtanHusid2UtanHelli"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_UtanHusid2UtanHelli" moving="Til kletta" taking=" " looking="Til kletta" talking=" "/>
<Pseudo3DCollisionBox name="cb_UtanHusid2UtanHelli" x="10" y="60" z="10"/>
<StaticActor name="a_UtanHusid2UtanHelli" x="198" y="567" z="1" state="stop" collision="ac_UtanHusid2UtanHelli" terrain="t_UtanHusidl">
	<State name="stop" collisionbox="cb_UtanHusid2UtanHelli"/> </StaticActor>
<MoveActorQuantum name="q_MoveUtanHusid2UtanHelliIn" actor="a_UtanHusid2UtanHelli" terrain="t_UtanHusidl"/>
<MoveActorQuantum name="q_MoveUtanHusid2UtanHelliOut" actor="a_UtanHusid2UtanHelli"/>

<!-- Hot spot for moving to UtanDanskaHusid -->
<TransparentActorFace name="af_UtanHusid2UtanDanskaHusid" width="180" height="153"/>
<StaticActor name="ta_UtanHusid2UtanDanskaHusid" terrain="t_UtanHusidl" x="1419" y="600" z="154" state="stop">
	<State name="stop" face="af_UtanHusid2UtanDanskaHusid"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_UtanHusid2UtanDanskaHusid" moving="Til dönsku húsanna" taking=" " looking=" " talking=" "/>
<Pseudo3DCollisionBox name="cb_UtanHusid2UtanDanskaHusid" x="100" y="100" z="10"/>
<StaticActor name="a_UtanHusid2UtanDanskaHusid" terrain="t_UtanHusidl" x="1545" y="545" z="0" state="stop" collision="ac_UtanHusid2UtanDanskaHusid">
	<State name="stop" collisionbox="cb_UtanHusid2UtanDanskaHusid"/> </StaticActor>
<MoveActorQuantum name="q_MoveUtanHusid2UtanDanskaHusidIn" actor="a_UtanHusid2UtanDanskaHusid" terrain="t_UtanHusidl"/>
<MoveActorQuantum name="q_MoveUtanHusid2UtanDanskaHusidOut" actor="a_UtanHusid2UtanDanskaHusid"/>

<!-- DOp1 -->
<TransparentActorFace name="af_UHGluggi1" width="66" height="77"/>
<StaticActor name="a_UHGluggi1" terrain="t_UtanHusidl" x="282" y="293" z="0" state="stop" random="true">
	<State name="stop" face="af_UHGluggi1"/> </StaticActor>
<ActorMoused actor="a_UHGluggi1" listener="sc" moving="Gluggi" thf="glugga"/>

<!-- DOp1 -->
<TransparentActorFace name="af_UHGluggi2" width="50" height="67"/>
<StaticActor name="a_UHGluggi2" terrain="t_UtanHusidl" x="538" y="211" z="0" state="stop" random="true">
	<State name="stop" face="af_UHGluggi2"/> </StaticActor>
<ActorMoused actor="a_UHGluggi2" listener="sc" moving="Gluggi" thf="glugga"/>

<!-- DOp1 -->
<TransparentActorFace name="af_UHKot1" width="136" height="43"/>
<StaticActor name="a_UHKot1" terrain="t_UtanHusidl" x="1088" y="58" z="0" state="stop" random="true">
	<State name="stop" face="af_UHKot1"/> </StaticActor>
<ActorMoused actor="a_UHKot1" listener="sc" moving="Kot" thf="kot"/>

<TransparentActorFace name="af_UHKjarr" width="233" height="147"/>
<StaticActor name="a_UHKjarr" terrain="t_UtanHusidl" x="1366" y="141" z="0" state="stop" random="true">
	<State name="stop" face="af_UHKjarr"/> </StaticActor>
<ActorMoused actor="a_UHKjarr" listener="sc" moving="Kjarr" thf="kjarr"/>
<ScrollingScene name="s_DansktHus" width="1200" height="600"/>

<Polygon name="p_DansktHus">
	<Point x="520" y="430"/>
	<Point x="760" y="430"/>
	<Point x="900" y="430"/>
	<Point x="1060" y="500"/>
	<Point x="1060" y="530"/>
	<Point x="390" y="530"/>
</Polygon>

<SimplePseudo3DTerrain name="t_DansktHus" scene="s_DansktHus" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_DansktHusl" scene="s_DansktHus" polygon="p_DansktHus"
	zmin="-1" zmax="1500" defaultscaling="1.0" scaling2="0.82" scanline1="600" scanline2="420"/>

<!-- Background for DansktHus -->
<StaticActorFace name="af_DansktHus1" file="\TyrkjarA\Graphic\DansktHA\DansktHA"/>
<StaticActor name="a_DansktHus1" terrain="t_DansktHus" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_DansktHus1"/> </StaticActor>
<PrepareQuantum name="qp_DansktHus1" object="af_DansktHus1" prepare="true"/>
<PrepareQuantum name="qu_DansktHus1" object="af_DansktHus1" prepare="false"/>
<StaticActorFace name="af_DansktHus2" file="\TyrkjarA\Graphic\DansktHA\DansktHB"/>
<StaticActor name="a_DansktHus2" terrain="t_DansktHus" x="800" y="-2" z="-2" state="stop">
	<State name="stop" face="af_DansktHus2"/> </StaticActor>
<PrepareQuantum name="qp_DansktHus10" object="af_DansktHus2" prepare="true"/>
<PrepareQuantum name="qu_DansktHus10" object="af_DansktHus2" prepare="false"/>

<!-- PokarOgFata -->
<StaticActorFace name="af_PokarOgFata" file="\TyrkjarA\Graphic\DansktHA\PokarOgA" />
<StaticActor name="a_PokarOgFata" terrain="t_DansktHusl" x="968" y="600" z="178" state="stop" random="true">
	<State name="stop" face="af_PokarOgFata"/> </StaticActor>
<ActorMoused listener="sc" actor="a_PokarOgFata" moving="Pokar og fata" thf="poka og fötu"/>
<PrepareQuantum name="qp_DansktHus2" object="af_PokarOgFata" prepare="true"/>
<PrepareQuantum name="qu_DansktHus2" object="af_PokarOgFata" prepare="false"/>

<!-- DonskTunna -->
<StaticActorFace name="af_DonskTunna" file="\TyrkjarA\Graphic\DansktHA\DonskTuA" />
<StaticActor name="a_DonskTunna" terrain="t_DansktHusl" x="200" y="600" z="184" state="stop" random="true">
	<State name="stop" face="af_DonskTunna"/> </StaticActor>
<ActorMoused listener="sc" actor="a_DonskTunna" moving="Tunna" thf="tunnu"/>
<PrepareQuantum name="qp_DansktHus3" object="af_DonskTunna" prepare="true"/>
<PrepareQuantum name="qu_DansktHus3" object="af_DonskTunna" prepare="false"/>

<!-- DansktReipi -->
<StaticActorFace name="af_DansktReipi" file="\TyrkjarA\Graphic\DansktHA\DansktRA" />
<StaticActorFace name="af_uDansktReipi" file="\TyrkjarA\Graphic\DansktHA\uDansktA" prepare="true"/>
<Pseudo3DCollisionBox name="cb_DansktReipi" x="100" y="40" z="40"/>
<StaticActor name="a_DansktReipi" x="800" y="470" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_DansktReipi" collisionbox="cb_DansktReipi"/>
	<State name="taken" face="af_iDansktReipi"/>
	<State name="use" face="af_uDansktReipi"/>
</StaticActor>
<StateQuantum name="q_DansktReipi_taken" actor="a_DansktReipi" state="taken"/>
<ActorMoused actor="a_DansktReipi" listener="sc" moving="Reipi" thf="reipi"/>
<MoveActorQuantum name="q_MoveDansktReipi2DansktHus" actor="a_DansktReipi" terrain="t_DansktHusl"/>
<PrepareQuantum name="qp_DansktHus4" object="af_DansktReipi" prepare="true"/>
<PrepareQuantum name="qu_DansktHus4" object="af_DansktReipi" prepare="false"/>

<!-- Prik -->
<StaticActorFace name="af_Prik" file="\TyrkjarA\Graphic\DansktHA\Prik" />
<StaticActorFace name="af_uPrik" file="\TyrkjarA\Graphic\DansktHA\uPrik" prepare="true"/>
<Pseudo3DCollisionBox name="cb_Prik" x="94" y="28" z="20"/>
<StaticActor name="a_Prik" terrain="t_DansktHusl" x="550" y="470" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Prik" collisionbox="cb_Prik"/>
	<State name="taken" face="af_iPrik"/>
	<State name="use" face="af_uPrik"/>
</StaticActor>
<StateQuantum name="q_Prik_taken" actor="a_Prik" state="taken"/>
<ActorMoused actor="a_Prik" listener="sc" moving="Prik" thf="prik"/>
<PrepareQuantum name="qp_DansktHus5" object="af_Prik" prepare="true"/>
<PrepareQuantum name="qu_DansktHus5" object="af_Prik" prepare="false"/>

<!-- PrikOgReipi -->
<StaticActorFace name="af_uPrikOgReipi" file="\TyrkjarA\Graphic\DansktHA\uPrikOgA" prepare="true"/>
<StaticActor name="a_PrikOgReipi" x="550" y="470" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_iPrikOgReipi"/>
	<State name="use" face="af_uPrikOgReipi"/>
</StaticActor>
<ActorMoused actor="a_PrikOgReipi" listener="sc" moving="Prik með reipi bundið um" thf="prik með reipi bundið um"/>

<!-- Kubein -->
<StaticActorFace name="af_uKubein" file="\TyrkjarA\Graphic\DansktHA\uKubein" prepare="true"/>
<StaticActor name="a_Kubein" x="550" y="470" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_iKubein"/>
	<State name="use" face="af_uKubein"/>
</StaticActor>
<ActorMoused actor="a_Kubein" listener="sc" moving="Frumstætt kúbein" thf="frumstætt kúbein"/>

<!-- Lausa fjolin -->
<TransparentActorFace name="af_LausaFjolin" width="35" height="88"/>
<StaticActor name="a_LausaFjolin" terrain="t_DansktHusl" x="429" y="341" z="0" state="stop" random="true">
	<State name="stop" face="af_LausaFjolin"/> </StaticActor>
<ActorMoused actor="a_LausaFjolin" listener="sc" moving="Fjöl" thf="fjöl"/>

<!-- Fjolin -->
<StaticActorFace name="af_Fjol" file="\TyrkjarA\Graphic\DansktHA\fjol"/>
<StaticActor name="a_Fjol" x="427" y="342" z="10" state="stop" save="true" random="true">
	<State name="stop" face="af_Fjol"/> </StaticActor>
<ActorMoused actor="a_Fjol" listener="sc" moving="Gat" thf="gat" taking="Troða sér út um gatið"/>
<MoveActorQuantum name="qs_Fjol" actor="a_Fjol" terrain="t_DansktHusl"/>
<MoveActorQuantum name="qh_Fjol" actor="a_Fjol" />
<PrepareQuantum name="qp_DansktHus6" object="af_Fjol" prepare="true"/>
<PrepareQuantum name="qu_DansktHus6" object="af_Fjol" prepare="false"/>

<!-- DHGluggi1 -->
<TransparentActorFace name="af_DHGluggi1" width="110" height="188"/>
<StaticActor name="a_DHGluggi1" terrain="t_DansktHusl" x="202" y="150" z="0" state="stop" random="true">
	<State name="stop" face="af_DHGluggi1"/> </StaticActor>
<ActorMoused actor="a_DHGluggi1" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- DHGluggi2 -->
<TransparentActorFace name="af_DHGluggi2" width="78" height="114"/>
<StaticActor name="a_DHGluggi2" terrain="t_DansktHusl" x="590" y="159" z="0" state="stop" random="true">
	<State name="stop" face="af_DHGluggi2"/> </StaticActor>
<ActorMoused actor="a_DHGluggi2" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- DHGluggi3 -->
<TransparentActorFace name="af_DHGluggi3" width="101" height="115"/>
<StaticActor name="a_DHGluggi3" terrain="t_DansktHusl" x="927" y="160" z="0" state="stop" random="true">
	<State name="stop" face="af_DHGluggi3"/> </StaticActor>
<ActorMoused actor="a_DHGluggi3" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- DHTunnur1 -->
<TransparentActorFace name="af_DHTunnur1" width="192" height="120"/>
<StaticActor name="a_DHTunnur1" terrain="t_DansktHusl" x="571" y="292" z="0" state="stop" random="true">
	<State name="stop" face="af_DHTunnur1"/> </StaticActor>
<ActorMoused actor="a_DHTunnur1" listener="sc" moving="Tunnur" thf="tunnur"/>

<!-- DHTunna2 -->
<TransparentActorFace name="af_DHTunna2" width="95" height="36"/>
<StaticActor name="a_DHTunna2" terrain="t_DansktHusl" x="988" y="301" z="0" state="stop" random="true">
	<State name="stop" face="af_DHTunna2"/> </StaticActor>
<ActorMoused actor="a_DHTunna2" listener="sc" moving="Tunna" thf="tunnu"/>

<!-- DHKista1 -->
<TransparentActorFace name="af_DHKista1" width="169" height="117"/>
<StaticActor name="a_DHKista1" terrain="t_DansktHusl" x="930" y="328" z="0" state="stop" random="true">
	<State name="stop" face="af_DHKista1"/> </StaticActor>
<ActorMoused actor="a_DHKista1" listener="sc" moving="Kista" thf="kistu"/>

<!-- DHHurd1 -->
<TransparentActorFace name="af_DHHurd1" width="127" height="247"/>
<StaticActor name="a_DHHurd1" terrain="t_DansktHusl" x="735" y="144" z="0" state="stop" random="true">
	<State name="stop" face="af_DHHurd1"/> </StaticActor>
<ActorMoused actor="a_DHHurd1" listener="sc" moving="Hurð" thf="hurð" taking="Opna dyr"/>

<Scene name="s_UtanDanskaHusid"/>

<Polygon name="p_UtanDanskaHusid">
	<Point x="-1" y="420"/>
	<Point x="-200" y="420"/>
	<Point x="-200" y="590"/>
	<Point x="663" y="590"/>
	<Point x="663" y="424"/>
	<Point x="552" y="368"/>
	<Point x="552" y="316"/>
	<Point x="800" y="316"/>
	<Point x="800" y="242"/>
	<Point x="342" y="242"/>
	<Point x="250" y="360"/>
</Polygon>

<!--<Polygon name="p_UtanDanskaHusid2">
	<Point x="570" y="310"/>
	<Point x="800" y="310"/>
	<Point x="800" y="430"/>
	<Point x="660" y="430"/>
</Polygon>-->

<SimplePseudo3DTerrain name="t_UtanDanskaHusid" scene="s_UtanDanskaHusid" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="0.6"/>
<SimplePseudo3DTerrain name="t_UtanDanskaHusidl" scene="s_UtanDanskaHusid" polygon="p_UtanDanskaHusid"
	zmin="-1" zmax="1500" defaultscaling="0.7" scaling2="0.5" scanline1="600" scanline2="350"/>
<!--<SimplePseudo3DTerrain name="t_UtanDanskaHusid2" scene="s_UtanDanskaHusid" polygon="p_UtanDanskaHusid2"
	zmin="-1" zmax="1500" defaultscaling="0.6"/> -->

<!-- Background for UtanDanskaHusid -->
<StaticActorFace name="af_UtanDanskaHusid" file="\TyrkjarA\Graphic\UtanDanA\UtanDanA" prepare="false"/>
<StaticActor name="a_UtanDanskaHusid" terrain="t_UtanDanskaHusid" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_UtanDanskaHusid"/> </StaticActor>
<PrepareQuantum name="qp_UtanDanskaHusid1" object="af_UtanDanskaHusid" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid1" object="af_UtanDanskaHusid" prepare="false"/>

<!-- Hus -->
<StaticActorFace name="af_Hus" file="\TyrkjarA\Graphic\UtanDanA\hus" prepare="false"/>
<StaticActor name="a_Hus" terrain="t_UtanDanskaHusid" x="532" y="375" z="339" state="stop">
	<State name="stop" face="af_Hus"/> </StaticActor>
<PrepareQuantum name="qp_UtanDanskaHusid2" object="af_Hus" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid2" object="af_Hus" prepare="false"/>

<!-- Tunnur -->
<StaticActorFace name="af_Tunnur" file="\TyrkjarA\Graphic\UtanDanA\tunnur" prepare="false"/>
<StaticActor name="a_Tunnur" terrain="t_UtanDanskaHusid" x="677" y="516" z="130" state="stop" random="true">
	<State name="stop" face="af_Tunnur"/> </StaticActor>
<ActorMoused listener="sc" actor="a_Tunnur" moving="Tunnur" thf="tunnur"/>
<PrepareQuantum name="qp_UtanDanskaHusid3" object="af_Tunnur" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid3" object="af_Tunnur" prepare="false"/>

<!-- Tyrki2 -->
<CelledAnimated2DActorFace name="af_Tyrki2_walk" repeat="-1" file="\TyrkjarA\AnimatiA\Tyrkir\Tyrki2" count="8" prepare="false"/>
<MovingActor name="a_Tyrki2" terrain="t_UtanDanskaHusid" state="stop" x="587" y="161" z="0" save="true">
	<State name="walk" face="af_Tyrki2_walk"/> </MovingActor>
<PrepareQuantum name="qp_UtanDanskaHusid4" object="af_Tyrki2_walk" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid4" object="af_Tyrki2_walk" prepare="false"/>
<StateQuantum name="q_Tyrki2_stop" actor="a_Tyrki2" state="stop" wait="false"/>
<StateQuantum name="q_Tyrki2_walk" actor="a_Tyrki2" state="walk" wait="false"/>
<SetDestinationQuantum name="q_WalkTyrki2A" actor="a_Tyrki2" x="283" y="161" wait="true"/>
<SetDestinationQuantum name="q_WalkTyrki2B" actor="a_Tyrki2" x="-100" y="270" wait="true"/>

<!-- Tyrki3 -->
<CelledAnimated2DActorFace name="af_Tyrki3Left" repeat="-1" file="\TyrkjarA\AnimatiA\Tyrkir\left" count="8" prepare="false"/>
<StaticActorFace name="af_Tyrki3Stop" file="\TyrkjarA\AnimatiA\Tyrkir\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_Tyrki3Stop2Left" repeat="1" file="\TyrkjarA\AnimatiA\Tyrkir\stop2leA" count="1" prepare="false"/>
<MovingActor name="a_Tyrki3" state="stop" x="802" y="597" z="220" save="true">
	<State name="left" face="af_Tyrki3Left"/>
	<State name="stop" face="af_Tyrki3Stop"/>
	<State name="stop2left" face="af_Tyrki3Stop2Left"/>
</MovingActor>
<PrepareQuantum name="qp_UtanDanskaHusid5" object="af_Tyrki3Left" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid5" object="af_Tyrki3Left" prepare="false"/>
<PrepareQuantum name="qp_UtanDanskaHusid6" object="af_Tyrki3Stop" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid6" object="af_Tyrki3Stop" prepare="false"/>
<PrepareQuantum name="qp_UtanDanskaHusid7" object="af_Tyrki3Stop2Left" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid7" object="af_Tyrki3Stop2Left" prepare="false"/>
<StateQuantum name="q_Tyrki3_stop" actor="a_Tyrki3" state="stop" wait="false"/>
<SetDestinationQuantum name="q_WalkTyrki3" actor="a_Tyrki3" x="250" y="523" wait="true" speed="90"/>
<SetDestinationQuantum name="q_WalkTyrki32" actor="a_Tyrki3" x="200" y="500" wait="false"/>
<MoveActorQuantum name="qh_Tyrki3" actor="a_Tyrki3" />
<MoveActorQuantum name="qs_Tyrki3" actor="a_Tyrki3" terrain="t_UtanDanskaHusid">
    <Location x="802" y="598" z="180"/>
</MoveActorQuantum>

<!-- KonaMadurDaud -->
<StaticActorFace name="af_KonaMadurDaud" file="\TyrkjarA\Graphic\UtanDanA\KonaMadA" prepare="false"/>
<Pseudo3DCollisionBox name="cb_KonaMadurDaud" x="235" y="54" z="66"/>
<StaticActor name="a_KonaMadurDaud" terrain="t_UtanDanskaHusid" x="539" y="490" z="0" state="stop" random="true">
	<State name="stop" face="af_KonaMadurDaud" collisionbox="cb_KonaMadurDaud"/> </StaticActor>
<ActorMoused listener="sc" actor="a_KonaMadurDaud" moving="Fórnarlömb Hund-Tyrkjans" looking="Skoða fórnarlömb Hund-Tyrkjans" thf="óheppið fólk"/>
<PrepareQuantum name="qp_UtanDanskaHusid9" object="af_KonaMadurDaud" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid9" object="af_KonaMadurDaud" prepare="false"/>

<!-- StrakurDaudur -->
<StaticActorFace name="af_StrakurDaudur" file="\TyrkjarA\Graphic\UtanDanA\StrakurA" prepare="false"/>
<Pseudo3DCollisionBox name="cb_StrakurDaudur" x="155" y="26" z="39"/>
<StaticActor name="a_StrakurDaudur" terrain="t_UtanDanskaHusid" x="471" y="380" z="0" state="stop" random="true">
	<State name="stop" face="af_StrakurDaudur" collisionbox="cb_StrakurDaudur"/> </StaticActor>
<ActorMoused listener="sc" actor="a_StrakurDaudur" moving="Fórnarlamb Hund-Tyrkjans" looking="Skoða fórnarlamb Hund-Tyrkjans" thf="óheppin strák"/>
<PrepareQuantum name="qp_UtanDanskaHusid8" object="af_StrakurDaudur" prepare="true"/>
<PrepareQuantum name="qu_UtanDanskaHusid8" object="af_StrakurDaudur" prepare="false"/>

<!-- Hot spot for moving to UtanHusid -->
<TransparentActorFace name="af_UtanDanskaHusid2UtanHusid" width="124" height="119"/>
<StaticActor name="ta_UtanDanskaHusid2UtanHusid" terrain="t_UtanDanskaHusid" x="478" y="380" z="157" state="stop">
	<State name="stop" face="af_UtanDanskaHusid2UtanHusid"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_UtanDanskaHusid2UtanHusid" moving="Til heimahúss" taking=" " looking="Til heimahúss" talking=" "/>
<Pseudo3DCollisionBox name="cb_UtanDanskaHusid2UtanHusid" x="45" y="64" z="2"/>
<StaticActor name="a_UtanDanskaHusid2UtanHusid" terrain="t_UtanDanskaHusidl" x="525" y="278" z="1" state="stop" collision="ac_UtanDanskaHusid2UtanHusid">
	<State name="stop" collisionbox="cb_UtanDanskaHusid2UtanHusid"/> </StaticActor>
<MoveActorQuantum name="q_MoveUtanDanskaHusid2UtanHusidIn" actor="a_UtanDanskaHusid2UtanHusid" terrain="t_UtanDanskaHusidl"/>
<MoveActorQuantum name="q_MoveUtanDanskaHusid2UtanHusidOut" actor="a_UtanDanskaHusid2UtanHusid"/>

<!-- Hot spot for moving to Fjaran -->
<TransparentActorFace name="af_UtanDanskaHusid2Fjaran" width="56" height="188"/>
<StaticActor name="ta_UtanDanskaHusid2Fjaran" terrain="t_UtanDanskaHusid" x="-1" y="813" z="400" state="stop">
	<State name="stop" face="af_UtanDanskaHusid2Fjaran"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_UtanDanskaHusid2Fjaran" moving="Niður í fjöru" taking=" " looking="Niður í fjöru" talking=" "/>
<Pseudo3DCollisionBox name="cb_UtanDanskaHusid2Fjaran" x="10" y="150" z="10"/>
<StaticActor name="a_UtanDanskaHusid2Fjaran" terrain="t_UtanDanskaHusidl" x="35" y="505" z="1" state="stop" collision="ac_UtanDanskaHusid2Fjaran">
	<State name="stop" collisionbox="cb_UtanDanskaHusid2Fjaran"/> </StaticActor>
<MoveActorQuantum name="q_MoveUtanDanskaHusid2FjaranIn" actor="a_UtanDanskaHusid2Fjaran" terrain="t_UtanDanskaHusidl"/>
<MoveActorQuantum name="q_MoveUtanDanskaHusid2FjaranOut" actor="a_UtanDanskaHusid2Fjaran"/>

<!-- Fjolin -->
<TransparentActorFace name="af_Fjol2" height="37" width="10"/>
<StaticActor name="a_Fjol2" x="651" y="582" z="220" state="stop"  terrain="t_UtanDanskaHusidl" random="true">
	<State name="stop" face="af_Fjol2"/> </StaticActor>
<ActorMoused actor="a_Fjol2" listener="sc" moving="Gat" thf="gat" taking="Troða sér inn um gatið"/>

<!-- UDHGluggi1 -->
<TransparentActorFace name="af_UDHGluggi1" height="50" width="78"/>
<StaticActor name="a_UDHGluggi1" x="61" y="412" z="200" state="stop"  terrain="t_UtanDanskaHusidl" random="true">
	<State name="stop" face="af_UDHGluggi1"/> </StaticActor>
<ActorMoused actor="a_UDHGluggi1" listener="sc" moving="Gluggi" thf="glugga" taking="Opna Glugga"/>

<!-- UDHGluggi2 -->
<TransparentActorFace name="af_UDHGluggi2" height="28" width="37"/>
<StaticActor name="a_UDHGluggi2" x="468" y="435" z="300" state="stop"  terrain="t_UtanDanskaHusidl" random="true">
	<State name="stop" face="af_UDHGluggi2"/> </StaticActor>
<ActorMoused actor="a_UDHGluggi2" listener="sc" moving="Gluggi" thf="glugga"  taking="Opna Glugga"/>

<!-- UDHGluggi3 -->
<TransparentActorFace name="af_UDHGluggi3" height="51" width="126"/>
<StaticActor name="a_UDHGluggi3" x="728" y="446" z="200" state="stop"  terrain="t_UtanDanskaHusidl" random="true">
	<State name="stop" face="af_UDHGluggi3"/> </StaticActor>
<ActorMoused actor="a_UDHGluggi3" listener="sc" moving="Gluggi" thf="glugga" taking="Opna Glugga"/>

<ScrollingScene name="s_Fjaran" width="1200" height="600"/>

<Polygon name="p_Fjaran">
	<Point x="200" y="600"/>
	<Point x="200" y="520"/>
	<Point x="860" y="480"/>
	<Point x="1050" y="410"/>
	<Point x="1200" y="410"/>
	<Point x="1400" y="410"/>
	<Point x="1400" y="480"/>
	<Point x="1200" y="480"/>
	<Point x="1060" y="600"/>
	<Point x="1060" y="1000"/>
	<Point x="680" y="1000"/>
	<Point x="680" y="600"/>
	<Point x="450" y="600"/>
	<Point x="450" y="1000"/>
	<Point x="200" y="1000"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Fjaran" scene="s_Fjaran" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="0.6"/>
<SimplePseudo3DTerrain name="t_Fjaranl" scene="s_Fjaran" polygon="p_Fjaran"
	zmin="-1" zmax="1500" defaultscaling="0.6"/>

<!-- Background ocean -->
<JMFActorMouth name="m_Ocean" file="\TyrkjarA\Media\Sfx\Ocean.wav" repeat="true" prepare="true"/>
<StaticActor name="a_Ocean" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Ocean"/> </StaticActor>
<StateQuantum name="q_Ocean_stop" actor="a_Ocean" state="stop" wait="false"/>
<StateQuantum name="q_Ocean_play" actor="a_Ocean" state="play" wait="false"/>

<!-- Background for Fjaran -->
<StaticActorFace name="af_Fjaran1" file="\TyrkjarA\Graphic\Fjaran\Fjaran1"/>
<StaticActor name="a_Fjaran1" terrain="t_Fjaran" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Fjaran1"/> </StaticActor>
<StaticActorFace name="af_Fjaran2" file="\TyrkjarA\Graphic\Fjaran\Fjaran2"/>
<StaticActor name="a_Fjaran2" terrain="t_Fjaran" x="800" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Fjaran2"/> </StaticActor>
<PrepareQuantum name="qp_Fjaran1" object="af_Fjaran1" prepare="true"/>
<PrepareQuantum name="qu_Fjaran1" object="af_Fjaran1" prepare="false"/>
<PrepareQuantum name="qp_Fjaran2" object="af_Fjaran2" prepare="true"/>
<PrepareQuantum name="qu_Fjaran2" object="af_Fjaran2" prepare="false"/>

<!-- Animation SigrunATunnu -->
<CelledAnimated2DActorFace name="af_SigrunATunnu" count="8" repeat="1" speed="250" file="\TyrkjarA\AnimatiA\Sigrun\SigrunAA" />
<MovingActor name="a_SigrunATunnu" terrain="t_Fjaranl" x="280" y="390" z="0" state="none">
	<State name="swim" face="af_SigrunATunnu"/> </MovingActor>
<StateQuantum name="q_SigrunATunnu_swim" actor="a_SigrunATunnu" state="swim" wait="true"/>
<StateQuantum name="q_SigrunATunnu_none" actor="a_SigrunATunnu" state="none" wait="false"/>
<MoveActorQuantum name="qs_SigrunATunnu" actor="a_SigrunATunnu" terrain="t_Fjaranl" > <Location x="280" y="390" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="qd_SigrunATunnu" actor="a_SigrunATunnu" x="100" y="230" speed="110"/>
<PrepareQuantum name="qp_Fjaran3" object="af_SigrunATunnu" prepare="true"/>
<PrepareQuantum name="qu_Fjaran3" object="af_SigrunATunnu" prepare="false"/>

<!-- Animation SigrunHendirTunnu -->
<CelledAnimated2DActorFace name="af_SigrunHendirTunnu" count="9" repeat="1" speed="250" file="\TyrkjarA\AnimatiA\Sigrun\hendirtA" />
<MovingActor name="a_SigrunHendirTunnu" terrain="t_Fjaranl" x="232" y="520" z="200" state="none">
	<State name="throw" face="af_SigrunHendirTunnu"/> </MovingActor>
<StateQuantum name="q_SigrunThrow" actor="a_SigrunHendirTunnu" state="throw" wait="true"/>
<StateQuantum name="q_SigrunThrowNone" actor="a_SigrunHendirTunnu" state="none" wait="false"/>
<PrepareQuantum name="qp_Fjaran11" object="af_SigrunHendirTunnu" prepare="true"/>
<PrepareQuantum name="qu_Fjaran11" object="af_SigrunHendirTunnu" prepare="false"/>

<!-- Animation SigurnHopparTunnu -->
<CelledAnimated2DActorFace name="af_SigrunHopparTunnu" count="7" repeat="1" speed="250" file="\TyrkjarA\AnimatiA\Sigrun\hopparaA" />
<MovingActor name="a_SigrunHopparTunnu" terrain="t_Fjaranl" x="254" y="520" z="200" state="none">
	<State name="jump" face="af_SigrunHopparTunnu"/> </MovingActor>
<StateQuantum name="q_SigrunJump" actor="a_SigrunHopparTunnu" state="jump" wait="true"/>
<StateQuantum name="q_SigrunJumpNone" actor="a_SigrunHopparTunnu" state="none" wait="false"/>
<PrepareQuantum name="qp_Fjaran12" object="af_SigrunHopparTunnu" prepare="true"/>
<PrepareQuantum name="qu_Fjaran12" object="af_SigrunHopparTunnu" prepare="false"/>

<!-- Tunna -->
<StaticActorFace name="af_TunnaKafi" file="\TyrkjarA\Graphic\Fjaran\tunnaikA" />
<MovingActor name="a_TunnaKafi" x="248" y="453" z="20" state="stop">
	<State name="stop" face="af_TunnaKafi"/> </MovingActor>
<MoveActorQuantum name="qs_TunnaKafi" actor="a_TunnaKafi" terrain="t_Fjaranl" />
<MoveActorQuantum name="qh_TunnaKafi" actor="a_TunnaKafi"/>
<PrepareQuantum name="qp_Fjaran13" object="af_TunnaKafi" prepare="true"/>
<PrepareQuantum name="qu_Fjaran13" object="af_TunnaKafi" prepare="false"/>
<ActorMoused actor="a_TunnaKafi" listener="sc" moving="Tunna" thf="tunnu" />

<!-- Klettar1 -->
<StaticActorFace name="af_Klettar1" file="\TyrkjarA\Graphic\Fjaran\Klettar1" />
<StaticActor name="a_Klettar1" terrain="t_Fjaran" x="0" y="600" z="255" state="stop">
	<State name="stop" face="af_Klettar1"/> </StaticActor>
<!-- Klettar2 -->
<StaticActorFace name="af_Klettar2" file="\TyrkjarA\Graphic\Fjaran\Klettar2" />
<StaticActor name="a_Klettar2" terrain="t_Fjaran" x="442" y="744" z="255" state="stop">
	<State name="stop" face="af_Klettar2"/> </StaticActor>
<!-- Klettar3 -->
<StaticActorFace name="af_Klettar3" file="\TyrkjarA\Graphic\Fjaran\Klettar3" />
<StaticActor name="a_Klettar3" terrain="t_Fjaran" x="1043" y="672" z="255" state="stop">
	<State name="stop" face="af_Klettar3"/> </StaticActor>
<PrepareQuantum name="qp_Fjaran4" object="af_Klettar1" prepare="true"/>
<PrepareQuantum name="qu_Fjaran4" object="af_Klettar1" prepare="false"/>
<PrepareQuantum name="qp_Fjaran5" object="af_Klettar2" prepare="true"/>
<PrepareQuantum name="qu_Fjaran5" object="af_Klettar2" prepare="false"/>
<PrepareQuantum name="qp_Fjaran6" object="af_Klettar3" prepare="true"/>
<PrepareQuantum name="qu_Fjaran6" object="af_Klettar3" prepare="false"/>

<!-- Batur -->
<CelledAnimated2DActorFace name="af_BaturSekkur" count="6" repeat="1" speed="300" file="\TyrkjarA\AnimatiA\Batur\BaturSeA" />
<CelledAnimated2DActorFace name="af_BaturSokkinn" count="3" repeat="-1" speed="300" file="\TyrkjarA\AnimatiA\Batur\BaturSoA" />
<StaticActorFace name="af_Batur" file="\TyrkjarA\Graphic\Fjaran\Batur" />
<MovingActor name="a_Batur" terrain="t_Fjaranl" x="670" y="340" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Batur"/>
	<State name="sinking" face="af_BaturSekkur"/>
	<State name="sunk" face="af_BaturSokkinn"/> </MovingActor>
<StateQuantum name="q_Batur_sinking" actor="a_Batur" state="sinking" wait="true"/>
<StateQuantum name="q_Batur_sunk" actor="a_Batur" state="sunk" wait="false"/>
<ActorMoused actor="a_Batur" listener="sc" moving="Bátur" thf="bát" taking="Ýta bát úr vör"/>
<PrepareQuantum name="qp_Fjaran7" object="af_BaturSekkur" prepare="true"/>
<PrepareQuantum name="qu_Fjaran7" object="af_BaturSekkur" prepare="false"/>
<PrepareQuantum name="qp_Fjaran8" object="af_BaturSokkinn" prepare="true"/>
<PrepareQuantum name="qu_Fjaran8" object="af_BaturSokkinn" prepare="false"/>
<PrepareQuantum name="qp_Fjaran9" object="af_Batur" prepare="true"/>
<PrepareQuantum name="qu_Fjaran9" object="af_Batur" prepare="false"/>

<!-- Flaska -->
<CelledAnimated2DActorFace name="af_Flaska" count="2" repeat="-1" speed="300" file="\TyrkjarA\AnimatiA\Flaska\Flaska"/>
<StaticActorFace name="af_uFlaska" file="\TyrkjarA\Graphic\Fjaran\uFlaska" prepare="true"/>
<MovingActor name="a_Flaska" x="0" y="400" z="0" state="none" save="true" random="true">
	<State name="marring" face="af_Flaska"/>
	<State name="taken" face="af_iFlaska"/>
	<State name="use" face="af_uFlaska"/>
</MovingActor>
<StateQuantum name="q_Flaska_marring" actor="a_Flaska" state="marring"/>
<StateQuantum name="q_Flaska_taken" actor="a_Flaska" state="taken"/>
<SetDestinationQuantum name="qd_Flaska" actor="a_Flaska" x="900" y="400" speed="50"/>
<ActorMoused actor="a_Flaska" listener="sc" moving="Flaska" thf="flösku"/>
<PrepareQuantum name="qp_Fjaran10" object="af_Flaska" prepare="true"/>
<PrepareQuantum name="qu_Fjaran10" object="af_Flaska" prepare="false"/>

<!-- Floskuskeyti -->
<StaticActorFace name="af_uFloskuskeyti" file="\TyrkjarA\Graphic\Fjaran\uFloskuA" prepare="true"/>
<StaticActor name="a_Floskuskeyti" x="0" y="600" z="255" state="taken" save="true" random="true">
	<State name="taken" face="af_iFloskuskeyti"/>
	<State name="use" face="af_uFloskuskeyti"/>
</StaticActor>
<ActorMoused actor="a_Floskuskeyti" listener="sc" moving="Flöskuskeyti" thf="flöskuskeyti"/>

<!-- Sjorinn -->
<TransparentActorFace name="af_Sjorinn" width="800" height="170"/>
<StaticActor name="a_Sjorinn" terrain="t_Fjaranl" x="0" y="300" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Sjorinn"/> </StaticActor>
<ActorMoused actor="a_Sjorinn" listener="sc" moving="Sjór" thf="sjó"/>

<!-- Hot spot for moving to UtanDanskaHusid -->
<TransparentActorFace name="af_Fjaran2UtanDanskaHusid" width="91" height="179"/>
<StaticActor name="ta_Fjaran2UtanDanskaHusid" terrain="t_Fjaranl" x="1108" y="600" z="245" state="stop">
	<State name="stop" face="af_Fjaran2UtanDanskaHusid"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_Fjaran2UtanDanskaHusid" moving="Til dönsku húsanna" taking=" " looking=" " talking=" "/>
<Pseudo3DCollisionBox name="cb_Fjaran2UtanDanskaHusid" x="40" y="60" z="10"/>
<StaticActor name="a_Fjaran2UtanDanskaHusid" terrain="t_Fjaranl" x="1175" y="445" z="0" state="stop" collision="ac_Fjaran2UtanDanskaHusid">
	<State name="stop" collisionbox="cb_Fjaran2UtanDanskaHusid"/> </StaticActor>
<MoveActorQuantum name="q_MoveFjaran2UtanDanskaHusidIn" actor="a_Fjaran2UtanDanskaHusid" terrain="t_Fjaranl"/>
<MoveActorQuantum name="q_MoveFjaran2UtanDanskaHusidOut" actor="a_Fjaran2UtanDanskaHusid"/>

<!-- Hot spot for moving to UtanHelli, the one to the left -->
<TransparentActorFace name="af_Fjaran2UtanHelli1" width="288" height="49"/>
<StaticActor name="ta_Fjaran2UtanHelli1" terrain="t_Fjaranl" x="192" y="600" z="50" state="stop">
	<State name="stop" face="af_Fjaran2UtanHelli1"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_Fjaran2UtanHelli1" moving="Til kletta" taking=" " looking=" " talking=" "/>
<Pseudo3DCollisionBox name="cb_Fjaran2UtanHelli1" x="250" y="10" z="10"/>
<StaticActor name="a_Fjaran2UtanHelli1" terrain="t_Fjaranl" x="330" y="585" z="0" state="stop" collision="ac_Fjaran2UtanHelli1">
	<State name="stop" collisionbox="cb_Fjaran2UtanHelli1"/> </StaticActor>
<MoveActorQuantum name="q_MoveFjaran2UtanHelli1In" actor="a_Fjaran2UtanHelli1" terrain="t_Fjaranl"/>
<MoveActorQuantum name="q_MoveFjaran2UtanHelli1Out" actor="a_Fjaran2UtanHelli1"/>

<!-- Hot spot for moving to UtanHelli, the one to the right -->
<TransparentActorFace name="af_Fjaran2UtanHelli2" width="385" height="47"/>
<StaticActor name="ta_Fjaran2UtanHelli2" terrain="t_Fjaranl" x="672" y="600" z="48" state="stop">
	<State name="stop" face="af_Fjaran2UtanHelli2"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_Fjaran2UtanHelli2" moving="Til kletta" taking=" " looking=" " talking=" "/>
<Pseudo3DCollisionBox name="cb_Fjaran2UtanHelli2" x="350" y="10" z="10"/>
<StaticActor name="a_Fjaran2UtanHelli2" terrain="t_Fjaranl" x="875" y="585" z="0" state="stop" collision="ac_Fjaran2UtanHelli2">
	<State name="stop" collisionbox="cb_Fjaran2UtanHelli2"/> </StaticActor>
<MoveActorQuantum name="q_MoveFjaran2UtanHelli2In" actor="a_Fjaran2UtanHelli2" terrain="t_Fjaranl"/>
<MoveActorQuantum name="q_MoveFjaran2UtanHelli2Out" actor="a_Fjaran2UtanHelli2"/>

<!-- FSkip1 -->
<TransparentActorFace name="af_FSkip1" width="187" height="254"/>
<StaticActor name="a_FSkip1" terrain="t_Fjaranl" x="0" y="0" z="0" state="stop" random="true">
	<State name="stop" face="af_FSkip1"/> </StaticActor>
<ActorMoused actor="a_FSkip1" listener="sc" moving="Skip" thf="skip"/>

<!-- FHellisOp1 -->
<TransparentActorFace name="af_FHellisOp1" width="46" height="115"/>
<StaticActor name="a_FHellisOp1" terrain="t_Fjaranl" x="1025" y="161" z="0" state="stop" random="true">
	<State name="stop" face="af_FHellisOp1"/> </StaticActor>
<ActorMoused actor="a_FHellisOp1" listener="sc" moving="Hellisop" thf="hellisop"/>

<!-- Flöskuskeyti -->
<StaticActorFace name="af_SkeytiLarge" file="\TyrkjarA\Graphic\fjaran\floskusA" />
<StaticActor name="a_SkeytiLarge" x="0" y="950" z="950" state="stop" save="true" random="true">
	<State name="stop" face="af_SkeytiLarge"/>
</StaticActor>
<MoveActorQuantum name="qh_SkeytiLarge" actor="a_SkeytiLarge"/>
<MoveActorQuantum name="qs_SkeytiLarge" actor="a_SkeytiLarge" terrain="t_InventoryBack"/>

<!-- Prepare Skeyti -->
<PrepareQuantum name="qp_SkeytiLarge" object="af_SkeytiLarge" prepare="true"/>
<PrepareQuantum name="qu_SkeytiLarge" object="af_SkeytiLarge" prepare="false"/>

<ScrollingScene name="s_Dekkid" width="1200" height="600"/>

<Polygon name="p_Dekkid">
	<Point x="880" y="400"/>
	<Point x="880" y="350"/>
	<Point x="1000" y="350"/>
	<Point x="1000" y="550"/>
	<Point x="730" y="500"/>
	<Point x="640" y="598"/>
	<Point x="35" y="598"/>
	<Point x="143" y="498"/>
	<Point x="124" y="476"/>
	<Point x="264" y="406"/>
	<Point x="322" y="418"/>
	<Point x="535" y="360"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Dekkid" scene="s_Dekkid" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="0.75"/>
<SimplePseudo3DTerrain name="t_Dekkidl" scene="s_Dekkid" polygon="p_Dekkid"
	zmin="-1" zmax="1500" defaultscaling="0.7" scaling2="0.8" scanline1="380" scanline2="600"/>

<!-- Background for Dekkid -->
<StaticActorFace name="af_Dekkid1" file="\TyrkjarA\Graphic\Dekkid\Dekkid1"/>
<StaticActor name="a_Dekkid1" terrain="t_Dekkid" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Dekkid1"/> </StaticActor>
<StaticActorFace name="af_Dekkid2" file="\TyrkjarA\Graphic\Dekkid\Dekkid2"/>
<StaticActor name="a_Dekkid2" terrain="t_Dekkid" x="800" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Dekkid2"/> </StaticActor>
<PrepareQuantum name="qp_Dekkid1" object="af_Dekkid1" prepare="true"/>
<PrepareQuantum name="qu_Dekkid1" object="af_Dekkid1" prepare="false"/>
<PrepareQuantum name="qp_Dekkid2" object="af_Dekkid2" prepare="true"/>
<PrepareQuantum name="qu_Dekkid2" object="af_Dekkid2" prepare="false"/>

<!-- Glerflaska -->
<StaticActorFace name="af_Glerflaska" file="\TyrkjarA\Graphic\Dekkid\GlerflaA" />
<StaticActorFace name="af_uGlerflaska" file="\TyrkjarA\Graphic\Dekkid\uGlerflA" prepare="true"/>
<Pseudo3DCollisionBox name="cb_Glerflaska" x="51" y="55" z="4"/>
<StaticActor name="a_Glerflaska" terrain="t_Dekkidl" x="470" y="525" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Glerflaska" collisionbox="cb_Glerflaska"/>
	<State name="taken" face="af_iGlerflaska"/>
	<State name="use" face="af_uGlerflaska"/>
</StaticActor>
<StateQuantum name="q_Glerflaska_taken" actor="a_Glerflaska" state="taken"/>
<ActorMoused actor="a_Glerflaska" listener="sc" moving="Flaska" thf="flösku"/>
<PrepareQuantum name="qp_Dekkid3" object="af_Glerflaska" prepare="true"/>
<PrepareQuantum name="qu_Dekkid3" object="af_Glerflaska" prepare="false"/>

<!-- FloskuBrot (takeable) -->
<StaticActorFace name="af_FloskuBrot" file="\TyrkjarA\Graphic\Dekkid\FloskuBA" />
<StaticActorFace name="af_uFloskuBrot" file="\TyrkjarA\Graphic\Dekkid\uFloskuA" prepare="true"/>
<StaticActor name="a_FloskuBrot" x="340" y="417" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_FloskuBrot"/>
	<State name="taken" face="af_iFloskuBrot"/>
	<State name="use" face="af_uFloskuBrot"/>
</StaticActor>
<StateQuantum name="q_FloskuBrot_taken" actor="a_FloskuBrot" state="taken"/>
<ActorMoused actor="a_FloskuBrot" listener="sc" moving="Sæmilega hvasst flöskubrot" thf="sæmilega hvasst flöskubrot"/>
<PrepareQuantum name="qp_Dekkid4" object="af_FloskuBrot" prepare="true"/>
<PrepareQuantum name="qu_Dekkid4" object="af_FloskuBrot" prepare="false"/>

<!-- FloskuBrot (not takeable) -->
<StaticActorFace name="af_FloskuBrot2" file="\TyrkjarA\Graphic\Dekkid\FloskuBB" />
<StaticActor name="a_FloskuBrot2" x="215" y="455" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_FloskuBrot2"/> </StaticActor>
<ActorMoused actor="a_FloskuBrot2" listener="sc" moving="Mjög hvasst flöskubrot" thf="mjög hvasst flöskubrot"/>
<PrepareQuantum name="qp_Dekkid5" object="af_FloskuBrot2" prepare="true"/>
<PrepareQuantum name="qu_Dekkid5" object="af_FloskuBrot2" prepare="false"/>

<!-- Las -->
<StaticActorFace name="af_Las" file="\TyrkjarA\Graphic\Dekkid\Las" />
<StaticActor name="a_Las" terrain="t_Dekkidl" x="220" y="280" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Las"/> </StaticActor>
<ActorMoused actor="a_Las" listener="sc" moving="Lás" thf="lás" taking="Opna lás"/>
<PrepareQuantum name="qp_Dekkid6" object="af_Las" prepare="true"/>
<PrepareQuantum name="qu_Dekkid6" object="af_Las" prepare="false"/>

<!-- BrotinnLas -->
<StaticActorFace name="af_BrotinnLas" file="\TyrkjarA\Graphic\Dekkid\BrotinnA"/>
<StaticActor name="a_BrotinnLas" x="193" y="288" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_BrotinnLas"/> </StaticActor>
<ActorMoused actor="a_BrotinnLas" listener="sc" moving="Brotinn lás" thf="brotin lás"/>
<PrepareQuantum name="qp_Dekkid7" object="af_BrotinnLas" prepare="true"/>
<PrepareQuantum name="qu_Dekkid7" object="af_BrotinnLas" prepare="false"/>

<!-- Lok -->
<StaticActorFace name="af_Lok1" file="\TyrkjarA\Graphic\Dekkid\Lok1"/>
<StaticActorFace name="af_Lok2" file="\TyrkjarA\Graphic\Dekkid\Lok2"/>
<PrepareQuantum name="qp_Dekkid8" object="af_Lok1" prepare="true"/>
<PrepareQuantum name="qu_Dekkid8" object="af_Lok1" prepare="false"/>
<PrepareQuantum name="qp_Dekkid9" object="af_Lok2" prepare="true"/>
<PrepareQuantum name="qu_Dekkid9" object="af_Lok2" prepare="false"/>

<StaticActor name="a_Lok" terrain="t_Dekkidl" x="1025" y="555" z="200" state="closed" save="true" random="true">
	<State name="closed" face="af_Lok1"/>
</StaticActor>
<ActorMoused actor="a_Lok" listener="sc" moving="Kistulok" thf="kistulok" taking="Opna kistu"/>
<MoveActorQuantum name="qh_Lok" actor="a_Lok" />
<MoveActorQuantum name="qs_Lok" actor="a_Lok" terrain="t_Dekkidl"/>

<StaticActor name="a_Lok2" x="1126" y="506" z="200" state="open" save="true" random="true">
	<State name="open" face="af_Lok2"/> </StaticActor>
<ActorMoused actor="a_Lok2" listener="sc" moving="Kistulok" thf="kistulok" taking="Loka kistu"/>
<MoveActorQuantum name="qh_Lok2" actor="a_Lok2" />
<MoveActorQuantum name="qs_Lok2" actor="a_Lok2" terrain="t_Dekkidl"/>

<!-- Edalsteinn -->
<StaticActorFace name="af_Edalsteinn" file="\TyrkjarA\Graphic\Dekkid\EdalsteA"/>
<StaticActorFace name="af_uEdalsteinn" file="\TyrkjarA\Graphic\Dekkid\uEdalstA" prepare="true"/>
<StaticActor name="a_Edalsteinn" terrain="t_Dekkidl" x="1082" y="420" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Edalsteinn"/>
	<State name="taken" face="af_iEdalsteinn"/>
	<State name="use" face="af_uEdalsteinn"/>
</StaticActor>
<ActorMoused actor="a_Edalsteinn" listener="sc" moving="Eðalsteinn" thf="eðalstein"/>
<StateQuantum name="q_Edalsteinn_taken" actor="a_Edalsteinn" state="taken"/>
<PrepareQuantum name="qp_Dekkid10" object="af_Edalsteinn" prepare="true"/>
<PrepareQuantum name="qu_Dekkid10" object="af_Edalsteinn" prepare="false"/>

<!-- Brot1 -->
<StaticActorFace name="af_uBrot1" file="\TyrkjarA\Graphic\Dekkid\uBrot1" prepare="true"/>
<StaticActor name="a_Brot1" x="1082" y="420" z="0" state="stop" save="true" random="true">
	<State name="taken" face="af_iBrot1"/>
	<State name="use" face="af_uBrot1"/>
</StaticActor>
<ActorMoused actor="a_Brot1" listener="sc" moving="Eðalsteinsbrot" thf="brot úr eðalsteini"/>
<StateQuantum name="q_Brot1_taken" actor="a_Brot1" state="taken"/>
<MoveActorQuantum name="qh_Brot1" actor="a_Brot1" />

<!-- KaetuHurd -->
<TransparentActorFace name="af_KaetuHurd" width="141" height="191"/>
<StaticActor name="a_KaetuHurd" terrain="t_Dekkid" x="122" y="242" z="0" state="stop" random="true">
	<State name="stop" face="af_KaetuHurd"/> </StaticActor>
<ActorMoused actor="a_KaetuHurd" listener="sc" moving="Hurð" thf="hurð" taking="Opna dyr"/>

<!-- Hot spot for moving to Fjaran -->
<TransparentActorFace name="af_Dekkid2Fjaran" width="144" height="97"/>
<StaticActor name="ta_Dekkid2Fjaran" terrain="t_Dekkidl" x="903" y="600" z="302" state="stop">
	<State name="stop" face="af_Dekkid2Fjaran"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_Dekkid2Fjaran" moving="Synda í land" taking=" " looking=" " talking=" "/>
<Pseudo3DCollisionBox name="cb_Dekkid2Fjaran" x="100" y="30" z="10"/>
<StaticActor name="a_Dekkid2Fjaran" terrain="t_Dekkidl" x="940" y="393" z="0" state="stop" collision="ac_Dekkid2Fjaran">
	<State name="stop" collisionbox="cb_Dekkid2Fjaran"/> </StaticActor>

<!-- DTunnur1 -->
<TransparentActorFace name="af_DTunnur1" width="117" height="73"/>
<StaticActor name="a_DTunnur1" terrain="t_Dekkidl" x="381" y="294" z="0" state="stop" random="true">
	<State name="stop" face="af_DTunnur1"/> </StaticActor>
<ActorMoused actor="a_DTunnur1" listener="sc" moving="Tunnur" thf="tunnur"/>

<!-- DGluggi1 -->
<TransparentActorFace name="af_DGluggi1" width="48" height="70"/>
<StaticActor name="a_DGluggi1" terrain="t_Dekkidl" x="0" y="306" z="0" state="stop" random="true">
	<State name="stop" face="af_DGluggi1"/> </StaticActor>
<ActorMoused actor="a_DGluggi1" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- DGluggi2 -->
<TransparentActorFace name="af_DGluggi2" width="67" height="68"/>
<StaticActor name="a_DGluggi2" terrain="t_Dekkidl" x="306" y="168" z="0" state="stop" random="true">
	<State name="stop" face="af_DGluggi2"/> </StaticActor>
<ActorMoused actor="a_DGluggi2" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- DGluggasilla1 -->
<TransparentActorFace name="af_DGluggasilla1" width="66" height="55"/>
<StaticActor name="a_DGluggasilla1" terrain="t_Dekkidl" x="0" y="375" z="0" state="stop" random="true">
	<State name="stop" face="af_DGluggasilla1"/> </StaticActor>
<ActorMoused actor="a_DGluggasilla1" listener="sc" moving="Gluggasilla" thf="gluggasillu"/>

<!-- DGluggasilla2 -->
<TransparentActorFace name="af_DGluggasilla2" width="79" height="17"/>
<StaticActor name="a_DGluggasilla2" terrain="t_Dekkidl" x="309" y="244" z="0" state="stop" random="true">
	<State name="stop" face="af_DGluggasilla2"/> </StaticActor>
<ActorMoused actor="a_DGluggasilla2" listener="sc" moving="Gluggasilla" thf="gluggasillu"/>

<!-- DOp1 -->
<TransparentActorFace name="af_DOp1" width="266" height="87"/>
<StaticActor name="a_DOp1" terrain="t_Dekkidl" x="703" y="512" z="0" state="stop" random="true">
	<State name="stop" face="af_DOp1"/> </StaticActor>
<ActorMoused actor="a_DOp1" listener="sc" moving="Op" thf="op"/>

<Scene name="s_Kaetan"/>

<Polygon name="p_Kaetan">
	<Point x="260" y="600"/>
	<Point x="140" y="460"/>
	<Point x="360" y="480"/>
	<Point x="470" y="460"/>
	<Point x="590" y="390"/>
	<Point x="800" y="450"/>
	<Point x="800" y="600"/>
	<Point x="800" y="1100"/>
	<Point x="260" y="1100"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Kaetan" scene="s_Kaetan" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="0.9"/>
<SimplePseudo3DTerrain name="t_Kaetanl" scene="s_Kaetan" polygon="p_Kaetan"
	zmin="-1" zmax="1500" defaultscaling="0.95" scaling2="0.88" scanline1="600" scanline2="430"/>

<!-- Background for Kaetan -->
<StaticActorFace name="af_Kaetan" file="\TyrkjarA\Graphic\Kaetan\Kaetan" />
<StaticActor name="a_Kaetan" terrain="t_Kaetan" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Kaetan"/> </StaticActor>
<PrepareQuantum name="qp_Kaetan1" object="af_Kaetan" prepare="true"/>
<PrepareQuantum name="qu_Kaetan1" object="af_Kaetan" prepare="false"/>

<!-- Frontur -->
<StaticActorFace name="af_Frontur1" file="\TyrkjarA\Graphic\Kaetan\Frontur1"/>
<StaticActor name="a_Frontur1" terrain="t_Kaetanl" x="0" y="600" z="600" state="stop">
	<State name="stop" face="af_Frontur1"/> </StaticActor>
<StaticActorFace name="af_Frontur2" file="\TyrkjarA\Graphic\Kaetan\Frontur2"/>
<StaticActor name="a_Frontur2" terrain="t_Kaetanl" x="0" y="752" z="600" state="stop">
	<State name="stop" face="af_Frontur2"/> </StaticActor>
<StaticActorFace name="af_Frontur3" file="\TyrkjarA\Graphic\Kaetan\Frontur3"/>
<StaticActor name="a_Frontur3" terrain="t_Kaetanl" x="0" y="947" z="600" state="stop">
	<State name="stop" face="af_Frontur3"/> </StaticActor>
<StaticActorFace name="af_Frontur4" file="\TyrkjarA\Graphic\Kaetan\Frontur4"/>
<StaticActor name="a_Frontur4" terrain="t_Kaetanl" x="463" y="600" z="600" state="stop">
	<State name="stop" face="af_Frontur4"/> </StaticActor>
<StaticActorFace name="af_Frontur5" file="\TyrkjarA\Graphic\Kaetan\Frontur5"/>
<StaticActor name="a_Frontur5" terrain="t_Kaetanl" x="571" y="681" z="600" state="stop">
	<State name="stop" face="af_Frontur5"/> </StaticActor>
<StaticActorFace name="af_Frontur6" file="\TyrkjarA\Graphic\Kaetan\Frontur6"/>
<StaticActor name="a_Frontur6" terrain="t_Kaetanl" x="690" y="853" z="600" state="stop">
	<State name="stop" face="af_Frontur6"/> </StaticActor>
<StaticActorFace name="af_Frontur7" file="\TyrkjarA\Graphic\Kaetan\Frontur7"/>
<StaticActor name="a_Frontur7" terrain="t_Kaetanl" x="429" y="1123" z="600" state="stop">
	<State name="stop" face="af_Frontur7"/> </StaticActor>
<PrepareQuantum name="qp_Kaetan2" object="af_Frontur1" prepare="true"/>
<PrepareQuantum name="qu_Kaetan2" object="af_Frontur1" prepare="false"/>
<PrepareQuantum name="qp_Kaetan3" object="af_Frontur2" prepare="true"/>
<PrepareQuantum name="qu_Kaetan3" object="af_Frontur2" prepare="false"/>
<PrepareQuantum name="qp_Kaetan4" object="af_Frontur3" prepare="true"/>
<PrepareQuantum name="qu_Kaetan4" object="af_Frontur3" prepare="false"/>
<PrepareQuantum name="qp_Kaetan5" object="af_Frontur4" prepare="true"/>
<PrepareQuantum name="qu_Kaetan5" object="af_Frontur4" prepare="false"/>
<PrepareQuantum name="qp_Kaetan6" object="af_Frontur5" prepare="true"/>
<PrepareQuantum name="qu_Kaetan6" object="af_Frontur5" prepare="false"/>
<PrepareQuantum name="qp_Kaetan7" object="af_Frontur6" prepare="true"/>
<PrepareQuantum name="qu_Kaetan7" object="af_Frontur6" prepare="false"/>
<PrepareQuantum name="qp_Kaetan8" object="af_Frontur7" prepare="true"/>
<PrepareQuantum name="qu_Kaetan8" object="af_Frontur7" prepare="false"/>

<!-- TyrknesktReipi -->
<StaticActorFace name="af_uTyrknesktReipi" file="\TyrkjarA\Graphic\Kaetan\uTyrkneA" prepare="true"/>
<StaticActor name="a_TyrknesktReipi" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_iTyrknesktReipi"/>
	<State name="use" face="af_uTyrknesktReipi"/>
</StaticActor>
<ActorMoused actor="a_TyrknesktReipi" listener="sc" moving="Reipi" thf="reipi"/>
<MoveActorQuantum name="q_MoveTyrknesktReipi2Inventory" actor="a_TyrknesktReipi" terrain="t_Inventory"/>
<MoveActorQuantum name="qh_TyrknesktReipi" actor="a_TyrknesktReipi"/>

<!-- Hot spot for moving to Dekkid -->
<TransparentActorFace name="af_Kaetan2Dekkid" width="308" height="64"/>
<StaticActor name="ta_Kaetan2Dekkid" terrain="t_Kaetanl" x="208" y="600" z="65" state="stop">
	<State name="stop" face="af_Kaetan2Dekkid"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_Kaetan2Dekkid" moving="Út á dekk" taking=" " looking=" " talking=" "/>
<Pseudo3DCollisionBox name="cb_Kaetan2Dekkid" x="200" y="20" z="10"/>
<StaticActor name="a_Kaetan2Dekkid" terrain="t_Kaetanl" x="400" y="585" z="0" state="stop" collision="ac_Kaetan2Dekkid">
	<State name="stop" collisionbox="cb_Kaetan2Dekkid"/> </StaticActor>
<MoveActorQuantum name="q_MoveKaetan2DekkidIn" actor="a_Kaetan2Dekkid" terrain="t_Kaetanl"/>
<MoveActorQuantum name="q_MoveKaetan2DekkidOut" actor="a_Kaetan2Dekkid"/>

<!-- KPudar1 -->
<TransparentActorFace name="af_KPudar1" width="280" height="160"/>
<StaticActor name="a_KPudar1" terrain="t_Kaetanl" x="214" y="277" z="0" state="stop" random="true">
	<State name="stop" face="af_KPudar1"/> </StaticActor>
<ActorMoused actor="a_KPudar1" listener="sc" moving="Púðar" thf="púða"/>

<!-- KPudar1 -->
<TransparentActorFace name="af_Dora" width="203" height="248"/>
<StaticActor name="a_Dora" terrain="t_Kaetanl" x="270" y="417" z="219" state="stop" random="true" save="true">
	<State name="stop" face="af_Dora"/> </StaticActor>
<ActorMoused actor="a_Dora" listener="sc" moving="Halldóra" thf="Halldóru"/>
<MoveActorQuantum name="qh_Dora" actor="a_Dora" />

<!-- KGluggi1 -->
<TransparentActorFace name="af_KGluggi1" width="51" height="141"/>
<StaticActor name="a_KGluggi1" terrain="t_Kaetanl" x="194" y="96" z="0" state="stop" random="true">
	<State name="stop" face="af_KGluggi1"/> </StaticActor>
<ActorMoused actor="a_KGluggi1" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- KGluggi2 -->
<TransparentActorFace name="af_KGluggi2" width="37" height="95"/>
<StaticActor name="a_KGluggi2" terrain="t_Kaetanl" x="318" y="126" z="0" state="stop" random="true">
	<State name="stop" face="af_KGluggi2"/> </StaticActor>
<ActorMoused actor="a_KGluggi2" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- KGluggi3 -->
<TransparentActorFace name="af_KGluggi3" width="65" height="108"/>
<StaticActor name="a_KGluggi3" terrain="t_Kaetanl" x="412" y="113" z="0" state="stop" random="true">
	<State name="stop" face="af_KGluggi3"/> </StaticActor>
<ActorMoused actor="a_KGluggi3" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<!-- KGluggi4 -->
<TransparentActorFace name="af_KGluggi4" width="65" height="116"/>
<StaticActor name="a_KGluggi4" terrain="t_Kaetanl" x="538" y="118" z="0" state="stop" random="true">
	<State name="stop" face="af_KGluggi4"/> </StaticActor>
<ActorMoused actor="a_KGluggi4" listener="sc" moving="Gluggi" thf="glugga" taking="Opna glugga"/>

<Scene name="s_UtanHelli"/>

<Polygon name="p_UtanHelli">
	<Point x="-200" y="600"/>
	<Point x="-200" y="500"/>
	<Point x="0" y="500"/>
	<Point x="290" y="490"/>
	<Point x="550" y="410"/>
	<Point x="800" y="530"/>
	<Point x="1000" y="530"/>
	<Point x="1000" y="600"/>
</Polygon>

<SimplePseudo3DTerrain name="t_UtanHelli" scene="s_UtanHelli" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="1.0"/>
<SimplePseudo3DTerrain name="t_UtanHellil" scene="s_UtanHelli" polygon="p_UtanHelli"
	zmin="-1" zmax="1500" defaultscaling="1.0" scaling2="0.9" scanline1="600" scanline2="460"/>

<!-- Background for UtanHelli -->
<StaticActorFace name="af_UtanHelli" file="\TyrkjarA\Graphic\UtanHelA\UtanHelA"/>
<StaticActor name="a_UtanHelli" terrain="t_UtanHelli" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_UtanHelli"/> </StaticActor>
<PrepareQuantum name="qp_UtanHelli1" object="af_UtanHelli" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli1" object="af_UtanHelli" prepare="false"/>

<!-- Faces for Steinn1-6 -->
<StaticActorFace name="af_Steinn1Inn" file="\TyrkjarA\Graphic\UtanHelA\Steinn1" />
<StaticActorFace name="af_Steinn1Midja" file="\TyrkjarA\Graphic\UtanHelA\Steinn2" />
<StaticActorFace name="af_Steinn1Ut" file="\TyrkjarA\Graphic\UtanHelA\Steinn3" />

<StaticActorFace name="af_Steinn2Inn" file="\TyrkjarA\Graphic\UtanHelA\Steinn1" />
<StaticActorFace name="af_Steinn2Midja" file="\TyrkjarA\Graphic\UtanHelA\Steinn2" />
<StaticActorFace name="af_Steinn2Ut" file="\TyrkjarA\Graphic\UtanHelA\Steinn3" />

<StaticActorFace name="af_Steinn3Inn" file="\TyrkjarA\Graphic\UtanHelA\Steinn1"/>
<StaticActorFace name="af_Steinn3Midja" file="\TyrkjarA\Graphic\UtanHelA\Steinn2"/>
<StaticActorFace name="af_Steinn3Ut" file="\TyrkjarA\Graphic\UtanHelA\Steinn3"/>

<StaticActorFace name="af_Steinn4Inn" file="\TyrkjarA\Graphic\UtanHelA\Steinn1"/>
<StaticActorFace name="af_Steinn4Midja" file="\TyrkjarA\Graphic\UtanHelA\Steinn2"/>
<StaticActorFace name="af_Steinn4Ut" file="\TyrkjarA\Graphic\UtanHelA\Steinn3"/>

<StaticActorFace name="af_Steinn5Inn" file="\TyrkjarA\Graphic\UtanHelA\Steinn1"/>
<StaticActorFace name="af_Steinn5Midja" file="\TyrkjarA\Graphic\UtanHelA\Steinn2"/>
<StaticActorFace name="af_Steinn5Ut" file="\TyrkjarA\Graphic\UtanHelA\Steinn3"/>

<StaticActorFace name="af_Steinn6Inn" file="\TyrkjarA\Graphic\UtanHelA\Steinn1"/>
<StaticActorFace name="af_Steinn6Midja" file="\TyrkjarA\Graphic\UtanHelA\Steinn2"/>
<StaticActorFace name="af_Steinn6Ut" file="\TyrkjarA\Graphic\UtanHelA\Steinn3"/>

<PrepareQuantum name="qp_UtanHelli2" object="af_Steinn1Inn" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli2" object="af_Steinn1Inn" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli3" object="af_Steinn1Midja" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli3" object="af_Steinn1Midja" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli4" object="af_Steinn1Ut" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli4" object="af_Steinn1Ut" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli5" object="af_Steinn2Inn" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli5" object="af_Steinn2Inn" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli6" object="af_Steinn2Midja" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli6" object="af_Steinn2Midja" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli7" object="af_Steinn2Ut" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli7" object="af_Steinn2Ut" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli8" object="af_Steinn3Inn" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli8" object="af_Steinn3Inn" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli9" object="af_Steinn3Midja" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli9" object="af_Steinn3Midja" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli10" object="af_Steinn3Ut" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli10" object="af_Steinn3Ut" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli11" object="af_Steinn4Inn" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli11" object="af_Steinn4Inn" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli12" object="af_Steinn4Midja" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli12" object="af_Steinn4Midja" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli13" object="af_Steinn4Ut" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli13" object="af_Steinn4Ut" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli14" object="af_Steinn5Inn" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli14" object="af_Steinn5Inn" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli15" object="af_Steinn5Midja" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli15" object="af_Steinn5Midja" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli16" object="af_Steinn5Ut" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli16" object="af_Steinn5Ut" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli17" object="af_Steinn6Inn" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli17" object="af_Steinn6Inn" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli18" object="af_Steinn6Midja" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli18" object="af_Steinn6Midja" prepare="false"/>
<PrepareQuantum name="qp_UtanHelli19" object="af_Steinn6Ut" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli19" object="af_Steinn6Ut" prepare="false"/>

<!-- Steinn1-6 -->
<StaticActor name="a_Steinn1" terrain="t_UtanHelli" x="200" y="206" z="6" state="in" save="true" random="true">
	<State name="in" face="af_Steinn1Inn"/>
	<State name="center" face="af_Steinn1Midja"/>
	<State name="out" face="af_Steinn1Ut"/> </StaticActor>
<StaticActor name="a_Steinn2" terrain="t_UtanHelli" x="230" y="205" z="5" state="in" save="true" random="true">
	<State name="in" face="af_Steinn2Inn"/>
	<State name="center" face="af_Steinn2Midja"/>
	<State name="out" face="af_Steinn2Ut"/> </StaticActor>
<StaticActor name="a_Steinn3" terrain="t_UtanHelli" x="260" y="204" z="4" state="in" save="true" random="true">
	<State name="in" face="af_Steinn3Inn"/>
	<State name="center" face="af_Steinn3Midja"/>
	<State name="out" face="af_Steinn3Ut"/> </StaticActor>
<StaticActor name="a_Steinn4" terrain="t_UtanHelli" x="290" y="203" z="3" state="in" save="true" random="true">
	<State name="in" face="af_Steinn4Inn"/>
	<State name="center" face="af_Steinn4Midja"/>
	<State name="out" face="af_Steinn4Ut"/> </StaticActor>
<StaticActor name="a_Steinn5" terrain="t_UtanHelli" x="320" y="202" z="2" state="in" save="true" random="true">
	<State name="in" face="af_Steinn5Inn"/>
	<State name="center" face="af_Steinn5Midja"/>
	<State name="out" face="af_Steinn5Ut"/> </StaticActor>
<StaticActor name="a_Steinn6" terrain="t_UtanHelli" x="350" y="201" z="1" state="in" save="true" random="true">
	<State name="in" face="af_Steinn6Inn"/>
	<State name="center" face="af_Steinn6Midja"/>
	<State name="out" face="af_Steinn6Ut"/> </StaticActor>
<StateQuantum name="q_Steinn1_in" actor="a_Steinn1" state="in"/>
<StateQuantum name="q_Steinn2_in" actor="a_Steinn2" state="in"/>
<StateQuantum name="q_Steinn3_in" actor="a_Steinn3" state="in"/>
<StateQuantum name="q_Steinn4_in" actor="a_Steinn4" state="in"/>
<StateQuantum name="q_Steinn5_in" actor="a_Steinn5" state="in"/>
<StateQuantum name="q_Steinn6_in" actor="a_Steinn6" state="in"/>
<StateQuantum name="q_Steinn1_center" actor="a_Steinn1" state="center"/>
<StateQuantum name="q_Steinn2_center" actor="a_Steinn2" state="center"/>
<StateQuantum name="q_Steinn3_center" actor="a_Steinn3" state="center"/>
<StateQuantum name="q_Steinn4_center" actor="a_Steinn4" state="center"/>
<StateQuantum name="q_Steinn5_center" actor="a_Steinn5" state="center"/>
<StateQuantum name="q_Steinn6_center" actor="a_Steinn6" state="center"/>
<StateQuantum name="q_Steinn1_out" actor="a_Steinn1" state="out"/>
<StateQuantum name="q_Steinn2_out" actor="a_Steinn2" state="out"/>
<StateQuantum name="q_Steinn3_out" actor="a_Steinn3" state="out"/>
<StateQuantum name="q_Steinn4_out" actor="a_Steinn4" state="out"/>
<StateQuantum name="q_Steinn5_out" actor="a_Steinn5" state="out"/>
<StateQuantum name="q_Steinn6_out" actor="a_Steinn6" state="out"/>
<ActorMoused listener="sc" actor="a_Steinn1" moving="Steinn" thf="stein" taking="Færa stein"/>
<ActorMoused listener="sc" actor="a_Steinn2" moving="Steinn" thf="stein" taking="Færa stein"/>
<ActorMoused listener="sc" actor="a_Steinn3" moving="Steinn" thf="stein" taking="Færa stein"/>
<ActorMoused listener="sc" actor="a_Steinn4" moving="Steinn" thf="stein" taking="Færa stein"/>
<ActorMoused listener="sc" actor="a_Steinn5" moving="Steinn" thf="stein" taking="Færa stein"/>
<ActorMoused listener="sc" actor="a_Steinn6" moving="Steinn" thf="stein" taking="Færa stein"/>

<!-- Sprunga -->
<StaticActorFace name="af_Sprunga" file="\TyrkjarA\Graphic\UtanHelA\Sprunga" />
<StaticActor name="a_Sprunga" x="50" y="70" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Sprunga"/> </StaticActor>
<ActorMoused listener="sc" actor="a_Sprunga" moving="Sprunga" thf="sprungu" taking="Troða sér inn um sprungu"/>
<MoveActorQuantum name="q_Sprunga_open" actor="a_Sprunga" terrain="t_UtanHelli"/>
<MoveActorQuantum name="q_Sprunga_closed" actor="a_Sprunga"/>
<PrepareQuantum name="qp_UtanHelli20" object="af_Sprunga" prepare="true"/>
<PrepareQuantum name="qu_UtanHelli20" object="af_Sprunga" prepare="false"/>

<!-- Hot spot for moving to UtanHusid -->
<TransparentActorFace name="af_UtanHelli2UtanHusid" width="102" height="108"/>
<StaticActor name="ta_UtanHelli2UtanHusid" terrain="t_UtanHellil" x="0" y="600" z="109" state="stop">
	<State name="stop" face="af_UtanHelli2UtanHusid"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_UtanHelli2UtanHusid" moving="Til heimahúss" taking=" " looking="Til heimahúss" talking=" "/>
<Pseudo3DCollisionBox name="cb_UtanHelli2UtanHusid" x="40" y="90" z="10"/>
<StaticActor name="a_UtanHelli2UtanHusid" terrain="t_UtanHellil" x="25" y="550" z="0" state="stop" collision="ac_UtanHelli2UtanHusid">
	<State name="stop" collisionbox="cb_UtanHelli2UtanHusid"/> </StaticActor>
<MoveActorQuantum name="q_MoveUtanHelli2UtanHusidIn" actor="a_UtanHelli2UtanHusid" terrain="t_UtanHellil"/>
<MoveActorQuantum name="q_MoveUtanHelli2UtanHusidOut" actor="a_UtanHelli2UtanHusid"/>

<!-- Hot spot for moving to Fjaran -->
<TransparentActorFace name="af_UtanHelli2Fjaran" width="149" height="112"/>
<StaticActor name="ta_UtanHelli2Fjaran" terrain="t_UtanHellil" x="650" y="600" z="113" state="stop">
	<State name="stop" face="af_UtanHelli2Fjaran"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_UtanHelli2Fjaran" moving="Niður í fjöru" taking=" " looking="Niður í fjöru" talking=" "/>
<Pseudo3DCollisionBox name="cb_UtanHelli2Fjaran" x="40" y="60" z="10"/>
<StaticActor name="a_UtanHelli2Fjaran" terrain="t_UtanHellil" x="775" y="565" z="0" state="stop" collision="ac_UtanHelli2Fjaran">
	<State name="stop" collisionbox="cb_UtanHelli2Fjaran"/> </StaticActor>
<MoveActorQuantum name="q_MoveUtanHelli2FjaranIn" actor="a_UtanHelli2Fjaran" terrain="t_UtanHellil"/>
<MoveActorQuantum name="q_MoveUtanHelli2FjaranOut" actor="a_UtanHelli2Fjaran"/>

<Text name="a_Mamma_acc" terrain="t_Corners" text=" " r="232" g="79" b="105" hilite="false"/>

<ScrollingScene name="s_Innihellir" width="1200" height="600"/>

<Polygon name="p_Innihellir">
	<Point x="200" y="550"/>
	<Point x="0" y="550"/>
	<Point x="0" y="355"/>
	<Point x="190" y="355"/>
	<Point x="259" y="290"/>
	<Point x="0" y="290"/>
	<Point x="0" y="190"/>
	<Point x="282" y="191"/>
	<Point x="292" y="253"/>
	<Point x="340" y="320"/>
	<Point x="530" y="350"/>
	<Point x="720" y="400"/>
	<Point x="810" y="400"/>
	<Point x="850" y="330"/>
	<Point x="1160" y="330"/>
	<Point x="1200" y="600"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Innihellir" scene="s_Innihellir" polygon="p_All"
	zmin="-7" zmax="-1" defaultscaling="0.65"/>
<SimplePseudo3DTerrain name="t_Innihellirl" scene="s_Innihellir" polygon="p_Innihellir"
	zmin="-1" zmax="1500" defaultscaling="0.75" scaling2="0.65" scanline1="600" scanline2="370"/>

<!-- Background for Innihellir -->
<StaticActorFace name="af_Innihellir1" file="\TyrkjarA\Graphic\InnihelA\InnihelA"/>
<StaticActor name="a_Innihellir1" terrain="t_Innihellir" x="0" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Innihellir1"/> </StaticActor>
<StaticActorFace name="af_Innihellir2" file="\TyrkjarA\Graphic\InnihelA\InnihelB"/>
<StaticActor name="a_Innihellir2" terrain="t_Innihellir" x="800" y="-2" z="-2" state="stop">
	<State name="stop" face="af_Innihellir2"/> </StaticActor>
<PrepareQuantum name="qp_Innihellir1" object="af_Innihellir1" prepare="true"/>
<PrepareQuantum name="qu_Innihellir1" object="af_Innihellir1" prepare="false"/>
<PrepareQuantum name="qp_Innihellir2" object="af_Innihellir2" prepare="true"/>
<PrepareQuantum name="qu_Innihellir2" object="af_Innihellir2" prepare="false"/>

<!-- Frontur1 -->
<StaticActorFace name="af_HellisFrontur1" file="\TyrkjarA\Graphic\InnihelA\Frontur1"/>
<StaticActor name="a_HellisFrontur1" terrain="t_Innihellir" x="0" y="600" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur1"/> </StaticActor>
<!-- Frontur2 -->
<StaticActorFace name="af_HellisFrontur2" file="\TyrkjarA\Graphic\InnihelA\Frontur2"/>
<StaticActor name="a_HellisFrontur2" terrain="t_Innihellir" x="285" y="600" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur2"/> </StaticActor>
<!-- Frontur3 -->
<StaticActorFace name="af_HellisFrontur3" file="\TyrkjarA\Graphic\InnihelA\Frontur3"/>
<StaticActor name="a_HellisFrontur3" terrain="t_Innihellir" x="813" y="600" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur3"/> </StaticActor>
<!-- Frontur4 -->
<StaticActorFace name="af_HellisFrontur4" file="\TyrkjarA\Graphic\InnihelA\Frontur4"/>
<StaticActor name="a_HellisFrontur4" terrain="t_Innihellir" x="1117" y="732" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur4"/> </StaticActor>
<!-- Frontur5 -->
<StaticActorFace name="af_HellisFrontur5" file="\TyrkjarA\Graphic\InnihelA\Frontur5"/>
<StaticActor name="a_HellisFrontur5" terrain="t_Innihellir" x="1062" y="992" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur5"/> </StaticActor>
<!-- Frontur6a -->
<StaticActorFace name="af_HellisFrontur6a" file="\TyrkjarA\Graphic\InnihelA\FronturA"/>
<StaticActor name="a_HellisFrontur6a" terrain="t_Innihellir" x="226" y="1033" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur6a"/> </StaticActor>
<!-- Frontur6b -->
<StaticActorFace name="af_HellisFrontur6b" file="\TyrkjarA\Graphic\InnihelA\FronturB"/>
<StaticActor name="a_HellisFrontur6b" terrain="t_Innihellir" x="1026" y="1033" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur6b"/> </StaticActor>
<!-- Frontur7 -->
<StaticActorFace name="af_HellisFrontur7" file="\TyrkjarA\Graphic\InnihelA\Frontur7"/>
<StaticActor name="a_HellisFrontur7" terrain="t_Innihellir" x="0" y="912" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur7"/> </StaticActor>
<!-- Frontur8 -->
<StaticActorFace name="af_HellisFrontur8" file="\TyrkjarA\Graphic\InnihelA\Frontur8"/>
<StaticActor name="a_HellisFrontur8" terrain="t_Innihellir" x="0" y="650" z="600" state="stop">
	<State name="stop" face="af_HellisFrontur8"/> </StaticActor>
<PrepareQuantum name="qp_Innihellir3" object="af_HellisFrontur1" prepare="true"/>
<PrepareQuantum name="qu_Innihellir3" object="af_HellisFrontur1" prepare="false"/>
<PrepareQuantum name="qp_Innihellir4" object="af_HellisFrontur2" prepare="true"/>
<PrepareQuantum name="qu_Innihellir4" object="af_HellisFrontur2" prepare="false"/>
<PrepareQuantum name="qp_Innihellir5" object="af_HellisFrontur3" prepare="true"/>
<PrepareQuantum name="qu_Innihellir5" object="af_HellisFrontur3" prepare="false"/>
<PrepareQuantum name="qp_Innihellir6" object="af_HellisFrontur4" prepare="true"/>
<PrepareQuantum name="qu_Innihellir6" object="af_HellisFrontur4" prepare="false"/>
<PrepareQuantum name="qp_Innihellir7" object="af_HellisFrontur5" prepare="true"/>
<PrepareQuantum name="qu_Innihellir7" object="af_HellisFrontur5" prepare="false"/>
<PrepareQuantum name="qp_Innihellir8a" object="af_HellisFrontur6a" prepare="true"/>
<PrepareQuantum name="qu_Innihellir8a" object="af_HellisFrontur6a" prepare="false"/>
<PrepareQuantum name="qp_Innihellir8b" object="af_HellisFrontur6b" prepare="true"/>
<PrepareQuantum name="qu_Innihellir8b" object="af_HellisFrontur6b" prepare="false"/>
<PrepareQuantum name="qp_Innihellir9" object="af_HellisFrontur7" prepare="true"/>
<PrepareQuantum name="qu_Innihellir9" object="af_HellisFrontur7" prepare="false"/>
<PrepareQuantum name="qp_Innihellir10" object="af_HellisFrontur8" prepare="true"/>
<PrepareQuantum name="qu_Innihellir10" object="af_HellisFrontur8" prepare="false"/>


<!-- Feluklettur -->
<StaticActorFace name="af_Feluklettur" file="\TyrkjarA\Graphic\InnihelA\FelukleA"/>
<StaticActor name="a_Feluklettur" terrain="t_Innihellirl" x="52" y="302" z="256" state="stop" random="true">
 	<State name="stop" face="af_Feluklettur"/> </StaticActor>
<ActorMoused actor="a_Feluklettur" listener="sc" moving="Klettur" thf="klett"/>
<PrepareQuantum name="qp_Innihellir11" object="af_Feluklettur" prepare="true"/>
<PrepareQuantum name="qu_Innihellir11" object="af_Feluklettur" prepare="false"/>

<!-- Pabbi -->

<SpeechActorMouth name="m_StunaPabbi" file="\TyrkjarA\Media\nonames\stuna1.wav" acc="a_Mamma_acc">
	<Sentence text=" " time="0"/> </SpeechActorMouth>
<StaticActorFace name="af_Pabbi" file="\TyrkjarA\animatiA\aukaperA\pabbi\stop" prepare="false"/>
<CelledAnimated2DActorFace name="af_PabbiTalk" repeat="-1" file="\TyrkjarA\AnimatiA\aukaperA\pabbi\hissa" count="2" prepare="false" speed="225"/>
<Pseudo3DCollisionBox name="cb_Pabbi" x="96" y="20" z="228"/>
<StaticActor name="a_Pabbi" terrain="t_Innihellirl" x="514" y="373" z="1" state="stop" save="true" random="true">
 	<State name="stop" face="af_Pabbi" collisionbox="cb_Pabbi"/>
	<State name="talk" face="af_PabbiTalk" collisionbox="cb_Pabbi" mouth="m_StunaPabbi"/>
 </StaticActor>
<ActorMoused actor="a_Pabbi" listener="sc" moving="Hræddur maður" thf="hræddan mann" taking="Klappa hræddum manni"/>
<StateQuantum name="q_PabbiStop" actor="a_Pabbi" state="stop" wait="false"/>
<StateQuantum name="q_PabbiTalk" actor="a_Pabbi" state="talk" wait="true"/>
<MoveActorQuantum name="qh_Pabbi" actor="a_Pabbi" />
<PrepareQuantum name="qp_Innihellir12" object="af_Pabbi" prepare="true"/>
<PrepareQuantum name="qu_Innihellir12" object="af_Pabbi" prepare="false"/>
<PrepareQuantum name="qp_Innihellir13" object="af_PabbiTalk" prepare="true"/>
<PrepareQuantum name="qu_Innihellir13" object="af_PabbiTalk" prepare="false"/>


<!-- Kalli1 -->
<SpeechActorMouth name="m_StunaKalli1" file="\TyrkjarA\Media\nonames\stuna2.wav" acc="a_Mamma_acc">
	<Sentence text=" " time="0"/> </SpeechActorMouth>
<StaticActorFace name="af_Kalli1" file="\TyrkjarA\animatiA\aukaperA\kall1" />
<CelledAnimated2DActorFace name="af_Kalli1Talk" repeat="-1" file="\TyrkjarA\AnimatiA\aukaperA\karl1" count="4" speed="225"/>
<Pseudo3DCollisionBox name="cb_Kalli1" x="70" y="20" z="235"/>
<StaticActor name="a_Kalli1" terrain="t_Innihellirl" x="395" y="348" z="1" state="stop" save="true" random="true">
 	<State name="stop" face="af_Kalli1" collisionbox="cb_Kalli1"/>
	<State name="talk" face="af_Kalli1Talk" collisionbox="cb_Kalli1" mouth="m_StunaKalli1"/>
 </StaticActor>
<ActorMoused actor="a_Kalli1" listener="sc" moving="Gamall maður" thf="gamlan mann" taking="Klappa gömlum manni"/>
<StateQuantum name="q_Kalli1Stop" actor="a_Kalli1" state="stop" wait="false"/>
<StateQuantum name="q_Kalli1Talk" actor="a_Kalli1" state="talk" wait="true"/>
<MoveActorQuantum name="qh_Kalli1" actor="a_Kalli1" />
<PrepareQuantum name="qp_Innihellir14" object="af_Kalli1" prepare="true"/>
<PrepareQuantum name="qu_Innihellir14" object="af_Kalli1" prepare="false"/>
<PrepareQuantum name="qp_Innihellir15" object="af_Kalli1Talk" prepare="true"/>
<PrepareQuantum name="qu_Innihellir15" object="af_Kalli1Talk" prepare="false"/>

<!-- Kalli2 -->
<SpeechActorMouth name="m_StunaKalli2" file="\TyrkjarA\Media\nonames\stuna3.wav" acc="a_Mamma_acc">
	<Sentence text=" " time="0"/> </SpeechActorMouth>
<StaticActorFace name="af_Kalli2" file="\TyrkjarA\animatiA\aukaperA\kall2" />
<CelledAnimated2DActorFace name="af_Kalli2Talk" repeat="-1" file="\TyrkjarA\AnimatiA\aukaperA\karl2" count="4" speed="225"/>
<Pseudo3DCollisionBox name="cb_Kalli2" x="94" y="20" z="232"/>
<StaticActor name="a_Kalli2" terrain="t_Innihellirl" x="626" y="400" z="1" state="stop" save="true" random="true">
 	<State name="stop" face="af_Kalli2" collisionbox="cb_Kalli2"/>
	<State name="talk" face="af_Kalli2Talk" collisionbox="cb_Kalli2" mouth="m_StunaKalli2"/>
 </StaticActor>
<ActorMoused actor="a_Kalli2" listener="sc" moving="Gamall maður" thf="gamlan mann" taking="Klappa gömlum manni"/>
<StateQuantum name="q_Kalli2Stop" actor="a_Kalli2" state="stop" wait="false"/>
<StateQuantum name="q_Kalli2Talk" actor="a_Kalli2" state="talk" wait="true"/>
<MoveActorQuantum name="qh_Kalli2" actor="a_Kalli2" />
<PrepareQuantum name="qp_Innihellir16" object="af_Kalli2" prepare="true"/>
<PrepareQuantum name="qu_Innihellir16" object="af_Kalli2" prepare="false"/>
<PrepareQuantum name="qp_Innihellir17" object="af_Kalli2Talk" prepare="true"/>
<PrepareQuantum name="qu_Innihellir17" object="af_Kalli2Talk" prepare="false"/>

<!-- Prestsfru -->
<StaticActorFace name="af_Prestsfru" file="\TyrkjarA\animatiA\aukaperA\prestsfA" />
<SpeechActorMouth name="m_Op" file="\TyrkjarA\Media\nonames\op.wav" acc="a_Mamma_acc">
	<Sentence text=" " time="0"/> </SpeechActorMouth>
<CelledAnimated2DActorFace name="af_PrestsfruTalk" repeat="1" file="\TyrkjarA\AnimatiA\aukaperA\prestsfB" count="4" speed="225"/>
<Pseudo3DCollisionBox name="cb_Prestsfru" x="68" y="20" z="221"/>
<StaticActor name="a_Prestsfru" terrain="t_Innihellirl" x="890" y="385" z="1" state="stop" save="true" random="true">
 	<State name="stop" face="af_Prestsfru" collisionbox="cb_Prestsfru"/>
	<State name="talk" face="af_PrestsfruTalk" collisionbox="cb_Prestsfru" mouth="m_Op"/>
 </StaticActor>
<ActorMoused actor="a_Prestsfru" listener="sc" moving="Prestsfrú" thf="prestsfrú"/>
<StateQuantum name="q_PrestsfruStop" actor="a_Prestsfru" state="stop" wait="false"/>
<StateQuantum name="q_PrestsfruTalk" actor="a_Prestsfru" state="talk" wait="true"/>
<MoveActorQuantum name="qh_Prestsfru" actor="a_Prestsfru" />
<PrepareQuantum name="qp_Innihellir18" object="af_Prestsfru" prepare="true"/>
<PrepareQuantum name="qu_Innihellir18" object="af_Prestsfru" prepare="false"/>
<PrepareQuantum name="qp_Innihellir19" object="af_PrestsfruTalk" prepare="true"/>
<PrepareQuantum name="qu_Innihellir19" object="af_PrestsfruTalk" prepare="false"/>

<!-- Sera Jón -->
<Text name="a_Jon_acc" terrain="t_Corners" text=" " color="red" hilite="false"/>

<StaticActorFace name="af_Jon" file="\TyrkjarA\AnimatiA\Jon\stop" />
<StaticActorFace name="af_Jon_dead" file="\TyrkjarA\AnimatiA\Jon\Daudur"/>
<CelledAnimated2DActorFace name="af_Jon_talk" repeat="-1" file="\TyrkjarA\AnimatiA\Jon\talk" count="4" random="true" speed="150"/>
<SpeechActorMouth name="m_GudiSeLof" file="\TyrkjarA\Media\Jon\GudiSeLA.wav" acc="a_Jon_acc">
	<Sentence text="Guði sé lof að bannsettur Hund-Tyrkinn ..." time="0"/>
	<Sentence text="... hefur ekki náð ykkur, börnin mín." time="2900"/> </SpeechActorMouth>
<SpeechActorMouth name="m_GudiSeLofAdThu" file="\TyrkjarA\Media\Jon\gudiselB.wav" acc="a_Jon_acc">
	<Sentence text="Guði sé lof að þú ert á lífi Sigrún ..." time="0"/>
	<Sentence text="... en hvar er hún Halldóra systir þín?" time="3561"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ThuVerdurAdBjarga" file="\TyrkjarA\Media\Jon\thuverdA.wav" acc="a_Jon_acc">
	<Sentence text="Þú verður að bjarga systur þinni úr klóm Tyrkjans ..." time="0"/>
	<Sentence text="... áður en það verður of seint." time="4314"/> </SpeechActorMouth>
<SpeechActorMouth name="m_FelaYkkur" file="\TyrkjarA\Media\Jon\FelaYkkA.wav" acc="a_Jon_acc">
	<Sentence text="Nú er enginn tími til að tala, heiðingjarnir eru á leiðinni." time="0"/>
	<Sentence text="Þið verðið að fela ykkur strax." time="4958"/>
	<Sentence text="Það er bara verst hvað það er lítið pláss hérna fyrir ykkur." time="6755"/> </SpeechActorMouth>
<Pseudo3DCollisionBox name="cb_Jon" x="84" y="20" z="249"/>
<Pseudo3DCollisionBox name="cb_Jon_dead" x="279" y="60" z="70"/>
<PrepareQuantum name="qp_Innihellir20" object="af_Jon" prepare="true"/>
<PrepareQuantum name="qu_Innihellir20" object="af_Jon" prepare="false"/>
<PrepareQuantum name="qp_Innihellir21" object="af_Jon_talk" prepare="true"/>
<PrepareQuantum name="qu_Innihellir21" object="af_Jon_talk" prepare="false"/>
<PrepareQuantum name="qp_Innihellir22" object="af_Jon_dead" prepare="true"/>
<PrepareQuantum name="qu_Innihellir22" object="af_Jon_dead" prepare="false"/>

<StaticActor name="a_Jon" terrain="t_Innihellirl" x="785" y="422" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Jon" collisionbox="cb_Jon"/>
	<State name="dead" face="af_Jon_dead" collisionbox="cb_Jon_dead"/>
	<State name="GudiSeLof" face="af_Jon_talk" collisionbox="cb_Jon" mouth="m_GudiSeLof"/>
	<State name="FelaYkkur" face="af_Jon_talk" collisionbox="cb_Jon" mouth="m_FelaYkkur"/>
	<State name="GudiSeLofAdThu" face="af_Jon_talk" mouth="m_GudiSeLofAdThu" collisionbox="cb_Jon"/>
	<State name="ThuVerdurAdBjarga" face="af_Jon_talk" mouth="m_ThuVerdurAdBjarga" collisionbox="cb_Jon"/>
</StaticActor>
<ActorMoused actor="a_Jon" listener="sc" moving="Séra Jón Þorsteinsson á Kirkjubæ" thf="séra Jón Þorsteinsson á Kirkjubæ"/>

<!-- Quanta for séra Jón -->
<StateQuantum name="q_Jon_stop" actor="a_Jon" state="stop" wait="false"/>
<StateQuantum name="q_dead" actor="a_Jon" state="dead" wait="false"/>
<StateQuantum name="q_GudiSeLof" actor="a_Jon" state="GudiSeLof" wait="true"/>
<StateQuantum name="q_FelaYkkur" actor="a_Jon" state="FelaYkkur" wait="true"/>
<StateQuantum name="q_GudiSeLofAdThu" actor="a_Jon" state="GudiSeLofAdThu" wait="true"/>
<StateQuantum name="q_ThuVerdurAdBjarga" actor="a_Jon" state="ThuVerdurAdBjarga" wait="true"/>
<MoveActorQuantum name="q_MoveJohnDead" actor="a_Jon" terrain="t_Innihellirl"> <Location x="566" y="467" z="1"/> </MoveActorQuantum>


<!-- Hot spot for moving outside -->
<TransparentActorFace name="af_Innihellir2UtanHelli" width="270" height="245"/>
<StaticActor name="ta_Innihellir2UtanHelli" terrain="t_Innihellirl" x="920" y="345" z="250" state="stop">
	<State name="stop" face="af_Innihellir2UtanHelli"/> </StaticActor>
<ActorMoused listener="sc" actor="ta_Innihellir2UtanHelli" moving="Út úr helli" taking=" " looking="Út úr helli" talking=" "/>
<Pseudo3DCollisionBox name="cb_Innihellir2UtanHelli" x="120" y="40" z="10"/>
<StaticActor name="a_Innihellir2UtanHelli" terrain="t_Innihellirl" x="1060" y="360" z="0" state="stop" collision="ac_Innihellir2UtanHelli">
	<State name="stop" collisionbox="cb_Innihellir2UtanHelli"/> </StaticActor>

<StaticActorFace name="af_TimaSteinn" file="\TyrkjarA\Graphic\innihelA\TimaSteA" />
<StaticActorFace name="af_uTimaSteinn" file="\TyrkjarA\Graphic\innihelA\uTimaStA" prepare="true"/>
<StaticActor name="a_TimaSteinn" x="435" y="378" z="1" state="stop" save="true" random="true">
	<State name="stop" face="af_TimaSteinn" />
	<State name="taken" face="af_iTimaSteinn"/>
	<State name="use" face="af_uTimaSteinn"/>
</StaticActor>
<StateQuantum name="q_TimaSteinn_taken" actor="a_TimaSteinn" state="taken"/>
<ActorMoused actor="a_TimaSteinn" listener="sc" moving="Steinn" thf="stein"/>
<MoveActorQuantum name="qs_TimaSteinn" actor="a_TimaSteinn" terrain="t_Innihellirl"/>
<MoveActorQuantum name="qh_TimaSteinn" actor="a_TimaSteinn" />
<MoveActorQuantum name="q_MoveTimaSteinn2Inventory" actor="a_TimaSteinn" terrain="t_Inventory"/>
<PrepareQuantum name="qp_Innihellir23" object="af_TimaSteinn" prepare="true"/>
<PrepareQuantum name="qu_Innihellir23" object="af_TimaSteinn" prepare="false"/>

<StaticActorFace name="af_uTimaSteinnSulta" file="\TyrkjarA\Graphic\innihelA\uTimaStB" prepare="true"/>
<StaticActor name="a_TimaSteinnSulta" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_iTimaSteinnSulta"/>
	<State name="use" face="af_uTimaSteinnSulta"/>
</StaticActor>
<ActorMoused actor="a_TimaSteinnSulta" listener="sc" moving=" " thf="klístraðan stein"/>
<MoveActorQuantum name="qh_TimaSteinnSulta" actor="a_TimaSteinnSulta" />
<MoveActorQuantum name="q_MoveTimaSteinnSulta2Inventory" actor="a_TimaSteinnSulta" terrain="t_Inventory"/>

<StaticActorFace name="af_uBrotSulta" file="\TyrkjarA\Graphic\dekkid\uBrotsuA" prepare="true"/>
<StaticActor name="a_BrotSulta" x="0" y="0" z="0" state="taken" save="true" random="true">
	<State name="taken" face="af_iBrotSulta"/>
	<State name="use" face="af_uBrotSulta"/>
</StaticActor>
<ActorMoused actor="a_BrotSulta" listener="sc" moving=" " thf="klístraðan stein"/>
<MoveActorQuantum name="qh_BrotSulta" actor="a_BrotSulta" />
<MoveActorQuantum name="q_MoveBrotSulta2Inventory" actor="a_BrotSulta" terrain="t_Inventory"/>

<!-- RunaClimber -->
<CelledAnimated2DActorFace name="af_RunaClimber" repeat="1" file="\TyrkjarA\AnimatiA\sigrun\klifrar" count="9" prepare="false" speed="300"/>
<StaticActor name="a_RunaClimber" x="96" y="334" z="380" state="none" save="true">
 	<State name="stop" face="af_RunaClimber" />
 </StaticActor>
<StateQuantum name="q_RunaClimb" actor="a_RunaClimber" state="stop" wait="true"/>
<MoveActorQuantum name="qh_RunaClimber" actor="a_RunaClimber" />
<MoveActorQuantum name="qs_RunaClimber" actor="a_RunaClimber" terrain="t_Innihellirl"/>

<!-- DoraClimber -->
<CelledAnimated2DActorFace name="af_DoraClimber" repeat="1" file="\TyrkjarA\AnimatiA\halldora\hopp" count="7" prepare="false" speed="300"/>
<StaticActor name="a_DoraClimber" x="58" y="335" z="400" state="none" save="true">
 	<State name="stop" face="af_DoraClimber" />
 </StaticActor>
<StateQuantum name="q_DoraClimb" actor="a_DoraClimber" state="stop" wait="true"/>
<MoveActorQuantum name="qh_DoraClimber" actor="a_DoraClimber" />
<MoveActorQuantum name="qs_DoraClimber" actor="a_DoraClimber" terrain="t_Innihellirl"/>

<!-- Snaeri -->
<StaticActorFace name="af_Snaeri" file="\TyrkjarA\Graphic\innihelA\kadall" prepare="false"/>
<StaticActor name="a_Snaeri" x="111" y="330" z="390" state="stop" save="true">
 	<State name="stop" face="af_Snaeri" />
 </StaticActor>
<MoveActorQuantum name="qh_Snaeri" actor="a_Snaeri" />
<MoveActorQuantum name="qs_Snaeri" actor="a_Snaeri" terrain="t_Innihellirl"/>

<PrepareQuantum name="qp_Klifur1" object="af_RunaClimber" prepare="true"/>
<PrepareQuantum name="qp_Klifur2" object="af_DoraClimber" prepare="true"/>
<PrepareQuantum name="qu_Klifur1" object="af_RunaClimber" prepare="false"/>
<PrepareQuantum name="qu_Klifur2" object="af_DoraClimber" prepare="false"/>
<PrepareQuantum name="qp_Innihellir24" object="af_Snaeri" prepare="true"/>
<PrepareQuantum name="qu_Innihellir24" object="af_Snaeri" prepare="false"/>

<ActorMoused actor="a_SkeytiLarge" listener="sc" moving="Til baka" taking="Til baka" looking="Til baka" talking="Til baka"/>

<!-- Actors -->
<!-- Sigrun -->

<Text name="a_Sigrun_acc" terrain="t_Corners" text=" " color="white" hilite="false"/>

<StaticActorFace name="Sigrun_stop" file="\TyrkjarA\AnimatiA\Sigrun\stop" prepare="true"/>
<CelledAnimated2DActorFace name="Sigrun_right" repeat="-1" file="\TyrkjarA\AnimatiA\Sigrun\right" count="8" prepare="true" xoffset="-30" yoffset="0"/>
<CelledAnimated2DActorFace name="Sigrun_left" repeat="-1" file="\TyrkjarA\AnimatiA\Sigrun\left" count="8" prepare="true" xoffset="-20" yoffset="0"/>
<CelledAnimated2DActorFace name="Sigrun_front" repeat="-1" file="\TyrkjarA\AnimatiA\Sigrun\front" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="Sigrun_back" repeat="-1" file="\TyrkjarA\AnimatiA\Sigrun\back" count="6" prepare="true"/>

<CelledAnimated2DActorFace name="Sigrun_stop2right" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\stop2riA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="Sigrun_stop2left" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\stop2leA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="Sigrun_stop2back" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\stop2baA" count="1" prepare="true"/>

<CelledAnimated2DActorFace name="Sigrun_stop2talk" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\stop2taA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="Sigrun_talk" repeat="-1" file="\TyrkjarA\AnimatiA\Sigrun\talk" count="4" prepare="true" xoffset="-26" yoffset="0" random="true" speed="150"/>

<CelledAnimated2DActorFace name="Sigrun_jam" repeat="4" file="\TyrkjarA\AnimatiA\Sigrun\jam" count="2" speed="150" prepare="true"/>
<CelledAnimated2DActorFace name="Sigrun_dead" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\dead" count="3" speed="250" xoffset="-70" yoffset="0" prepare="true"/>
<CelledAnimated2DActorFace name="Sigrun_alive" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\alive" count="2" speed="250" xoffset="-70" yoffset="0" prepare="true"/>

<StaticActorFace name="Sigrun_tied" file="\TyrkjarA\AnimatiA\Sigrun\tied" prepare="true" xoffset="-24" yoffset="108"/>
<CelledAnimated2DActorFace name="Sigrun_tiedtalk" repeat="-1" file="\TyrkjarA\AnimatiA\Sigrun\tiedtalk" count="3" prepare="true" speed="150" xoffset="-24" yoffset="108"/>

<CelledAnimated2DActorFace name="Sigrun_breakbottle" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\breakboA" count="8" prepare="true" xoffset="-100" yoffset="0" speed="150"/>

<SpeechActorMouth name="m_HverEr" file="\TyrkjarA\Media\sigrun\hverer.wav" acc="a_Sigrun_acc">
	<Sentence text="Hver er þessi Hund-Tyrki?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HvadEr" file="\TyrkjarA\Media\sigrun\HvadEr.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvað er Barbaríið?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HvadaSogur" file="\TyrkjarA\Media\sigrun\HvadaSoA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvaða sögur frá Grindavík var mamma að tala um?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HvadaDagur" file="\TyrkjarA\Media\sigrun\HvadaDaA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvaða dagur er aftur í dag?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Bless" file="\TyrkjarA\Media\sigrun\Bless.wav" acc="a_Sigrun_acc">
	<Sentence text="Bless!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Audvitad" file="\TyrkjarA\Media\sigrun\Audvitad.wav" acc="a_Sigrun_acc">
	<Sentence text="Jú, auðvitað man ég það." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Tyrklandi" file="\TyrkjarA\Media\sigrun\TyrklanA.wav" acc="a_Sigrun_acc">
	<Sentence text="Á Hund-Tyrkinn heima í Tyrklandi?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_EgGraedi" file="\TyrkjarA\Media\sigrun\use4.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég græði ekkert á þessu núna!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Hvernig" file="\TyrkjarA\Media\sigrun\Hvernig.wav" acc="a_Sigrun_acc">
	<Sentence text="Sæll vinur! Hvernig komst þú hingað?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Nei" file="\TyrkjarA\Media\sigrun\Nei.wav" acc="a_Sigrun_acc">
	<Sentence text="Nei, því miður." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_LeysaMig" file="\TyrkjarA\Media\sigrun\LeysaMig.wav" acc="a_Sigrun_acc">
	<Sentence text="Viltu leysa mig?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_SedModur" file="\TyrkjarA\Media\sigrun\SedModur.wav" acc="a_Sigrun_acc">
	<Sentence text="Hefur þú nokkuð séð móður mína og hana Halldóru systur mína?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_EkkertAdOttast" file="\TyrkjarA\Media\sigrun\EkkertAA.wav" acc="a_Sigrun_acc">
	<Sentence text="Það er ekkert að óttast." time="0"/>
	<Sentence text="Ég er viss um að hirðstjórinn, herra Holgeir Rósinkrans, ..." time="1185"/>
	<Sentence text="... kemur með hermenn og bjargar okkur." time="3128"/> </SpeechActorMouth>
<SpeechActorMouth name="m_EkkiBundinn" file="\TyrkjarA\Media\sigrun\EkkiBunA.wav" acc="a_Sigrun_acc">
	<Sentence text="Af hverju ert þú ekki bundinn?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HeitirThu" file="\TyrkjarA\Media\sigrun\HeitirTA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvað heitir þú litli vinur?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_AdSjalfsogdu" file="\TyrkjarA\Media\sigrun\AdSjalfA.wav" acc="a_Sigrun_acc">
	<Sentence text="Jú, að sjálfsögðu. Hún er ekki systir mín fyrir ekki neitt." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_VerdAdBjarga" file="\TyrkjarA\Media\sigrun\VerdAdBA.wav" acc="a_Sigrun_acc">
	<Sentence text="Viltu vera svo vænn að losa mig. Ég verð að bjarga Halldóru!!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_MeidduHalldoru" file="\TyrkjarA\Media\sigrun\MeidduHA.wav" acc="a_Sigrun_acc">
	<Sentence text="Sástu hvort þeir meiddu Halldóru systur mína?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_GefaTher" file="\TyrkjarA\Media\sigrun\GefaTher.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég skal gefa þér sultu ef þú losar mig." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_FyndistTher" file="\TyrkjarA\Media\sigrun\FyndistA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvernig fyndist þér ef einhver úr þinni fjölskyldu ..." time="0"/>
	<Sentence text="... væri fangi Hund-Tyrkjans og einhver strákur vildi ekki losa þig?" time="1884"/> </SpeechActorMouth>
<SpeechActorMouth name="m_EgLofa" file="\TyrkjarA\Media\sigrun\EgLofa.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég lofa því." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_SeraJonVirdist" file="\TyrkjarA\Media\sigrun\malgladA.wav" acc="a_Sigrun_acc">
	<Sentence text="Séra Jón virðist ekki vera mjög málglaður núna." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ThadErEnginnTimiTil" file="\TyrkjarA\Media\sigrun\thadereA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég hef ekki tíma til að tala meira við hann." time="0"/>
</SpeechActorMouth>
<SpeechActorMouth name="m_Vona" file="\TyrkjarA\Media\sigrun\Vona.wav" acc="a_Sigrun_acc">
	<Sentence text="Nei, ég var að vona að hún væri með þér." time="0"/>
	<Sentence text="Við verðum bara að vona að hún hafi komist undan heilu og höldnu." time="2500"/> </SpeechActorMouth>
<SpeechActorMouth name="m_JaEnHvar" file="\TyrkjarA\Media\sigrun\jaenhvar.wav" acc="a_Sigrun_acc">
	<Sentence text="Já, en hvar?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_VeistThu" file="\TyrkjarA\Media\sigrun\veistthu.wav" acc="a_Sigrun_acc">
	<Sentence text="Veist þú um einhvern öruggan felustað?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_InnUtInnInnUt" file="\TyrkjarA\Media\sigrun\egseherA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég sé hér flöskuskeyti." time="0"/>
	<Sentence text="Á því stendur: Inn, út, inn, inn, út." time="2500"/>
	<Sentence text="Ég endurtek: Inn, út, inn, inn, út." time="7000"/> </SpeechActorMouth>

<SpeechActorMouth name="m_HversVegna" file="\TyrkjarA\Media\sigrun\HversVeA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvers vegna fóru Tyrkirnir með þig upp í skip?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HeyrduHalldora" file="\TyrkjarA\Media\sigrun\heyrduhA.wav" acc="a_Sigrun_acc">
	<Sentence text="Heyrðu Halldóra!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Hund" file="\TyrkjarA\Media\sigrun\hund.wav" acc="a_Sigrun_acc">
	<Sentence text="Hund-Tyrkinn tók hana og fór með hana í skip sitt!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_VaFlottirPudar" file="\TyrkjarA\Media\sigrun\vaflottA.wav" acc="a_Sigrun_acc">
	<Sentence text="Vá! Flottir púðar." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_KomduSaellSera" file="\TyrkjarA\Media\sigrun\KomduSaA.wav" acc="a_Sigrun_acc">
	<Sentence text="Komdu sæll séra Jón!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_MadurLifir" file="\TyrkjarA\Media\sigrun\MadurLiA.wav" acc="a_Sigrun_acc">
	<Sentence text="Maður lifir ekki á brauði einu saman!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ThettaErAskurinn" file="\TyrkjarA\Media\sigrun\ThettaEA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er askurinn minn." time="0"/>
	<Sentence text="Hann er fullur af bláberjasultu!" time="1646"/> </SpeechActorMouth>
<SpeechActorMouth name="m_MammaLitur" file="\TyrkjarA\Media\sigrun\MammaLiA.wav" acc="a_Sigrun_acc">
	<Sentence text="Mamma lítur út fyrir að þjást af smá streitu!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Korktappi" file="\TyrkjarA\Media\sigrun\KorktapA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er bara venjulegur korktappi!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_TunnanErFull" file="\TyrkjarA\Media\sigrun\TunnanEA.wav" acc="a_Sigrun_acc">
	<Sentence text="Tunnan er full af vatni!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ThettaErHun" file="\TyrkjarA\Media\sigrun\ThettaEB.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er hún Halldóra, systir mín." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ErtThuVissUm" file="\TyrkjarA\Media\sigrun\ErtThuVA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ert þú viss um að þetta sé svo góð hugmynd?" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Ubbss" file="\TyrkjarA\Media\sigrun\Ubbss.wav" acc="a_Sigrun_acc">
	<Sentence text="Úbbbss. " time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_TunnanErGaltom" file="\TyrkjarA\Media\sigrun\TunnanEB.wav" acc="a_Sigrun_acc">
	<Sentence text="Tunnan er galtóm núna!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HunErAlltOfThung" file="\TyrkjarA\Media\sigrun\HunErAlA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hún er allt of þung.  Ég gæti aldrei haldið á henni!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Snidugt" file="\TyrkjarA\Media\sigrun\Snidugt.wav" acc="a_Sigrun_acc">
	<Sentence text="Sniðugt!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_TunnanSokk" file="\TyrkjarA\Media\sigrun\TunnanSA.wav" acc="a_Sigrun_acc">
	<Sentence text="Æ, tunnan sökk!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Snjallraedi" file="\TyrkjarA\Media\sigrun\SnjallrA.wav" acc="a_Sigrun_acc">
	<Sentence text="Snjallræði! Nú kemst ég út í skipið." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_EgKannast" file="\TyrkjarA\Media\sigrun\EgKannaA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég kannast eitthvað við þennan strák." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Prik" file="\TyrkjarA\Media\sigrun\Prik.wav" acc="a_Sigrun_acc">
	<Sentence text="Hmmm... prik!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ThettaErReipid" file="\TyrkjarA\Media\sigrun\ThettaEC.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er reipið sem ég var bundin með." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_NuErReipid" file="\TyrkjarA\Media\sigrun\NuErReiA.wav" acc="a_Sigrun_acc">
	<Sentence text="Nú er reipið bundið um prikið!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SkeidinEr" file="\TyrkjarA\Media\sigrun\SkeidinA.wav" acc="a_Sigrun_acc">
	<Sentence text="Skeiðin er bundin við prikið!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ThettaErPrik" file="\TyrkjarA\Media\sigrun\ThettaED.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er prik með bandi og er til einskis nýtt!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_GlaesilegtKubein" file="\TyrkjarA\Media\sigrun\GlaesilA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er glæsilegt kúbein.  Ég ætti kannski að sækja um einkaleyfi fyrir þessari tegund?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SpenntUpp" file="\TyrkjarA\Media\sigrun\SpenntUA.wav" acc="a_Sigrun_acc">
	<Sentence text="Kannski get ég spennt upp fjölina með kúbeininu!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ThessiHund" file="\TyrkjarA\Media\sigrun\ThessiHA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þessi Hund-Tyrki er orðinn svolítið þreytandi!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SnjallraediEgMaka" file="\TyrkjarA\Media\sigrun\SnjallrB.wav" acc="a_Sigrun_acc">
	<Sentence text="Snjallræði! Ég maka bláberjasultunni á mig ..." time="0"/>
	<Sentence text="... og þykist vera dáin!" time="3945"/> </SpeechActorMouth>

<SpeechActorMouth name="m_EgErFrjals" file="\TyrkjarA\Media\sigrun\EgErFrjA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég er frjáls en mig grunar að víkingarnir séu ekki langt undan!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Ufff" file="\TyrkjarA\Media\sigrun\Ufff.wav" acc="a_Sigrun_acc">
	<Sentence text="Úff! Ég held að ég sé sloppin í bili." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_TrausturBatur" file="\TyrkjarA\Media\sigrun\traustuA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er traustur bátur! Eða hvað?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_BaturinnErSokkinn" file="\TyrkjarA\Media\sigrun\BaturinA.wav" acc="a_Sigrun_acc">
	<Sentence text="Báturinn er sokkinn!" time="0"/>
	<Sentence text="Tyrkinn hlýtur að hafa gert gat á hann!" time="1780"/> </SpeechActorMouth>

<SpeechActorMouth name="m_HvadanKom" file="\TyrkjarA\Media\sigrun\HvadanKA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvaðan kom þetta flöskuskeyti?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ThessiFlaska" file="\TyrkjarA\Media\sigrun\ThessiFA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þessi flaska hefur greinilega verið lengi í sjónum." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_FlaskanErTom" file="\TyrkjarA\Media\sigrun\FlaskanA.wav" acc="a_Sigrun_acc">
	<Sentence text="Flaskan er tóm!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_EdalsteinnFraUtlondum" file="\TyrkjarA\Media\sigrun\EdalsteA.wav" acc="a_Sigrun_acc">
	<Sentence text="Vá! Eðalsteinn frá útlöndum." time="0"/>
	<Sentence text="Hann hlýtur að vera mikils virði!" time="2000"/> </SpeechActorMouth>

<SpeechActorMouth name="m_LasinnErOskemmdur" file="\TyrkjarA\Media\sigrun\LasinnEA.wav" acc="a_Sigrun_acc">
	<Sentence text="Lásinn er óskemmdur en flaskan er hins vegar ekki heil lengur!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Floskubrot" file="\TyrkjarA\Media\sigrun\FloskubA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hmm. Flöskubrot." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SkeraMig" file="\TyrkjarA\Media\sigrun\SkeraMig.wav" acc="a_Sigrun_acc">
	<Sentence text="Nei, ég mundi bara skera mig!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_FlaskanErBrotin" file="\TyrkjarA\Media\sigrun\FlaskanB.wav" acc="a_Sigrun_acc">
	<Sentence text="Var þetta það sem þú vildir? Flaskan er brotin!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_LasinnBrotnadi" file="\TyrkjarA\Media\sigrun\LasinnBA.wav" acc="a_Sigrun_acc">
	<Sentence text="Jibbí! Lásinn brotnaði!" time="0"/>
	<Sentence text="Það er bara verst að eðalsteinninn brotnaði líka!" time="2545"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SvipurHjaSjon" file="\TyrkjarA\Media\sigrun\SvipurHA.wav" acc="a_Sigrun_acc">
	<Sentence text="Eðalsteinninn er bara svipur hjá sjón núna!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_FinnaHalldoru" file="\TyrkjarA\Media\sigrun\FinnaHaA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég er búin að finna Halldóru." time="0"/>
	<Sentence text="Nú þarf ég bara að losa hana úr þessum böndum!" time="1453"/> </SpeechActorMouth>

<SpeechActorMouth name="m_EgGetEkki" file="\TyrkjarA\Media\sigrun\EgGetEkA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég get ekki losað böndin.  Þau eru bundin of fast!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_EgSker" file="\TyrkjarA\Media\sigrun\EgSker.wav" acc="a_Sigrun_acc">
	<Sentence text="Góð hugmynd! Ég sker á böndin með flöskubrotinu!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Keflud" file="\TyrkjarA\Media\sigrun\Keflud.wav" acc="a_Sigrun_acc">
	<Sentence text="Halldóra er bundin og kefluð." time="0"/>
	<Sentence text="Hvernig á hún að geta talað í því ástandi?" time="1777"/> </SpeechActorMouth>

<SpeechActorMouth name="m_HverAetli" file="\TyrkjarA\Media\sigrun\HverAetA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hver ætli hafi komið þessum steinum fyrir hérna?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Midstodu" file="\TyrkjarA\Media\sigrun\Midstodu.wav" acc="a_Sigrun_acc">
	<Sentence text="Steinninn er í miðstöðu" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SteinninnErDreginn" file="\TyrkjarA\Media\sigrun\SteinniA.wav" acc="a_Sigrun_acc">
	<Sentence text="Steinninn er dreginn eins langt út og hann kemst!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_LangtInni" file="\TyrkjarA\Media\sigrun\LangtInA.wav" acc="a_Sigrun_acc">
	<Sentence text="Steinninn er eins langt inni og hann kemst!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ReipidSemHalldora" file="\TyrkjarA\Media\sigrun\ReipidSA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er reipið sem Halldóra var bundin með!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Snaerid" file="\TyrkjarA\Media\sigrun\Snaerid.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er snærið sem mennirnir voru bundnir með." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_AumingjaFolkid" file="\TyrkjarA\Media\sigrun\AumingjA.wav" acc="a_Sigrun_acc">
	<Sentence text="Aumingja Fólkið!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_KomastUndan" file="\TyrkjarA\Media\sigrun\KomastUA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég vona að þeim takist að komast undan víkingunum!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_LangtReipi" file="\TyrkjarA\Media\sigrun\LangtReA.wav" acc="a_Sigrun_acc">
	<Sentence text="Frábært! Nú á ég eitt langt reipi í stað tveggja styttri!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ReipidNaerEkki" file="\TyrkjarA\Media\sigrun\ReipidNA.wav" acc="a_Sigrun_acc">
	<Sentence text="Reipið nær ekki upp! Það er of stutt!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_ThettaErSera" file="\TyrkjarA\Media\sigrun\ThettaEE.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er séra Jón Þorsteinsson á Kirkjubæ, annar tveggja presta hér í Vestmannaeyjum." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SkelfinguLostid" file="\TyrkjarA\Media\sigrun\SkelfinA.wav" acc="a_Sigrun_acc">
	<Sentence text="Fólkið hér er skelfingu lostið af ótta!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_MjogSnjallt" file="\TyrkjarA\Media\sigrun\MjogSnjA.wav" acc="a_Sigrun_acc">
	<Sentence text="Mjög snjallt! Nú komumst við upp á silluna." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Use1" file="\TyrkjarA\Media\sigrun\Use1.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta gengur ekki hér!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Use2" file="\TyrkjarA\Media\sigrun\Use2.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta tvennt passar ekki saman!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Use3" file="\TyrkjarA\Media\sigrun\Use3.wav" acc="a_Sigrun_acc">
	<Sentence text="Afleit hugmynd!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Talk1" file="\TyrkjarA\Media\sigrun\Talk1.wav" acc="a_Sigrun_acc">
	<Sentence text="Ekki þessa vitleysu!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Talk2" file="\TyrkjarA\Media\sigrun\Talk2.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvað heldur þú eiginlega að ég sé?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Talk3" file="\TyrkjarA\Media\sigrun\Talk3.wav" acc="a_Sigrun_acc">
	<Sentence text="Bull og vitleysa!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take1" file="\TyrkjarA\Media\sigrun\Take1.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er ekkert merkilegt!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Look1" file="\TyrkjarA\Media\sigrun\Look1.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég hélt að allir vissu hvað þetta væri!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take2" file="\TyrkjarA\Media\sigrun\Take2.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég nenni ekki að eyða tíma mínum í þetta!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Look2" file="\TyrkjarA\Media\sigrun\Look2.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég hef ekki tíma til að skoða allt sem á vegi mínum verður!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take3" file="\TyrkjarA\Media\sigrun\Take3.wav" acc="a_Sigrun_acc">
	<Sentence text="Við höfum ekki tíma í svona vitleysu!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take4" file="\TyrkjarA\Media\sigrun\Take4.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég hef ekkert að gera við þetta!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take5" file="\TyrkjarA\Media\sigrun\Take5.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvernig í ósköpunum ætti þetta að hjálpa mér?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take6" file="\TyrkjarA\Media\sigrun\Take6.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvernig á ég að geta borið þetta?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Look3" file="\TyrkjarA\Media\sigrun\Look3.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er glæsilegt!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Look4" file="\TyrkjarA\Media\sigrun\Look4.wav" acc="a_Sigrun_acc">
	<Sentence text="Mikið er þetta fallegt!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Look5" file="\TyrkjarA\Media\sigrun\Look5.wav" acc="a_Sigrun_acc">
	<Sentence text="Það er ekkert áhugavert við þetta!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take7" file="\TyrkjarA\Media\sigrun\Take7.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég hef engan áhuga á þessu drasli!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Take8" file="\TyrkjarA\Media\sigrun\Take8.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er ekkert merkilegur hlutur!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Talk4" file="\TyrkjarA\Media\sigrun\Talk4.wav" acc="a_Sigrun_acc">
	<Sentence text="Viltu gjöra svo vel að hætta þessari vitleysu ..." time="0"/>
	<Sentence text="... og spila leikinn af viti" time="1970"/> </SpeechActorMouth>

<SpeechActorMouth name="m_AumingjaSera" file="\TyrkjarA\Media\sigrun\AumingjB.wav" acc="a_Sigrun_acc">
	<Sentence text="Aumingja séra Jón Þorsteinsson.  Megi hann hvíla í friði!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Skritid" file="\TyrkjarA\Media\sigrun\Skritid.wav" acc="a_Sigrun_acc">
	<Sentence text="Skrítið! Steinarnir falla alveg hvor að öðrum." time="0"/>
	<Sentence text="Það er bara verst að þeir tolla ekki saman!" time="4200"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Utatad" file="\TyrkjarA\Media\sigrun\Utatad.wav" acc="a_Sigrun_acc">
	<Sentence text="Eðalsteinsbrotið er útatað í bláberjasultu." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_AllurUtI" file="\TyrkjarA\Media\sigrun\AllurUtI.wav" acc="a_Sigrun_acc">
	<Sentence text="Steinninn er allur út í bláberjasultu!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_FrabaertSteinarnir" file="\TyrkjarA\Media\sigrun\FrabaerA.wav" acc="a_Sigrun_acc">
	<Sentence text="Frábært! Steinarnir tolla saman núna." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SeraJonHlytur" file="\TyrkjarA\Media\sigrun\SeraJonA.wav" acc="a_Sigrun_acc">
	<Sentence text="Séra Jón hlýtur að hafa átt þennan stein!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_FannstThuMommu" file="\TyrkjarA\Media\sigrun\FannstTA.wav" acc="a_Sigrun_acc">
	<Sentence text="Fannst þú mömmu?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_EkkiRadlegt" file="\TyrkjarA\Media\sigrun\EkkiRadA.wav" acc="a_Sigrun_acc">
	<Sentence text="Ég held að það sé ekki ráðlegt að fara út." time="0"/>
	<Sentence text="Ég heyri í víkingunum fyrir utan!" time="1825"/> </SpeechActorMouth>

<SpeechActorMouth name="m_SkipTyrkjanna" file="\TyrkjarA\Media\sigrun\SkipTyrA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta hlýtur að vera skip tyrkjanna!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Skeid" file="\TyrkjarA\Media\sigrun\Skeid.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er skeiðin sem var í askinum mínum." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Hugarorku" file="\TyrkjarA\Media\sigrun\HugarorA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hvernig á ég að fara að því þegar ég er bundin? Með hugarorku?" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Bingo" file="\TyrkjarA\Media\sigrun\bingo.wav" acc="a_Sigrun_acc">
	<Sentence text="Bingó!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_HurdinErLaest" file="\TyrkjarA\Media\sigrun\hurdineA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hurðin er læst! Bara að ég hefði lykil!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Vesalings" file="\TyrkjarA\Media\sigrun\vesalinA.wav" acc="a_Sigrun_acc">
	<Sentence text="Vesalings mennirnir að vera bundnir úti á túni!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Prestsfruin" file="\TyrkjarA\Media\sigrun\prestsfA.wav" acc="a_Sigrun_acc">
	<Sentence text="Þetta er prestsfrúin, hún Margrét!" time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_MikidErEgFegin" file="\TyrkjarA\Media\sigrun\mikiderA.wav" acc="a_Sigrun_acc">
	<Sentence text="Mikið er ég fegin að víkingarnir tóku ekki eftir okkur!" time="0"/> </SpeechActorMouth>

<Pseudo3DCollisionBox name="cb_Sigrun" x="90" y="15" z="340"/>
<Pseudo3DCollisionBox name="cb_Sigrun_dead" x="90" y="15" z="230"/>
<Pseudo3DCollisionBox name="cb_Sigrun_breakbottle" x="90" y="15" z="450"/>

<CelledAnimated2DActorFace name="af_SigrunStopLimir" repeat="2" file="\TyrkjarA\AnimatiA\Sigrun\stoplimA" count="1" prepare="false" xoffset="0" yoffset="0" speed="450"/>
<CelledAnimated2DActorFace name="af_SigrunStopStein" repeat="2" file="\TyrkjarA\AnimatiA\Sigrun\stopsteA" count="1" prepare="false" xoffset="0" yoffset="0" speed="450"/>
<CelledAnimated2DActorFace name="af_SigrunLimir" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\limir" count="8" prepare="false" xoffset="0" yoffset="0" speed="300"/>
<CelledAnimated2DActorFace name="af_SigrunMen" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\stoned" count="5" prepare="false" xoffset="0" yoffset="0" speed="300"/>
<CelledAnimated2DActorFace name="af_SigrunHverfur" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\vanish" count="7" prepare="false" xoffset="0" yoffset="0" speed="450"/>

<MovingActor name="a_Sigrun" state="stop" terrain="t_Kotl" x="420" y="470" z="0" save="true" speed="105" random="true" scaling="dynamic">
	<State name="stop" face="Sigrun_stop" collisionbox="cb_Sigrun"/>
	<State name="tied" face="Sigrun_tied" collisionbox="cb_Sigrun"/>
	<State name="right" face="Sigrun_right" collisionbox="cb_Sigrun"/>
	<State name="left" face="Sigrun_left" collisionbox="cb_Sigrun"/>
	<State name="front" face="Sigrun_front" collisionbox="cb_Sigrun"/>
	<State name="back" face="Sigrun_back" collisionbox="cb_Sigrun"/>
	<State name="stop2right" face="Sigrun_stop2right" collisionbox="cb_Sigrun"/>
	<State name="stop2left" face="Sigrun_stop2left" collisionbox="cb_Sigrun"/>
	<State name="stop2back" face="Sigrun_stop2back" collisionbox="cb_Sigrun"/>

	<State name="hverfur" face="af_SigrunHverfur" collisionbox="cb_Sigrun"/>
	<State name="steinmen" face="af_SigrunMen" collisionbox="cb_Sigrun"/>
	<State name="limir" face="af_SigrunLimir" collisionbox="cb_Sigrun"/>
	<State name="stopstein" face="af_SigrunStopStein" collisionbox="cb_Sigrun"/>
	<State name="stoplimir" face="af_SigrunStopLimir" collisionbox="cb_Sigrun"/>

	<State name="jam" face="Sigrun_jam" collisionbox="cb_Sigrun"/>
	<State name="dead" face="Sigrun_dead" collisionbox="cb_Sigrun_dead"/>
	<State name="alive" face="Sigrun_alive" collisionbox="cb_Sigrun_dead"/>
	<State name="breakbottle" face="Sigrun_breakbottle" collisionbox="cb_Sigrun_breakbottle"/>

	<State name="invisible" collisionbox="cb_Sigrun"/>

	<State name="VaFlottirPudar" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_VaFlottirPudar"/>
	<State name="HverEr" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HverEr"/>
	<State name="InnUtInnInnUt" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_InnUtInnInnUt"/>
	<State name="Hund" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Hund"/>
	<State name="HeyrduHalldora" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HeyrduHalldora"/>
	<State name="HvadEr" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HvadEr"/>
	<State name="HvadaSogur" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HvadaSogur"/>
	<State name="HvadaDagur" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HvadaDagur"/>
	<State name="Bless" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Bless"/>
	<State name="Audvitad" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Audvitad"/>
	<State name="Tyrklandi" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Tyrklandi"/>
	<State name="ThadErEnginnTimiTil" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThadErEnginnTimiTil"/>

	<State name="ThettaErAskurinn" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThettaErAskurinn"/>
	<State name="ThettaErAskurinn23" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_ThettaErAskurinn"/>
	<State name="MadurLifir" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_MadurLifir"/>
	<State name="MadurLifir23" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_MadurLifir"/>
	<State name="Korktappi" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Korktappi"/>
	<State name="ThettaErHun" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThettaErHun"/>
	<State name="MammaLitur" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_MammaLitur"/>
	<State name="TunnanErFull" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_TunnanErFull"/>
	<State name="HunErAlltOfThung" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HunErAlltOfThung"/>
	<State name="Ubbss" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Ubbss"/>
	<State name="Snidugt" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Snidugt"/>
	<State name="KomduSaellSera" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_KomduSaellSera"/>
	<State name="TunnanErGaltom" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_TunnanErGaltom"/>
	<State name="ErtThuVissUm" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ErtThuVissUm"/>
	<State name="Skeid" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Skeid"/>
	<State name="Skeid23" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Skeid"/>
	<State name="Vesalings" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Vesalings"/>
	<State name="SeraJonVirdist" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SeraJonVirdist"/>

	<State name="BlessStrakur" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Bless"/>
	<State name="Hvernig" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Hvernig"/>
	<State name="Nei" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Nei"/>
	<State name="LeysaMig" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_LeysaMig"/>
	<State name="SedModur" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_SedModur"/>
	<State name="EkkertAdOttast" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_EkkertAdOttast"/>
	<State name="EkkiBundinn" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_EkkiBundinn"/>
	<State name="HeitirThu" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_HeitirThu"/>
	<State name="AdSjalfsogdu" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_AdSjalfsogdu"/>
	<State name="VerdAdBjarga" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_VerdAdBjarga"/>
	<State name="MeidduHalldoru" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_MeidduHalldoru"/>
	<State name="GefaTher" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_GefaTher"/>
	<State name="FyndistTher" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_FyndistTher"/>
	<State name="EgLofa" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_EgLofa"/>
	<State name="LookTied" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Look1"/>
	<State name="TalkTied3" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Talk1"/>
	<State name="PrikTied3" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Prik"/>
	<State name="StrakurTied" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_EgKannast"/>

	<State name="FrabaertSteinarnir" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_FrabaertSteinarnir"/>
	<State name="EgGraedi" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_EgGraedi"/>
	<State name="SeraJonHlytur" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SeraJonHlytur"/>
	<State name="MjogSnjallt" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_MjogSnjallt"/>
	<State name="Look1" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Look1"/>
	<State name="Talk1" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Talk1"/>
	<State name="FannstThuMommu" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_FannstThuMommu"/>
	<State name="Talk2" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Talk2"/>
	<State name="Talk3" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Talk3"/>
	<State name="Take2" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take2"/>
	<State name="Take4" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take4"/>
	<State name="EkkiRadlegt" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_EkkiRadlegt"/>
	<State name="Take3" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take3"/>
	<State name="Take1" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take1"/>
	<State name="AllurUtI" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_AllurUtI"/>
	<State name="SkipTyrkjanna" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SkipTyrkjanna"/>
	<State name="Look2" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Look2"/>
	<State name="Use1" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Use1"/>
	<State name="Look3" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Look3"/>
	<State name="Look4" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Look4"/>
	<State name="Look5" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Look5"/>
	<State name="Take7" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take7"/>
	<State name="Talk4" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Talk4"/>
	<State name="Use2" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Use2"/>
	<State name="Take6" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take6"/>
	<State name="Take8" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take8"/>
	<State name="AumingjaSera" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_AumingjaSera"/>
	<State name="Use3" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Use3"/>
	<State name="Skritid" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Skritid"/>
	<State name="Utatad" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Utatad"/>
	<State name="Take5" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Take5"/>

	<State name="ThessiFlaska" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThessiFlaska"/>
	<State name="Hugarorku" face="Sigrun_tiedtalk" collisionbox="cb_Sigrun" mouth="m_Hugarorku"/>
	<State name="FlaskanErTom" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_FlaskanErTom"/>
	<State name="EdalsteinnFraUtlondum" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_EdalsteinnFraUtlondum"/>
	<State name="TunnanSokk" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_TunnanSokk"/>
	<State name="ThettaErReipid" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThettaErReipid"/>
	<State name="SkeidinEr" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SkeidinEr"/>
	<State name="ThettaErPrik" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThettaErPrik"/>
	<State name="NuErReipid" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_NuErReipid"/>
	<State name="Prik" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Prik"/>
	<State name="SpenntUpp" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SpenntUpp"/>
	<State name="EgKannast" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_EgKannast"/>
	<State name="ThessiHund" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThessiHund"/>
	<State name="SnjallraediEgMaka" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SnjallraediEgMaka"/>
	<State name="Snjallraedi" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Snjallraedi"/>
	<State name="EgErFrjals" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_EgErFrjals"/>
	<State name="BaturinnErSokkinn" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_BaturinnErSokkinn"/>
	<State name="LasinnErOskemmdur" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_LasinnErOskemmdur"/>
	<State name="Ufff" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Ufff"/>
	<State name="TrausturBatur" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_TrausturBatur"/>
	<State name="HvadanKom" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HvadanKom"/>
	<State name="GlaesilegtKubein" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_GlaesilegtKubein"/>

	<State name="ReipidSemHalldora" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ReipidSemHalldora"/>
	<State name="Snaerid" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Snaerid"/>
	<State name="LangtInni" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_LangtInni"/>
	<State name="SkelfinguLostid" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SkelfinguLostid"/>
	<State name="SkeraMig" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SkeraMig"/>
	<State name="AumingjaFolkid" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_AumingjaFolkid"/>
	<State name="Floskubrot" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Floskubrot"/>
	<State name="SteinninnErDreginn" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SteinninnErDreginn"/>
	<State name="LasinnBrotnadi" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_LasinnBrotnadi"/>
	<State name="KomastUndan" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_KomastUndan"/>
	<State name="SvipurHjaSjon" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_SvipurHjaSjon"/>
	<State name="FinnaHalldoru" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_FinnaHalldoru"/>
	<State name="EgGetEkki" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_EgGetEkki"/>
	<State name="LangtReipi" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_LangtReipi"/>
	<State name="Keflud" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Keflud"/>
	<State name="EgSker" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_EgSker"/>
	<State name="HverAetli" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HverAetli"/>
	<State name="ReipidNaerEkki" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ReipidNaerEkki"/>
	<State name="Midstodu" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Midstodu"/>
	<State name="ThettaErSera" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_ThettaErSera"/>
	<State name="FlaskanErBrotin" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_FlaskanErBrotin"/>
	<State name="HurdinErLaest" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HurdinErLaest"/>
	<State name="Bingo" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Bingo"/>
	<State name="Prestsfruin" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Prestsfruin"/>
	<State name="MikidErEgFegin" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_MikidErEgFegin"/>


	<State name="Vona" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_Vona"/>

	<State name="HversVegna" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_HversVegna"/>
	<State name="VeistThu" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_VeistThu"/>
	<State name="JaEnHvar" face="Sigrun_talk" collisionbox="cb_Sigrun" mouth="m_JaEnHvar"/>
</MovingActor>
<ActorMoused actor="a_Sigrun" listener="sc" moving="Sigrún" thf="Sigrúnu"/>

<MoveActorQuantum name="qh_Sigrun" actor="a_Sigrun"/>
<MoveActorQuantum name="qs_SigrunFyrirUtan" actor="a_Sigrun" terrain="t_UtanHusidl"/>

<!-- Quanta -->
<StateQuantum name="q_Sigrun_stop" actor="a_Sigrun" state="stop" wait="false"/>
<StopActorQuantum name="q_StoppSigrun" actor="a_Sigrun" />
<StateQuantum name="q_Sigrun_tied" actor="a_Sigrun" state="tied" wait="false"/>
<StateQuantum name="q_Sigrun_jam" actor="a_Sigrun" state="jam" wait="true"/>
<StateQuantum name="q_Sigrun_dead" actor="a_Sigrun" state="dead" wait="false"/>
<StateQuantum name="q_Sigrun_alive" actor="a_Sigrun" state="alive" wait="true"/>
<StateQuantum name="q_Sigrun_breakbottle" actor="a_Sigrun" state="breakbottle" wait="true"/>

<StateQuantum name="q_SigrunHverfur" actor="a_Sigrun" state="hverfur" wait="true"/>
<StateQuantum name="q_SigrunSteinMen" actor="a_Sigrun" state="steinmen" wait="true"/>
<StateQuantum name="q_SigrunLimir" actor="a_Sigrun" state="limir" wait="true"/>
<StateQuantum name="q_SigrunStopStein" actor="a_Sigrun" state="stopstein" wait="true"/>
<StateQuantum name="q_SigrunStopLimir" actor="a_Sigrun" state="stoplimir" wait="true"/>

<StateQuantum name="q_Sigrun_invisible" actor="a_Sigrun" state="invisible" wait="false"/>

<StateQuantum name="q_InnUtInnInnUt" actor="a_Sigrun" state="InnUtInnInnUt" wait="true"/>
<StateQuantum name="q_Prestsfruin" actor="a_Sigrun" state="Prestsfruin" wait="true"/>
<StateQuantum name="q_EgGraedi" actor="a_Sigrun" state="EgGraedi" wait="true"/>
<StateQuantum name="q_Vesalings" actor="a_Sigrun" state="Vesalings" wait="true"/>
<StateQuantum name="q_VaFlottirPudar" actor="a_Sigrun" state="VaFlottirPudar" wait="true"/>
<StateQuantum name="q_Hund" actor="a_Sigrun" state="Hund" wait="true"/>
<StateQuantum name="q_HurdinErLaest" actor="a_Sigrun" state="HurdinErLaest" wait="true"/>
<StateQuantum name="q_Bingo" actor="a_Sigrun" state="Bingo" wait="true"/>
<StateQuantum name="q_Hugarorku" actor="a_Sigrun" state="Hugarorku" wait="true"/>
<StateQuantum name="q_HverEr" actor="a_Sigrun" state="HverEr" wait="true"/>
<StateQuantum name="q_HeyrduHalldora" actor="a_Sigrun" state="HeyrduHalldora" wait="true"/>
<StateQuantum name="q_HvadEr" actor="a_Sigrun" state="HvadEr" wait="true"/>
<StateQuantum name="q_HvadaSogur" actor="a_Sigrun" state="HvadaSogur" wait="true"/>
<StateQuantum name="q_HvadaDagur" actor="a_Sigrun" state="HvadaDagur" wait="true"/>
<StateQuantum name="q_Bless" actor="a_Sigrun" state="Bless" wait="true"/>
<StateQuantum name="q_Audvitad" actor="a_Sigrun" state="Audvitad" wait="true"/>
<StateQuantum name="q_Tyrklandi" actor="a_Sigrun" state="Tyrklandi" wait="true"/>
<StateQuantum name="q_ThadErEnginnTimiTil" actor="a_Sigrun" state="ThadErEnginnTimiTil" wait="true"/>

<StateQuantum name="q_MammaLitur" actor="a_Sigrun" state="MammaLitur" wait="true"/>
<StateQuantum name="q_KomduSaellSera" actor="a_Sigrun" state="KomduSaellSera" wait="true"/>
<StateQuantum name="q_MadurLifir" actor="a_Sigrun" state="MadurLifir" wait="true"/>
<StateQuantum name="q_MadurLifir23" actor="a_Sigrun" state="MadurLifir23" wait="true"/>
<StateQuantum name="q_ThettaErAskurinn" actor="a_Sigrun" state="ThettaErAskurinn" wait="true"/>
<StateQuantum name="q_ThettaErAskurinn23" actor="a_Sigrun" state="ThettaErAskurinn23" wait="true"/>
<StateQuantum name="q_TunnanErFull" actor="a_Sigrun" state="TunnanErFull" wait="true"/>
<StateQuantum name="q_ThettaErHun" actor="a_Sigrun" state="ThettaErHun" wait="true"/>
<StateQuantum name="q_ErtThuVissUm" actor="a_Sigrun" state="ErtThuVissUm" wait="true"/>
<StateQuantum name="q_Snidugt" actor="a_Sigrun" state="Snidugt" wait="true"/>
<StateQuantum name="q_Korktappi" actor="a_Sigrun" state="Korktappi" wait="true"/>
<StateQuantum name="q_HunErAlltOfThung" actor="a_Sigrun" state="HunErAlltOfThung" wait="true"/>
<StateQuantum name="q_TunnanErGaltom" actor="a_Sigrun" state="TunnanErGaltom" wait="true"/>
<StateQuantum name="q_Ubbss" actor="a_Sigrun" state="Ubbss" wait="true"/>

<StateQuantum name="q_EgSker" actor="a_Sigrun" state="EgSker" wait="true"/>
<StateQuantum name="q_SeraJonVirdist" actor="a_Sigrun" state="SeraJonVirdist" wait="true"/>
<StateQuantum name="q_EgGetEkki" actor="a_Sigrun" state="EgGetEkki" wait="true"/>
<StateQuantum name="q_Talk2" actor="a_Sigrun" state="Talk2" wait="true"/>
<StateQuantum name="q_LangtReipi" actor="a_Sigrun" state="LangtReipi" wait="true"/>
<StateQuantum name="q_FinnaHalldoru" actor="a_Sigrun" state="FinnaHalldoru" wait="true"/>
<StateQuantum name="q_SvipurHjaSjon" actor="a_Sigrun" state="SvipurHjaSjon" wait="true"/>
<StateQuantum name="q_AumingjaFolkid" actor="a_Sigrun" state="AumingjaFolkid" wait="true"/>
<StateQuantum name="q_ReipidNaerEkki" actor="a_Sigrun" state="ReipidNaerEkki" wait="true"/>
<StateQuantum name="q_KomastUndan" actor="a_Sigrun" state="KomastUndan" wait="true"/>
<StateQuantum name="q_ThettaErSera" actor="a_Sigrun" state="ThettaErSera" wait="true"/>
<StateQuantum name="q_SkelfinguLostid" actor="a_Sigrun" state="SkelfinguLostid" wait="true"/>
<StateQuantum name="q_Talk1" actor="a_Sigrun" state="Talk1" wait="true"/>
<StateQuantum name="q_MjogSnjallt" actor="a_Sigrun" state="MjogSnjallt" wait="true"/>
<StateQuantum name="q_Use3" actor="a_Sigrun" state="Use3" wait="true"/>
<StateQuantum name="q_Use2" actor="a_Sigrun" state="Use2" wait="true"/>
<StateQuantum name="q_Floskubrot" actor="a_Sigrun" state="Floskubrot" wait="true"/>
<StateQuantum name="q_Use1" actor="a_Sigrun" state="Use1" wait="true"/>
<StateQuantum name="q_HverAetli" actor="a_Sigrun" state="HverAetli" wait="true"/>
<StateQuantum name="q_Midstodu" actor="a_Sigrun" state="Midstodu" wait="true"/>
<StateQuantum name="q_SteinninnErDreginn" actor="a_Sigrun" state="SteinninnErDreginn" wait="true"/>
<StateQuantum name="q_SkeraMig" actor="a_Sigrun" state="SkeraMig" wait="true"/>
<StateQuantum name="q_LangtInni" actor="a_Sigrun" state="LangtInni" wait="true"/>
<StateQuantum name="q_ReipidSemHalldora" actor="a_Sigrun" state="ReipidSemHalldora" wait="true"/>
<StateQuantum name="q_Snaerid" actor="a_Sigrun" state="Snaerid" wait="true"/>
<StateQuantum name="q_Keflud" actor="a_Sigrun" state="Keflud" wait="true"/>
<StateQuantum name="q_LasinnBrotnadi" actor="a_Sigrun" state="LasinnBrotnadi" wait="true"/>
<StateQuantum name="q_FlaskanErBrotin" actor="a_Sigrun" state="FlaskanErBrotin" wait="true"/>
<StateQuantum name="q_Skeid" actor="a_Sigrun" state="Skeid" wait="true"/>
<StateQuantum name="q_Skeid23" actor="a_Sigrun" state="Skeid23" wait="true"/>
<StateQuantum name="q_LookTied" actor="a_Sigrun" state="LookTied" wait="true"/>
<StateQuantum name="q_TalkTied3" actor="a_Sigrun" state="TalkTied3" wait="true"/>
<StateQuantum name="q_PrikTied3" actor="a_Sigrun" state="PrikTied3" wait="true"/>
<StateQuantum name="q_StrakurTied" actor="a_Sigrun" state="StrakurTied" wait="true"/>

<StateQuantum name="q_NuErReipid" actor="a_Sigrun" state="NuErReipid" wait="true"/>
<StateQuantum name="q_LasinnErOskemmdur" actor="a_Sigrun" state="LasinnErOskemmdur" wait="true"/>
<StateQuantum name="q_ThettaErReipid" actor="a_Sigrun" state="ThettaErReipid" wait="true"/>
<StateQuantum name="q_EgKannast" actor="a_Sigrun" state="EgKannast" wait="true"/>
<StateQuantum name="q_Prik" actor="a_Sigrun" state="Prik" wait="true"/>
<StateQuantum name="q_TunnanSokk" actor="a_Sigrun" state="TunnanSokk" wait="true"/>
<StateQuantum name="q_FlaskanErTom" actor="a_Sigrun" state="FlaskanErTom" wait="true"/>
<StateQuantum name="q_SpenntUpp" actor="a_Sigrun" state="SpenntUpp" wait="true"/>
<StateQuantum name="q_Snjallraedi" actor="a_Sigrun" state="Snjallraedi" wait="true"/>
<StateQuantum name="q_ThessiFlaska" actor="a_Sigrun" state="ThessiFlaska" wait="true"/>
<StateQuantum name="q_SnjallraediEgMaka" actor="a_Sigrun" state="SnjallraediEgMaka" wait="true"/>
<StateQuantum name="q_HvadanKom" actor="a_Sigrun" state="HvadanKom" wait="true"/>
<StateQuantum name="q_ThessiHund" actor="a_Sigrun" state="ThessiHund" wait="true"/>
<StateQuantum name="q_BaturinnErSokkinn" actor="a_Sigrun" state="BaturinnErSokkinn" wait="true"/>
<StateQuantum name="q_EdalsteinnFraUtlondum" actor="a_Sigrun" state="EdalsteinnFraUtlondum" wait="true"/>
<StateQuantum name="q_TrausturBatur" actor="a_Sigrun" state="TrausturBatur" wait="true"/>
<StateQuantum name="q_EgErFrjals" actor="a_Sigrun" state="EgErFrjals" wait="true"/>
<StateQuantum name="q_Ufff" actor="a_Sigrun" state="Ufff" wait="true"/>
<StateQuantum name="q_ThettaErPrik" actor="a_Sigrun" state="ThettaErPrik" wait="true"/>
<StateQuantum name="q_GlaesilegtKubein" actor="a_Sigrun" state="GlaesilegtKubein" wait="true"/>
<StateQuantum name="q_SkeidinEr" actor="a_Sigrun" state="SkeidinEr" wait="true"/>

<StateQuantum name="q_FrabaertSteinarnir" actor="a_Sigrun" state="FrabaertSteinarnir" wait="true"/>
<StateQuantum name="q_Look3" actor="a_Sigrun" state="Look3" wait="true"/>
<StateQuantum name="q_Look4" actor="a_Sigrun" state="Look4" wait="true"/>
<StateQuantum name="q_Look5" actor="a_Sigrun" state="Look5" wait="true"/>
<StateQuantum name="q_Take6" actor="a_Sigrun" state="Take6" wait="true"/>
<StateQuantum name="q_Take7" actor="a_Sigrun" state="Take7" wait="true"/>
<StateQuantum name="q_Talk4" actor="a_Sigrun" state="Talk4" wait="true"/>
<StateQuantum name="q_SeraJonHlytur" actor="a_Sigrun" state="SeraJonHlytur" wait="true"/>
<StateQuantum name="q_AumingjaSera" actor="a_Sigrun" state="AumingjaSera" wait="true"/>
<StateQuantum name="q_FannstThuMommu" actor="a_Sigrun" state="FannstThuMommu" wait="true"/>
<StateQuantum name="q_SkipTyrkjanna" actor="a_Sigrun" state="SkipTyrkjanna" wait="true"/>
<StateQuantum name="q_EkkiRadlegt" actor="a_Sigrun" state="EkkiRadlegt" wait="true"/>
<StateQuantum name="q_Utatad" actor="a_Sigrun" state="Utatad" wait="true"/>
<StateQuantum name="q_AllurUtI" actor="a_Sigrun" state="AllurUtI" wait="true"/>
<StateQuantum name="q_Skritid" actor="a_Sigrun" state="Skritid" wait="true"/>
<StateQuantum name="q_Talk3" actor="a_Sigrun" state="Talk3" wait="true"/>
<StateQuantum name="q_Look1" actor="a_Sigrun" state="Look1" wait="true"/>
<StateQuantum name="q_Take2" actor="a_Sigrun" state="Take2" wait="true"/>
<StateQuantum name="q_Look2" actor="a_Sigrun" state="Look2" wait="true"/>
<StateQuantum name="q_Take3" actor="a_Sigrun" state="Take3" wait="true"/>
<StateQuantum name="q_Take4" actor="a_Sigrun" state="Take4" wait="true"/>
<StateQuantum name="q_Take5" actor="a_Sigrun" state="Take5" wait="true"/>
<StateQuantum name="q_Take1" actor="a_Sigrun" state="Take1" wait="true"/>
<StateQuantum name="q_Take8" actor="a_Sigrun" state="Take8" wait="true"/>

<StateQuantum name="q_BlessStrakur" actor="a_Sigrun" state="BlessStrakur" wait="true"/>
<StateQuantum name="q_Hvernig" actor="a_Sigrun" state="Hvernig" wait="true"/>
<StateQuantum name="q_Nei" actor="a_Sigrun" state="Nei" wait="true"/>
<StateQuantum name="q_LeysaMig" actor="a_Sigrun" state="LeysaMig" wait="true"/>
<StateQuantum name="q_SedModur" actor="a_Sigrun" state="SedModur" wait="true"/>
<StateQuantum name="q_EkkertAdOttast" actor="a_Sigrun" state="EkkertAdOttast" wait="true"/>
<StateQuantum name="q_EkkiBundinn" actor="a_Sigrun" state="EkkiBundinn" wait="true"/>
<StateQuantum name="q_HeitirThu" actor="a_Sigrun" state="HeitirThu" wait="true"/>
<StateQuantum name="q_AdSjalfsogdu" actor="a_Sigrun" state="AdSjalfsogdu" wait="true"/>
<StateQuantum name="q_VerdAdBjarga" actor="a_Sigrun" state="VerdAdBjarga" wait="true"/>
<StateQuantum name="q_MeidduHalldoru" actor="a_Sigrun" state="MeidduHalldoru" wait="true"/>
<StateQuantum name="q_GefaTher" actor="a_Sigrun" state="GefaTher" wait="true"/>
<StateQuantum name="q_FyndistTher" actor="a_Sigrun" state="FyndistTher" wait="true"/>
<StateQuantum name="q_EgLofa" actor="a_Sigrun" state="EgLofa" wait="true"/>
<StateQuantum name="q_MikidErEgFegin" actor="a_Sigrun" state="MikidErEgFegin" wait="true"/>

<StateQuantum name="q_Vona" actor="a_Sigrun" state="Vona" wait="true"/>

<StateQuantum name="q_HversVegna" actor="a_Sigrun" state="HversVegna" wait="true"/>
<StateQuantum name="q_VeistThu" actor="a_Sigrun" state="VeistThu" wait="true"/>
<StateQuantum name="q_JaEnHvar" actor="a_Sigrun" state="JaEnHvar" wait="true"/>

<!-- Sigrun misc -->
<CelledAnimated2DActorFace name="af_SigrunMisc_escape1" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\escape1" count="3" speed="250"/>
<CelledAnimated2DActorFace name="af_SigrunMisc_escape2" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\escape2" count="4" speed="250" xoffset="-26" yoffset="-8"/>
<CelledAnimated2DActorFace name="af_SigrunMisc_breaklock" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\breakloA" count="6" speed="150" xoffset="-60" yoffset="-320"/>
<CelledAnimated2DActorFace name="af_SigrunMisc_pushboat" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\pushboat" count="5" speed="150" xoffset="-92" yoffset="-205"/>

<CelledAnimated2DActorFace name="af_SigrunMisc_change1" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\change1" count="5" speed="250" xoffset="-45" yoffset="-330"/>
<CelledAnimated2DActorFace name="af_SigrunMisc_change2" repeat="4" file="\TyrkjarA\AnimatiA\Sigrun\change2" count="2" speed="250" xoffset="-45" yoffset="-330"/>
<CelledAnimated2DActorFace name="af_SigrunMisc_change3" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\change3" count="2" speed="250" xoffset="-45" yoffset="-330"/>
<CelledAnimated2DActorFace name="af_SigrunMisc_change4" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\change4" count="5" speed="250" xoffset="-45" yoffset="-330"/>
<CelledAnimated2DActorFace name="af_SigrunMisc_change5" repeat="1" file="\TyrkjarA\AnimatiA\Sigrun\change5" count="3" speed="250" xoffset="-45" yoffset="-330"/>
<CelledAnimated2DActorFace name="af_SigrunLosarH" repeat="3" file="\TyrkjarA\AnimatiA\Sigrun\leysirh" count="3" speed="250" xoffset="-36" yoffset="-307"/>
<CelledAnimated2DActorFace name="af_SigrunLosarB" repeat="3" file="\TyrkjarA\AnimatiA\Sigrun\leysirb" count="3" speed="250" xoffset="-25" yoffset="-205"/>

<MovingActor name="a_SigrunMisc" state="stop" x="0" y="0" z="0" save="true">
	<State name="escape1" face="af_SigrunMisc_escape1"/>
	<State name="escape2" face="af_SigrunMisc_escape2"/>
	<State name="breaklock" face="af_SigrunMisc_breaklock"/>
	<State name="pushboat" face="af_SigrunMisc_pushboat"/>
	<State name="losarh" face="af_SigrunLosarH"/>
	<State name="losarb" face="af_SigrunLosarB"/>

	<State name="change1" face="af_SigrunMisc_change1"/>
	<State name="change2" face="af_SigrunMisc_change2"/>
	<State name="change3" face="af_SigrunMisc_change3"/>
	<State name="change4" face="af_SigrunMisc_change4"/>
	<State name="change5" face="af_SigrunMisc_change5"/>
</MovingActor>

<PrepareQuantum name="qp_SigrunLosar" object="af_SigrunLosarH" prepare="true"/>
<PrepareQuantum name="qu_SigrunLosar" object="af_SigrunLosarH" prepare="false"/>
<MoveActorQuantum name="q_MoveSigrunMisc34" actor="a_SigrunMisc" terrain="t_Kaetanl">
	<Location x="356" y="473" z="1"/> </MoveActorQuantum>
<StateQuantum name="q_SigrunMisc_Losar" actor="a_SigrunMisc" state="losarh" wait="true"/>

<PrepareQuantum name="qp_SigrunLosar3" object="af_SigrunLosarB" prepare="true"/>
<PrepareQuantum name="qu_SigrunLosar3" object="af_SigrunLosarB" prepare="false"/>
<MoveActorQuantum name="q_MoveSigrunMisc38" actor="a_SigrunMisc" terrain="t_UtanHusidl">
	<Location x="1100" y="475" z="1"/> </MoveActorQuantum>
<StateQuantum name="q_SigrunMisc_LosarB" actor="a_SigrunMisc" state="losarb" wait="true"/>



<!-- Quanta -->
<MoveActorQuantum name="q_MoveSigrunMisc" actor="a_SigrunMisc"/>
<StateQuantum name="q_SigrunMisc_stop" actor="a_SigrunMisc" state="stop" wait="false"/>

<PrepareQuantum name="qp_SigrunMisc_escape1" object="af_SigrunMisc_escape1" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_escape1" object="af_SigrunMisc_escape1" prepare="false"/>
<MoveActorQuantum name="q_MoveSigrunMisc4escape1" actor="a_SigrunMisc" terrain="t_DansktHus">
	<Location x="392" y="356" z="0"/> </MoveActorQuantum>
<StateQuantum name="q_SigrunMisc_escape1" actor="a_SigrunMisc" state="escape1" wait="true"/>

<PrepareQuantum name="qp_SigrunMisc_escape2" object="af_SigrunMisc_escape2" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_escape2" object="af_SigrunMisc_escape2" prepare="false"/>
<MoveActorQuantum name="q_MoveSigrunMisc4escape2" actor="a_SigrunMisc" terrain="t_DansktHus">
	<Location x="380" y="384" z="50"/> </MoveActorQuantum>
<!-- (-12, +22) m.v. escape1 -->
<StateQuantum name="q_SigrunMisc_escape2" actor="a_SigrunMisc" state="escape2" wait="true"/>

<PrepareQuantum name="qp_SigrunMisc_breaklock" object="af_SigrunMisc_breaklock" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_breaklock" object="af_SigrunMisc_breaklock" prepare="false"/>
<MoveActorQuantum name="q_MoveSigrunMisc4breaklock" actor="a_SigrunMisc" terrain="t_Dekkid">
	<Location x="275" y="465" z="0"/> </MoveActorQuantum>
<StateQuantum name="q_SigrunMisc_breaklock" actor="a_SigrunMisc" state="breaklock" wait="true"/>

<PrepareQuantum name="qp_SigrunMisc_pushboat" object="af_SigrunMisc_pushboat" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_pushboat" object="af_SigrunMisc_pushboat" prepare="false"/>
<MoveActorQuantum name="q_MoveSigrunMisc4pushboat" actor="a_SigrunMisc" terrain="t_Fjaran">
	<Location x="1050" y="440" z="0"/> </MoveActorQuantum>
<StateQuantum name="q_SigrunMisc_pushboat" actor="a_SigrunMisc" state="pushboat" wait="true"/>

<PrepareQuantum name="qp_SigrunMisc_change1" object="af_SigrunMisc_change1" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_change1" object="af_SigrunMisc_change1" prepare="false"/>
<PrepareQuantum name="qp_SigrunMisc_change2" object="af_SigrunMisc_change2" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_change2" object="af_SigrunMisc_change2" prepare="false"/>
<PrepareQuantum name="qp_SigrunMisc_change3" object="af_SigrunMisc_change3" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_change3" object="af_SigrunMisc_change3" prepare="false"/>
<PrepareQuantum name="qp_SigrunMisc_change4" object="af_SigrunMisc_change4" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_change4" object="af_SigrunMisc_change4" prepare="false"/>
<PrepareQuantum name="qp_SigrunMisc_change5" object="af_SigrunMisc_change5" prepare="true"/>
<PrepareQuantum name="qu_SigrunMisc_change5" object="af_SigrunMisc_change5" prepare="false"/>
<MoveActorQuantum name="q_MoveSigrunMisc4change" actor="a_SigrunMisc" terrain="t_Kaetan">
	<Location x="275" y="510" z="0"/> </MoveActorQuantum>
<StateQuantum name="q_SigrunMisc_change1" actor="a_SigrunMisc" state="change1" wait="true"/>
<StateQuantum name="q_SigrunMisc_change2" actor="a_SigrunMisc" state="change2" wait="true"/>
<StateQuantum name="q_SigrunMisc_change3" actor="a_SigrunMisc" state="change3" wait="true"/>
<StateQuantum name="q_SigrunMisc_change4" actor="a_SigrunMisc" state="change4" wait="true"/>
<StateQuantum name="q_SigrunMisc_change5" actor="a_SigrunMisc" state="change5" wait="true"/>

<PrepareQuantum name="qp_Sigrun1" object="af_SigrunStopLimir" prepare="true"/>
<PrepareQuantum name="qp_Sigrun2" object="af_SigrunStopStein" prepare="true"/>
<PrepareQuantum name="qp_Sigrun3" object="af_SigrunLimir" prepare="true"/>
<PrepareQuantum name="qp_Sigrun4" object="af_SigrunMen" prepare="true"/>
<PrepareQuantum name="qp_Sigrun5" object="af_SigrunHverfur" prepare="true"/>

<!-- Halldora -->

<StaticActorFace name="Halldora_stop" file="\TyrkjarA\AnimatiA\Halldora\stop" prepare="true"/>
<StaticActorFace name="Halldora_tied" file="\TyrkjarA\AnimatiA\Halldora\tied" prepare="true" xoffset="-90" yoffset="-243"/>
<CelledAnimated2DActorFace name="Halldora_left" repeat="-1" file="\TyrkjarA\AnimatiA\Halldora\left" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="Halldora_right" repeat="-1" file="\TyrkjarA\AnimatiA\Halldora\right" count="8" prepare="true"/>
<CelledAnimated2DActorFace name="Halldora_stop2left" repeat="-1" file="\TyrkjarA\AnimatiA\Halldora\stop2leA" count="2" prepare="true"/>
<CelledAnimated2DActorFace name="Halldora_stop2right" repeat="-1" file="\TyrkjarA\AnimatiA\Halldora\stop2riA" count="2" prepare="true"/>

<CelledAnimated2DActorFace name="Halldora_talk" repeat="-1" file="\TyrkjarA\AnimatiA\Halldora\talk" count="4" prepare="true" speed="150"/>

<SpeechActorMouth name="m_SigrunSystir" file="\TyrkjarA\Media\Halldora\SigrunSA.wav" acc="a_Halldora_acc">
	<Sentence text="Sigrún systir mín og elsku móðir mín." time="0"/>
	<Sentence text="Guð sé með okkur." time="2476"/>
	<Sentence text="Hingað til Vestmannaeyja stefna nú þrjú skip ..." time="4367"/>
	<Sentence text="... og segja sumir að þar sé enginn annar en Hund-Tyrkinn á ferðinni." time="6770"/>
	<Sentence text="Við verðum að forða okkur strax!" time="10113"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Kannski" file="\TyrkjarA\Media\Halldora\Kannski.wav" acc="a_Halldora_acc">
	<Sentence text="Kannski er það rétt hjá þér, móðir mín." time="0"/>
	<Sentence text="En Tyrkinn gæti siglt undir fölsku flaggi." time="1624"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Tyrkirnir" file="\TyrkjarA\Media\Halldora\TyrkirnA.wav" acc="a_Halldora_acc">
	<Sentence text="Tyrkirnir eru heiðingjar ..." time="0"/>
	<Sentence text="... sem trúa á hinn hræðilega spámann Múhameð og guðinn Allah." time="1468"/>
	<Sentence text="Þeir eru víkingar sem eru verri en allt sem vont er." time="5277"/>
	<Sentence text="Hvar sem þeir koma þá drepa þeir eða ræna fólki ..." time="8636"/>
	<Sentence text="... og selja síðan á þrælatorgum í Barbaríinu." time="11311"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Barbariid" file="\TyrkjarA\Media\Halldora\BarbariA.wav" acc="a_Halldora_acc">
	<Sentence text="Barbaríið er í Norður-Afríku og er heimkynni Hund-Tyrkjans ..." time="0"/>
	<Sentence text="... sem aðhyllist Múhameðstrú." time="4326"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Heyrnarlaus" file="\TyrkjarA\Media\Halldora\HeyrnarA.wav" acc="a_Halldora_acc">
	<Sentence text="Hefurðu verið heyrnarlaus undanfarna daga, Sigrún?" time="0"/>
	<Sentence text="Veistu ekki að Hund-Tyrkinn kom að landi í Grindavík fyrir tæpum mánuði ..." time="4054"/>
	<Sentence text="... og rændi þar um allt og ruplaði." time="74740"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Heidingjarnir" file="\TyrkjarA\Media\Halldora\HeidingA.wav" acc="a_Halldora_acc">
	<Sentence text="Heiðingjarnir höfðu líka með sér fólk af Járngerðarstöðum ..." time="0"/>
	<Sentence text="... sem hafði ekki vit á því að flýja undan þeim." time="3070"/> </SpeechActorMouth>
<SpeechActorMouth name="m_IDag" file="\TyrkjarA\Media\Halldora\IDag.wav" acc="a_Halldora_acc">
	<Sentence text="Í dag er 16. júlí á því herrans ári 1627." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_NordurAfriku" file="\TyrkjarA\Media\Halldora\NordurAA.wav" acc="a_Halldora_acc">
	<Sentence text="Nei! Hund-Tyrkinn á heima í Barbaríinu sem er í Norður-Afríku." time="0"/> </SpeechActorMouth>

<SpeechActorMouth name="m_FlytaOkkur" file="\TyrkjarA\Media\Halldora\FlytaOkA.wav" acc="a_Halldora_acc">
	<Sentence text="Ég vissi að þú kæmir og bjargaðir mér, elsku systir." time="0"/>
	<Sentence text="En við skulum flýta okkur í burtu héðan eins fljótt og við getum ..." time="4855"/>
	<Sentence text="... áður en bannsettir Tyrkirnir koma aftur." time="7638"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Fegin" file="\TyrkjarA\Media\Halldora\Fegin.wav" acc="a_Halldora_acc">
	<Sentence text="Mikið er ég fegin að sjá þig." time="0"/>
	<Sentence text="Ég hélt að ég myndi aldrei sjá þig aftur." time="1834"/>
	<Sentence text="Veistu nokkuð um hana móður okkar?" time="4022"/> </SpeechActorMouth>
<SpeechActorMouth name="m_TilBragds" file="\TyrkjarA\Media\Halldora\TilBragA.wav" acc="a_Halldora_acc">
	<Sentence text="En hvað eigum við nú til bragðs að taka?" time="0"/>
	<Sentence text="Tyrkirnir geta komið aftur hvenær sem er." time="2280"/>
	<Sentence text="Við verðum að fela okkur." time="4074"/> </SpeechActorMouth>

<SpeechActorMouth name="m_VeitEkki" file="\TyrkjarA\Media\Halldora\VeitEkki.wav" acc="a_Halldora_acc">
	<Sentence text="Ég veit það ekki ..." time="0"/>
	<Sentence text="... en ég held að foringja þeirra hafi litist ansi vel á mig ..." time="926"/>
	<Sentence text="... af því að hann fór með mig beinustu leið í káetu sína!" time="3698"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Felustadur" file="\TyrkjarA\Media\Halldora\FelustaA.wav" acc="a_Halldora_acc">
	<Sentence text="Í hellinum sem við lékum okkur í þegar við vorum litlar." time="0"/>
	<Sentence text="Drífðu þig nú þangað.  Ég hitti þig þar." time="2570"/>
	<Sentence text="Ég ætla að svipast aðeins um eftir mömmu okkar." time="4750"/> </SpeechActorMouth>

<SpeechActorMouth name="m_Fegnar" file="\TyrkjarA\Media\Halldora\Fegnar.wav" acc="a_Halldora_acc">
	<Sentence text="Mikið erum við líka fegnar að þú og þitt fólk er heilt á húfi ..." time="0"/>
	<Sentence text="... séra Jón Þorsteinsson." time="3639"/> </SpeechActorMouth>
<SpeechActorMouth name="m_JaSigrun" file="\TyrkjarA\Media\Halldora\JaSigrun.wav" acc="a_Halldora_acc">
	<Sentence text="Já Sigrún." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_NeiThviMidur" file="\TyrkjarA\Media\Halldora\NeiThviA.wav" acc="a_Halldora_acc">
	<Sentence text="Nei, því miður. Aumingja mamma!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_GudMinn" file="\TyrkjarA\Media\Halldora\GudMinn.wav" acc="a_Halldora_acc">
	<Sentence text="Guð minn almáttugur! Tyrkinn eirir engum." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_DetturEnginn" file="\TyrkjarA\Media\Halldora\dettureA.wav" acc="a_Halldora_acc">
	<Sentence text="Nei! Mér dettur bara enginn felustaður í hug einmitt núna." time="0"/> </SpeechActorMouth>


<Pseudo3DCollisionBox name="cb_Halldora" x="110" y="15" z="285"/>

<MovingActor name="a_Halldora" state="stop" terrain="t_Kotl" x="900" y="525" z="0" save="true" random="true" scaling="dynamic">
	<State name="stop" face="Halldora_stop" collisionbox="cb_Halldora"/>
	<State name="left" face="Halldora_left" collisionbox="cb_Halldora"/>
	<State name="right" face="Halldora_right" collisionbox="cb_Halldora"/>
	<State name="tied" face="Halldora_tied"/>

	<State name="SigrunSystir" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_SigrunSystir"/>
	<State name="Kannski" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Kannski"/>

	<State name="Tyrkirnir" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Tyrkirnir"/>
	<State name="JaSigrun" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_JaSigrun"/>
	<State name="Barbariid" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Barbariid"/>
	<State name="Heyrnarlaus" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Heyrnarlaus"/>
	<State name="Heidingjarnir" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Heidingjarnir"/>
	<State name="IDag" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_IDag"/>
	<State name="NordurAfriku" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_NordurAfriku"/>
	<State name="DetturEnginn" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_DetturEnginn"/>

	<State name="FlytaOkkur" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_FlytaOkkur"/>
	<State name="Fegin" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Fegin"/>
	<State name="TilBragds" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_TilBragds"/>
	<State name="NeiThviMidur" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_NeiThviMidur"/>
	<State name="GudMinn" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_GudMinn"/>

	<State name="VeitEkki" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_VeitEkki"/>
	<State name="Felustadur" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Felustadur"/>

	<State name="Fegnar" face="Halldora_talk" collisionbox="cb_Halldora" mouth="m_Fegnar"/>
</MovingActor>

<ActorMoused actor="a_Halldora" listener="sc" moving="Halldóra" taking="Klappa Halldóru" thf="Halldóru"/>

<!-- Conversation -->
<SentenceContainer name="conv_Halldora" scene="s_Kot" polygon="p_All" zmin="801" zmax="1500" save="true"/>

<!-- Quanta -->

<MoveActorQuantum name="qh_Halldora" actor="a_Halldora"/>

<StateQuantum name="q_Halldora_stop" actor="a_Halldora" state="stop" wait="false"/>
<StateQuantum name="q_Halldora_tied" actor="a_Halldora" state="tied" wait="false"/>
<StateQuantum name="q_Halldora_invisible" actor="a_Halldora" state="invisible" wait="true"/>

<StateQuantum name="q_SigrunSystir" actor="a_Halldora" state="SigrunSystir" wait="true"/>
<StateQuantum name="q_Kannski" actor="a_Halldora" state="Kannski" wait="true"/>

<StateQuantum name="q_Tyrkirnir" actor="a_Halldora" state="Tyrkirnir" wait="true"/>
<StateQuantum name="q_Barbariid" actor="a_Halldora" state="Barbariid" wait="true"/>
<StateQuantum name="q_Heyrnarlaus" actor="a_Halldora" state="Heyrnarlaus" wait="true"/>
<StateQuantum name="q_Heidingjarnir" actor="a_Halldora" state="Heidingjarnir" wait="true"/>
<StateQuantum name="q_IDag" actor="a_Halldora" state="IDag" wait="true"/>
<StateQuantum name="q_NordurAfriku" actor="a_Halldora" state="NordurAfriku" wait="true"/>

<StateQuantum name="q_FlytaOkkur" actor="a_Halldora" state="FlytaOkkur" wait="true"/>
<StateQuantum name="q_Fegin" actor="a_Halldora" state="Fegin" wait="true"/>
<StateQuantum name="q_TilBragds" actor="a_Halldora" state="TilBragds" wait="true"/>

<StateQuantum name="q_VeitEkki" actor="a_Halldora" state="VeitEkki" wait="true"/>
<StateQuantum name="q_Felustadur" actor="a_Halldora" state="Felustadur" wait="true"/>

<StateQuantum name="q_Fegnar" actor="a_Halldora" state="Fegnar" wait="true"/>
<StateQuantum name="q_JaSigrun" actor="a_Halldora" state="JaSigrun" wait="true"/>
<StateQuantum name="q_NeiThviMidur" actor="a_Halldora" state="NeiThviMidur" wait="true"/>
<StateQuantum name="q_GudMinn" actor="a_Halldora" state="GudMinn" wait="true"/>
<StateQuantum name="q_DetturEnginn" actor="a_Halldora" state="DetturEnginn" wait="true"/>

<!-- Mamma -->

<CelledAnimated2DActorFace name="af_Mamma_Talk" repeat="-1" speed="150" file="\TyrkjarA\AnimatiA\Mamma\talk" count="10" random="true" xoffset="13" yoffset="0"/>
<StaticActorFace name="af_Mamma" file="\TyrkjarA\AnimatiA\Mamma\Stop"/>
<PrepareQuantum name="qp_Kot11" object="af_Mamma_Talk" prepare="true"/>
<PrepareQuantum name="qu_Kot11" object="af_Mamma_Talk" prepare="false"/>
<PrepareQuantum name="qp_Kot12" object="af_Mamma" prepare="true"/>
<PrepareQuantum name="qu_Kot12" object="af_Mamma" prepare="false"/>

<SpeechActorMouth name="m_SvonaSvona" file="\TyrkjarA\Media\Mamma\SvonaSvA.wav" acc="a_Mamma_acc">
	<Sentence text="Svona, svona elsku dætur mínar." time="0"/>
	<Sentence text="Það er örugglega ekkert að óttast." time="2213"/>
	<Sentence text="Skipin eru með danska fána og því getur alls ekki verið um Tyrkjann að ræða." time="4640"/>
	<Sentence text="Þið megið ekki láta sögurnar frá Grindavík hræða ykkur" time="8468"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HeillManudur" file="\TyrkjarA\Media\Mamma\HeillMaA.wav" acc="a_Mamma_acc">
	<Sentence text="Nú er næstum heill mánuður síðan Tyrkirnir herjuðu á Grindavík." time="0"/>
	<Sentence text="Þeir eru örugglega farnir aftur heim til sín í Barbaríið." time="3732"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HaettidNu" file="\TyrkjarA\Media\Mamma\HaettidA.wav" acc="a_Mamma_acc">
	<Sentence text="Hættið nú þessu! Það er ekkert að óttast!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Verdmaeti" file="\TyrkjarA\Media\Mamma\VerdmaeA.wav" acc="a_Mamma_acc">
	<Sentence text="Við verðum að flýja!" time="0"/>
	<Sentence text="Takið öll verðmæti með ykkur áður en ræningjarnir koma og ræna öllu" time="1387"/> </SpeechActorMouth>
<SpeechActorMouth name="m_TaktuEitthvad" file="\TyrkjarA\Media\Mamma\TaktuEiA.wav" acc="a_Mamma_acc">
	<Sentence text="Taktu eitthvað verðmætt með þér." time="0"/>
	<Sentence text="Við megum ekki láta sjóræningjana hirða allt innbúið okkar." time="1636"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HvertThykistThu" file="\TyrkjarA\Media\Mamma\hvertthA.wav" acc="a_Mamma_acc">
	<Sentence text="Hvert þykist þú vera að fara?" time="0"/>
	<Sentence text="Þú færð ekki að fara út fyrr en þú ert búin að vinna verkin þín." time="1889"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ThadErEnginnTimi" file="\TyrkjarA\Media\Mamma\thadereA.wav" acc="a_Mamma_acc">
	<Sentence text="Það er enginn tími til að kjafta núna." time="0"/>
	<Sentence text="Flýðu, flýðu!" time="2254"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Fikt" file="\TyrkjarA\Media\Mamma\bla.wav" acc="a_Mamma_acc">
	<Sentence text="Hættu þessu fikti Sigrún!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HaettuThessuFikti" file="\TyrkjarA\Media\Mamma\haettutA.wav" acc="a_Mamma_acc">
	<Sentence text="Hættu þessu fikti Sigrún ..." time="0"/>
	<Sentence text="... og taktu eitthvað verðmætt með þér." time="1377"/> </SpeechActorMouth>

<Pseudo3DCollisionBox name="cb_Mamma" x="213" y="20" z="328"/>

<StaticActor name="a_Mamma" terrain="t_Kotl" x="520" y="450" z="0" state="stop" save="true" random="true">
	<State name="stop" face="af_Mamma" collisionbox="cb_Mamma"/>
	<State name="SvonaSvona" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_SvonaSvona"/>
	<State name="HeillManudur" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_HeillManudur"/>
	<State name="HaettidNu" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_HaettidNu"/>
	<State name="Verdmaeti" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_Verdmaeti"/>
	<State name="TaktuEitthvad" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_TaktuEitthvad"/>
	<State name="HvertThykistThu" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_HvertThykistThu"/>
	<State name="ThadErEnginnTimi" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_ThadErEnginnTimi"/>
	<State name="Fikt" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_Fikt"/>
	<State name="HaettuThessuFikti" face="af_Mamma_Talk" collisionbox="cb_Mamma" mouth="m_HaettuThessuFikti"/>
</StaticActor>

<ActorMoused actor="a_Mamma" listener="sc" moving="Mamma" looking="Skoða mömmu" taking="Klípa í mömmu" talking="Tala við mömmu"/>

<!-- Conversation -->
<SentenceContainer name="conv_Mamma" scene="s_Kot" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta -->
<StateQuantum name="q_Mamma_stop" actor="a_Mamma" state="stop" wait="false"/>

<StateQuantum name="q_SvonaSvona" actor="a_Mamma" state="SvonaSvona" wait="true"/>
<StateQuantum name="q_HeillManudur" actor="a_Mamma" state="HeillManudur" wait="true"/>
<StateQuantum name="q_HaettidNu" actor="a_Mamma" state="HaettidNu" wait="true"/>
<StateQuantum name="q_Verdmaeti" actor="a_Mamma" state="Verdmaeti" wait="true"/>
<StateQuantum name="q_Fikt" actor="a_Mamma" state="Fikt" wait="true"/>
<StateQuantum name="q_HaettuThessuFikti" actor="a_Mamma" state="HaettuThessuFikti" wait="true"/>
<StateQuantum name="q_TaktuEitthvad" actor="a_Mamma" state="TaktuEitthvad" wait="true"/>
<StateQuantum name="q_HvertThykistThu" actor="a_Mamma" state="HvertThykistThu" wait="true"/>
<StateQuantum name="q_ThadErEnginnTimi" actor="a_Mamma" state="ThadErEnginnTimi" wait="true"/>

<Sequence name="s_HaettidNu">
	<Quantum name="q_HaettidNu"/>
	<Quantum name="q_Mamma_stop"/>
</Sequence>

<Sequence name="s_EnginnTimi">
	<Quantum name="q_ThadErEnginnTimi"/>
	<Quantum name="q_Mamma_stop"/>
</Sequence>
<CheckConditionQuantum name="q_CheckMom" flag="f_MomTalk" wait="true">
	<Trigger value="0" seq="s_HaettidNu"/>
	<Trigger value="1" seq="s_EnginnTimi"/>
</CheckConditionQuantum>
<Sequence name="s_CheckMom">
    <Quantum name="q_Conversating"/>
    <Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_CheckMom"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Mamma" seq="s_CheckMom"/>

<!-- Strakur -->

<Text name="a_Strakur_acc" terrain="t_Corners" text=" " color="yellow" hilite="false"/>

<StaticActorFace name="Strakur_stop" file="\TyrkjarA\AnimatiA\Strakur\stop"/>
<CelledAnimated2DActorFace name="Strakur_untie" repeat="4" file="\TyrkjarA\AnimatiA\Strakur\untie" count="2" xoffset="-62" yoffset="46" speed="250"/>
<CelledAnimated2DActorFace name="Strakur_talk" repeat="-1" file="\TyrkjarA\AnimatiA\Strakur\talk" count="3" random="true"/>
<PrepareQuantum name="qp_DansktHus7" object="Strakur_stop" prepare="true"/>
<PrepareQuantum name="qu_DansktHus7" object="Strakur_stop" prepare="false"/>
<PrepareQuantum name="qp_DansktHus8" object="Strakur_untie" prepare="true"/>
<PrepareQuantum name="qu_DansktHus8" object="Strakur_untie" prepare="false"/>
<PrepareQuantum name="qp_DansktHus9" object="Strakur_talk" prepare="true"/>
<PrepareQuantum name="qu_DansktHus9" object="Strakur_talk" prepare="false"/>

<SpeechActorMouth name="m_HentuMer" file="\TyrkjarA\Media\Strakur\HentuMer.wav" acc="a_Strakur_acc">
	<Sentence text="Tyrkirnir náðu mér og hentu mér hingað inn." time="0"/>
	<Sentence text="Hefurðu nokkuð séð foreldra mína?" time="2900"/> </SpeechActorMouth>
<SpeechActorMouth name="m_ThoriEkki" file="\TyrkjarA\Media\Strakur\ThoriEkA.wav" acc="a_Strakur_acc">
	<Sentence text="Nei, ég þori það ekki" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_EkkiSed" file="\TyrkjarA\Media\Strakur\EkkiSed.wav" acc="a_Strakur_acc">
	<Sentence text="Ég hef ekki séð móður þína en systir þín Halldóra ..." time="0"/>
	<Sentence text="... er hún ekki rosalega sæt?" time="2490"/> </SpeechActorMouth>
<SpeechActorMouth name="m_EgVona" file="\TyrkjarA\Media\Strakur\EgVona.wav" acc="a_Strakur_acc">
	<Sentence text="Já, ég vona það!" time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_FlytaSer" file="\TyrkjarA\Media\Strakur\FlytaSer.wav" acc="a_Strakur_acc">
	<Sentence text="Tyrkirnir voru að flýta sér svo mikið ..." time="0"/>
	<Sentence text="... að þeir gleymdu að binda mig." time="1712"/> </SpeechActorMouth>
<SpeechActorMouth name="m_SegiTherEkki" file="\TyrkjarA\Media\Strakur\SegiTheA.wav" acc="a_Strakur_acc">
	<Sentence text="Ég segi þér það ekki." time="0"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Syndist" file="\TyrkjarA\Media\Strakur\Syndist.wav" acc="a_Strakur_acc">
	<Sentence text="Mér sýndist Tyrkirnir fara með hana í átt að skipi sínu." time="0"/>
	<Sentence text="Þeir ætla örugglega að selja hana á þrælamarkaði í Barbaríinu" time="3192"/> </SpeechActorMouth>
<SpeechActorMouth name="m_HelstEkki" file="\TyrkjarA\Media\Strakur\HelstEkA.wav" acc="a_Strakur_acc">
	<Sentence text="Ég vil það helst ekki." time="0"/>
	<Sentence text="Tyrkirnir taka kannski eftir því ef þú ferð út ..." time="1335"/>
	<Sentence text="... og þá koma þeir hingað og binda mig." time="3560"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Thraelamarkadi" file="\TyrkjarA\Media\Strakur\ThraelaA.wav" acc="a_Strakur_acc">
	<Sentence text="Nei. En ég held að þeir hafi ekki meitt hana ..." time="0"/>
	<Sentence text="... því hún verður að líta vel út ..." time="1864"/>
	<Sentence text="... svo að þeir fái sem best verð fyrir hana á þrælamarkaði." time="3315"/> </SpeechActorMouth>
<SpeechActorMouth name="m_NeiEgKaeri" file="\TyrkjarA\Media\Strakur\NeiEgKaA.wav" acc="a_Strakur_acc">
	<Sentence text="Nei, ég kæri mig ekkert um hana." time="0"/>
	<Sentence text="Ég held líka að þú þurfir meira á henni að halda en ég." time="1584"/> </SpeechActorMouth>
<SpeechActorMouth name="m_JaejaTha" file="\TyrkjarA\Media\Strakur\JaejaTha.wav" acc="a_Strakur_acc">
	<Sentence text="Jæja þá, ég skal losa þig." time="0"/>
	<Sentence text="En þú verður að lofa mér því að koma mér ekki í vandræði." time="1744"/> </SpeechActorMouth>

<Pseudo3DCollisionBox name="cb_Strakur" x="115" y="15" z="265"/>

<StaticActor name="a_Strakur" state="stop" terrain="t_DansktHusl" x="893" y="520" z="0" random="true">
	<State name="stop" face="Strakur_stop" collisionbox="cb_Strakur"/>
	<State name="untie" face="Strakur_untie" collisionbox="cb_Strakur"/>

	<State name="HentuMer" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_HentuMer"/>
	<State name="ThoriEkki" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_ThoriEkki"/>
	<State name="EkkiSed" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_EkkiSed"/>
	<State name="EgVona" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_EgVona"/>
	<State name="FlytaSer" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_FlytaSer"/>
	<State name="SegiTherEkki" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_SegiTherEkki"/>
	<State name="Syndist" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_Syndist"/>
	<State name="HelstEkki" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_HelstEkki"/>
	<State name="Thraelamarkadi" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_Thraelamarkadi"/>
	<State name="NeiEgKaeri" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_NeiEgKaeri"/>
	<State name="JaejaTha" face="Strakur_talk" collisionbox="cb_Strakur" mouth="m_JaejaTha"/>
</StaticActor>

<ActorMoused actor="a_Strakur" listener="sc" moving="Strákur" looking="Skoða strák" taking="Taka strák" talking="Tala við strák" thf="strák"/>

<!-- Conversation -->
<SentenceContainer name="conv_Strakur" scene="s_DansktHus" polygon="p_All" zmin="801" zmax="1500"/>

<!-- Quanta -->
<StateQuantum name="q_Strakur_stop" actor="a_Strakur" state="stop" wait="false"/>
<StateQuantum name="q_Strakur_untie" actor="a_Strakur" state="untie" wait="true"/>

<StateQuantum name="q_HentuMer" actor="a_Strakur" state="HentuMer" wait="true"/>
<StateQuantum name="q_ThoriEkki" actor="a_Strakur" state="ThoriEkki" wait="true"/>
<StateQuantum name="q_EkkiSed" actor="a_Strakur" state="EkkiSed" wait="true"/>
<StateQuantum name="q_EgVona" actor="a_Strakur" state="EgVona" wait="true"/>
<StateQuantum name="q_FlytaSer" actor="a_Strakur" state="FlytaSer" wait="true"/>
<StateQuantum name="q_SegiTherEkki" actor="a_Strakur" state="SegiTherEkki" wait="true"/>
<StateQuantum name="q_Syndist" actor="a_Strakur" state="Syndist" wait="true"/>
<StateQuantum name="q_HelstEkki" actor="a_Strakur" state="HelstEkki" wait="true"/>
<StateQuantum name="q_Thraelamarkadi" actor="a_Strakur" state="Thraelamarkadi" wait="true"/>
<StateQuantum name="q_NeiEgKaeri" actor="a_Strakur" state="NeiEgKaeri" wait="true"/>
<StateQuantum name="q_JaejaTha" actor="a_Strakur" state="JaejaTha" wait="true"/>

<!-- Quanta -->
<Sequence name="s_StopSiggaLigga">
	<Quantum name="q_Sigrun_stop"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForStopSigrun" flag="f_SigrunTied" wait="true">
	<Trigger value="0" seq="s_StopSiggaLigga"/>
</CheckConditionQuantum>

<SwitchSceneQuantum name="q_ToKot" scene="s_Kot"/>
<SwitchSceneQuantum name="q_ToUtanHusid" scene="s_UtanHusid"/>
<SwitchSceneQuantum name="q_ToDansktHus" scene="s_DansktHus"/>
<SwitchSceneQuantum name="q_ToUtanDanskaHusid" scene="s_UtanDanskaHusid"/>
<SwitchSceneQuantum name="q_ToFjolin" scene="s_Fjolin"/>
<SwitchSceneQuantum name="q_ToFjaran" scene="s_Fjaran"/>
<SwitchSceneQuantum name="q_ToDekkid" scene="s_Dekkid"/>
<SwitchSceneQuantum name="q_ToKaetan" scene="s_Kaetan"/>
<SwitchSceneQuantum name="q_ToUtanHelli" scene="s_UtanHelli"/>
<SwitchSceneQuantum name="q_ToInnihellir" scene="s_Innihellir"/>
<SwitchSceneQuantum	name="q_ToBlack" scene="s_Black"/>

<Sequence name="su_UtanDanskaHusid">
	<Quantum name="qu_UtanDanskaHusid1"/>
	<Quantum name="qu_UtanDanskaHusid2"/>
	<Quantum name="qu_UtanDanskaHusid3"/>
	<Quantum name="qu_UtanDanskaHusid4"/>
	<Quantum name="qu_UtanDanskaHusid5"/>
	<Quantum name="qu_UtanDanskaHusid6"/>
	<Quantum name="qu_UtanDanskaHusid7"/>
	<Quantum name="qu_UtanDanskaHusid8"/>
	<Quantum name="qu_UtanDanskaHusid9"/>
</Sequence>
<CheckConditionQuantum name="qu_UtanDanskaHusid" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_UtanDanskaHusid"/>
</CheckConditionQuantum>

<Sequence name="sp_UtanDanskaHusid">
	<Quantum name="qp_UtanDanskaHusid1"/>
	<Quantum name="qp_UtanDanskaHusid2"/>
	<Quantum name="qp_UtanDanskaHusid3"/>
	<Quantum name="qp_UtanDanskaHusid4"/>
	<Quantum name="qp_UtanDanskaHusid5"/>
	<Quantum name="qp_UtanDanskaHusid6"/>
	<Quantum name="qp_UtanDanskaHusid7"/>
	<Quantum name="qp_UtanDanskaHusid8"/>
	<Quantum name="qp_UtanDanskaHusid9"/>
</Sequence>
<CheckConditionQuantum name="qp_UtanDanskaHusid" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_UtanDanskaHusid"/>
</CheckConditionQuantum>

<Sequence name="su_UtanHusid">
	<Quantum name="qu_UtanHusid1"/>
	<Quantum name="qu_UtanHusid2"/>
	<Quantum name="qu_UtanHusid3"/>
	<Quantum name="qu_UtanHusid4"/>
	<Quantum name="qu_UtanHusid5"/>
	<Quantum name="qu_UtanHusid6"/>
	<Quantum name="qu_UtanHusid7"/>
	<Quantum name="qu_UtanHusid8"/>
	<Quantum name="qu_UtanHusid9"/>
	<Quantum name="qu_UtanHusid10"/>
	<Quantum name="qu_UtanHusid11"/>
</Sequence>
<CheckConditionQuantum name="qu_UtanHusid" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_UtanHusid"/>
</CheckConditionQuantum>

<Sequence name="sp_UtanHusid">
	<Quantum name="qp_UtanHusid1"/>
	<Quantum name="qp_UtanHusid2"/>
	<Quantum name="qp_UtanHusid3"/>
	<Quantum name="qp_UtanHusid4"/>
	<Quantum name="qp_UtanHusid5"/>
	<Quantum name="qp_UtanHusid6"/>
	<Quantum name="qp_UtanHusid7"/>
	<Quantum name="qp_UtanHusid8"/>
	<Quantum name="qp_UtanHusid9"/>
	<Quantum name="qp_UtanHusid10"/>
	<Quantum name="qp_UtanHusid11"/>
</Sequence>
<CheckConditionQuantum name="qp_UtanHusid" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_UtanHusid"/>
</CheckConditionQuantum>

<Sequence name="su_Kot">
	<Quantum name="qu_Kot1"/>
	<Quantum name="qu_Kot2"/>
	<Quantum name="qu_Kot3"/>
	<Quantum name="qu_Kot4"/>
	<Quantum name="qu_Kot5"/>
	<Quantum name="qu_Kot6"/>
	<Quantum name="qu_Kot7"/>
	<Quantum name="qu_Kot8"/>
	<Quantum name="qu_Kot9"/>
	<Quantum name="qu_Kot10"/>
	<Quantum name="qu_Kot11"/>
	<Quantum name="qu_Kot12"/>
	<Quantum name="qu_Kot13"/>
</Sequence>
<CheckConditionQuantum name="qu_Kot" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Kot"/>
</CheckConditionQuantum>

<Sequence name="sp_Kot">
	<Quantum name="qp_Kot1"/>
	<Quantum name="qp_Kot2"/>
	<Quantum name="qp_Kot3"/>
	<Quantum name="qp_Kot4"/>
	<Quantum name="qp_Kot5"/>
	<Quantum name="qp_Kot6"/>
	<Quantum name="qp_Kot7"/>
	<Quantum name="qp_Kot8"/>
	<Quantum name="qp_Kot9"/>
	<Quantum name="qp_Kot10"/>
	<Quantum name="qp_Kot11"/>
	<Quantum name="qp_Kot12"/>
	<Quantum name="qp_Kot13"/>
</Sequence>
<CheckConditionQuantum name="qp_Kot" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Kot"/>
</CheckConditionQuantum>

<Sequence name="su_Dekkid">
	<Quantum name="qu_Dekkid1"/>
	<Quantum name="qu_Dekkid2"/>
	<Quantum name="qu_Dekkid3"/>
	<Quantum name="qu_Dekkid4"/>
	<Quantum name="qu_Dekkid5"/>
	<Quantum name="qu_Dekkid6"/>
	<Quantum name="qu_Dekkid7"/>
	<Quantum name="qu_Dekkid8"/>
	<Quantum name="qu_Dekkid9"/>
	<Quantum name="qu_Dekkid10"/>
</Sequence>
<CheckConditionQuantum name="qu_Dekkid" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Dekkid"/>
</CheckConditionQuantum>

<Sequence name="sp_Dekkid">
	<Quantum name="qp_Dekkid1"/>
	<Quantum name="qp_Dekkid2"/>
	<Quantum name="qp_Dekkid3"/>
	<Quantum name="qp_Dekkid4"/>
	<Quantum name="qp_Dekkid5"/>
	<Quantum name="qp_Dekkid6"/>
	<Quantum name="qp_Dekkid7"/>
	<Quantum name="qp_Dekkid8"/>
	<Quantum name="qp_Dekkid9"/>
	<Quantum name="qp_Dekkid10"/>
</Sequence>
<CheckConditionQuantum name="qp_Dekkid" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Dekkid"/>
</CheckConditionQuantum>

<Sequence name="su_Fjaran">
	<Quantum name="qu_Fjaran1"/>
	<Quantum name="qu_Fjaran2"/>
	<Quantum name="qu_Fjaran3"/>
	<Quantum name="qu_Fjaran4"/>
	<Quantum name="qu_Fjaran5"/>
	<Quantum name="qu_Fjaran6"/>
	<Quantum name="qu_Fjaran7"/>
	<Quantum name="qu_Fjaran8"/>
	<Quantum name="qu_Fjaran9"/>
	<Quantum name="qu_Fjaran10"/>
	<Quantum name="qu_Fjaran11"/>
	<Quantum name="qu_Fjaran12"/>
	<Quantum name="qu_Fjaran13"/>
</Sequence>
<CheckConditionQuantum name="qu_Fjaran" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Fjaran"/>
</CheckConditionQuantum>

<Sequence name="sp_Fjaran">
	<Quantum name="qp_Fjaran1"/>
	<Quantum name="qp_Fjaran2"/>
	<Quantum name="qp_Fjaran3"/>
	<Quantum name="qp_Fjaran4"/>
	<Quantum name="qp_Fjaran5"/>
	<Quantum name="qp_Fjaran6"/>
	<Quantum name="qp_Fjaran7"/>
	<Quantum name="qp_Fjaran8"/>
	<Quantum name="qp_Fjaran9"/>
	<Quantum name="qp_Fjaran10"/>
	<Quantum name="qp_Fjaran11"/>
	<Quantum name="qp_Fjaran12"/>
	<Quantum name="qp_Fjaran13"/>
</Sequence>
<CheckConditionQuantum name="qp_Fjaran" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Fjaran"/>
</CheckConditionQuantum>

<Sequence name="su_DansktHus">
	<Quantum name="qu_DansktHus1"/>
	<Quantum name="qu_DansktHus10"/>
	<Quantum name="qu_DansktHus2"/>
	<Quantum name="qu_DansktHus3"/>
	<Quantum name="qu_DansktHus4"/>
	<Quantum name="qu_DansktHus5"/>
	<Quantum name="qu_DansktHus6"/>
	<Quantum name="qu_DansktHus7"/>
	<Quantum name="qu_DansktHus8"/>
	<Quantum name="qu_DansktHus9"/>
</Sequence>
<CheckConditionQuantum name="qu_DansktHus" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_DansktHus"/>
</CheckConditionQuantum>

<Sequence name="sp_DansktHus">
	<Quantum name="qp_DansktHus1"/>
	<Quantum name="qp_DansktHus10"/>
	<Quantum name="qp_DansktHus2"/>
	<Quantum name="qp_DansktHus3"/>
	<Quantum name="qp_DansktHus4"/>
	<Quantum name="qp_DansktHus5"/>
	<Quantum name="qp_DansktHus6"/>
	<Quantum name="qp_DansktHus7"/>
	<Quantum name="qp_DansktHus8"/>
	<Quantum name="qp_DansktHus9"/>
</Sequence>
<CheckConditionQuantum name="qp_DansktHus" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_DansktHus"/>
</CheckConditionQuantum>

<Sequence name="su_Innihellir">
	<Quantum name="qu_Innihellir1"/>
	<Quantum name="qu_Innihellir2"/>
	<Quantum name="qu_Innihellir3"/>
	<Quantum name="qu_Innihellir4"/>
	<Quantum name="qu_Innihellir5"/>
	<Quantum name="qu_Innihellir6"/>
	<Quantum name="qu_Innihellir7"/>
	<Quantum name="qu_Innihellir8a"/>
	<Quantum name="qu_Innihellir8b"/>
	<Quantum name="qu_Innihellir9"/>
	<Quantum name="qu_Innihellir10"/>
	<Quantum name="qu_Innihellir11"/>
	<Quantum name="qu_Innihellir12"/>
	<Quantum name="qu_Innihellir13"/>
	<Quantum name="qu_Innihellir14"/>
	<Quantum name="qu_Innihellir15"/>
	<Quantum name="qu_Innihellir16"/>
	<Quantum name="qu_Innihellir17"/>
	<Quantum name="qu_Innihellir18"/>
	<Quantum name="qu_Innihellir19"/>
	<Quantum name="qu_Innihellir20"/>
	<Quantum name="qu_Innihellir21"/>
	<Quantum name="qu_Innihellir22"/>
	<Quantum name="qu_Innihellir23"/>
	<Quantum name="qu_Innihellir24"/>
</Sequence>
<CheckConditionQuantum name="qu_Innihellir" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Innihellir"/>
</CheckConditionQuantum>

<Sequence name="sp_Innihellir">
	<Quantum name="qp_Innihellir1"/>
	<Quantum name="qp_Innihellir2"/>
	<Quantum name="qp_Innihellir3"/>
	<Quantum name="qp_Innihellir4"/>
	<Quantum name="qp_Innihellir5"/>
	<Quantum name="qp_Innihellir6"/>
	<Quantum name="qp_Innihellir7"/>
	<Quantum name="qp_Innihellir8a"/>
	<Quantum name="qp_Innihellir8b"/>
	<Quantum name="qp_Innihellir9"/>
	<Quantum name="qp_Innihellir10"/>
	<Quantum name="qp_Innihellir11"/>
	<Quantum name="qp_Innihellir12"/>
	<Quantum name="qp_Innihellir13"/>
	<Quantum name="qp_Innihellir14"/>
	<Quantum name="qp_Innihellir15"/>
	<Quantum name="qp_Innihellir16"/>
	<Quantum name="qp_Innihellir17"/>
	<Quantum name="qp_Innihellir18"/>
	<Quantum name="qp_Innihellir19"/>
	<Quantum name="qp_Innihellir20"/>
	<Quantum name="qp_Innihellir21"/>
	<Quantum name="qp_Innihellir22"/>
	<Quantum name="qp_Innihellir23"/>
	<Quantum name="qp_Innihellir24"/>
</Sequence>
<CheckConditionQuantum name="qp_Innihellir" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Innihellir"/>
</CheckConditionQuantum>

<Sequence name="su_UtanHelli">
	<Quantum name="qu_UtanHelli1"/>
	<Quantum name="qu_UtanHelli2"/>
	<Quantum name="qu_UtanHelli3"/>
	<Quantum name="qu_UtanHelli4"/>
	<Quantum name="qu_UtanHelli5"/>
	<Quantum name="qu_UtanHelli6"/>
	<Quantum name="qu_UtanHelli7"/>
	<Quantum name="qu_UtanHelli8"/>
	<Quantum name="qu_UtanHelli9"/>
	<Quantum name="qu_UtanHelli10"/>
	<Quantum name="qu_UtanHelli11"/>
	<Quantum name="qu_UtanHelli12"/>
	<Quantum name="qu_UtanHelli13"/>
	<Quantum name="qu_UtanHelli14"/>
	<Quantum name="qu_UtanHelli15"/>
	<Quantum name="qu_UtanHelli16"/>
	<Quantum name="qu_UtanHelli17"/>
	<Quantum name="qu_UtanHelli18"/>
	<Quantum name="qu_UtanHelli19"/>
	<Quantum name="qu_UtanHelli20"/>
</Sequence>
<CheckConditionQuantum name="qu_UtanHelli" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_UtanHelli"/>
</CheckConditionQuantum>

<Sequence name="sp_UtanHelli">
	<Quantum name="qp_UtanHelli1"/>
	<Quantum name="qp_UtanHelli2"/>
	<Quantum name="qp_UtanHelli3"/>
	<Quantum name="qp_UtanHelli4"/>
	<Quantum name="qp_UtanHelli5"/>
	<Quantum name="qp_UtanHelli6"/>
	<Quantum name="qp_UtanHelli7"/>
	<Quantum name="qp_UtanHelli8"/>
	<Quantum name="qp_UtanHelli9"/>
	<Quantum name="qp_UtanHelli10"/>
	<Quantum name="qp_UtanHelli11"/>
	<Quantum name="qp_UtanHelli12"/>
	<Quantum name="qp_UtanHelli13"/>
	<Quantum name="qp_UtanHelli14"/>
	<Quantum name="qp_UtanHelli15"/>
	<Quantum name="qp_UtanHelli16"/>
	<Quantum name="qp_UtanHelli17"/>
	<Quantum name="qp_UtanHelli18"/>
	<Quantum name="qp_UtanHelli19"/>
	<Quantum name="qp_UtanHelli20"/>
</Sequence>
<CheckConditionQuantum name="qp_UtanHelli" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_UtanHelli"/>
</CheckConditionQuantum>

<Sequence name="su_Kaetan">
	<Quantum name="qu_Kaetan1"/>
	<Quantum name="qu_Kaetan2"/>
	<Quantum name="qu_Kaetan3"/>
	<Quantum name="qu_Kaetan4"/>
	<Quantum name="qu_Kaetan5"/>
	<Quantum name="qu_Kaetan6"/>
	<Quantum name="qu_Kaetan7"/>
	<Quantum name="qu_Kaetan8"/>
</Sequence>
<CheckConditionQuantum name="qu_Kaetan" flag="f_Zero" wait="true">
	<Trigger value="0" seq="su_Kaetan"/>
</CheckConditionQuantum>

<Sequence name="sp_Kaetan">
	<Quantum name="qp_Kaetan1"/>
	<Quantum name="qp_Kaetan2"/>
	<Quantum name="qp_Kaetan3"/>
	<Quantum name="qp_Kaetan4"/>
	<Quantum name="qp_Kaetan5"/>
	<Quantum name="qp_Kaetan6"/>
	<Quantum name="qp_Kaetan7"/>
	<Quantum name="qp_Kaetan8"/>
</Sequence>
<CheckConditionQuantum name="qp_Kaetan" flag="f_Zero" wait="true">
	<Trigger value="0" seq="sp_Kaetan"/>
</CheckConditionQuantum>

<!-- Move items to nowhere -->
<MoveActorQuantum name="q_MoveSkeid" actor="a_Skeid"/>
<MoveActorQuantum name="q_MoveTappi" actor="a_Tappi"/>
<MoveActorQuantum name="q_MoveTunna" actor="a_Tunna"/>
<MoveActorQuantum name="q_MovePrik" actor="a_Prik"/>
<MoveActorQuantum name="q_MovePrikOgReipi" actor="a_PrikOgReipi"/>
<MoveActorQuantum name="q_MoveDansktReipi" actor="a_DansktReipi"/>
<MoveActorQuantum name="q_MoveLas" actor="a_Las"/>
<MoveActorQuantum name="q_MoveBrotinnLas2Dekkid" actor="a_BrotinnLas" terrain="t_Dekkidl"/>
<MoveActorQuantum name="q_MoveEdalsteinn" actor="a_Edalsteinn"/>
<MoveActorQuantum name="q_MoveGlerflaska" actor="a_Glerflaska"/>

<MoveActorQuantum name="q_MoveMamma" actor="a_Mamma"/>

<!-- Move items to the inventory -->
<MoveActorQuantum name="q_MoveAskur2Inventory" actor="a_Askur" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveSkeid2Inventory" actor="a_Skeid" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveTappi2Inventory" actor="a_Tappi" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveBraud2Inventory" actor="a_Braud" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveTunna2Inventory" actor="a_Tunna" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveTunnaMedTappa2Inventory" actor="a_TunnaMedTappa" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MovePrik2Inventory" actor="a_Prik" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveDansktReipi2Inventory" actor="a_DansktReipi" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MovePrikOgReipi2Inventory" actor="a_PrikOgReipi" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveKubein2Inventory" actor="a_Kubein" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveFlaska2Inventory" actor="a_Flaska" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveFloskuskeyti2Inventory" actor="a_Floskuskeyti" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveEdalsteinn2Inventory" actor="a_Edalsteinn" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveBrot12Inventory" actor="a_Brot1" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveGlerflaska2Inventory" actor="a_Glerflaska" terrain="t_Inventory"/>
<MoveActorQuantum name="q_MoveFloskuBrot2Inventory" actor="a_FloskuBrot" terrain="t_Inventory"/>

<!-- Move items to a specific place -->
<MoveActorQuantum name="q_MoveFlaska2Fjaran" actor="a_Flaska" terrain="t_Fjaranl">	<Location x="0" y="400" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveFloskuBrot2Dekkid" actor="a_FloskuBrot" terrain="t_Dekkidl"/>
<MoveActorQuantum name="q_MoveFloskuBrot22Dekkid" actor="a_FloskuBrot2" terrain="t_Dekkidl"/>

<StopActorQuantum name="q_StopFlaska" actor="a_Flaska"/>

<!-- Move Sigrun around -->
<StopActorQuantum name="q_StopSigrun" actor="a_Sigrun"/>

<MoveActorQuantum name="q_MoveSigrun1UtanHusid2Kot" actor="a_Sigrun" terrain="t_Kotl">	<Location x="750" y="525" z="0"/> </MoveActorQuantum>

<MoveActorQuantum name="q_MoveSigrun1Kot2UtanHusid" actor="a_Sigrun" terrain="t_UtanHusidl">	<Location x="530" y="465" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrun1UtanHelli2UtanHusid" actor="a_Sigrun" terrain="t_UtanHusidl">	<Location x="-80" y="560" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrun1UtanDanskaHusid2UtanHusid" actor="a_Sigrun" terrain="t_UtanHusidl">	<Location x="1670" y="550" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkSigrunUtanHusidInLeft" actor="a_Sigrun" x="250" y="575" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunUtanHusidInRight" actor="a_Sigrun" x="1450" y="550" wait="true"/>

<MoveActorQuantum name="q_MoveSigrun1UtanHusid2DansktHus" actor="a_Sigrun" terrain="t_DansktHusl">	<Location x="770" y="500" z="0"/> </MoveActorQuantum>

<MoveActorQuantum name="q_MoveSigrun1UtanHusid2UtanDanskaHusid" actor="a_Sigrun" terrain="t_UtanDanskaHusidl">	<Location x="670" y="275" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrun1UtanHusid2UtanDanskaHusid2" actor="a_Sigrun" terrain="t_UtanDanskaHusidl">	<Location x="575" y="435" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrun1Fjaran2UtanDanskaHusid" actor="a_Sigrun" terrain="t_UtanDanskaHusidl">	<Location x="-80" y="490" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkSigrunUtanDanskaHusidInLeft" actor="a_Sigrun" x="100" y="490" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunUtanDanskaHusidInRight" actor="a_Sigrun" x="350" y="275" wait="true"/>

<MoveActorQuantum name="q_MoveSigrun1UtanDanskaHusid2Fjaran" actor="a_Sigrun" terrain="t_Fjaranl">	<Location x="1200" y="450" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrun1UtanHelli2Fjaran" actor="a_Sigrun" terrain="t_Fjaranl">	<Location x="800" y="850" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkSigrunFjaranInDown" actor="a_Sigrun" x="800" y="560" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunFjaranInRight" actor="a_Sigrun" x="1100" y="450" wait="true"/>

<MoveActorQuantum name="q_MoveSigrun1Fjaran2Dekkid" actor="a_Sigrun" terrain="t_Dekkidl"> <Location x="910" y="440" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrun1Kaetan2Dekkid" actor="a_Sigrun" terrain="t_Dekkidl"> <Location x="330" y="490" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrunDekkid2Fjaran" actor="a_Sigrun" terrain="t_Fjaranl"> <Location x="325" y="550" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHalldora2Fjaran" actor="a_Halldora" terrain="t_Fjaranl"> <Location x="410" y="550" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkHalldoraAwayFjaran" actor="a_Halldora" x="895" y="540" wait="true"/>

<MoveActorQuantum name="q_MoveSigrun1Dekkid2Kaetan" actor="a_Sigrun" terrain="t_Kaetanl">	<Location x="380" y="850" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkSigrunKaetanInDown" actor="a_Sigrun" x="380" y="510" wait="true"/>
<MoveActorQuantum name="q_MoveSigrun2UtanHelliFromInniHelli" actor="a_Sigrun" terrain="t_UtanHellil">	<Location x="135" y="515" z="0"/> </MoveActorQuantum>

<MoveActorQuantum name="q_MoveSigrun1UtanHusid2UtanHelli" actor="a_Sigrun" terrain="t_UtanHellil">	<Location x="-100" y="550" z="0"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveSigrun1Fjaran2UtanHelli" actor="a_Sigrun" terrain="t_UtanHellil">	<Location x="900" y="560" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkSigrunUtanHelliInLeft" actor="a_Sigrun" x="100" y="550" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunUtanHelliInRight" actor="a_Sigrun" x="700" y="560" wait="true"/>

<MoveActorQuantum name="q_MoveSigrun2Innihellir" actor="a_Sigrun" terrain="t_Innihellirl">	<Location x="1140" y="555" z="0"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkSigrunInnihellirIn" actor="a_Sigrun" x="700" y="475" wait="true"/>
<SetDestinationQuantum name="q_WalkRunaHotspot" actor="a_Sigrun" x="1097" y="296" wait="false"/>

<!-- Let Sigrun walk -->
<SetDestinationQuantum name="q_WalkSigrunUtanHusidOutLeft" actor="a_Sigrun" x="-100" y="550" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunUtanHusidOutRight" actor="a_Sigrun" x="1700" y="540" wait="true"/>

<SetDestinationQuantum name="q_WalkSigrunUtanDanskaHusidOutLeft" actor="a_Sigrun" x="-120" y="490" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunUtanDanskaHusidOutRight" actor="a_Sigrun" x="710" y="275" wait="true"/>

<SetDestinationQuantum name="q_WalkSigrunFjaranOutDownLeft" actor="a_Sigrun" x="350" y="850" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunFjaranOutDownRight" actor="a_Sigrun" x="860" y="850" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunFjaranOutRight" actor="a_Sigrun" x="1300" y="450" wait="true"/>

<SetDestinationQuantum name="q_WalkSigrunKaetanOutDown" actor="a_Sigrun" x="350" y="950" wait="true"/>

<SetDestinationQuantum name="q_WalkSigrunUtanHelliOutLeft" actor="a_Sigrun" x="-100" y="550" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunUtanHelliOutRight" actor="a_Sigrun" x="900" y="550" wait="true"/>

<SetDestinationQuantum name="q_WalkSigrunKotHurd1" actor="a_Sigrun" x="920" y="535" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunKotHurd2" actor="a_Sigrun" x="1060" y="535" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunUtiHurd" actor="a_Sigrun" x="500" y="430" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunFjolin" actor="a_Sigrun" x="490" y="490" wait="true"/>
<MoveActorQuantum name="q_MoveSigrun2DanskaHusid82" actor="a_Sigrun" terrain="t_DansktHusl"> <Location x="495" y="495" z="1"/> </MoveActorQuantum>

<SetDestinationQuantum name="q_WalkSigrunPlayDead1" actor="a_Sigrun" x="290" y="440" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunPlayDead2" actor="a_Sigrun" x="490" y="440" wait="true"/>

<SetDestinationQuantum name="q_WalkSigrunBatur" actor="a_Sigrun" x="1050" y="440" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunSjor" actor="a_Sigrun" x="305" y="530" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunLas" actor="a_Sigrun" x="275" y="465" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunSteinar" actor="a_Sigrun" x="425" y="470" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrunSprunga" actor="a_Sigrun" x="145" y="510" wait="true"/>

<SetDestinationQuantum name="q_WalkSigrunChange" actor="a_Sigrun" x="275" y="503" wait="true"/>

<!-- Move Halldora around -->
<MoveActorQuantum name="q_MoveHalldora1Kot2UtanHusid" actor="a_Halldora" terrain="t_UtanHusidl">	<Location x="650" y="480" z="0"/> </MoveActorQuantum>

<MoveActorQuantum name="q_MoveHalldora2Kaetan" actor="a_Halldora" terrain="t_Kaetanl"> <Location x="373" y="416" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHalldoraFreed" actor="a_Halldora" terrain="t_Kaetanl"> <Location x="390" y="515" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHalldora2Hellir" actor="a_Halldora" terrain="t_Innihellirl"> <Location x="900" y="470" z="1"/> </MoveActorQuantum>

<!-- Let Halldora walk -->
<SetDestinationQuantum name="q_WalkHalldoraBegin" actor="a_Halldora" x="660" y="525" wait="true"/>
<SetDestinationQuantum name="q_WalkHalldoraKot" actor="a_Halldora" x="1040" y="525" wait="true"/>
<SetDestinationQuantum name="q_WalkTyrki1Robbed" actor="a_Tyrki1" x="690" y="290" wait="true"/>

<MoveTerrainQuantum name="q_MoveConvHalldora2Hellir" terrain="conv_Halldora" scene="s_Innihellir"/>

<SetDestinationQuantum name="q_WalkSigrunTalkspotKot" actor="a_Sigrun" x="433" y="540" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrun2BundnirMenn1" actor="a_Sigrun" x="930" y="485" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrun2BundnirMenn2" actor="a_Sigrun" x="1100" y="485" wait="true"/>
<SetDestinationQuantum name="q_WalkSigrun2Rock" actor="a_Sigrun" x="185" y="365" wait="true"/>
<SetDestinationQuantum name="q_WalkHalldora2Rock1" actor="a_Halldora" x="337" y="406" wait="true"/>
<SetDestinationQuantum name="q_WalkHalldora2Rock2" actor="a_Halldora" x="187" y="372" wait="true"/>
<MoveActorQuantum name="q_MoveSigrun2Dead" actor="a_Sigrun" terrain="t_Innihellirl"> <Location x="259" y="427" z="1"/> </MoveActorQuantum>
<MoveActorQuantum name="q_MoveHalldora2Dead" actor="a_Halldora" terrain="t_Innihellirl"> <Location x="460" y="366" z="1"/> </MoveActorQuantum>
<SetDestinationQuantum name="q_WalkSigrun2TalkspotHellir2" actor="a_Sigrun" x="280" y="400" wait="true"/>


<Sequence name="sr_Look1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Look1"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Look2"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Look3"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Look4"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Look5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Look5"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>

<Sequence name="sr_Take1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take1"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take2"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take3"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take4"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take6"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take6"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take7">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take7"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Talk1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talk1"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talk2"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talk3"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Talk4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talk4"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talking"/>
</Sequence>

<Sequence name="sr_Use1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Use1"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Use2"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Use3"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Use4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_EgGraedi"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<Sequence name="sr_Take8">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Take8"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>

<CheckConditionQuantum name="q_RandomLook" flag="f_Random7" wait="true">
	<Trigger value="0" seq="sr_Look1"/>
	<Trigger value="1" seq="sr_Look2"/>
	<Trigger value="2" seq="sr_Look3"/>
	<Trigger value="3" seq="sr_Take7"/>
	<Trigger value="4" seq="sr_Take1"/>
	<Trigger value="5" seq="sr_Look4"/>
	<Trigger value="6" seq="sr_Look5"/>
</CheckConditionQuantum>

<Sequence name="s_randomLook">
    <Quantum name="q_Randomize7"/>
    <Quantum name="q_RandomLook"/>
</Sequence>

<CheckConditionQuantum name="q_RandomTalk" flag="f_Random6" wait="true">
	<Trigger value="0" seq="sr_Talk1"/>
	<Trigger value="1" seq="sr_Talk2"/>
	<Trigger value="2" seq="sr_Talk3"/>
	<Trigger value="3" seq="sr_Take2"/>
	<Trigger value="4" seq="sr_Take3"/>
	<Trigger value="5" seq="sr_Talk4"/>
</CheckConditionQuantum>

<Sequence name="s_randomTalk">
    <Quantum name="q_Randomize6"/>
    <Quantum name="q_RandomTalk"/>
</Sequence>

<CheckConditionQuantum name="q_RandomUse" flag="f_Random4" wait="true">
	<Trigger value="0" seq="sr_Use1"/>
	<Trigger value="1" seq="sr_Use2"/>
	<Trigger value="2" seq="sr_Use3"/>
	<Trigger value="3" seq="sr_Use4"/>
</CheckConditionQuantum>

<Sequence name="s_randomUse">
    <Quantum name="q_Randomize4"/>
    <Quantum name="q_RandomUse"/>
</Sequence>

<CheckConditionQuantum name="q_RandomTake" flag="f_Random10" wait="true">
	<Trigger value="0" seq="sr_Take1"/>
	<Trigger value="1" seq="sr_Take2"/>
	<Trigger value="2" seq="sr_Take3"/>
	<Trigger value="3" seq="sr_Take4"/>
	<Trigger value="4" seq="sr_Take5"/>
	<Trigger value="5" seq="sr_Take6"/>
	<Trigger value="6" seq="sr_Take7"/>
	<Trigger value="7" seq="sr_Use3"/>
	<Trigger value="8" seq="sr_Talk1"/>
	<Trigger value="9" seq="sr_Take8"/>
</CheckConditionQuantum>

<Sequence name="s_randomTake">
    <Quantum name="q_Randomize10"/>
    <Quantum name="q_RandomTake"/>
</Sequence>

<!--
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

-->
<Text name="a_Noname_acc" terrain="t_Corners" text=" " color="yellow" hilite="false"/>
<JMFActorMouth name="m_Spennir" file="\tyrkjarA\Media\sfx\spennir.wav" />
<JMFActorMouth name="m_Splass" file="\tyrkjarA\Media\sfx\splass.wav" />
<JMFActorMouth name="m_BaturSekkur" file="\tyrkjarA\Media\sfx\baturseA.wav" />
<JMFActorMouth name="m_Zoom" file="\tyrkjarA\Media\sfx\zoom.wav" />
<JMFActorMouth name="m_Crash" file="\tyrkjarA\Media\sfx\crash.wav" />
<JMFActorMouth name="m_Commotion" file="\tyrkjarA\Media\sfx\commotiA.wav" repeat="true"/>
<SpeechActorMouth name="m_Handteknar" file="\tyrkjarA\Media\sfx\handtekA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hjálp!" time="3330"/>
	<Sentence text=" " time="4040"/>
	<Sentence text="Hjálp!" time="7726"/>
	<Sentence text=" " time="8626"/>
	<Sentence text="Slepptu mér dóninn þinn!" time="11630"/>
	<Sentence text=" " time="13240"/> </SpeechActorMouth>
<SpeechActorMouth name="m_SigrunHandtekin" file="\tyrkjarA\Media\sfx\sigrunhA.wav" acc="a_Sigrun_acc">
	<Sentence text="Hjálp!" time="2464"/>
	<Sentence text=" " time="3100"/>
	<Sentence text="Hjálp!" time="8000"/>
	<Sentence text=" " time="8600"/> </SpeechActorMouth>
<SpeechActorMouth name="m_TyrkinnErKominn" file="\TyrkjarA\Media\sfx\TyrkinnA.wav" acc="a_Noname_acc">
	<Sentence text="Hund-Tyrkinn er kominn! Flýið!" time="16547"/>
	<Sentence text=" " time="19711"/> </SpeechActorMouth>
<SpeechActorMouth name="m_Befala" file="\TyrkjarA\Media\sfx\befala.wav" acc="a_Jon_acc">
	<Sentence text="Ég befala mig guði. Þú mátt gera hið frekasta." time="4250"/>
	<Sentence text=" " time="9500"/>
	<Sentence text="Það er nóg. Herra Jesús, meðtak minn anda." time="14286"/>
	<Sentence text=" " time="18445"/>
	<Sentence text="aaarrggh!" time="19320"/>
	<Sentence text=" " time="21000"/> </SpeechActorMouth>
<JMFActorMouth name="m_Hverfur" file="\sidaskiA\Media\sfx\hverfur.wav" />
<StaticActor name="a_SFX" x="0" y="0" z="0" state="stop">
	<State name="spennir" mouth="m_Spennir"/>
	<State name="splass" mouth="m_Splass"/>
	<State name="zoom" mouth="m_Zoom"/>
	<State name="crash" mouth="m_Crash"/>
	<State name="batursekkur" mouth="m_BaturSekkur"/>
	<State name="hverfur" mouth="m_Hverfur"/>
	<State name="sigrunhandtekin" mouth="m_SigrunHandtekin"/>
	<State name="handteknar" mouth="m_Handteknar"/>
	<State name="commotion" mouth="m_Commotion"/>
	<State name="TyrkinnErKominn" mouth="m_TyrkinnErKominn"/>
	<State name="befala" mouth="m_Befala"/>
</StaticActor>
<StateQuantum name="q_StopSFX" actor="a_SFX" state="stop" wait="false"/>
<StateQuantum name="q_PlaySpennir" actor="a_SFX" state="spennir" wait="false"/>
<StateQuantum name="q_PlaySplass" actor="a_SFX" state="splass" wait="false"/>
<StateQuantum name="q_PlayBaturSekkur" actor="a_SFX" state="batursekkur" wait="false"/>
<StateQuantum name="q_PlayHverfur" actor="a_SFX" state="hverfur" wait="false"/>
<StateQuantum name="q_PlayZoom" actor="a_SFX" state="zoom" wait="false"/>
<StateQuantum name="q_PlayCrash" actor="a_SFX" state="crash" wait="false"/>
<StateQuantum name="q_PlayCommotion" actor="a_SFX" state="commotion" wait="false"/>
<StateQuantum name="q_PlayHandteknar" actor="a_SFX" state="handteknar" wait="true"/>
<StateQuantum name="q_PlaySigrunHandtekin" actor="a_SFX" state="sigrunhandtekin" wait="true"/>
<StateQuantum name="q_TyrkinnErKominn" actor="a_SFX" state="TyrkinnErKominn" wait="true"/>
<StateQuantum name="q_Befala" actor="a_SFX" state="befala" wait="true"/>


<!-- Conversations -->
<!-- Conversation with Halldora -->

<Text name="HverEr" text="Hver er þessi Hund-Tyrki?" terrain="conv_Halldora" color="white"/>
	<ActorMoused actor="HverEr" listener="sc"/>
<Text name="HvadEr" text="Hvað er Barbaríið?" terrain="conv_Halldora" color="white"/>
	<ActorMoused actor="HvadEr" listener="sc"/>
<Text name="HvadaSogur" text="Hvaða sögur frá Grindavík var mamma að tala um?" terrain="conv_Halldora" color="white"/>
	<ActorMoused actor="HvadaSogur" listener="sc"/>
<Text name="HvadaDagur" text="Hvaða dagur er aftur í dag?" terrain="conv_Halldora" color="white"/>
	<ActorMoused actor="HvadaDagur" listener="sc"/>
<Text name="Bless1" text="Bless!" terrain="conv_Halldora" color="white"/>
	<ActorMoused actor="Bless1" listener="sc"/>
<Text name="Bless2" text="Bless!" color="white"/>
	<ActorMoused actor="Bless2" listener="sc"/>
<Text name="Tyrklandi" text="Á Hund-Tyrkinn heima í Tyrklandi?" color="white"/>
	<ActorMoused actor="Tyrklandi" listener="sc"/>
<Text name="HversVegna" text="Hvers vegna fóru Tyrkirnir með þig upp í skip?" color="white"/>
	<ActorMoused actor="HversVegna" listener="sc"/>
<Text name="VeistThu" text="Veist þú um einhvern öruggan felustað?" color="white"/>
	<ActorMoused actor="VeistThu" listener="sc"/>
<Text name="FannstThuMommu" text="Fannst þú mömmu okkar?" color="white"/>
	<ActorMoused actor="FannstThuMommu" listener="sc"/>

<!-- Quanta for hiding texts -->
<MoveActorQuantum name="qh_HverEr" actor="HverEr"/>
<MoveActorQuantum name="qh_HvadEr" actor="HvadEr"/>
<MoveActorQuantum name="qh_HvadaSogur" actor="HvadaSogur"/>
<MoveActorQuantum name="qh_HvadaDagur" actor="HvadaDagur"/>
<MoveActorQuantum name="qh_Tyrklandi" actor="Tyrklandi"/>
<MoveActorQuantum name="qh_HversVegna" actor="HversVegna"/>
<MoveActorQuantum name="qh_Bless1" actor="Bless1"/>
<MoveActorQuantum name="qh_VeistThu" actor="VeistThu"/>
<MoveActorQuantum name="qh_FannstThuMommu" actor="FannstThuMommu"/>

<!-- Quanta for showing texts -->
<MoveActorQuantum name="qs_Tyrklandi" actor="Tyrklandi" terrain="conv_Halldora"/>
<MoveActorQuantum name="qs_HversVegna" actor="HversVegna" terrain="conv_Halldora"/>
<MoveActorQuantum name="qs_Bless2" actor="Bless2" terrain="conv_Halldora"/>
<MoveActorQuantum name="qs_VeistThu" actor="VeistThu" terrain="conv_Halldora"/>
<MoveActorQuantum name="qs_FannstThuMommu" actor="FannstThuMommu" terrain="conv_Halldora"/>

<!-- -->

<UpdateQuantum name="qh_TextHalldora" terrain="conv_Halldora" show="false"/>
<UpdateQuantum name="qs_TextHalldora" terrain="conv_Halldora" show="true"/>

<Sequence name="s_BeginConvHalldoraKot">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_WalkSigrunTalkspotKot"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_HeyrduHalldora"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_JaSigrun"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>

<Sequence name="s_BeginConvHalldoraHellir">
	<Quantum name="q_WalkSigrunInnihellirIn"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Conversating"/>
	<Quantum name="q_HeyrduHalldora"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_JaSigrun"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>

<Sequence name="s_BeginConvHalldoraHellir3">
	<Quantum name="q_WalkSigrun2TalkspotHellir2"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Conversating"/>
	<Quantum name="q_HeyrduHalldora"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_JaSigrun"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>

<Sequence name="s_BeginConvHalldoraKaetan">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_Keflud"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>

<CheckConditionQuantum name="q_CheckConvHalldora2" flag="f_JohnDead" wait="true">
	<Trigger value="0" seq="s_BeginConvHalldoraHellir"/>
	<Trigger value="1" seq="s_BeginConvHalldoraHellir3"/>
</CheckConditionQuantum>
<Sequence name="s_BeginConvHalldoraHellir2">
	<Quantum name="q_CheckConvHalldora2"/>
</Sequence>
<CheckConditionQuantum name="q_CheckConvHalldora" flag="f_CurrentScene" wait="true">
	<Trigger value="9" seq="s_BeginConvHalldoraKot"/>
	<Trigger value="6" seq="s_BeginConvHalldoraKaetan"/>
	<Trigger value="8" seq="s_BeginConvHalldoraHellir2"/>
</CheckConditionQuantum>
<Sequence name="s_CheckConvHalldora">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_CheckConvHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Halldora" seq="s_CheckConvHalldora"/>

<Sequence name="s_CheckConvHalldorahhj">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Keflud"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Dora" seq="s_CheckConvHalldorahhj"/>

<Sequence name="s_HverEr">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_HverEr"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Tyrkirnir"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_HverEr"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="HverEr" seq="s_HverEr"/>

<Sequence name="s_HvadEr">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_HvadEr"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Barbariid"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_HvadEr"/>
	<Quantum name="qs_Tyrklandi"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadEr" seq="s_HvadEr"/>

<Sequence name="s_HvadaSogur">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_HvadaSogur"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Heyrnarlaus"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_Audvitad"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Heidingjarnir"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_HvadaSogur"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadaSogur" seq="s_HvadaSogur"/>

<Sequence name="s_HvadaDagur">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_HvadaDagur"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_IDag"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_HvadaDagur"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="HvadaDagur" seq="s_HvadaDagur"/>

<Sequence name="s_Tyrklandi">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_Tyrklandi"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_NordurAfriku"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_Tyrklandi"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="Tyrklandi" seq="s_Tyrklandi"/>

<Sequence name="s_Bless1">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_Bless"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Freeze"/>
	<Quantum name="q_TyrkinnErKominn"/>
	<Quantum name="q_PlayCommotion"/>
	<Quantum name="q_Verdmaeti"/>
	<Quantum name="q_Mamma_stop"/>
	<Quantum name="qh_Bless1"/>
	<Quantum name="qs_Bless2"/>
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_WalkHalldoraKot"/>
	<Quantum name="q_MoveHalldora1Kot2UtanHusid"/>
	<Quantum name="q_AskurInc"/>
	<Quantum name="q_AskurInc"/>
	<Quantum name="q_MomTalk1"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="Bless1" seq="s_Bless1"/>

<Sequence name="s_Bless2">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_Bless"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="Bless2" seq="s_Bless2"/>

<Sequence name="s_HversVegna">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_HversVegna"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_VeitEkki"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_HversVegna"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="HversVegna" seq="s_HversVegna"/>

<Sequence name="s_VeistThu">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_VeistThu"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_DetturEnginn"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_VeistThu"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="VeistThu" seq="s_VeistThu"/>

<Sequence name="s_FannstThuMommu">
	<Quantum name="qh_TextHalldora"/>
	<Quantum name="q_FannstThuMommu"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_NeiThviMidur"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="qh_FannstThuMommu"/>
	<Quantum name="qs_TextHalldora"/>
</Sequence>
<Reaction reactor="action_talk" actor="FannstThuMommu" seq="s_FannstThuMommu"/>

<!-- Conversation with Strakur -->

<Text name="LeysaMig" text="Viltu leysa mig?" terrain="conv_Strakur" color="white"/>
	<ActorMoused actor="LeysaMig" listener="sc"/>
<Text name="SedModur" text="Hefur þú nokkuð séð móður mína og hana Halldóru systur mína?" terrain="conv_Strakur" color="white"/>
	<ActorMoused actor="SedModur" listener="sc"/>
<Text name="EkkertAdOttast" text="Það er ekkert að óttast." terrain="conv_Strakur" color="white"/>
	<ActorMoused actor="EkkertAdOttast" listener="sc"/>
<Text name="EkkiBundinn" text="Af hverju ert þú ekki bundinn?" terrain="conv_Strakur" color="white"/>
	<ActorMoused actor="EkkiBundinn" listener="sc"/>
<Text name="HeitirThu" text="Hvað heitir þú litli vinur?" terrain="conv_Strakur" color="white"/>
	<ActorMoused actor="HeitirThu" listener="sc"/>
<Text name="VerdAdBjarga" text="Viltu vera svo vænn og losa mig. Ég verð að bjarga Halldóru!!" color="white"/>
	<ActorMoused actor="VerdAdBjarga" listener="sc"/>
<Text name="MeidduHalldoru" text="Sástu hvort þeir meiddu Halldóru systur mína?" color="white"/>
	<ActorMoused actor="MeidduHalldoru" listener="sc"/>
<Text name="GefaTher" text="Ég skal gefa þér sultu ef þú losar mig." color="white"/>
	<ActorMoused actor="GefaTher" listener="sc"/>
<Text name="FyndistTher" text="LOSAÐU  MIG!!!" color="white"/>
	<ActorMoused actor="FyndistTher" listener="sc"/>
<Text name="BlessStrakur" text="Bless!" terrain="conv_Strakur" color="white"/>
	<ActorMoused actor="BlessStrakur" listener="sc"/>

<!-- Quanta for hiding texts -->

<MoveActorQuantum name="qh_LeysaMig" actor="LeysaMig"/>
<MoveActorQuantum name="qh_SedModur" actor="SedModur"/>
<MoveActorQuantum name="qh_EkkertAdOttast" actor="EkkertAdOttast"/>
<MoveActorQuantum name="qh_EkkiBundinn" actor="EkkiBundinn"/>
<MoveActorQuantum name="qh_HeitirThu" actor="HeitirThu"/>
<MoveActorQuantum name="qh_VerdAdBjarga" actor="VerdAdBjarga"/>
<MoveActorQuantum name="qh_MeidduHalldoru" actor="MeidduHalldoru"/>
<MoveActorQuantum name="qh_GefaTher" actor="GefaTher"/>
<MoveActorQuantum name="qh_FyndistTher" actor="FyndistTher"/>

<!-- Quanta for showing texts -->

<MoveActorQuantum name="qs_VerdAdBjarga" actor="VerdAdBjarga" terrain="conv_Strakur"/>
<MoveActorQuantum name="qs_MeidduHalldoru" actor="MeidduHalldoru" terrain="conv_Strakur"/>
<MoveActorQuantum name="qs_GefaTher" actor="GefaTher" terrain="conv_Strakur"/>
<MoveActorQuantum name="qs_FyndistTher" actor="FyndistTher" terrain="conv_Strakur"/>

<UpdateQuantum name="qh_TextStrakur" terrain="conv_Strakur" show="false"/>
<UpdateQuantum name="qs_TextStrakur" terrain="conv_Strakur" show="true"/>

<Sequence name="s_BlessStrakur">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_BlessStrakur"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_talk" actor="BlessStrakur" seq="s_BlessStrakur"/>

<Sequence name="s_Hvernig">
	<Quantum name="q_Hvernig"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_HentuMer"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="q_Nei"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_ConvStrakur1"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>

<Sequence name="s_ShowTextStrakur">
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Sequence name="s_HefEigiTima">
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_ThadErEnginnTimiTil"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<CheckConditionQuantum name="q_CheckConvStrakur" flag="f_ConvStrakur" wait="true">
	<Trigger value="0" seq="s_Hvernig"/>
	<Trigger value="1" seq="s_ShowTextStrakur"/>
	<Trigger value="2" seq="s_HefEigiTima"/>
</CheckConditionQuantum>

<Sequence name="s_CheckConvStrakur">
	<Quantum name="q_Conversating"/>
	<Quantum name="q_CheckConvStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Strakur" seq="s_CheckConvStrakur"/>

<Sequence name="s_LeysaMig">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_LeysaMig"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_ThoriEkki"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_LeysaMig"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="LeysaMig" seq="s_LeysaMig"/>

<Sequence name="s_SedModur">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_SedModur"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_EkkiSed"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="q_AdSjalfsogdu"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Syndist"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_SedModur"/>
	<Quantum name="qs_VerdAdBjarga"/>
	<Quantum name="qs_MeidduHalldoru"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="SedModur" seq="s_SedModur"/>

<Sequence name="s_EkkertAdOttast">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_EkkertAdOttast"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_EgVona"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_EkkertAdOttast"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="EkkertAdOttast" seq="s_EkkertAdOttast"/>

<Sequence name="s_EkkiBundinn">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_EkkiBundinn"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_FlytaSer"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_EkkiBundinn"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="EkkiBundinn" seq="s_EkkiBundinn"/>

<Sequence name="s_HeitirThu">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_HeitirThu"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_SegiTherEkki"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_HeitirThu"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="HeitirThu" seq="s_HeitirThu"/>

<Sequence name="s_VerdAdBjarga">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_VerdAdBjarga"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_HelstEkki"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_VerdAdBjarga"/>
	<Quantum name="qs_GefaTher"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="VerdAdBjarga" seq="s_VerdAdBjarga"/>

<Sequence name="s_MeidduHalldoru">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_MeidduHalldoru"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Thraelamarkadi"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_MeidduHalldoru"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="MeidduHalldoru" seq="s_MeidduHalldoru"/>

<Sequence name="s_GefaTher">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_GefaTher"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_NeiEgKaeri"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="qh_GefaTher"/>
	<Quantum name="qs_FyndistTher"/>
	<Quantum name="qs_TextStrakur"/>
</Sequence>
<Reaction reactor="action_talk" actor="GefaTher" seq="s_GefaTher"/>

<Sequence name="s_FyndistTher">
	<Quantum name="qh_TextStrakur"/>
	<Quantum name="q_FyndistTher"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_JaejaTha"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="q_EgLofa"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="qh_FyndistTher"/>
	<Quantum name="q_Strakur_untie"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Strakur_stop"/>
	<Quantum name="q_MoveDansktReipi2DansktHus"/>
	<Quantum name="q_SigrunTied0"/>
	<Quantum name="q_ConvStrakur2"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="FyndistTher" seq="s_FyndistTher"/>


<!-- Reactions -->
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
<StaticActorFace name="af_BeginScene" file="\tyrkjarA\Graphic\byrjunaA"/>
<StaticActor name="a_BeginScene" terrain="t_BeginScene" x="0" y="5000" z="5000" state="stop">
	<State name="stop" face="af_BeginScene"/>
</StaticActor>
<PrepareQuantum name="qp_BeginScene" object="af_BeginScene" prepare="true"/>
<PrepareQuantum name="qu_BeginScene" object="af_BeginScene" prepare="false"/>
<SwitchSceneQuantum name="q_ToBeginScene" scene="s_BeginScene"/>

<!-- Begin sequence -->
<Sequence name="s_begin">
	<Quantum name="q_Freeze"/>
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="q_4sec"/>
    <Quantum name="qf_ByrjunarlagOut2"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_BeginScene"/>
	<Quantum name="qp_Kot"/>
	<Quantum name="q_Byrjunarlag_stop"/>
	<Quantum name="q_Adallag_play"/>
	<Quantum name="q_ToKot"/>
	<Quantum name="q_CurrentKot"/>
	<Quantum name="q_SteinnGame=3"/>
	<Quantum name="q_WalkHalldoraBegin"/>
	<Quantum name="q_SigrunSystir"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_SvonaSvona"/>
	<Quantum name="q_Mamma_stop"/>
	<Quantum name="q_Kannski"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_HeillManudur"/>
	<Quantum name="q_Mamma_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>

<Sequence name="s_ToKot44">
	<Quantum name="qp_Kot"/>
	<Quantum name="q_ToKot"/>
</Sequence>
<Sequence name="s_ToUtanHelli44">
	<Quantum name="qp_UtanHelli"/>
	<Quantum name="q_ToUtanHelli"/>
</Sequence>
<Sequence name="s_ToKaetan44">
	<Quantum name="qp_Kaetan"/>
	<Quantum name="q_ToKaetan"/>
</Sequence>
<Sequence name="s_ToDekkid44">
	<Quantum name="qp_Dekkid"/>
	<Quantum name="q_ToDekkid"/>
</Sequence>
<Sequence name="s_ToFjaran44">
	<Quantum name="qp_Fjaran"/>
	<Quantum name="q_ToFjaran"/>
</Sequence>
<Sequence name="s_ToUtanDH44">
	<Quantum name="qp_UtanDanskaHusid"/>
	<Quantum name="q_ToUtanDanskaHusid"/>
</Sequence>
<Sequence name="s_ToDansktHus44">
	<Quantum name="qp_DansktHus"/>
	<Quantum name="q_ToDansktHus"/>
</Sequence>
<Sequence name="s_ToFyrirUtan44">
	<Quantum name="qp_UtanHusid"/>
	<Quantum name="q_ToUtanHusid"/>
</Sequence>
<Sequence name="s_ToInniHelli44">
	<Quantum name="qp_Innihellir"/>
	<Quantum name="q_ToInnihellir"/>
</Sequence>
<Sequence name="s_ToIntro44">
	<Quantum name="qp_BeginScene"/>
	<Quantum name="q_ToBeginScene"/>
</Sequence>

<CheckConditionQuantum name="q_CheckPrepare56b8" flag="f_CurrentScene" wait="true">
	<Trigger value="9" seq="s_ToKot44"/>
	<Trigger value="0" seq="s_ToIntro44"/>
	<Trigger value="1" seq="s_ToFyrirUtan44"/>
	<Trigger value="2" seq="s_ToDansktHus44"/>
	<Trigger value="3" seq="s_ToUtanDH44"/>
	<Trigger value="4" seq="s_ToFjaran44"/>
	<Trigger value="5" seq="s_ToDekkid44"/>
	<Trigger value="6" seq="s_ToKaetan44"/>
	<Trigger value="7" seq="s_ToUtanHelli44"/>
	<Trigger value="8" seq="s_ToInniHelli44"/>
</CheckConditionQuantum>
<Sequence name="s_prepare">
	<Quantum name="q_ToBlack"/>
	<Quantum name="q_CheckPrepare56b8"/>
</Sequence>

<Sequence name="s_playIntro">
	<Quantum name="q_Byrjunarlag_play"/>
</Sequence>
<Sequence name="s_playusual">
	<Quantum name="q_Adallag_play"/>
</Sequence>
<Sequence name="s_Oxx">
	<Quantum name="q_Ocean_play"/>
	<Quantum name="q_Adallag_play"/>
</Sequence>
<CheckConditionQuantum name="q_CheckOx" flag="f_CurrentScene" wait="true">
	<Trigger value="4" seq="s_Oxx"/>
</CheckConditionQuantum>
<CheckConditionQuantum name="q_CheckSong43" flag="f_CurrentScene" wait="true">
	<Trigger value="0" seq="s_playIntro"/>
	<Trigger value="1" seq="s_playusual"/>
	<Trigger value="2" seq="s_playusual"/>
	<Trigger value="3" seq="s_playusual"/>
	<Trigger value="4" seq="s_Oxx"/>
	<Trigger value="5" seq="s_playusual"/>
	<Trigger value="6" seq="s_playusual"/>
	<Trigger value="7" seq="s_playusual"/>
	<Trigger value="8" seq="s_playusual"/>
	<Trigger value="9" seq="s_playusual"/>
</CheckConditionQuantum>
<Sequence name="s_always">
    <Quantum name="qp_Adallag"/>
    <Quantum name="qp_Byrjunarlag"/>
    <Quantum name="qf_Adallag"/>
    <Quantum name="q_CheckSong43"/>
</Sequence>
<Sequence name="s_final">
    <Quantum name="q_StopSFX"/>
    <Quantum name="q_Adallag_stop"/>
</Sequence>

<!-- Miscellaneous reactions for Tyrkjaran -->

<!-- Take up Askur -->
<Sequence name="s_TakeAskur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_CheckForStopSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveAskur2Inventory"/>
	<Quantum name="q_Askur_taken"/>
	<Quantum name="q_AskurInc"/>
	<Quantum name="q_MoveSkeid2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Askur" seq="s_TakeAskur"/>

<!-- Take up Kadall -->
<Sequence name="s_TakeKadall">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Kadall_taken"/>
	<Quantum name="q_MoveKadall2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Kadall" seq="s_TakeKadall"/>

<!-- Use askur on Sigrun -->
<Sequence name="s_UseAskurOnSigrun0">
	<Quantum name="q_MoveAskur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_EgGraedi"/>
	<Quantum name="q_Sigrun_stop"/>
</Sequence>

<!-- Use askur on Sigrun -->
<Sequence name="s_UseAskurOnSigrun61">
	<Quantum name="q_MoveAskur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
</Sequence>

<Sequence name="s_UseAskurOnSigrun1">
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunPlayDead1"/>
	<Quantum name="q_SnjallraediEgMaka"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunPlayDead2"/>
	<Quantum name="q_Sigrun_jam"/>
	<Quantum name="q_Sigrun_dead"/>
	<Quantum name="q_Tyrki2_walk"/>
	<Quantum name="q_WalkTyrki2A"/>
	<Quantum name="q_WalkTyrki2B"/>
	<Quantum name="q_Tyrki2_stop"/>
	<Quantum name="q_PlayDead1"/>
	<Quantum name="q_Sigrun_alive"/>
	<Quantum name="q_Sigrun_jam"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Ufff"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveAskur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_DHSec1"/>
</Sequence>
<CheckConditionQuantum name="q_CheckUseAskurOnSigrunAgain" flag="f_PlayDead" wait="true">
	<Trigger value="0" seq="s_UseAskurOnSigrun1"/>
	<Trigger value="1" seq="s_UseAskurOnSigrun0"/> </CheckConditionQuantum>
<Sequence name="s_CheckUseAskurOnSigrunAgain">
	<Quantum name="q_CheckUseAskurOnSigrunAgain"/> </Sequence>

<CheckConditionQuantum name="q_CheckUseAskurOnSig" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_UseAskurOnSigrun61"/>
	<Trigger value="0" seq="s_UseAskurOnSigrun0"/> </CheckConditionQuantum>
<Sequence name="s_UseAskurOnSigrun8">
	<Quantum name="q_CheckUseAskurOnSig"/> </Sequence>

<CheckConditionQuantum name="q_CheckUseAskurOnSigrun" flag="f_CurrentScene" wait="true">
	<Trigger value="9" seq="s_UseAskurOnSigrun0"/>
	<Trigger value="1" seq="s_UseAskurOnSigrun0"/>
	<Trigger value="2" seq="s_UseAskurOnSigrun8"/>
	<Trigger value="3" seq="s_CheckUseAskurOnSigrunAgain"/>
	<Trigger value="4" seq="s_UseAskurOnSigrun0"/>
	<Trigger value="5" seq="s_UseAskurOnSigrun0"/>
	<Trigger value="6" seq="s_UseAskurOnSigrun0"/>
	<Trigger value="7" seq="s_UseAskurOnSigrun0"/>
	<Trigger value="8" seq="s_UseAskurOnSigrun0"/>
</CheckConditionQuantum>
<Sequence name="s_UseAskurOnSigrun">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_CheckUseAskurOnSigrun"/>
    <Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_Sigrun" seq="s_UseAskurOnSigrun"/>

<Sequence name="s_TieRopes">
    <Quantum name="q_Freeze"/>
    <Quantum name="qh_TyrknesktReipi"/>
    <Quantum name="qh_Kadall"/>
    <Quantum name="q_Move2Reipi2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_LangtReipi"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Kadall" actor2="a_TyrknesktReipi" seq="s_TieRopes"/>
<Reaction reactor="action_use" actor2="a_Kadall" actor="a_TyrknesktReipi" seq="s_TieRopes"/>

<!-- Take up Braud -->
<Sequence name="s_TakeBraud">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_CheckForStopSigrun"/>
	<Quantum name="q_MoveBraud2Inventory"/>
	<Quantum name="q_Braud_taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Braud" seq="s_TakeBraud"/>

<!-- Take up Tappi -->
<Sequence name="s_TakeTappiOk">
    <Quantum name="q_ErtThuVissUm"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Thump_play"/>
	<Quantum name="q_MoveTappi2Inventory"/>
	<Quantum name="q_TunnaLekur_go"/>
	<Quantum name="q_Tappi_taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_TappiTaken1"/>
    <Quantum name="q_Ubbss"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_TunnaLekur_stop"/>
</Sequence>
<Sequence name="s_TakeTappiNotOk2">
	<Quantum name="q_HaettuThessuFikti"/>
	<Quantum name="q_Mamma_stop"/>
</Sequence>
<Sequence name="s_TakeTappiNotOk">
	<Quantum name="q_Fikt"/>
	<Quantum name="q_Mamma_stop"/>
</Sequence>
<CheckConditionQuantum name="q_Check290875" flag="f_AskurTaken" wait="true">
	<Trigger value="0" seq="s_TakeTappiNotOk"/>
	<Trigger value="1" seq="s_TakeTappiNotOk"/>
	<Trigger value="2" seq="s_TakeTappiNotOk2"/>
	<Trigger value="3" seq="s_TakeTappiNotOk2"/>
	<Trigger value="4" seq="s_TakeTappiOk"/>
</CheckConditionQuantum>
<Sequence name="s_TakeTappi">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Check290875"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Tappi" seq="s_TakeTappi"/>

<!-- Take up Tunna -->
<Sequence name="s_TakeTunna0">
    <Quantum name="q_HunErAlltOfThung"/>
	<Quantum name="q_Sigrun_stop"/>
</Sequence>
<Sequence name="s_TakeTunna1">
	<Quantum name="q_MoveTunna"/>
	<Quantum name="q_Tunna_taken"/>
	<Quantum name="q_MoveTunna2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
</Sequence>
<CheckConditionQuantum name="q_TappiTaken" flag="f_TappiTaken" wait="true">
	<Trigger value="0" seq="s_TakeTunna0"/>
	<Trigger value="1" seq="s_TakeTunna1"/>
</CheckConditionQuantum>
<Sequence name="s_TakeTunna">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_TappiTaken"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Tunna" seq="s_TakeTunna"/>

<!-- Use Tappi on Tunna -->
<Sequence name="s_UseTappiOnTunna">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Snidugt"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveTappi"/>
	<Quantum name="q_MoveTunna"/>
	<Quantum name="q_MoveTunnaMedTappa2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Tappi" actor2="a_Tunna" seq="s_UseTappiOnTunna"/>
<Reaction reactor="action_use" actor="a_Tunna" actor2="a_Tappi" seq="s_UseTappiOnTunna"/>

<!-- Use TunnaMedTappa on Sjorinn -->
<Sequence name="s_UseTunnaMedTappaOnSjorinn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSjor"/>
    <Quantum name="q_Snjallraedi"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Sigrun_invisible"/>
    <Quantum name="q_SigrunJump"/>
    <Quantum name="q_SigrunJumpNone"/>
    <Quantum name="q_PlaySplass"/>
	<Quantum name="qs_SigrunATunnu"/>
	<Quantum name="qd_SigrunATunnu"/>
	<Quantum name="q_SigrunATunnu_swim"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Fjaran"/>
	<Quantum name="qp_Dekkid"/>
	<Quantum name="q_SigrunATunnu_none"/>
	<Quantum name="q_MoveSigrun1Fjaran2Dekkid"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveTunnaMedTappa2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_ToDekkid"/>
	<Quantum name="q_CurrentDekkid"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Reaction reactor="action_use" actor="a_TunnaMedTappa" actor2="a_Sjorinn" seq="s_UseTunnaMedTappaOnSjorinn"/>

<!-- Use Tunna on Sjorinn -->
<Sequence name="s_UseTunnaOnSjorinn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSjor"/>
	<Quantum name="q_Sigrun_invisible"/>
	<Quantum name="q_SigrunThrow"/>
    <Quantum name="q_PlaySplass"/>
	<Quantum name="qs_TunnaKafi"/>
	<Quantum name="q_SigrunThrowNone"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_TunnanSokk"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveTunna"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Tunna" actor2="a_Sjorinn" seq="s_UseTunnaOnSjorinn"/>

<Sequence name="s_TakeTunnaKafi">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrunSjor"/>
	<Quantum name="q_MoveTunna2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="qh_TunnaKafi"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_TunnaKafi" seq="s_TakeTunnaKafi"/>

<Sequence name="s_LookTunnaKafi">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_TunnanSokk"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_look" actor="a_TunnaKafi" seq="s_LookTunnaKafi"/>

<Sequence name="s_LookKonaMadurDaud">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_AumingjaFolkid"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_look" actor="a_KonaMadurDaud" seq="s_LookKonaMadurDaud"/>
<Reaction reactor="action_look" actor="a_StrakurDaudur" seq="s_LookKonaMadurDaud"/>

<!-- UtanHusid -->

<!-- Use Brot1 on BundnirMenn -->
<Sequence name="s_UseBrot1OnBundnirMenn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrun2BundnirMenn1"/>
	<Quantum name="q_EgSker"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrun2BundnirMenn2"/>
	<Quantum name="qp_SigrunLosar3"/>
	<Quantum name="qh_Sigrun"/>
	<Quantum name="q_MoveSigrunMisc38"/>
	<Quantum name="q_SigrunMisc_LosarB"/>
	<Quantum name="q_MoveSigrunMisc"/>
    <Quantum name="qs_SigrunFyrirUtan"/>
    <Quantum name="qh_BundnirMenn"/>
	<Quantum name="qs_Kadall"/>
    <Quantum name="qs_BundinnMadur1"/>
    <Quantum name="qs_BundinnMadur2"/>
    <Quantum name="q_BundinnMadur2Flyr"/>
    <Quantum name="q_PlayZoom"/>
    <Quantum name="q_BundinnMadur1Flyr"/>
    <Quantum name="q_BundinnMadur2Flyr2"/>
    <Quantum name="q_BundinnMadur1Flyr2"/>
    <Quantum name="qh_BundinnMadur1"/>
    <Quantum name="qh_BundinnMadur2"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveFloskuBrot2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_KomastUndan"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
	<Quantum name="qu_SigrunLosar3"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Reaction reactor="action_use" actor="a_FloskuBrot" actor2="a_BundnirMenn" seq="s_UseBrot1OnBundnirMenn"/>
<UseText listener="sc" actor="a_FloskuBrot" actor2="a_BundnirMenn" text="Skera á böndin"/>

<Sequence name="s_UntieFail">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrun2BundnirMenn1"/>
	<Quantum name="q_WalkSigrun2BundnirMenn2"/>
	<Quantum name="qp_SigrunLosar3"/>
	<Quantum name="qh_Sigrun"/>
	<Quantum name="q_MoveSigrunMisc38"/>
	<Quantum name="q_SigrunMisc_LosarB"/>
	<Quantum name="q_MoveSigrunMisc"/>
    <Quantum name="qs_SigrunFyrirUtan"/>
	<Quantum name="q_EgGetEkki"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_BundnirMenn" seq="s_UntieFail"/>


<!-- DanskaHusid -->
<!-- Take up Prik -->
<Sequence name="s_TakePrik0">
	<Quantum name="q_Hugarorku"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakePrik1">
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MovePrik"/>
	<Quantum name="q_Prik_taken"/>
	<Quantum name="q_MovePrik2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakePrik0"/>
	<Trigger value="0" seq="s_TakePrik1"/>
</CheckConditionQuantum>
<Sequence name="s_TakePrik">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied"/> </Sequence>
<Reaction reactor="action_take" actor="a_Prik" seq="s_TakePrik"/>

<!-- Take up DansktReipi -->
<Sequence name="s_TakeDansktReipi">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveDansktReipi"/>
	<Quantum name="q_DansktReipi_taken"/>
	<Quantum name="q_MoveDansktReipi2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_DansktReipi" seq="s_TakeDansktReipi"/>

<!-- Use DansktReipi on Prik (or vice versa) -->
<Sequence name="s_UseDansktReipi_Prik">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveDansktReipi"/>
	<Quantum name="q_MovePrik"/>
	<Quantum name="q_MovePrikOgReipi2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_NuErReipid"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<Reaction reactor="action_use" actor="a_DansktReipi" actor2="a_Prik" seq="s_UseDansktReipi_Prik"/>
<Reaction reactor="action_use" actor2="a_DansktReipi" actor="a_Prik" seq="s_UseDansktReipi_Prik"/>

<!-- Use Skeid on PrikOgReipi (or vice versa) -->
<Sequence name="s_UseSkeid_PrikOgReipi">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveSkeid"/>
	<Quantum name="q_MovePrikOgReipi"/>
	<Quantum name="q_MoveKubein2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_SkeidinEr"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_PrikOgReipi" seq="s_UseSkeid_PrikOgReipi"/>
<Reaction reactor="action_use" actor2="a_Skeid" actor="a_PrikOgReipi" seq="s_UseSkeid_PrikOgReipi"/>

<!-- Use Kubein on LausaFjolin -->
<Sequence name="s_UseKubeinOnLausaFjolin">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunFjolin"/>
	<Quantum name="q_MoveKubein2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="qp_SigrunMisc_escape1"/>
	<Quantum name="qp_SigrunMisc_escape2"/>
    <Quantum name="q_SpenntUpp"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Sigrun_invisible"/>
	<Quantum name="q_MoveSigrunMisc4escape1"/>
    <Quantum name="q_PlaySpennir"/>
	<Quantum name="q_SigrunMisc_escape1"/>
	<Quantum name="q_MoveSigrunMisc4escape2"/>
	<Quantum name="qs_Fjol"/>
	<Quantum name="q_SigrunMisc_escape2"/>
	<Quantum name="q_MoveSigrunMisc"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_SigrunMisc_escape1"/>
	<Quantum name="qu_SigrunMisc_escape2"/>
	<Quantum name="qu_DansktHus"/>
	<Quantum name="qp_UtanDanskaHusid"/>
	<Quantum name="q_MoveSigrun1UtanHusid2UtanDanskaHusid2"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_ToUtanDanskaHusid"/>
	<Quantum name="q_CurrentUtanDanskaHusid"/>
    <Quantum name="q_EgErFrjals"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_Kubein" actor2="a_LausaFjolin" seq="s_UseKubeinOnLausaFjolin"/>

<Sequence name="s_TalkEscape">
	<Quantum name="q_EgErFrjals"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<CheckConditionQuantum name="q_CheckEscape78" flag="f_DHSec" wait="true">
	<Trigger value="0" seq="s_TalkEscape"/>
</CheckConditionQuantum>

<Sequence name="s_UseKubeinOnLausaFjolin1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunFjolin"/>
	<Quantum name="qp_SigrunMisc_escape2"/>
	<Quantum name="q_Sigrun_invisible"/>
	<Quantum name="q_MoveSigrunMisc4escape1"/>
	<Quantum name="q_SigrunMisc_escape2"/>
	<Quantum name="qu_SigrunMisc_escape2"/>
	<Quantum name="q_MoveSigrunMisc"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_DansktHus"/>
	<Quantum name="qp_UtanDanskaHusid"/>
	<Quantum name="q_MoveSigrun1UtanHusid2UtanDanskaHusid2"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_ToUtanDanskaHusid"/>
	<Quantum name="q_CheckEscape78"/>
	<Quantum name="q_StopSFX"/>
	<Quantum name="q_CurrentUtanDanskaHusid"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Fjol" seq="s_UseKubeinOnLausaFjolin1"/>

<Sequence name="s_UseKubeinOnLausaFjolin18">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrunPlayDead1"/>
	<Quantum name="q_WalkSigrunPlayDead2"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanDanskaHusid"/>
	<Quantum name="qp_DansktHus"/>
	<Quantum name="q_MoveSigrun2DanskaHusid82"/>
	<Quantum name="q_ToDansktHus"/>
    <Quantum name="q_CurrentDansktHus"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Fjol2" seq="s_UseKubeinOnLausaFjolin18"/>

<!-- Fjaran -->

<!-- Try to use Batur -->
<Sequence name="s_TakeBatur0">
	<Quantum name="qp_SigrunMisc_pushboat"/>
	<Quantum name="q_MoveSigrunMisc4pushboat"/>
	<Quantum name="q_Sigrun_invisible"/>
	<Quantum name="q_PlayBaturSekkur"/>
	<Quantum name="q_SigrunMisc_pushboat"/>
	<Quantum name="q_SigrunMisc_stop"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveSigrunMisc"/>
	<Quantum name="qu_SigrunMisc_pushboat"/>
	<Quantum name="q_Batur_sinking"/>
	<Quantum name="q_Batur_sunk"/>
	<Quantum name="q_MoveFlaska2Fjaran"/>
	<Quantum name="q_Flaska_marring"/>
	<Quantum name="qd_Flaska"/>
	<Quantum name="q_BaturinnErSokkinn"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_BaturTaken1"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Sequence name="s_TakeBatur1">
	<Quantum name="q_Take7"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<CheckConditionQuantum name="q_BaturTaken" flag="f_BaturTaken" wait="true">
	<Trigger value="0" seq="s_TakeBatur0"/>
	<Trigger value="1" seq="s_TakeBatur1"/> </CheckConditionQuantum>
<Sequence name="s_TakeBatur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunBatur"/>
	<Quantum name="q_BaturTaken"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Batur" seq="s_TakeBatur"/>

<!-- Take up Flaska -->
<Sequence name="s_TakeFlaska">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveFlaska2Inventory"/>
	<Quantum name="q_StopFlaska"/>
	<Quantum name="q_Flaska_taken"/>
	<Quantum name="q_MoveFloskuskeyti2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Flaska" seq="s_TakeFlaska"/>

<!-- Dekkid -->

<!-- Use Glerflaska on Las -->
<Sequence name="s_UseGlerflaskaOnLas">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunLas"/>
	<Quantum name="q_Sigrun_breakbottle"/>
	<Quantum name="q_PlayCrash"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveFloskuBrot2Dekkid"/>
	<Quantum name="q_MoveFloskuBrot22Dekkid"/>
	<Quantum name="q_LasinnErOskemmdur"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveGlerflaska"/>
	<Quantum name="q_StopSFX"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_Glerflaska" actor2="a_Las" seq="s_UseGlerflaskaOnLas"/>

<!-- Use Edalsteinn on Las -->
<Sequence name="s_UseEdalsteinnOnLas">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunLas"/>
	<Quantum name="qp_SigrunMisc_breaklock"/>
	<Quantum name="q_MoveSigrunMisc4breaklock"/>
	<Quantum name="q_Sigrun_invisible"/>
	<Quantum name="q_SigrunMisc_breaklock"/>
	<Quantum name="q_SigrunMisc_stop"/>
	<Quantum name="q_PlayCrash"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveSigrunMisc"/>
	<Quantum name="qu_SigrunMisc_breaklock"/>
	<Quantum name="q_MoveEdalsteinn"/>
	<Quantum name="q_MoveLas"/>
	<Quantum name="q_MoveBrotinnLas2Dekkid"/>
	<Quantum name="q_LasinnBrotnadi"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_LasBroken1"/>
	<Quantum name="q_MoveBrot12Inventory"/>
	<Quantum name="q_Brot1_taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_StopSFX"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_use" actor="a_Edalsteinn" actor2="a_Las" seq="s_UseEdalsteinnOnLas"/>

<!-- Use Brot1 on Glerflaska (or vice versa) -->
<Sequence name="s_UseBrot1OnGlerflaska">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_PlayCrash"/>
	<Quantum name="q_MoveGlerflaska"/>
	<Quantum name="q_MoveBrot12Inventory"/>
	<Quantum name="q_FloskuBrot_taken"/>
	<Quantum name="q_MoveFloskuBrot2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_FlaskanErBrotin"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Brot1" actor2="a_Glerflaska" seq="s_UseBrot1OnGlerflaska"/>
<Reaction reactor="action_use" actor="a_Glerflaska" actor2="a_Brot1" seq="s_UseBrot1OnGlerflaska"/>

<Sequence name="s_UseBrotSultaOnGlerflaska">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_PlayCrash"/>
	<Quantum name="q_MoveGlerflaska"/>
	<Quantum name="q_MoveBrotSulta2Inventory"/>
	<Quantum name="q_FloskuBrot_taken"/>
	<Quantum name="q_MoveFloskuBrot2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_FlaskanErBrotin"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Reaction reactor="action_use" actor="a_BrotSulta" actor2="a_Glerflaska" seq="s_UseBrotSultaOnGlerflaska"/>
<Reaction reactor="action_use" actor="a_Glerflaska" actor2="a_BrotSulta" seq="s_UseBrotSultaOnGlerflaska"/>

<Sequence name="s_UseEdalsteinnOnGlerflaska">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_PlayCrash"/>
	<Quantum name="q_MoveGlerflaska"/>
	<Quantum name="q_MoveEdalsteinn2Inventory"/>
	<Quantum name="q_FloskuBrot_taken"/>
	<Quantum name="q_MoveFloskuBrot2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_FlaskanErBrotin"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Edalsteinn" actor2="a_Glerflaska" seq="s_UseEdalsteinnOnGlerflaska"/>
<Reaction reactor="action_use" actor="a_Glerflaska" actor2="a_Edalsteinn" seq="s_UseEdalsteinnOnGlerflaska"/>

<Sequence name="s_OpenKista2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="qh_Lok"/>
    <Quantum name="qs_Lok2"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Lok" seq="s_OpenKista2"/>

<Sequence name="s_OpenKista3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="qh_Lok2"/>
    <Quantum name="qs_Lok"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Lok2" seq="s_OpenKista3"/>

<!-- Take up Edalsteinn -->
<Sequence name="s_TakeEdalsteinn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveEdalsteinn2Inventory"/>
	<Quantum name="q_Edalsteinn_taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Edalsteinn" seq="s_TakeEdalsteinn"/>

<!-- Take up Brot1 -->
<Sequence name="s_TakeBrot1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveBrot12Inventory"/>
	<Quantum name="q_Brot1_taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Brot1" seq="s_TakeBrot1"/>

<!-- Take up Glerflaska -->
<Sequence name="s_TakeGlerflaska">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveGlerflaska"/>
	<Quantum name="q_Glerflaska_taken"/>
	<Quantum name="q_MoveGlerflaska2Inventory"/>
	<Quantum name="q_GlerflaskaTaken1"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_Glerflaska" seq="s_TakeGlerflaska"/>

<!-- Take up FloskuBrot -->
<Sequence name="s_TakeFloskuBrot">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveFloskuBrot2Inventory"/>
	<Quantum name="q_FloskuBrot_taken"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_FloskuBrot" seq="s_TakeFloskuBrot"/>

<!-- Take up FloskuBrot -->
<Sequence name="s_TakeFloskuBrot2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_SkeraMig"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_FloskuBrot2" seq="s_TakeFloskuBrot2"/>

<!-- Kaetan -->

<!-- Use FloskuBrot on Halldora -->
<Sequence name="s_UseFloskuBrotOnHalldora">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveFloskuBrot2Inventory"/>
	<Quantum name="q_MoveTyrknesktReipi2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_WalkSigrunChange"/>
	<Quantum name="qp_SigrunMisc_change1"/>
	<Quantum name="qp_SigrunMisc_change2"/>
	<Quantum name="qp_SigrunMisc_change3"/>
	<Quantum name="qp_SigrunMisc_change4"/>
	<Quantum name="qp_SigrunMisc_change5"/>
	<Quantum name="qp_SigrunLosar"/>
	<Quantum name="q_EgSker"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Sigrun_invisible"/>
	<Quantum name="q_MoveSigrunMisc34"/>
	<Quantum name="q_SigrunMisc_Losar"/>
	<Quantum name="q_MoveSigrunMisc4change"/>
	<Quantum name="q_SigrunMisc_change1"/>
	<Quantum name="qh_Halldora"/>
	<Quantum name="q_SigrunMisc_change2"/>
	<Quantum name="q_SigrunMisc_change3"/>
	<Quantum name="q_SigrunMisc_change4"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_MoveHalldoraFreed"/>
	<Quantum name="q_SigrunMisc_change5"/>
	<Quantum name="q_MoveSigrunMisc"/>
	<Quantum name="q_SigrunMisc_stop"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_FlytaOkkur"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_MoveKaetan2DekkidOut"/>
	<Quantum name="q_WalkSigrunKaetanOutDown"/>
	<Quantum name="q_MoveKaetan2DekkidIn"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_SigrunMisc_change1"/>
	<Quantum name="qu_SigrunMisc_change2"/>
	<Quantum name="qu_SigrunMisc_change3"/>
	<Quantum name="qu_SigrunMisc_change4"/>
	<Quantum name="qu_SigrunMisc_change5"/>
	<Quantum name="qu_SigrunLosar"/>
	<Quantum name="qu_Kaetan"/>
	<Quantum name="qp_Fjaran"/>
	<Quantum name="q_MoveSigrunDekkid2Fjaran"/>
	<Quantum name="q_MoveHalldora2Fjaran"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_Ocean_play"/>
	<Quantum name="q_ToFjaran"/>
	<Quantum name="q_Fegin"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_Vona"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_TilBragds"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_JaEnHvar"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Felustadur"/>
	<Quantum name="q_Halldora_stop"/>
    <Quantum name="q_WalkHalldoraAwayFjaran"/>
    <Quantum name="q_MoveHalldora2Hellir"/>
    <Quantum name="qh_Dora"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_CurrentFjaran"/>
	<Quantum name="q_HalldoraSaved1"/>
	<Quantum name="q_MoveConvHalldora2Hellir"/>
	<Quantum name="qs_HversVegna"/>
	<Quantum name="qs_FannstThuMommu"/>
</Sequence>
<Reaction reactor="action_use" actor="a_FloskuBrot" actor2="a_Dora" seq="s_UseFloskuBrotOnHalldora"/>

<!-- UtanHelli -->

<!-- SteinnGame resolver -->
<Sequence name="s_SteinnGameResolved">
	<Quantum name="q_Sprunga_open"/>
	<Quantum name="q_Bingo"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<Sequence name="s_CloseFissure">
	<Quantum name="q_Sprunga_closed"/>
</Sequence>
<CheckConditionQuantum name="q_SteinnGame" flag="f_SteinnGame" wait="true">
	<Trigger value="6" seq="s_SteinnGameResolved"/>
	<Trigger value="5" seq="s_CloseFissure"/>
	<Trigger value="4" seq="s_CloseFissure"/>
	<Trigger value="3" seq="s_CloseFissure"/>
	<Trigger value="2" seq="s_CloseFissure"/>
	<Trigger value="1" seq="s_CloseFissure"/>
	<Trigger value="0" seq="s_CloseFissure"/>
</CheckConditionQuantum>

<!-- Take Steinn1 -->
<Sequence name="s_TakeSteinn1in">
	<Quantum name="q_Steinn1_center"/>
	<Quantum name="q_Midstodu"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_IncSteinnGame"/>
	<Quantum name="q_StateSteinn1=1"/>
	<Quantum name="q_SteinnGame"/>
</Sequence>
<Sequence name="s_TakeSteinn1center">
	<Quantum name="q_Steinn1_out"/>
	<Quantum name="q_SteinninnErDreginn"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_DecSteinnGame"/>
	<Quantum name="q_StateSteinn1=2"/>
	<Quantum name="q_SteinnGame"/>
</Sequence>
<Sequence name="s_TakeSteinn1out">
	<Quantum name="q_Steinn1_in"/>
	<Quantum name="q_LangtInni"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_StateSteinn1=0"/>
</Sequence>
<CheckConditionQuantum name="q_TakeSteinn1" flag="f_StateSteinn1" wait="true">
	<Trigger value="0" seq="s_TakeSteinn1in"/>
	<Trigger value="1" seq="s_TakeSteinn1center"/>
	<Trigger value="2" seq="s_TakeSteinn1out"/>
</CheckConditionQuantum>
<Sequence name="s_TakeSteinn1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSteinar"/>
	<Quantum name="q_TakeSteinn1"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Steinn1" seq="s_TakeSteinn1"/>

<!-- Take Steinn2 -->
<Sequence name="s_TakeSteinn2in">
	<Quantum name="q_Steinn2_center"/>
	<Quantum name="q_Midstodu"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_DecSteinnGame"/>
	<Quantum name="q_StateSteinn2=1"/>
	<Quantum name="q_SteinnGame"/>
</Sequence>
<Sequence name="s_TakeSteinn2center">
	<Quantum name="q_Steinn2_out"/>
	<Quantum name="q_SteinninnErDreginn"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_StateSteinn2=2"/>
</Sequence>
<Sequence name="s_TakeSteinn2out">
	<Quantum name="q_Steinn2_in"/>
	<Quantum name="q_LangtInni"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_IncSteinnGame"/>
	<Quantum name="q_StateSteinn2=0"/>
	<Quantum name="q_SteinnGame"/>
</Sequence>
<CheckConditionQuantum name="q_TakeSteinn2" flag="f_StateSteinn2" wait="true">
	<Trigger value="0" seq="s_TakeSteinn2in"/>
	<Trigger value="1" seq="s_TakeSteinn2center"/>
	<Trigger value="2" seq="s_TakeSteinn2out"/> </CheckConditionQuantum>
<Sequence name="s_TakeSteinn2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSteinar"/>
	<Quantum name="q_TakeSteinn2"/>
	<Quantum name="q_Taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Steinn2" seq="s_TakeSteinn2"/>

<!-- Take Steinn3 -->
<Sequence name="s_TakeSteinn3in">
	<Quantum name="q_Steinn3_center"/>
	<Quantum name="q_Midstodu"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_StateSteinn3=1"/> </Sequence>
<Sequence name="s_TakeSteinn3center">
	<Quantum name="q_Steinn3_out"/>
	<Quantum name="q_SteinninnErDreginn"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_IncSteinnGame"/>
	<Quantum name="q_StateSteinn3=2"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<Sequence name="s_TakeSteinn3out">
	<Quantum name="q_Steinn3_in"/>
	<Quantum name="q_LangtInni"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_DecSteinnGame"/>
	<Quantum name="q_StateSteinn3=0"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<CheckConditionQuantum name="q_TakeSteinn3" flag="f_StateSteinn3" wait="true">
	<Trigger value="0" seq="s_TakeSteinn3in"/>
	<Trigger value="1" seq="s_TakeSteinn3center"/>
	<Trigger value="2" seq="s_TakeSteinn3out"/> </CheckConditionQuantum>
<Sequence name="s_TakeSteinn3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSteinar"/>
	<Quantum name="q_TakeSteinn3"/>
	<Quantum name="q_Taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Steinn3" seq="s_TakeSteinn3"/>

<!-- Take Steinn4 -->
<Sequence name="s_TakeSteinn4in">
	<Quantum name="q_Steinn4_center"/>
	<Quantum name="q_Midstodu"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_DecSteinnGame"/>
	<Quantum name="q_StateSteinn4=1"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<Sequence name="s_TakeSteinn4center">
	<Quantum name="q_Steinn4_out"/>
	<Quantum name="q_SteinninnErDreginn"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_StateSteinn4=2"/> </Sequence>
<Sequence name="s_TakeSteinn4out">
	<Quantum name="q_Steinn4_in"/>
	<Quantum name="q_LangtInni"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_IncSteinnGame"/>
	<Quantum name="q_StateSteinn4=0"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<CheckConditionQuantum name="q_TakeSteinn4" flag="f_StateSteinn4" wait="true">
	<Trigger value="0" seq="s_TakeSteinn4in"/>
	<Trigger value="1" seq="s_TakeSteinn4center"/>
	<Trigger value="2" seq="s_TakeSteinn4out"/> </CheckConditionQuantum>
<Sequence name="s_TakeSteinn4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSteinar"/>
	<Quantum name="q_TakeSteinn4"/>
	<Quantum name="q_Taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Steinn4" seq="s_TakeSteinn4"/>

<!-- Take Steinn5 -->
<Sequence name="s_TakeSteinn5in">
	<Quantum name="q_Steinn5_center"/>
	<Quantum name="q_Midstodu"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_DecSteinnGame"/>
	<Quantum name="q_StateSteinn5=1"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<Sequence name="s_TakeSteinn5center">
	<Quantum name="q_Steinn5_out"/>
	<Quantum name="q_SteinninnErDreginn"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_StateSteinn5=2"/> </Sequence>
<Sequence name="s_TakeSteinn5out">
	<Quantum name="q_Steinn5_in"/>
	<Quantum name="q_LangtInni"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_IncSteinnGame"/>
	<Quantum name="q_StateSteinn5=0"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<CheckConditionQuantum name="q_TakeSteinn5" flag="f_StateSteinn5" wait="true">
	<Trigger value="0" seq="s_TakeSteinn5in"/>
	<Trigger value="1" seq="s_TakeSteinn5center"/>
	<Trigger value="2" seq="s_TakeSteinn5out"/> </CheckConditionQuantum>
<Sequence name="s_TakeSteinn5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSteinar"/>
	<Quantum name="q_TakeSteinn5"/>
	<Quantum name="q_Taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Steinn5" seq="s_TakeSteinn5"/>

<!-- Take Steinn6 -->
<Sequence name="s_TakeSteinn6in">
	<Quantum name="q_Steinn6_center"/>
	<Quantum name="q_Midstodu"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_StateSteinn6=1"/> </Sequence>
<Sequence name="s_TakeSteinn6center">
	<Quantum name="q_Steinn6_out"/>
	<Quantum name="q_SteinninnErDreginn"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_IncSteinnGame"/>
	<Quantum name="q_StateSteinn6=2"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<Sequence name="s_TakeSteinn6out">
	<Quantum name="q_Steinn6_in"/>
	<Quantum name="q_LangtInni"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_DecSteinnGame"/>
	<Quantum name="q_StateSteinn6=0"/>
	<Quantum name="q_SteinnGame"/> </Sequence>
<CheckConditionQuantum name="q_TakeSteinn6" flag="f_StateSteinn6" wait="true">
	<Trigger value="0" seq="s_TakeSteinn6in"/>
	<Trigger value="1" seq="s_TakeSteinn6center"/>
	<Trigger value="2" seq="s_TakeSteinn6out"/> </CheckConditionQuantum>
<Sequence name="s_TakeSteinn6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSteinar"/>
	<Quantum name="q_TakeSteinn6"/>
	<Quantum name="q_Taking"/> </Sequence>
<Reaction reactor="action_take" actor="a_Steinn6" seq="s_TakeSteinn6"/>

<!-- Go into Sprunga -->
<Sequence name="s_LookSprunga0">
    <Quantum name="q_Conversating"/>
    <Quantum name="q_KomduSaellSera"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_GudiSeLofAdThu"/>
	<Quantum name="q_Jon_stop"/>
	<Quantum name="q_Hund"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_ThuVerdurAdBjarga"/>
	<Quantum name="q_Jon_stop"/>
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkRunaHotspot"/>
</Sequence>
<Sequence name="s_LookSprunga1">
    <Quantum name="q_Conversating"/>
    <Quantum name="q_KomduSaellSera"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_GudiSeLof"/>
	<Quantum name="q_Jon_stop"/>
	<Quantum name="q_Fegnar"/>
	<Quantum name="q_Halldora_stop"/>
	<Quantum name="q_FelaYkkur"/>
	<Quantum name="q_Jon_stop"/>
	<Quantum name="q_Moving"/>
	<Quantum name="q_HalldoraSaved2"/>
</Sequence>
<Sequence name="s_LookSprunga3">
	<Quantum name="q_Moving"/>
</Sequence>
<CheckConditionQuantum name="q_HalldoraSaved" flag="f_HalldoraSaved" wait="true">
	<Trigger value="0" seq="s_LookSprunga0"/>
	<Trigger value="1" seq="s_LookSprunga1"/>
	<Trigger value="2" seq="s_LookSprunga3"/></CheckConditionQuantum>
<Sequence name="s_TakeSprunga">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunSprunga"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanHelli"/>
	<Quantum name="qp_Innihellir"/>
	<Quantum name="q_MoveSigrun2Innihellir"/>
	<Quantum name="q_ToInnihellir"/>
	<Quantum name="q_CurrentInnihellir"/>
    <Quantum name="q_WalkSigrunInnihellirIn"/>
	<Quantum name="q_HalldoraSaved"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Sprunga" seq="s_TakeSprunga"/>

<Sequence name="s_TalkUsual788">
    <Quantum name="q_Conversating"/>
	<Quantum name="q_FelaYkkur"/>
	<Quantum name="q_Jon_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Sequence name="s_NoTalkJohn">
    <Quantum name="q_SeraJonVirdist"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<CheckConditionQuantum name="q_CheckJohn798" flag="f_JohnDead" wait="true">
	<Trigger value="0" seq="s_TalkUsual788"/>
	<Trigger value="1" seq="s_NoTalkJohn"/>
</CheckConditionQuantum>
<Sequence name="s_TalkJon">
	<Quantum name="q_Freeze"/>
    <Quantum name="q_WalkSigrunInnihellirIn"/>
    <Quantum name="q_CheckJohn798"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Jon" seq="s_TalkJon"/>

<Sequence name="s_ShowSkeytiLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="qu_Inventory"/>
    <Quantum name="qp_SkeytiLarge"/>
	<Quantum name="qs_SkeytiLarge"/>
	<Quantum name="q_InnUtInnInnUt"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Floskuskeyti" seq="s_ShowSkeytiLarge"/>

<Sequence name="s_HideSkeytiLarge">
    <Quantum name="q_Freeze"/>
    <Quantum name="qu_SkeytiLarge"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="qp_Inventory"/>
	<Quantum name="qh_SkeytiLarge"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_SkeytiLarge" seq="s_HideSkeytiLarge"/>
<Reaction reactor="action_take" actor="a_SkeytiLarge" seq="s_HideSkeytiLarge"/>

<Sequence name="s_StunaPabbi">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_PabbiTalk"/>
    <Quantum name="q_PabbiStop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Pabbi" seq="s_StunaPabbi"/>
<Reaction reactor="action_take" actor="a_Pabbi" seq="s_StunaPabbi"/>

<Sequence name="s_RopeTalk">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrun2BundnirMenn1"/>
	<Quantum name="q_WalkSigrun2BundnirMenn2"/>
    <Quantum name="q_BundnirMenn_Talk"/>
    <Quantum name="q_BundnirMenn_Stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_BundnirMenn" seq="s_RopeTalk"/>

<Sequence name="s_StunaKalli1">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_Kalli1Talk"/>
    <Quantum name="q_Kalli1Stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Kalli1" seq="s_StunaKalli1"/>
<Reaction reactor="action_take" actor="a_Kalli1" seq="s_StunaKalli1"/>

<Sequence name="s_StunaPrestsfru">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_PrestsfruTalk"/>
    <Quantum name="q_PrestsfruStop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Prestsfru" seq="s_StunaPrestsfru"/>
<Reaction reactor="action_take" actor="a_Prestsfru" seq="s_StunaPrestsfru"/>

<Sequence name="s_StunaKalli2">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_Kalli2Talk"/>
    <Quantum name="q_Kalli2Stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_Kalli2" seq="s_StunaKalli2"/>
<Reaction reactor="action_take" actor="a_Kalli2" seq="s_StunaKalli2"/>

<Sequence name="s_Use2ReipiOnFeluKlettur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrun2Rock"/>
	<Quantum name="q_WalkHalldora2Rock1"/>
	<Quantum name="q_MjogSnjallt"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="qp_Klifur1"/>
    <Quantum name="qp_Klifur2"/>
	<Quantum name="qh_Sigrun"/>
	<Quantum name="qs_RunaClimber"/>
	<Quantum name="q_RunaClimb"/>
	<Quantum name="qh_RunaClimber"/>
	<Quantum name="qs_Snaeri"/>
	<Quantum name="q_WalkHalldora2Rock2"/>
	<Quantum name="qh_Halldora"/>
	<Quantum name="qs_DoraClimber"/>
	<Quantum name="qh_Snaeri"/>
	<Quantum name="q_DoraClimb"/>
	<Quantum name="qh_DoraClimber"/>
	<Quantum name="qs_Snaeri"/>
	<Quantum name="q_4sec"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qh_VeistThu"/>
	<Quantum name="q_Befala"/>
	<Quantum name="qh_Snaeri"/>
    <Quantum name="q_MoveJohnDead"/>
	<Quantum name="q_dead"/>
	<Quantum name="qh_Pabbi"/>
	<Quantum name="qh_Kalli1"/>
	<Quantum name="qh_Kalli2"/>
	<Quantum name="qh_Prestsfru"/>
	<Quantum name="qs_TimaSteinn"/>
    <Quantum name="qh_HversVegna"/>
    <Quantum name="q_JohnDead1"/>
    <Quantum name="qu_Klifur1"/>
    <Quantum name="qu_Klifur2"/>
    <Quantum name="q_MoveSigrun2Dead"/>
    <Quantum name="q_MoveHalldora2Dead"/>
    <Quantum name="q_ToInnihellir"/>
    <Quantum name="q_GudMinn"/>
    <Quantum name="q_Halldora_stop"/>
    <Quantum name="q_MikidErEgFegin"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_use" actor="a_2Reipi" actor2="a_Feluklettur" seq="s_Use2ReipiOnFeluKlettur"/>

<!-- Take up TimaSteinn -->
<Sequence name="s_TakeTimaSteinn">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_TimaSteinn_taken"/>
	<Quantum name="q_MoveTimaSteinn2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="action_take" actor="a_TimaSteinn" seq="s_TakeTimaSteinn"/>

<Sequence name="s_MakaTimastein">
	<Quantum name="q_Freeze"/>
    <Quantum name="qh_TimaSteinn"/>
    <Quantum name="q_MoveTimaSteinnSulta2Inventory"/>
    <Quantum name="q_MoveAskur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_AllurUtI"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_TimaSteinn" seq="s_MakaTimastein"/>

<Sequence name="s_MakaEdalstein">
	<Quantum name="q_Freeze"/>
    <Quantum name="qh_Brot1"/>
    <Quantum name="q_MoveBrotSulta2Inventory"/>
    <Quantum name="q_MoveAskur2Inventory"/>
	<Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Utatad"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_Brot1" seq="s_MakaEdalstein"/>

<ThemeFinishedQuantum name="q_Fin"/>

<Sequence name="s_FitYes">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="qh_BrotSulta"/>
    <Quantum name="qh_TimaSteinnSulta"/>
    <Quantum name="qh_Brot1"/>
    <Quantum name="qh_TimaSteinn"/>
	<Quantum name="q_UpdateInventory"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_Inventory"/>
	<Quantum name="q_CheckPrepare56b8"/>
	<Quantum name="q_FrabaertSteinarnir"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="qp_Sigrun1"/>
    <Quantum name="qp_Sigrun2"/>
    <Quantum name="qp_Sigrun3"/>
    <Quantum name="qp_Sigrun4"/>
    <Quantum name="qp_Sigrun5"/>
    <Quantum name="q_SigrunLimir"/>
    <Quantum name="q_SigrunStopLimir"/>
    <Quantum name="q_SigrunSteinMen"/>
    <Quantum name="q_SigrunStopStein"/>
    <Quantum name="q_PlayHverfur"/>
    <Quantum name="q_SigrunHverfur"/>
    <Quantum name="qh_Sigrun"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="q_StopSFX"/>
    <Quantum name="q_Adallag_stop"/>
    <Quantum name="q_Fin"/>
</Sequence>
<Reaction reactor="action_use" actor="a_BrotSulta" actor2="a_TimaSteinn" seq="s_FitYes"/>
<Reaction reactor="action_use" actor2="a_BrotSulta" actor="a_TimaSteinn" seq="s_FitYes"/>
<Reaction reactor="action_use" actor="a_BrotSulta" actor2="a_TimaSteinnSulta" seq="s_FitYes"/>
<Reaction reactor="action_use" actor2="a_BrotSulta" actor="a_TimaSteinnSulta" seq="s_FitYes"/>
<Reaction reactor="action_use" actor="a_Brot1" actor2="a_TimaSteinnSulta" seq="s_FitYes"/>
<Reaction reactor="action_use" actor2="a_Brot1" actor="a_TimaSteinnSulta" seq="s_FitYes"/>

<Sequence name="s_FitNo">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_Skritid"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MoveTimaSteinn2Inventory"/>
	<Quantum name="q_MoveBrot12Inventory"/>
    <Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Brot1" actor2="a_TimaSteinn" seq="s_FitNo"/>
<Reaction reactor="action_use" actor2="a_Brot1" actor="a_TimaSteinn" seq="s_FitNo"/>

<Sequence name="s_UseTReipiKlettur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_ReipidNaerEkki"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MoveTyrknesktReipi2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_TyrknesktReipi" actor2="a_Feluklettur" seq="s_UseTReipiKlettur"/>

<Sequence name="s_UseKadallKlettur">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_ReipidNaerEkki"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MoveKadall2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Kadall" actor2="a_Feluklettur" seq="s_UseKadallKlettur"/>

<Sequence name="s_TakeDHHurd0">
	<Quantum name="q_Hugarorku"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDHHurd1">
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_HurdinErLaest"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied6" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDHHurd0"/>
	<Trigger value="0" seq="s_TakeDHHurd1"/>
</CheckConditionQuantum>
<Sequence name="s_TakeDHHurd">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied6"/> </Sequence>
<Reaction reactor="action_take" actor="a_DHHurd1" seq="s_TakeDHHurd"/>

<Sequence name="s_TakeDH0">
	<Quantum name="q_Hugarorku"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH1">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize10"/>
    <Quantum name="q_RandomTake"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied86" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH0"/>
	<Trigger value="0" seq="s_TakeDH1"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied86"/>
</Sequence>
<Reaction reactor="action_take" actor="a_DHTunnur1" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_DHKista1" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_DHTunna2" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_DHGluggi1" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_DHGluggi2" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_DHGluggi3" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_LausaFjolin" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_DonskTunna" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_PokarOgFata" seq="s_UnDecided"/>
<Reaction reactor="action_take" actor="a_Strakur" seq="s_UnDecided"/>

<Sequence name="s_TakeDH10">
	<Quantum name="q_LookTied"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Looking"/> </Sequence>
<Sequence name="s_TakeDH11">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize5"/>
    <Quantum name="q_RandomLook"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied786" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH10"/>
	<Trigger value="0" seq="s_TakeDH11"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied786"/>
</Sequence>
<Reaction reactor="action_look" actor="a_DHTunnur1" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_DHKista1" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_DHTunna2" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_DHGluggi1" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_DHGluggi2" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_DHGluggi3" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_LausaFjolin" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_PokarOgFata" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_DonskTunna" seq="s_UnDecided2"/>
<Reaction reactor="action_look" actor="a_DHHurd1" seq="s_UnDecided2"/>

<Sequence name="s_TakeDH101">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Looking"/> </Sequence>
<Sequence name="s_TakeDH111">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize6"/>
    <Quantum name="q_RandomTalk"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied7786" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH101"/>
	<Trigger value="0" seq="s_TakeDH111"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided3">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied7786"/>
</Sequence>
<Reaction reactor="action_talk" actor="a_DHTunnur1" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_DHKista1" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_DHTunna2" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_DHGluggi1" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_DHGluggi2" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_DHGluggi3" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_LausaFjolin" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_Prik" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_PokarOgFata" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_DonskTunna" seq="s_UnDecided3"/>
<Reaction reactor="action_talk" actor="a_DHHurd1" seq="s_UnDecided3"/>

<Sequence name="s_TakeDH1018">
	<Quantum name="q_Hugarorku"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveBraud2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH1118">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize4"/>
    <Quantum name="q_RandomUse"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MoveBraud2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied77786" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH1018"/>
	<Trigger value="0" seq="s_TakeDH1118"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided4">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied77786"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DHTunnur1" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DHKista1" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DHTunna2" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DHGluggi1" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DHGluggi2" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DHGluggi3" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_LausaFjolin" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DHHurd1" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_Prik" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_PokarOgFata" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_DonskTunna" seq="s_UnDecided4"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_Strakur" seq="s_UnDecided4"/>

<Sequence name="s_TakeDH10108">
	<Quantum name="q_Hugarorku"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveAskur2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH11108">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize4"/>
    <Quantum name="q_RandomUse"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MoveAskur2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied777816" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH10108"/>
	<Trigger value="0" seq="s_TakeDH11108"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided11">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied777816"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DHTunnur1" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DHKista1" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DHTunna2" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DHGluggi1" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DHGluggi2" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DHGluggi3" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_LausaFjolin" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_Prik" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DHHurd1" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_DonskTunna" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_PokarOgFata" seq="s_UnDecided11"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_Strakur" seq="s_UnDecided11"/>

<Sequence name="s_TakeDH101008">
	<Quantum name="q_Hugarorku"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveSkeid2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH111008">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize4"/>
    <Quantum name="q_RandomUse"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MoveSkeid2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied7778716" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH101008"/>
	<Trigger value="0" seq="s_TakeDH111008"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided12">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied7778716"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DHTunnur1" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DHKista1" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DHTunna2" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DHGluggi1" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DHGluggi2" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DHGluggi3" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_LausaFjolin" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_Prik" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DHHurd1" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_DonskTunna" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_PokarOgFata" seq="s_UnDecided12"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_Strakur" seq="s_UnDecided12"/>

<Sequence name="s_UnDecided5">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Talk2"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Mamma" seq="s_UnDecided5"/>
<Reaction reactor="action_take" actor="a_Jon" seq="s_UnDecided5"/>
<Reaction reactor="action_take" actor="a_Prestsfru" seq="s_UnDecided5"/>
<Reaction reactor="action_take" actor="a_Halldora" seq="s_UnDecided5"/>


<Sequence name="s_TakeDH10180">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH11180">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Talk4"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied777786" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH10180"/>
	<Trigger value="0" seq="s_TakeDH11180"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided6">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied777786"/>
</Sequence>

<Sequence name="s_TakeDH101803">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveBraud2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH111803">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MadurLifir"/>
    <Quantum name="q_MoveBraud2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied7377786" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH101803"/>
	<Trigger value="0" seq="s_TakeDH111803"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided7">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied7377786"/>
</Sequence>

<Sequence name="s_TakeDH4101803">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveSkeid2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH4111803">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MadurLifir"/>
    <Quantum name="q_MoveSkeid2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied47377786" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH4101803"/>
	<Trigger value="0" seq="s_TakeDH4111803"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided8">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied47377786"/>
</Sequence>
<Reaction reactor="action_take" actor="a_Sigrun" seq="s_randomTake"/>
<Reaction reactor="action_look" actor="a_Sigrun" seq="s_UnDecided6"/>
<Reaction reactor="action_talk" actor="a_Sigrun" seq="s_UnDecided6"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_Sigrun" seq="s_UnDecided7"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_Sigrun" seq="s_UnDecided8"/>

<Sequence name="s_TakeDH41018039">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveBraud2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_TakeDH41118039">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize4"/>
    <Quantum name="q_RandomUse"/>
    <Quantum name="q_MoveBraud2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTied473777869" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_TakeDH41018039"/>
	<Trigger value="0" seq="s_TakeDH41118039"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided17">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTied473777869"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_Skeid" seq="s_UnDecided17"/>
<Reaction reactor="action_use" actor="a_Braud" actor2="a_Askur" seq="s_UnDecided17"/>

<Sequence name="s_Takeg67">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveAskur2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_Takeg77">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize4"/>
    <Quantum name="q_RandomUse"/>
    <Quantum name="q_MoveAskur2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTiedy7" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Takeg67"/>
	<Trigger value="0" seq="s_Takeg77"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided18">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTiedy7"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_Skeid" seq="s_UnDecided18"/>
<Reaction reactor="action_use" actor="a_Askur" actor2="a_Braud" seq="s_UnDecided18"/>

<Sequence name="s_Takeg676">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
    <Quantum name="q_MoveSkeid2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_Takeg776">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Randomize4"/>
    <Quantum name="q_RandomUse"/>
    <Quantum name="q_MoveSkeid2Inventory"/>
    <Quantum name="q_UpdateInventory"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTiedy77" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Takeg676"/>
	<Trigger value="0" seq="s_Takeg776"/>
</CheckConditionQuantum>
<Sequence name="s_UnDecided19">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTiedy77"/>
</Sequence>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_Askur" seq="s_UnDecided19"/>
<Reaction reactor="action_use" actor="a_Skeid" actor2="a_Braud" seq="s_UnDecided19"/>

<Sequence name="s_Takeg676o">
	<Quantum name="q_PrikTied3"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_Takeg776o">
	<Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Prik"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTiedy767" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Takeg676o"/>
	<Trigger value="0" seq="s_Takeg776o"/>
</CheckConditionQuantum>
<Sequence name="s_LookPrik667">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTiedy767"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Prik" seq="s_LookPrik667"/>

<Sequence name="s_Takeg676o9">
	<Quantum name="q_StrakurTied"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_Takeg776o9">
    <Quantum name="q_StoppSigrun"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_EgKannast"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTiedy767oo" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Takeg676o9"/>
	<Trigger value="0" seq="s_Takeg776o9"/>
</CheckConditionQuantum>
<Sequence name="s_LookStrakur">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTiedy767oo"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Strakur" seq="s_LookStrakur"/>

<Sequence name="s_Takeg676o97">
	<Quantum name="q_TalkTied3"/>
    <Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_Taking"/> </Sequence>
<Sequence name="s_Takeg776o97">
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_ErtThuVissUm"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Taking"/> </Sequence>
<CheckConditionQuantum name="q_SigrunTiedy767oo8" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Takeg676o97"/>
	<Trigger value="0" seq="s_Takeg776o97"/>
</CheckConditionQuantum>
<Sequence name="s_LookSigrun">
    <Quantum name="q_Freeze"/>
	<Quantum name="q_SigrunTiedy767oo8"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Sigrun" seq="s_LookSigrun"/>
<Reaction reactor="action_take" actor="a_Sigrun" seq="s_randomTake"/>
<Reaction reactor="action_talk" actor="a_Sigrun" seq="s_LookSigrun"/>

<!-- Hotspot between Kot and UtanHusid -->
<Sequence name="s_Kot2UtanHusid">
	<Quantum name="q_MoveOpinHurd2Kot"/>
	<Quantum name="q_WalkSigrunKotHurd2"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Kot"/>
	<Quantum name="qp_UtanHusid"/>
	<Quantum name="q_MoveSigrun1Kot2UtanHusid"/>
	<Quantum name="q_CurrentUtanHusid"/>
	<Quantum name="q_MoveOpinHurd"/>
	<Quantum name="q_ToUtanHusid"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Sequence name="s_Action">
	<Quantum name="q_MoveOpinHurd2Kot"/>
	<Quantum name="q_WalkSigrunKotHurd2"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Kot"/>
	<Quantum name="qp_UtanHusid"/>
	<Quantum name="q_MoveSigrun1Kot2UtanHusid"/>
	<Quantum name="q_CurrentUtanHusid"/>
	<Quantum name="q_MoveOpinHurd"/>
	<Quantum name="q_ToUtanHusid"/>
	<Quantum name="q_WalkTyrki1Robbed"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="q_PlayHandteknar"/>
	<Quantum name="qu_UtanHusid"/>
	<Quantum name="qp_DansktHus"/>
	<Quantum name="q_Tyrki1Stop"/>
	<Quantum name="q_MoveSigrun1UtanHusid2DansktHus"/>
	<Quantum name="q_Halldora_tied"/>
	<Quantum name="q_MoveHalldora2Kaetan"/>
	<Quantum name="q_MoveMamma"/>
	<Quantum name="q_Sigrun_tied"/>
	<Quantum name="q_SigrunTied1"/>
	<Quantum name="q_ToDansktHus"/>
	<Quantum name="q_MoveTyrki1"/>
	<Quantum name="q_MoveBundnirMenn2UtanHusid"/>
	<Quantum name="q_CurrentDansktHus"/>
	<Quantum name="q_Taking"/>
	<Quantum name="q_AskurInc"/>
	<Quantum name="q_StopSFX"/>
</Sequence>
<Sequence name="s_MammaBannar">
	<Quantum name="q_TaktuEitthvad"/>
	<Quantum name="q_Mamma_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Sequence name="s_MammaBannar2">
	<Quantum name="q_HvertThykistThu"/>
	<Quantum name="q_Mamma_stop"/>
	<Quantum name="q_Moving"/>
</Sequence>
<CheckConditionQuantum name="q_AskurTaken" flag="f_AskurTaken" wait="true">
	<Trigger value="0" seq="s_MammaBannar2"/>
	<Trigger value="1" seq="s_MammaBannar2"/>
	<Trigger value="2" seq="s_MammaBannar"/>
	<Trigger value="3" seq="s_Action"/>
	<Trigger value="4" seq="s_Kot2UtanHusid"/>
</CheckConditionQuantum>
<Sequence name="s_TakeKotHurd">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_WalkSigrunKotHurd1"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_AskurTaken"/>
</Sequence>
<Reaction reactor="action_take" actor="a_KotHurd" seq="s_TakeKotHurd"/>

<!-- Hotspot between UtanHusid and Kot -->
<Sequence name="s_UtanHusid2Kot">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrunUtiHurd"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanHusid"/>
	<Quantum name="qp_Kot"/>
	<Quantum name="q_MoveSigrun1UtanHusid2Kot"/>
	<Quantum name="q_ToKot"/>
	<Quantum name="q_CurrentKot"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_UtiHurd" seq="s_UtanHusid2Kot"/>

<!-- Hotspot between UtanHusid and UtanHelli -->
<Sequence name="s_UtanHusid2UtanHelli">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveUtanHusid2UtanHelliOut"/>
	<Quantum name="q_WalkSigrunUtanHusidOutLeft"/>
	<Quantum name="q_MoveUtanHusid2UtanHelliIn"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanHusid"/>
	<Quantum name="qp_UtanHelli"/>
	<Quantum name="q_ToUtanHelli"/>
	<Quantum name="q_CurrentUtanHelli"/>
	<Quantum name="q_MoveUtanHelli2UtanHusidOut"/>
	<Quantum name="q_MoveSigrun1UtanHusid2UtanHelli"/>
	<Quantum name="q_WalkSigrunUtanHelliInLeft"/>
	<Quantum name="q_MoveUtanHelli2UtanHusidIn"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_UtanHusid2UtanHelli" actor="a_Sigrun" seq="s_UtanHusid2UtanHelli"/>

<!-- Hotspot between UtanHusid and UtanDanskaHusid -->
<Sequence name="s_UtanHusid2UtanDanskaHusid">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveUtanHusid2UtanDanskaHusidOut"/>
	<Quantum name="q_WalkSigrunUtanHusidOutRight"/>
	<Quantum name="q_MoveUtanHusid2UtanDanskaHusidIn"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanHusid"/>
	<Quantum name="qp_UtanDanskaHusid"/>
	<Quantum name="q_MoveUtanDanskaHusid2UtanHusidOut"/>
	<Quantum name="q_MoveSigrun1UtanHusid2UtanDanskaHusid"/>
	<Quantum name="q_ToUtanDanskaHusid"/>
	<Quantum name="q_CurrentUtanDanskaHusid"/>
	<Quantum name="q_WalkSigrunUtanDanskaHusidInRight"/>
	<Quantum name="q_MoveUtanDanskaHusid2UtanHusidIn"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_UtanHusid2UtanDanskaHusid" actor="a_Sigrun" seq="s_UtanHusid2UtanDanskaHusid"/>

<!-- Hotspot between UtanDanskaHusid and UtanHusid -->
<Sequence name="s_UtanDanskaHusid2UtanHusid1">
    <Quantum name="q_MoveUtanDanskaHusid2UtanHusidOut"/>
    <Quantum name="q_WalkSigrunUtanDanskaHusidOutRight"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanDanskaHusid"/>
	<Quantum name="qp_UtanHusid"/>
    <Quantum name="q_MoveUtanDanskaHusid2UtanHusidIn"/>
	<Quantum name="q_MoveUtanHusid2UtanDanskaHusidOut"/>
	<Quantum name="q_MoveSigrun1UtanDanskaHusid2UtanHusid"/>
	<Quantum name="q_ToUtanHusid"/>
	<Quantum name="q_CurrentUtanHusid"/>
	<Quantum name="q_WalkSigrunUtanHusidInRight"/>
	<Quantum name="q_MoveUtanHusid2UtanDanskaHusidIn"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Sequence name="s_Imprison">
	<Quantum name="qs_Tyrki3"/>
	<Quantum name="q_WalkTyrki3"/>
	<Quantum name="q_WalkTyrki32"/>
	<Quantum name="q_ToBlack"/>
    <Quantum name="q_PlaySigrunHandtekin"/>
	<Quantum name="qu_UtanDanskaHusid"/>
	<Quantum name="qp_DansktHus"/>
	<Quantum name="q_MoveSigrun1UtanHusid2DansktHus"/>
	<Quantum name="q_ToDansktHus"/>
	<Quantum name="q_CurrentDansktHus"/>
    <Quantum name="q_ThessiHund"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="qh_Tyrki3"/>
	<Quantum name="q_Moving"/>
</Sequence>
<CheckConditionQuantum name="q_PlayDeada" flag="f_PlayDead">
	<Trigger value="0" seq="s_Imprison"/>
	<Trigger value="1" seq="s_UtanDanskaHusid2UtanHusid1"/>
</CheckConditionQuantum>
<Sequence name="s_UtanDanskaHusid2UtanHusid">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_PlayDeada"/> </Sequence>
<Reaction reactor="ac_UtanDanskaHusid2UtanHusid" actor="a_Sigrun" seq="s_UtanDanskaHusid2UtanHusid"/>

<!-- Hotspot between UtanDanskaHusid and Fjaran -->
<Sequence name="s_UtanDanskaHusid2Fjaran1">
	<Quantum name="q_MoveUtanDanskaHusid2FjaranOut"/>
	<Quantum name="q_WalkSigrunUtanDanskaHusidOutLeft"/>
	<Quantum name="q_MoveUtanDanskaHusid2FjaranIn"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanDanskaHusid"/>
	<Quantum name="qp_Fjaran"/>
	<Quantum name="q_MoveFjaran2UtanDanskaHusidOut"/>
	<Quantum name="q_MoveSigrun1UtanDanskaHusid2Fjaran"/>
	<Quantum name="q_ToFjaran"/>
	<Quantum name="q_Ocean_play"/>
	<Quantum name="q_CurrentFjaran"/>
	<Quantum name="q_WalkSigrunFjaranInRight"/>
	<Quantum name="q_MoveFjaran2UtanDanskaHusidIn"/>
	<Quantum name="q_Moving"/> </Sequence>
<CheckConditionQuantum name="q_PlayDeadb" flag="f_PlayDead">
	<Trigger value="0" seq="s_Imprison"/>
	<Trigger value="1" seq="s_UtanDanskaHusid2Fjaran1"/>
</CheckConditionQuantum>
<Sequence name="s_UtanDanskaHusid2Fjaran">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_PlayDeadb"/> </Sequence>
<Reaction reactor="ac_UtanDanskaHusid2Fjaran" actor="a_Sigrun" seq="s_UtanDanskaHusid2Fjaran"/>

<!-- Hotspot between Fjaran and UtanDanskaHusid -->
<Sequence name="s_Fjaran2UtanDanskaHusid">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveFjaran2UtanDanskaHusidOut"/>
	<Quantum name="q_WalkSigrunFjaranOutRight"/>
	<Quantum name="q_MoveFjaran2UtanDanskaHusidIn"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_Ocean_stop"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Fjaran"/>
	<Quantum name="qp_UtanDanskaHusid"/>
	<Quantum name="q_MoveUtanDanskaHusid2FjaranOut"/>
	<Quantum name="q_MoveSigrun1Fjaran2UtanDanskaHusid"/>
	<Quantum name="q_ToUtanDanskaHusid"/>
	<Quantum name="q_CurrentUtanDanskaHusid"/>
	<Quantum name="q_WalkSigrunUtanDanskaHusidInLeft"/>
	<Quantum name="q_MoveUtanDanskaHusid2FjaranIn"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_Fjaran2UtanDanskaHusid" actor="a_Sigrun" seq="s_Fjaran2UtanDanskaHusid"/>

<!-- Hotspot between Fjaran and UtanHelli -->
<Sequence name="s_Fjaran2UtanHelli1">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveFjaran2UtanHelli1Out"/>
	<Quantum name="q_WalkSigrunFjaranOutDownLeft"/>
	<Quantum name="q_MoveFjaran2UtanHelli1In"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_Ocean_stop"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Fjaran"/>
	<Quantum name="qp_UtanHelli"/>
	<Quantum name="q_MoveUtanHelli2FjaranOut"/>
	<Quantum name="q_MoveSigrun1Fjaran2UtanHelli"/>
	<Quantum name="q_ToUtanHelli"/>
	<Quantum name="q_CurrentUtanHelli"/>
	<Quantum name="q_WalkSigrunUtanHelliInRight"/>
	<Quantum name="q_MoveUtanHelli2FjaranIn"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_Fjaran2UtanHelli1" actor="a_Sigrun" seq="s_Fjaran2UtanHelli1"/>

<Sequence name="s_Fjaran2UtanHelli2">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveFjaran2UtanHelli2Out"/>
	<Quantum name="q_WalkSigrunFjaranOutDownRight"/>
	<Quantum name="q_MoveFjaran2UtanHelli2In"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_Ocean_stop"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Fjaran"/>
	<Quantum name="qp_UtanHelli"/>
	<Quantum name="q_MoveUtanHelli2FjaranOut"/>
	<Quantum name="q_MoveSigrun1Fjaran2UtanHelli"/>
	<Quantum name="q_ToUtanHelli"/>
	<Quantum name="q_CurrentUtanHelli"/>
	<Quantum name="q_WalkSigrunUtanHelliInRight"/>
	<Quantum name="q_MoveUtanHelli2FjaranIn"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_Fjaran2UtanHelli2" actor="a_Sigrun" seq="s_Fjaran2UtanHelli2"/>

<!-- Hotspot between UtanHelli and UtanHusid -->
<Sequence name="s_UtanHelli2UtanHusid">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveUtanHelli2UtanHusidOut"/>
	<Quantum name="q_WalkSigrunUtanHelliOutLeft"/>
	<Quantum name="q_MoveUtanHelli2UtanHusidIn"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanHelli"/>
	<Quantum name="qp_UtanHusid"/>
	<Quantum name="q_MoveUtanHusid2UtanHelliOut"/>
	<Quantum name="q_MoveSigrun1UtanHelli2UtanHusid"/>
	<Quantum name="q_ToUtanHusid"/>
	<Quantum name="q_CurrentUtanHusid"/>
	<Quantum name="q_WalkSigrunUtanHusidInLeft"/>
	<Quantum name="q_MoveUtanHusid2UtanHelliIn"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_UtanHelli2UtanHusid" actor="a_Sigrun" seq="s_UtanHelli2UtanHusid"/>

<!-- Hotspot between UtanHelli and Fjaran -->
<Sequence name="s_UtanHelli2Fjaran">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_MoveUtanHelli2FjaranOut"/>
	<Quantum name="q_WalkSigrunUtanHelliOutRight"/>
	<Quantum name="q_MoveUtanHelli2FjaranIn"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_UtanHelli"/>
	<Quantum name="qp_Fjaran"/>
	<Quantum name="q_MoveFjaran2UtanHelli2Out"/>
	<Quantum name="q_MoveSigrun1UtanHelli2Fjaran"/>
	<Quantum name="q_ToFjaran"/>
	<Quantum name="q_CurrentFjaran"/>
	<Quantum name="q_Ocean_play"/>
	<Quantum name="q_WalkSigrunFjaranInDown"/>
	<Quantum name="q_MoveFjaran2UtanHelli2In"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_UtanHelli2Fjaran" actor="a_Sigrun" seq="s_UtanHelli2Fjaran"/>

<!-- Hotspot between Dekkid and Fjaran -->
<Sequence name="s_Dekkid2Fjaran">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Dekkid"/>
	<Quantum name="qp_Fjaran"/>
	<Quantum name="q_MoveSigrunDekkid2Fjaran"/>
	<Quantum name="q_ToFjaran"/>
	<Quantum name="q_CurrentFjaran"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_Dekkid2Fjaran" actor="a_Sigrun" seq="s_Dekkid2Fjaran"/>

<!-- Hotspot between Dekkid and Kaetan -->
<Sequence name="s_Dekkid2Kaetan0">
	<Quantum name="q_HurdinErLaest"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<Sequence name="s_FagnadarFundir">
	<Quantum name="q_FinnaHalldoru"/>
    <Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_KaetaFirst1"/>
</Sequence>
<CheckConditionQuantum name="q_KaetaFirst" flag="f_KaetaFirst" wait="true">
	<Trigger value="0" seq="s_FagnadarFundir"/> </CheckConditionQuantum>
<Sequence name="s_Dekkid2Kaetan1">
	<Quantum name="q_StopSigrun"/>
	<Quantum name="q_Ocean_stop"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Dekkid"/>
	<Quantum name="qp_Kaetan"/>
	<Quantum name="q_MoveKaetan2DekkidOut"/>
	<Quantum name="q_MoveSigrun1Dekkid2Kaetan"/>
	<Quantum name="q_ToKaetan"/>
	<Quantum name="q_WalkSigrunKaetanInDown"/>
	<Quantum name="q_MoveKaetan2DekkidIn"/>
	<Quantum name="q_CurrentKaetan"/>
	<Quantum name="q_KaetaFirst"/>
	</Sequence>
<CheckConditionQuantum name="q_LasBroken" flag="f_LasBroken" wait="true">
	<Trigger value="0" seq="s_Dekkid2Kaetan0"/>
	<Trigger value="1" seq="s_Dekkid2Kaetan1"/> </CheckConditionQuantum>
<Sequence name="s_Dekkid2Kaetan">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_WalkSigrunLas"/>
	<Quantum name="q_LasBroken"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="action_take" actor="a_KaetuHurd" seq="s_Dekkid2Kaetan"/>

<!-- Hotspot between Kaetan and Dekkid -->
<Sequence name="s_Kaetan2Dekkid">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_MoveKaetan2DekkidOut"/>
	<Quantum name="q_WalkSigrunKaetanOutDown"/>
	<Quantum name="q_MoveKaetan2DekkidIn"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Kaetan"/>
	<Quantum name="qp_Dekkid"/>
	<Quantum name="q_MoveSigrun1Kaetan2Dekkid"/>
	<Quantum name="q_ToDekkid"/>
	<Quantum name="q_CurrentDekkid"/>
	<Quantum name="q_Ocean_play"/>
	<Quantum name="q_Moving"/> </Sequence>
<Reaction reactor="ac_Kaetan2Dekkid" actor="a_Sigrun" seq="s_Kaetan2Dekkid"/>

<!-- Hotspot between Inniellir and UtanHelli -->

<Sequence name="s_Innihellir2UtanHelli">
	<Quantum name="q_Freeze"/>
	<Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_ToBlack"/>
	<Quantum name="qu_Innihellir"/>
	<Quantum name="qp_UtanHelli"/>
	<Quantum name="q_MoveSigrun2UtanHelliFromInniHelli"/>
	<Quantum name="q_ToUtanHelli"/>
	<Quantum name="q_CurrentUtanHelli"/>
	<Quantum name="q_Moving"/>
</Sequence>
<Reaction reactor="ac_Innihellir2UtanHelli" actor="a_Sigrun" seq="s_Innihellir2UtanHelli"/>

<Sequence name="s_LookPudar">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_VaFlottirPudar"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_KPudar1" seq="s_LookPudar"/>

<Sequence name="s_LookGlerflaska">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_FlaskanErTom"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Glerflaska" seq="s_LookGlerflaska"/>

<Sequence name="s_LookBatur2">
    <Quantum name="q_TrausturBatur"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<Sequence name="s_LookBatur3">
    <Quantum name="q_BaturinnErSokkinn"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<CheckConditionQuantum name="q_CheckBoat" flag="f_BaturTaken">
	<Trigger value="0" seq="s_LookBatur2"/>
	<Trigger value="1" seq="s_LookBatur3"/>
</CheckConditionQuantum>
<Sequence name="s_LookBatur">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_CheckBoat"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Batur" seq="s_LookBatur"/>

<Sequence name="s_LookKubein">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_GlaesilegtKubein"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Kubein" seq="s_LookKubein"/>

<Sequence name="s_LookHalldora">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_ThettaErHun"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Halldora" seq="s_LookHalldora"/>
<Reaction reactor="action_look" actor="a_Dora" seq="s_LookHalldora"/>

<Sequence name="s_LookTunna2">
    <Quantum name="q_TunnanErFull"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Sequence name="s_LookTunna3">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_TunnanErGaltom"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<CheckConditionQuantum name="q_CheckTunna" flag="f_TappiTaken">
	<Trigger value="0" seq="s_LookTunna2"/>
	<Trigger value="1" seq="s_LookTunna3"/>
</CheckConditionQuantum>
<Sequence name="s_LookTunna">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_CheckTunna"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Tunna" seq="s_LookTunna"/>
<Reaction reactor="action_look" actor="a_TunnaMedTappa" seq="s_LookTunna3"/>

<Sequence name="s_LookTappi">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Korktappi"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Tappi" seq="s_LookTappi"/>

<Sequence name="s_LookPrestsfru">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Prestsfruin"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Prestsfru" seq="s_LookPrestsfru"/>

<Sequence name="s_LookMamma">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_MammaLitur"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Mamma" seq="s_LookMamma"/>

<Sequence name="s_Ligga23b">
    <Quantum name="q_ThettaErAskurinn"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>

<Sequence name="s_Ligga23bTied">
    <Quantum name="q_ThettaErAskurinn23"/>
    <Quantum name="q_Sigrun_tied"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForAsk77" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Ligga23bTied"/>
	<Trigger value="0" seq="s_Ligga23b"/>
</CheckConditionQuantum>

<Sequence name="s_LookAskur">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
    <Quantum name="q_CheckForStopSigrun"/>
    <Quantum name="q_CheckForAsk77"/>
    <Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Askur" seq="s_LookAskur"/>

<Sequence name="s_Ligga23">
    <Quantum name="q_MadurLifir"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>

<Sequence name="s_Ligga23Tied">
    <Quantum name="q_MadurLifir23"/>
    <Quantum name="q_Sigrun_tied"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForBread77" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Ligga23Tied"/>
	<Trigger value="0" seq="s_Ligga23"/>
</CheckConditionQuantum>

<Sequence name="s_LookBraud">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
    <Quantum name="q_CheckForStopSigrun"/>
    <Quantum name="q_CheckForBread77"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Braud" seq="s_LookBraud"/>

<Sequence name="s_LookTyrknesktReipi">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_ReipidSemHalldora"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_TyrknesktReipi" seq="s_LookTyrknesktReipi"/>

<Sequence name="s_LookTimaSteinnSulta">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_AllurUtI"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_TimaSteinnSulta" seq="s_LookTimaSteinnSulta"/>

<Sequence name="s_LookTimaSteinn">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_SeraJonHlytur"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_TimaSteinn" seq="s_LookTimaSteinn"/>

<Sequence name="s_LookEdalsteinnSulta">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Utatad"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_BrotSulta" seq="s_LookEdalsteinnSulta"/>

<Sequence name="s_Look2Reipi">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_LangtReipi"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_2Reipi" seq="s_Look2Reipi"/>

<Sequence name="s_LookFloskubrot">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Floskubrot"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_FloskuBrot2" seq="s_LookFloskubrot"/>
<Reaction reactor="action_look" actor="a_FloskuBrot" seq="s_LookFloskubrot"/>

<Sequence name="s_LookEdalsteinn">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_EdalsteinnFraUtlondum"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Edalsteinn" seq="s_LookEdalsteinn"/>

<Sequence name="s_LookFlaska">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_ThessiFlaska"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Flaska" seq="s_LookFlaska"/>

<Sequence name="s_LookPrikOgReipi">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_ThettaErPrik"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_PrikOgReipi" seq="s_LookPrikOgReipi"/>

<Sequence name="s_LookDansktReipi">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_ThettaErReipid"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_DansktReipi" seq="s_LookDansktReipi"/>

<Sequence name="s_Ligga2334">
    <Quantum name="q_Skeid"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>

<Sequence name="s_Ligga2334Tied">
    <Quantum name="q_Skeid23"/>
    <Quantum name="q_Sigrun_tied"/>
</Sequence>

<CheckConditionQuantum name="q_CheckForSpoon77" flag="f_SigrunTied" wait="true">
	<Trigger value="1" seq="s_Ligga2334Tied"/>
	<Trigger value="0" seq="s_Ligga2334"/>
</CheckConditionQuantum>

<Sequence name="s_LookSkeid">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
    <Quantum name="q_CheckForStopSigrun"/>
    <Quantum name="q_CheckForSpoon77"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Skeid" seq="s_LookSkeid"/>

<Sequence name="s_LookJon2">
    <Quantum name="q_ThettaErSera"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<Sequence name="s_LookJon3">
    <Quantum name="q_AumingjaSera"/>
    <Quantum name="q_Sigrun_stop"/>
</Sequence>
<CheckConditionQuantum name="q_CheckJon" flag="f_JohnDead" wait="true">
	<Trigger value="0" seq="s_LookJon2"/>
	<Trigger value="1" seq="s_LookJon3"/>
</CheckConditionQuantum>
<Sequence name="s_LookJon">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_CheckJon"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Jon" seq="s_LookJon"/>

<Sequence name="s_LookPabbi">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_SkelfinguLostid"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Pabbi" seq="s_LookPabbi"/>
<Reaction reactor="action_look" actor="a_Kalli2" seq="s_LookPabbi"/>
<Reaction reactor="action_look" actor="a_Kalli1" seq="s_LookPabbi"/>

<Sequence name="s_LookBrot1">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_SvipurHjaSjon"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Brot1" seq="s_LookBrot1"/>

<Sequence name="s_LookKadall">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Snaerid"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Kadall" seq="s_LookKadall"/>

<Sequence name="s_LookSteinn7">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_HverAetli"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_Steinn1" seq="s_LookSteinn7"/>
<Reaction reactor="action_look" actor="a_Steinn6" seq="s_LookSteinn7"/>
<Reaction reactor="action_look" actor="a_Steinn5" seq="s_LookSteinn7"/>
<Reaction reactor="action_look" actor="a_Steinn4" seq="s_LookSteinn7"/>
<Reaction reactor="action_look" actor="a_Steinn3" seq="s_LookSteinn7"/>
<Reaction reactor="action_look" actor="a_Steinn2" seq="s_LookSteinn7"/>

<Sequence name="s_LookFSkip1">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_SkipTyrkjanna"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_FSkip1" seq="s_LookFSkip1"/>

<Sequence name="s_LookBundnirMenn">
    <Quantum name="q_Freeze"/>
    <Quantum name="q_StoppSigrun"/>
	<Quantum name="q_Sigrun_stop"/>
    <Quantum name="q_Vesalings"/>
    <Quantum name="q_Sigrun_stop"/>
	<Quantum name="q_Looking"/>
</Sequence>
<Reaction reactor="action_look" actor="a_BundnirMenn" seq="s_LookBundnirMenn"/>

<UseText listener="sc" actor="a_Askur" actor2="a_Sigrun" text="Maka sultu úr asknum á Sigrúnu"/>

<UseText actor="a_FloskuBrot" actor2="a_Kalli1" listener="sc" text="Pota í gamla manninn með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_Kalli2" listener="sc" text="Ýta í gamla manninn með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_Pabbi" listener="sc" text="Pota í hrædda manninn með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_Jon" listener="sc" text="Pota í séra Jón með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_Prestsfru" listener="sc" text="Pota í prestsfrúna með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_Halldora" listener="sc" text="Pota í Halldóru með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_Dora" listener="sc" text="Skera á böndin"/>
<UseText actor="a_FloskuBrot" actor2="a_Strakur" listener="sc" text="Pota í strákinn með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_KonaMadurDaud" listener="sc" text="Pota í óheppna strákinn með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_StrakurDaudur" listener="sc" text="Pota í óheppna fólkið með glerbrotinu"/>
<UseText actor="a_FloskuBrot" actor2="a_Sigrun" listener="sc" text="Pota mig með glerbrotinu"/>

<UseText actor="a_Skeid" actor2="a_Kalli1" listener="sc" text="Pota í gamla manninn með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_Kalli2" listener="sc" text="Ýta í gamla manninn með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_Pabbi" listener="sc" text="Pota í hrædda manninn með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_Jon" listener="sc" text="Pota í séra Jón með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_Prestsfru" listener="sc" text="Pota í prestsfrúna með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_Halldora" listener="sc" text="Pota í Halldóru með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_Strakur" listener="sc" text="Pota í strákinn með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_KonaMadurDaud" listener="sc" text="Pota í óheppna strákinn með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_StrakurDaudur" listener="sc" text="Pota í óheppna fólkið með skeiðinni"/>
<UseText actor="a_Skeid" actor2="a_Sigrun" listener="sc" text="Pota mig með skeiðinni"/>

<UseText actor="a_Askur" actor2="a_Kalli1" listener="sc" text="Maka sultu yfir gamla manninn"/>
<UseText actor="a_Askur" actor2="a_Kalli2" listener="sc" text="Maka sultu yfir gamla manninn"/>
<UseText actor="a_Askur" actor2="a_Pabbi" listener="sc" text="Maka sultu yfir hrædda manninn"/>
<UseText actor="a_Askur" actor2="a_Jon" listener="sc" text="Maka sultu yfir séra Jón"/>
<UseText actor="a_Askur" actor2="a_Prestsfru" listener="sc" text="Maka sultu yfir prestsfrúna"/>
<UseText actor="a_Askur" actor2="a_Halldora" listener="sc" text="Maka sultu yfir Halldóru"/>
<UseText actor="a_Askur" actor2="a_Strakur" listener="sc" text="Maka sultu yfir strákinn"/>
<UseText actor="a_Askur" actor2="a_KonaMadurDaud" listener="sc" text="Maka sultu yfir óheppna fólkið"/>
<UseText actor="a_Askur" actor2="a_StrakurDaudur" listener="sc" text="Maka sultu yfir óheppna strákinn"/>

<UseText actor="a_Flaska" actor2="a_Kalli1" listener="sc" text="Lemja gamla manninn í hausinn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_Kalli2" listener="sc" text="Lemja gamla manninn í hausinn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_Pabbi" listener="sc" text="Dangla í hrædda manninn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_Jon" listener="sc" text="Lemja séra Jón í hausinn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_Prestsfru" listener="sc" text="Dangla í prestsfrúna með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_Halldora" listener="sc" text="Lemja Halldóru í hausinn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_Strakur" listener="sc" text="Lemja strákinn í hausinn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_KonaMadurDaud" listener="sc" text="Lemja óheppna fólkið í hausinn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_StrakurDaudur" listener="sc" text="Lemja óheppna strákinn í hausinn með flöskunni"/>
<UseText actor="a_Flaska" actor2="a_Sigrun" listener="sc" text="Lemja mig í hausinn með flöskunni"/>

<UseText actor="a_Tappi" actor2="a_Tunna" listener="sc" text="Setja tappa í tunnu!"/>
<UseText actor="a_Tunna" actor2="a_Tappi" listener="sc" text="Setja tappa í tunnu!"/>

<UseText actor="a_DansktReipi" actor2="a_Prik" listener="sc" text="Binda reipið við prikið"/>
<UseText actor="a_DansktReipi" actor2="a_Skeid" listener="sc" text="Binda reipið við skeiðina"/>
<UseText actor="a_Skeid" actor2="a_DansktReipi" listener="sc" text="Binda reipið við skeiðina"/>
<UseText actor="a_Prik" actor2="a_DansktReipi" listener="sc" text="Binda reipið við prikið"/>

<UseText actor="a_Askur" actor2="a_Edalsteinn" listener="sc" text="Maka sultu á eðalsteininn"/>
<UseText actor="a_Askur" actor2="a_Brot1" listener="sc" text="Maka sultu á eðalsteinabrot"/>
<UseText actor="a_Askur" actor2="a_TimaSteinn" listener="sc" text="Maka sultu á steinbrot"/>
<UseText actor="a_Askur" actor2="a_Flaska" listener="sc" text="Hella sultu yfir í flösku"/>

<UseText actor="a_Edalsteinn" actor2="a_Kalli1" listener="sc" text="Gefa gamla manninnum eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_Kalli2" listener="sc" text="Gefa gamla manninnum eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_Pabbi" listener="sc" text="Gefa hrædda manninnum eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_Jon" listener="sc" text="Gefa séra Jóni eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_Prestsfru" listener="sc" text="Gefa prestsfrúnni eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_Halldora" listener="sc" text="Gefa Halldóru eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_Strakur" listener="sc" text="Gefa stráknum eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_KonaMadurDaud" listener="sc" text="Gefa óheppna fólkinu eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_StrakurDaudur" listener="sc" text="Gefa óheppna stráknum eðalsteininn"/>
<UseText actor="a_Edalsteinn" actor2="a_Sigrun" listener="sc" text="Gefa mér eðalsteininn"/>

<UseText actor="a_TimaSteinn" actor2="a_Halldora" listener="sc" text="Gefa Halldóru steinbrotið"/>
<UseText actor="a_TimaSteinn" actor2="a_Strakur" listener="sc" text="Gefa stráknum steinbrotið"/>
<UseText actor="a_TimaSteinn" actor2="a_KonaMadurDaud" listener="sc" text="Gefa óheppna fólkinu steinbrotið"/>
<UseText actor="a_TimaSteinn" actor2="a_StrakurDaudur" listener="sc" text="Gefa óheppna stráknum steinbrotið"/>
<UseText actor="a_TimaSteinn" actor2="a_Sigrun" listener="sc" text="Gefa mér steinbrotið"/>

<UseText actor="a_Brot1" actor2="a_Kalli1" listener="sc" text="Gefa gamla manninnum eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_Kalli2" listener="sc" text="Gefa gamla manninnum eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_Pabbi" listener="sc" text="Gefa hrædda manninnum eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_Jon" listener="sc" text="Gefa séra Jóni eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_Prestsfru" listener="sc" text="Gefa prestsfrúnni eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_Halldora" listener="sc" text="Gefa Halldóru eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_Strakur" listener="sc" text="Gefa stráknum eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_KonaMadurDaud" listener="sc" text="Gefa óheppna fólkinu eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_StrakurDaudur" listener="sc" text="Gefa óheppna stráknum eðalsteinsbrotið"/>
<UseText actor="a_Brot1" actor2="a_Sigrun" listener="sc" text="Gefa mér eðalsteinsbrotið"/>

<UseText actor="a_DansktReipi" actor2="a_Kalli1" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_DansktReipi" actor2="a_Kalli2" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_DansktReipi" actor2="a_Pabbi" listener="sc" text="Binda hrædda manninn"/>
<UseText actor="a_DansktReipi" actor2="a_Jon" listener="sc" text="Binda séra Jón"/>
<UseText actor="a_DansktReipi" actor2="a_Prestsfru" listener="sc" text="Binda prestsfrúna"/>
<UseText actor="a_DansktReipi" actor2="a_Halldora" listener="sc" text="Binda Halldóru"/>
<UseText actor="a_DansktReipi" actor2="a_Strakur" listener="sc" text="Binda strákinn"/>
<UseText actor="a_DansktReipi" actor2="a_KonaMadurDaud" listener="sc" text="Binda óheppna fólkið"/>
<UseText actor="a_DansktReipi" actor2="a_StrakurDaudur" listener="sc" text="Binda óheppna strákinn"/>
<UseText actor="a_DansktReipi" actor2="a_Sigrun" listener="sc" text="Binda mig fast"/>

<UseText actor="a_Kadall" actor2="a_Kalli1" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_Kadall" actor2="a_Kalli2" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_Kadall" actor2="a_Pabbi" listener="sc" text="Binda hrædda manninn"/>
<UseText actor="a_Kadall" actor2="a_Jon" listener="sc" text="Binda séra Jón"/>
<UseText actor="a_Kadall" actor2="a_Prestsfru" listener="sc" text="Binda prestsfrúna"/>
<UseText actor="a_Kadall" actor2="a_Halldora" listener="sc" text="Binda Halldóru"/>
<UseText actor="a_Kadall" actor2="a_Strakur" listener="sc" text="Binda strákinn"/>
<UseText actor="a_Kadall" actor2="a_KonaMadurDaud" listener="sc" text="Binda óheppna fólkið"/>
<UseText actor="a_Kadall" actor2="a_StrakurDaudur" listener="sc" text="Binda óheppna strákinn"/>
<UseText actor="a_Kadall" actor2="a_Sigrun" listener="sc" text="Binda mig fast"/>

<UseText actor="a_TyrknesktReipi" actor2="a_Kalli1" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_TyrknesktReipi" actor2="a_Kalli2" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_TyrknesktReipi" actor2="a_Pabbi" listener="sc" text="Binda hrædda manninn"/>
<UseText actor="a_TyrknesktReipi" actor2="a_Jon" listener="sc" text="Binda séra Jón"/>
<UseText actor="a_TyrknesktReipi" actor2="a_Prestsfru" listener="sc" text="Binda prestsfrúna"/>
<UseText actor="a_TyrknesktReipi" actor2="a_Halldora" listener="sc" text="Binda Halldóru"/>
<UseText actor="a_TyrknesktReipi" actor2="a_Strakur" listener="sc" text="Binda strákinn"/>
<UseText actor="a_TyrknesktReipi" actor2="a_KonaMadurDaud" listener="sc" text="Binda óheppna fólkið"/>
<UseText actor="a_TyrknesktReipi" actor2="a_StrakurDaudur" listener="sc" text="Binda óheppna strákinn"/>
<UseText actor="a_TyrknesktReipi" actor2="a_Sigrun" listener="sc" text="Binda mig fast"/>

<UseText actor="a_2Reipi" actor2="a_Kalli1" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_2Reipi" actor2="a_Kalli2" listener="sc" text="Binda gamla manninn"/>
<UseText actor="a_2Reipi" actor2="a_Pabbi" listener="sc" text="Binda hrædda manninn"/>
<UseText actor="a_2Reipi" actor2="a_Jon" listener="sc" text="Binda séra Jón"/>
<UseText actor="a_2Reipi" actor2="a_Prestsfru" listener="sc" text="Binda prestsfrúna"/>
<UseText actor="a_2Reipi" actor2="a_Halldora" listener="sc" text="Binda Halldóru"/>
<UseText actor="a_2Reipi" actor2="a_Strakur" listener="sc" text="Binda strákinn"/>
<UseText actor="a_2Reipi" actor2="a_KonaMadurDaud" listener="sc" text="Binda óheppna fólkið"/>
<UseText actor="a_2Reipi" actor2="a_StrakurDaudur" listener="sc" text="Binda óheppna strákinn"/>
<UseText actor="a_2Reipi" actor2="a_Sigrun" listener="sc" text="Binda mig fast"/>



<SetPlayer object="sc" player="a_Sigrun"/>
<SetPlayer object="s_Kot" player="a_Sigrun"/>
<SetPlayer object="s_UtanHusid" player="a_Sigrun"/>
<SetPlayer object="s_DansktHus" player="a_Sigrun"/>
<SetPlayer object="s_Fjaran" player="a_Sigrun"/>
<SetPlayer object="s_Dekkid" player="a_Sigrun"/>
<SetPlayer object="s_Innihellir" player="a_Sigrun"/>

<BeginningScene scene="s_Kot"/>

</Body>