<?xml version="1.0" encoding="iso-8859-1"?>

<!DOCTYPE	Body			SYSTEM "scene.dtd" []>

<Body>

<Scene name="s_Extro"/>
<Scene name="s_Black"/>

<Polygon name="p_Extro">
	<Point x="-1" y="601"/>
	<Point x="801" y="601"/>
	<Point x="801" y="-1"/>
	<Point x="-1" y="-1"/>
</Polygon>

<SimplePseudo3DTerrain name="t_Black" scene="s_Black" polygon="p_Extro" zmin="-7" zmax="0"/>
<SimplePseudo3DTerrain name="t_Extro" scene="s_Extro" polygon="p_Extro" zmin="-7" zmax="0"/>

<SwitchSceneQuantum name="q_ToBlack" scene="s_Black"/>
<SwitchSceneQuantum name="q_ToExtro" scene="s_Extro"/>

<PauseQuantum name="q_wait5sek" time="4925"/>

<StaticActorFace name="extro_stop" file="\extro\medmenid" transparent="false"/>
<StaticActorFace name="extro_stop2" file="\extro\agotu" transparent="false"/>
<StaticActorFace name="af_extro_rammi1" file="\intro\forritun" transparent="false"/>
<StaticActorFace name="af_extro_rammi2" file="\intro\samsetni" transparent="false"/>
<StaticActorFace name="af_extro_rammi3" file="\intro\grafik" transparent="false"/>
<StaticActorFace name="af_extro_rammi4" file="\intro\saga" transparent="false"/>
<StaticActorFace name="af_extro_rammi5" file="\intro\talsetni" transparent="false"/>
<StaticActorFace name="af_extro_rammi6" file="\intro\upptokus" transparent="false"/>
<StaticActorFace name="af_extro_rammi7" file="\intro\upptokur"  transparent="false"/>
<StaticActorFace name="af_extro_rammi8" file="\intro\tonlist"  transparent="false"/>
<StaticActorFace name="af_extro_rammi9" file="\intro\profarka"  transparent="false"/>
<StaticActorFace name="af_extro_rammi10" file="\intro\byrjunar" transparent="false"/>
<StaticActorFace name="af_extro_rammi11" file="\intro\specialt"  transparent="false"/>
<StaticActorFace name="af_extro_rammi12" file="\intro\thanks"  transparent="false"/>
<StaticActorFace name="af_extro_rammi13" file="\intro\donotfor"  transparent="false"/>
<StaticActorFace name="af_extro_rammi14" file="\intro\dimon199"  transparent="false"/>
<StaticActorFace name="af_intro_rammi15" file="\intro\testing" transparent="false"/>

<StaticActor name="a_extro" state="mynd" terrain="t_Extro" x="0" y="6000" z="6000" >
	<State name="mynd" face="extro_stop"/>
	<State name="mynd2" face="extro_stop2"/>
	<State name="rammi1" face="af_extro_rammi1"/>
	<State name="rammi2" face="af_extro_rammi2"/>
	<State name="rammi3" face="af_extro_rammi3"/>
	<State name="rammi4" face="af_extro_rammi4"/>
	<State name="rammi5" face="af_extro_rammi5"/>
	<State name="rammi6" face="af_extro_rammi6"/>
	<State name="rammi7" face="af_extro_rammi7"/>
	<State name="rammi8" face="af_extro_rammi8"/>
	<State name="rammi9" face="af_extro_rammi9"/>
	<State name="rammi10" face="af_extro_rammi10"/>
	<State name="rammi11" face="af_extro_rammi11"/>
	<State name="rammi12" face="af_extro_rammi12"/>
	<State name="rammi13" face="af_extro_rammi13"/>
	<State name="rammi14" face="af_extro_rammi14"/>
	<State name="rammi15" face="af_intro_rammi15"/>
</StaticActor>

<PrepareQuantum	name="qp_mynd" object="extro_stop" prepare="true"/>
<PrepareQuantum	name="qu_mynd" object="extro_stop" prepare="false"/>

