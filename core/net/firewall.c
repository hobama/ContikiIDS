#include <stdio.h>
#include <string.h>
#include "firewall.h"
#define DEBUG DEBUG_PRINT
#include "net/uip-debug.h"
//dharmini
#include "net/uipopt.h"
#include "net/uip-icmp6.h"
#include "net/uip-nd6.h"
#include "net/uip-ds6.h"
#include "net/uip.h"
#include "contiki-net.h"
#include "../apps/ids-common/ids-common.h"
//#include "er-coap-13-engine.h"
#include "../apps/er-coap-07/er-coap-07.h" 
//#include "../apps/er-coap-07/er-coap-07-engine.h"
//#include "erbium.h"
//#include "../apps/rest-coap/coap-common.h"
//#include "../apps/er-coap-07/er-coap-07-engine.h"
#include "../apps/erbium/erbium.h"
/*#define UIP_IP_BUF ((struct uip_ip_hdr *)&uip_buf[UIP_LLH_LEN])
#define UIP_UDP_BUF  ((struct uip_udp_hdr *)&uip_buf[uip_l2_l3_hdr_len])
#define UIP_ICMP_BUF ((struct uip_icmp_hdr *)&uip_buf[uip_l2_l3_hdr_len])*/
//handle acknoledgements 2. add lists 3. finetune evaluation for coap
struct individual_ip_record_table_state
{
	uip_ipaddr_t *remote_address;
        uip_ipaddr_t *destination_address;
        uint16_t remote_port;
        uint16_t destination_port;
       	uint8_t number_of_connections;
	uint8_t number_of_succesful_connections;
	uint8_t number_of_bad_reported_connections;
	uint8_t visited_address;
        uint8_t connection_status;
  //      struct individual_ip_record_table_state *individual_ip_record_table_states;
};
	static coap_packet_t request[1];

struct recorded_state_table
{
	uint16_t connection_statemode;
        struct individual_ip_record_table_state *individualconnections[incoming_allowed_connections];
	int connection;//connection established or not
	uint8_t id;
	uint8_t connection_id;//number of conections for that particular address
  //      struct recorded_state_table *state_table;
        LIST_STRUCT(good_connection_sourceaddress);
//	LIST_STRUCT(bad_connection_sourceaddress);
};

static int    already_visited_address;
static unsigned int packet_count=0;
static struct  recorded_state_table stored_connections[incoming_allowed_connections];
static struct  individual_ip_record_table_state invidual_entry [incoming_allowed_connections];
//static int counter_used;

uint16_t compress_ipaddr_t(uip_ipaddr_t * ipaddr) {
  return ipaddr->u16[7];
 } 


int address_mismatch()
{
   if (uip_ipaddr_cmp(&UIP_IP_BUF->srcipaddr,&UIP_IP_BUF->destipaddr))
              {
                 if(uip_is_addr_loopback(&UIP_IP_BUF->srcipaddr))
                     {
                        if(uip_is_addr_unspecified(&UIP_IP_BUF->srcipaddr))
                          {
                                printf("invalid address types");
                          }

                     }
             }

 return 1;
}

int udp_source_port_mismatch()
{
         if(uip_htons(UIP_UDP_BUF->srcport) <1024 && uip_htons(UIP_UDP_BUF->destport) == 0)
              {
                if(uip_htons(UIP_UDP_BUF->srcport) && uip_htons(UIP_UDP_BUF->destport))
                   {
			//TODO : goto drop
                      printf("invalid port number\n");
                  }
              }
    return 1;

}



