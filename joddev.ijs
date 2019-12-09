NB. JOD dictionary dump: 09 Dec 2019 11:02:41
NB. Generated with JOD version; 1.0.0; 32; 09 Dec 2019 09:24:19
NB. J version: j901/j64avx/windows/beta-s/commercial/www.jsoftware.com/2019-12-02T12:51:33
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|225346394776877887587393570006481670086|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


ERR010=:'invalid name pattern(s)'

ERR105=:'unreadable or missing backup timestamp'

ERR106=:'invalid backup number(s)'

ERR107=:'not in backup(s) -> '

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.0';33;'09 Dec 2019 11:02:41'

JODVMD=:'1.0.0';33;'09 Dec 2019 11:02:40'

MAXNAME=:128

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


abv=:3 : 0

NB.*abv v-- all backup version names.
NB.
NB. Returns all valid backup names matching name prefix (y). 
NB.
NB. monad:  blclBNames =. abv zl|clPfx
NB.
NB.   abv 'ch'  NB. all words in all backups starting with 'ch'
NB.   abv ''    NB. all words in all backups
NB.
NB. dyad:   blclBNames =. il abv zl|clPfx
NB.
NB.   2 abv 'jod'  NB. all group names in all backups starting with 'jod'
NB.   4 abv ''     NB. all macros in all backups

0 abv y NB. word default
:
if. badcl_ajod_ y do. jderr_ajod_ ERR002_ajod_ return. end.
if. -.isempty_ajod_ y do. if. badrc_ajod_ uv=.  checknames_ajod_ y do. uv return. else. y=. rv_ajod_ uv end. end. 
if. badrc_ajod_ uv=. x bnl '.' do. uv return. else. bn=. }.uv end.

NB. names matching prefix in all backups
pfx=. (<a:) -.&.>~ }.@(x&bnl)&.> (<y) ,&.> bn
b=. 0 < #&> pfx 

NB. return backup names from most recent to older backups
\:~ ;<"1@;"1&.> (b # pfx) ,"0&.> <"0 b # bn
)

backnum=:3 : 0

NB.*backnum v-- increments backup pack count and backup/restoration timestamp.
NB.
NB. monad:  backnum ia
NB.
NB.   backnum 0 NB. typical call