<PrepareQuantum	name="qp_mynd2" object="extro_stop2" prepare="true"/>
<PrepareQuantum	name="qu_mynd2" object="extro_stop2" prepare="false"/>

<PrepareQuantum	name="qp_rammi1" object="af_extro_rammi1" prepare="true"/>
<PrepareQuantum	name="qu_rammi1" object="af_extro_rammi1" prepare="false"/>

<PrepareQuantum	name="qp_rammi2" object="af_extro_rammi2" prepare="true"/>
<PrepareQuantum	name="qu_rammi2" object="af_extro_rammi2" prepare="false"/>

<PrepareQuantum	name="qp_rammi3" object="af_extro_rammi3" prepare="true"/>
<PrepareQuantum	name="qu_rammi3" object="af_extro_rammi3" prepare="false"/>

<PrepareQuantum	name="qp_rammi4" object="af_extro_rammi4" prepare="true"/>
<PrepareQuantum	name="qu_rammi4" object="af_extro_rammi4" prepare="false"/>

<PrepareQuantum	name="qp_rammi5" object="af_extro_rammi5" prepare="true"/>
<PrepareQuantum	name="qu_rammi5" object="af_extro_rammi5" prepare="false"/>

<PrepareQuantum	name="qp_rammi6" object="af_extro_rammi6" prepare="true"/>
<PrepareQuantum	name="qu_rammi6" object="af_extro_rammi6" prepare="false"/>

<PrepareQuantum	name="qp_rammi7" object="af_extro_rammi7" prepare="true"/>
<PrepareQuantum	name="qu_rammi7" object="af_extro_rammi7" prepare="false"/>

<PrepareQuantum	name="qp_rammi8" object="af_extro_rammi8" prepare="true"/>
<PrepareQuantum	name="qu_rammi8" object="af_extro_rammi8" prepare="false"/>

<PrepareQuantum	name="qp_rammi9" object="af_extro_rammi9" prepare="true"/>
<PrepareQuantum	name="qu_rammi9" object="af_extro_rammi9" prepare="false"/>

<PrepareQuantum	name="qp_rammi10" object="af_extro_rammi10" prepare="true"/>
<PrepareQuantum	name="qu_rammi10" object="af_extro_rammi10" prepare="false"/>

<PrepareQuantum	name="qp_rammi11" object="af_extro_rammi11" prepare="true"/>
<PrepareQuantum	name="qu_rammi11" object="af_extro_rammi11" prepare="false"/>

<PrepareQuantum	name="qp_rammi12" object="af_extro_rammi12" prepare="true"/>
<PrepareQuantum	name="qu_rammi12" object="af_extro_rammi12" prepare="false"/>

<PrepareQuantum	name="qp_rammi13" object="af_extro_rammi13" prepare="true"/>
<PrepareQuantum	name="qu_rammi13" object="af_extro_rammi13" prepare="false"/>

<PrepareQuantum	name="qp_rammi14" object="af_extro_rammi14" prepare="true"/>
<PrepareQuantum	name="qu_rammi14" object="af_extro_rammi14" prepare="false"/>

<PrepareQuantum	name="qp_rammi15" object="af_intro_rammi15" prepare="true"/>
<PrepareQuantum	name="qu_rammi15" object="af_intro_rammi15" prepare="false"/>

<StateQuantum name="q_birta_mynd2" actor="a_extro" state="mynd2"/>
<StateQuantum name="q_birta_rammi1" actor="a_extro" state="rammi1"/>
<StateQuantum name="q_birta_rammi2" actor="a_extro" state="rammi2"/>
<StateQuantum name="q_birta_rammi3" actor="a_extro" state="rammi3"/>
<StateQuantum name="q_birta_rammi4" actor="a_extro" state="rammi4"/>
<StateQuantum name="q_birta_rammi5" actor="a_extro" state="rammi5"/>
<StateQuantum name="q_birta_rammi6" actor="a_extro" state="rammi6"/>
<StateQuantum name="q_birta_rammi7" actor="a_extro" state="rammi7"/>
<StateQuantum name="q_birta_rammi8" actor="a_extro" state="rammi8"/>
<StateQuantum name="q_birta_rammi9" actor="a_extro" state="rammi9"/>
<StateQuantum name="q_birta_rammi10" actor="a_extro" state="rammi10"/>
<StateQuantum name="q_birta_rammi11" actor="a_extro" state="rammi11"/>
<StateQuantum name="q_birta_rammi12" actor="a_extro" state="rammi12"/>
<StateQuantum name="q_birta_rammi13" actor="a_extro" state="rammi13"/>
<StateQuantum name="q_birta_rammi14" actor="a_extro" state="rammi14"/>
<StateQuantum name="q_birta_rammi15" actor="a_extro" state="rammi15"/>

