NB. manifest for JODSOURCE
CAPTION=:'JOD Object Dictionary Source'
VERSION=:'0.9.93'
PLATFORMS=:'win linux darwin'
LABCATEGORY=:'General'
FILES=: 0 : 0
manifest.ijs
jodsource.zip
jodsourcesetup.ijs
)
RELEASE=:'j601 j602 j701'
DEPENDS=: 0 : 0
general/jod
arc/zip
)
DESCRIPTION=: 0 : 0
(jodsource.zip) is an archive containing serialized dump
versions of the three JOD dictionary databases (joddev,jod,utils)
that are used to build the JOD system. JOD system dictionaries are
good examples of how JOD can be used to build complex J systems.

In J 7.0x JOD requires the following addons:

  data/jfiles
  arc/zip 

JOD source dictionaries in (jodsource.zip) can be set up in two ways:

1) Run the J script ~addons/general/jodsource/jodsourcesetup.ijs

   This is the recommended method.  (jodsourcesetup.ijs) has been
   checked on Windows j6.02, j7.01 and linux and Mac j7.01 32 bit systems.
   NOTE: It can take a minute or so to run.
   
   WARNING: (jodsourcesetup) uses arc/zip which fails on 64 bit
   systems. See the JOD Page
   
   http://bakerjd99.wordpress.com/the-jod-page/
   
   for a work-around for 64 bit systems.

2) Run the JOD lab "JOD Source Code Dump Scripts." 
   JOD labs are in the general lab category.

bakerjd99@gmail.com
)
