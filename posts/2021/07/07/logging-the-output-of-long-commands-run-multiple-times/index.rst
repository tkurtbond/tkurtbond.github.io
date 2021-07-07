.. title: Logging the output of long commands run multiple times
.. slug: logging-the-output-of-long-commands-run-multiple-times
.. date: 2021-07-07 12:47:25 UTC-04:00
.. tags: logging,bash,unix
.. category: computer/unix
.. link: 
.. description: 
.. type: text

.. role:: file
.. role:: command
.. role:: program

I often run commands that produce a lot of output that needs to saved
for debugging, and often the commands have to be repeated multiple
times to get things to work.  For example, building software from
source, often using the familiar ``./configure; make; make install``
paradigm.

So, the first thing is to try is to use the venerable :command:`tee` command.

.. code:: bash

   ./configure 2>&1 | tee Log.configure
   make 2>&1 | tee Log.make
   make install 2>&1 | tee Log.make-install

To make the log files easy to find I use a :file:`Log.` prefix.

But I often need to run the commands multiple times, and want to save
each run under a new filename, so if the filename already exists I
want to add a number to the end and then increment the number until I
find one that hasn't been used.  And I'd like the filename to have the
date in YYYY-MM-DD format, so the resulting names look like
:file:`Log.make-install-2021-07-07_2`.

So I wrote a bash function :command:`incf` (increment filename) to put in
:file:`.bashrc` that generates such a name:

.. code:: bash

   incf () {
       # Construct a filename from PREFIX, "_YYYY-MM-DD",  optionally _N (where N
       # is 1 or greater) if the filename already exists, and optionally SUFFIX.
       # Example: "incf file .tar.gz" results in "file_2021-07-07.tar.gz", or
       # "file_2021-07-07_N.tar.gz" if "file_2021-07-07.tar.gz" already exists,
       # where N is 1 or greater.

       # Need getopts to match python version.  But it is only for verbose, so no?
       local prefix suffix fileprefix i testname sep1 sep2
       prefix="$1"
       suffix="$2"
       sep1="_"
       sep2="_"
       fileprefix="${prefix}${sep1}$(date +%F)"
       let i=0
       # The zeroth filename doesn't have the number.
       testname="${fileprefix}${suffix}"
       while true
       do
         [ ! -e "$testname" ] && break
         ((i++))
         testname="${fileprefix}${sep2}${i}${suffix}"
       done
       echo "$testname"
   }
   
And then I wrote a bash function that uses :command:`incf` to generate
the :file:`Log.` filename, potentially in a different directory:

.. code:: bash

   logf () {
       # Construct a filename, possibly in another directory, that starts with
       # "Log." and ends with "YYYY-MM-DD" and optionally "_N", where N is 1 or
       # greater, if the filename already exists.
       local dn bn fn
       dn="$(dirname "$1")"
       bn="Log.$(basename "$1")"
       fn="$(incf "$dn/$bn")"
       echo $fn
   }

And then I wrote a :command:`log` command that uses :command:`logf`
and tees its input into that file:

.. code:: bash

   log () {
       tee $(logf "$1")
   }


So running ``./configure 2>&1 | log ~/tmp/configure`` generates a file
:file:`Log.configure_2021-07-07` in the :file:`~/tmp` directory.

But what if I specify a lot of options to the command, and would like
record if it in the log file, so if I get interrupted and then come
back some time later I can use the same command?  So I wrote a bash
function, :command:`exlog`, to use the whole command with its options as part
of the filename, and also include it in the log output:

.. code:: bash

   function exlog {
       # Execute a shell command and log it to "Log.<cmd-as-safe-filename>"
       local cmd="$*" name
       name=$(echo "$cmd" | sed 's/[ =";?*&^%$#@!~`|()<>]/-/g' | \
                  sed "s#[/']#-#g" | sed -E 's/--+/-/g' | \
                  sed -E 's/(^[-.]+|-+$)//g' | \
                  sed -E 's/\.\.\.*/./g')
        # By now name should have no spaces, so the following is safe.
       name="$(logf $name)"
       printf 'Logging to %s\n' "$name"
       (echo "cmd was: $cmd"; time "$@") 2>&1 | tee $name
   }

So running the command

.. code:: bash

   exlog ../configure --prefix=/Users/tkb/sw/versions/groff/git

produces the file 

.. code::

   Log.configure-prefix-Users-tkb-sw-versions-groff-git_2021-07-07

and it contains the line 

.. code::

   cmd was: ../configure --prefix=/Users/tkb/sw/versions/groff/git

and running it again produces the file

.. code:: 

   Log.configure-prefix-Users-tkb-sw-versions-groff-git_2021-07-07_1
