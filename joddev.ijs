NB. JOD dictionary dump: 28 Feb 2023 10:55:31
NB. Generated with JOD version; 1.0.24; 8; 28 Feb 2023 10:20:43
NB. J version: j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1
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


DPLIMIT=:64

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.23 - dev';38;'28 Feb 2023 10:55:31'

JODVMD=:'1.0.24';9;'28 Feb 2023 10:55:31'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


jvn=:3 : 0

NB.*jvn-- J version number.
NB.
NB. NOTE: the format of  the string returned  by 9!14 has changed
NB. without warning over  the years. The latest change (feb 2023)
NB. has  been   to  a  (version.major.minor)  layout.  This  verb
NB. computes a floating version number.
NB.
NB. monad:  fa =. jvn uuIgnore
NB. dyad: fa =. cl jvn uuIgnore
NB.
NB.   v0=. 'j9.4.0-beta13/j64avx512/windows/commercial/www.jsoftware.com/2023-02-23T08:08:24/clang-15-0-7/SLEEF=1'
NB.   v1=. 'j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1'
NB.   v2=. 'j10.12.53/jwhatever'
NB.   v3=. 'j8.05/oldsys'
NB.
NB.   v0 jvn_ajod_ 0
NB.   v1 jvn_ajod_ 0
NB.   v2 jvn_ajod_ 0
NB.   v3 jvn_ajod_ 0

