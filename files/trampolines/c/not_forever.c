/* Recurse until stack space runs out.
   Unless the compiler does tail-call optimization. */
#include <stdio.h>

static int i;                 /* Number of times f has been called. */

void f (void)
{
  i++;
  printf ("call #%d\n", i);
  f ();
}

int main (int argc, char **argv)
{
  i = 0;
  f ();
}