int firewall_valid_packet(void) 
{

	static int i=0;

     //   already_visited_address=1;	
	packet_count=packet_count+1;
	//stored_connections->individualconnections[i]->visited_address=1;

	if(stored_connections->individualconnections[i]->visited_address)
	{
		if(already_visited_address)
			{
		//TODO : check for the destination address centric like if(destination_already_vonnection ->connectoin +1
        		stored_connections->individualconnections[i]->number_of_connections=stored_connections->individualconnections[i]->number_of_connections+1;
			}
	}
	else
	{
			stored_connections->individualconnections[i]->visited_address=1;
        	        already_visited_address=1;	
			stored_connections->individualconnections[i]->number_of_connections=stored_connections->individualconnections[i]->number_of_connections+1;
	}

        // TODO : Check in the list of black listed adresses before entering the protocol suite to save time 
 
        if(UIP_IP_BUF->proto == (uip_htons(UIP_PROTO_NONE)))
 	return;
	
	switch(UIP_IP_BUF->proto)
     	{
     	     case UIP_PROTO_UDP: 

	      if(address_mismatch())
		{
			if(already_visited_address)
				{
	    				stored_connections->individualconnections[i]->connection_status=0;
					stored_connections->connection_statemode=0;
					  //TODO : add them in the blacklisted list

						//TODO check the udp data length and checksum for all of the three
					  //goto : drop
	      				return; 
				}
		}	
              stored_connections->individualconnections[i]->remote_address=&UIP_IP_BUF->srcipaddr;
              stored_connections->individualconnections[i]->destination_address=&UIP_IP_BUF->destipaddr;
  	      stored_connections->individualconnections[i]->number_of_connections=1;
	      
              // stored_connections->individualconnections[i]->visited_address=1;
                  //      already_visited_address=1;     
             printf("proto:UDP %d \n",UIP_IP_BUF->proto);
             printf("\n src:");
             uip_debug_ipaddr_print(&UIP_IP_BUF->srcipaddr);
            // PRINT6ADDR(&UIP_IP_BUF->srcipaddr); // printf("\t");
              printf("\ndestination : ");
              PRINT6ADDR(&UIP_IP_BUF->destipaddr);     
              printf("\nsource port no %d ",uip_htons(UIP_UDP_BUF->srcport));  
              printf("\ndestination port %d \n",uip_htons(UIP_UDP_BUF->destport));
            
               if(udp_source_port_mismatch())
		{
			//TODO : add the address in the blacklisted list
					  //got : drop
			stored_connections->individualconnections[i]->connection_status=0;
			 printf("not valid");
  			
		}
	     
	      stored_connections->individualconnections[i]->remote_port=uip_htons(UIP_UDP_BUF->srcport);
              stored_connections->individualconnections[i]->destination_port=uip_htons(UIP_UDP_BUF->destport);
              
	      switch(stored_connections->individualconnections[i]->destination_port)
	      {
	     	
	      case 5683:

	      break;	

	      case 4443:
	      break;	
              }
 
           
              /*if(stored_connections->individualconnections[i]->destination_port=uip_htons(UIP_UDP_BUF->destport)= 5683)
              {
                 
              
              }
              else if(UIP_UDP_BUF->destport == 4443)
                   {
 		      printf("DTLS request");
                   }   */
	stored_connections->individualconnections[i]->connection_status=1;
	
        break;
           
        case UIP_PROTO_ICMP6:
        printf("proto:ICMP %d \n",UIP_IP_BUF->proto);
        printf("\n src");
        PRINT6ADDR(&UIP_IP_BUF->srcipaddr);
        printf("\ndestination ");
        PRINT6ADDR(&UIP_IP_BUF->destipaddr);
        switch(UIP_ICMP_BUF->type)
	{



	}
        printf("\n type %d \n ",UIP_ICMP_BUF->type);
        break;
    
    
}
  if(address_mismatch() && udp_source_port_mismatch() )
   {

stored_connections->individualconnections[i]->number_of_bad_reported_connections=stored_connections->individualconnections[i]->number_of_bad_reported_connections+1;

    }
   else
{
stored_connections->individualconnections[i]->number_of_succesful_connections=stored_connections->individualconnections[i]->number_of_succesful_connections+1;
}

++i;

   return 0;
}
void firewall_init(void) {
  PRINTF("Initializing firewall!\n");
  memset(filters_small, 0, sizeof(filters_small));
  memset(filters_global, 0, sizeof(filters_global));
  small_index = 0;
  global_index = 0;
}
