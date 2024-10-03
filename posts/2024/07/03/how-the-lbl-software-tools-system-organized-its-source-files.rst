.. title: How the LBL Software Tools system organized its source files
.. slug: how-the-lbl-software-tools-system-organized-its-source-files
.. date: 2024-07-03 16:20:40 UTC-04:00
.. tags: swtools,lbltools,vos,source file structure,decus,vax,vms,lt86 tape
.. category: computer/software-tools
.. link: 
.. description: 
.. type: text

.. role:: file(literal)

One of the things I've always found interesting about the LBL Software
Tools VOS was how its source files were structured.  I'll include here
page 10 of the release notes from the release on the DECUS LT86 tape:

.. code:: 


                               Release Notes


                           Source File Structure

   The  source  code  for  `tool' is contained in a file [...SRC]tool.tcs
   (if   the   tool   is   portable   across   operating   systems)    or
   [...VMS]tool.tcs  (if  it  is  an VMS-specific tool).  This TCS source
   file contains an edit history of all changes made to the source.   The
   output  of  the  `get' utility operating on a `.tcs' file results in a
   file (tool.w) which is all of the  environment  necessary  to  rebuild
   the  tool,  provided  that the VOS is operational.  The tool.w file is
   an archive containing:

     1. All of the files "included" by the ratfor source code. 
     2. The ratfor source file, tool.r. 
     3. The format input for the manual entry, tool.fmt. 
     4. And optionally,  any  extra  definition  files  needed  to  build
        alternate versions of the tool (eg. sh => hsh). 

   As  an  example,  suppose  that  you  wish  to  change  the subroutine
   "module" in "tool".  The suggested scenario is as follows:

      $ !Fetch the file tool.tcs from the appropriate directory in the container
      $ !file on tape into st_src
      $ hsh
      % get ~src/tool.tcs tool.w
      % ar xv tool.w
      % ar xv tool.r module
      % ed module
      (make changes and write file)
      % ar uv tool.r module
      % rc -v tool.r
      % (test out new tool.  repeat last three steps until satisfied.)
      % ed tool.fmt
      (modify writeup to reflect changes)
      % ar uv tool.w tool.r tool.fmt
      % cp tool.exe ~usr/tool.exe
      % delta tool.w ~src/tool.tcs
      (Identify in the comments the reason for the changes,
      and which modules changed.)
      % format tool.fmt >tool
      % ar uv ~man/s1 tool
      % asam <~man/s1 | sort >~man/i1

   Placing tool.exe in ~usr  causes  the  shell  to  find  your  modified
   version  of  "tool"  rather  than  the  distributed one.  The last two
   commands  above  cause  the  manual  entry  for  `tool'  to  correctly
   correspond to the utility itself. 






                                    -10-

(It should be :code:`% get ~src/tool.tcs >tool.w` with a “>”
before :file:`tool.w` in the above procedure.  Otherwise the contents
are echoed to the terminal instead of being written to :file:`tool.w`\
.)

So, all the source files (source code *and* documentation) are stored
in an archive file, which contains another archive file that has just
the ratfor source, from which you extract the modules you want to work
on, and at the end update the archives in the reverse order!  This
made organizing all the source much simpler, especially considering
some of the porting targets for this software didn't have hierarchical
directory structures, only flat directories.  So when moving around
parts of the system, like when you were preparing the distribution,
you normally only dealt with the top level archives, the :file:`.TCS`
files, and only worked directly with the files that were contained
within that archive and its child archives if you had to make a change
to the source files.  Very clever!

.. image:: /images/Russian-Matroshka.jpg
   :alt: Nesting Russian Matroshka dolls

(`Source 1 <https://en.wikipedia.org/wiki/Matryoshka_doll#/media/File:Russian-Matroshka.jpg>`_)

.. image:: /images/Russian-Matroshka-opened.jpg
   :alt: Nesting Russian Matroshka dolls, opened

(`Source 2 <https://en.wikipedia.org/wiki/Matryoshka_doll#/media/File:Matryoshka_transparent.png>`_)
