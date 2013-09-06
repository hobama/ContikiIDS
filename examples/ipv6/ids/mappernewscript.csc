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
      <source EXPORT="discard">[CONFIG_DIR]/ids-server/network-mapper.c</source>
      <commands EXPORT="discard">make network-mapper.sky TARGET=sky</commands>
      <firmware EXPORT="copy">[CONFIG_DIR]/ids-server/network-mapper.sky</firmware>
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
      <source EXPORT="discard">[CONFIG_DIR]/ids-client/network-mapper-client.c</source>
      <commands EXPORT="discard">make network-mapper-client.sky TARGET=sky</commands>
      <firmware EXPORT="copy">[CONFIG_DIR]/ids-client/network-mapper-client.sky</firmware>
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
        <x>7.280958149365485</x>
        <y>59.55054533889562</y>
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
        <x>39.84107592983051</x>
        <y>59.26240270367026</y>
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
        <x>-10.295742599381123</x>
        <y>77.12724608764222</y>
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
        <x>17.077807747027528</x>
        <y>78.85610189899435</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>4</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
  </simulation>
  <plugin>
    se.sics.cooja.plugins.SimControl
    <width>280</width>
    <z>2</z>
    <height>160</height>
    <location_x>400</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.Visualizer
    <plugin_config>
      <skin>se.sics.cooja.plugins.skins.IDVisualizerSkin</skin>
      <viewport>3.470503416538505 0.0 0.0 3.470503416538505 169.73140986695321 -105.67037105536838</viewport>
    </plugin_config>
    <width>400</width>
    <z>1</z>
    <height>400</height>
    <location_x>1</location_x>
    <location_y>1</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.LogListener
    <plugin_config>
      <filter />
    </plugin_config>
    <width>1520</width>
    <z>3</z>
    <height>240</height>
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
      <showRadioRXTX />
      <showRadioHW />
      <showLEDs />
      <split>-1</split>
      <zoomfactor>500.0</zoomfactor>
    </plugin_config>
    <width>1920</width>
    <z>5</z>
    <height>166</height>
    <location_x>0</location_x>
    <location_y>879</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.Notes
    <plugin_config>
      <notes>Enter notes here</notes>
      <decorations>true</decorations>
    </plugin_config>
    <width>1240</width>
    <z>4</z>
    <height>160</height>
    <location_x>680</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.ScriptRunner
    <plugin_config>
      <script>TIMEOUT(800000);&#xD;
&#xD;
&#xD;
/* Conf. */&#xD;
motecount=mote.getSimulation().getMotesCount();&#xD;
radiomedium = mote.getSimulation().getRadioMedium();&#xD;
motearrays=mote.getSimulation().getMotes();&#xD;
booted = new Array();&#xD;
motearray=new Array(motecount);&#xD;
motearrayid=new Array(motecount);&#xD;
position=new Array(motecount);&#xD;
storearray=new Array();&#xD;
var i=0,distance,k=0,m=0,count=0,l=0;&#xD;
motetransmissionrange=radiomedium.TRANSMITTING_RANGE* (mote.getInterfaces().getRadio().getCurrentOutputPowerIndicator() / &#xD;
mote.getInterfaces().getRadio().getOutputPowerIndicatorMax());&#xD;
log.log("mote" +motetransmissionrange+ "\n");&#xD;
nodes_starting = true;&#xD;
&#xD;
for(i = 0; i &lt;motecount; i++) {&#xD;
  booted[i] = false;&#xD;
&#xD;
}&#xD;
&#xD;
/* Wait until all nodes have started */&#xD;
while(nodes_starting) {&#xD;
  YIELD_THEN_WAIT_UNTIL(msg.startsWith('Star'));&#xD;
  &#xD;
  log.log("Node " + id + " booted\n");&#xD;
  booted[id] = true;&#xD;
&#xD;
  for(i = 1; i &lt;=motecount; i++) {&#xD;
    if(!booted[i]) {&#xD;
      break;&#xD;
    } &#xD;
   &#xD;
    if(i == motecount) {&#xD;
      nodes_starting = false;&#xD;
    }&#xD;
  }&#xD;
}&#xD;
log.log("All nodes booted.\n");&#xD;
while(true) {&#xD;
  YIELD();&#xD;
  /* Count sensor data packets */&#xD;
&#xD;
  log.log("Received:\n");&#xD;
  for(i=0;i&lt;motecount;i++)&#xD;
{&#xD;
     motearrayid[i]=motearrays[i].getID();&#xD;
     storearray[i]=new Array();&#xD;
  for(j=0,k=0;j&lt;motecount;++j,++k)&#xD;
  {&#xD;
      position[j]=motearrays[i].getInterfaces().getPosition().getDistanceTo(motearrays[j]);&#xD;
      if(position[j]&lt;=motetransmissionrange)&#xD;
          {&#xD;
              &#xD;
              count++;  &#xD;
            &#xD;
                storearray[i][k]=motearrays[j].getID();&#xD;
                write(motearrays[i],storearray[i][k]);&#xD;
              &#xD;
           }&#xD;
           else&#xD;
           --k;&#xD;
 &#xD;
      &#xD;
      }&#xD;
               &#xD;
       if(k&gt;count)&#xD;
     {&#xD;
     k=0;&#xD;
     &#xD;
     }&#xD;
            &#xD;
      for(m=0;m&lt;count;m++)&#xD;
     {&#xD;
         log.log("i"+i+" " +"m"+ m +"  "+ "array"+""+storearray[i][m]+"\n");&#xD;
     }&#xD;
     &#xD;
    count=0;&#xD;
  &#xD;
      &#xD;
 }&#xD;
 &#xD;
   &#xD;
  }</script>
      <active>false</active>
    </plugin_config>
    <width>600</width>
    <z>0</z>
    <height>700</height>
    <location_x>150</location_x>
    <location_y>150</location_y>
  </plugin>
</simconf>

