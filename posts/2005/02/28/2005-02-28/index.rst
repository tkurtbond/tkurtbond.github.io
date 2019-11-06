.. title: Recent Reading and Viewing; Oracle
.. slug: 2005-02-28
.. date: 2005-02-28 00:00:00 UTC-05:00
.. tags: old blog,recent reading,recent viewing
.. category: oldblog
.. link: 
.. description: 
.. type: text


Recent Reading
--------------

+ *Blue Magic*, by Jo Clayton; DAW, May 1988; DAW Collecttors No. 743.
  Good, but not quite as good as the `first
  <../../../log/2005/02/21.html#drinker-of-souls>`__ in the series.
+ *Two-Bit Heroes*, by Doris Egan; DAW, January 1992; DAW Book
  Collectors No. 870.  Also good, but not quite as good as the `first
  <../../../log/2005/02/17.html#gate-of-ivory>`__ in the series.
+ *The Suns of Scorpio*, by Kenneth Bulmer, as by Alan Burt Akers; DAW
  Books 1973; Futura Publications Limited, 1974.  This is the second of
  the *Dray Prescot* books and deals extensively with his adventures in
  the Eye of the World amongst the partisans of the Red and the
  Green.  This was the first of the *Dray Prescot* books that I read. I
  got it from the Salem College library as a youngster one snowy winter
  day when I'd gone there with my Dad (who was a professor there at the
  time) because schools in our county had been canceled because of the
  snow. The copy that I borrowed that day was the DAW (USA) edition; the
  version I own now, oddly enough, is the British edition.

Recent Viewing
--------------

+ `Zatoichi sakate giri <http://www.imdb.com/title/tt0202154/>`__,
  also known as *Zatoichi and the Doomed Man*, 1965; directed by Kazuo
  Mori; writing by Shozaburo Asai and Kan Shimozawa; starring Shintarô
  Katsu.
+ `A Man Apart <http://www.imdb.com/title/tt0266465/>`__, 2003;
  directed by F. Gary Gray; writing by Christian Gudegast and Paul
  Scheuring; starring Vin Diesel.  Worth seeing on cable, I suppose, for
  those who like that sort of thing.

Oracle
------

It turns out that to install Oracle 10g on a Windows XP machine that
doesn't have a static address or which is not connected to a network
you have to install the Microsoft Loopback Adapter, configure it with
a non-routable IP address, make it the primary network address, and
make sure oracle uses that address when it installs. This is
documented in this `version of the release notes <http://download-
west.oracle.com/docs/html/B10132_02/toc.htm#CACCBEJJ>`__ but
unfortunately, this is *not* the current version of the release notes,
so if you follow the normal links on their website or you look at the
relase notes that come with the download you won't see that section.

Just for posterity, here's what Oracle has to say:

    10.22 Prerequisite for DHCP Installation

    To install Oracle Database or Oracle Database 10g Companion Products
    on a server configured with DHCP, or if you want to perform an off-
    network installation and connect to the network afterwards, then you
    must appropriately configure the Microsoft Loopback adapter as the
    primary network interface before installation.

    Follow this procedure:


    #. Install Microsoft Loopback adapter on the DHCP computer.  See Also:
       Microsoft Knowledge Base documentation for instructions on installing
       and configuring the Loopback adapter
    #. After installing the adapter, you must assign it a non-routable IP.
       The following values are recommended: 192.168.x.x (where x is any
       value) and 10.10.10.10. Then assign a subnet mask of 255.255.255.0.
    #. Modify ``System32\drivers\etc\hosts`` to include an entry of the
       form::

	   ;non-routable IP Fully-Qualified-Windows-Machine-Name Windows-Machine-Name-Aliases

       For example::

	   10.10.10.10 oracle-laptop.us.oracle.com oracle-laptop

    #. Windows considers Loopback adapters as a type of network adapter.
       After installing the Loopback adapter, you have at least two network
       adapters on your computer: your network adapter and the Loopback
       adapter. You want Windows to use the loopback adapter as the primary
       adapter. Check your operating system documentation for instructions on
       how to do this. 

    .. Note:: You must set up the Loopback adaptor before installation.
