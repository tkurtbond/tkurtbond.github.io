/* Demonstrate lisp-style trampolines. */
#include <stdio.h>

typedef trampoline* (*trampoline)(void);

void *
baz (void)
{
  printf ("baz\n");
  return NULL;
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
