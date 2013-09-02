#include <stdio.h>
#include <string.h>
#include "firewall.h"
#define DEBUG DEBUG_PRINT
#include "net/uip-debug.h"
#include "net/uip-icmp6.h"
#include "net/uip-ds6.h"
#include "net/uip.h"
#include "contiki-net.h"
#include "../apps/ids-common/ids-common.h"
#include "../apps/er-coap-07/er-coap-07.h" 

/*struct individual_ip_record_table_state
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
 
};
struct recorded_state_table
{
	uint16_t connection_statemode;
        struct individual_ip_record_table_state *individualconnections[incoming_allowed_connections];
	int connection;//connection established or not
	uint8_t id;
	uint8_t connection_id;//number of conections for that particular address
       // LIST_STRUCT(good_connection_sourceaddress);
          LIST_STRUCT(Unauthorized_connection);
};*/

//static int    already_visited_address;
//static int packet_count=0;
static struct  recorded_state_table stored_connections[incoming_allowed_connections];
static struct  individual_ip_record_table_state invidual_entry [incoming_allowed_connections];
static struct etimer displaytimer;
//static int counter_used;
int i=0;

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
                          	//TODO :Check for muticast address and block mask the subnetaddress 
				printf("invalid address types");
			//	goto drop;
                          }

                     }
             }

 return 1;
}

int udp_source_port_mismatch()
{
         if(uip_htons(UIP_UDP_BUF->srcport) <1024 && uip_htons(UIP_UDP_BUF->destport) == 0)
              {
                                   
			//TODO : goto drop
                      printf("invalid port number\n");
		     
                  
              }
    return 1;

}



int firewall_valid_packet(void) 
{

	
     
       if( UIP_IP_BUF->ttl == 0)
        return;
        //already_visited_address=1;	
	//stored_connections->individualconnections[i]->visited_address=1;

	if(UIP_IP_BUF->proto == (uip_htons(UIP_PROTO_NONE)))
       	return;

        
       
/*	if(stored_connections->individualconnections[i]->visited_address)
	{
		//TODO : check for the destination address centric like if(destination_already_vonnection ->connectoin +1
        		stored_connections->individualconnections[i]->number_of_connections+=1;
			
	}
	else
	{
				stored_connections->individualconnections[i]->visited_address=1;
        	       	stored_connections->individualconnections[i]->number_of_connections+=1;
	}

        // TODO : Check in the list of black listed adresses before entering the protocol suite to save time */

//for(;i<=incoming_allowed_connections;i++)
//{
 
/*   if( stored_connections->individualconnections[i]->visited_address)
   return;*/



      	
	switch(UIP_IP_BUF->proto)
     	{
     	   
             case UIP_PROTO_UDP: 
              printf("proto:UDP %d \n",UIP_IP_BUF->proto);
              printf("\n src:");
             // uip_debug_ipaddr_print(&UIP_IP_BUF->srcipaddr);
              PRINT6ADDR(&UIP_IP_BUF->srcipaddr); // printf("\t");
              printf("destination : ");
              PRINT6ADDR(&UIP_IP_BUF->destipaddr);     
          /*    printf("source port no %d\n ",uip_htons(UIP_UDP_BUF->srcport));  
              printf("destination port %d \n",uip_htons(UIP_UDP_BUF->destport));*/
		
                
	      switch(uip_htons(UIP_UDP_BUF->destport))//stored_connections->individualconnections[i]->destination_port)
	      {
	     	
	      case 5683:  
        // if(message[0]->type == COAP_TYPE_CON) 
    //    if(coap_packet_t->type == COAP_TYPE_CON)
      //      if(coap_req->type == COAP_TYPE_CON)
               printf("hi");
               else
               printf("hello");
	      	//static coap_packet_t request[1];
	//	send_ping(&UIP_IP_BUF->destipaddr);
               stored_connections->individualconnections[i]->remote_address=&UIP_IP_BUF->srcipaddr;
               stored_connections->individualconnections[i]->destination_address=&UIP_IP_BUF->destipaddr;
               stored_connections->individualconnections[i]->number_of_connections+=1;
               stored_connections->individualconnections[i]->visited_address=1;
  
	      break;	

	      case 4443:
	      break;	

          

              }

             
        case UIP_PROTO_ICMP6:


         printf("proto:ICMP %d \n",UIP_IP_BUF->proto);
        printf("src ");
        PRINT6ADDR(&UIP_IP_BUF->srcipaddr);
        printf("\n");
        printf("destination ");
        PRINT6ADDR(&UIP_IP_BUF->destipaddr);
        printf("\n");
        PRINTF("type %d \n ",UIP_ICMP_BUF->type);

	switch(UIP_ICMP_BUF->type)

	{
	
	case ICMP6_ECHO_REQUEST :

	case ICMP6_ECHO_REPLY   :
	

	case ICMP6_RS           :
                             
	case ICMP6_RA           :               
 	
	case ICMP6_NS           :
                       
	case ICMP6_NA           :
                 
	case ICMP6_REDIRECT     :
               
	case ICMP6_RPL          :
	
	break; 
        
        
               
	}

      break;
  
    
// }
}


 if(address_mismatch() && udp_source_port_mismatch() )
   {

 stored_connections->individualconnections[i]->number_of_bad_reported_connections+=1;

    }
   else
  {
            stored_connections->individualconnections[i]->number_of_succesful_connections+=1;
 }
 
  return 1;
  }

void firewall_init(void) {
  PRINTF("Initializing firewall!\n");
  memset(stored_connections, 0, sizeof(stored_connections));
  memset(invidual_entry, 0, sizeof(invidual_entry));
  }
