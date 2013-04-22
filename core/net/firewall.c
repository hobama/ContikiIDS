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
#include "../apps/ids-common/ids-common.h"
/*#define UIP_IP_BUF ((struct uip_ip_hdr *)&uip_buf[UIP_LLH_LEN])
#define UIP_UDP_BUF  ((struct uip_udp_hdr *)&uip_buf[uip_l2_l3_hdr_len])
#define UIP_ICMP_BUF ((struct uip_icmp_hdr *)&uip_buf[uip_l2_l3_hdr_len])*/

uint16_t compress_ipaddr_t(uip_ipaddr_t * ipaddr) {
  return ipaddr->u16[7];
 } 

struct recorded_state_table
{
	uip_ipaddr_t *remote_address;
	uip_ipaddr_t *local_destination_address;
	uint16_t remote_port;
	uint16_t destination_port;
	uint16_t connection_statemode;
	int connection;
	uint16_t id;
};

struct individual_ip_record_table_state
{
	uip_ipaddr_t *remort_address;
	uip_ipaddr_t *destination_address;
	uint8_t number_of_connections;
	uint8_t number_of_succesful_connections;
	uint8_t number_of_bad_reported_connections;
};



int firewall_valid_packet(void) {
  int i;
  for (i = 0; i < GLOBAL_FILTERS; ++i) {
     
     switch(UIP_IP_BUF->proto)
     {
        case UIP_PROTO_UDP: 

              printf("proto:UDP %d \n",UIP_IP_BUF->proto);
              printf("src: ");
              PRINT6ADDR(&UIP_IP_BUF->srcipaddr);
              printf("\t");
              printf("destination :\n");
              PRINT6ADDR(&UIP_IP_BUF->destipaddr);       
              printf("source port no %d\n",UIP_UDP_BUF->srcport);     
              printf("destination port %d \n",UIP_UDP_BUF->destport);
      
        break;
           
        case UIP_PROTO_ICMP6:
       
        printf("proto:ICMP %d \n",UIP_IP_BUF->proto);
        printf("src");
        PRINT6ADDR(&UIP_IP_BUF->srcipaddr);
        printf("destination");
        printf("\n");
        PRINT6ADDR(&UIP_IP_BUF->destipaddr);
        printf("type %d \n ",UIP_ICMP_BUF->type);
        break;
}
/*    PRINT6ADDR(&UIP_IP_BUF->srcipaddr);
	    printf("\n");
	    printf("proto %d \n",UIP_IP_BUF->proto);
     if(UIP_IP_BUF->proto == 58)
      {
          printf("type %d \n ",UIP_ICMP_BUF->type); 
      }*/
    
    if (uip_ipaddr_cmp(&UIP_IP_BUF->srcipaddr, &filters_global[i])) {
      PRINTF("dropping packet, global filter\n");
      return 0;
    }
  }
  for (i = 0; i < SMALL_FILTERS; ++i) {
    if (filters_small[i].state != FILTER_UNUSED &&
        uip_ipaddr_cmp(&UIP_IP_BUF->srcipaddr, &filters_small[i].src) &&
        compress_ipaddr_t(&UIP_IP_BUF->destipaddr) == filters_small[i].dest) {
      PRINTF("dropping packet, small filter\n");
      return 0;
    }
  }
  PRINTF("Packet going through firewall\n");
  return 1;
}

void firewall_init(void) {
  PRINTF("Initializing firewall!\n");
  memset(filters_small, 0, sizeof(filters_small));
  memset(filters_global, 0, sizeof(filters_global));
  small_index = 0;
  global_index = 0;
}