NB. HARDCODE pack counter is in component 1
nums=.> jread WF;1  NB. object noun !(*)=. WF
if. #nums do. nums=. (>:y{nums) y}nums else. nums=. 0 , 6!:0'' end.
((0{nums) , 6!:0'') jreplace WF;1
<.y{nums NB. integer result
)

backupdates=:4 : 0

NB.*backupdates v-- scans put dictionary backup files and returns
NB. backup dates.
NB.
NB. This  verb  attempts  to   read  component  index  1  of  put
NB. dictionary  (jwords)  backup files.  The resulting data takes
NB. these possible forms.
NB.
NB. verbatim:
NB.
NB.   1. bnum,timestamp - pack count and timestamp
NB.   2. bnum,0         - pack count and 0
NB.   3. _1`            - jread error - probably an older unreadable binary
NB.   4. _2             - trapped jread error - serious problemos
NB.
NB. dyad:  bt =. blObj backupdates ilBnums
NB.
NB.   NB. DL is put dictionary object
NB.   NB. bnums is a list of put dictionary backup numbers
NB.
NB.   DL backupdates bnums

NB. HARDCODE: component 1
uv=. >jread"1 (<1) ,.~  (<BAK__x) ,&.> (":&.> <"0 y) ,&.> 0{JDFILES
bstamps=. }."1 uv [ bn=. 0 {"1 uv

NB. format timestamps
bstamps=. (<"0 bn) ,. <"1 tstamp"1 bstamps

NB. errmsg: unreadable or missing backup timestamp
bstamps=. (<ERR105) (<(I. 0>bn);1)} bstamps
)

bchecknames=:4 : 0

NB.*bchecknames v-- checks backup name patterns.
NB.
NB. dyad:  ilObjBn bchecknames blclBnames
NB.
NB.   NB. valid ordered put dictionary backup numbers
NB.   bn=. rv_ajod_ checkback__ST__JODobj _1{0{DPATH__ST__JODobj
NB.
NB.   NB. first item of (x) is a dictionary object code
NB.   (WORD,bn) bchecknames__ST__JODobj <;._1' booo hhh re.12 bx.14 er.99'
NB.
NB.   NB. names are not required for the special DICTIONARY case
NB.   (DICTIONARY,bn) bchecknames__ST__JODobj <;._1' .71 .73 .65'

NB. errmsg: invalid name pattern(s)
if. +./ badcl&> y do. jderr ERR010 return. end.

NB. split backup name patterns
nbk=. (splitbname&> y) -.&.> ' '

NB. if backup number is absent use most recent
nbk=. (<":1{x) (<(I. 0 = #&> 1 {"1 nbk);1)} nbk

NB. names must be valid
if. DICTIONARY = 0{x do. bnm=. 0 {"1 nbk 
elseif. badrc bnm=. checknames 0 {"1 nbk do. bnm return. 
elseif.do. bnm=. }.bnm 
end.

NB. backup numbers must be valid
if. 0 e. (1 {"1 nbk) *./@e.&> <DIGITS do. jderr ERR106 return. end.
bn=. , _1&".&> 1 {"1 nbk

NB. errmsg: invalid backup number(s)
if. 0 e. bn e. x do. jderr ERR106 return. end.  

NB. return unique checked names and backup numbers
ok <~.bnm ,. <"0 bn
)

bget=:3 : 0

NB.*bget v-- retrieves objects from put dictionary backups.
NB.
NB. (bget) implements  a subset of (get). (bget) fetches  objects
NB. from either the last backup or particular backups.
NB.
NB. OBJECTS ARE NOT DEFINED IN LOCALES for the simple reason that
NB. backup fetches may return many versions of the same object.
NB.
NB. Only put  dictionary backups  are searched there is no backup
NB. path.  Also,  there is no corresponding  (bput)  because  the
NB. files  read  by (bget)  are backups that, once  created,  are
NB. never altered by JOD.
NB.
NB. Also,   certain  objects  are  not  fetched,  name   classes,
NB. timestamps and sizes.
NB.
NB. monad:  bget cl|blcl
NB.
NB.   NB. get last word backup
NB.   bget 'oops'
NB.
NB.   NB. collect from most current backup
NB.   bget ;: 'shawn of the dead'
NB.
NB.   NB. collect objects from particular put dictionary backups
NB.   bget <;._1 ' us.12 poor.10 little.08 words.08 lastback'
NB.
NB.   NB. get many versions of a word
NB.   bget <;._1 ' me.12 me.09 me.08 me.02'
NB.
NB. dyad:  ilCodes bget cl|bluu
NB.
NB.   5 bget ''     NB. dictionary document from last backup
NB.   5 bget '.12'  NB. dictionary document from particular backup
NB.   5 bget }. bnl '.'  NB. dictionary document versions in all backups
NB.
NB.   NB. get a suite header from particular backup
NB.   3 bget 'sweet.04'
NB.
NB.   NB. get long documents of an object
NB.   2 9 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  
NB.   
NB.   NB. all short explanations of words in last backup
NB.   0 8 get }. revo ''
NB.
NB.   NB. three versions of a group's header - similar to (get) where
NB.   NB. (2 get 'group') returns the group header
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  
NB.   
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's word list

WORD bget y
:
msg=. ERR001

if. (2<#x) +. badil x do. jderr msg return. end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. are backups present?
if. badrc uv=. checkback__ST {:0{DPATH__ST do. uv return. else. bn=. rv uv end.

NB. format standard (x) options
x=. x , (-2-#x) {. DEFAULT 

NB. are backup names and numbers valid?
if. badrc bnm=. (({.x),bn) bchecknames__ST ,boxopen y do. bnm return. else. bnm=. rv bnm end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (WORD,0) bgetobjects__ST bnm
    case. EXPLAIN  do. WORD bgetexplain__ST bnm
    case. DOCUMENT do. (WORD,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) bgetobjects__ST bnm
    case. EXPLAIN  do. TEST bgetexplain__ST bnm
    case. DOCUMENT do. (TEST,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. HEADER   do. (GROUP,2) bgetobjects__ST bnm
    case. DEFAULT  do. GROUP bgetgstext__ST bnm
    case. EXPLAIN  do. GROUP bgetexplain__ST bnm
    case. DOCUMENT do. (GROUP,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. (SUITE,2) bgetobjects__ST bnm
    case. DEFAULT  do. SUITE bgetgstext__ST bnm
    case. EXPLAIN  do. SUITE bgetexplain__ST bnm
    case. DOCUMENT do. (SUITE,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) bgetobjects__ST bnm
    case. EXPLAIN  do. MACRO bgetexplain__ST bnm
    case. DOCUMENT do. (MACRO,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. bgetdicdoc__ST bnm
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

bgetdicdoc=:3 : 0

NB.*bgetdicdoc v-- get backup versions of the dictionary document.
NB.
NB. monad:  bgetdicdoc btNameBn

NB. there is only one document per dictionary unique 
NB. dictionary backup numbers insure no redundant file reads
bn=. ~.1 {"1 y 

NB. put dictionary object  !(*)=. doj
doj=. {:{.DPATH

NB. dictionary document results combine dictionary name 
NB. with backup numbers to differentiate versions
NB. NOTE: the resulting label may not be a valid J name
NB. unless the JOD dictionary name is a valid J name.
ro=. ((<DNAME__doj) ,&.> '_' ,&.> ":&.> bn) ,. a:

NB. backup path and file suffix
'pth fsx'=. bpathsfx WORD 

ubn=. ;bn
for_bob. ubn do.

  fn=. pth,(":bob),fsx NB. backup file    

  NB. read document component 
  if. badjr dat=. jread fn;CNDICDOC do. jderr ERR088 return. end.
 
  NB. update results
  ro=. dat (<(I. bob=ubn);1)} ro

end.

NB. insure any empty documents have literal datatype
ok <btextlit ro
)

bgetdocument=:4 : 0

NB.*bgetdocument v-- get backup versions of object documents. 
NB.
NB. monad:  bgetdocument ??
NB. dyad:  ?? bgetdocument ??

ok (<'NIMP bgetdocument'),<y
)

bgetexplain=:4 : 0

NB.*bgetexplain v-- get short explanations from backups.
NB.
NB. dyad: il bgetexplain btNameBn

NB. object names 
nnm=. 0 {"1 y [ obj=. 0{x

NB. results are boxed name literal value tables
ro=. nnm ,. <,''

'pth fsx'=. bpathsfx obj

NB. fetch backup objects by backup number - optimizes file reads
cpm=. CNLIST,CNEXPLAIN
ubn=. ~.bn=. ; 1 {"1 y
for_bob. ubn do.

  fn=. pth,(":bob),fsx NB. backup file

  NB. read backup explanations errmsg: read failure
  if. badjr 'ixn sex'=. jread fn;cpm do. jderr ERR088 return. end.

  NB. explanations must exist in backup(s) errmsg: not in backups ->
  sn=. nnm {~ rx=. I. bob=bn
  if. 0 e. uv=. sn e. ixn do. (jderr ERR107),(sn #~ -.uv) ,&.> <NDOT,":bob return. end.

  NB. update results
  ro=. (sex {~ ixn i. sn) (<rx;1)} ro

  NB. distinquish object names with backup number suffix
  ro=. (((<rx;0){ro) ,&.> <'_',":bob) (<rx;0)} ro

end.

NB. insure any empty explanations have literal datatype
ok <btextlit ro
)

bgetgstext=:4 : 0

NB.*bgetgstext v-- get backup versions of group/suite headers.
NB.
NB. dyad: il bgetobjects btNameBn

if. badrc uv=. (x,0) bgetobjects y do. uv else. ok <0 1 {"1 rv uv end.
)

bgetobjects=:4 : 0

NB.*bgetobjects v-- get objects from backups.
NB.
NB. dyad: il bgetobjects btNameBn

NB. object code, offset and names
nnm=. 0 {"1 y [ 'obj offset'=. x 

NB. HARDCODE: 2 indicates fetching group/suite list(s)
offset=. (bgslist=. offset=2){offset,0

NB. results are boxed name value tables
NB. words & macro have three columns
ro=. nnm ,"0 1 (1 + (offset=0) * obj e. WORD,MACRO)$a:

NB. HARDCODE: result columns
cols=. 0 _1
if. (0=offset) *. -.bgslist do. cols=. i. {:$ro end.

NB. backup path and file suffix
'pth fsx'=. bpathsfx obj

NB. fetch backup objects by backup number - optimizes file reads
cpm=. CNLIST,CNCOMPS
ubn=. ~.bn=. ; 1 {"1 y
for_bob. ubn do.

  fn=. pth,(":bob),fsx NB. backup file

  NB. read backup directory index  errmsg: read failure
  if. badjr 'ixn ixc'=. jread fn;cpm do. jderr ERR088 return. end.

  NB. objects must exist in backup(s) errmsg: not in backups ->
  sn=. nnm {~ rx=. I. bob=bn
  if. 0 e. uv=. sn e. ixn do. (jderr ERR107),(sn #~ -.uv) ,&.> <NDOT,":bob return. end.

  NB. read object components
  if. badjr dat=. jread fn;offset+(ixn i. sn){ixc do. jderr ERR088 return. end.

  NB. update results
  ro=. (cols {"1 >dat) rx} ro

  NB. distinquish object names with backup number suffix
  ro=. (((<rx;0){ro) ,&.> <'_',":bob) (<rx;0)} ro

end.

NB. for nonwords insure any empty texts have literal datatype
if. obj~:WORD do. ro=. btextlit ro end.

ok <ro  NB. return object table 
)

bgslist=:4 : 0

NB.*bgslist v-- get backup versions of group/suite lists.
NB.
NB. monad:  bgslist ??
NB. dyad:  ?? bgslist ??

ok (<'NIMP bgslist'),<y
)

bnl=:3 : 0

NB.*bnl v-- list objects in put dictionary database backup files.
NB.
NB. monad:  dnl clStr | zlStr
NB.
NB.   bnl ''        NB. list all words in last backup
NB.   bnl '.'       NB. list backup suffixes
NB.   bnl 'pfx'     NB. list all words in last backup starting with 'pfx'
NB.   bnl 're.12'   NB. list all words in backup 12 starting with 're'
NB.
NB. dyad:  ilCodes bnl clStr | zlStr
NB.
NB.   4 2  bnl 'ex'     NB. macros with names containing 'ex' in last backup
NB.   2 3  bnl 'et.13'  NB. groups with names ending with 'et' in backup 13
NB.
NB.   14 bnl '.'  NB. display pack/backup dates

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT

NB. special list backup dates case first
if. (INPUT=0{x) *. (,NDOT__ST)-:alltrim y do. x bnlsearch__ST y return. end.

if. ((0{x) e. WORD,MACRO) *. -.(2{x) e. DEFAULT,MACROTYPE,i. 4 do. jderr ERR001 
elseif. ({. x) e. OBJECTNC do. x bnlsearch__ST y 
elseif.do. jderr ERR001 
end.
)

bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc bnlsearch clPattern

NB. at most one '.' character errmsg: invalid name pattern
if. 1 < +/ y e. NDOT do. jderr ERR010 return. end.

NB. maintains argument compatibility with (dnl)
bv=. DEFAULT ~: 2{x
if. bv *. (0{x) e. TEST,GROUP,SUITE do. jderr ERR001 return. end.

NB. put dictionary directory object
DL=. {:0{DPATH

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. badrc uv=. checkback DL do. uv return. else. bn=. rv uv end.

NB. search name pattern and requested backup
'pat rbk'=. splitbname y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

NB. nonempty patterns must be valid J names without embedded locales
if. #uv=. pat -. ' ' do.
  if. badrc uv=. checknames pat do. uv return. end. 
end.

bdot=. (,NDOT)-:alltrim y 

if. bdot *. INPUT={.x do.

  NB. show pack/backup dates
  ok <DL backupdates bn

elseif. bdot do.

  NB. return backup suffixes
  dot=. (0<#bn){'';NDOT
  ok dot ,&.> 'r<0>0.d' 8!:0 bn

elseif. bfile=. ({.x) dbakf__DL rbk
        NB. errmsg: jfile read failure
 
  badjr uv=. jread bfile;(1{CNDIR),CNCLASS do. (jderr ERR088,' ->'),<bfile 

elseif.
        ol=. uv{ol [ uv=. /: ol [ 'ol oc'=. uv 
        NB. reduce object list for words and macros if class specified
        if. bv *. (0{x) e. WORD,MACRO do. ol=. (oc = 2{x)#ol [ oc=. uv{oc end.

  isempty pat do. ok ol  NB. return sorted last backup name list

elseif. 0=#ol do. ok ol  NB. nothing left to match
elseif. do.              NB. match prefix, infix suffix
  select. 1{x
    case. 1 do. ok ol nlpfx pat 
    case. 2 do. ok ol nlctn pat
    case. 3 do. ok ol nlsfx pat
    case. do. jderr ERR010
  end.
end.
)

bpathsfx=:3 : 0

NB.*bpathsfx v-- backup file path and file name suffix.
NB.
NB. monad:  (clPath ; clSfx) =. bpathsfx iaObj
NB. 
NB.   NB. calls in object context
NB.   bpathsfx__ST__JODobj WORD_ajod_
NB.   bpathsfx__ST__JODobj MACRO_ajod_

doj=. {:{.DPATH         NB. put dictionary object 
fsx=. (;y{JDFILES),IJF  NB. backup file name suffix

NB. backup file path !(*)=. doj
pth=. ". ({.;dncn__doj y),'P__doj'
pth=. (>:pth i: PATHDEL) {. pth

NB. return path and suffix
(pth , (;{:JDSDIRS) , PATHDEL);fsx
)

btextlit=:3 : 0

NB.*btextlit v-- force any empty backup text to literal datatype.
NB.
NB. To insure that (ed) can always edit  (bget) backup name value
NB. tables force any empty texts to a literal dataype. If this is
NB. not done the result may  fail the name, value argument  tests
NB. of (ed).
NB.
NB. monad:  bt =. btextlit bt

(<'') (<(I. 0 = #&> _1 {"1 y);_1)} y
)

buildjodcompressed=:4 : 0

NB.*buildjodcompressed v-- builds a fully compressed JOD load test script.
NB.
NB. dyad:  blVersion buildjodcompressed blclDirs
NB.
NB. verbatim:
NB.
NB. Builds a compressed JOD load script.
NB. 
NB. Caveats:
NB.
NB. No error checking.
NB. Requires standard J profile.
NB. In addition to standard JOD directories this script also requires 
NB.   the staging directory: .../joddev/alien/stage/jod/
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 08may28 rename/relocate compressed script to root of jod addon
NB. 11feb05 use (jpathsep) to show portable style file paths
NB. 11feb08 coinsert 'ijod' added after moving JOD interface to ijod
NB. 11nov24 tested on linux
NB. 14nov14 adjusted for j 8.03 (runs on win32 J 8.03 - not 64 - no zfiles)
NB. 15mar15 remove zfiles - redirect build to .../joddev/alien/stage/... directories
NB. 17jan09 improve caveat notes for running on jconsole versions
NB. 17mar03 macro script converted to verb
NB. 19aug27 load task addon first for J 9.01

'JODSTAGEDIR JODGITDIR JODADDONDIR JODSCRIPTDIR'=. y

NB. set vmd - version, make, date
'jodversion jodbuildcnt'=.2{.x
jodbuilddate=. alltrim tstamp''
jodbuildcnt=. >:jodbuildcnt

NB. increment build and save - must be done before 
NB. script generation to insure header and class JODVMD match
JODVMD=.(jodbuildcnt;jodbuilddate) (1 2)}x

NB. save incremented version, make, date in dictionary
assert. >0{(WORD_ajod_,NVTABLE_ajod_) put 'JODVMD';WORD_ajod_;wrep_ajodstore_ 'JODVMD'

NB. set output files
JODFILE=. 'jod.ijs'

NB. working JOD addon script
JODADDONFILE=. JODADDONDIR,JODFILE

NB. backup of JOD script placed in put dictionaries script directory
JODSCRIPTFILE=. JODSCRIPTDIR,JODFILE

NB. JOD staging directory under put dictionaries alien directory
JODSTAGEFILE=. JODSTAGEDIR,JODFILE

head=.'NB. System: JOD  Author: John D. Baker  Email: bakerjd99@gmail.com',LF
head=.head, ('NB. Version: ',(jodversion),'  Build Number: ',(":jodbuildcnt),'  Date: ',jodbuilddate),LF
smoutput head

NB. turn off white space preservation during JOD load
NB. load task addon before executing any JOD start up code - changed for J 9.01
hc=.head,'load ''task''',LF,'(9!:41) 0',LF

NB. get preprocessor script - leave only header comments
s=. dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodprep'

NB. main JOD classes
g=. ;: 'jodon jod jodstore joddob jodmake jodutil' 

NB. collect group dependents 
deps=. gdeps&.> g

smoutput 'compressing ... '
NB. dewhite group headers 
h=. dewhitejscript&.> {:"1 >{: GROUP_ajod_ get g

NB. compress all nondependent words in each group (a cruncher)
code=. , }.@:compj&> ((}.@:grp)&.> g) -.&.> deps

NB. combine header and word definitions 
s=. s , ; , h ,. code

NB. append post processor script
s=. s, dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodpost'

NB. remove a few remaining redundant blanks after 
NB. assignments - their presence annoys me!
s=. hc , '/ =./=./ =:/=:' changenqt s

NB. save compressed load scripts
smoutput 'output file locations:'
(s=. toJ s) write showpass JODADDONFILE
smoutput s  write showpass JODSCRIPTFILE
smoutput s  write showpass JODSTAGEFILE
updateJODfiles s

NB. update build history - stored as plain text macro
JODBUILDHISTORY=. (1;0 2){:: MACRO_ajod_ get 'JODBUILDHISTORY'
JODBUILDHISTORY=. JODBUILDHISTORY,(2#LF),head
assert. >0{MACRO_ajod_ put 'JODBUILDHISTORY';TEXT_ajod_;JODBUILDHISTORY

NB.byte size of generated plain text script
smoutput (":#s),' script bytes'
smoutput 'JOD compressed build complete'
)

checkback=:3 : 0

NB.*checkback v-- return list of put dictionary backup numbers.
NB.
NB. monad:  ilbn checkback baObj
NB.
NB.   checkback {:0{DPATH  

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__y do. jderr ERR103 else. ok bn end.
)

ed=:3 : 0

NB.*ed v-- edit dictionary objects.
NB.
NB. (ed) typically fetches, formats and places object(s) in an edit window.
NB.
NB. monad:  ed cl|blcl|bt
NB.
NB.   ed 'wordname'
NB.
NB.   ed ;:'many words mashed into one edit script'
NB.
NB.   NB. edit contents of (name,value) and (name,class,value) tables
NB.   ed ; }. 0 10 get }. dnl 're'
NB.   ed ; }. 4 get }. 4 dnl 'build'
NB.   
NB.   NB. place many backup versions in edit window
NB.   ed ; }. bget <;._1 ' word.12 word.11 word.09 word.02'
NB.   ed ; }. 4 bget <;._1 'macro.9 macro.7 macro.2'
NB.
NB. dyad:  iaObject|ilObjOpt ed cl|blcl
NB.
NB.   1 ed 'testname'           NB. edit test
NB.   0 9 ed 'worddocument'     NB. document text associated with word
NB.   2 ed 'group'              NB. generate entire group script and edit
NB.   2 1 ed 'grouptext'        NB. edit only group text

0 ed y
:
if. 2=#$ y do. 
  if. badrc uv=. checknttab3 y do. uv return.
  elseif. 3 = {:$ uv=. rv uv   do.
    if. 3 >: <./ jc=. ;1{"1 uv do.
      NB. convert binary nouns to linear representations
      jc=. I. 0=jc
      if. badrc nv=. 0 nounlrep__MK jc{uv do. nv return. end.
      uv=. (rv nv) jc} uv
      NB. format words for editing
      text=. _2 }. ; (0 {"1 uv) ,. (<'=:') ,. (2 {"1 uv) ,. <2#LF
    else.
      NB. format non words for editing
      text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF 
    end.  
  elseif.do.
    NB. format non words for editing
    text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF
  end.
  NB. set default object name - if there is more than one 
  NB. object reset (x) to prevent affixing document command  
  oname=. ;0{0{uv [ x=.  1 < #uv 	
elseif. badrc uv=. x obtext y do. uv return. 
elseif.do. 
  'oname text'=. }.uv 
end.

NB. append user defined document command 
NB. the pattern {~N~} is a name placeholder, e.g.
NB.   DOCUMENTCOMMAND_ijod_ =: 'showpass pr ''{~N~}'''
NB. append only when editing single words
if. (x -: 0) *. wex <'DOCUMENTCOMMAND_ijod_' do. 
  text=. text,LF,LF,('/{~N~}/',oname) changestr DOCUMENTCOMMAND_ijod_
end.

oname et text
)

releasejod=:4 : 0

NB.*releasejod v-- final JOD release steps.
NB.
NB. dyad:  blVersion releasejod blclDirs
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: --------------------------------------------------------------
NB. 11feb14 coinsert 'ijod' for new locale
NB. 11may25 (IFWIN) excluded from some (gdeps) tests
NB. 12oct12 (IFWIN IFIOS UNAME) excluded from (gdeps) tests
NB. 15mar17 remove zfiles - redirect build to .../joddev/alien/stage/... directories
NB. 17mar03 jod macro converted to verb
NB. 19nov29 remove (beforstr, afterstr) in (jodstore) test - verbs in superclass (jod)

'JODSTAGEDIR JODSTAGEPDFDIR JODSTAGEDOCDIR JODGITDOCDIR'=. y

NB. insure build dictionaries are open
assert. >0{od ;:'joddev jod utils' [ 3 od ''

jodversion=. ,>0{x

NB. JOD staging directory under put dictionaries alien directory
locsfx=. ;locsfx__JOD__JODobj {.{:"1 DPATH__ST__JODobj 
JODDOC=. (jpathsep ".'DOC',locsfx),'jod.pdf'

NB. check that all group dependents are in associated groups
NB. this is not necessary but highly recommended for groups
NB. that are used to form classes
JPROFILE=. ;:'IFIOS IFWIN UNAME'
assert. (a: -.~ (gdeps 'jod') -. JPROFILE) e. grp 'jod'
assert. (a: -.~ (gdeps 'jodstore') -. JPROFILE , ;:' beforestr afterstr') e. grp 'jodstore'
assert. (a: -.~ (gdeps 'jodutil') -. JPROFILE) e. grp 'jodutil'
assert. (a: -.~ gdeps 'jodmake') e. grp 'jodmake'
assert. (a: -.~ gdeps 'joddob') e. grp 'joddob'
assert. (a: -.~ gdeps 'jodon') e. grp 'jodon'
assert. (a: -.~ gdeps 'jodtools') e. grp 'jodtools'

NB. !(*)=. manifestjoddocument historyjoddoc
sl=. ;: 'manifestjoddocument historyjoddoc'
assert. rc [ 'rc jodscr'=. MACRO_ajod_ get sl
({."1 jodscr)=. {:"1 jodscr

NB. run JAL manifest - tests script
((0!:110) :: 0:) manifestjoddocument

NB. update document scripts
assert. 0<(toJ manifestjoddocument) fwrite showpass JODSTAGEDOCDIR,'manifest.ijs'
assert. 0<(toJ historyjoddoc) fwrite showpass JODSTAGEDOCDIR,'history.txt'
assert. 0<(toJ historyjoddoc) fwrite showpass JODGITDOCDIR,'history.md'

if. fexist JODDOC do.
  NB. copy jod.pdf to stage directory
  pdf=. read JODDOC
  pdf write showpass JODSTAGEPDFDIR,'jod.pdf'
  smoutput 'JODDOCUMENT updated'
else.
  smoutput 'JOD document not found -> ';JODDOC
end.

smoutput 'JOD distribution build complete'
)

splitbname=:'.'&beforestr ; '.'&afterstr

tstamp=:3 : 0

NB.*tstamp v-- standard j 8_07 library timestamp.
NB.
NB. A renamed version of the standard  J 8.07 era  timestamp. JOD
NB. used an earlier version of this verb, see (tstamp2), that did
NB. not handle all zero timestamps.
NB.
NB. monad:  clDate =. tstamp il | fl
NB.
NB.   tstamp '' NB. now timestamp
NB.   tstamp 0 0 0 0 0 0  NB. zero stamp

if. 0 = #y do. w=. 6!:0'' else. w=. y end.
r=. }: $ w
t=. 2 1 0 3 4 5 {"1 [ _6 [\ , 6 {."1 <. w
d=. '+++::' 2 6 11 14 17 }"1 [ 2 4 5 3 3 3 ": t
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
d=. ,((1 {"1 t) { mth) 3 4 5 }"1 d
d=. '0' (I. d=' ') } d
d=. ' ' (I. d='+') } d
(r,20) $ d
)

tstamp2=:3 : 0
NB.*tstamp v-- time stamp
NB. older timestamp - replaced with new J definition
yy=. <.y,(0=#y)#6!:0 ''
'yy m d h n s'=. 6{.yy
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
f=. _2: {. '0'&,@":
t=. (2":d),(m{mth),(":yy),;f&.>h,n,s
r=. 'xx xxx xxxx xx:xx:xx'
t (I. r='x') } r
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:p51,pC3+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1Gg41+>Pbr2]t"5+>GSn2)l^5
0d&51+>b2t2'=V-+>bu!0esk-3?U%2+>c&#0ea_,1*A;++>Pbr2]sq2+>Y,t1*AS"2`;d<+>Yr!
3$:%:+>Ghu1c?I:+>kns1*A>.+>GPm1,C%-0H`,1+>t>u1E\V!2*"6S8l%ihDKKH1Amo1\@rHC!
+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\
H:gt$FDl)6F%T4r<)6:`;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.
De*R"FCfK)@:Njt8U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f
9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&
APGHm:-hTCD..['D09\<Ch7KsFD)e8AftVu@ruF'DIIR2+DtV)ATM9hG%#3'+C\bhCNXS=G%G]8
Bl@l3DIIBnF(/QfCMn93Bl7F$ASl!rFE8R6@:O(qE$0+.@r!2sDfor>+CT.u+C\bhCNXSLEb0<6
DfT9.Bl@l3FD5T'F*(i-E+36cCNXT,@<?(%F(8WrF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=Anc'm
F!+n/A0>o(FEMVAF!+q#@r$4++Cno&ATM<jBOt[hDIIBnF(8lp@r$-.@UWb^F`8I@@;TQuE+*j1
ATD[0@V97oEb0?5Bk;I!F!,C1C1UmsF!,(8Df$V9F`\a:Bk)7!Df0!(Gp$R)@r$4+F(/cnFC])q
A8bsjATT&(@:O(qE$0=8EcYr5DK?q=Afu2/AKYMt@ruF'DIIR2+CoD#F_t]-FCJloFC]<"F_t]-
FD#0,+C\bhCNXS=G%G]8Bl@m1+E(j7DdmHm@rri(De!p,ASuU2@V97oAU&01@;0UlATT&(@:O(q
E$0=8EcYr5DK?q=Afu/.DfTqBDdmHm@rri)G]7J-DIIX$Df0W*B4Z0tF*(u<FD#0,+C\bhCNXS=
G%G]8Bl@m1+E(j7B6%p5E%c9TBlmo/BOtU_ATDj$B4Z1'@VTIaFE;)+F<GL2C1UmsF!,(8Df$V+
@:O(qE-#K$F)5Q3FD#0,+C\bhCNXS=G%G]8Bl@m1+E(j7B6%p5E%c9TBlmo/Ch[s4F(0$'Ch[s4
+E(_(ARfh'+DG^9E-67FA8,OqBl@ltEd8d<@<>pe@<6!&@UWb^F`8I8Bl%@%@W$"'ARTUhBQI`n
EarcoF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=DIIBn+Dbb5FE8R:DfQtABl.g*AKYJr@<,ddFCfJ8
Ch[s4+E1b2FCfK1F(0)sFD,`-G[b)kCNXS=Anc'm+E1b2BHU`$A0>JuCh4`,@;TQuF*2),Bm=*/
AU&<5Blms*EarZ'@;^?5ASlC.Gp$R)@r$4++EV1>F<G[D+Dbb6ATD3q+Cno&@<?d6AR]drCh.:!
A7KOpE,oN2F(JlkF_PZ&F!+m6Ap%p+Gp$U8D/aN,F)to'+A,Et+Dbt)A0>u*F*&OG@rc:&FCSuq
@r#O^@r$0tF*&O:DfQtBBOr<*Eb0<'DI[6#De:,2F`\a:Bk)7!Df0!(Gp$R)@r$4++D,>(ATMEn
ARoLs+Co1rFD5Z2@<-W9DdmHm@rud4ASbpdF(K*)A7fOn@;I&Y:IH=GASbpdF(HJ8FCfE4F)Yr0
FCK,rD.Rd-Ch[u6@UWb^F`8I@@;TQuE+*j1ATDZ2@r-7.FCB$*F*(i.A79Lh+DN#Y?SFD]Ch[@!
@<-W9FD5T'F*(i-E--/C@;Ts=FD5T'+EMX5D/^V9Ch.*t+EV=7ATMs%D/^UL+ED%4CgggbA0?)1
FD)e7ATo7h+Co%qBl7X,Bl@k                                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DlU:+>P&o0d&D62`;d50H`,+3B/-90H`)*1,C[.0ea_11,pC:+>Pi32BX_5+>GT*3?U(3+>PW-
1E\D2+?2;;@V97o;f-GgAM>f567s`sB4Z0`D/X3$0JFVk/M/(n@V97o.3N&>B6A'&DKI"BD/X3$
+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!
Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b
%15is/e&._67sB'+>PAg-u*[2FCfN8ATB4BBlbD*+Dbt)A0>r'EbTK7%15is/g)8G$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f`cU@k]_K$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1
Eb0-1+=CW,F(H^.$4R>;67sBt@;BEsC2[X)ATMs)EZet7Df$Uh:IH=9BleB:Bju4,Bl@l3A8,Oq
Bl@ltEbT*+%15is/e&._67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU
+<YN;F!)iFDe*s$F*(u6-OgE!Ddd0!-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]
CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%17,c+Bos9Eap5.Ddd0TD/X3$
-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3VDdd0TD/X3$
.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&+AP6U+?M;#+AP6U+F.C4D.R`1Df-[,$4R>aA8,Oq4ZX]5FCfN8C2[W:
0II;:%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUEHQ2AAN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!
3^>)V-7:/g-RgJR$;No?%15is/g*nU/g+e<DImisFCcS'Cht55Df]u6@VfTuG%#3$A0<:0B4Z06
+CT;'F_t]-F<GO2FED)7DK?6o:-pQB$;No?+DPe(4ZX]]6:s[6<),ef@;9^k?S"T:6W?WQ:-hc\
?X[\fA7$H%%15is/e&._67sBU67sC(@;KXg+DbV$F<DuV.3N&>B6A'&DKKqB/KebF@r-9uBl7Q+
ASc'kARlo3GUX(/:-pQUCgh?s4ZX]64D?E%.3L/a-p/\-+DPe(.3L/a-nK]n:I7ZB6W?fJ?X[\f
A7$cI3$:41+:SZQ67r]S:-pQU:-pQUG%#3$A0>o,B4uB0.![6a@<-"'D.RU,+E1b2FCfK1Et&IO
67sBU67sB'+<VeE@;TQu+<W`g+DtV)AM.J2F`):D+?L\gCh[s4+E(j7@UWb^F`8I@@;TRs%15is
/g,1CEb@Nr+=D&8D.P(;+?L\nDIIBn/n8gBDKI6K4!5Xn@VfOj6;Cs+ATK4.$;No?%15is/g*nU
/g,=GCh[E&-t6h#F=A>@EbBN3ASuT4E+*j1ATD[0%15is/g+n;Eb@Nr+?Ui&+?Lc%+<iin/j:C4
+>=on+F>:e+<Wij-p/k"@V97o+=AT\/0IVI+>Fui+F>4Z4D\GHB.4rS+?V&lF`2A5-8%J)I6)CW
Eb?gD/0K:#Eaa!$%15is/e&._67sBU67sC)BOu'(.!R0`BlbCS+?^i88OHHK:JO2R=Wh-jGp%!5
D.Oi/@<-H4De:,0@;TR.@rHL-F<GO2FED)7DK?q/Eb-A-B5VX.ARl5W:-pQUC12-q4ZX^#@<-!'
/0H;t+C\tpF<DqY-RU8a4!5n.+C\tpF<DqY/n8gBDKI6R-QkJn-T*#UB4Z0-@VfOj6Z7*bFE8f=
$;No?%15is/g*nU/g+eIDfp#?+CT.u+EM[>FCfM9BOQ'q+CT.1@:Wn_FD5Z2@;I&r@<6!&FDi:6
ATVEq+C\bhCNXS=DIIBn+Dbb5FE7lu:-pQUC12-q4ZX^#@<-!'/0H;q+>G!JB4Z0--RWe?D.P(B
-QkJn-Scf!+C\tpF<DqYDIIBn/n8gBDKI6R-QkJn-Scf!+C\tpF<G%/@r+J,@;TRs-OgDX67sBq
@<-!D3Zr0GEb?LG+=Arf0d'q<ATT%B-Z3@0ALAiQ+?L\n1E\Cp@V97o+=AOS@;TR.@rHL-F=/F`
+?L\n1E\Cp@V97o+C].sCdLm*D.Rc9%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+Co&"
ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g
0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBlEaa$#+CT/5+C\bh
CNXT;+:SZG9KbEZHTHL++@K$l<(LA';cI+28l%in@VQ>Z0d&"u+=Jrf3]/cD+>G!LBlY=_5tbQl
6qf-Z.P>FMAg\#p%15is/g,7VGp%0>@<,jkBl7Q+GA(Q*+EV:.Eb-A%Eb-A2D]iLt@r$4+F!*%W
AU&0*@ru9m+D#S6DfQ9oDImi2@V97o+=D&FFD,B+B.",qDImi2@V97o+?MV3FDi:CAS!4u$>sEq
+C\tpF<DrEATD?0%13OO:-pQU@rc-hFCcS:BQ@Zq+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums
+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.jE+*6lA0>u)Bk)5o$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+
Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#TtFC])q
F:AR"%15is/g,7LBl[`,DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)
A5d>`CLqU!F*',G$9g.jE+*6lA0>u)Bk)5o$4R>;67sBU67sC%Df'&.@UX=l@j#K'G%#3$A0><$
B6A'&DKKqB/KeVLE+NO$ARlopEcQ)=%16uaEZd%Y3$9mt@V97o+=DDBEbAa'Ec5i.-QjO,67sBs
BleB;+E(j7@<<W/Df^"C1*@#5DImi2@V97o+=AdM-OgE#ATAnM+C\tpF<Dq`/MSU^$>sEq+>P'K
B4Z0--S@#!%16uaEZeh(ATT%K%16uaEZeh(ATT%W-RT?1%15is/g*nU/g*b/DIIBnF!,[@FD)e.
D.7'eA7]9oCi<flCh7Z1@<,p%DJsV>Bl5%c:IH=9Bk)7!Df0!(Bk;>p$>sEq+C\tpF<DrFF'i9u
Ec5i.-OgE#ATAo&B4Z0--Y[X/?Y+ClDI6apEc5i.ATB.-$>sEq+C\tpF<DrPFD5Q-?[$O/DJ*<(
%16uaEZeh(ATT%B@4!?E+<VdL+AP6U+Du+>+CQBb+DtV)AIStU$;No?+AP6U+CT5.ASu%"+CfP7
Eb0-1+D,>.F*&O6@:O(qE$0%@D.7's+:SZO5uU`L:/t"O3ZpL=+F>5?DJUFC/ghbN$>sEq+C\tp
F<DrJH!b#hA7$]89L2TV6;CNT%16uaEZeh(ATT%BD0]Jq@UWdp/5/?.<'j>[9aqGIATAo&B4Z0-
-YddFF=(=#@<Z=+CaUc-5uU`L:/t!t$4R>;67sBpDKBr@AKZ/)EbTH7F!,C1C1UmsF!+n3AKY])
+DbJ-F<G%$@r$4+%159QHZ*F;FC])qF<Fd11E^UH+=ANG$;,G^FAQOW@q]G!4ZX^"/g)qZ$:o;W
CLqcZDfU+d3ZoeA+CoC5GA(E,+A!\dD]iM#@psM$AKXPe@;R-2BOQ!*8K_GY-OgDQDe)gkBl%Kr
BQQBu+=8^)%15gT<+09NFB2sn@Qcap.k_>=9mK0PE,95uBlmBeEah0m+>Y-$+>=63GT\LZGmt*0
%16Ze+EVI>Ci<f+E-67F4$"`]F`VY$ART(^AU,ChF`(u+GslRkGp#UqA5mbeCh[NqF<F;'<+09N
FB2sn@N\Bj7<icfBk(k!<b6;\-Qij*%15is/g,4RD.Oi2BQ%p5+EqaEA0>H.E,8s#@<?4%DK?6o
ATAnI+?1K_F`\`R8p,2s:h='FBOuH:4""HWAKZ).Bl7R)+ED%%Ci"A>C3=T>+E1n#@q^-8%16Ze
+>=ot+E2IF+=Bm/7<icfBk(k!<b6;\-T`\eG]7J5@qg$-G%G]'F!,+,F<GI>+ED%7E+NO$+D,Y4
D'3R9B6A6;F!hD(%15is/g,4RD.Oi+Df021GAhM4+D#e:Cgh3iFD5Z2Et&IBCi!0kEbeEg:i'Qc
4ZX]>+?CW!%144#@;Ka&GAhM;+CT.u+Du*?E,8s.+DkP&ATJu/@:O'q@3B*'Cht5'Dg;d!+<Y*/
C`mq?Ebce+DIal-D]j"8@<iu4@;BFq+DP=pCER%.A9D^)+C]87%144#@;Ka&GAhM;+CT.u+Du*?
E,8s.+DkP&ATJu/@:O'q@3B*'Cht5'Dg;d!+<Y*/C`mq?Ebce+DIal-D]j"8@<iu4@;BFq+DP=p
CER%.A9D^)+C]87%144#De:,%Dfp)AAKY_r@r!32@<3Q"+CoV2C`m2*Gp$O5H$<\B+EMHD@UWb^
+EVNEGAhM;+DP=pCCLV"%13OOATAnI+?:Q`F`\`R7rMp;GA1l-B4uB74$d\!=)W+p:2`sF@<i:h
ATAnI+?:Q`F`\`R9mK]H@qg$cATD6-4$d\!=)W+p:2`sF@<i:h%16'GF*(AmG]YW&3ZoelATMr9
FCf]=+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(D-p^dDe*3&-OgD^ATMrmAU&;O
4ZX]5D/XH++EV19F<G[:G]Y'F@:WplF`(o5F_)\;D]j.8BlbD=ATMrS+=A]a3b2r8DKTf'@;9^k
?RI31$<1SXFAugrF>?!?+=C`DASrW-DfTD3FCfN8+EV1>F<GF/A7Zm+DJ=*5AKZ)5+EV:2F!,R9
F*'Gc-S-H&A8,RlF_tJoC2[Wi-RT?1ATAnJ+E2IF+=C-"F*(AmG]YVe4&fd4FAugrF>+.2ATAnJ
+E2IF+=C-"F*(AmG]YYf4&fd4FAugrF>443ATAnJ+E2IF+=C-"F*(AmG]Y\g4&fd4FAugrF>=:4
%15is/g,4RD.Oi2BQ%p5+CT.u+Dbt6B-;;-F*&O9G]7J-DIIX$Df0V*$>"6#0d&FuE-67F-WFYu
FAugrF>>4*-Z<s8DBO%4F*)IG@<,p%D/XH++ED%:ARTChDJ()6BOPd$DfB9*+Cf>#AL@ooATAnJ
+?:Q`F`\`R<+U,m<+U;r0IJqJCi!0kEbeEg:i'Qc%13OO9jqOPDcC:mF>,j=+=D#7@rcK1FCf]=
+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(D-p^dDe*3&-OgDW@:O=r<+U;r0g.Q?
-Z*dBAKYhu@rcK1FCf]=+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(D-p^dDe*3&
-OgDoEZd1]E-67F-V\#ZEc4ogG]YVe4&eXN<*s'KDe*3:9jqOPDcC:mF>+.2ATAnM+E2IF+=Bll
@rcKeAU&;O-Tb9r=B&X9C2[Wi4&'-nEc4ogG]YYL$4R>;67sC%Df'&.F(fK4F<G"0A0>],DJ()6
ATMr9AU&01@;]LqBl@m1%16Ze+>b3#+E2IF+=Bll@rcKeAU&;N-T`\mBl7W-D.-ppD]iV9E,8s#
@<?4%DC5l#ATAnM+?:Q`F`\`R9jqOPDcC:mF>,((6#:@=DfTVgDbt7YGmt)i$;No?+EMI<AKYW+
Dfp#?+CT.u+EM[>FCfM&$>"6#B6%r69mKZZF_55UEc6)>4ZX]I3[[XI;fm.oAk-l[F`8HtGuS3^
BlmBeEag.cGsussCh[BnFB2sn@ODTlATAo+Ec<-nF`VXpEc6)>4ZX]I3[[OBF*'omDfp"A8p,2s
:h='FBOuH389JfcAU-[^Ed8ctDe)gkBl%KrBQPU2$>"6#1E^=NE$/+kF*(>tDeio_F_Pr/4ZX]I
3[[m<F*(>tDeio_F_Pr/+B2onFAugrF>+h:ATMrmAU&;P-OgCl$;No?+DG_7ATDl8A8,OqBl@lt
Ed8d<De!p,ASuT4/KebFF*2M7+EV19F<G+.@ruF'DIIR2+CoD#F_t]-F<G:=+Eqj?FCeliCh6QT
$?Tfm@rrhF3ZpL=HXpi$+>=oI$>"6#A8lU$F<Dr!:IA,V78?fM8OHH)4#%0OATAnN+E2IF+@KpR
6uQR7AU&;[3Zoe\Bk)7!Df0!(Gp$X9@s)X"DKI"CAU&;>D.-sd+E_R9EHPh8FDi:DBPDN1FCfN8
3Zoe$,!'7KA8ZO,?X[\fA7$]3%13OO:-pQUB4YslEaa'$F!,:-F*&O6@:O(qE"*.<0RIbI@r#Tt
FC])qF<D#"9L2TV6;CNT4ZX]I0d(fc@W$!)-S?bh%13OO:-pQU@UX=l@j#r'Ch[E&@<-"'D.RU,
Et&IfEZeh(ATT%B8p,2s:h='FBOuH:+<VdL+<Vd9$>"6#@V97o+=Bd(F*(5i@:Nt^Gpb.:5uU`L
:/t!t$>"6#@V97o+?MV38p,2s:h='FBOuH389JfcAU-[^Ed8ctDe)gkBl%KrBQPUE%16Ze+C\tp
F<Dtn3[[OBF*(5i@:Nt^Gp#UqA5mbeCh[NqF=/L[/1)u5+?W=`;cH(Y<D=SY+<V+#ATAnI+C\tp
F<Dr'F`VY$ART(^AU,XG+<VdL+<V+#ATAnI+C\tpF<Dr'F`VY$ART(^AU,XS9L2TV6;CNT+<V+#
ATAnI+C\tpF<Dtn3[[I@DJNg/6uR*k+@g?\<-N%mBkM+$-Rg/h-8%J)4A8%><'j>[9aqG@EZd(Z
@V97o+=C-"F*(AmG]YVe+<VdL+<VdL%16Ze+>G!JB4Z0--WFYuFAugrF>5-o9L2TV6;CNT+<V+#
ATAnJ+C\tpF<EY+-WFYuFAugrF>+h:ATMrmAU&;P-QjNS%16Ze+>P'KB4Z0--VAN&F@U@iF`8]N
+<VdL+<Vd9$>"6#1*C%=ATT%B8p,2s7riNjE$m215uU`L:/t!t$>"6#1*C%=ATT%V3[[OBF*'om
Dfp"A9mKZZF_55UEc6)>-OgD*+:SZQ67sB:+C\tpF<DrK@;TR'+<VdL+<VdL%15is/g)qm@V97o
+=D&8D.P>0Dfor>-QjN@$;No?+>Y-LB4Z0-@VfOj6;Cs+ATJt:%144#%16Ze+>b3MB4Z0--V\#Z
Ec4ogG]YVe+<VdL+<V+#ATAnM+C\tpF<Dr*@:O=r<+U;r0IJDF5uU`L:/t!t$>"6#1a$7?ATT%V
3[[X1@rcKeAU&;N+AH9SEc4ogG]YVe+<V+#+<V+#:-pQUF)Po,+CoD.-ZgJ@@<,p%@psFiF!(o!
ATAnN+C\tpF<Dr3@;KXg:18!NF$X;GAT2a&A1&KB+<Ve%67sC"F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKI"AATW'8DIm?$+<V+#ATAnN+C\tpF<Dr&@;Sq]8S;pZEb/c//5/?.<'j>[9ctQR67sBpAftPk
@r$4++Du==@V'R&BlbD9Eb0<'DKI"8F<GFCF*&O6AKYo,+<V+#ATAnN+C\tpF<EY+-[&p7Bk/?(
@;TRs+DGJ+DfTE"-QjO,67sC"F`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"AATW'8DIm?$%13OO:-pQU
Dfp.EDe:,4@;]^h+C\bhCNXS=DKTf*ATDi7ATDg0EZf:CF:ARpATAnN+C\tpF<Dtn3[\WZG%#3$
A0>>i@r$4++Du==@V'R-.3L/g/j:C?-S?bt,!%G4+=eQY/q#?G5uU`L:/t"2+:SZ#+:SZhEZd%Y
3$;[CATT%B9mK0PE,95uBlmBeEagC=+<VdL%16Ze+>=ot+C\tpF<Dr*GsussCh[BnFB2sn@OE^#
5uU`L:/t!t$>"6#0H`=t@V97o+?MV39mK0PE,95uBlmBeEag.]De)gkBl%KrBQPU2$>"6#0H`@u
@V97o+=BZtA5mbeCh[NqF=/1R+:SZhEZd%Y3?VdDATT%B7rMp;GA1l-B4uB7/5/?.<'j>[9aqF=
$;No?+>=ou+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU0d&Fu@V97o+=D&8D.P(;+<VdL+:SZQ67sB8
+?1KQB4Z0--Z3@0AM.J2F`):K%15is/g)kk3$;[CATT&(Ch%9J:18!NF!)S7$;No?+>G!!+C\tp
F<DrK@;TR'+<VdL+<V+#:-pQU0d&J!@V97o+=D&8D.P>0Dfor>-OgDX67sB8+?:QRB4Z0-@VfOj
6;Cs+ATJt:%15is/g)nl3$;[CATT%BDIIBn-QjNS+<Vd9$;No?+>P'!+C\tpF<DrK@;TR.@rHL-
F=.M):-pQU1*AP!@V97o+C].sCdLm*D.Rc2+:SZQ67sB9+?:QRB4Z0--Z3@0ALATC+<VdL%15is
/g)nl3?VdDATT%BDIIBn/n8gBDKI68$;No?+>P'"+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU1E\Y"
@V97o+=D&8D.P(;+<VdL+:SZQ67sB:+?1KQB4Z0--Z3@0AM.J2F`):K%15is/g)qm3$;[CATT&(
Ch%9J:18!NF!)S7$;No?+>Y-#+C\tpF<DrK@;TR'+<VdL+<V+#:-pQU1E\\#@V97o+=D&8D.P>0
Dfor>-OgDX67sB:+?:QRB4Z0-@VfOj6;Cs+ATJt:%15is/g)tn3$;[CATT%BDIIBn-QjNS+<Vd9
$;No?+>b3#+C\tpF<DrK@;TR.@rHL-F=.M):-pQU1a"b#@V97o+C].sCdLm*D.Rc2+:SZQ67sB;
+?:QRB4Z0--Z3@0ALATC+<VdL%15is/g)tn3?VdDATT%BDIIBn/n8gBDKI68$;No?+>b3$+C\tp
F<G%/@r+J,@;TRs+<V+#%16Ze+@KpR6uQR%@:O(93Zp:&@V97o+=ANG$4R>;67sBkDe!p,ASuT4
FCf]=F!,=BF*&OA@<?!m%14LF+F?.#+?gor/g*Pr@mk6F6=FA>.3L3'+@KpR6uQR7AU&;+$6UH6
+<VdL+<Vd9$>"6#2'?@@ATT%g5uU`L:/t"2+<VdL+:SZhEZd4^@V97o+FPjb@W$!)-S?bh+AP6U
+CoD#F_t]-FE8R:Ec5e;@;Ka&@UWb^F`;C2$6UH#$>"6#7riNjE(",V4ZX]@+>G!JB4Z0--V\kb
FEM2-7riNjE$lbN%13OO:-pQUB6%p5E$/t2F*)IGD09oA+DkP/@qZu:+E):2ATAo-F!,1;Eb0&u
G%#91%14L:3dr25HTE]#4s58++@gHjF`9`WF=A=a3Zp(:INX%k9mKZZF_55UEc6)>%144#+<V+#
ATAnK+>G!JB4Z0--V\kbFEM2-7riNjE$m215uU`L:/t!t$4R>;67sB9+>G!JB4Z0-@VfOj6;Cs+
ATJt:%15is/g)qm0d'q<ATT%BDIIBn-QjNS+<Vd9$;No?+>Y,p+C\tpF<DrK@;TR.@rHL-F=.M)
:-pQU1E\Cp@V97o+C].sCdLm*D.Rc2+:SYe$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GUDJVXJ
F(o,<0ht%f.Um:36=FqL@k]V[F=f'e@UX=l@j!1/DJUaE@UWb^F`8I@@;TQuCh[s4+EV19FE9&D
$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(OV.3N).@r$4+F!,:;@:Wq[
+EqOABHUl(Dfo]++EqaEA9/l8D]in*FCSu,DIIBnF"Rn/:-pQU+<VdL+=M>CF*)/8A2#_e+DGm>
Ci<`mARlomGp%3BAKZ)+F*'GcEccCG-Z!^0A9;C(F>,C'A8,OqBl@ltEd9#A$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:mARdJL%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.
D..]F1a$p[A79RkA0>K&EZdss3%cmD+EM+*3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(
:-pQU0fX#YE\]Bm@:Wn[A0<:>@:O(`.3N_N+DG_7F`M%9ASuF/B4rDs@:O(qE-!.5G\M5@+D,P4
+EV19F:AQd$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RA
E,9H&?U6tD@UX=l@lZP0?TgFm-UC$a@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.
;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0ddD;%15is/g,7LATD?)D09oA+C\n)@;[3+E+No0
A8,OqBl@ltEd8*$DImi2@W$!)-RT?1DImi2@W$!)-S?bU$>sEq+C]5)+=D2@@P0Al-OgCl$>"6#
De'u4A8,Oq%15is/g,@VEb'56Ao_g,+Dl%<F<G(9EcP`/F<G%$@r$4+%16Ze+C]5)+=ANG$4R>;
67sC&ATMs7+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(qE"*.cEZd(Z@W$!)-RT?1%15is/g+_I+Ceu)
ATD2g$>"6#1*C%DC`k)Q%16Ze+>Y-LDJUFC-OgDoEZd1]@W$!)-RT?1%15is/g+V@C`lGJ;cHFn
+Dkh5Ec5u>+CoA++D,P4+EV:.+Dl%<F<G(9EcP`/F<G%$@r$4++>"^IG[k<(F:ARP67sBiDJUG6
DJXS@F(Jd#@q]Fp+CQC6Bl7R"AKYr7F<G+.@ruF'DIIR2+C\bhCNXS=FD,6+AKY].+Du*?E+*j%
%15is/g+h=DI[6#FD,6+AKYE%AKYl/+E1b2BHV56A7]d(Eb0<7Cij_@Ch[Zr3ZoP!+C?iGA8Z3+
-RT?1ATAnM+>Y-LDJUFC?UR[h-QjO,67sBt@:O=rF!,%3A8,po+EqOABHS[06r-c0+DG^9@s)g4
ASuT4@UWb^F`7csATAnK+>P'KDJUFCDe(4<+<Ve%67sBnEc6)>F!+t2DKK<$DJ=!$+EM[7F*)G:
DJ((>De(4<Bl5&'F`MM6DKI"1@:O(qE"*-`$>"6#0H`(m0HahBC`k)Q+<VdL:-pQU@;Ka&DJsZ8
F!,17+CfP7Eb0-1+C\bhCNXS*$>"6#0H`(m0d'qCC`k)Q+<VdL:-pQU@;Ka&@:XOmEaj)4Bl5&'
F`MM6DKI"1@:O(qE"*-`$;No?+DG_7F`M%9ASuF/B4rDs@:O(qE-!.5G\M5@+D,P4+EV:2F!,R9
F*%iuATAo4@:O(`+EV..@rr.eATAo4@:O(`+EV..@rr.e%15is/g,@VEb'56Ao_g,+E1b0FD56-
Cgh?,@UWb^F`;C2$;No?+C].sC`mY.+C\bhCNXS=DKTf*ATAo(Dfg%O+D#1H+?V_<0d%hr1,CO;
2_HgC/ho490f1L;1G1C;/hf+0%15is/g+bEEc#6,FCeu*F)N10CiF&r+EMIAFE8RA@<?!m+Du==
ATDKp+EMIAFE7luATAo&DKTf;4ZX]pDJUFC/gh)8@V\+f+?hN,@W$=*F$2Q,I4cXODKTf;%13OO
ATAo&DJUG)CEO`B+<VdL+<VdL+<Ve%67sB'@W$!)-S@,4-QjNS+<XEG/g,">FCSuqF!+n-C`mq?
Eb'56Bl5&+Bm+'*+C\bhCNXS*$>"6#@W$!)-ZWd--S/_B+<VdL+<VdL:-pQU+C]5)+=D2@@P0Ao
-QjO,67sBt@<?!mATJu&Cht5<DfTB0+EMX5Ecc#5B-;D4FD)dEEb/]-+DG^9B5)O#DBNCs@r$4+
%16Ze+>=oo+C]5)+=C`F-S/_B+<VdL+AP6U+<W?\1E^.EC`k*:GV1^0-QjO,67sC)DfTB0+D#G$
Bl7Q+GA2/4+=C`F-Qm,@+D5D3ASrW"@:O(qE"*.cEZd(Z1E^.EC`k*:GUG%OCEO`B+<XEG/g)8k
+>Y-LDJUFCAU#g^2^]^j:-pQUFCfN8F!,%3A8,po+EqOABHS[6GUFVJDBNS+G%GP6@UWb^F`7cs
ATAnK+>P'KDJUFCDe(4H@V[)/+<Ve%67sB'1*A=p@W$!)-Z<NJ0fLI&+AP6U+D5_5F`;CE@rH7,
@;0UnDJ()5F^fE6EbTE(+=D)<-Qm,@+D5D3ASrW"@:O(qE"*-`$>"6#0H`(m0d'qCC`k)l-S/_B
+<VdL:-pQU@;Ka&@:XOmEaj)4F*(i2FD5W*+EqOABHSZh-Qm,@+D5D3ASrW"@:O(qE"*-`$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s\sgF(o,E3B:GUDJW6gDeio<0MXqe.Um:3;f-GgAM>e\F=f'e-t7(1.3N&>
B6A'&DKI"BD/X3$+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8
C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR
<%i?)F*)/8A2#\b%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zp130f<]gCbmdT$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gio@rsF\+CSeqF`VY9A0>K&EZd(r+Z_G&@q]:gB4VMZ
:-pQU0f`cU@k]\]FCfN8+D,P4+DG_:@;KXg+A*bo@;TRs+CT.u+D#D!ARo=_A0>],@ps1bF!+n%
A7]9\$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&Is@j"tu-ZW]>
Ci<`m;f-GgALBW%+>G!OATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a%14M1/g<"m
Ci<`m;f-GgALTc'+F?-n0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$-OgCl$?Tj#
FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO:-pQU/ULGc
;cFl<<'aD]I4Ym8%15is/g,.VDffPR3[Z:&-RLB0-nH\m-RU8j5U[k++?hhO-p8n)-RU8j.1HUn
$;No?+D58'ATD4$AKYDtC`m\8F)u&)Ch4`4@;KXg+=L]:CagK8EbBN3ASuT4E+*j1ATD[0%13OO
:-pQUF(8m'4ZX]L3b^2h1E[f867sC%ARTUhBHV;;@;KXiBk;=+%15is/g+nH@m)jq+<Ve@/g)tn
+AP6U+A*c#DfTA2DIIBn+Cf4rF)qct%15is/g,=GCh[E&Ch74#+=MI`+CT;'F_t]-FE7lu:-pQU
+<VdqCh[EkA0<!;6tp.QBl@ltEd:#jA7]g)+<VdL+<VdpBk)7!Df0!(GscL\ATLd]@<,jk+<VdL
+<Ve.DfTAeARTUhBM)$.D.Q(N@<6K4+<VdL+<VdL+AH9SEc4lf@<,jk9jqOPDfg8DAISuA67sBs
@<-!D3Zoh5BeD(g+=nW`4<cI%:I7ZB6W?fJ?X[\fA7$c./0H>lHRMZV8ju*H:.&AsC2[Wi.6DT\
BQ5ID/0H>lHRLFH:JsSf@;9^k?R\'X@q]jDBeCMb.3L/a-nK]n/58Dt;GUY.C2[Wi.6DT\BQ6+.
5snOG<*<$d?X[\fA7$bp$4R>;67sC(@;KXg+ED1/BQP@FGpskEEbBN3ASuT4E+*j1ATD[0%15is
/g)8Z+D#D/FEnuO@UWb^F`:i.F<D\K@;KaoDIR$aCNXS=+DkP/@q]mo@qBP"+<VeD@<?!mBl7Bg
@r$4+%15is/g,1CEb@Nr+=ANZ+?L\g-S?bh+<VdL+<W`g-SAnIF`):K+?L\g+=D&8D.P(;+<VdL
+?L\nDIIBn/n8gBDKI68$4R>;67sBmDfT]'FE8R5Cht5;@;KXg+=L]:CagK8EbBN3ASuT4E+*j1
ATD[0%15is/g)N:67sB.+=n]k+<W`i0d%Z$-8%J)0d&.m1*Cof0d%T&+=K?"+C]5)+=AT\/0IVI
+>Fui+F>4Z4D\GHB.4rS+?XXdDffP;/j:Cu@<,ui$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO
:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1
+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+_G@<6!&
@;^?5@UWb^F`;CE%15Ks4ZX^43dWJ%6r60K87,_&<*s!):IK,1C(1M)+=o&d-nul+2)Qg*0d("@
EZd\794)$o9IqP@/no'4-OgCl$;No?+EVXL+EM+&EarcsDJ()9BOu'(FD,6+AKYE%AKYl/+C\bh
CNXT;+>"^IG]75(FCeu*ATDg0EX`@nATAo&DJUFC-OgE#ATAo&DJUFC/gh)8DImi2@W$!)-S@2&
%13OO:-pQU@rc-hFCcS:BQ@Zq+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3
/KeVAE--@7$9g.jE+*6lA0>u)Bk)5o$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-
+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#TtFC])qF:AR"%15is/g,7L
Bl[`,DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G
$9g.jE+*6lA0>u)Bk)5o$4R>;67sC%Df'&.@UX=l@j#K'G%#3$A0><$B6A'&DKKqB/KeVLE+NO$
ARlopEcQ)=%16uaEZeh/C`k)X@4)KkDImi21a$7FC`k)X/MSU^$>sEq+>P'KDJUFC/hSL\$>sEq
+C]5)+>=63DImi2@W$!)4=;Kc$4R>;67sBQ+DtV)ATJu<Bln#2ASkmfA7T7^+Dbt+@;KLr+CT;%
+Du+>+DG^98l%htA8,OqBl@ltEbT*+%16uaEZeh/C`k*>F'i9uEc5i.-OgE#ATAo&DJUFCBldWg
AThX&?XJ"tDf03!E[M;'DImi2@W$!)-ZaBDCi!I&Ec5i.?RH9iDImi2@W$!)-Xe>L+<VdL+<XEG
/g,%MF<G!78g&"[D.O.`%15is/g+SAE+NotF!+t8EcP`/F<G10EcZ=F@UWb^F`8I@F_tT!EZbeu
9L2TV6;CNT4ZX]5/gi1m4#%k)+C]5)+=Ach+:SZqATAo&DJUFCD0]Jt@:W^m/5/?.<'j>[9aqGI
ATAo&DJUFCD0]Jq@UWdp/5/?.<'j>[9aqGIATAo&DJUFCC3=T>-=1"eG@ku6-S.qW;cH(Y<D<o0
%15is/g,4RD.Oi!@<6-m+DG@tDKKT7Bk;?.%14LmDJUFC-Rg/i3ZqmLC`keoHX^l/+=Ach+:SZ+
0HahBC`k)Q.3L3'+>=pIDJUFW0mbSs@W$!)-S?bh%14L<+C]5)+=ANc+>#Vs0d'qCC`keoHSHXP
DJUFC/ghbN$7IYP@W$!)-RU>c/NP"0+C]5)+?M<)1*C%DC`k)X-Qij*-o2uTDJUFC-Rg/i3Zp4$
@W$!)4#)(<+C]5)+=Ach+:SZ+1a$7FC`k)Q.3L3'+>b3MDJUFW0mb`"@W$!)-S?bh%13OO:-pQU
+C]5)+=Ach%159QHX^l/+=Ach+:SZ7+?^hl@W$!0/gh)8%16QQA8ZO,4ZX]5/ghbm+<iih0f'q&
+<iE\-p'/1@W$!)-S?bq+>#2g-S?bU$4R>;67sBmATVEq+D,Y4D'0s=Df0-2BleB-DKI"1@:O(q
E$-_TATDg0EZeq<E+NO$ARl5WDImi2@W$!)@UWebF_qQpDImi20HahBC`m1qA8ZO,%16uaEZd(Z
@W$!)@UWebF_qQpDImi21*C%DC`m1qA8ZO,%16uaEZd.\@W$!)@UWebF_qQpDImi21a$7FC`m1q
A8ZO,%13OO:-pQU9jqpb+E(j7Eb0)rBl7X&B-;;-F*)IG@rc:*Bk(RfCj@.6AT23uA0>f.+EV:.
+Dbt)A7]9oDdmHm@rucE%15is/g*_t+EV:.+Dbt)A0>r1Deio,FCfN8+EM%5BlJ08+CT;%+Cf(n
DJ*Nk+CQC/Dfd+?Afu2/ATME*FCfN8Et&IO67sBtF`VXI@V$[&AThd/ARmD9%13OO:-pQU+C]5)
+=ANG$7KG&C`k)Q.3L3'+C]5)+=ANG$4R>;67sB'@W$!)-SAnIF`):K%14LmDJUFC-Rg/i3ZqmL
C`keoHX^l/+=Ach%13OO:-pQU+C]5)+=D&8D.P(($7IVj+?MV36;LBN5u^WS0H`\X:J=&R:JEPd
6;LBN9M&/^+@8k"9N4;E9LU<X+>#Vs@W$!)-ULU)9IC8V%15is/g)9GDJUFCDIIBn/n8gBDKI68
$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3ZqmLC`k)s:/iSl4#2.lDJU[Q-OgCl$;No?+>=pI
DJUFC-OgD20HanDC`k)Q.3L3'+<W?\@W$!)-RT?1%15is/g)hj@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!@W$!)-S?bU$4R>;67sB7+C]5)+=AdODfor>-OgD20HanDC`k)Q.3L3'+>=pIDJUFW0mdAI
C`k)X-OgCl$;No?+>=pIDJUFCDIIBn-OgD20fpL>3[[6i:J=&R:JEMc6;LBN5u^WS0d&eY:J=GR
;cFl+:JXY`5se76-Rg/i3Zp+!@W$!)-ULU)9IC8V%15is/g)hj@W$!)-Z3@0AM.J2F`):K%14L<
4"!Tp<'aJZ9e[qV-V7'4<'`iE740N,/NP".+C]5)+=B`U<$s4Y14*JJCaUh_%13OO:-pQU0d'qC
C`k)Q%14L<4"#)dDeio<<+U,m0IJq0F)>i2AMI.qF*')`4"#)dDeio=<+U,m0deCm/NP"/+C]5)
+=ANG$4R>;67sB8+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+C]5)+=Ach%13OO:-pQU0d'qCC`k)X
@rHL-F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFW14*JJCaUh_%13OO:-pQU0d'qCC`k*C
@;TR'%14L<4"#)dDeio=<+U,m0IJq0F)>i2AMI.qF*',a.3L3'+>G!JDJUFCF)>i2AMGPA$4R>;
67sB8+C]5)+=D&8D.P>0Dfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs0d'qCC`k*HD/X3$0IJD5
14*JJCaUh_%13OO:-pQU1*C%DC`k)Q%14L<4""KUDesK3Deio<-T`\bDf9H5D/X3$0df%1Bl8$6
D/X3$0IJq0Bl8$6D/X3$0deCm/NP"0+C]5)+=ANG$4R>;67sB9+C]5)+=Ach%14LmDJUFC/gi(j
/NP"0+C]5)+=Ach%13OO:-pQU1*C%DC`k)X@rHL-F=.M)-n%24.4dS8,[i__+>#Vs1*C%DC`keq
HX^l/-S?bU$4R>;67sB9+C]5)+=D&8D.P(($7IVj-Y[I?F)>i2AMGP]+>#Vs1*C%DC`k*>DKKr:
Deio=-OgCl$;No?+>P'KDJUFCDIIBn/n8gBDKI68$7IVj-Xq"4CiaH3CLo1I.3L3'+>P'KDJUFC
@W-1$-S.>7HX^l/+=Ach%13OO:-pQU1E^.EC`k)Q%14L<4"#)lBlmp-D/X3$0deCm/NP"1+C]5)
-RT?1%15is/g)qm@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$@W$!)-S?bU$4R>;67sB:+C]5)+=AdO
Dfor>-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`keoHX^l/-S?bU$4R>;67sB:+C]5)+=D&8
D.P(($7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)-ZaDX%13OO:-pQU1E^.EC`k*C@;TR.@rHL-
F=.M)-n%24.4dS8,[i__+>#Vs1E^.EC`k*HFXJ_%14*JJCaUh_%13OO:-pQU1a$7FC`k)Q%14L<
4"#)dDeio<9jqOPD_NP#-Za-CCLo1o@:O=r0df%1F)>i2AMHnf@rcKA-T`\sD/X3$0hl(dEc3Z[
.3L3'+>b3MDJUFC-OgCl$;No?+>b3MDJUFC/gh)8-t7(1+=Ach.3L3'+>b3MDJUFC/gh)8%15is
/g)tn@W$!)-SAnIF`):K%15is/g)tn@W$!)-Z3@0AL@oo:-pQU1a$7FC`k*C@;TR.@rHL-F=.M)
:-pQU0H`(m@W$!)-RT?1%15is/g)hj0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m@W$!)-S?bU
$4R>;67sB7+>G!JDJUFC/n8gBDKI68$;No?+>=om+C]5)+=D&8D.P(($;No?+>=om+C]5)+=D&8
D.P>0Dfor>-OgDX67sB7+>P'KDJUFC-OgCl$;No?+>=on+C]5)+=Ach%14LmDJUFC/gi(j/NP".
+>P'KDJUFC/gh)8%15is/g)hj1*C%DC`k)X@rHL-F=.M):-pQU0H`+n@W$!)-Z3@0AL@oo:-pQU
0H`+n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E^.EC`k)Q%13OO:-pQU0H`.o@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp+!1E^.EC`k)X-OgCl$;No?+>=oo+C]5)+=AdODfor>-OgDX67sB7+>Y-LDJUFC
DIIBn-OgDX67sB7+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>Fun+C]5)+=ANG$4R>;67sB8+>G!J
DJUFC/gh)8-t7(1+=Ach.3L3'+>Fun+C]5)+=Ach%13OO:-pQU0d&1n@W$!)-SAnIF`):K%15is
/g)kk0d'qCC`k*C@;TR'%15is/g)kk0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0d&4o@W$!)-RT?1
%15is/g)kk1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0d&4o@W$!)-S?bU$4R>;67sB8+>P'KDJUFC
/n8gBDKI68$;No?+>Fuo+C]5)+=D&8D.P(($;No?+>Fuo+C]5)+=D&8D.P>0Dfor>-OgDX67sB8
+>Y-LDJUFC-OgCl$;No?+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>Y-LDJUFC/gh)8%15is
/g)kk1E^.EC`k)X@rHL-F=.M):-pQU0d&7p@W$!)-Z3@0AL@oo:-pQU0d&7p@W$!)-Z3@0AM.J2
F`):K%15is/g)nl0d'qCC`k)Q%13OO:-pQU1*A:o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#0d'qC
C`k)X-OgCl$;No?+>P&o+C]5)+=AdODfor>-OgDX67sB9+>G!JDJUFCDIIBn-OgDX67sB9+>G!J
DJUFCDIIBn/n8gBDKI68$;No?+>P&p+C]5)+=ANG$4R>;67sB9+>P'KDJUFC/gh)8-t7(1+=Ach
.3L3'+>P&p+C]5)+=Ach%13OO:-pQU1*A=p@W$!)-SAnIF`):K%15is/g)nl1*C%DC`k*C@;TR'
%15is/g)nl1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1*A@q@W$!)-RT?1%15is/g)nl1E^.EC`k)X
-OgD2@W$!)-S?bq+>#Vs1*A@q@W$!)-S?bU$4R>;67sB9+>Y-LDJUFC/n8gBDKI68$;No?+>P&q
+C]5)+=D&8D.P(($;No?+>P&q+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>G!JDJUFC-OgCl$;No?
+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>G!JDJUFC/gh)8%15is/g)qm0d'qCC`k)X@rHL-
F=.M):-pQU1E\Cp@W$!)-Z3@0AL@oo:-pQU1E\Cp@W$!)-Z3@0AM.J2F`):K%15is/g)qm1*C%D
C`k)Q%13OO:-pQU1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1*C%DC`k)X-OgCl$;No?+>Y,q
+C]5)+=AdODfor>-OgDX67sB:+>P'KDJUFCDIIBn-OgDX67sB:+>P'KDJUFCDIIBn/n8gBDKI68
$;No?+>Y,r+C]5)+=ANG$4R>;67sB:+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>Y,r+C]5)+=Ach
%13OO:-pQU1E\Ir@W$!)-SAnIF`):K%15is/g)qm1E^.EC`k*C@;TR'%15is/g)qm1E^.EC`k*C
@;TR.@rHL-F=.M):-pQU1a"Lq@W$!)-RT?1%15is/g)tn0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Lq@W$!)-S?bU$4R>;67sB;+>G!JDJUFC/n8gBDKI68$;No?+>b2q+C]5)+=D&8D.P(($;No?
+>b2q+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P'KDJUFC-OgCl$;No?+>b2r+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>P'KDJUFC/gh)8%15is/g)tn1*C%DC`k)X@rHL-F=.M):-pQU1a"Or@W$!)
-Z3@0AL@oo:-pQU1a"Or@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E^.EC`k)Q%13OO:-pQU1a"Rs
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E^.EC`k)X-OgCl$;No?+>b2s+C]5)+=AdODfor>-OgDX
67sB;+>Y-LDJUFCDIIBn-OgDX67sB;+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=om+>=pIDJUFC
-OgCl$;No?+>=om+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>=pIDJUFC/gh)8%15is/g)hj
0d&.m@W$!)-SAnIF`):K%15is/g)hj0d&.m@W$!)-Z3@0AL@oo:-pQU0H`(m0HahBC`k*C@;TR.
@rHL-F=.M):-pQU0H`(m0d'qCC`k)Q%13OO:-pQU0H`(m0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
0H`(m0d'qCC`k)X-OgCl$;No?+>=om+>G!JDJUFC/n8gBDKI68$;No?+>=om+>G!JDJUFCDIIBn
-OgDX67sB7+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fuo+C]5)+=ANG$4R>;67sB7+>Fuo
+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fuo+C]5)+=Ach%13OO:-pQU0H`(m1*C%DC`k)X@rHL-
F=.M):-pQU0H`(m1*C%DC`k*C@;TR'%15is/g)hj0d&4o@W$!)-Z3@0AM.J2F`):K%15is/g)hj
0d&7p@W$!)-RT?1%15is/g)hj0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&7p@W$!)-S?bU
$4R>;67sB7+>Fup+C]5)+=AdODfor>-OgDX67sB7+>Fup+C]5)+=D&8D.P(($;No?+>=om+>Y-L
DJUFCDIIBn/n8gBDKI68$;No?+>=on+>=pIDJUFC-OgCl$;No?+>=on+>=pIDJUFC/gh)8-t7(1
+=Ach.3L3'+>=on+>=pIDJUFC/gh)8%15is/g)hj1*A7n@W$!)-SAnIF`):K%15is/g)hj1*A7n
@W$!)-Z3@0AL@oo:-pQU0H`+n0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`+n0d'qCC`k)Q%13OO
:-pQU0H`+n0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0d'qCC`k)X-OgCl$;No?+>=on+>G!J
DJUFC/n8gBDKI68$;No?+>=on+>G!JDJUFCDIIBn-OgDX67sB7+>P&o+C]5)+=D&8D.P>0Dfor>
-OgDX67sB7+>P&p+C]5)+=ANG$4R>;67sB7+>P&p+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P&p
+C]5)+=Ach%13OO:-pQU0H`+n1*C%DC`k)X@rHL-F=.M):-pQU0H`+n1*C%DC`k*C@;TR'%15is
/g)hj1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A@q@W$!)-RT?1%15is/g)hj1*A@q@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A@q@W$!)-S?bU$4R>;67sB7+>P&q+C]5)+=AdODfor>-OgDX
67sB7+>P&q+C]5)+=D&8D.P(($;No?+>=on+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>=pI
DJUFC-OgCl$;No?+>=oo+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>=pIDJUFC/gh)8%15is
/g)hj1E\@o@W$!)-SAnIF`):K%15is/g)hj1E\@o@W$!)-Z3@0AL@oo:-pQU0H`.o0HahBC`k*C
@;TR.@rHL-F=.M):-pQU0H`.o0d'qCC`k)Q%13OO:-pQU0H`.o0d'qCC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`.o0d'qCC`k)X-OgCl$;No?+>=oo+>G!JDJUFC/n8gBDKI68$;No?+>=oo+>G!JDJUFC
DIIBn-OgDX67sB7+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,q+C]5)+=ANG$4R>;67sB7
+>Y,q+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,q+C]5)+=Ach%13OO:-pQU0H`.o1*C%DC`k)X
@rHL-F=.M):-pQU0H`.o1*C%DC`k*C@;TR'%15is/g)hj1E\Fq@W$!)-Z3@0AM.J2F`):K%15is
/g)hj1E\Ir@W$!)-RT?1%15is/g)hj1E\Ir@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\Ir@W$!)
-S?bU$4R>;67sB7+>Y,r+C]5)+=AdODfor>-OgDX67sB7+>Y,r+C]5)+=D&8D.P(($;No?+>=oo
+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>PYo@W$!)-RT?1%15is/g)tn0d&5++C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Fuo0d'qCC`k)X-OgCl$;No?+>b2q+>PYo@W$!)-SAnIF`):K%15is
/g)tn0d&5++C]5)+=D&8D.P(($;No?+>b2q+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5,
+C]5)+=ANG$4R>;67sB;+>Fuo1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,9t]DJUFC/gh)8
%15is/g)tn0d&5,+C]5)+=AdODfor>-OgDX67sB;+>Fuo1*C%DC`k*C@;TR'%15is/g)tn0d&5,
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1E^.EC`k)Q%13OO:-pQU1a"Lq1,C%^DJUFC/gh)8
-t7(1+=Ach.3L3'+>b2q+>P_q@W$!)-S?bU$4R>;67sB;+>Fuo1E^.EC`k)X@rHL-F=.M):-pQU
1a"Lq1,C%^DJUFCDIIBn-OgDX67sB;+>Fuo1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,L+_
DJUFC-OgCl$;No?+>b2q+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5.+C]5)+=Ach%13OO
:-pQU1a"Lq1,L+_DJUFC/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Lq1,L+_
DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pes@W$!)-RT?1%15is/g)tn0d&5/+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Fuo2'?@GC`k)X-OgCl$;No?+>b2q+>Pes@W$!)-SAnIF`):K%15is/g)tn
0d&5/+C]5)+=D&8D.P(($;No?+>b2q+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&50+C]5)
+=ANG$4R>;67sB;+>Fuo2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,^7aDJUFC/gh)8%15is
/g)tn0d&50+C]5)+=AdODfor>-OgDX67sB;+>Fuo2BZIHC`k*C@;TR'%15is/g)tn0d&50+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2]uRIC`k)Q%13OO:-pQU1a"Lq1,g=bDJUFC/gh)8-t7(1
+=Ach.3L3'+>b2q+>Pku@W$!)-S?bU$4R>;67sB;+>Fuo2]uRIC`k)X@rHL-F=.M):-pQU1a"Lq
1,g=bDJUFCDIIBn-OgDX67sB;+>Fuo2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,pCcDJUFC
-OgCl$;No?+>b2q+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&52+C]5)+=Ach%13OO:-pQU
1a"Lq1,pCcDJUFC/n8gBDKI68$;No?+>b2q+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Lq1,pCcDJUFC
DIIBn/n8gBDKI68$;No?+>b2r+>PYo@W$!)-RT?1%15is/g)tn1*A>,+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>P&p0d'qCC`k)X-OgCl$;No?+>b2r+>PYo@W$!)-SAnIF`):K%15is/g)tn1*A>,
+C]5)+=D&8D.P(($;No?+>b2r+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>-+C]5)+=ANG
$4R>;67sB;+>P&p1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,9t]DJUFC/gh)8%15is/g)tn
1*A>-+C]5)+=AdODfor>-OgDX67sB;+>P&p1*C%DC`k*C@;TR'%15is/g)tn1*A>-+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>P&p1E^.EC`k)Q%13OO:-pQU1a"Or1,C%^DJUFC/gh)8-t7(1+=Ach
.3L3'+>b2r+>P_q@W$!)-S?bU$4R>;67sB;+>P&p1E^.EC`k)X@rHL-F=.M):-pQU1a"Or1,C%^
DJUFCDIIBn-OgDX67sB;+>P&p1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,L+_DJUFC-OgCl
$;No?+>b2r+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>/+C]5)+=Ach%13OO:-pQU1a"Or
1,L+_DJUFC/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Or1,L+_DJUFCDIIBn
/n8gBDKI68$;No?+>b2r+>Pes@W$!)-RT?1%15is/g)tn1*A>0+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>P&p2'?@GC`k)X-OgCl$;No?+>b2r+>Pes@W$!)-SAnIF`):K%15is/g)tn1*A>0+C]5)
+=D&8D.P(($;No?+>b2r+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>1+C]5)+=ANG$4R>;
67sB;+>P&p2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,^7aDJUFC/gh)8%15is/g)tn1*A>1
+C]5)+=AdODfor>-OgDX67sB;+>P&p2BZIHC`k*C@;TR'%15is/g)tn1*A>1+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>P&p2]uRIC`k)Q%13OO:-pQU1a"Or1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'
+>b2r+>Pku@W$!)-S?bU$4R>;67sB;+>P&p2]uRIC`k)X@rHL-F=.M):-pQU1a"Or1,g=bDJUFC
DIIBn-OgDX67sB;+>P&p2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,pCcDJUFC-OgCl$;No?
+>b2r+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>3+C]5)+=Ach%13OO:-pQU1a"Or1,pCc
DJUFC/n8gBDKI68$;No?+>b2r+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Or1,pCcDJUFCDIIBn/n8gB
DKI68$;No?+>b2s+>PYo@W$!)-RT?1%15is/g)tn1E\G-+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>Y,q0d'qCC`k)X-OgCl$;No?+>b2s+>PYo@W$!)-SAnIF`):K%15is/g)tn1E\G-+C]5)+=D&8
D.P(($;No?+>b2s+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G.+C]5)+=ANG$4R>;67sB;
+>Y,q1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,9t]DJUFC/gh)8%15is/g)tn1E\G.+C]5)
+=AdODfor>-OgDX67sB;+>Y,q1*C%DC`k*C@;TR'%15is/g)tn1E\G.+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>Y,q1E^.EC`k)Q%13OO:-pQU1a"Rs1,C%^DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s
+>P_q@W$!)-S?bU$4R>;67sB;+>Y,q1E^.EC`k)X@rHL-F=.M):-pQU1a"Rs1,C%^DJUFCDIIBn
-OgDX67sB;+>Y,q1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,L+_DJUFC-OgCl$;No?+>b2s
+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G0+C]5)+=Ach%13OO:-pQU1a"Rs1,L+_DJUFC
/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Rs1,L+_DJUFCDIIBn/n8gBDKI68
$;No?+>b2s+>Pes@W$!)-RT?1%15is/g)tn1E\G1+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q
2'?@GC`k)X-OgCl$;No?+>b2s+>Pes@W$!)-SAnIF`):K%15is/g)tn1E\G1+C]5)+=D&8D.P((
$;No?+>b2s+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G2+C]5)+=ANG$4R>;67sB;+>Y,q
2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,^7aDJUFC/gh)8%15is/g)tn1E\G2+C]5)+=AdO
Dfor>-OgDX67sB;+>Y,q2BZIHC`k*C@;TR'%15is/g)tn1E\G2+C]5)+=D&8D.P>0Dfor>-OgDX
67sB;+>Y,q2]uRIC`k)Q%13OO:-pQU1a"Rs1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Pku
@W$!)-S?bU$4R>;67sB;+>Y,q2]uRIC`k)X@rHL-F=.M):-pQU1a"Rs1,g=bDJUFCDIIBn-OgDX
67sB;+>Y,q2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,pCcDJUFC-OgCl$;No?+>b2s+>Po!
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G4+C]5)+=Ach%13OO:-pQU1a"Rs1,pCcDJUFC/n8gB
DKI68$;No?+>b2s+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Rs1,pCcDJUFCDIIBn/n8gBDKI68$4R=O
$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!c
Eaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Xdnh;f-GgAM>i667s`sDJW6gDeio<0d(Qi/KcHNDJUaE
A8-+(CghT3E+*6l04J@"CNXS=A79RkF"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd]
.3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dE
IS*C(<(0_b06CcHFD>`)0JFj`$;No?+<V+#:-pQU@rc-hFCeuD+>PW*3Gi2F1,9:G:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf
6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0
F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r
%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!7
Eb-A;AKYYpG%De;Df'&.@UWb^F`;C2$>"6#E+*6lA0>u)Bk)5o$>"6#E+*6lA0>u)Bk)5o$4R>;
67sBZBQ&);ASkmfA7T7^+C\bhCNXS=A79RkF"SS7BOu6r+Cno&ATJu<Bl%T.@;p0s@<)ea:-pQU
@<3Q;ATD]3A79RkF!,17+E)(,ATAo&@:O(qE-!WS;f?MaFD5T'F!+'t@VK^gEbT*+%15is/g+Y;
@;]^h+EMHDD09?%+EV:*F<GC.FCfJ8G%G]8Bl@m1+CehtDJsV>Eb/Zi+:SZQ67sC!Ch.*t+C]&&
@<-'nF"SS,DBO%7@<<W%@<6!&Bl8!6ART*lDe:,#+Cno&AISuA67sBhDBNM2Ec5t@D.Rd0@:s-o
GA1l0+C\n)A8-+(CghU#A1e;uATAnJ1a$7FC`k)X-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm
%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2
?O[?RA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh/Kf+ODeio,+EV19FE8RCAfrL5A18WLDIIBn/6cV#
@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."DJ(R2$;No?%15is/g)QRA18XCATMs7+ED%5F_Pl-
+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha$;No?+EV19FE9&W+@1&k
+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o:-pQUBR+Q.
EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is/e&._67sBh
F)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M1-#dN:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#Y
Gqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(
:-pQU0f`cU@k]haARmH'B4Z0-FCfN8F!+n%A7]9o%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I
+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$
+Dbt)A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$
FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?
+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU
/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5
-RT?1%15is/g+kGF(KB6+=M/OATE!8Blmo8+EqaEA9/l3Afu8*EbTH7F!,RME+O)"$=[plCgq=.
4ZX]>%16]`Ddda)AN`'s0f_08,p5Dp1E\Fq1*@hb2`D0Q8SDOUAOC->Ea`I"ATBpp+=Ci@G9CaF
@q[!/Df9//GAhV?A0>;'GAhD1+Cf)-@r!2sBQ[g#-OgDnDfoN*AT2I.F*2A5Df9/L3Zoq6+@%&"
3XlF)D/a',A8cQQ3Zob%%17;s@;TRs4ZX]I3[\BTDerm$Gp$^8Ddda)AKXQX@<Q3LBOPpi@ru:&
+CoD5@VfUpCisfADJ*m+A0>;tE+O'#Dfd?9$9g.jFDYu5Ddso/F`\aMDIIBnEt&I?0RImq4ZX]>
+>GPmB4Z0-GA^i+ATJ:f%15is/g,7LBlbD=ATMr9Eb065Bl[c-D..=)@;I'#DKBc.@ruF'DBNk0
+A*bfA8-.(EZfR?DId[0Et&Hc$;No?+D#(tF<GdGEb$:@DIIBn/7WL)F)rmSAU&;G+EV%$Ch4%_
0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsT+>"]`/3>P4GA^i+ATJtu+D#(+4#))(0F\?u$;No?
+DG_7ATDl8FCfN8F!+n/A0>;uA0>_t@rcL/%159QHSHX^F`\`RFCfN8@;Kmr@5'A_4"!ci/g+kG
DJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'D`4"!ci/g+kGDJs$'F`S[IAU&;E%159Q
HSHX^F`\`RFCfN8@;Kmr@5'Ga4"!ci/g+kGDJs$'F`S[IAU&;E%159QHScjaF`\`RD.-ppDddI$
BONSK-Ta(<4!ua*.j-Po%159QHScjaF`\`RD.-ppDddI$BONSL-Ta(<4!ua*.j-Po%13OO4tq>*
0g.Q?0d(+?F<G[C@;TRs4ZX^6/g)kkA8Z3+-Zip@FCB!)BONSB%13OO:-pQUARoLs+EV19F=;$8
D.P8?AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsU+>"]`/3>P4FDbN(ATJtu
+D#(+4#))(0b"I!$9g.jF>?!?+>b3RATT&3DIIBnF$2Q,I4cX!+CoA++=D#7@rcKrCiF&r0II;:
%15is/g+_9BlkJ7@:O=r+=M,9D.P8.De*E1FCf]=.3N_@@VfTb$8EZ-+EM47GApu3F!)i?BOt[h
+D#(tFDl1B1E\7l-S.>5HYmY/D.Rc2>9IKf+?M<)F>=:4%15is/g+YEART[l+EV:;ARuun@:O(q
E,uHq%15is/g+b?EcZ=FDdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI@r#TtFC])qF:AQd
$;No?+EM+(Df0).DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`
CLqU!F*')F$9g.jE+*6lA0>u)Bk)5o$6Tcb:-pQUFD,B/A0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-
+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#TtFC])qF:AQd$;No?+E)41
DK?q/+EM77B5D-%ARoLs+EqO;A8cZ7GA2/4+EV1>F<GU8E,oN2ASuTuFD5Z2F!,C5+CT)&+EqaE
A9/l-DBNb(F*&O6@:O(qE"*.cEZfLJ4ZX]pB4Z0-I4cXODJUFC-OgD;+Bot0BQ&*6@<6K4-Y$h$
@r!2uA8-.(EZd1]/LN(l4"u"40RGu<HZaKS>9IKf+?hN,F`n3$%15is/g,(OASuQ3@3BW*DJ*cs
+D#(tF<GdADId[0+EqOABHVD.G]Y'KAT2[$F(K62@<?4%DK?q=AftMuC`mh2F*)IGBl5&0@<6N5
@UWb^F`7csATAo9G!.l/0d'q<ATT&C/g)kk@W$!)-RT?10d'[CF(fK9E+*g/+=CZ4ARfKuARoLs
DfQsX+>"rl+?M9(/22E70me%d+Bot"A0=&jHZaK@$4R=O$>"6#1E^UH+EV..@rr.e%15is/g)`m
<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*W
D/a<0@p_Mf6$$m]CLoLd3F?E1F@9hQFCf]=;f-GgAM>f567sa#ATU=S@ru:,FAm$pCLo1R+ET1e
+DGY.F`VYF@<?''-td+5.3N/8@ruF'DIIR2+EV1>FE9&D$;No?%15is/g+,,BlbD=ATMr9Bl%U.
F*)G2FCfM9F)Po,+<koA@r#Y$/RiX:+s8:Y.3N&>B6A'&DKI"2De*F#+E(j$$;No?+=Ll6F=A>V
BOu'(An?'oBPD?s+EV:.+<Y3/@ruF'DIIR2+<Y35@s)X"DKIKR<+ohcA8,OqBl@ltEd8*$:-pQU
A8bt#D.RU,+DGm>@3BW*DJ*cs+Cf41De:,$H$!V=/e&._67r]S:-pQU<+oiaAKYK$A7]g)A7]dq
G%De.Ec5e;DffZ(EZccCATT@DDfBf4Df0VK+A!\cDfol,+CSek+Cf>#AISuA67sC&D]g6EAS6.%
@<-(.AKi7=BPDN1+C]J8+CT=6FD,6,AKYE%AKYDtC`mD"Ec#W(F)rI<F=2,P+Du+>%15is/g,@V
Ecbt;Blks:$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!
Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FCD..H>2%9mf
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RA
E,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5
FCfN8C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBhCht59BOu6r+D,2,@q]Fp
+D58-+EV:.+ELt.AKYMt@ruF'DIIR2+EV1>F:ARgEZd4^B4Z0--RT?1ATAnN+?(EUATT%B-OgDo
EZd4^2]sgtB4Z0--RT?1ATAnN+?(Ds+D58-+=ANG$4R>[ATAnN+?(Du+D58-+=ANZ+AP6U+ED%8
F`MA@+D#S6DfQ9oDImi22'?6b+<Y<.F<DqY%16uaEZd4^2]sn!B4Z0--RT?1%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$.-UF(dQo3F?T@@:XIkF*',j0P"m-FD5Z2@<-Wg67sa(Ddd0uATMrJ0JI$O@ruF'DIIR2
+ET1e+Dbt)A0<T\0R+]qDIal.Eb&a%+E(j7D..'pBlnK.AKZ)+F*&O8Bk)7!Df0!(GqKO5:-pQB
$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBFCfN8C2[W;0JFpuCi<`mARl5W:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTg
Dg!lk+E_X6@<?'k+D,P4+A,Et+>>E./i5'f$;No?+>Gio@rsFZ+E_X6@<?'k+D,P4+A*b9/hf3n
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?
5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'
Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsFZGWe)1-Zip@
FD>`)0eb:/%172fBk)6>0JI`73ZoelATMs.De(RV0JFj`$4R>;67sC!E+No0.!0!6@rsFZGUXbD
DIal&ATT&'Ec6)<A0<T\0JG1'GAhM4F!,[@FD,T8F<G+*Anc-sDJ'CcATAo3A0>u)Bk)6>0R+$6
5'nn)G^+Hr3Zp+!0ea__ATT%C0eb:90L$e1/nAj9-RU?iI4f&JCaUSQ+AP6U+EqaEA9/1e5'nn)
B4kj?3Zr'UE$-MU+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+D5_5F`;C2$@$f?4ZX]?
+E2%)CERkHGT[G&B4kj?3Zri'+D5>"%16Ze+>Y-YA0>u)Bk)6>0R+$6%15is/g,(OASrV=FC])q
F>5I'GUXbDDIal#ASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p
ATAo3A0>u)Bk)6>0JI_\$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3
+DEGN2(9b4-RT?15'nn)F(fK9E+*g/+Co1s+FYFe%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:B
ARfY%ATAo;@<6O%A0>r4@:NjX$>"6#E+*6lA0>u)Bk)6>0JI_\$4R>;67sC%FDl22+EqaEA9/1e
5'nn)F(fK9E+*g/+>=om0Hb=WF<GgQGRXuh$;No?+ED%4ART[lA8HN6@q]:gB4W30DfTA2DIIBn
F!+n/A0>r8DfTCu$?B]q@;TR=3Zp.5+?CVm.!mQj0d(`j+>#2m-RU#a-U940/j:C?+u(2a3Zot+
+=MIa+<u.\+=eRK/g)Ba-OgDHHS-F^BQ&*6@<6K40H`)(+E2IF+=JodEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-nuibAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1*CUKDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dtf+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(
+E2IF+=K&hEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oE,f
AStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S2B[$ODIIBn+F&-U
.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtj+ED%2@;TQuG^+H^+=K?\3]f#E
I3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K2lEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%13OO
:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&I?HS-F^BQ&*6@<6K4A8,QsINU<R$4R>;67sBpDKBB0
F<G[:F*&OKDfTA2A7]glEbTK7Bl@m1+=LfGFE1r0AKZ,:AKYo'+E2IF+Cf>,D..<m+D>>,ALS&q
5'nn9+?1K_F`\`SI4f&JC`k)Q.3L/o+?V#nATMrJ0JFVdDfTD3D.R-nBl7R"ATMo8FCfN8+Co&)
@rc:&FD5Z2F!,C5+CTG)Ea`Tl+DbV,B67f7%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&If
EZen,A0?=D0F\?u$;No?+Cf5+F(HIBFC])qF>5I'GUXbGBk)7!Df0!(Gp$O5A0>AuARTI!F`7cs
ATAnL+E(d5-RT?1%15is/g++^;cFl<<C9,B;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%17&sFA61gDIIBn;f-GgAM>f567sa,
F`^>dG]$r,AQ*GaCLo1R+ET1e+EV19F<F:D=AD.V73HDXDJ+')+Cf(r@r!\+$;No?%15is/g+SD
F*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp"[]F(Jo*FCfN8+CfG'
@<?(&ATMs(Bk)7!Df0!(Bk;>p$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N
;cGDlATMs.De(OU-OgDX67sB'+<VdL+<VdL+>,9!/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3Gi2F0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo
Eb065Bl[c--YdR1FCfN8ATB.-$4R=O$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eY
Eaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,7Y
Ec*"F@;TjmEZf:<+:S["ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQl0b"Ib67sB4HW3F4<$5+=
5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgDoEZen3
F(KG9-W3B!6s!8X<(//D$4R>;67sBt@;BEsDIIBn+EVO?+Dbt6B-:W#A0><%F(o9)+C]8%F`S[K
@;L't%16QYB5DiV3ZoeZBkM7-DIIBn-S.tX=AD.V7:0J<De*3"-W;B%$7K@tB5DiB4ZX^"/g)nl
1(=R"$;No?+CTA6ASlC.+EVNEE-67F/Kf+JDfol,+D,%rC^g_hATAo8D/a<0@j#`5F<G%,B5Di9
%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F;                                    ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C7+>P&o0d&51+>GPm1Gg4/0H`,/+>GPm1GL",2]sn4+>PYo1cQU42]sk5@V97o;f-GgAM>ed
@V97o.3N&>B6A'&DKI"BD/X3$+EV19FE:o/CdMQOBk&hO@UX=l@j!1/DJUaE@UWb^F`8I@@;TQu
Ch[s4+EV19FE:o/Cf>1hCLo1R-t7(1.3N&>B6A'&DKI"BD/X3$+EV19FE:o/Cf>1hCLo1S-t7(1
.3N/8F)Yr(Gp%'7@r!`,@:O(qE$/\"FCfN+ATU=S@ru:,FAm$pCLo1RBl%U.F*)G2FCcRCB4Z06
+Co1rFD5Z2@<-W9FCf]=F)5c'A9;C(F>5I'A8,OqBl@ltEd;J>@:UK80JI_o12^VFDfTB"EZf:4
+DkP"DJ=38A7Zm*ATMr9A8,OqBl@ltEd;VHFA61gDIIBn;f-GgAM>f[ATMr99gMlV5tscjCh7Ks
FD)e,BOt[h                                                                ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f(L+0f'q.+>G_r1*AG02)l^60H`+n2)I3L+>PVn1*A;*3&2U20H`+n1,(I?3?U%4+>P&q1,h*6
2]sju2E3T;0f1".+?;;6+>GPm1*AJ71GBq+0d&4o0f1UB+>Gl!1*AS;0H`)/+>P&o1Gq*60esk,
+?(u.0d&@s1*A;*0eu?s6pamF9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp15+AH9b+>PW*3?U%83\iKP1b]7D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*
3?U%:3\W?N0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp1<+AH9i+>PW*3?U%73]&NO1c>[J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp1:+@1-_+>PW*3?U%23\W6K1GB.C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp1:+@1-_+>PW*3?U%2
3\rKO1H>dL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K
3Zp1:+@1-_+>PW*3?U%33\`HP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&
:3CD_ATBgS1*@]-@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1-$ICF_;gP0JPR10f(jH2EEWR$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh3?UV1B-8r`0f^@2
1HI?J3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp1<+@1-_+>PW*3?U%53\rZT1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>>So:LeJh1,(FC+>>f:2*!]T1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg
0d'50Fs&Oo0f^@20fh$J3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+?:Pe6t(1K3Zp1<+AQiu+>PW*3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1<+AQiu+>PW*3?U%63]&iX0KBII
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3
+@KdN+>PW*3?U%43]/]S0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0esjo6t(1K3Zp+3+@KdN+>PW*3?U%53\rHN0f9:F$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX1GK4D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp+4
+@KdN+>PW*3?U%13\iWT0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*3?U%53\r`V1cPgL$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,B7E
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6
+@KdN+>PW*3?U"93\iZU1bf=E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0fU9u6t(1K3Zp+6+@KdN+>PW*3?U%33]/iW0JNnA$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0fTLI
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp+7
+@KdN+>PW*3?U%13]/oY0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,0mo6t(1K3Zp+7+@KdN+>PW*3?U%23]&NO0K9CH$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+7+@KdN+>PW*3?U%43\`EO0Jj+D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+7
+@KdN+>PW*3?U%53]&NO0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,L*r6t(1K3Zp+7+@KdN+>PW*3?U%53]&QP0e`qA$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%23]/ZR1cGaK
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+8
+@KdN+>PW*3?U%43]&QP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,g<u6t(1K3Zp+8+@KdN+>PW*3?U%43]/fV2)GXI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+8+@KdN+>PW*3?U%83\rTR0fTLI
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0K:1CARci<
0JPR10KD0N2``]R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GBpo
6t(1K3Zp+9+@KdN+>PW*3?U%13\`BN2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!Y
A0=WiD.7's3Zp45+<X'\FCdKU0K:1CARci<0JPR10ebXC2``]O$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp+:+@KdN+>PW*3?U"93\iNQ0f]RJ$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0KC7DARci<0JPR1
0ek^C1-.6G$;+)^<)6:`;aOJU9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1*B;"EZd+k0f^@22``]M3]&Mt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU
0Jjn<E,m'V0JPR10f_9K1HI6E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"9jr;i1,(FC+>Gc81b^sI3!p!":-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp1:+@1-_+>PW*
3?U%23\W6K1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pbr+@KX[ANCqh2]tD/B-8r`0f^@20fh*F3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=AF_;gP0JPR10etdE1cd?M
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1
@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*3?U%43\rZT1H>dL$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1<+@1-_+>PW*
3?U%43]&TQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@
+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+4+AZKh+>PW*3?U"93]/oY2)>RH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.3
+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%no
F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.3+AQiu+>PW*3?U%23\`QS1,oUJ$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1<+AQiu+>PW*3?U%6
3]&WR1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GPm+@KX[ANCqh3?V(8Fs&Oo0f^@22**QS3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0JXb=ARci<0JPR10f(jJ1HI3H$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A
+>>Pn6tKjN1,(FC+>G]61GCjE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX1GK4D$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqf1E](s@j!N\
0f^@20KLsJ3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.7+<X'\FCdKU0Jah>ARci<0JPR10f1pI3'&lV$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>>Vp6tKjN1,(FC+>G]60f;!I
1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t
6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2'>:u@j!N\0f^@21-.9O3\W;r$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0Jst@
ARci<0JPR10f1pF1-.-M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u0H_K+@<?'A+>>\r6tKjN1,(FC+>GQ22*!]O0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+7+@KdN+>PW*3?U%2
3]&NO0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P\p+@KX[ANCqf2BYD!@j!N\0f^@21HI6H3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K(%AARci<0JPR10f1pJ0KLsC$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A
+>>\r6tKjN1,(FC+>G]61bh$G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%23]/ZR1cGaK$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqf2]tM"@j!N\
0f^@21HI?I3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1:+<X'\FCdKU0K1+BARci<0JPR10f(jJ2EE]P$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>_s6tKjN1,(FC+>Gf91Gh-I
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU
0K:1CARci<0JPR10KD0N2``]S$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&
+AR&r@V'R@+>Y\o+@KX[ANCqf3$:V#@j!N\0f^@20KLpD3]/c%$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp+9+@KdN+>PW*3?U%13\`QS1,]IH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>>eu
6tKjN1,(FC+>>f:1,M$I0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=Wi
D.7's3Zp47+<X'\FCdKU0KC7DARci<0JPR10ek^C1-.6H$=\-lCh.:!A7TCqFE2))F`_>9DDEqA
67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<4%13OO
:-pQU@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!aF`MM6DKI!K@UX=h-OgDmDe!Tl
F)rIGD/a<0@p_Mf6#(=K@WcC$A2uY1?TgFm-UC$aC2[WlF_PZ&3B9)I+BosuDe3rtF(HIV-UC$a
C2[WlF_PZ&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'n
F!+n/A0>f0ASrV_:IH=9Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<
A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D58-+A,Et+C]J-Ch+Z2FD5Q*FD5<-+CT.u+Eh=:F(oQ1
+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$;No?+EM+9+Co2-
FE2))F`_>9DBNJ(Eb/a&DfTQ'Et&IkA7TCp4ZX]58l%iR<'a#C6qL9!8l%iF8Q8)L;BSS-6rQl]
;F<lO<'a#C6qL9!8l%iR<'a#C:ddc@8Q$[':IJ,\5t=@3:I@NA;C;n\C1LjhE]lH+C1LjhEZcnU
-Ql#W6q9gJ6r-0<8Q$[':IIK:6r-QG8Q$[':IJ,K;Fs\a6qL9!8l%iD=B&3e8Q$oY%14LuA7TCp
.6T^7F(KH&F_PZ&A8-(*+>=63%15is/g+e<DImisFCcS*BleB:Bju4,Bl@l3F(96)E--.1$?^;u
@<?'qDe*]nDJ<]oF*&NY%15^'6rm#M+C]J-Ch.:!A7KOpE,oN2F(Jl)8l%iR<'a#C6qL9<8l%iF
8Q8)L;EIKH6pX4/:JO;L;EIKH6rQHN8PiAS8Q$!)8l%iS:JXY_<_Yt)@WcC$A86$nFDl)6F(9-*
E,oN2F(Jl)8l%iR<'a#C6qL9<8l%iD=B&3e8Q%WB:IJ,K;Fs\a6qL8c$;+)^<_Yt)F`:l"FCf3*
A7TCqFE2))F`_>9DBMPI6rR&N7n#g;;EIKH6q9gJ6qL8c$;+)^<_Yt)F`:l"FCf3*A92[3EarZk
F_u)=+A,Et;bpCk6UapQ5t=@38Q$!)8l%iU9gg+EASbpdF(K*)A0=K?6rR&N7n#g;;EIKH6rR&N
7n$6B7RTgG4%`::;cH%Q779p=6qL9<8l%iF8Q8)R6UXLD%13OO:-pQUA7]h(Ec64G@WcC$A0>],
@ps1b%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*="Bl%<?3B:FU$4R=O
$>=-pFDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'a
E,9*-AKXl^Ch7$rALS&q%144-+CJYkATV<&Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi
+EV:2F!+n%A8-."Df-\+ChsOf+<VdLE,8s#DIm?$8l%htAn>CmF`M&7+CT;%+Cf>,E,9*-AM,)p
Ec5e;DJs_ADf-[i:IGX!+<VdL@q]:gB4Z-,GA1l0+Cf>-F(o];+E(j7@Wc<+AncL$F!+n/A0>f0
FD5T+H=:o0Df0VK%144#+<XU)@:EqeBlnVCBlbD7Dg*=GBOr<!DddH7%13OO+=\L<?t*b[FC64`
F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9
DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^0Lo\r/no9MDIP%($4R=b.NieND.Oi,@:O=r
F!+n/A0>u*F*)IG@:X+qF*(u(+EVNEF*2G@DfTqB0fU=;1a$:A@;]^hF"Rn/%144-+Dtb7+CJYk
ATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1rFD5Z2@<-'nF"Rn/%14=),9SZm3A*<P3?Tmr
6$6g_F*&N[3@l:.0JPQs$4R=b.Ni\=FCSu,Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'
EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@/$4R=b.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2
+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*
+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9
Cis<1+C\o(G@b?'+>G!IDIakF2)Quq$4R=b.NfjAEc#28+CK53FC65"A867.FCeu*FDi:CF`;;<
Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N
@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b
.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9
D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8
@OV`n%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z
+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u6
05>E9DJsW.@W-1#F"%P*%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t
+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_
FC/crF'i;tF`(`$EZea^85inK%13OO+=\KV@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=
+Cf(nDJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*
/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlokC1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@
?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d
:IH=B@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA
8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=
ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-
0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*
@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]
Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4
G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$A
F<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW
6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:
Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08
+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL
+<VdL%13CJ<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuST
E-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%
DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL
+<V+##mjRB=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9
+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUr
F"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;u
A0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC
$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8
Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1
%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeD
Bm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)
+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn
+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeF
G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7
DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!
G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@F
D]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V
=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$4."J$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)
FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[
A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE
3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=
+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6
ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"
DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUB
DJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX
<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7
Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo
2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=)
,9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*
D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2u
ARHWlA8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=
BlbD/ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KL
A8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/Zi
C3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4
+Du+>+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%
67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065
Bl[c--YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL
+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU
0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&
D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5
A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3l
F`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%
DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%
B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\t
D/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%
+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohc
FCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+
C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(
@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/q
DKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:g
B4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD3
8l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58
@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@
FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaE
A0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&
/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5
E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjb
A1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo
@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL
0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq
+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!
0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[
/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-
A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>
D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeN
Bln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:g
B4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'
FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1r
FD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6
+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm
3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUK
G&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:
DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(
A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U
+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!
+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#
EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-
E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*
F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n
+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%
DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;
EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm
+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5
BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUg
F_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#
+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57
B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36
F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,
C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:
DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*
BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9
B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]
+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>
ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE
%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@
+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL
+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#
+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;
E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)
@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5
E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'
.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/
A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1
A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+
Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-
%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+
:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQf
DfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE
2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4
F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961
D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7
+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#
DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-
Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO
+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,
BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)
E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22
A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A
>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9B
F"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!
EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc
3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk
/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*
FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-
+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"
-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0
@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+D
E,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b
.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs
/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.
D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`
/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1
Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j
$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTu
FD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%
F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1
AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1
+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6
+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(
ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0
De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohc
F*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#
+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&
%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-
AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]X
DfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN
%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$
A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!
Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5
+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U
5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6
F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th59
2./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;
DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(
H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=
@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7
AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWs
AKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu
@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4
F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&
DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*
@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8
FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8
BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:g
B4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku
+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@
Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe
$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSek
ARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[
/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+7
06:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r
+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@C
G%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg
+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9
Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7Qq
Bl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,
/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-
FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE
+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9
Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*
F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;
AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+
@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"P
E-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,
D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:A
Ci<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""
GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTs
EZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7
FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m
/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9
BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/
BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ
+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:
EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp
78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/
+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU
0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0
+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe
$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6
De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bS
A8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$
+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6
B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@
AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7
+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nB
A0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0
+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#
%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#s
FCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l
+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm
@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2
+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"
DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[Wr
ASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3
+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'
+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%
+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y
:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6
%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20
@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.
AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E
%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/
FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+
FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVe
DKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*
1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)
AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%r
C`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"
CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$
G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6
Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2
%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1
ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i
/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"
ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,
F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5
F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9
C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTu
G%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCo
DeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&
FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(
Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi
05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?
F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2
/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9
@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(
ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1
+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU
0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB
+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*
0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8
Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO
+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_A
A7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=
D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%
+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOA
F(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'
@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD3
8l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0
F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)
Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*
@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6
Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k
+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk
+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r
+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'
1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)
+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1Ums
F"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.B
Ec5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@n
Cige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(
D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4
$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA
%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NO
DIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&
A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8i
F(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO
,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1
Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%ht
A8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T
%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3
AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?
Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5
BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.
F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.
Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b
.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%
0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^
$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"
F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk
+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/
Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%
0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=
E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'
+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<
$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'
FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL
/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W
+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-
DBLNL+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL+<V+#+:SZ#%16c_F*)>@H"q8.A8bs52eQ]>
ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-
AKXl^Ch7$rALS&q%144#.Ni,.B4Z0m+C\bhCNXS=B4Z0-F(Jj'Bl@l3@:Wn[A1eu6$4R=b+=\KV
E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ8Cggdo+CSekARlo8+EM+*+EV:.+Co2,ARfh#Ed8*$%144#
+<VdL+<VdLC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%14=),9SZm
3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b+=\LWATDj+Df-\,F_u(?AoD]48g$,H0JO\ZATV?'
E+*iuBJ'`$%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2
$4R=b+=\LAEd2Y5+EM+(FD5Z2+CSekARmD9%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%
0fTUL%144#.Ni,9DJW]'F(Jj'Bl@l3@:Wn[A1e;u%14=),9SZm3A*<P2'=In9jr;i1,pg-1,(FB
+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144#.NieS@<-H4De:,4AThd/Bl@l3@sMR#AKYT'EZdss
G%G]8Bl@l33%cmD.kV8<%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?6m-;S@WNZ5@rc-lDBNFtE--5C
ATJu:E+EC!ARl5W+<VdLAoD]48g$)G0K1+H;,f.W$4R=b+=\LOATo8)F`(o'De*E9?m'Q:E+L/#
A7T7^+EVNE89Jf_@<-'jDBNA,E+NotBm;6>$4R=O$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPNr
$4R=b+=\LGBl\9:+Cf>,D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f89JAaEb03.F(o`7EbT*+/e&-s
$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme
@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4
AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0
+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@
@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo
$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#
E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&A7T7^%144#%144#.NiGC
A7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%
0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSek
ARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/
$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=)
,9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcq
F`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&
+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%
+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'Q
F*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4
+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O
/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!
AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,n
G%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-
GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0
H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E.
/ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinG
EcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/ARlo8+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL
89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/
Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,
+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#
F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3
ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,u
ATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<
2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8
D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(
Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6
A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(
F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4
+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uo
Eb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^
:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId
5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6
Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<%143e$>OKiE,oN/1,2Nj/h1USA8lR#E$03R/KdY]
6m-GhAT2[.@qB_&DfQtA@rc:&F=n"0:-pQB$;No?+B*AjFCf<#DKKqBBl5&8BPDN1F(96)E-*42
Eb-A)G\(B-FCeu*@V'.iEb-@c:IH=>F!,:;@:Wq[/e&-s$;No?+EVO@+DbV4AS`K#EcQ)=+EVX4
E$/b2EZek1Eb-@c:IH=LDfTB0+:SZmDe*p$?YO7nA7$HB3Zp+#?Q_EQ-V@0&+B)EA<(0M(7R9U>
<Dl7H+DbJ-F<F0uATDg0EZcqt+=A@?+=nX>3Zp.5+Z_>5+=AN\?Q`Pq>n%,M$>OKiF*VhKASlBp
FD,$-?TgG++?CW!%13OO:-pQ_C2[X(H#n(=D/`p*BHVIM/Kf"@FD)e8Afs]A6m-PrF*(u1+>"]h
+EV18D/!lrFCeu8%15is/e&._67sBUDffPO+Eh10Bk/>uDfQsm+>ti+0d'nBA0>;iDg#\E%15is
/e&._67sBtDf/uo3ZoP[De*p7F*(u1E+*j%+Cf4aAnc'm%15is/e&._67sB'+DPh*F*VhKASlBp
FD)dEC2IC#FCfJ?%13OO:-pQUA7]@eDIm?$8g&2#F*(u1+Dbt+@<?4%D@Hq$C2dU'BHS[O@:Wne
DK@IDASu("@;IT3De(LK.4f`e%14Nn$4R>PDe!TlF)rHO@;9^k-OgDT9gM]W78c90+DPh*F*VhK
ASlBpFD)dEC2IC#FCfJ?+<VdL+<VdL+AP6U+Co%q@<HC.+DkP.FCfJ8-n6i`C1\n;Anc'm%15^'
6r6cW7QidTC2[X(H#n(=D/`p*BHS[;De*g-De<^"AM.\3F!i(Q:-pQUA7]@]F_l.BE,ol/Bl%?'
F(96)E-)NrC2[X%Eb\TqATDQtH#k_u:-pQUF`V,7CLqd4/n8L+%15is/e&._67sBZAS!!.BkqE*
E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAbAU/>+$;No?
+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:@<6O%E\D6C
@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fkBl7L'G@b?)
ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(FE21J838Le
7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*@prhhCgh@0
01ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"$;No?+<j`t
BkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>+q4lS67sB)
;eTlWF=Tg>+q4lS67r]S:-pQU:/=hX3ZqpNDK]r7F`_2*+=K?"C2[WnATfFM/1<V.C2[W1.4dS/
F`_>6F!i)=G&M)*F!,UHAKYo'+=B5u+Cf(nEa`I"ATA4e%15Q[4#&fpASkjkAKX?_EcP`/F?=;W
@:UK.B4YslEa`c;C2[W1+Bot/D'138F_PZ&C2[WnBleB:Bju4,Bl@l:+BosuCh7$q+=ANG$:AoU
Cb%t14#&fqATT%^F`MM6DKIsYA0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH+BosE+E(d5
-RT?16Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:E,]rA-OgDP1HR<Q;IsijBl[c-8l%i:
Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"H"1Z%+A,Et4"+i^A8c?./0J\GA8c'l
.3L>S$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=637Pm1\4%*XhF_;gpF`'9O@WHU/+=ANG
$:Zp80fr?GF*&O'D/X3$4*#Fb+=CW2ATUjfDeio<0II;:;eTlWF=Tg=4#&frATMr96=FqL@ll&5
8PN#(@UX=l@j#l)F*&dEDe*g-De<^"AMPu867sa&De*g-De<^"AKZ%G/KdY]6m-#S@ruF'DIIR2
+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0
+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.
+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)
FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t
+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0
D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#
+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>
;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19
AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:
E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OE
ASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$
AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7
BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%
ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8
DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7
$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB
@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+
B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%
+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5WA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>
DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:Wne
DK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+
/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"
BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]
>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;s
C2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1
-OgCl$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>
ATMr@%15is/g+4d78cQ?9h@K/+=Ci@D.P(($4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>
F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%
;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/
0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5
F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</I
De*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!
%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6i
De*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC
+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$
+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu
@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'
F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu
@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'
A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaE
A9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k
?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e
@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk
+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A
+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ
;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ
+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-R
G&Ifs%15is/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=
ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47
G9CIAE,95uF<GXADfp/@F`\'"EcXB)+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E-![R
F_Pr/Et&IiB0A9u><3m?CiF9.+BplLI4cXTEc;HpBQH<t+>G!PCiF9.+BplLI4cWu+D5_6+C,E`
%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2
$;No?+<VdL+D>d<1a!o967sBt@:O=r%15is/g)8Z+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU+>GPm
BQ>4L+<XEG/g+t=F*&OHASrW7DfTB0%16ch4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaPU/g,E^
Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7I4cXd%15-*$>F*)+C\biEarHbC2[Wi
+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;
67sC%ARTUhBHVA0DfTqBBOu"!+D,P4+EMXFBl7Q+@;]TuCh[s4+DkP/@q]RoB-;D:Eb'5#$;No?
+<VdL+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+EqaEA0>r,DfTqBFCf]=+:SZQ67sB'1*@]Q
F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@qZutEc6)>+EM47Ec`FGAU&;+$;No?+<WK`+D>h;+=D,H
F*&cP+<VdL+<XEG/g,4H@<,jk+DkOsEc3(ABQ%p5+EV1>F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL
%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F##>DJUFC-QjNSA8a(CG9Cp;FEMVA/g+_CA1e;uA3DOf
GT^[9E,KJ7I4cXd%16f]/g)i2,Bl:'+>G!&5^OVa+<VdL+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;
8P2cH0JFViATW'8DD!&CDIb@/$>F*)+>>r'F$2,u8M2,6/38&*+=f&t+u)>O/g,?\A8a(CDei]g
C2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uF!c5V-8%J)A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)
AU&01@;]LqBl@l3%15is/g)8Z+EM@1GT\AXDfTA9+<VdL+<VdL+AP6U+EqaEA.8l@67sB'1a$jU
AU#=FC2[X'AS5^uFCfJ?+<XEG/g,">@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL:-pQU
FCfN8%17/mAU$@!+>Y-$+>=630HbFQAU#>C%15-*$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(
+F,)?D_</RC`mb0FEMVA/g+_CA1e;u.!R:&.3NSPF<GijAnc:,FCT6+D.RU,?XHE$7!*?cCi^_?
C^g_#%13OO:-pQUEb/lpDImisFCcS6F`\a:Bk)7!Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j
$?B]uAS+(d+>Y-$+>=63BkAt?@UWef@p`YZDe*2tDETTpEb0E4+=ANZA8a(CDBNt2FEMVA/g+_C
A1e;u-uLRgF"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9`Pi4YD.8D@Hq%%13OO:-pQUBOPdhGp$U5
+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!
11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgDnDe!m6F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I
4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$4R>;67sBkBle60@<iu5
Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2Cis:u$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"
$;No?+E27>FCAWpAKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6%17&mEcbf)@<-EP3a4Wf3?^FB+=AZi
.k<,#.k<,t/LM`L+Boso%13OO:-pQUGA1r*Dg-7FCis6%A76TjDf0W7Ch4_uDg3C8Eaa0+DJ()%
BOPpi@ru:&Et&J#Bl7`s@q]:kF$2Qg3ZpF+3]A00@4lnU0fCOr/ho(0,$uHs+C,E`%15is/g+_9
BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is
/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HW.EbTW,
4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M
-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g
>n%,M$;No?+ED%%A0=i;66KfMCh[a#FCeu*FCAWpAKYT!Ch7Z1/KeY6F*(u6+EV:*DBL?JART+k
A18WQ+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW)ART+kA26;/><3lh4"akq-9`P#3I>0e
.3L/g/j=_,><3lh4"akq+BplL-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)
@4iuO/M;Jp0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HUn$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ
66KfMCh[a#FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4
.1HW.EbTW,FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"INViU+=LGT+=LM</0H>h0edr_
/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5/3kU<-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)
+=BE[.4H\p+<r![5U\$80RI4\.4-Go+u(N3>q%3F><3mT/g<"m><3lg+u(2g3I>0e.4-T2,!%&'
4t.UY%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDf[%0DIakuF)u80Bjl*p+Cf>#AISugF?MZj
+?L]YF:ARoF?MZj+?L]$2'QBM4!80X+<Ve%67sB1/p)>[%16re4ZZjk4!6:5,$uHS+D5d=+<XEG
/g)VrBkh\u$>j<:3aEji+>Pl"?Q_EQB657=+AP6U+=]!\@<--oDg-(.$>jcG3aEji+>Y\q?Q_EQ
B657=+AP6U+=]!bEGQ'kD0S3)>p)3O1,:%\+?L]YF<D\K:-pQU.P>gSGRXuh$;No?+F\HSATBGG
ASlB/DdmHm@rri8AU&;>/KeS8AmoguF<G<@F(96)E-)NrDf\'&+=Cl<F!i:[3ZpI+-sJ_TC2dU'
BHS[OF`V,706CcBE%`R]/0H>g+=A9`/q+pK.3L/a-S?bh/0H;_-QjunINViD%143e$;No?+ED%%
A0>u*G]Y'?Ec5e;C*7Y?ATAo8ASlB/A8-'q@ruX0Gmt*qF?MZh3ZrHS@:UL!Et&I!%15is/g)9Q
Ddd0!C*7S-EbTK7+D,Y4D'3R9F`V,7+EV13E"*.hCcsg%-nlf*0I]8%F:AQd$;No?+Dbt)A0>V0
F(96)E-*47Ec5e;@rH6sBkMR/ARlou+E1b2BFP;`E'66)><3l\+Z_;"><3lh+DPk(FD)*j%15is
/g,%SD.7's+E(j7DdmHm@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<
F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+EqL1Eb-A%D'2CmF`V,)
+C]U=F)Po,+DkOsEc6"AG%#30ATJtAGAhM;-Qm>J+=Ci@D.P(($;No?+BM*&;FNlG8Nf*W-[0KL
CF9Pu%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5
ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,+=MAS
Bl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9A7Th"
E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q+Co1r
FD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!$;No?
+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3Df$V=BOr;q
@<6!&Ci<flCh4^u$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1
+EMX5Ec`FHE-!-R+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,
E,ol3ARfg)D.-ppDfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[
+>=pVEZeq0Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67F
De'tP3[\ucF_>5rFs(jCF_;h>FD5Q4-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&E$lc4+E(d5
-Z*F6-QlV91E^UH+=ANG$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E
3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZX70J5%,%15R#9LM<I4ZXs'ASu("
@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen
7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555
C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<c
CG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??
Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%
C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:P
Bkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo
05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f
.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>
B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2
@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*
+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?
A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;
DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!
FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-
D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje
:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,
Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQ
D.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6
ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et
+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogq
G%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5
%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ
8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5-/heX^$:[fb6q(!:3[\QODImis
CbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO
4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi$?0NfA8bs2
6?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR@P2V1Ado)dA7f@j
@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:E\;<AAdo)dA7f@j
@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU:IINX@r$4+7qHcp
E+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8X.1HV^78--9;aii1+=ANG
$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!
A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$;+)^+@L-XF_t]-F<G".F)N12Df0Z*Bl7u7E+EQ'
G%G]8Bl@m1+E(j78p,)uFCfJ%$>sd(AR]RrCNCV?BOQ!*F(fK9+D>\;+EVNEF`V+:G%#E*Dfp+D
8l%htAmo1`Ch\!*ATKI5$<(MI+EV:.+Co2,ARfh#Ed9\T$4R>WE+*j%+=DVHA7TUrF"_0;DImis
CbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\f
CM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'E-"&n
04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,
ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<r
An?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]
ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX70J5%,%15R#9LM<I4ZXs'ASu("@;IT3
De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRL
Ea`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6
F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63
B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8
EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r
+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&
FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]Tu
Eb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<
@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'
6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)
F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;
Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8
GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-
F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'
/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@
$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH6
8l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9
F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/C
AKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZ
AKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDkD0]l7A8lR-
Anc'm1,2Nj/h1^`C2[X%Ec5Q(Ch4`1/M/)>Gp#^T6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S
:-pQU5p0Z[F*)>;BmO?$+A,Et+E2@>Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is
/e&._67sC0@:WneDK@IDASu("@;IT3De(L1$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5
Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6X
H#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:
Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI
%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6
@;]Rd%15is/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXq
D.RTqARl5WA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3
+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is
/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:
E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-
Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4
+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-
7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<AKYhu
@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%15is/g+4d78cQ?9h@K/+=Ci@
D.P(($4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4
B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/
+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?
+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR1
3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%
?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@
A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVp
B0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFu
EcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(
-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,
%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!
%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KP
ASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!
CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87
B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k
?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(C
B5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/
F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^
A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?
+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"
EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is/g,1WDBO%0F`_P<DeF><
@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4
$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)
+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&IiB0A9u><3m?CiF9.+BplL
I4cXTEc;HpBQH<t+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4KDfTqBBOu"!+E)-?E-67F
DdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o967sBt@:O=r
%15is/g)8Z+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7DfTB0
%16ch4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_C
A1e;uGp$d:E,KJ7I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8
F`M@P+D#G$/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC%ARTUhBHVA0DfTqBBOu"!+D,P4
+EMXFBl7Q+@;]TuCh[s4+DkP/@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;+=D5AAKYf-DJ(=>+<XEG
/g,4H@<,jk+EqaEA0>r,DfTqBFCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#
@qZutEc6)>+EM47Ec`FGAU&;+$;No?+<WK`+D>h;+=D,HF*&cP+<VdL+<XEG/g,4H@<,jk+DkOs
Ec3(ABQ%p5+EV1>F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)+C\biEarHbC2[Wi+Eot$
+F##>DJUFC-QjNSA8a(CG9Cp;FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7I4cXd%16f]/g)i2,Bl:'
+>G!&5^OVa+<VdL+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$>F*)
+>>r'F$2,u8M2,6/38&*+=f&t+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_C
A1e;uF!c5V-8%J)A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3%15is/g)8Z+EM@1
GT\AXDfTA9+<VdL+<VdL+AP6U+EqaEA.8l@67sB'1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG/g,">
@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL:-pQUFCfN8%17/mAU$@!+>Y-$+>=630HbFQ
AU#>C%15-*$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA/g+_CA1e;u
.!R:&.3NSPF<GijAnc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lpDImisFCcS6
F`\a:Bk)7!Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?@UWef
@p`YZDe*2tDETTpEb0E4+=ANZA8a(CDBNt2FEMVA/g+_CA1e;u-uLRgF"&4VINU3p4"u"*0d(O#
/heD\Ci<d(-9`Pi4YD.8D@Hq%%13OO%15is/h1:=Fs(r[/KeJ<C`m1q@r$4++Eh=:F(oQ1+DtV)
ATKI5$;No?%15is/g+&'FEMVAF!+n-C`mn0Ch[E&@UWb^F`8I@@;TRs+DkP/@q]RoB-;)#D.Oi/
Eb/isGT\D[.4u_P$;No?%15is/g,"LDII':+<Y-0@r+J,@;TRs+?_>"@:FC&H>It=Cf"_g%15is
/e&._67sB'+CS`&+=CZ4-QjO,67sBhCht5<DfTB0+DG^9@;Ka&@UWb^F`;CEF*(i2FD5W*+EqOA
BHS[4BI=5r:-pQU+<Y*%Fs&.[+<VdL:-pQU@;Ka&GAhM4F!,17+CT)&+C\bhCNXT;%15is/e&._
67sBkH!t5E+<Ve9Ch%9J:18!NF!*Uu+DGX7@:FC&H>It=Cf"_g%15is/e&._67sB'+>P'J@WikA
C2[W1+<XEG/g+S=C`mA2Dfp"ADIIBnF!,17+CT)&+C\bhCNXT;+EMX5Ecc#5B-;D4FD)dEC2[W1
%15is/g)8Z1a$49Fs&.[+<VdL+AP6U+CT)&+DkOsEc6"ABl5&%Cht5'@:O(qE,uHq@:FCC3\qm>
+>=630Hae5Fs)&>$9AV'BkAt?@UWeWCgUUcDe*2tGp$X9/g+n>ATDfu@;9^k?Q_d8;D9d[?X[\f
A7$I"ATW'8DD!&CDIb@/$>F*)+>#3[F(K3-FEq5%C2[Wi+F,)?D_</HAhG38@:XCg?X[\fA7$I%
G!.H#+Cf(r@r#sjD.Rcq@;9^k?QaV:A8a(CF`nmJATW'8DD!&CCia/?+F-+&+EDX4@;9^k?QaK7
+D#G$/g+_CA1eu6$>F*)+C\biEarHbC2[Wi+E_ij/g,B]@W$!)-S?bhA8a(CF`nmJATW'8DD!&C
Cia/?+C]4O/g,QpF`nm=DIb@/$?0U%4Y@j*4CL9"+>#2m/j=_,I4dc5GU?m;Cag\`4s279Gpsje
-8%J)@VuV^@Qc=d0H`J#,:5SsE+X>;%16?$INU^7+u)>E+u(Ds4s27_+<r"JAp>aI/0Zbp/j:C?
+tt-K+<r"<D@Hq%%13OO%15is/g+h9DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n+>Y-$+=CZ@
CgUUcDe*2t-oNeA0KUsM-RVYU/gi"q+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@
$=n'bFEhmj3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD
/mg=U9L^RY/M9Cg-OgCl$;No?+Co2-E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8Ec*";Dfoq?
G%#30AISufBQ&*6@<6KQ3aEk4+>G$#1+"ac$4R>;67sC"DfTr.@VfTu@W-K6A9)+&Bl7Q+@q]:k
@:OCjEcVZsE,Tc=@q]:kF$2Qg3ZpF+3]A0/.k<,#.k<,#.sror,$uHs+C,E`%15is/g,@PDId[0
F!,:A@qfI^+Cf>-F)Pl++C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?p3%Ch$sg@<-EP3a4Wf3?^FB
+=LYNH[[\-.qpUj0e";R+Boso%13OO:-pQUARoLs+Cf>,D..<m+:SZG:IA,V78?fL:JFPL:..6+
+=D5DDg-//F)rICEZc_WH[\_=I4$Bi%13OO:-pQUEb/Zi+=84TEbTW,+D,>(ATJ:fEb/Zi4ZY;@
3\_s0?!oc[/grM2-9a[C1Eee5.4H\T$?pN)FCdTr0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[$?B]d
A8Z=.DEU$:+Z_AD-nul+0d\;S?p$\,-o3V*5!UMP+Z_;+.4H\T$?pN)FCf?.F`'?'-sJ_T1Eee6
+Bp9;-nul+1*Bk14?tMI1GU:@5U\E33\W!3.3Mn*$4R>;67sC$ART*l<'`hnA7]RkD/"*'A0>u&
@VfTuAnc'mF!*%WAmob&ATAo8BOPd$-urm-A9;?2+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WG
Ci_$7$?B]dA9;?;4ZZe.+?V_<?SWrl+=K6s@4iuO/1)u5INViU+?V_<?SWa.3ZohV+=nW`-o!E&
@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3L#n1OEO_.3L2pINU?g3\_s0?!oc[/grM2-9a[C1Eee5
.4H\T$4R>;67sC)EbTW,F!,R5@VfUs+CT=6<'`hnA7]RkD/"*'A0=Q8+EV18D/!lrFCeu*FCf]=
+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?pN)FCfQ)1-I[(+=Jrf3\hg`?p$\,-o3V*
5!UMP+Z_;+.4K]g><3lT><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[+%3Zri'
5U\0K-o!%s/0Zet5U\3:5U\*703g+R0gI-M-79o`5[>ff.4HAa+=oc+-o!E&@4iuU-nHPs.6q/f
.3MhU+FPjd0d'[]+?Lc%+=K6s@4iuU/3kC?-8%J2+Bo9^%15is/g+b;FCSu,ARoLs+EV1>F>%K>
@rcL/+CT.u+CT>4De!KiFCcS)De*Dg$?UAQ3aEji+D5d*$>jlJ3aEji+>Peu?Q_EQB657=+AP6U
+=]!cG]XB%D/)3p>p)3O1,0t[+?L]YF<D\K:-pQU.P>FMEt&InA3DtZ+?L]$2^2TO4!80X+<Ve%
67sB1/o>$;CLh@-D@HqiEBQ?g+?L]%0HsjH4!80X+<Ve%67sB1/ou#K%16rs4ZZjk4!6:6,$uHS
+D5d=+<XEG/g)VrFCf\+$4R>;67sC0F`V,706CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.BC*7S-
EbTK7%17#p4ZX]5Bkh]:-6tVp3ZohT3Zr0V@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p+C-E=
/0H;m-Qjr_-QjcZ/M;Jp>:C!g+:SZQ67sC$ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*Eb/a&
DfU+4$>OZG3a4WfEb/Zi+E)<1$6Tcb:-pQU+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8ASlAq
$>OB?3Zoh)+Z_;+5\bBM$4R>;67sBsDdd0!C*7S-EbTK7+D,Y4D'3>,DJ!TqF`M&(+DN$<@<?/l
$>ONC3ZqWf+>=s"0HaR\+?Uc]E+*j%%13OO:-pQUDKTf*ATAo3Afu#$C1UmsF!*%WF`V,)+C]U=
G%#E*Dfp+D.!9WGCi_$JD.-ppDf[$LF(or3E-67R+CSnoE-67R+>,9!.3N>:+E2@4F(K62%15j+
6;p$.+>GPZ$4R>;67sC)BOu3q+CT+08K`.sARlomGp%0HD.Oi,@:O=rF!,X7Cis<1+=DAOEbd$F
DfQsJBQ%a!-OgDX67sB^84?EF5tsp63ZoeoDfTV@%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:A0>?,
+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`3[Y@D
%15is/g+\ID/^V:@<?1(+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#
F:ARP67sBK<D?:d5u^B<3Zoe'C2[W9C2[WnF_u)=0..29:-pQU6rcrX:f:=j5u^B<3Zoe'C2[W9
C2[X%Ectu9D/aPL-OgCl$;No?+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4.3NJ9
@rcK1-t@()@<-=0F=A>HAfu&5ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:%13OO:-pQU8l%ht
G%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.
$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G
+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5
F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?+>G!Z
D'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^E
De't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:AT0">>9G^EDe't<-OgE%Eb]?-A25l767sa,
Eb]?-A0>qF/KeeHA0>i3De`inF<GX9FEMOT%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EZcJ6$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C@%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW)
2fE2J0fL4`A7T7^+F7X6Ch7Ys$;No?+>PW)3,`;K0ejeZA7T7^+@/pn8P(m!+CoV3E,uHq:-pQU
1,(CADe!lD1a$LMF(KB6ARloL;aX,J3&Mh"ATW$.DJ()+DKKe>C2[WnATf22De'u5FD5Q4+E1b0
@;TRtATDi$$;No?+>PW*3Fl]20K(%oATr0/FED)3+D,P4+A*b:/hf"&%13OO@Us1_F'iWrDe*3<
3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151NA7T7p+DPh*+E_d?Ci^sH%17#a+C\kq
@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdGEbfB,B-:i-Dfp"A/Kf.ZART?s@<3Q/
AS#C`A.8l\De*KfBkhQs?Tg"a-YdR1F*)>@AL@oo%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2
+=Lr=De(:+$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4
ATT&C/g+eIE$-N=@V'e+-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgDX
67sB.BkhQs-Qm&5FE2UK4$"a2F!,(-EZf(.@j`B.$4R>;67sC"F`]9]Eb/hl$:IZW<D>nW<'sGU
9gMNB?YO7nA7$HB3Zp+!3Zp*c$?L'&F`_SFF<GOC+=DMb:4@U=%16Ze@<6!&-[U;;IXNRQ$7I91
-S0"NA7o7`C2[Wi.3N87F<DrXISP??-OgD3%13OO:-pQUF(KG98l%htF`V,7+DYP6F!*%WEb065
Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,AISufD/XQ=E-67F-ZsKAE_BthF!,L7F(KG@%14M*Db*Z&
<$47FHTE9#+>G!XBk(p$1a$FBF<DrGDe*g-C/o=dEbf63F!iCZGB.D>AKY`,@<?0*-[oQDDJ!Tq
06M>IEbf63F"Us7B."f2$?L'&F`_SFF<Dr':IH=EEc5](@rri7ATW'6-OgC               ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;,+>PfkH"q8.E,ol/Bl%?TGp#^T6m-#S@ruF'DIIR2+E2@>Anc'm~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ER'
zz=:zz,'R003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012'
zz=:zz,' ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR'
zz=:zz,'022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GRO'
zz=:zz,'UP HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface'
zz=:zz,' JDFILES JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRI'
zz=:zz,'PT JSON JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXE'
zz=:zz,'XPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK'
zz=:zz,'006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDE'
zz=:zz,'L PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEX'
zz=:zz,'T UNION UTF8 WORD XML afterstr alltrim badappend badblia badbu badc'
zz=:zz,'l badfl badil badjr badlocn badobj badrc badreps badsts badunique b'
zz=:zz,'eforestr bget bnl boxopen catrefs cd changestr checknames checkntta'
zz=:zz,'b checknttab2 checknttab3 createjod createmast ctl datefrnum dblquo'
zz=:zz,'te decomm defzface del destroyjod did didnum dnl dpset dptable empd'
zz=:zz,'nl fex firstone fod fopix gdeps get globals globs grp gsmakeq guids'
zz=:zz,' guidsx host hostsep isempty islocref jappend jcr jcreate jderr jdm'
zz=:zz,'asterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv justp'
zz=:zz,'ath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc newd n'
zz=:zz,'largs now nowfd obidfile od ok packd plt put quote read readnoun re'
zz=:zz,'adobid regd remast restd rv rxs rxsget rxssearch saveobid second tc'
zz=:zz,' trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),<<;.'
zz=:zz,'_1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN C'
zz=:zz,'NLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 '
zz=:zz,'ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR0'
zz=:zz,'60 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 E'
zz=:zz,'RR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR08'
zz=:zz,'0 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ER'
zz=:zz,'R090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099'
zz=:zz,' ERR100 ERR101 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 INVGROUPS '
zz=:zz,'INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052'
zz=:zz,' OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 '
zz=:zz,'OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsfx app'
zz=:zz,'table appwords backupdates badcn bchecknames bgetdicdoc bgetexplain'
zz=:zz,' bgetgstext bgetobjects bnlsearch bnums bpathsfx btextlit checkback'
zz=:zz,' checkntstamp checkopen checkpath checkput closedict createst defwo'
zz=:zz,'rds delstuff delwordrefs didstats dnlsearch dupnames freedisk freed'
zz=:zz,'isklinux freediskmac freediskwin fullmonty getdicdoc getdocument ge'
zz=:zz,'texplain getgstext getntstamp getobjects getrefs gslistnl inputdict'
zz=:zz,' invappend invdelete invfetch invreplace islib iswriteable iswritea'
zz=:zz,'blelinux iswriteablewin jdatcreate jwordscreate loadalldirs loadall'
zz=:zz,'refs loadwords mainddir mnlsearch newdparms newregdict nlctn nlpfx '
zz=:zz,'nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc '
zz=:zz,'putexplain putgs putntstamp puttable puttexts putwords putwordxrs r'
zz=:zz,'pdtrim rplctable rplcwords sortdnub splitbname''                    '
zz=:3129{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&q+>Y`/0d&Fu1b^aCC2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7
FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5
DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(
ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et
+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$
DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._
67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9
B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'
+C]5)+<VdL+C\bhCNXS=DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA7]R"+<VdLA7]Rg
FCcS=DfTB0/0K%GF*)IS+D5_5F`;CQ+DkOsEc6"M+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;+<Y3/
@ruF'DIIR2+DG@tDKKT)Bk(RnBl@ku$;No?+<Ve;DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y36F(KG9+<Y`:FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is
/g)8ZB4PRmF!)SJCh[s4+D5_5F`8I3DIal2F_Pr/+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;+<Ve>
ATT&=DfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^)&Ec5e;A8,OqBl@ltEd8*$:-pQU+<Y<5
Ddmc1+<YlHEb$;$DIal3ATMr9B5DKq@;I'(@;TQuEb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G+<Y07
ART[l+CT.u+E;O8Ed8d?Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZD..3k+<VdLB4YslEaa'$+A*bt
@rc:&FE8R5DIal#@<>pe@<6!&A9Da.Et&IO67sB'+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2+DtV)
AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$
:-pQU+<YT5+<VdL+<YTAASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG
@:O'qA8,OqBl@ltEbT*+%15is/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG
+Ceu)ATD3%Bl8$2+Co1rFD5Z2@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%
+Co1rFD5Z2@<-W&$;No?+<VeIATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS
@:O(`.1HVZ67sB'+ED^J+<VdL+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8Z
F`V,8+<VdLGAhM4F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU
+<X*nEc5t@D.Rd0@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,e
EHPu9AKW@8Anc'mF!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
DBO%7BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h
+F5/HDe!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ
:*<P35tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0
AKYQ%A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQU
D.-ppD]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#
AISuA67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a
;Fs\a4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?
+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=
<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/
0F\@g78m/K3\_'N7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dK
ASbs$Eb/ioEb0,uAISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23u
A90dS=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F
<Cp.Y/58Dt;GR`/%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl
4ZZe.+>#2g><3lV/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*
@<,ddFCfJ8-6R89FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI
-OgDZ5u^BB85`AL3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(n
EcW@6AT23uA8,po+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O
-Rg00/jMH\+C-FE.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloq
Bl%?'DIIBnEt&IkF`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z
+=f&t>V7-q5u^BC78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2
Et&IO67sBqDe*p7F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*
F!,")Anc-oA0>T(+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'
6r6cW7QieIDe*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*
BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X(FDl22:-pQ_C2[X(
FDl22+CcuT+EMXCEa`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?
+@p3WATJu9BOr</DId=!CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is
/g+\=@ruF'DIIR2+E(_(ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is
/g,1GEHPu9ARlp*D]iP'@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is
/g+2+Eag/*DKKH1Amo1\3XlEk67sB'+C\hoARfLn@;TRs+<Y0-ARfLs+C\bhCNXS=DIIBn+E1b2
FCfK1F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLifo$(
$;No?+<Ve9B4Z0qBk([l@ium:B4Z0-@UWb^F`8IHATDj+Df0V=De:,6BOr;sBk)7!Df0!(Gp$X9
@s)X"DKI!D+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<][.Jdi&^67sB'+C\tpFCf]9Cgh$q
+<Y<.F<G%$@r$4++Eh=:F(oQ1F!,C5+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?pC+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdLifo$($;No?+<Ve9B4Z0tF*(u<F<D\KB4Z0-@UWb^F`8IHATDj+
Df0V=De:,)Ec6)>06;8MFCcS.ART+\EcW?G+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<][.Jdi&^67sB'+C\tpFDkW'ARfh'+<Y<.F<GL2C1UmsF!,(8Df$V+@:O(qE-!-E+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLifo$($;No?+<Ve9DJXB*
@<,jk+<VdLF(Jd#@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5EZfF;D/a<&
+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0+<][.Jdi&^67sB'+C]52D0$gB+<VdL+<Y]9FEMVAF!,UC
BlS9,+C\bhCNXS=DfTB"Eb/c(Ch[s4+E(j7A8,OqBl@ltEd8d:@:O(qE$0%@D.7'sF!)SJ+<VdL
+<VdL+<VdLifo$($;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'DIIR2+DGm>
DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6+Co1rFD5Z2
@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"@ruF'DIIR2
+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,OqBl@ltEbT*+
%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is/g)8ZA7]@s
DfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(ARfh'%15is
/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$Ec#6,Bl@ku
$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8ZB4Z0qDe!p,
ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.F<GX<DfTqB
DdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,A0>r9Blmo/
F(96)E-*4EAU&;+$;No?+<Ve>ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5
E-67FFD5T'F*(i-E,uHq:-pQU+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIaFE7lu:-pQU+<Y<.FE1r)
F!)SJ+<Ve>ATT&8AS,LoASu!hEt&IO67sB'+D5b3BleB6C`jiC+<Y<;Dfp"A@;]TuF*22=AKYl!
D.Oi+BleB;%15is/g)8ZBl7m4FC])qF<D\K+EV19F<G16EZf:0C1UmsF!,17+E2IF+Co1rFD5Z2
@<-W&$;No?+<Ve@DK]H-E+Not+<VdL@;p0sDIal(DK]T3FCeu*A79Rg%15is/g)8ZBl8*)ASbq"
AKW*<+Co&"ATVK+Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:An?'oBHSE?+<Y9-FCSu,Bl8**Ecbl'
+Cno&@1<Q=67sB'+DG_:Eb03+@:Njk+<YfGA79Rk+DG_:ATDm(A0>DkFC>Uc:-pQU+<YQ5GB.8-
A8,Oq+<Ve:Eb/[$AKYl%G9CgE+ED%+BleB-EZen,@ruF'DIIR2%15is/g)8ZDfB9*A8,Oq+<VdL
+E)41DBN@1A8,OqBl@ltEd8*$:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*DIIBn+Dbb5FE7lu:-pQU
+<YWGFCf]9Cgh$q+<VeJFDl22+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU+<YWGFD#Y;
+<VdL+<VeJFDl22+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YWGFDc2AFCB$*+<VeJFDl22+DtV)
ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<VeGF`__6@VfTu+<VdLF*)>@
AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWGFED)=FE8QI
+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9$;No?+<VeG
F`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28Eb$;*Ci<ck
C`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2F*)>@
AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO@;9^k-OgCl
$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc$:@Q_5uL?=
3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#%15Ht9M&/^
4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*$:@QU:JFYa
4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6F*%iu%15is
/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,6V^<H;cG;8
:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>buD.Oi"CghC+
+E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1OgBOu'(DdmHm
@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2ASuTN+Co1r
FD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBmBl%?'@rH4'
Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!Df'H3DIm^-
3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,E,TW*DKIo^
CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,LoASu!h+Cf>,
E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*ATD@"@q?d%
@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^F(or3
+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/A79Rg+D,>(
AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]9L26F%15[%
<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'@<>p#Anc'm
+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]
/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*F*&O8@<>oe
$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:(7O>$;No?+DtV)
AM.jCDfQt<@;TR.DIIBn+EM+5@<,duDfQt1BOPpi@ru:&%15iu:K0J<-S?bh%13OO:-pQUFE2)4
+ED1/BQP@FFE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc
+<u=X><3lY/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQUF)Yr0F<G%$@r$4++DtV)AKYr#
FED)7DBNG*%17/qCh\!#DIIBn4ZX]6:..lW-=UOuDfTE1FE/Kc+AP=#<$l$cFCfK6FE/f>$4R>;
67sa!DId9hE+NotASuU2                                                      ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q-+>P&q+>Pes3$:%3C2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[X(FDl22F*)>@@:s-o
DdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[W3                                  ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodsmoketests bgetSmoke00 bnlSmoke00 bnlSmoke01 compjSmok'
zz=:zz,'e00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dnlSmoke00 dnlSmokeM'
zz=:zz,'acroTexts edSmoke00 globsSmokeAssign000 globsSmokeDoc00 grpSmoke00 '
zz=:zz,'jodageSmokeDays00 mnlSmokeArgs00 newdSmokeBadArguments00 odSmokeArg'
zz=:zz,'Fail00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''                     '
zz=:314{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>PljDe*p+Deip+ATMs7-t6h#F=A>@EbBN3ASuT4F)>i2AKZ)+F*)I~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&n+>GZ41hpr>A7]p,/KdY]6m-#OG%GK.E,B0(F:AR?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>MC2[WnAThH(BlbD=BOr;Y:IH=9AThX$DfBQ)DKI!NE-67FA8,OqBl@ltEd98e>@'$i
%15[K+DGm>FD,5.Anc:,F<G+.@ruF'DIIR2+E)-?FD,5.E+*j%+E(j78l%ha$=e!bAKYMt@ruF'
DIIR"ATKI5$4R=b+<VdL+<VdL+<Y3/A0<QK+:SZ#+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$6UH6+<VdL+FGnkC2[WnATiH9De+6<FD5Q4HjpE*+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$4R>ABPDN1E+*j%+DGm>FEqh>@ps0rDe:+a:IH=9AThX$DfBQ)DKIKR:1\Vl@;]Tb$?g?(@<?4"
AKYK$A7ZltF!,OGDfTE"+DG^9@3@%=F`\a:ATfOGA8,OqBl@ltEd98H$;GGZAKZ&9@:F%a+EMgL
FCf;3@rGmh+DGm>AoDg0A0>T(+<k?-AT24$+s:<7@q]S"@;I%q$=mj\FD5Z2@<-'nF!+n/A0>Ju
DII?tGp$U8D/F3/+D58'ATDKp+E_d?Ch\!*ATJ:fFCfK0Bl7@$AKZ).AKYr#FD*99$4R>ABPDN1
@<-BsDJ*NtASuT4@WH1#B6,24@;^?5@V'FgAnc@./g*_t+F.mJ+D#(tF:ARc+EqaEA0>u-@<<W+
F!,")Anc-oA0>DoAT24$+E)-?FD,5.E+*j%+EV:.+:SZrEbT0#DII?(GAhM4+DGm>Eb0?$Bl7Km
+=_MO@q]:gB4YU+.Nh-%D/aPI+:SZe@:O(qE-!.1DIal1AM%q6An?!oDI[BuB-;,3ATD4$Bl@m1
+CT;%+Dl72BHUnqF*(u6%16Nb+EV:.Gp$O9AKZ28EbfB,B-;D4FD)e5ATMo8D..NtEbSru/g*Gt
A1Sj;AfqNiH#IgJF(KG9@;Ka&@Wcc8FD,5.E-67FA8,OqBl@ltEd8d8;FNl>:JOSd?n<FGDflKr
E,oN5ASuT4@:Ne]A7]Y#@;I&rBOPdkATJu9D]j+C@:F%a+Cf>#AM+E!%16'JAKYMt@ruF'DIIR2
+CoV3E-!.0C2[WnAThH4+CJr&A7-NgDIaktF`_>6F'oFaA8-+,EbT!*FCeu*@X0)<BOr;oC2[X(
Dfp)1ARHWhA7TUr+D>2,AKYo#C1Ums%172kD.Rd1@;Tt)+EVaHDIm?$De<T(FDi:BARopnAKYT!
Ch4`1BmO>C%16-IEcYr5DK?qEBln#2DdmHm@rri8Bl.F&FCB$*F!+n3AKYE)@;0Od@VfTu%17#k
+@g-f89JAaF(JoD%13OO0eOSQ?tsUjA7]pl>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPL@Vfsl05Y-=FCfJGC2[WnATf\?C3(g5$4R=t/g+A+C2[Wj>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGC2[W8Bkh]<%13OO1G0eS@!-R*Ci`ui
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-ATBGHFD5Q4/no'A
.1HUn$4R>H?85_H+B3#c+D,>.F*&O8Bk)7!Df0!(Gp%$C+CQBb:IH=E@<?0*BlbD,@;KakA0;<g
+<VdL+<Yc>AKWIAF`\a:Bk)7!Df0!(GqLQ                                        ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
