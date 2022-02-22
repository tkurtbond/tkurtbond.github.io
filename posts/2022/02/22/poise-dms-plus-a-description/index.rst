.. title: POISE DMS-PLus, a Description
.. slug: poise-dms-plus-a-description
.. date: 2022-02-22 09:49:38 UTC-05:00
.. tags: poise,dms-plus,jenzabar px
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: command

Some time ago I linked_ to a description of the POISE DMS-Plus, a Data
Management System that I've used extensively since the mid 1980s.
Last time knew it was owned by Jenzabar.  Since Jenzabar's description
of it (as part of Jenzabar PX) has vanished from their web pages I
thought it would be useful to have a description of it on my blog.

.. _linked: link://slug/poise-dms-plus

I'll include `Jenzabar's description`__ of the POISE DMS-Plus here:

__ https://web.archive.org/web/20060313120910/http://www2.esp-tulsa.com/products.htm#dmsplus

    **DMS-Plus**

    Each Jenzabar PX Administrative application module is built on
    Jenzabar PX DMS-Plus®, a relational database management system (RDBMS)
    using fourth-generation (4GL) language. DMS-Plus includes a powerful
    report-writer, an information-retrieval system using multiple keys,
    screen generation, and has multiple user levels: the operator,
    intermediate user, advanced user, and application developers. It also
    includes an Administrative Systems Query (ASQ or ask) language that is
    designed to make the software easier to use for administrative
    personnel. ASQ permits users to select, order, display, and print
    information through simple English-like commands. In addition to ASQ,
    another option for queries and reporting is QBF (Query By Form), a
    point and select method which leads users through the data files and
    query options.

    The benefits of a DMS-Plus approach to administrative processing
    include ease of use by nontechnical personnel, a greater flexibility,
    and speed and simplicity when implementing changes. It includes a
    powerful data management and information retrieval facility with
    right-to-use source code available. DMS-Plus includes list processing
    as well as interfaces to stand-alone word processing systems. Future
    enhancement to DMS-Plus are provided as part of the ongoing
    subscription services. DMS-Plus is the common language for all types
    of users.

    *DMS-Plus Highlights*

    • DMS-Plus provides Report Generators for easy sorting, selecting, and
      printing along with Screen Generators for easy data entry, update,
      and review.
    • DMS-Plus utilizes data manipulation for inserting, updating and
      deleting data in the database. In addition to data definition for
      adding new elements to the database, data control is also available
      for accessing data by persons who have been granted access.
    • DMS-Plus has a menu processor, import/export capability via ASCII
      file formats, a WordPerfect interface, and SQL compliant.
    • DMS-Plus is a user-oriented system that operates in a multi-user
      environment. Simple English-like language prompts and responses are
      used to interact with the system. By utilizing the flexibility of
      DMS-Plus, each user office can determine the information collected,
      can regulate work flow, can set its own schedules for updating
      files, and can produce its own reports without depending on
      Information System services.
    • DMS-Plus supports multi-user access. These application systems use
      many of the same functions and techniques that provide continuity
      across user departments and also allows cross-utilization of
      personnel.
    • Many applications for information management needs may be
      implemented through the software provided with little or no
      additional programming.
    • DMS-Plus provides an integrated base of information for
      administrative data processing. Information introduced into the
      system may be carried forward into all appropriate areas without
      redundant entry.

While the above describes the POISE DMS-Plus as a “relational database
management system”, it isn't really.  It does not use a relational
database.  It comes from the time **before** relational databases.

To me, a database is a program that controls access to a collection of
data - you can’t get to the data without asking the database program
for it.

A data management system (the DMS in DMS-Plus) just lets you associate
related data together, and then multiple programs can access the
pieces, usually using a standard API implemented as a library.

Before the advent of Unix, files were often much more complicated that
just a stream of bytes.  For instance, under VMS (where I've used the
POISE DMS-Plus the most) the *Record Management Services* (RMS)
provides sequential, relative, and indexed file organization, and
fixed-length and variable-length record formats, and allows you to
access records within these files sequentially, directly by key value,
directly by relative record number, or directly by record file
address.  It was common practice for programs to each use their own
specific mix of these aspects of RMS, with the details directly coded
into the program.

The advantage of the POISE DMS-Plus is it provided a suite of programs
that worked together, allowing users to describe the format of the
files they wanted, enter and modify data in those files, sort and
select data, and produce nicely formatted reports, without having to
write any code.  The programs were interactive, issuing a series of
prompts to the user for what they needed to do next, and were very
easy to learn.  If a secretary wanted to keep track of the inventory
of their office, they would run :command:`DMS:DESCRIBE` to describe
the fields they wanted and allocate space for the file, then run
:command:`DMS:ADD` to add data, :command:`DMS:SEARCH` to search and
update it, :command:`DMS:SORT` to sort and select data, and
:command:`DMS:PRINT` to produce a nicely formatted report.  If they
had to do a lot of data entry into the file, or it was large or
complicated, they could run :command:`DMS:SCREEN` to define a text
user interface screen format for interactive user input, arranging the
fields or subsets of the fields on the screen to make data entry easy,
and then run :command:`DMS:SCOPE` using that screen format to do data
entry.  (I keep wishing for something as easy to use as
:command:`DMS:SCREEN` in the area of database backed web applications,
but haven't found it yet.)

POISE DMS-Plus files *were* relational in that it was possible for
fields in one file to refer to values in fields in another file,
similar to SQL ``JOIN``\s and ``FOREIGN KEY`` constraints.  So, for
instance, it was possible to have a code field in one file, but on
reports include the description of the code by pulling it from a code
file, keyed by the code field.

All the POISE DMS-Plus used a documented API, the Support Procedure
Library, which programmers could use to write programs that accessed
POISE DMS-Plus files for applications that required sophisticated,
special purpose processing.  Furthermore, they documented the file
structures they used, so it was possible to write programs that
accessed DMS-Plus files directly, if necessary.

POISE, by the way, stood for “People Oriented Interactive Software for
Education”, and it probably had its greatest success in systems for
education administration, but it was a general purpose tool and I have
worked on projects using it for many other areas, including local and
state government, real estate sales management, oil and gas royalty
management, and many others.