(9!:14 '') jvn y
:
NB. for empty version strings return
NB. 0 we don't know the version
if. 0=#x do. 0
else.
  NB. extract J version from (9!;14) string
  ver=. (x i. '/') {. x ,'0/'
  if. '.' e. ver=. (ver e. '0123456789.-/')#ver do.
    NB. version.major.minor layouts
    ver=. ver {."0 1~ ({. , <./@}.) ver i. '.-/'
    (0 ". 0{ver) + 0 ". '0.',((] }.~ (i.&'.')) 1{ver)-.'.'
  else.
    NB. version layouts before j9.4
    100 %~ , 0 ". (ver i. '/') {. ver
  end.
end.
)

putgs=:4 : 0

NB.*putgs  v--  stores  dictionary groups  and  suites.  Prior to
NB. calling this verb  names, path and put dictionary status have
NB. been validated.
NB.
NB. dyad:  (bacl ; ia ; ia) putgs blcl
NB.
NB.   ((<'6');WORD;GROUP) putgs ;: 'group and members'

'DL code gtype'=. x  NB. directory object !(*)=. DL

NB. check binary compatibility of target dictionary
if. badrc msg=. binverchk DL do. msg return. end.

if. badrc msg=. pathnl code do. msg return. end.
y=. /:~ ~. }. y [ gn=. {. y
if. *./b=. y e. ; }. msg do.

  NB. change/create group -- insure group directory is ready
  if. loaddir__DL gtype do.
    jderr ERR054  NB. errmsg: unable to load directory
  elseif. do.

    NB. depends on first char of index list matching (cP_DL) nouns
    fc=. {. ix=. (>dnix__DL gtype),'__DL'
    cn=. (>dncn__DL gtype),'__DL'

    NB. groups/suites are either new or replacements
    uv=. (".ix) i. gn
    dfopen__DL fc
    gp=. ".fc,'P__DL'

    if. uv=#".ix do.

      NB. group is new - create

      NB. EDGE CONDITION?? if another group with the same
      NB. name exists on the path copy the group/suite text
      NB. of that group to this new group.  Use of this system has shown
      NB. that this is desirable behaviour because of the common
      NB. practice of "regrouping" in the put dictionary new versions
      NB. of the same group that are deeper on the path.
      if. +./uv=. (<gn) e.&> }. pathnl gtype do.
        if. badrc uv2=. gtype getgstext gn do. uv2 return. else. uv=. (1;0 1){::uv2 end.
      else.
        uv=. '' NB. default script is empty
      end.

      gdat=. <gn , uv ; < y       NB. (cn)   name, script, contents
      gdat=. gdat , <gn , 3$<''   NB. (cn+1) name, latex, html, text, et cetera

      NB. append group
      if. badappend apcn =. gdat jappend gp do.
        jderr ERR058 [ dfclose__DL fc return.  NB. errmsg: append failure
      end.

      stamp=. nowfd now ''
      uv=.  stamp;stamp;<a:
      uv2=. CNPUTDATE,CNCREATION,CNEXPLAIN NB. NIMP group append
      if. badrc msg=.uv invappend gp;uv2 do. msg
      else.
        NB. update directory
        uv=.  (".ix) , gn
        uv2=. (".cn) , {. apcn
        if. badrc (gtype,gp) savedir__DL uv;uv2 do.
          jderr msg [ dfclose__DL fc return.
        else.

          NB. stamp good directory change
          (<(#".ix);now '') jreplace gp;CNMARK
        end.
      end.

    else.

      NB. group exists - update
      apcn=. uv { ".cn
      if. badjr uv2=. jread gp;apcn do.
        jderr ERR088 [ dfclose__DL fc return.  NB. errmsg: read failure
      elseif. gn -: 0 {>uv2 do.

        NB. update group list - group script is not changed
        if. badreps (<(}:>uv2),<y) jreplace gp;apcn do.
          jderr ERR056 [ dfclose__DL fc return.  NB. errmsg: replace failure
        end.

        uv2=. uv;nowfd now ''
        if. badrc msg=.uv2 invreplace gp;CNPUTDATE do. msg return. end.

      elseif.do.
        jderr ERR055 return. NB. errmsg: directory-data inconsistency
      end.
    end.

    dfclose__DL fc
    uv=. ,>dnnm__DL gtype
    ok(uv,' <',(>gn),'> ',OK059);DNAME__DL
  end.

else.
  (jderr ERR083),y #~ -. b  NB. errmsg: not on path
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1cHO:+>P&u+>Y\o0f1"21E\D++>u"u0fC.01E\D,+>Y_p2BXb1+>Y,p2BXk"1GqQs9M%rM<,H&g
Bl/!0+Co1rFD5Z2@<-W9E+*j%+DbV,B67fYH:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk
/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!*?cCi`3E6rZrX
9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX
:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08l%iS:JXY_<_YtS:IJ/X:J=\0G%G]8
Bl@l?+DkP&AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?+DkP&AKYE!A0>DkFCf31DFu$pATDj+Df-\8
F_tT!Ec?/CB6/-9DfTE1+Co1rFD5Z2@<-W9B6%p5E-!.1DIal2F_Pr/Er                 ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`;d;+>Y,p2'=Xs0ebC>1E\G,+>P&o0K(^D+>GSn1*A>,2`2^40H`+n1,LjK1E\D,+>P&o2)@!1
0f^@3+>GQ)3?U%8+>P&o1Gq-a:IINL8PDNC8Q/Sa;HYb4%15is/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp
/hen5+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>>eu:2b:u1,(I;+>>c91,(aC2%9m%$4R>;67sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D%-hI67sB]ATDj+Df.TY0eP.41*@]+F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg1*B>1Fs&Oo1,'h*
0fh'F3\r]($4R=O$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's
3Zp.3+<X'\FCdKU0fU:NDg!6Y0JY=)0etdE1HI9M%13FL:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pes:2b:u1,(I;+>GW41c%0L1("?q:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Pes:2b:u
1,(I;+>GW42)I?M1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>Pes:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pht:2b:u1,(I;+>GW41,M$J1("?q:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pku:2b:u
1,(I;+>GQ21,M$H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS2BX,1@<?'A+>Pku:2b:u1,(I;+>GT31GV!K3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L3!p!":-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pku:2b:u
1,(I;+>GT31bh$G2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS3?TG4@<?'A+>Pku:2b:u1,(I;+>GW40JPUB0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp+3+@KdN+>PW+0H`)(3\`EO1bf=E$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg1a#1t
@j!N\1,'h)3'&oP3\i]&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.4+<X'\FCdKU0f^@EARci<0JY=)0fD'H0fh!D$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>GSn;e9nj1,(I<+>GW42)dQR1^XQs
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp14
+AZKh+>PW+0d&2.3\iTS1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>G_r+@KX[ANCqh0d'8%F<E=m1,0n+2**NO3]&]$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K1-.*K
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A
+>PYo:LeJh1,(I<+>G`71c.6J3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+AZKh+>PW+0d&2.3]&fW0K9CH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh0d'8%F<E=m1,0n+2**TL
3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\
FCdKU1,0nI@rrhK0JY@*0f;!L1-.0K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Pn6tKjN1,(I<+>GW40KD0J0FA-o:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+3+@KdN+>PW+0d&2,
3\rZT2)bjL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q
+@KX[ANCqf1*Atr@j!N\1,0n+1cdEP3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0ea_<ARci<0JY@*0KD0M0KM$G$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>GPm6tKjN1,(I<
+>GQ20etdI0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1,^6t6t(1K3Zp.3+@KdN+>PW+0d&/13]/cU1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[ANCqg0d&kq@j!N\1,0n+0fh'J3\W5p$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0eje=ARci<
0JY@*0ek^F3BAoP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u3?TG4@<?'A+>GSn6tKjN1,(I<+>G`70JGOD2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp.3+@KdN+>PW+0d&2.3\iZU1,oUJ$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqg0d&kq
@j!N\1,0n+2**NL3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+<X!nBl%<&:3CD_ATBgS
1GU'q6t(1K3Zp.3+@KdN+>PW+0d&2.3]&fW1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)
+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>P\p6tKjN1,(I<+>G`71-%BO1^XQs:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)A7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,9t?ARci<0JY@*0f;!J
1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU1,9t?ARci<0JY@*0f;!J2``ZL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,pCEARci<0JY@*0K;*N2``fU$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0ejeC@;[2C0JYC+0KD0O
3BAoR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\
FCdKU0f'qE@;[2C0JYC+0f1pF1cd<F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,
+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,C%FF_i0U0JYC+0KD0J3BAoU$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0JahI@rrhK0JYC+0etdD
0fh$G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\
FCdKU0JjnJ@rrhK0JYC+0ek^D1HI9J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,
+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f1"@ARci<0JYC+0KD0K0KLpI$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>>bt8muT[1,(I>+>GW4
0fD'L0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn
6t(1K3Zp.:+A-'[+>PW+1E\D,3\`HP1bf=E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg3$:h%DBL\g1,C%-1-.3F3]&`%$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,9tE@;[2C0JYF,
0ebXC1cd<J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t
1a!o/@<?'A+>P\p8muT[1,(I>+>GQ22)dQN3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)
+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp15+A-'[+>PW+1E\D13\iZU0e`qA$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1E]:uDBL\g
1,C%-0KLmI3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's
3Zp.9+<X'\FCdKU1,C%F@;[2C0JYF,0ebXF2EEQN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>P_q8muT[1,(I>+>GQ21cRNQ1^XQs:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+A-'[
+>PW+1E\D,3\W9L1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r
@V'R@+>PYo+@KX[ANCqh1E]:uDBL\g1,C%-2**QN3\WH!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1,C%F@;[2C0JYF,0f;!K2EEQM$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>P_q
8muT[1,(I>+>Gc82)mWQ1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&
:3CD_ATBgS1,L*r6t(1K3Zp16+A-'[+>PW+1E\D23\WQT0fB@G$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes+@KX[ANCqh2'>M"DBL\g1,C%-1-.9K3\i]&
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp19+A-'[
+>PW+1E\D+3\iQR2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*+@:3bCh+Y`F_tT!E]P<u
2]s52@<?'A+>Pht8muT[1,(I>+>GZ50K2$L3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C$q
6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU1,^7I@;[2C0JYF,0f(jF2``WL$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51E[f,F_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqh2BYV#DBL\g1,C%-1cd?K3]/Su
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp19+A-'[
+>PW+1E\D03\`KQ0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#7+A7]p,+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0JO\>ARZc;0JYF,0ebXC2EEWK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1a$=?Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp+2+@]pO+>PW+1E\D+3\`WU1GoLH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#7+A7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0JstBARZc;0JYF,
0ebXG0KM!E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51a$=?Fs%noF_PZ&+AR&r@V'R@+>b2`
6t(1K3Zp1:+@]pO+>PW+1E\D-3\iTS1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#7+A7]p,
+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,g=FARZc;0JYF,0f;!K3'&fO$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51a$=?Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:+@]pO+>PW+1E\D13\W<M
0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#7+A7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU
1,pCGARZc;0JYF,0ebXB2``ZK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51a!o-F_PZ&+AR&r
@V'R@+?1Jd6t(1K3Zp1;+@]pO+>PW+1E\D+3\iBM1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#7++@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,pCGARZc;0JYF,0ebXG2**NJ$;+)^<)6:`;aOJU
9LMEC;cHOj=Y_iD$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=Wi
D.7's3ZpC)+@KX[ANCqf3?V(8Fs&Oo1,'h)3'&fK3\WE#$4R=O$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+
EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1*B>1Fs&Oo1,'h*0fh'F
3\r]($4R=O$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!
E]P<t0H_K+@<?'A+>Ghu:2b:u1,(I;+>GW40f(jG2[p*$$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.6J3]&T!
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU1,U1LDg!6Y0JY=)0etdI1cdEK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(
+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pes:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp19+AQiu
+>PW+0H`)*3\iNQ1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*0KLsG3\`W%$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F
1-.9P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW+0H`))3]&QP0fTLI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh
2]tk6Fs&Oo1,'h*1-.*D3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>>Pn6tKjN1,(I;+>GQ20f(jI1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg1a#1t@j!N\
1,'h)3'&oP3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t1*@]-@<?'A+>Gl!6tKjN1,(I;+>Gc80JPUB1^XQs:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg0d'D+E$-ni1,0n+1-.9P
3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
2'=#0@<?'A+>PYo:LeJh1,(I<+>G`71H%9N2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh0d'8%F<E=m1,0n+2**QL3\WN#$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A
+>PYo:LeJh1,(I<+>G`71c.6J3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'8%F<E=m1,0n+2**QR3\WQ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>PYo:LeJh
1,(I<+>G`72).-H0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>PVn+@KX[ANCqh0d'8%F<E=m1,0n+2**TM3\iT#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Pn6tKjN1,(I<+>GW4
0KD0J0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P\p+@KX[ANCqf1*Atr@j!N\1,0n+1HI<M3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Pn6tKjN1,(I<+>G]61H7EP1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[
ANCqg0H`bp@j!N\1,0n*3BArM3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>GPm6tKjN1,(I<+>GQ20etdI0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg0d&kq
@j!N\1,0n*3BB#T3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<u2]s52@<?'A+>GSn6tKjN1,(I<+>GT31,_0I0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg0d&kq@j!N\1,0n+
0fh*N3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u3?TG4@<?'A+>GSn6tKjN1,(I<+>G`70JGOD2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqg0d&kq@j!N\1,0n+2**KP3\iZ%
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,
@<?'A+>GSn6tKjN1,(I<+>G`71G_'J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)
+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>GSn6tKjN1,(I<+>G`71cRNP2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>P\p6tKjN1,(I<+>G`7
1-%BO1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Fu]6t(1K3Zp15+@KdN+>PW+0d&2.3\rTR1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh1*Atr@j!N\1,0n+2**NP3\`Dt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU
1,pCEARci<0JY@*0K;*N2``fU$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GSn8muT[1,(I=+>>f:2*!]Q2@9cu:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.5+A-'[+>PW+
1*A;.3\WBO0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=Wi
D.7's3Zp='+@KX[ANCqh1E];4C`kJe1,9t+3BAiS3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0JahI@rrhK0JYC+0etdD0fh$H
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3
@<?'A+>>Vp:LeJh1,(I=+>GT30f(jG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*
/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.6+@KdN+>PW+1*A823\`<L0fKFH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0K:1I
@;[2C0JYF,0etdE2EEZL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!n
Bl%<&:3CD_ATBgS0ejdn6t(1K3Zp.:+A-'[+>PW+1E\D,3\`HP1bf=E$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0fU:J@;[2C0JYF,
0etdG0KM$K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_
ATBgS0f'pp6t(1K3Zp15+A-'[+>PW+1E\D+3\`HP0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,9tE@;[2C0JYF,0ebXG2``ZQ
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r
6t(1K3Zp15+A-'[+>PW+1E\D13\iZU0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:
+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,C%F@;[2C0JYF,0ebXB3'&cP$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16
+A-'[+>PW+1E\D+3]&`U0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=
6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,C%F@;[2C0JYF,0ebXF3'&lQ$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+A-'[+>PW+
1E\D,3\W9L1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=Wi
D.7's3Zp13+<X'\FCdKU1,C%F@;[2C0JYF,0f;!K1cd<K$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp16+A-'[+>PW+1E\D03]&`U
0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp15
+<X'\FCdKU1,C%F@;[2C0JYF,0fD'M3'&iO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp16+A-'[+>PW+1E\D23\WQT0fB@G$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU
1,U1H@;[2C0JYF,0etdI1HI9O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,
+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp19+A-'[+>PW+1E\D+3\iQR2)P^J$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU1,^7I@;[2C
0JYF,0f(jE2``cU$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&
:3CD_ATBgS1,g<u6t(1K3Zp19+A-'[+>PW+1E\D.3\`QS0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU1,^7I@;[2C0JYF,0f1pG
2**TL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS
1-$I"6t(1K3Zp19+A-'[+>PW+1E\D03\`KQ0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0JO\>ARZc;0JYF,0ebXC2EEWK$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K
3Zp+2+@]pO+>PW+1E\D+3\`WU1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^H
ATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0JstBARZc;0JYF,0ebXG0KM!E$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp1:+@]pO
+>PW+1E\D-3\iTS1b]7D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!Y
A0=WiD.7's3Zp48+<X'\FCdKU1,g=FARZc;0JYF,0f;!K3'&fO$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1Gp9t6t(1K3Zp1:+@]pO+>PW+1E\D1
3\W<M0fTLI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's
3Zp4:+<X'\FCdKU1,pCGARZc;0JYF,0ebXB2``ZK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1H-F!6t(1K3Zp1;+@]pO+>PW+1E\D+3\iBM1c,OH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp4<+<X'\
FCdKU1,pCGARZc;0JYF,0ebXG2**NJ$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4A8`T,BleB%.!0B<
DdR6tA1hh=B.4s28l%i_+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7
@r,RpF(KDF%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.
AftM)FCB6+/e&.SEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!
G9CC/@;]^hF"Rn/6#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&
Gp$a<F<G:7E,9*&ASuU$A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s
$=I(IAS5^p/TboADd?`[$4R=s/g+Oa?SX<ND_Pg=3H&A:BJj[E2.prA1Lt$9AN*s[?m&E^AKYT'
Ec#6,+CI2Q3\`I!+Cf(nDJ*Nk+D,P4+A*b:/i51'?tsk&?m&rtD/aW>ATJt'$6UH6@;[3%DI[U*
Eb/a&+Eh=:F(oQ1+Du==@V'R4+@g?aDJ()(DfU&1Eb$:b+DGm>F`V87B-;;0AKYB(ATDj+Df.1E
@;9_$/o><?DfT5.CghU-F`]5Y%144#+@C'bG%G]9+Eh=:F(oQ1+Cf(r@r#drB-:o++A,Et+Cf>#
AKZ)5+E_a:+EMXFBl7Q+-[%+Z/oE$ZFDi:4ATVKnF<G(,@;]^hF"SS+Derr,De<T(%144#+E_RD
Bl"o6BPDN1AoD^,@<<W5FCAWmCh\3,F"Rn/%14jC+CI<=@W-@*1NYBqA9<#SBlmoECMS3@BeV7u
G$dF@+A+#&+D,>(AKZ/-Eaj)4D..]4BOPdk+EqL1DBN@t@qB_&Bl7Q+GA1r*Dg-7FAnc'mF!,C=
+CoM,G%G_;@:NeYF)to'+C]U*$6UH6<_uO6@rH7&ARfgrDf0V=GA(Q*+BD<6+DGm>De<T6+B3#c
Eb-V>+Du+>+Dl72BHToC6m,uJDBNJ.+D,P4+DkP+E+NQ&-u<I:FCfJ?ARm5!$6UH6A9)C-ATJu'
F`\a6An?4$F*(e4AThX&FEM#.Cj@.DATW'8DK?pS+D,P4+BD<6+EM4)Eb0;7Ch[Zr3XlE=+<Z,^
IXV_5+<VdLAn?4$F*&NP0/%'PF(Aj*0JkG(BOPpmF"_9HA1q\9A1q\ADfTB0/no'4-OgD*+<Z,^
IXV_5+<Ve!:IH=8Dfol,+CoC5@3BQ4Bk(p$AU%p1FCf?"AKYJrARfKuDf-\ABl7I"GB4mJH#n(=
D0$hDBOu'(BlkJ=AS#p*F`)&)E,]B!%144#+EM4)Eb0;7?nX0SDf'&=F(f!&AM7V.BJ4+EDfTB0
/no'4?nNQE<+oue+EqO9C`mV6F<G7.CiCM/DfQt$:ei-M@;p0sA0>E'Bm+'/%144#+EqL1DBMtV
:*=7l+E(k(/e&-s$8X:W?p%dMBk:k$CjKYNA9KdgG%kf5H8oq`CGfU9?Tqj?9jqgK+EM[GAKYAq
De*ZuFCfK$FCei&GAhM;F!,(5EZen,Eb/a&Bl@l3A7]@eDJ=3,Df0VI+EM+*3ZoPL?rToi:L@jT
A8Gt%ATD4$AM.h1?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%
E\D0GA8Gt%ATD4$AM7"Y6r.0)De*ZuFCfK$FCd(AA19,?$4R>!/g+Oa?SaEY3+Qr>G\hYEF`h,)
Ciaf=EAoj6E,]/J?m&E[F*&O4C2[X!Blmp,@<?'g+E)-?D.-pM;]oLdA0>]&DKU1V+B3Pr@;@!"
Aftu&ARo@_/e&-s$8jFY?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]Tu
AU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr
@WNZ*@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$8sLZ?p%dSCM%="@W6L"2JHrJ
H=qPD0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3BH!G9C=5E+NotBm:bBD]iG&De(J>A7f3l
A7]glEbSusDJ()*Dg*=GD]j(CDBMPI6m-S_F*)IU%13OO2_H4\4C9pS@V'h.E+q7U2fpo61NPO%
Cbp6P0PNOS5%#L#Df0W1A7]d(@:Wn_DJ()#+CJYhBle6$+Eh=:@N]c+@<<W9Dfol,+EqaECERG-
CLnVrA8-+(?m&p$F<GX<Dg*=B@VTIaFE8R=DBNCs@r$4+F"Rn/%15'I+<Y&S?Xtm%FCo<!0f4/p
G&1T/DI[?8E+(V;GAghP?m%gTDKBN&ATAo%Ci"$6Bl7Q+@"'b:+CT=6@3BMtFD)e9Eb/isGT^pB
+DkOs:K&BEDIak`Bl8'<+EMgLFCf<1/g+,,AKYZ)D.Oi#Bl[cpFDl2F+Cf>-G%GQ5Bl@l3Df-\>
BOu6r+EMgLFCf<1+DGm>Eb0<2ARfgnA0>?,+CJ_oEaUL/$4R>M>@h\_/TboADd?`[$>=-pFDl2F
C2[W<2[p+,ASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`-$6pc?+>GK&/i#7+7V-%LF^]<9+>Po-+>PW+1E\)EE-WQm@;KauDf-[dA8-."Df.!5
$4R=b.Nh>+3A*!B+ED%2@;TRd+EVNE8g$,H1a$4EA0>u-AKYetH#IhI+E(j73?^F<1a%!NF!+t+
@;]^hA0>u-Bla^j+<VeIAT;j,Eb/c(@3B&n@;]^h+EVNE?tsk&?m'Z,Bk(g!@rH4'F`_29+CQC)
Ci<a(Bl7Q+G%G]8Bl@l3DKTf*ATBC4$4R=b.Ni+e:eXGT8Q9(?G@>P8@WcO,ARlp+E$07@+>u&/
+A$/fH#IgJDImBi+Dl%;AKZ).@;[2G1a$=C@ruF'DIIR"ATJ:f+<VeFDBO4CF`JTs:IH=E@<?0*
H#IgJ@<,p%A8c1"B-;86D.Rg&Bl7Q+GB.V>B-AB,$4R=b.Ni,<F`_8;?m&lgC3=T>ARlp*D]iP'
ARfKu@VK^gEd8d;Df'H%FD52uCh\!:+>"^QBle?,A0>u-BlbD2DBNn=BlA#7G%G]8Bl@lA%13OO
%14=),9S]n0J5+:+A-'[F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/7:^+SBl@l<%13OO+=\L+
+?;&.1ad>eF`V+:De:+r7nlfc-tm^EE-"&n05#-@Ch[?2DfTJD.3N5@EZeq<FCf?#ARlp&Eb/`p
F(oQ1+DG_8AS5RpF!(o!+<Ve?@<3Q*DKKo;A9DBnA0>;'@VK^gEd8dADI[U%E+*j&@VKXmFEo!<
ATW--ASrV_+?;&.1a$4EA0>i3BlA#7G%G]8Bl@m1+E(j78hLP[+<Ve!:IH=HFDl22F!,%=FCf?#
ARlp&Eb/`pF(oQ1+DG_8AS5RpF!,17+Co1rFD5Z2@<-W9@VK^gEd8d8C1_0rATM63+A*b:/hf*k
$6UH6@ps6tEb/Zi+E)(,ATAo)G][M7A7]9oBl8$(B4Z+)+C]J8+DGF18g$,H0JjnrEbTW,F!,%=
FCf?#ARlotDKKH&ATDi7FDi:0C1_0rATM5g$6UH6@rH4'Df0-(FE8RCCh.*t+A+#&+Ceht+Du*?
Eb/Zi+Dbt6B4Z*+FD,6&/g+,,BlbD?ATDj+Df-\+A7Ta(@q]F`CNCV?D]iG,F`_"B%144#+CJhu
Ddmcq+CT.u+CJ`!F(KH$+EVNEE,oN5ASuT4FD,5.D/"')@;]UlBl7Q+De:,0AToeGCh+YtBl7@"
Gp$X+FC?;+DBNJ(@ruF'DIIR"ATKI5$4R=b+<X`O;GKeY7lhc7D]j1AB6%EkAKZ)5+EV:2F!,X;
EcYr5DBNk0+A,Et+ED%7ATT&?Dfp(C8l%htD..L-ATAo*Bl%?'@X1!D$4R=b+<VdL+<VeCDdd0!
-YI".ATD3q05>E9-OgCl$6UH6+<VdL+AP6U+C\bhCNXS=H#IhG+CfP7Eb0-1Cj@.DAS5^uFCfK(
A0>Ds@ruF'DIIR"ATJu&DIal2BQ\D>8g%Y_GA[is+<VdL+<VdL-nui`Bk(p$2'?gJ+=ANc+D,h<
Blmo/C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$6UH6+<VdL+:SZ#
+<VdL+<Ve%67sC$ATMs%Ec`Er+CT.u+D#S%F(HJ9BOr;uBl%@%%144#+<VdL+<Y9-Eaa$#+DPk(
FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2IC#FCfJFBkh6-%144#+<VdL+<Y9-Eaa$#+DPk(FD)dE
IUQbtDf0VLB4YslEa`c;C2[W9C2[W8BkhN5%13OO+<VdL+<VdL:-pQUEb0'*@:UL&BOr<,AS5^u
FCfK(A0>Ds@ruF'DIIR"ATJu5@<lR)B-:W)FCf?3Bl@l3%144#+<VdL+<XEG/g,7S+CT/5+C]&&
@<-W9Bl7F!D/`p*BjtdmBlnVCD.Rd0@:s.m%144#+<VdL+<YK=@:UK.B4YslEa`c;C2[W1%144#
+<VdL+<W?]3\W6B+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgCl
$6UH6+<VdL+AP6U+EVNEF`V+:Derr,-t6b"DfTD33A*!B.3N/8@ruF'DIIR"ATJu>Dfm1HBl%T.
BOQ'q+EVNEF(KG9FD,6&+:SZ#+<VdL+<Ve%67sBY76s=;:/"e5Bl5&%DBNk6A7]d(G%G]8Bl@l3
De:+a+CT.u+EV:.DBNt2B5)F/ATAo-DBMOo3A*!B%13OO+<VdL+<VdL:-pQUF(KG9A8,OqBl@lt
Ed8d*76s=;:/"e5Bl5&%DBNk6A7]d(C(1Lm+<VdL+<VeFA0<7<Ch.'j@rs(-$6UH6+<VdL+CoG4
ATT%B;FNl>:JOSd-OgCl$6UH6+<VdL+AP6U+EV:.DBNY2+CQC1ATo7F8g$,H0Jk:/+A*bsAS5^u
FCfJ8%144#+<VdL+<Y]9B4N,4DerrpBk)644""N!06_)@Eb-nLDfp(RA8,Oq055JT%13OO+<Ve%
:K0bD+DGF1H#IgJ@<,p%Df0B:+DG_8ATD@'FCeu*Bl5&6F`))2DJ()%F`MM6DKI!n3A*!B+CT.u
+Dtb7ATA4e+<VeMATDj+Df0V=De:+a/g+;8FWb1&DBNJ4D/^VCDfp(CA8,OqBl@ltEbT*++CT=6
A9Da.+EM%5BlJ08+CT.u+ED%0Ddd/c$6UH6FD,6&+DG^9DIn$.Gp$U;ART[lA0=Je3A*!B+Co1r
FD5Z2@<-'nF"SS7BOr;Y:IH=B@;^3rC`m;6E,8rsDK?q6Dg*=GD]iS/+EV:2Et&I!+<YB9+EV:.
+=^?5Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q".Ni/=E+NotBm;6Q%13OO+=\L++?;&.1ad>e
@q]:gB4Z-,FDi:DBOr</F(HJ4Afu2/AKZ#)B6A$!EZeq<E,oN2F(oQ1+Dbb$Eaa!6+CJ#5;FN?K
+D,P4@qB0nF)Po,+:SZ#+<Y*'C3=T>D.RU,F!,RC+CK57F'pUC<GlM\De*E%@q]:k@:OCjEcW@3
Eb-A8F`MA2A0>f&Afu;3FD)e)Ed2_KAiLne?m'E/BlA#$$6UH6FDi:0Ed2Y5+EM+&EarcoF"SS7
BOr<-ATW$.DJ()5BQ&$0A0>>m+ED%7FDl22A0>;mFCfJ8?ugL5?m'K4DK?q0F`\`t+EqaHCh*t^
+<Ve8A9M[.AKYJrARfLiDJ()(DfQt1EbTW0@ps0r@rGmh/g+,9Ec,T/B-;,)Aft)kBk)'lAKYhu
Gp$p;D/")78l%i&F!+n#Bl%L*Gp!P'+<VeKD]iS%@;I'1Bln#2F)Po,+CoD#F_t]-FE8R6F`\`u
-Z^D1DJ<U!A7Zm)F`;;<Ec`F;@<3Q"Cj0<5F!,F1Ecc#(Cb?/(+<Vd9$6Uf@?o9'FA0<6I?m&lg
C3=T>ARlp*D]j+>Ec`FEAS5^uFCfK(A0>Ds@ruF'DIIR"ATKI5$4R=b.NhW#B4Z<1ATDg0EcW?O
ATDg0EcW@;DBO%7AKZ#)B4Z<1AU&07ATMp,Df.!HDJs_A%144#+EVX4E,]B!+CT.u+Cf4rEbT-"
ARmhE-Rs=\Df028+ED^J+FPjbA8Z3+-RT?1+<Ve'EbTH4+A,Et+Eh=:F(oQ1F!,:1F<GU8B4Z<1
ATDg0EcW@9D]j.?+EV:.+EVO@+DbV4AS`K2Ea`o>%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k
/0H]%1,0n":MjfUEc5h<<ag#_@;^007:^+SBl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:
F(oQ1F"&5?A7T7^+>"^WARuulC2[W8E+EQg%13OO+=\KV@!-O%A7Bgl+Eq78+DG_'DfTl0@ruO4
+D#e-Cis9&DJ()0@;TRs+EqOABHS[0-Qm,@+ED%7F_l/@/g(T1%144-+<X'dEb/a&+CKPC?m%'S
/g+PMI:+1.AS,XoBln'-DK?q<Dg*=FF`;;<Ecbl'+>"^WARuulC2[W8E+EQg+<V+#+:SZ#.Nfj&
A8--.@rH4$@;]Us+Co2-E,8s.ARloqDfQsm85gXQD]j(3D/!lu+E_a:EcW@FD]iJ)Ci=M?@WHC2
F(KA7E,T\<F`;CS%13OO,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIa
F<Etc@ruF'DIIR2+@:!bCEQ&VBln'-DCH#%%144-+<Y',De*ZuFCfK$FCei&E+*WpDdtFo@8pf?
+C\c#ARlooDe!p,ASuTuFD5Z2+EVO?C`mk>A79RkA1SjEAS!n3$4R=b+<Ve2<HDklB-:r-A8Gt%
ATD4$AR-]tFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%
ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@(?%13OO+=\KV:1\Vl6#C%VDf-\:EbTE5ARlop
A8-."Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<
E%aO33))/$6;:3C>qQQn+<VdL<+oue+DGm>@3B#tDegJ=ATDj+Df-\9Afu2/AKYMtF*)G:@Wcd(
A0>8pDe(J>A7f4%+A$/fH#IgJG@>B2+EVNEF*2G@DfTq/$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@
DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t+EV:.+E2@4@qB1bDJ().Bl7]/AmoCiEt&I!+<VeJ
ARTUhBHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%V
Df-[`;b9_,CLqc6?pZP,9eo@.9hn)a%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[
@;I&SBleB)DI[BuB-9WRBln'-DCH#%%144-+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r
@:Wn[A1e;u+<VdL%144#+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4YslEa`c;C2[W9C2[WnDdt/&
%13OO+<VdL<HD_`F_i14DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26
ATKI5$4R=b.Nfi^F(KH&F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l+CT)&+EV:.+Co2,ARfh#
EbT*+%144#+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCqFE2))F`_>9DCI1\<+oue
+EM76E,96#Bk;>p$6UH6+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oK
A8c@,/g(T1%144-+<Y'#A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8@rc:&FE8R5A7T7^+EVNE
@")U(DJ!Tq>]Y!qEccGC/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7F(oQ1F"SRE$4R=e,9n<c
/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144-+CJYk
ATV<&Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+ChsOf+<VdL
E,8s#DIm?$8l%htAn>CmF`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!+<VdL@q]:g
B4Z-,GA1l0+Cf>-F(o];+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#+<XU)@:Eqe
BlnVCBlbD7Dg*=GBOr<!DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB
6=FA>F`8W^0Lo\r/no9MDIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+qF*(u(+EVNE
F*2G@DfTqB0fU=;1a$:A@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8+Cei$ATJu.DBMPI6m-Ph
F`Lu'+Co1rFD5Z2@<-'nF"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b.Ni\=
FCSu,Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'
DIb@/$4R=b.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(
+Cf>-FE2;9F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXC
Eb/c(Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(G@b?'+>G!IDIakF2)Quq
$4R=b.NfjAEc#28+CK53FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq
%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>
G]R78Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDkl
B-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-+A-cqH$!V<+Du+>AR]Rr
CERe3EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-
B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%P*%14=),9SZm
3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8
E+EQg%13OO+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK%13OO
+=\KV@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO
+=\LA779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4
An?"'ARlokC1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?
D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r%144#+<Yc;G]Y'BF!,OG
DfTE"+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#
+<Yc>AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9
+CT;%+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk
.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#
ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8
@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+
/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/
.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6
$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]Ue
A.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2
A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;6TQl#
F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%
Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+
DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<Z,"9M\/3
<+T0DE`[4)D/:h=C3'gk+<V+#+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQp
F!+n%A8c@,/e&.1+<VdL+<Vd9$6UI1Ci=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A
%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE
8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk
+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=
Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%
AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&W+:SZ#+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]
3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=
+>=of+C,E`+<VdL+<VdL.1HV,+:SZ#.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D
@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,
F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*
ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,
F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq
@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh
$6UH#$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9
:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2
F!,F1FED)7DD!%S+:SZ#+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK
%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB
6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A
?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6
+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=
ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%
+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha
9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`
G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%
0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<
ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?DId[0F"SSCEGB2u
ARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4$6UH6%144#+<VdL
+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE
3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSekARlokEb065Bl[cm
+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I%13OO
+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2
+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9-OgD*+<VdL
+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9
F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?
%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"
EZen(FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,Oq
Bl@ltEbT*++D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-
+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-
+=Cf5DImisCbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,f
ATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9
Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/u
DKBo2@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4
@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB
+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*n
Et&I!+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'
ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k
9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@
ASl@/ARloqEc5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_A
BOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL
+<XEG/g+b;FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>
DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+
DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL
+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*
+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"
+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];
$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@e
DJ=!$+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL
+<VdLARlp$@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`
+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9o
FDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5
BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9
DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h
/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)
+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.
AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E
@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1
+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGU
F"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4
DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7
ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dL
Bl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7
$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!
A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3
F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.
ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N
5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8
+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$Zl
BOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]Tu
Eb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6
AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#
+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQU
F(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.
D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6
+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL
+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf
:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a
@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.
+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=
F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?
FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-
D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'
@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF
+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I
+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,7
05>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4
D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(
Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm
/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB
+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAq
De*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lq
A0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>4
2(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?
DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3l
FDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-
+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76P
F!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>
D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]
Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23u
A7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon
$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*
Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm
@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1
+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$
@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:Wpl
FDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;q
Ci<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#
,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdh
Ch4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0
+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+
Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.
DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s
$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:D
Ea`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YU
Anc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLd
BOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+
A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'
Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cu
F!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(
Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G
+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTu
Df-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))
F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-
Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;
Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5
BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u
+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&
A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-
DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dn
ATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!
+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dn
ATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4
+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'
D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI
3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>
+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b
.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7
?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S
@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S
@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7
BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6
%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0
BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6
?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>
@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeI
AT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-
F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&
/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbt
Df0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m
/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*Zu
FCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#
+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#
+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9
@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1
%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"
+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<
CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.
Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2
?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=
@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$
C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&L
E-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=e
F*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?
Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e
+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@e
DIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$
DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m
@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<
@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV
?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1r
FD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/
@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6
?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9
%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!o
DKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o
:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q
05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F
%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq
+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q
05>E905>E9A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_A
A8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOA
A7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&Earco
A.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6
Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,
Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp
9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e
$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1
Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%
0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"
@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)
A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PR
F`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL
+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO
,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*
DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%
+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7
?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu
+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F
3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)
Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$
D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJA
DfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+
Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*
D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)
%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9
@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"
A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LG
Bm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth
+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k
+<VeKBOr<*@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6
%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/
A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)
AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9
@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)
?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s
$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+
Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2
AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd
$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+
$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1
+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&
$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2
?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=
F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''
A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-
D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^E
E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-
DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F
8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b
.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4
+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7B
F`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7
/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22
FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB0
3ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b
/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi
+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2
BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e
$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj
/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*
@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8
FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImis
CbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9
$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e
$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's
+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2
G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&
A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;
D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWs
AKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3
E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUj
F)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#
+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9
?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%
EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](
@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'
E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!
ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA
%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopn
AKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&
A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%
0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mg
DfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J579
0H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3
Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3
ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3
Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%
DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$r
F<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV
+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(
/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO
,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#
@ps6t@V$[&F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4
Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$r
AKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=G
BOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#
F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq
>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).
AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL
+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%16r\
DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.Q
Bl@ltEd9#A$<BSn;b9b[4ZXrF/hen51a`_>7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc
4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a
0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gk
BPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9
Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs
@kV\-@r?4,ATKJGG]XB%C2[WnDdtG8De*@#@V%0+@rDe`C2[WnDdtG8De*@#@V%02DJ'CcC2[Wn
DdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(M
Bkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2Cggda
G[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D
3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)
6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=H
F`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4
+C]J-Ch.6tB.P09De!p,ASuU(DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9
ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%
BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V
78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm
:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAh
FEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3
AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S
@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbi
ATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3
F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-p
DII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9+<V+#+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9
@Vfsl05Y-=FCfJGC2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7c8X.1HW$@;]dkATMs.De*Bs@s)X"
DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%
DC5l#<^fnb8P`)E3Zoe)/hen5-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L
;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A
%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado)dA7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi
$?0NfA8bs28l%iAATMriEa`I"Bk(^q9OVB_E+EPi$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.
A7c8XE+EQkDdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7e
BlJ089OVB_E+EPi$?0NfA8bs2<HDklB1brf6=FA>F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)l
B6A$!E^b4lEb0<5Bl@m1/oY?5%17&bAn5gi03*(-DJ)R[A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G
76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0
+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$
DK?q>A7cs-ATDj+Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;
@<-(#F`SZt:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,
05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.
+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OO
BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3
=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj
.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc
8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5-/i#72%15R#9LM<I4ZXs'
ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O
=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7
C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60
+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-
FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4
.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-
Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%
8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08
+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtB
DCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7
$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.
+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9
+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("
@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$i
A0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHD
FDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08
/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr
+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ
+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`
Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#
+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
