#include <signal.h>
#include <unistd.h>

static void sigdown(int signo) {
  (void)signo;
  _exit(0);
}

int main(void) {
  signal(SIGINT, sigdown);
  signal(SIGTERM, sigdown);
  for (;;)
    pause();
  return 0;
}
