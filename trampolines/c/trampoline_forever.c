/* Recurse forever without running out of stack spacc. */
#include <stdio.h>

typedef void* (*trampoline)(void);

void *foo (void);               /* Forward declaration. */

void *
baz (void)
{
  printf ("baz\n");
  return foo;
}

void *
bar (void)
{
  printf ("bar\n");
  return baz;
}

void *
foo (void)
{
  printf ("foo\n");
  return bar;
}


int
main (int argc, char **argv)
{
  trampoline t = foo;
  while (t)
    t = t ();
  return 0;
}
