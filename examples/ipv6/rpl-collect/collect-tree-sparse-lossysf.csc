<?xml version="1.0" encoding="UTF-8"?>
<simconf>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/mrm</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/mspsim</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/avrora</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/serial_socket</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/collect-view</project>
  <project EXPORT="discard">[CONTIKI_DIR]/tools/cooja/apps/powertracker</project>
  <simulation>
    <title>Collect-tree sparse lossy</title>
    <randomseed>123456</randomseed>
    <motedelay_us>1000000</motedelay_us>
    <radiomedium>
      se.sics.cooja.radiomediums.UDGM
      <transmitting_range>50.0</transmitting_range>
      <interference_range>50.0</interference_range>
      <success_ratio_tx>1.0</success_ratio_tx>
      <success_ratio_rx>0.0</success_ratio_rx>
    </radiomedium>
    <events>
      <logoutput>40000</logoutput>
    </events>
    <motetype>
      se.sics.cooja.mspmote.SkyMoteType
      <identifier>sky1</identifier>
      <description>Sky Mote Type #sky1</description>
      <source EXPORT="discard">[CONFIG_DIR]/udp-sink.c</source>
      <commands EXPORT="discard">make udp-sink.sky TARGET=sky</commands>
      <firmware EXPORT="copy">[CONFIG_DIR]/udp-sink.sky</firmware>
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
      <source EXPORT="discard">[CONFIG_DIR]/udp-sender.c</source>
      <commands EXPORT="discard">make udp-sender.sky TARGET=sky</commands>
      <firmware EXPORT="copy">[CONFIG_DIR]/udp-sender.sky</firmware>
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
        <x>243.66742822467532</x>
        <y>-87.57448358472001</y>
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
        <x>205.54612288151844</x>
        <y>-59.800389691848565</y>
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
        <x>250.7470992169759</x>
        <y>-59.800389691848565</y>
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
        <x>294.4736028715864</x>
        <y>-63.23792146675066</y>
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
        <x>176.19481691449084</x>
        <y>-35.26658694986995</y>
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
        <x>222.54731411389315</x>
        <y>-32.869043991280165</y>
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
        <x>273.694897230475</x>
        <y>-29.672320046493798</y>
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
        <x>321.64575640227054</x>
        <y>-33.66822497747676</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>8</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>159.4120162043624</x>
        <y>-2.500166515809672</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>9</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>196.97352255560222</x>
        <y>-0.10262355721989598</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>10</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>252.91619158936365</x>
        <y>1.495738415173288</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>11</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>301.66623174735577</x>
        <y>-0.10262355721989598</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>12</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>346.4203669743649</x>
        <y>1.495738415173288</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>13</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>124.24805281171236</x>
        <y>22.27444405628468</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>14</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>180.1907218454738</x>
        <y>35.86052082162674</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>15</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>224.14567608628633</x>
        <y>30.266253918250598</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>16</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>276.0924401890648</x>
        <y>35.86052082162674</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>17</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>351.2154528915445</x>
        <y>37.45888279401993</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>18</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>89.08408941906231</x>
        <y>47.04905462837903</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>19</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>180.1907218454738</x>
        <y>75.02038914525976</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>20</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>245.7235627135943</x>
        <y>66.22939829709723</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>21</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>290.4776979406035</x>
        <y>67.82776026949043</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>22</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>370.3957965602627</x>
        <y>64.63103632470406</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>23</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>93.07999435004527</x>
        <y>82.21301802102909</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>24</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
    <mote>
      <breakpoints />
      <interface_config>
        se.sics.cooja.interfaces.Position
        <x>204.16615143137156</x>
        <y>106.18844760692684</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        se.sics.cooja.mspmote.interfaces.MspMoteID
        <id>25</id>
      </interface_config>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>
  </simulation>
  <plugin>
    se.sics.cooja.plugins.SimControl
    <width>259</width>
    <z>2</z>
    <height>184</height>
    <location_x>0</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.Visualizer
    <plugin_config>
      <skin>se.sics.cooja.plugins.skins.IDVisualizerSkin</skin>
      <skin>se.sics.cooja.plugins.skins.AttributeVisualizerSkin</skin>
      <skin>se.sics.cooja.plugins.skins.UDGMVisualizerSkin</skin>
      <viewport>1.836243522352668 0.0 0.0 1.836243522352668 -124.43273668589376 177.8080782058222</viewport>
    </plugin_config>
    <width>610</width>
    <z>1</z>
    <height>482</height>
    <location_x>93</location_x>
    <location_y>41</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.LogListener
    <plugin_config>
      <filter />
    </plugin_config>
    <width>1347</width>
    <z>5</z>
    <height>150</height>
    <location_x>0</location_x>
    <location_y>438</location_y>
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
      <mote>8</mote>
      <mote>9</mote>
      <mote>10</mote>
      <mote>11</mote>
      <mote>12</mote>
      <mote>13</mote>
      <mote>14</mote>
      <mote>15</mote>
      <mote>16</mote>
      <mote>17</mote>
      <mote>18</mote>
      <mote>19</mote>
      <mote>20</mote>
      <mote>21</mote>
      <mote>22</mote>
      <mote>23</mote>
      <mote>24</mote>
      <showRadioRXTX />
      <split>109</split>
      <zoomfactor>500.0</zoomfactor>
    </plugin_config>
    <width>1347</width>
    <z>3</z>
    <height>150</height>
    <location_x>0</location_x>
    <location_y>588</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.collectview.CollectView
    <mote_arg>0</mote_arg>
    <width>203</width>
    <z>4</z>
    <height>75</height>
    <location_x>120</location_x>
    <location_y>120</location_y>
  </plugin>
  <plugin>
    se.sics.cooja.plugins.ScriptRunner
    <plugin_config>
      <script>TIMEOUT(60000);&#xD;
