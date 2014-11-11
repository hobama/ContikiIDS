#ifndef __RPL_COLLECT_PROJECT_CONF__
#define __RPL_COLLECT_PROJECT_CONF__
#define CSMA_CONF_MAX_NEIGHBOR_QUEUES 4
#undef NETSTACK_CONF_RDC
/* No duty cycling */
//#define NETSTACK_CONF_RDC     nullrdc_driver
/* Duty cycling with ContikiMAC */
#define NETSTACK_CONF_RDC     contikimac_driver
/* For high throughput case */
//#define NETSTACK_CONF_RDC     nullrdcfast_driver


#endif
