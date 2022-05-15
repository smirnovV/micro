      ; МАЛЫЙ ВАРИАНТ ЗАДАЧИ MICRO
      MICRPL/CP/FP=MICRPL/MP
      ASG=LPO:6
      TASKE...MIC
      //
      BMNPL=BMNPL.FR2
      PIL=PIL.FR2
      AMINPL=AMINPL.FR2
      RANDPL=RANDPL.FR2
      NORM=NORM.FR2
      AIN=AIN.FTN
      AIP=AIP.FIN
      WWOD=NWOD.FIN
      FRV=FRV.FTN
      MNOIPL=MNOIPL.FRZ
      PAEL=PAEL.FIN
      XPPL=XPPL.FR2
      XPP=XPP.FR2
      MPLPL=MPLPL.FR2
      LSSP=LSSP.FIN
      BTR=BTR.FR2
      FETN=FETN.FR2
      FET2PL=FE12PL.FTN
      DGFET=DGFET.FIN
      F2S=F2S.FTN
      F2N=F2N.FTN
      RIRDP=RIRDP.FIN
      FLNM=FLNM.MAC
      RUN MICRPL
      .ENABLE SUBSTITUTION
      .ASK L ХОТИТЕ ПРОСМОТРЕТЬ СОЗДАННЫЕ ВАМИ ФАЙЛЫ
      .IFF L .GOTO 1
      PIP *.DAT;*/LI
      .2: .ASK M ХОТИТЕ УДАЛИТЬ СОЗДАННЫЕ ФАЙЛЫ
      .IFF M GOTO 1
      PIP *.DAT;*/SD
      .GOTO 2
      
    1 : ;ВЫ ЗАКОНЧИЛИ РАБОТУ С ПРОГРАММОЙ *МИКРО*
      /
      F77 @MICFPL
      MAC @MICMPL
      TKB @MICBPL
      MOU /OVP DK2:
      MOU /OVR DK3:
      SSS 2,113,10
      ASK DK3:=FP0:
      INS DK2:(1,54)F77
      
      SUBROUTINE AMINPL(IT,NV,X2)
      DIMENSION BC(16),X1(100),X0(100),IN(10),IS(10),EO(10),OG(20),
      *TA(10),E(10),Y(10),Y0(10),D(10),B(10,10),U(10,10)
      DIMENSION X2(30)
   19 FORMAT(8E10.3)
  110 FORMAT(5X,'МЕТОД ВРАЩЕНИЯ КООРДИНАТ',/)
  120 FORHAT(/2X,'ЗНАЧЕНИЕ ЦЕЛЕВОЙ ФУНКЦИИ = ',1E10.3)
  101 FORMAT(/7X.'ЗНАЧЕНИЕ ИЗМЕНЯЕМЫХ ПАРАМЕТРОВ',D)
  111 FORMAT(/T7,'МЕТОД ВРАЩЕНИЯ КООРДИНАТ РОЗЕНБРОКА')
  112 FORMAT(T7,'ЦЕЛЕВАЯ ФУНКЦИЯ =',F13.3)
      COMMON/CC/BC,X0
      COMMON/TT/X1
      COMMON/RA/ IN,OG,IS,E0
      ND=0
      DO 51 I=1,30
   51 X2(1)=0.
      EK=.01
      N=NV
      WRITE(5,111)
      DO1J=1,N,1
      DO 1I=1,N,1
      IF(I-J)2,3,2
    2 U(J,I)=0
      GOTO1
    3 U(J,I)=1
    1 CONTINUE
      M=0
      DO4I=1,IT,1
    4 X1(I)=X0(I)
      IP=1
      CALL PIL(IP,FS2,IDD)
      ND=ND+1
      X2(ND)=FS2
      WRITE(5,112) FS2
      IF(FS2.LE.BC(14)) GOTO 130
      DO5I=1,N,1
      NP=IN(I)
    5 Y0(I)=X0(NP)
    6 DO 7 I=1,N
      
      IA(I)=2
      E(I)=EO(I)
    7 D(I)=0.
      K=0
    8 IF(K-N)9,10,9
    9 K=K+1
      GOT011
      
   10 K=1
   11 D012I=1,N,1
   12 Y(I)=Y0(I)+E(K)*U(1,K)
      DO 13I=1,N,1
      XM=OG(2*I-1)
      IF(Y(I).LT.XM) Y(I)=XM
      XM=OG(2*I)
      IF(Y(I).GT.XM) Y(I)=XM
   13 CONTINUE
      DO 45 I=1,N
      NP=IN(I)
   18 X1(NP)=Y(I)
      J=IS(I)
   45 X1(J)=X1(NP)
      IP=2
      CALL PIL(IP,F1,IDD)
      IF(F1-FS2)20,21,21
   20 FS2=F1
      IF(F1.LE.BC(14)) GOTO 100
      DO22I=1,N,1
      NP=IN(I)
      XO(NP)=X1(NP)
   22 Y0(I)=Y(I)
      D(K)=D(K)+E(K)
      E(K)=E(K)*3.0
      IF(IA(K)-2)25,24,25
   24 IA(K)=1
   25 GOTO26
   21 E(K)=-E(K)/2.
      IF((IA(K).EQ.1).OR.(ABS(E(K)).LT.EK)) IA(K)=0
   26 DO29I=1,N,1
      IF(IA(I)) 8,29,8
   29 CONTINUE
   30 D032JJ=1,N,1
      J=N+1-JJ
      DO 32I=1,N,1
      IF(J-N)33,34,33
   34 BB=0
      GOTO32
      
   33 BB=B(I,J+1)
   32 R(I,J)=D(J)*U(I,J)+BB
      DO 35J=1,N,1
      E(J)=0
      D036I=1,N,1
   36 F(J)=E(J)+B(I,J)**2
   35 E(J)=SQRT(E(J))
      IF(M)37,37,38
   38 IF(ABS((FS2-FVOR)/(1.+ABS(FS2)))-EK) 39,39,37
   39 GOT0100
   37 FVOR=F32
      DO 41 J1=2,N,1
      J=N+2-J1
      Z2=E(J-1)*E(J)
      D041 I=1,N,1
      IF(Z2) 43,41,43
   43 U(I,J)=D(J-1)*B(I,J)-U(I,J-1)*E(J)**2/Z2
   41 CONTINUE
      IF(E(1).LE.1.E-7) GOTO 100
   44 DO46I=1,N,1
   46 U(I,1)=B(I,1)/E(1)
      M=M+1
      ND=ND+1
      X2(ND)=FS2
      DO 52 I=I,NV
   52 X2(ND+I)=Y(I)
      WRITE(5,112) FS2
      TYPE 101
      TYPE 19,(Y(I),I=1,NV)
      GOTO 6
  100 ND=ND+1
      X2(ND)=FS2
      DO53 I=1,NV
   53 X2(ND+I)=Y(1)
      WRITE(5,112) FS2
      TYPE 101
      TYPE 19,(Y(I),I=1,NV)
      DO 60 I=1,IT
   60 X1(I)=X0(I)
  130 CONTINUE
      X2(30)=FLOAT(ND)
      RETURN
      END
      
