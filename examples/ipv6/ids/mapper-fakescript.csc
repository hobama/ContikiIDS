<?xml version="1.0" encoding="UTF-8"?>
<simconf>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/mrm</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/mspsim</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/avrora</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/serial_socket</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/collect-view</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/powertracker</project>
  <simulation>
    <title>My simulation</title>
    <randomseed>123456</randomseed>
    <motedelay_us>1000000</motedelay_us>
    <radiomedium>
      se.sics.cooja.radiomediums.UDGM
      <transmitting_range>50.0</transmitting_range>
      <interference_range>100.0</interference_range>
      <success_ratio_tx>1.0</success_ratio_tx>
      <success_ratio_rx>1.0</success_ratio_rx>
    </radiomedium>
    <events>
      <logoutput>40000</logoutput>
    </events>
    <motetype>
      se.sics.cooja.mspmote.SkyMoteType
      <identifier>sky1</identifier>
      <description>Sky Mote Type #sky1</description>
      <source EXPORT="discard">[CONTIKI_DIR]/Contiki-IDS-evil/examples/ipv6/ids/ids-server/network-mapper.c</source>
      <commands EXPORT="discard">make network-mapper.sky TARGET=sky</commands>
      <firmware EXPORT="copy">[CONTIKI_DIR]/Contiki-IDS-evil/examples/ipv6/ids/ids-server/network-mapper.sky</firmware>
      <moteinterface>se.sics.cooja.interfaces.Position</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.RimeAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.IPAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Mote2MoteRelations</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteAttributes</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspClock</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspMoteID</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyButton</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyFlash</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyCoffeeFilesystem</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.Msp802154Radio</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspSerial</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyLED</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspDebugOutput</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyTemperature</moteinterface>
    </motetype>
    <motetype>
      se.sics.cooja.mspmote.SkyMoteType
      <identifier>sky2</identifier>
      <description>Sky Mote Type #sky2</description>
      <source EXPORT="discard">[CONTIKI_DIR]/Contiki-IDS-evil/examples/ipv6/ids/ids-client/network-mapper-client.c</source>
      <commands EXPORT="discard">make network-mapper-client.sky TARGET=sky</commands>
      <firmware EXPORT="copy">[CONTIKI_DIR]/Contiki-IDS-evil/examples/ipv6/ids/ids-client/network-mapper-client.sky</firmware>
      <moteinterface>se.sics.cooja.interfaces.Position</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.RimeAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.IPAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Mote2MoteRelations</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteAttributes</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspClock</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspMoteID</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyButton</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyFlash</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyCoffeeFilesystem</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.Msp802154Radio</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspSerial</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyLED</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.MspDebugOutput</moteinterface>
      <moteinterface>se.sics.cooja.mspmote.interfaces.SkyTemperature</moteinterface>
    </motetype>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>92.96515992329716</x>
        <y>58.89022713460451</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>1</id>
      </interface_config>
      <motetype_identifier>sky1</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>65.09423395371515</x>
        <y>72.52620570657349</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>2</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>96.15071131296959</x>
        <y>85.07673693089247</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>3</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>52.85030950339058</x>
        <y>53.335073272257006</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>4</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>25.136083043161438</x>
        <y>51.78861014699051</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>5</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>13.817941536097301</x>
        <y>46.27360398376812</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>6</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>92.14639042796443</x>
        <y>33.56613362923031</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>7</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>2.1703363548025045</x>
        <y>31.769875832577632</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>8</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
  </simulation>
  <plugin>
    se.sics.cooja.plugins.SimControl
    <width>280</width>
    <z>1</z>
    <height>160</height>
    <location_x>400</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.Visualizer
    <plugin_config>
      <skin>se.sics.cooja.plugins.skins.IDVisualizerSkin</skin>
      <viewport>3.753201377247963 0.0 0.0 3.753201377247963 9.490654240427563 -46.274433975307666</viewport>
    </plugin_config>
    <width>400</width>
    <z>3</z>
    <height>400</height>
    <location_x>1</location_x>
    <location_y>1</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.LogListener
    <plugin_config>
      <filter />
    </plugin_config>
    <width>914</width>
    <z>2</z>
    <height>432</height>
    <location_x>400</location_x>
    <location_y>160</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.TimeLine
    <plugin_config>
      <mote>0</mote>
      <mote>1</mote>
      <mote>2</mote>
      <mote>3</mote>
      <mote>4</mote>
      <mote>5</mote>
      <mote>6</mote>
      <mote>7</mote>
      <showRadioRXTX />
      <showRadioHW />
      <showLEDs />
      <split>-1</split>
      <zoomfactor>500.0</zoomfactor>
    </plugin_config>
    <width>1366</width>
    <z>5</z>
    <height>166</height>
    <location_x>0</location_x>
    <location_y>503</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.Notes
    <plugin_config>
      <notes>Enter notes here</notes>
      <decorations>true</decorations>
    </plugin_config>
    <width>686</width>
    <z>4</z>
    <height>160</height>
    <location_x>680</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.ScriptRunner
    <plugin_config>
      <script>/*&#xD;
 * Example Contiki test script (JavaScript).&#xD;
 * A Contiki test script acts on mote output, such as via printf()'s.&#xD;
 * The script may operate on the following variables:&#xD;
 *  Mote mote, int id, String msg&#xD;
 */&#xD;
