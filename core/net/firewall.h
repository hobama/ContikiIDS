#ifndef __FIREWALL_BR_H__
#define __FIREWALL_BR_H__

#include "net/uip.h"
//dharmini
//#include "net/uipopt.h"
//#include "net/uip-icmp6.h"
//#include "net/uip-nd6.h"
//#include "net/uip-ds6.h"

#define SMALL_FILTERS 10
#define GLOBAL_FILTERS 10
#define incoming_allowed_connections 10
//#define successful_connections 10
//#define dropped_packets 7


// UIP_IP_BUF ((struct uip_ip_hdr *)&uip_buf[UIP_LLH_LEN])

#define FILTER_UNUSED 0
#define FILTER_USED 1

#define UIP_IP_BUF ((struct uip_ip_hdr *)&uip_buf[UIP_LLH_LEN])
#define UIP_UDP_BUF  ((struct uip_udp_hdr *)&uip_buf[uip_l2_l3_hdr_len])
#define UIP_ICMP_BUF ((struct uip_icmp_hdr *)&uip_buf[uip_l2_l3_hdr_len])
//dharmini



//uint16_t compress_ipaddr_t(uip_ipaddr_t * ipaddr) {
//  return ipaddr->u16[7];
// }



/**
 * A structure to describe filters towards specific destinations
 */
struct small_filter {
  uip_ipaddr_t src;
  uint16_t dest;
  uint8_t state;
};

static int small_index;
static int global_index;

static struct small_filter filters_small[SMALL_FILTERS];
static uip_ipaddr_t filters_global[GLOBAL_FILTERS];

int firewall_valid_packet(void);

void firewall_init(void);

uint16_t compress_ipaddr_t(uip_ipaddr_t *);

#endif
