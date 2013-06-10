#include <stdio.h>
#include <string.h>
#include "firewall.h"
#define DEBUG DEBUG_PRINT
#include "net/uip-debug.h"
//dharmini
#include "net/uip-icmp6.h"
#include "net/uip-ds6.h"
#include "net/uip.h"
#include "contiki-net.h"
#include "../apps/ids-common/ids-common.h"
#include "../apps/er-coap-07/er-coap-07.h" 

/* TODO 1.Address selection must not be brocast address unicast address.
	2.check whether the address is subrouted to the netmask of the internal 6lowpan host
	3. add lists 
	4. finetune evaluation for coap
*/

#define PING6_DATALEN 16

#define PING_TIMEOUT 20 * CLOCK_SECOND

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
struct recorded_state_table
{
	uint16_t connection_statemode;
        struct individual_ip_record_table_state *individualconnections[incoming_allowed_connections];
	int connection;//connection established or not
	uint8_t id;
	uint8_t connection_id;//number of conections for that particular address
        LIST_STRUCT(good_connection_sourceaddress);
//	LIST_STRUCT(bad_connection_sourceaddress);
};

static int    already_visited_address;
static unsigned int packet_count=0;
static struct  recorded_state_table stored_connections[incoming_allowed_connections];
static struct  individual_ip_record_table_state invidual_entry [incoming_allowed_connections];
//static int counter_used;

static void
send_ping(uip_ipaddr_t *dest_addr)
{
  static uint16_t count;
  UIP_IP_BUF->vtc = 0x60;
  UIP_IP_BUF->tcflow = 1;
  UIP_IP_BUF->flow = 0;
  UIP_IP_BUF->proto = UIP_PROTO_ICMP6;
  UIP_IP_BUF->ttl = uip_ds6_if.cur_hop_limit;
  uip_ipaddr_copy(&UIP_IP_BUF->destipaddr, dest_addr);
  uip_ds6_select_src(&UIP_IP_BUF->srcipaddr, &UIP_IP_BUF->destipaddr);
  
  UIP_ICMP_BUF->type = ICMP6_ECHO_REQUEST;
  UIP_ICMP_BUF->icode = 0;
  /* set identifier and sequence number to 0 */
  memset((uint8_t *)UIP_ICMP_BUF + UIP_ICMPH_LEN, 0, 4);
  /* put one byte of data */
  memset((uint8_t *)UIP_ICMP_BUF + UIP_ICMPH_LEN + UIP_ICMP6_ECHO_REQUEST_LEN,
	 count, PING6_DATALEN);
  count++;
  
  uip_len = UIP_ICMPH_LEN + UIP_ICMP6_ECHO_REQUEST_LEN + UIP_IPH_LEN + PING6_DATALEN;
  UIP_IP_BUF->len[0] = (uint8_t)((uip_len - 40) >> 8);
  UIP_IP_BUF->len[1] = (uint8_t)((uip_len - 40) & 0x00ff);
  
  UIP_ICMP_BUF->icmpchksum = 0;
  UIP_ICMP_BUF->icmpchksum = ~uip_icmp6chksum();
  
  tcpip_ipv6_output();
}


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

	static int i=0;
        //already_visited_address=1;	
	packet_count=packet_count+1;
	//stored_connections->individualconnections[i]->visited_address=1;

	if(UIP_IP_BUF->proto == (uip_htons(UIP_PROTO_NONE)))
       	return;


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
 
      	
	switch(UIP_IP_BUF->proto)
     	{
     	     case UIP_PROTO_UDP: 

	      if(address_mismatch())
		{
			if(already_visited_address)
				{
					 if(udp_source_port_mismatch())
						{
							//TODO : add the address in the blacklisted list
						  //got : drop
							stored_connections->individualconnections[i]->connection_status=0;
							stored_connections->connection_statemode=0;
                                                        printf("not valid");
  						}
						
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
            
              UIP_UDP_BUF->udpchksum = ~(uip_udpchksum());
	      
	      stored_connections->individualconnections[i]->remote_port=uip_htons(UIP_UDP_BUF->srcport);
              stored_connections->individualconnections[i]->destination_port=uip_htons(UIP_UDP_BUF->destport);
              
	      switch(stored_connections->individualconnections[i]->destination_port)
	      {
	     	
	      case 5683:

	      	static coap_packet_t request[1];


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
       
	/* switch(UIP_ICMP_BUF->type)

	{
	
	case ICMP6_ECHO_REQUEST :

	case ICMP6_ECHO_REPLY   :
	

	case ICMP6_RS           :
                             
	case ICMP6_RA           :               
 	
	case ICMP6_NS           :
                       
	case ICMP6_NA           :
                 
	case ICMP6_REDIRECT     :
               
	case ICMP6_RPL          :
               
	}*/

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
