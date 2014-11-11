CONTIKI = ../../../..
APPS = ids-server
#APPS+=powertrace
CONTIKI_PROJECT = network-mapper
PROJECT_SOURCEFILES+= simple-energest.c 



WITH_UIP6=1
UIP_CONF_IPV6=1
UIP_CONF_ICMP6=1
CFLAGS+= -DCONTIKIMAC_CONF_COMPOWER=1 -DUIP_CONF_IPV6_RPL -DUIP_CONF_ICMP6 

CFLAGS += -DPROJECT_CONF_H=\"project-conf.h\"

ifdef PERIOD
CFLAGS=-DPERIOD=$(PERIOD)
endif

all: $(CONTIKI_PROJECT)

include $(CONTIKI)/Makefile.include

