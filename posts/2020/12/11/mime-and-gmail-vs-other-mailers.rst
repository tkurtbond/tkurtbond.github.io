.. title: MIME and Gmail vs other mailers
.. slug: mime-and-gmail-vs-other-mailers
.. date: 2020-12-11 09:12:17 UTC-05:00
.. tags: mime,mew,wanderlust,mutt,alpine,thunderbird,gmail,e-mail
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file
.. role:: command
.. role:: key


I composed a carefully constructed MIME_ message using Mew_, which has
a nice way to build MIME_ messages, but Gmail doesn’t know that if you
have a multipart MIME_ message that has a text part, then an image,
then a text part, then an image, then a text part then what you want
is for the image parts to be displayed inline.  In messages like that
composed in Gmail, it uses the content type of ``multipart/related``,
which then encloses a ``multipart/alternative``, which has a plain
text version of the message and an HTML version, which refers to the
images with an ``img`` tag that has an id that refers to the id in a
``Content-ID`` MIME_ header in following parts of the multipart-related
MIME_ part that is the main body of the email.

.. _MIME: https://en.wikipedia.org/wiki/MIME
.. _Mew: http://www.mew.org/

I don’t know why Gmail doesn’t display the simpler ``multipart/mixed``
messages correctly.

It is very annoying.  I don’t mind them using the
``multipart/related`` (which I didn’t even know about before looking
at one of their messages using ``wl-summary-reedit`` in Wanderlust_,
which pulls it up in the ``mime-edit-mode`` MIME_ composition mode
[#mime-edit-mode]_, which revealed all the details), but I wish they’d
get the simpler ``multipart/mixed`` version right.  Instead, they
don’t display the inline attachments (regardless of whether they are
images or text) and put them all at the end of the display as
attachments, and display the other text parts smushed together.

.. _Wanderlust: https://www.emacswiki.org/emacs/WanderLust

Interestingly, if a text part it has a ``Content-Type: Text/Plain``
MIME_ header field it is displayed inline in Gmail, unless it has a

.. code::

    Content-Disposition: inline; filename="JRandomFilename.txt"

MIME_ header field, and then it **doesn’t** display it inline,
unlike all the other mail readers I tried: Wanderlust_, Mew_, Alpine_,
Thunderbird_ (had to have a pure GUI client for comparison), and mutt_.

.. _Alpine: https://en.wikipedia.org/wiki/Alpine_(email_client)
.. _Thunderbird: https://www.thunderbird.ne
.. _mutt: http://www.mutt.org/

Interestingly, Wanderlust_ displays Gmail’s ``multipart/related``
messages correctly, which impressed me.

I originally I thought that Mew_ did not display the
``multipart/related`` message correctly, punting to just displaying
original MIME_\ -encoded text instead, and not displaying the image
parts.

I was wrong about that; I was just confused by its presentation.
First it displays the text version of the enclosed
``multipart/alternative``, which is what made me think it didn’t
display the image parts; it just hasn't yet!  Then if I hit space, it
displays the first of the images, and then if I hit space it displays
the second of the images.

And you can make Mew_ display the HTML part, but it doesn’t know how
the ``<img id=“foo”>`` elements work, so it doesn’t display the
images.

I was pleased to see that the Wanderlust_ (WGH_) and Mew_ (MGH_) github
repositories both have recent commits.

.. _WGH: https://github.com/wanderlust/wanderlust
.. _MGH: https://github.com/kazu-yamamoto/Mew

And Wanderlust_ and Mew_ are both in MELPA_ these days, although
Mew_’s MELPA_ package doesn’t include the command line program,
:command:`incm`, that is used to pull emails from :file:`/var/mail`
into MH_ style files under :file:`~/Mail`.  Wanderlust_ and Mew_ both
use MH_ style files under :file:`~/Mail` as their local message store.
MH_ puts subdirectories there for folders, and in each folder the
messages are named with integers that correspond to the order in which
they were incorporated from whatever mail source you were using
(historically :file:`/var/mail`).  MH_ used command line programs to
incorporate mail, list mail messages, display mail messages, and file
it into folders.  I rather liked it.  I used nmh_ (the New MH, a new
implementation of the original Rand MH commands, which ran on newer
Unixes) and `GNU mailutils`_ (which provided MH-compatible command
line programs, if not configured out), sometimes during the same
period of time, for a considerable time.  At one time, when I was
getting mail at a server I had online, I was using nmh_, `GNU
mailutils`_, Emacs’s built-in interface to MH (`MH-E`_), Wanderlust_,
and Mew_. (Before that I used ViewMail_, and before that I used
RMAIL_) They each had features the other lacked.

.. _MELPA: https://melpa.org/
.. _MH: https://en.wikipedia.org/wiki/MH_Message_Handling_System
.. _nmh: https://www.nongnu.org/nmh/
.. _GNU mailutils: https://mailutils.org/
.. _MH-E: https://www.emacswiki.org/emacs/MH-E
.. _ViewMail: http://savannah.nongnu.org/projects/viewmail
.. _RMAIL: https://www.emacswiki.org/emacs/Rmail

I tried using Unison_ to sync that mail between my server online and
my computer at home, but that did not work well, since MH_ commands
change the names of files when they move them from one folder to
another (remember, each message in a folder gets a name that is an
integer based on the order in which it was incorporated in that
folder, and its folder command provided an option, ``-pack``, that
renamed all the messages in a folder sequentially, used after you’d
deleted messages) so you couldn’t keep track if the message named 32
in one folder on one machine was a new one or just renamed from 976
when you ran folder -pack last.  Syncing with Unison_ just did not
work at all.  Hmm.  I could have changed the ``Path`` option in my
:file:`.mh-profile`` file on each machine, so that instead of all the
MH_ mail being under :file:`~/Mail` on both machines, on my home
machine it could have been under :file:`~/Mail-home` and on
tkb.mpl.com it could have been under :file:`~/Mail-onlineserver`, and
then I could have used rsync_ to copy those from one machine to the
other appropriately so I’d have a backup.  Huh.  Wish I’d figured that
out back in the day.  Of course, to read email in :file:`~/Mail-home`
on my online server I’d have had to changed the ``Path`` option in my
:file:`~/.mh_profile` on that machine, and then changed it back when I
wanted to use :file:`~/Mail-onlineserver`.  It would have worked,
however.

.. _Unison: https://www.seas.upenn.edu/~bcpierce/unison/
.. _rsync: https://rsync.samba.org/

Completion made me go look at the MIME_ messages I was testing in
`MH-E`_.  In the ``multipart/mixed`` message `MH-E`_ does not show the
PNG files inline, though emacs has the capability to do that now.  It
*does* have keybindings to open an external viewer for you.  If you
specify the macOS command :command:`open` it will open it in whatever
app is the default for macOS; in the case of PNGs that is
:app:`Preview`.

I do most of my email reading and sending in Gmail these days, alas.  I
still use Wanderlust_ and Mew_ occasionally, since they support IMAP_
very well.  Now if only Google didn't make it harder to use them:
Gmail declares IMAP-over-SSL is a “less secure” application, and turns
IMAP_ access off if you don't use it regularly.

.. _IMAP: https://en.wikipedia.org/wiki/Internet_Message_Access_Protocol

.. [#mime-edit-mode] This is provided by SEMI_, an Emacs Lisp package,
   and it has a GitHub repo (SEMIGH_), last commit 27 days ago as of
   the time of this writing.

.. _SEMI: https://www.emacswiki.org/emacs/SemiIsEmacsMimeInterface
.. _SEMIGH: https://github.com/wanderlust/semi
