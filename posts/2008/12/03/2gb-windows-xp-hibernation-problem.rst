.. title: 2GB Windows XP Hibernation Problem
.. slug: 2gb-windows-xp-hibernation-problem
.. date: 2008-12-03 15:44:22 UTC-05:00
.. tags: computer,ms windows
.. category: computer
.. link: 
.. description: 
.. type: text



`Coding Horror`_ points out the hotfix for the::

    ⚠ Windows - System Error
    Insufficient system resources exist to complete the API.

error when trying to suspend a Windows XP machine with 2 gibibytes.
The hotfix is hosted by `Owen Cutajar`_ and is from `Microsoft
KB909095`_.

Update: 2008-12-11: Unfortunately, it doesn't always work.  Even after
applying the hotfix, one of my laptops still won't hibernate.

.. _`Coding Horror`: http://www.codinghorror.com/blog/archives/000555.html
.. _`Owen Cutajar`: http://www.u-g-h.com/2006/03/14/insufficient-system-resources-exist-to-complete-the-api-solived/
.. _`Microsoft KB909095`: http://support.microsoft.com/?kbid=909095
