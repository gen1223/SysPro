#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

void handler(int sig) {
//  safe_printf("You think ctrl-c will stop the bomb?\n");
  printf("You think ctrl-c will stop the bomb?\n");
  sleep(2);
//  safe_printf("Well...");
  printf("Well...");
  sleep(1);
  printf("OK\n");
  exit(0);
}

main() {
  signal(SIGINT, handler); /* installs ctl-c handler */
  while(1) {
  }
}
