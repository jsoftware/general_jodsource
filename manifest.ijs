NB. manifest for JODSOURCE
CAPTION=:'JOD Object Dictionary Source'
VERSION=:'0.9.95'
PLATFORMS=:'win linux darwin'
LABCATEGORY=:'General'
FILES=: 0 : 0
manifest.ijs
jodsource.zip
jodsourcesetup.ijs
)
RELEASE=:'j601 j602 j701 j801 j802 j803'
DEPENDS=: 0 : 0
general/jod
arc/zip
)
DESCRIPTION=: 0 : 0
(jodsource.zip) is an archive containing serialized dump
versions of the three JOD dictionary databases (joddev,jod,utils)
that are used to build the JOD system. JOD system dictionaries are
good examples of how JOD can be used to build complex J systems.

J 7.0x/8.0x JOD requires the following addons:

  data/jfiles
  arc/zip

JOD source dictionaries in (jodsource.zip) can be set up in three ways:

1) Run the J script ~addons/general/jodsource/jodsourcesetup.ijs

   This is the recommended method for 32 bit systems. (jodsourcesetup.ijs) has been
   checked on Windows j6.02, j7.01, j8.02 and linux and Mac j7.01 32 bit systems.
   NOTE: It can take a minute or so to run.

   WARNING: (jodsourcesetup) uses arc/zip which fails on 64 bit systems see:

   https://github.com/bakerjd99/joddumps

   for a work-around for 64 bit systems.

   More information is available on the JOD Page at:

   http://bakerjd99.wordpress.com/the-jod-page/

2) Run the JOD lab "JOD Source Code Dump Scripts."
   JOD labs are in the general lab category.

3) Fetch the files in (jodsource.zip) from GitHub at:

   https://github.com/bakerjd99/jod/tree/master/jodsource


bakerjd99@gmail.com
)
