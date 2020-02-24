.. title: Foreign File Systems on macOS: Fail!
.. slug: foreign-file-systems-on-macos-fail
.. date: 2020-02-24 17:40:34 UTC-05:00
.. tags: macos,tuxera,ntfs,paragon,extfs
.. category: computer
.. link: 
.. description: 
.. type: text

Back sometime in March 2018 I installed Tuxera__ `NTFS for Mac`__.  It was
the first NTFS for Mac that I found.  I used it casually for a while
and it seemed ok.

__ https://www.tuxera.com/
__ https://www.tuxera.com/products/tuxera-ntfs-for-mac/

Sometime later, probably in October 2019, I decided I needed to move
110 GB of files off my Macbook Pro laptop's internal drive and onto a
external drive.  I also wanted to access this drive from Linux, and
thought I'd just use a NTFS-formatted drive so it would be readable
there.

I copied the files over using rsync and there seemed to be no
problems, until I (in a fit of paranoia) ran the Unix cmp command on
all the files on the original disk and the matching files on the
NTFS-formatted drive.  There were lots of differences. Uh oh.

I didn't see anything on the Internet complaining about this.

So, sometime in October 2019 in I installed `Paragon Software`__
`extFS for Mac`__. (I see now that they have a `NTFS for Mac`__; I
haven't tried it.) 

__ https://www.paragon-drivers.com/
__ https://www.paragon-drivers.com/en/extfsmac/
__ https://www.paragon-drivers.com/en/ntfsmac/

I wanted to try the same thing and see if it worked more reliably with
extFS.  I originally wrote short shell scripts for this, for
consistency, so I could just change the volume name and run them
again.  Again there were lots of differences.  Uh oh.

Again, I didn't see anything on the Internet complaining about this.

All I was doing was running ``rsync -avz`` with the appropriate
directories; it should have worked.

I formatted the drive to Mac OS Extended (Journaled) and recopied the
files, and this time they all compared ok.

I decided to just use Unison__ to sync the files to a couple of my
computers for backup and local use instead of connecting the external
drive to each computer in turn.  This is working ok for me.

__ https://www.cis.upenn.edu/~bcpierce/unison/

Maybe this was user error on my part, but it happened consistently
with both of these file systems.
