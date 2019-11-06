.. title: Open Source and Long-term Development
.. slug: open-source-and-long-term-development
.. date: 2008-09-04 13:50:34 UTC-05:00
.. tags: software development
.. category: computer
.. link: 
.. description: 
.. type: text


On the AADL_ site, via their `Tool Integrators`_, Toolsets_,
TOPCASED__ pages I ran across an interesting presentation__ about
TOPCASED_, which at the beginning basically says that with the
lifetime of aerospace products running as long as 10 to 30 years no
company is able to commit to supporting a development tool for such a
long time at an acceptable cost. (I think this was essentially
explaining their motivation for developing TOPCASED as an open source
project, though it's not quite explicitly stated.)

.. _AADL: http://www.aadl.info/
.. _Tool Integrators: http://la.sei.cmu.edu/aadl/currentsite/tool/index.html
.. _Toolsets: http://la.sei.cmu.edu/aadl/currentsite/tool/toolsets.html
__ http://la.sei.cmu.edu/aadl/currentsite/tool/topcased.html
__ http://la.sei.cmu.edu/aadlinfosite/LinkedDocuments/d2_1500_topcased.pdf
.. _TOPCASED: http://www.topcased.org/

I find this very interesting, since I've worked on a number of
projects that, although not in the aerospace arena, have had lifetimes
vastly exceeding the expectations of anybody involved on the project.
While some of the original design and development tools are still
available, some are not, and replacing them, or in some cases just
using the ones that are still available, can be a complicated
business.  For small projects, collecting all the tools under CM so as
to be able rebuild any version of the project with the original tools
can be prohibitively expensive when commercial software is involved.
The idea of using open source tools because those will still be
available in 20 or 30 years and can be supported in a cost-effective
way seems reasonable, so it's interesting to see that there are a
number of open source projects of this nature in aerospace, an arena
known for mission critical systems.
