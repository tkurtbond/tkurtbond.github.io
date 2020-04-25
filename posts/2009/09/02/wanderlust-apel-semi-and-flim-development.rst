.. title: Wanderlust, APEL, FLIM, and SEMI development
.. slug: wanderlust-apel-semi-and-flim-development
.. date: 2009-09-02 09:01:26 UTC-05:00
.. tags: e-mail,wanderlust,flim,semi,apel
.. category: computer/emacs
.. link: 
.. description: 
.. type: text


Someone once said something along the lines that to those in the
Western world who don't speak Japanese there is an alternate
universe of FOSS [#foss]_ development in Japan [#china]_, and every so
often things from that universe just appear in the Western FOSS
universe as mysterious foreign objects.  Ruby seems to have made a
solid connection between the universes, but many others are less
approachable. 

Wanderlust development and the development of the emacs packages that
it depends on (APEL, FLIM, and SEMI) feel like that to me.  Some of
them have web pages, but they're usually quite out of date.  It can be
difficult find to their CVS repositories, and even more difficult to find
the browse-able web interfaces to their CVS repositories.  Every time
I want to look at the code, I have to figure this all out again, hence
this post.

There was a post_ on the Wanderlust English-language mailing list from
Katsumi Yamaoka <yamaoka@jpl.org> on Wednesday, 27 May 2009 that gave
the location of the APEL, FLIM, and SEMI cvs repositories, and
mentioned that development in the FLIM and SEMI repositories was
taking place under the flim_1_14 and semi_1_14 branches, respectively.
The post also said that the place for discussion about APEL is the
APEL mailing lists:

    | apel-en@m17n.org 
    | apel-ja@m17n.org

To subscribe, send an empty e-mail to apel-en-ctl@m17n.org and/or
apel-ja-ctl@m17n.org\ .

The place to discuss FLIM and SEMI is the EMACS-MIME mailing
list:

    | emacs-mime-en@m17n.org 
    | emacs-mime-ja@m17n.org 

To subscribe, send an e-mail containing “subscribe YOUR NAME” in its
contents to emacs-mime-en-ctl@m17n.org and/or
emacs-mime-ja-ctl@m17n.org\ .

So, here are the CVS commands I just used to check the various
packages out:

.. code:: bash

    cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/root checkout wanderlust
    cvs -z9 -d :pserver:anonymous@cvs.m17n.org:/cvs/root checkout apel
    cvs -z9 -d :pserver:anonymous@cvs.m17n.org:/cvs/root checkout -r flim-1_14 flim
    cvs -z9 -d :pserver:anonymous@cvs.m17n.org:/cvs/root checkout -r semi-1_14 semi

Here are the browse-able CVS web interfaces:

+ http://cvs.m17n.org/viewcvs/root/wanderlust/
+ http://cvs.m17n.org/viewcvs/root/apel/
+ http://cvs.m17n.org/viewcvs/root/flim/
+ http://cvs.m17n.org/viewcvs/root/semi/
     

.. [#foss] **F**\ ree or **O**\ pen **S**\ ource **S**\ oftware.

.. [#china] I wonder if there is a Chinese alternate universe of FOSS,
   too? 

.. _post: http://lists.airs.net/wl-en/archive/200905/msg00099.html