<JMFActorMouth name="m_Adallag" file="\extro\extroson.wav" repeat="true" prepare="true"/>
<PrepareQuantum name="qp_Adallag" object="m_Adallag" prepare="true"/>
<FadeQuantum name="qf_Adallag" mouth="m_Adallag" goal="0" speed="300"/>
<StaticActor name="a_Adallag" x="0" y="0" z="0" state="stop">
	<State name="play" mouth="m_Adallag"/> </StaticActor>
<StateQuantum name="q_StopSong" actor="a_Adallag" state="stop" wait="false"/>
<StateQuantum name="q_PlaySong" actor="a_Adallag" state="play" wait="false"/>

<Sequence name="s_always">
    <Quantum name="qp_Adallag"/>
    <Quantum name="q_PlaySong"/>
</Sequence>

<Sequence name="s_prepare">
    <Quantum name="q_ToBlack"/>
    <Quantum name="qp_mynd"/>
    <Quantum name="q_ToExtro"/>
</Sequence>

<ThemeFinishedQuantum name="q_Fin"/>
<Sequence name="s_final">
    <Quantum name="q_StopSong"/>
</Sequence>
<Sequence name="s_end">
	<Quantum name="q_Fin"/>
</Sequence>

<Sequence name="s_begin">
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_mynd"/>
    <Quantum name="qp_mynd2"/>
	<Quantum name="q_birta_mynd2"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_mynd2"/>
    <Quantum name="qp_rammi1"/>
	<Quantum name="q_birta_rammi1"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi1"/>
    <Quantum name="qp_rammi2"/>
	<Quantum name="q_birta_rammi2"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi2"/>
    <Quantum name="qp_rammi3"/>
	<Quantum name="q_birta_rammi3"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi3"/>
    <Quantum name="qp_rammi4"/>
	<Quantum name="q_birta_rammi4"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi4"/>
    <Quantum name="qp_rammi5"/>
	<Quantum name="q_birta_rammi5"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi5"/>
    <Quantum name="qp_rammi6"/>
	<Quantum name="q_birta_rammi6"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi6"/>
    <Quantum name="qp_rammi7"/>
	<Quantum name="q_birta_rammi7"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi7"/>
    <Quantum name="qp_rammi8"/>
	<Quantum name="q_birta_rammi8"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi8"/>
    <Quantum name="qp_rammi9"/>
	<Quantum name="q_birta_rammi9"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi9"/>
    <Quantum name="qp_rammi10"/>
	<Quantum name="q_birta_rammi10"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi10"/>
    <Quantum name="qp_rammi15"/>
	<Quantum name="q_birta_rammi15"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi15"/>
    <Quantum name="qp_rammi11"/>
	<Quantum name="q_birta_rammi11"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi11"/>
    <Quantum name="qp_rammi12"/>
	<Quantum name="q_birta_rammi12"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi12"/>
    <Quantum name="qp_rammi13"/>
	<Quantum name="q_birta_rammi13"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_ToBlack"/>
    <Quantum name="qu_rammi13"/>
    <Quantum name="qp_rammi14"/>
	<Quantum name="q_birta_rammi14"/>
    <Quantum name="q_ToExtro"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="q_wait5sek"/>
    <Quantum name="qf_Adallag"/>
    <Quantum name="q_ToBlack"/>
</Sequence>
</Body>
