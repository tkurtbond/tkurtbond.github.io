.. title: Binding a symbol defined with DEFCONSTANT with LET is not portable in Common Lisp
.. slug: binding-a-symbol-defined-with-defconstant-with-let-is-not-portable-in-common-lisp
.. date: 2020-04-24 23:46:39 UTC-04:00
.. tags: common lisp,abcl,ccl,clisp,ecl,sbcl
.. category: computer/lisp
.. link:
.. description:
.. type: text

.. role:: app

SBCL_ and CCL_ and CLISP_ think binding a symbol defined with ``defconstant``
is an error, so if you do

.. code:: common-lisp

   (defconstant foo "foo")
   (let ((foo "bar")) foo)

you get an error.  But in ABCL_ and ECL_ you don’t.

If you try

.. code:: common-lisp

   (defun x () (let ((foo "bar")) foo))

in SBCL and CCL you get an error when the function is compiled.
In SBCL the function is defined, but always gives an error when run.
In CCL the function does not get defined.

.. _SBCL: http://www.sbcl.org/
.. _CCL: https://ccl.clozure.com/
.. _CLISP: https://clisp.sourceforge.io/
.. _ABCL: https://abcl.org/
.. _ECL: https://common-lisp.net/project/ecl/
