<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
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
<layer number="100" name="Muster" color="7" fill="1" visible="no" active="no"/>
<layer number="101" name="Bemassung" color="7" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Changes" color="12" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="yes" active="yes"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="yes" active="yes"/>
</layers>
<schematic>
<libraries>
<library name="con-wago-508">
<description>&lt;b&gt;Wago Screw Clamps&lt;/b&gt;&lt;p&gt;
Grid 5.08 mm&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="W237-132">
<description>&lt;b&gt;WAGO SREW CLAMP&lt;/b&gt;</description>
<wire x1="-3.5306" y1="-1.651" x2="-1.524" y2="0.3556" width="0.254" layer="51"/>
<wire x1="1.6256" y1="-1.6764" x2="3.5306" y2="0.3556" width="0.254" layer="51"/>
<wire x1="-5.08" y1="4.191" x2="5.08" y2="4.191" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-4.826" x2="5.08" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-4.826" x2="-5.08" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.191" x2="-5.08" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.413" x2="-3.429" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.413" x2="-1.651" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="-2.413" x2="1.651" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-2.413" x2="5.08" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.413" x2="-5.08" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.413" x2="5.08" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.191" x2="-5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.445" x2="5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="5.08" y1="4.191" x2="5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="1.651" y1="-2.413" x2="3.429" y2="-2.413" width="0.1524" layer="51"/>
<circle x="-2.54" y="-0.635" radius="1.4986" width="0.1524" layer="51"/>
<circle x="-2.54" y="2.8448" radius="0.508" width="0.1524" layer="21"/>
<circle x="2.54" y="-0.635" radius="1.4986" width="0.1524" layer="51"/>
<circle x="2.54" y="2.8448" radius="0.508" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="-0.635" drill="1.1938" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="-0.635" drill="1.1938" shape="long" rot="R90"/>
<text x="-4.445" y="1.27" size="1.27" layer="51" ratio="10">1</text>
<text x="0.6858" y="1.2192" size="1.27" layer="51" ratio="10">2</text>
<text x="-3.81" y="-6.985" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.81" y="-4.318" size="1.27" layer="25" ratio="10">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="KL">
<wire x1="1.778" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<circle x="0.889" y="0" radius="0.898" width="0.254" layer="94"/>
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="KL+V">
<wire x1="1.778" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<circle x="0.889" y="0" radius="0.898" width="0.254" layer="94"/>
<text x="0" y="2.54" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="W237-02P" prefix="X" uservalue="yes">
<description>&lt;b&gt;WAGO SREW CLAMP&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="KL" x="0" y="0" addlevel="always"/>
<gate name="-2" symbol="KL+V" x="0" y="-5.08" addlevel="always"/>
</gates>
<devices>
<device name="" package="W237-132">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-2" pin="KL" pad="2"/>
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
<library name="wirepad">
<description>&lt;b&gt;Single Pads&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1,6/0,8">
<description>&lt;b&gt;THROUGH-HOLE PAD&lt;/b&gt;</description>
<wire x1="-0.762" y1="0.762" x2="-0.508" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="0.762" x2="-0.762" y2="0.508" width="0.1524" layer="21"/>
<wire x1="0.762" y1="0.762" x2="0.762" y2="0.508" width="0.1524" layer="21"/>
<wire x1="0.762" y1="0.762" x2="0.508" y2="0.762" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-0.508" x2="0.762" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-0.762" x2="0.508" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="-0.762" x2="-0.762" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-0.762" x2="-0.762" y2="-0.508" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.635" width="0.1524" layer="51"/>
<pad name="1" x="0" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-0.762" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0.6" size="0.0254" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="PAD">
<wire x1="-1.016" y1="1.016" x2="1.016" y2="-1.016" width="0.254" layer="94"/>
<wire x1="-1.016" y1="-1.016" x2="1.016" y2="1.016" width="0.254" layer="94"/>
<text x="-1.143" y="1.8542" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.143" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="P" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1,6/0,8" prefix="PAD" uservalue="yes">
<description>&lt;b&gt;THROUGH-HOLE PAD&lt;/b&gt;</description>
<gates>
<gate name="P" symbol="PAD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1,6/0,8">
<connects>
<connect gate="P" pin="P" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="jumper">
<description>&lt;b&gt;Jumpers&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="JP1">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-1.016" y1="0" x2="-1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="0" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0" x2="1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.254" x2="1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-2.54" x2="1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.54" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.254" x2="-1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.54" x2="-1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.54" x2="1.016" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="0" y="-1.27" drill="0.9144" shape="long"/>
<pad name="2" x="0" y="1.27" drill="0.9144" shape="long"/>
<text x="-1.651" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="2.921" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.3048" y1="0.9652" x2="0.3048" y2="1.5748" layer="51"/>
<rectangle x1="-0.3048" y1="-1.5748" x2="0.3048" y2="-0.9652" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="J1">
<wire x1="0" y1="2.54" x2="0" y2="3.81" width="0.4064" layer="94"/>
<wire x1="0" y1="3.81" x2="0" y2="5.08" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-3.81" width="0.4064" layer="94"/>
<wire x1="0" y1="-3.81" x2="0" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="5.08" x2="1.905" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.905" y1="5.08" x2="1.905" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.905" y1="-5.08" x2="-1.905" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-1.905" y1="-5.08" x2="-1.905" y2="5.08" width="0.4064" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="4.445" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="1" x="0" y="-7.62" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="2" x="0" y="7.62" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="JP1Q" prefix="JP" uservalue="yes">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="J1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="JP1">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
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
<part name="X1" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X2" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X3" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X4" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X5" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X6" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X7" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X8" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="PAD1" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD2" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD3" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD4" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="JP1" library="jumper" deviceset="JP1Q" device=""/>
<part name="JP2" library="jumper" deviceset="JP1Q" device=""/>
<part name="JP3" library="jumper" deviceset="JP1Q" device=""/>
<part name="PAD5" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD6" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD7" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD8" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="JP4" library="jumper" deviceset="JP1Q" device=""/>
<part name="JP5" library="jumper" deviceset="JP1Q" device=""/>
<part name="JP6" library="jumper" deviceset="JP1Q" device=""/>
<part name="PAD9" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD10" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD11" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD12" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD13" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD14" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD15" library="wirepad" deviceset="1,6/0,8" device=""/>
<part name="PAD16" library="wirepad" deviceset="1,6/0,8" device=""/>
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
<wire x1="0" y1="0" x2="0" y2="-196.85" width="0.1524" layer="94"/>
<wire x1="0" y1="-196.85" x2="203.2" y2="-196.85" width="0.1524" layer="94"/>
<wire x1="203.2" y1="-196.85" x2="279.4" y2="-196.85" width="0.1524" layer="94"/>
<wire x1="279.4" y1="-196.85" x2="279.4" y2="-171.45" width="0.1524" layer="94"/>
<wire x1="279.4" y1="-171.45" x2="279.4" y2="0" width="0.1524" layer="94"/>
<wire x1="203.2" y1="-196.85" x2="203.2" y2="-171.45" width="0.1524" layer="94"/>
<wire x1="203.2" y1="-171.45" x2="279.4" y2="-171.45" width="0.1524" layer="94"/>
<text x="205.486" y="20.066" size="2.54" layer="94">4x step-down breakout board</text>
<text x="206.756" y="-176.784" size="2.54" layer="94">AT91SAM7S prototyping board</text>
</plain>
<instances>
<instance part="X1" gate="-1" x="33.02" y="152.4"/>
<instance part="X1" gate="-2" x="33.02" y="157.48"/>
<instance part="X2" gate="-1" x="33.02" y="127"/>
<instance part="X2" gate="-2" x="33.02" y="132.08"/>
<instance part="X3" gate="-1" x="33.02" y="101.6"/>
<instance part="X3" gate="-2" x="33.02" y="106.68"/>
<instance part="X4" gate="-1" x="33.02" y="76.2"/>
<instance part="X4" gate="-2" x="33.02" y="81.28"/>
<instance part="X5" gate="-1" x="76.2" y="157.48"/>
<instance part="X5" gate="-2" x="76.2" y="152.4"/>
<instance part="X6" gate="-1" x="76.2" y="132.08"/>
<instance part="X6" gate="-2" x="76.2" y="127"/>
<instance part="X7" gate="-1" x="76.2" y="106.68"/>
<instance part="X7" gate="-2" x="76.2" y="101.6"/>
<instance part="X8" gate="-1" x="76.2" y="81.28"/>
<instance part="X8" gate="-2" x="76.2" y="76.2"/>
<instance part="PAD1" gate="P" x="60.96" y="157.48" rot="R180"/>
<instance part="PAD2" gate="P" x="60.96" y="132.08" rot="R180"/>
<instance part="PAD3" gate="P" x="60.96" y="106.68" rot="R180"/>
<instance part="PAD4" gate="P" x="60.96" y="81.28" rot="R180"/>
<instance part="JP1" gate="A" x="86.36" y="142.24"/>
<instance part="JP2" gate="A" x="86.36" y="116.84"/>
<instance part="JP3" gate="A" x="86.36" y="91.44"/>
<instance part="PAD5" gate="P" x="60.96" y="152.4" rot="R180"/>
<instance part="PAD6" gate="P" x="60.96" y="127" rot="R180"/>
<instance part="PAD7" gate="P" x="60.96" y="101.6" rot="R180"/>
<instance part="PAD8" gate="P" x="60.96" y="76.2" rot="R180"/>
<instance part="JP4" gate="A" x="50.8" y="142.24"/>
<instance part="JP5" gate="A" x="50.8" y="116.84"/>
<instance part="JP6" gate="A" x="50.8" y="91.44"/>
<instance part="PAD9" gate="P" x="99.06" y="152.4" rot="R180"/>
<instance part="PAD10" gate="P" x="99.06" y="127" rot="R180"/>
<instance part="PAD11" gate="P" x="99.06" y="101.6" rot="R180"/>
<instance part="PAD12" gate="P" x="99.06" y="76.2" rot="R180"/>
<instance part="PAD13" gate="P" x="99.06" y="157.48" rot="R180"/>
<instance part="PAD14" gate="P" x="99.06" y="132.08" rot="R180"/>
<instance part="PAD15" gate="P" x="99.06" y="106.68" rot="R180"/>
<instance part="PAD16" gate="P" x="99.06" y="81.28" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$5" class="0">
<segment>
<pinref part="X4" gate="-2" pin="KL"/>
<pinref part="PAD4" gate="P" pin="P"/>
<wire x1="38.1" y1="81.28" x2="50.8" y2="81.28" width="0.1524" layer="91"/>
<pinref part="JP6" gate="A" pin="1"/>
<wire x1="50.8" y1="81.28" x2="58.42" y2="81.28" width="0.1524" layer="91"/>
<wire x1="50.8" y1="83.82" x2="50.8" y2="81.28" width="0.1524" layer="91"/>
<junction x="50.8" y="81.28"/>
<wire x1="50.8" y1="83.82" x2="55.88" y2="83.82" width="0.1524" layer="91"/>
<wire x1="55.88" y1="83.82" x2="55.88" y2="99.06" width="0.1524" layer="91"/>
<junction x="50.8" y="83.82"/>
<pinref part="X3" gate="-2" pin="KL"/>
<pinref part="PAD3" gate="P" pin="P"/>
<wire x1="38.1" y1="106.68" x2="50.8" y2="106.68" width="0.1524" layer="91"/>
<pinref part="JP5" gate="A" pin="1"/>
<wire x1="50.8" y1="106.68" x2="58.42" y2="106.68" width="0.1524" layer="91"/>
<wire x1="50.8" y1="109.22" x2="50.8" y2="106.68" width="0.1524" layer="91"/>
<junction x="50.8" y="106.68"/>
<pinref part="JP6" gate="A" pin="2"/>
<wire x1="50.8" y1="99.06" x2="50.8" y2="106.68" width="0.1524" layer="91"/>
<wire x1="55.88" y1="99.06" x2="50.8" y2="99.06" width="0.1524" layer="91"/>
<junction x="50.8" y="99.06"/>
<wire x1="50.8" y1="109.22" x2="55.88" y2="109.22" width="0.1524" layer="91"/>
<junction x="50.8" y="109.22"/>
<wire x1="55.88" y1="109.22" x2="55.88" y2="124.46" width="0.1524" layer="91"/>
<pinref part="X2" gate="-2" pin="KL"/>
<pinref part="PAD2" gate="P" pin="P"/>
<wire x1="38.1" y1="132.08" x2="50.8" y2="132.08" width="0.1524" layer="91"/>
<pinref part="JP5" gate="A" pin="2"/>
<wire x1="50.8" y1="132.08" x2="58.42" y2="132.08" width="0.1524" layer="91"/>
<wire x1="50.8" y1="124.46" x2="50.8" y2="132.08" width="0.1524" layer="91"/>
<junction x="50.8" y="132.08"/>
<pinref part="JP4" gate="A" pin="1"/>
<wire x1="50.8" y1="134.62" x2="50.8" y2="132.08" width="0.1524" layer="91"/>
<wire x1="55.88" y1="124.46" x2="50.8" y2="124.46" width="0.1524" layer="91"/>
<junction x="50.8" y="124.46"/>
<wire x1="50.8" y1="134.62" x2="55.88" y2="134.62" width="0.1524" layer="91"/>
<junction x="50.8" y="134.62"/>
<wire x1="55.88" y1="134.62" x2="55.88" y2="149.86" width="0.1524" layer="91"/>
<pinref part="X1" gate="-2" pin="KL"/>
<pinref part="PAD1" gate="P" pin="P"/>
<wire x1="38.1" y1="157.48" x2="50.8" y2="157.48" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="2"/>
<wire x1="50.8" y1="157.48" x2="58.42" y2="157.48" width="0.1524" layer="91"/>
<wire x1="50.8" y1="149.86" x2="50.8" y2="157.48" width="0.1524" layer="91"/>
<junction x="50.8" y="157.48"/>
<wire x1="55.88" y1="149.86" x2="50.8" y2="149.86" width="0.1524" layer="91"/>
<junction x="50.8" y="149.86"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="X1" gate="-1" pin="KL"/>
<pinref part="PAD5" gate="P" pin="P"/>
<wire x1="58.42" y1="152.4" x2="38.1" y2="152.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="81.28" y1="149.86" x2="86.36" y2="149.86" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="86.36" y1="134.62" x2="81.28" y2="134.62" width="0.1524" layer="91"/>
<wire x1="81.28" y1="134.62" x2="81.28" y2="149.86" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="81.28" y1="124.46" x2="86.36" y2="124.46" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="86.36" y1="109.22" x2="81.28" y2="109.22" width="0.1524" layer="91"/>
<wire x1="81.28" y1="109.22" x2="81.28" y2="124.46" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="1"/>
<wire x1="86.36" y1="83.82" x2="81.28" y2="83.82" width="0.1524" layer="91"/>
<wire x1="81.28" y1="83.82" x2="81.28" y2="99.06" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="2"/>
<wire x1="81.28" y1="99.06" x2="86.36" y2="99.06" width="0.1524" layer="91"/>
<pinref part="X8" gate="-2" pin="KL"/>
<pinref part="PAD12" gate="P" pin="P"/>
<wire x1="81.28" y1="76.2" x2="86.36" y2="76.2" width="0.1524" layer="91"/>
<wire x1="86.36" y1="76.2" x2="96.52" y2="76.2" width="0.1524" layer="91"/>
<wire x1="86.36" y1="83.82" x2="86.36" y2="76.2" width="0.1524" layer="91"/>
<junction x="86.36" y="83.82"/>
<junction x="86.36" y="76.2"/>
<pinref part="X7" gate="-2" pin="KL"/>
<pinref part="PAD11" gate="P" pin="P"/>
<wire x1="81.28" y1="101.6" x2="86.36" y2="101.6" width="0.1524" layer="91"/>
<wire x1="86.36" y1="101.6" x2="96.52" y2="101.6" width="0.1524" layer="91"/>
<wire x1="86.36" y1="99.06" x2="86.36" y2="101.6" width="0.1524" layer="91"/>
<junction x="86.36" y="99.06"/>
<junction x="86.36" y="101.6"/>
<wire x1="86.36" y1="109.22" x2="86.36" y2="101.6" width="0.1524" layer="91"/>
<junction x="86.36" y="109.22"/>
<pinref part="X6" gate="-2" pin="KL"/>
<pinref part="PAD10" gate="P" pin="P"/>
<wire x1="81.28" y1="127" x2="86.36" y2="127" width="0.1524" layer="91"/>
<wire x1="86.36" y1="127" x2="96.52" y2="127" width="0.1524" layer="91"/>
<wire x1="86.36" y1="124.46" x2="86.36" y2="127" width="0.1524" layer="91"/>
<junction x="86.36" y="124.46"/>
<junction x="86.36" y="127"/>
<wire x1="86.36" y1="134.62" x2="86.36" y2="127" width="0.1524" layer="91"/>
<junction x="86.36" y="134.62"/>
<pinref part="X5" gate="-2" pin="KL"/>
<pinref part="PAD9" gate="P" pin="P"/>
<wire x1="81.28" y1="152.4" x2="86.36" y2="152.4" width="0.1524" layer="91"/>
<wire x1="86.36" y1="152.4" x2="96.52" y2="152.4" width="0.1524" layer="91"/>
<wire x1="86.36" y1="149.86" x2="86.36" y2="152.4" width="0.1524" layer="91"/>
<junction x="86.36" y="149.86"/>
<junction x="86.36" y="152.4"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="X2" gate="-1" pin="KL"/>
<pinref part="PAD6" gate="P" pin="P"/>
<wire x1="58.42" y1="127" x2="38.1" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="X3" gate="-1" pin="KL"/>
<pinref part="PAD7" gate="P" pin="P"/>
<wire x1="58.42" y1="101.6" x2="38.1" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="X4" gate="-1" pin="KL"/>
<pinref part="PAD8" gate="P" pin="P"/>
<wire x1="58.42" y1="76.2" x2="38.1" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="X8" gate="-1" pin="KL"/>
<pinref part="PAD16" gate="P" pin="P"/>
<wire x1="81.28" y1="81.28" x2="96.52" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="X7" gate="-1" pin="KL"/>
<pinref part="PAD15" gate="P" pin="P"/>
<wire x1="81.28" y1="106.68" x2="96.52" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="X6" gate="-1" pin="KL"/>
<pinref part="PAD14" gate="P" pin="P"/>
<wire x1="81.28" y1="132.08" x2="96.52" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="X5" gate="-1" pin="KL"/>
<pinref part="PAD13" gate="P" pin="P"/>
<wire x1="81.28" y1="157.48" x2="96.52" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
