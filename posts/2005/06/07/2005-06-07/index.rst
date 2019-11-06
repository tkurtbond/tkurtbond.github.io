.. title: GtkAda and Ada; Recent Listening and Viewing
.. slug: 2005-06-07
.. date: 2005-06-07 00:00:00 UTC-05:00
.. tags: old blog,gtkada,ada,recent listening,recent viewing
.. category: oldblog
.. link: 
.. description: 
.. type: text


GtkAda and Ada
--------------

Using GNAT 3.15p with GtkAda-2.4.0 on Windows XP, when I wanted to
switch from using ``Gtk.Menu.Popup`` to using a user instantiated
version of ``Gtk.Menu.User_Menu_Popup.Popup`` I tried to switch from
using ``Menu`` of type ``Gtk_Menu`` for the first parameter to using
``Gtk_Menu_Record (Menu.all)'Access`` because gnatmake says:

::

    access to class-wide argument not allowed here
    "Popup" is not a primitive operation of
    "Gtk_Menu_Record"


I suppose that is because when the package is instantiated it's not in
the same scope as the original declaration of ``Gtk_Menu_Record`` so it
can't be a primitive operation of that type. It's annoying, though.
Anyway, I never figured out the problem completely before having to
move on to something else.

I never did get ``Gtk.Menu.User_Menu_Popup.Popup`` working properly,
though.

Recent Listening
----------------


+ *Blue Blood*, by Edward Conlon; performed by Tom Stechschulte;
  Recorded Books, 2004.  Very interesting memoir of a NYPD cop in the late
  1990s and early 2000s.

Recent Viewing
--------------

+ `Zatoichi sekisho yaburi
  <http://www.imdb.com/title/tt0164984/>`__, aka *Adventures of a Blind
  Man*, 1964. Directed by Kimiyoshi Yasuda, writing by Shozaburo Asai
  and Kan Shimozawa.Includes another glimpse into Zatoichi's background.
  Good.
