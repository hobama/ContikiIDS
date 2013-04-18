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

//void *appdata;
//uint16_t destination;
//uip_ipaddr_t source;
//uip_next_hdr = &UIP_IP_BUF->proto;

uint16_t compress_ipaddr_t(uip_ipaddr_t * ipaddr) {
  return ipaddr->u16[7];
 }

int firewall_valid_packet(void) {

//*uip_next_hdr = &UIP_IP_BUF->proto;

//printf("reached udp %d",*uip_next_hdr);

//if(*uip_next_hdr== UIP_PROTO_UDP)
//{
//printf("reached");
//}
 // printf("%dproto\n", &UIP_IP_BUF->proto);
  int i;
  for (i = 0; i < GLOBAL_FILTERS; ++i) {
	    //printf("%dproto\n", &UIP_IP_BUF->proto);
    PRINT6ADDR(&UIP_IP_BUF->srcipaddr);
	    printf("\n");
	    printf("proto %d \n",UIP_IP_BUF->proto);
    
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
