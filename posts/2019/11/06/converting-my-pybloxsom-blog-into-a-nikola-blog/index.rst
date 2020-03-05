.. title: Converting my pyBloxsom blog into a Nikola blog
.. slug: converting-my-pybloxsom-blog-into-a-nikola-blog
.. date: 2019-11-06 14:10:35 UTC-05:00
.. tags: blog,conversion,nikola,pybloxsom
.. category: computer
.. link: 
.. description: 
.. type: text

Yesterday I decided to try blogging again.  I started writing a post
at blogger.com, but that was like wading through a rotting whale
corpse.  Instead I decided to use `GitHub Pages
<https://help.github.com/en/github/working-with-github-pages/about-github-pages>`__
and use the static blog/site generator Nikola_ to generate the
content, editing reStructuredText (ReST) files.

.. _Nikola: https://getnikola.com/

I wrote my first post_ and it was good!  Using ReST again was much
better than editing in a GUI like blogger.com, and having it hosted by
GitHub Pages was more restful than running a machine hosting a
website.

.. _post: link://slug/getting-nxml-mode-in-emacs-to-validate-docbook-5-documents

But then I thought of all the posts I had in my old blog, before I
stopped running machine hosting a website.  They were all written in
ReST — maybe I could put them up on my new blog?

I took a couple three hours and wrote a shell script to find the old
pyBloxsom_ files and feed them into a python script that I also wrote.
Along the way I made sure the files all had ``#published`` and
``#tags`` lines, in that order, immediately following the title line.

.. _pyBloxsom: https://pyblosxom.github.io/

Here's the shell script: 

.. listing:: drive-pyblox-to-nikola bash

Here's the python script:

.. listing:: pyblox-to-nikola python
             :number-lines:

There were 810 reStructuredText_ files to process.  Once that was
done, I had to work through those files multiple times finding all the
broken internal links, since many of them were absolute links to my
old blog or other pages on my old website.  I did `grep-find` in Emacs
multiple times to find all the occurances of my old website's hostname
(which went through a couple of variations over time), then looked for
site relative links that started with ``/~tkb``, a tedious but not too
difficult process.

.. _reStructuredText: http://docutils.sourceforge.io/rst.html