//while (true) {&#xD;
/*    moteid=mote.getID();&#xD;
position=mote.getInterfaces().getPosition().getDistanceTo(mote.getSimulation().getMoteWithID(1));&#xD;
  log.log(moteid + ": position"+position + "\n");*/&#xD;
motecount=mote.getSimulation().getMotesCount();&#xD;
radiomedium = mote.getSimulation().getRadioMedium();&#xD;
motearrays=mote.getSimulation().getMotes();&#xD;
var motearray=new Array(motecount);&#xD;
var motearrayid=new Array(motecount);&#xD;
var position=new Array(motecount);&#xD;
var distancearray=new Array();&#xD;
var storearray=new Array();&#xD;
var i=0,distance,k=0,m=0,count=0,l=0;&#xD;
motetransmissionrange=radiomedium.TRANSMITTING_RANGE* (mote.getInterfaces().getRadio().getCurrentOutputPowerIndicator() / mote.getInterfaces().getRadio().getOutputPowerIndicatorMax());&#xD;
//String[][] myStringArray = new String [][];&#xD;
//position=mote.getInterfaces().getPosition().getDistanceTo(mote.getSimulation().getMote(2))&#xD;
for(i=0;i&lt;motecount;i++)&#xD;
{&#xD;
     motearrayid[i]=motearrays[i].getID();&#xD;
     storearray[i]=new Array();&#xD;
     &#xD;
  for(j=0,k=0;j&lt;motecount;++j,++k)&#xD;
  {&#xD;
      position[j]=motearrays[i].getInterfaces().getPosition().getDistanceTo(motearrays[j]);&#xD;
      //log.log(position[j]+"\n");&#xD;
     // log.log("ID" +motearrayid[i]+ "the position is " +motearrays[j].getID() +" "+position[j] + "\n");&#xD;
    //  log.log("ivalue"+" "+i+" "+"j valuae "+" "+j+" "+"k value"+" "+k+" "+"ID"+" "+motearrayid[i]+ "the node id is "+" " +motearrays[j].getID()  +"distance"+position[j] + "\n");&#xD;
      if(position[j]&lt;=motetransmissionrange)&#xD;
          {&#xD;
              //log.log("K before increment"+" "+ k +"\n"); &#xD;
              count++;  &#xD;
            // storearray[k]=new Array();&#xD;
           //  storearray[i][k]=position[j];&#xD;
               // storearray[i]=new Array();&#xD;
                storearray[i][k]=motearrays[j].getID();&#xD;
           //log.log("position of i "+" " +i +"position of j is "+" "+j+"position of k is "+" "+ k +"distance is " +position[j] +"element value"+" "+storearray[i][k]+"\n");&#xD;
           //   log.log("position of"+" "+motearrays[j].getID() +"with distance "+" "+position[j] +"\n");&#xD;
         //   log.log("i"+i+" "+"k"+k+" "+"arrays are " +" "+storearray[i][k]+"\n");  &#xD;
            &#xD;
           }&#xD;
           else&#xD;
           --k;&#xD;
     &#xD;
        &#xD;
        &#xD;
       //   k++;  &#xD;
              &#xD;
       //   log.log("K after increment"+" "+ k +"\n"); &#xD;
                 &#xD;
      }&#xD;
      &#xD;
      //log.log("K is " + k + " " +"count"+count+"\n");&#xD;
 &#xD;
       &#xD;
       if(k&gt;count)&#xD;
     {&#xD;
     k=0;&#xD;
     &#xD;
     }&#xD;
    &#xD;
         &#xD;
      for(m=0;m&lt;count;m++)&#xD;
     {&#xD;
         log.log("i"+i+" " +"m"+ m +"  "+ "array"+""+storearray[i][m]+"\n");&#xD;
     }&#xD;
     &#xD;
    // log.log("the count is "+count+"\n");&#xD;
      &#xD;
     &#xD;
     count=0;&#xD;
    /* for(m=0;m&lt;count;m++)&#xD;
     {&#xD;
         log.log(storearray[i][m]+"\n");&#xD;
     }*/&#xD;
      &#xD;
     /* for(k=0;k&lt;=count;k++)&#xD;
      {&#xD;
           storearray[k]=new Array();&#xD;
           storearray[i][k]=position[j];&#xD;
           log.log(storearray[i][k]+"\n");&#xD;
      }*/&#xD;
      &#xD;
      &#xD;
      &#xD;
      &#xD;
      &#xD;
      &#xD;
  }&#xD;
   &#xD;
  &#xD;
 /*radio = mote.getSimulation().getMoteWithID(1).getInterfaces().getRadio();&#xD;
 motearrayid[i]=motearrays[i].getID();&#xD;
 position[i]=mote.getInterfaces().getPosition().getDistanceTo(motearrays[i]);&#xD;
 motetransmissionrange=radiomedium.TRANSMITTING_RANGE* (mote.getInterfaces().getRadio().getCurrentOutputPowerIndicator() / mote.getInterfaces().getRadio().getOutputPowerIndicatorMax());&#xD;
// transmissionrange=radiomedium.getSuccessProbability(mote.getInterfaces().getRadio(),radio);&#xD;
 //log.log(+transmissionrange+ "\n");&#xD;
 //log.log(+motetransmissionrange+ "\n");&#xD;
// log.log("moteid" + motearrayid[i] + "position" + position[i] + "\n");&#xD;
 }*/&#xD;
  YIELD();&#xD;
//}</script>
      <active>false</active>
    </plugin_config>
    <width>1049</width>
    <z>0</z>
    <height>941</height>
    <location_x>597</location_x>
    <location_y>77</location_y>
  </plugin>
</simconf>

