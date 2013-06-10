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

//#define FILTER_UNUSED 0
//#define FILTER_USED 1

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
 
};
struct recorded_state_table
{
	uint16_t connection_statemode;
        struct individual_ip_record_table_state *individualconnections[incoming_allowed_connections];
	int connection;//connection established or not
	uint8_t id;
	uint8_t connection_id;//number of conections for that particular address
       // LIST_STRUCT(good_connection_sourceaddress);
     //     LIST_STRUCT(Unauthorized_connection);
};

static int small_index;
static int global_index;

static struct  recorded_state_table stored_connections[incoming_allowed_connections];
static struct  individual_ip_record_table_state invidual_entry [incoming_allowed_connections];


/*static struct small_filter filters_small[SMALL_FILTERS];
static uip_ipaddr_t filters_global[GLOBAL_FILTERS];*/

int firewall_valid_packet(void);

void firewall_init(void);

uint16_t compress_ipaddr_t(uip_ipaddr_t *);

#endif