&#xD;
/* Make test automatically fail (timeout) after 100 simulated seconds */&#xD;
//TIMEOUT(100000); /* milliseconds. no action at timeout */&#xD;
/*TIMEOUT(100000, log.log("last msg: " + msg + "\n")); /* milliseconds. print last msg at timeout */&#xD;
&#xD;
/*log.log("first mote output: '" + msg + "'\n");&#xD;
&#xD;
YIELD(); /* wait for another mote output */&#xD;
&#xD;
/*log.log("second mote output: '" + msg + "'\n");&#xD;
&#xD;
log.log("waiting for hello world output from mote 1\n");&#xD;
WAIT_UNTIL(id == 1 &amp;&amp; msg.equals("Hello, world"));&#xD;
&#xD;
write(mote, "Hello, mote\n"); /* Write to mote serial port */&#xD;
&#xD;
/*GENERATE_MSG(15000, "continue");&#xD;
YIELD_THEN_WAIT_UNTIL(msg.equals("continue"));&#xD;
&#xD;
log.log("ok, reporting success now\n");&#xD;
log.testOK(); /* Report test success and quit */&#xD;
//log.testFailed(); /* Report test failure and quit */&#xD;
&#xD;
//while (true) {&#xD;
/*    moteid=mote.getID();&#xD;
position=mote.getInterfaces().getPosition().getDistanceTo(mote.getSimulation().getMoteWithID(1));&#xD;
  log.log(moteid + ": position"+position + "\n");*/&#xD;
motecount=mote.getSimulation().getMotesCount();&#xD;
var motearray=new Array(motecount);&#xD;
var motearrayid=new Array(motecount);&#xD;
motearrays=mote.getSimulation().getMotes();&#xD;
var position=new Array(motecount);&#xD;
var positionwithservermote = new Array(motecount);&#xD;
var i=0;&#xD;
//var j=0;&#xD;
position=mote.getInterfaces().getPosition().getDistanceTo(mote.getSimulation().getMoteWithID(1))&#xD;
for(i=0;i&lt;motecount;i++)&#xD;
{&#xD;
 motearrayid[i]=motearrays[i].getID();&#xD;
 position[i]=motearrays[i].getInterfaces().getPosition().getDistanceTo(mote.getSimulation().getMoteWithID(1));&#xD;
 log.log("moteid" + motearrayid[i] + "position" + position[i] + "\n");&#xD;
 }&#xD;
  YIELD();</script>
      <active>false</active>
    </plugin_config>
    <width>1351</width>
    <z>0</z>
    <height>669</height>
    <location_x>0</location_x>
    <location_y>0</location_y>
  </plugin>
</simconf>

