<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="14" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="11" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="13" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
<layer number="100" name="Muster" color="7" fill="1" visible="no" active="no"/>
<layer number="101" name="Bemassung" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="231" name="Eagle3D_PG1" color="7" fill="1" visible="yes" active="yes"/>
<layer number="232" name="Eagle3D_PG2" color="7" fill="1" visible="yes" active="yes"/>
<layer number="233" name="Eagle3D_PG3" color="7" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="3" fill="1" visible="yes" active="yes"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="yes" active="yes"/>
<layer number="254" name="OrgLBR" color="7" fill="1" visible="no" active="yes"/>
</layers>
<schematic>
<libraries>
<library name="con-berg">
<description>&lt;b&gt;Berg Connectors&lt;/b&gt;&lt;p&gt;
Based on  the following source:
&lt;ul&gt;
&lt;li&gt;http://catalog.fciconnect.com
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="PN61729-S">
<description>&lt;b&gt;USB connector&lt;/b&gt; with shield&lt;p&gt;</description>
<wire x1="-5.9" y1="5.6" x2="-5.9" y2="-10.15" width="0.254" layer="51"/>
<wire x1="-5.9" y1="-10.15" x2="5.9" y2="-10.15" width="0.254" layer="21"/>
<wire x1="5.9" y1="-10.15" x2="5.9" y2="5.6" width="0.254" layer="51"/>
<wire x1="5.9" y1="5.6" x2="-5.9" y2="5.6" width="0.254" layer="21"/>
<wire x1="-2.46" y1="-0.27" x2="-2.46" y2="0.73" width="0.0508" layer="21" curve="180"/>
<wire x1="-2.46" y1="-1.27" x2="-2.46" y2="-0.27" width="0.0508" layer="21" curve="180"/>
<wire x1="3.665" y1="0.23" x2="3.665" y2="-0.77" width="0.0508" layer="21" curve="180"/>
<wire x1="3.415" y1="0.73" x2="3.415" y2="-1.27" width="0.0508" layer="21" curve="180"/>
<wire x1="3.665" y1="0.23" x2="4.165" y2="0.23" width="0.0508" layer="21" curve="-15.189287"/>
<wire x1="3.415" y1="0.73" x2="4.175" y2="0.675" width="0.0508" layer="21" curve="-12.057134"/>
<wire x1="3.415" y1="-1.27" x2="4.165" y2="-1.145" width="0.0508" layer="21" curve="18.422836"/>
<wire x1="1.665" y1="-0.52" x2="1.665" y2="0.73" width="0.0508" layer="21" curve="180"/>
<wire x1="1.29" y1="-0.145" x2="1.29" y2="0.23" width="0.0508" layer="21" curve="180"/>
<wire x1="-3.835" y1="0.73" x2="-3.835" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="-3.835" y1="-1.27" x2="-3.21" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="-3.21" y1="-1.27" x2="-3.21" y2="-0.27" width="0.0508" layer="21"/>
<wire x1="-3.21" y1="-0.27" x2="-3.21" y2="0.73" width="0.0508" layer="21"/>
<wire x1="-3.21" y1="0.73" x2="-3.835" y2="0.73" width="0.0508" layer="21"/>
<wire x1="-3.21" y1="0.73" x2="-2.46" y2="0.23" width="0.0508" layer="21"/>
<wire x1="-2.46" y1="0.23" x2="-3.21" y2="-0.27" width="0.0508" layer="21"/>
<wire x1="-3.21" y1="-0.27" x2="-2.46" y2="-0.77" width="0.0508" layer="21"/>
<wire x1="-2.46" y1="-0.77" x2="-3.21" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="-2.46" y1="-1.27" x2="-3.21" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="-2.46" y1="0.73" x2="-3.21" y2="0.73" width="0.0508" layer="21"/>
<wire x1="-1.71" y1="0.73" x2="-1.71" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="-1.71" y1="-1.27" x2="0.04" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="0.04" y1="-1.27" x2="0.04" y2="-0.77" width="0.0508" layer="21"/>
<wire x1="0.04" y1="-0.77" x2="-1.085" y2="-0.77" width="0.0508" layer="21"/>
<wire x1="-1.085" y1="-0.77" x2="-1.085" y2="-0.52" width="0.0508" layer="21"/>
<wire x1="-1.085" y1="-0.52" x2="0.04" y2="-0.52" width="0.0508" layer="21"/>
<wire x1="0.04" y1="-0.52" x2="0.04" y2="-0.02" width="0.0508" layer="21"/>
<wire x1="0.04" y1="-0.02" x2="-1.085" y2="-0.02" width="0.0508" layer="21"/>
<wire x1="-1.085" y1="-0.02" x2="-1.085" y2="0.23" width="0.0508" layer="21"/>
<wire x1="-1.085" y1="0.23" x2="0.04" y2="0.23" width="0.0508" layer="21"/>
<wire x1="0.04" y1="0.23" x2="0.04" y2="0.73" width="0.0508" layer="21"/>
<wire x1="0.04" y1="0.73" x2="-1.71" y2="0.73" width="0.0508" layer="21"/>
<wire x1="0.29" y1="0.73" x2="0.29" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="0.29" y1="-1.27" x2="0.915" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="0.915" y1="-1.27" x2="0.915" y2="-0.52" width="0.0508" layer="21"/>
<wire x1="0.915" y1="-0.52" x2="1.415" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="1.415" y1="-1.27" x2="2.165" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="2.165" y1="-1.27" x2="1.665" y2="-0.52" width="0.0508" layer="21"/>
<wire x1="0.915" y1="0.23" x2="0.915" y2="-0.145" width="0.0508" layer="21"/>
<wire x1="0.29" y1="0.73" x2="1.665" y2="0.73" width="0.0508" layer="21"/>
<wire x1="0.915" y1="0.23" x2="1.29" y2="0.23" width="0.0508" layer="21"/>
<wire x1="0.915" y1="-0.145" x2="1.29" y2="-0.145" width="0.0508" layer="21"/>
<wire x1="3.665" y1="-0.27" x2="4.165" y2="-0.27" width="0.0508" layer="21"/>
<wire x1="3.665" y1="-0.27" x2="3.665" y2="-0.77" width="0.0508" layer="21"/>
<wire x1="4.16" y1="0.23" x2="4.16" y2="0.675" width="0.0508" layer="21"/>
<wire x1="4.165" y1="-0.27" x2="4.165" y2="-1.145" width="0.0508" layer="21"/>
<wire x1="-5.9" y1="-2.02" x2="-5.9" y2="-10.15" width="0.254" layer="21"/>
<wire x1="5.9" y1="1.915" x2="5.9" y2="5.6" width="0.254" layer="21"/>
<wire x1="-5.9" y1="5.6" x2="-5.9" y2="1.915" width="0.254" layer="21"/>
<wire x1="5.9" y1="-10.15" x2="5.9" y2="-2.02" width="0.254" layer="21"/>
<pad name="1" x="1.25" y="4.71" drill="0.95" shape="octagon"/>
<pad name="2" x="-1.25" y="4.71" drill="0.95" shape="octagon"/>
<pad name="3" x="-1.25" y="2.71" drill="0.95" shape="octagon"/>
<pad name="4" x="1.25" y="2.71" drill="0.95" shape="octagon"/>
<pad name="S1" x="-6.02" y="0" drill="2.3" diameter="2.9"/>
<pad name="S2" x="6.02" y="0" drill="2.3" diameter="2.9"/>
<text x="-6.35" y="6.35" size="1.27" layer="25">&gt;NAME</text>
<text x="7.62" y="-8.89" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="-3.81" y="-2.04" size="0.4064" layer="21">E L E C T R O N I C S</text>
</package>
</packages>
<symbols>
<symbol name="USB-SHIELD">
<wire x1="0" y1="7.62" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-10.16" x2="2.54" y2="-9.398" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-8.89" x2="2.54" y2="-8.128" width="0.1524" layer="94"/>
<wire x1="6.35" y1="-5.334" x2="6.35" y2="-4.572" width="0.1524" layer="94"/>
<wire x1="6.35" y1="-4.064" x2="6.35" y2="-3.302" width="0.1524" layer="94"/>
<wire x1="6.35" y1="-2.794" x2="6.35" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="6.35" y1="-1.524" x2="6.35" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="6.35" y1="-0.254" x2="6.35" y2="0.508" width="0.1524" layer="94"/>
<wire x1="6.35" y1="1.016" x2="6.35" y2="1.778" width="0.1524" layer="94"/>
<wire x1="6.35" y1="2.286" x2="6.35" y2="3.048" width="0.1524" layer="94"/>
<wire x1="6.35" y1="3.556" x2="6.35" y2="4.318" width="0.1524" layer="94"/>
<wire x1="6.35" y1="4.826" x2="6.35" y2="5.588" width="0.1524" layer="94"/>
<wire x1="6.35" y1="6.096" x2="6.35" y2="6.858" width="0.1524" layer="94"/>
<wire x1="6.35" y1="7.366" x2="6.35" y2="8.128" width="0.1524" layer="94"/>
<wire x1="6.35" y1="8.382" x2="5.588" y2="8.382" width="0.1524" layer="94"/>
<wire x1="5.08" y1="8.382" x2="4.318" y2="8.382" width="0.1524" layer="94"/>
<wire x1="3.81" y1="8.382" x2="3.048" y2="8.382" width="0.1524" layer="94"/>
<wire x1="2.54" y1="8.382" x2="1.778" y2="8.382" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-7.112" x2="2.54" y2="-6.35" width="0.1524" layer="94"/>
<wire x1="3.556" y1="-5.842" x2="2.794" y2="-5.842" width="0.1524" layer="94"/>
<wire x1="4.826" y1="-5.842" x2="4.064" y2="-5.842" width="0.1524" layer="94"/>
<wire x1="6.096" y1="-5.842" x2="5.334" y2="-5.842" width="0.1524" layer="94"/>
<text x="0" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<text x="5.08" y="-2.54" size="2.54" layer="94" rot="R90">USB</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="S1" x="0" y="-7.62" visible="off" length="short" direction="pas"/>
<pin name="S2" x="0" y="-10.16" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PN61729-S" prefix="X">
<description>&lt;b&gt;BERG&lt;/b&gt; USB connector</description>
<gates>
<gate name="G$1" symbol="USB-SHIELD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PN61729-S">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="switch">
<description>&lt;b&gt;Switches&lt;/b&gt;&lt;p&gt;
Marquardt, Siemens, C&amp;K, ITT, and others&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="A68-A31">
<description>&lt;b&gt;SLIDING SWITCH&lt;/b&gt;&lt;p&gt;
Siemens, distributor Buerklin, 11G766</description>
<wire x1="-5.08" y1="-3.81" x2="5.08" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.81" x2="5.08" y2="3.81" width="0.1524" layer="21"/>
<wire x1="5.08" y1="3.81" x2="-5.08" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="3.81" x2="-5.08" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="0.635" x2="-1.905" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-0.3302" y1="-0.635" x2="-0.3302" y2="0.635" width="0.254" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.905" y2="0.635" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-0.635" x2="-1.27" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-0.3302" y1="0.635" x2="-0.9652" y2="0.635" width="0.254" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.9652" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-0.9652" y1="0.635" x2="-0.9652" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-0.9652" y1="0.635" x2="-1.27" y2="0.635" width="0.254" layer="21"/>
<wire x1="-0.9652" y1="-0.635" x2="-0.3302" y2="-0.635" width="0.254" layer="21"/>
<pad name="1" x="-2.54" y="-2.54" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="0" y="-2.54" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-2.54" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="2.54" y="2.54" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="0" y="2.54" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-2.54" y="2.54" drill="0.8128" shape="long" rot="R90"/>
<text x="-3.81" y="-0.9652" size="1.905" layer="21" ratio="10">1</text>
<text x="2.8448" y="-0.9652" size="1.905" layer="21" ratio="10">2</text>
<text x="-5.08" y="4.1402" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-3.175" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="U2">
<wire x1="0" y1="-3.175" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-1.905" x2="-1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="3.175" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="3.175" width="0.254" layer="94"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-3.175" y1="0" x2="-3.81" y2="0" width="0.1524" layer="94"/>
<text x="5.08" y="-1.905" size="1.778" layer="95" rot="R90">&gt;PART</text>
<pin name="P" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="S" x="2.54" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<pin name="O" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
<symbol name="SIS-">
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="0" width="0.254" layer="94"/>
<wire x1="-3.81" y1="0" x2="-1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="-0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="0.254" y1="0" x2="0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-3.175" x2="2.54" y2="-1.905" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.905" x2="0.635" y2="3.175" width="0.254" layer="94"/>
<wire x1="3.81" y1="2.54" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="3.175" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="3.175" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.254" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="-0.254" y1="-0.762" x2="0.254" y2="0" width="0.1524" layer="94"/>
<wire x1="1.905" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="3.175" y1="0" x2="3.81" y2="0" width="0.1524" layer="94"/>
<wire x1="4.445" y1="0" x2="5.08" y2="0" width="0.1524" layer="94"/>
<text x="-3.81" y="3.175" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<text x="-6.35" y="-1.905" size="1.778" layer="95" rot="R90">&gt;PART</text>
<pin name="P" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="S" x="5.08" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<pin name="O" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A68-A31" prefix="S" uservalue="yes">
<description>&lt;b&gt;SLIDING SWITCH&lt;/b&gt;&lt;p&gt;
Siemens, distributor Buerklin, 11G766</description>
<gates>
<gate name="B" symbol="U2" x="12.7" y="0" addlevel="always"/>
<gate name="A" symbol="SIS-" x="0" y="0" addlevel="must"/>
</gates>
<devices>
<device name="" package="A68-A31">
<connects>
<connect gate="A" pin="O" pad="1"/>
<connect gate="A" pin="P" pad="2"/>
<connect gate="A" pin="S" pad="3"/>
<connect gate="B" pin="O" pad="4"/>
<connect gate="B" pin="P" pad="5"/>
<connect gate="B" pin="S" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="X1" library="con-berg" deviceset="PN61729-S" device=""/>
<part name="S1" library="switch" deviceset="A68-A31" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="0" y1="0" x2="203.2" y2="0" width="0.1524" layer="94"/>
<wire x1="203.2" y1="0" x2="279.4" y2="0" width="0.1524" layer="94"/>
<wire x1="279.4" y1="0" x2="279.4" y2="25.4" width="0.1524" layer="94"/>
<wire x1="279.4" y1="25.4" x2="279.4" y2="196.85" width="0.1524" layer="94"/>
<wire x1="279.4" y1="196.85" x2="0" y2="196.85" width="0.1524" layer="94"/>
<wire x1="0" y1="196.85" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="203.2" y1="0" x2="203.2" y2="25.4" width="0.1524" layer="94"/>
<wire x1="203.2" y1="25.4" x2="279.4" y2="25.4" width="0.1524" layer="94"/>
<text x="206.756" y="18.796" size="2.54" layer="94">NAS adapter board</text>
<text x="207.01" y="15.24" size="1.778" layer="94">to fit USB and power connector to WD NAS case</text>
</plain>
<instances>
<instance part="X1" gate="G$1" x="104.14" y="106.68"/>
<instance part="S1" gate="B" x="170.18" y="104.14"/>
<instance part="S1" gate="A" x="157.48" y="104.14"/>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
