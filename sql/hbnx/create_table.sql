CONNECT TO EASTST user db2inst1 using wanyue0916 ;
set current schema=HBNX ;

------------------------------------------------
-- 表的 DDL 语句 "T_GX_JGXX"
------------------------------------------------
 

CREATE TABLE "T_GX_JGXX"  (
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "YXJGMC" VARCHAR(200) , 
		  "JGLB" VARCHAR(30) , 
		  "YZBM" CHAR(6) , 
		  "WDH" VARCHAR(30) , 
		  "SJGLJGMC" VARCHAR(200) , 
		  "SFZMD" VARCHAR(4) , 
		  "YYZT" VARCHAR(6) , 
		  "CLSJ" CHAR(8) , 
		  "JGGZKSSJ" CHAR(6) , 
		  "JGGZZZSJ" CHAR(6) , 
		  "JGDZ" VARCHAR(400) , 
		  "FZRXM" VARCHAR(100) , 
		  "FZRZW" VARCHAR(60) , 
		  "FZRLXDH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_GX_JGXX"

CREATE INDEX "T_GX_JGXX" ON "T_GX_JGXX" 
		("NBJGH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_GX_YGB"
------------------------------------------------
 

CREATE TABLE "T_GX_YGB"  (
		  "GH" VARCHAR(30) , 
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "XM" VARCHAR(100) , 
		  "SFZH" VARCHAR(30) , 
		  "LXDH" VARCHAR(30) , 
		  "WDH" VARCHAR(30) , 
		  "SSBM" VARCHAR(60) , 
		  "ZW" VARCHAR(60) , 
		  "YGZT" VARCHAR(30) , 
		  "GWBH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_GX_YGB"

CREATE INDEX "T_GX_YGB" ON "T_GX_YGB" 
		("GH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;

-- 表上的索引的 DDL 语句 "T_GX_YGB"

CREATE INDEX "T_GX_YGB_SFZH" ON "T_GX_YGB" 
		("SFZH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;


------------------------------------------------
-- 表的 DDL 语句 "T_KJ_NBFZMX"
------------------------------------------------
 

CREATE TABLE "T_KJ_NBFZMX"
 ("HXJYLSH"  VARCHAR(60),
  "ZJYLSH"   VARCHAR(30),
  "BCXH"     INTEGER,
  "NBFHZZH"  VARCHAR(60),
  "YXJGDM"   VARCHAR(30),
  "JRXKZH"   VARCHAR(30),
  "NBJGH"    VARCHAR(30),
  "MXKMBH"   VARCHAR(60),
  "YXJGMC"   VARCHAR(200),
  "MXKMMC"   VARCHAR(60),
  "HXJYRQ"   CHARACTER(8),
  "HXJYSJ"   CHARACTER(6),
  "BZ"       CHARACTER(3),
  "JYLX"     VARCHAR(60),
  "JYJE"     DECIMAL(20, 2),
  "ZHYE"     DECIMAL(20, 2),
  "DFZH"     VARCHAR(60),
  "DFHM"     VARCHAR(200),
  "DFXH"     VARCHAR(30),
  "JYQD"     VARCHAR(60),
  "XZBZ"     VARCHAR(4),
  "JYGYH"    VARCHAR(30),
  "SQGYH"    VARCHAR(30),
  "DFKMH"    VARCHAR(60),
  "JZRQ"     CHARACTER(8),
  "XZRQ"     CHARACTER(8),
  "ZY"       VARCHAR(400),
  "CBMBZ"    VARCHAR(4),
  "JDBZ"     VARCHAR(4),
  "CJRQ"     CHARACTER(8)
 ) 
		PARTITION BY RANGE("HXJYRQ") 
		 (PART "PART0" STARTING('20120101') ENDING('20120401') EXCLUSIVE IN "NBFZMX1", 
		 PART "PART1" STARTING('20120401') ENDING('20120701') EXCLUSIVE IN "NBFZMX2", 
		 PART "PART2" STARTING('20120701') ENDING('20121001') EXCLUSIVE IN "NBFZMX3", 
		 PART "PART3" STARTING('20121001') ENDING('20130101') EXCLUSIVE IN "NBFZMX4", 
		 PART "PART4" STARTING('20130101') ENDING('20130401') EXCLUSIVE IN "NBFZMX1", 
		 PART "PART5" STARTING('20130401') ENDING('20130701') EXCLUSIVE IN "NBFZMX2", 
		 PART "PART6" STARTING('20130701') ENDING('20131001') EXCLUSIVE IN "NBFZMX3", 
		 PART "PART7" STARTING('20131001') ENDING('20140101') EXCLUSIVE IN "NBFZMX4", 
		 PART "PART8" STARTING('20140101') ENDING('20140401') EXCLUSIVE IN "NBFZMX1", 
		 PART "PART9" STARTING('20140401') ENDING('20140701') EXCLUSIVE IN "NBFZMX2", 
		 PART "PART10" STARTING('20140701') ENDING('20141001') EXCLUSIVE IN "NBFZMX3", 
		 PART "PART11" STARTING('20141001') ENDING('20150101') EXCLUSIVE IN "NBFZMX4", 
		 PART "PART12" STARTING('20150101') ENDING('20150401') EXCLUSIVE IN "NBFZMX1", 
		 PART "PART13" STARTING('20150401') ENDING('20150701') EXCLUSIVE IN "NBFZMX2", 
		 PART "PART14" STARTING('20150701') ENDING('20151001') EXCLUSIVE IN "NBFZMX3", 
		 PART "PART15" STARTING('20151001') ENDING('20160101') EXCLUSIVE IN "NBFZMX4"); 
CREATE INDEX "T_KJ_NBFZMX" ON "T_KJ_NBFZMX" 
		("HXJYLSH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;

------------------------------------------------
-- 表的 DDL 语句 "T_GX_GYB"
------------------------------------------------
 

CREATE TABLE "T_GX_GYB"  (
		  "GYH" VARCHAR(30) , 
		  "GH" VARCHAR(30) , 
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "ZXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "GYLX" VARCHAR(30) , 
		  "SFSTGY" VARCHAR(4) , 
		  "KHJLBZ" VARCHAR(4) , 
		  "JBZWBZ" VARCHAR(4) , 
		  "QXGLBZ" VARCHAR(4) , 
		  "YBGLBZ" VARCHAR(4) , 
		  "XDYBZ" VARCHAR(4) , 
		  "KGYBZ" VARCHAR(4) , 
		  "ZHGYBZ" VARCHAR(4) , 
		  "SQBZ" VARCHAR(4) , 
		  "SQFW" VARCHAR(60) , 
		  "GWBH" VARCHAR(30) , 
		  "GYYHJB" VARCHAR(30) , 
		  "GYQXJB" VARCHAR(30) , 
		  "SGRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_GX_GYB"

CREATE INDEX "T_GX_GYB" ON "T_GX_GYB" 
		("GYH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_GX_GWXX"
------------------------------------------------
 

CREATE TABLE "T_GX_GWXX"  (
		  "GWBH" VARCHAR(30) , 
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "GWZL" VARCHAR(60) , 
		  "GWMC" VARCHAR(200) , 
		  "GWSM" VARCHAR(400) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_GX_GWXX"

CREATE INDEX "T_GX_GWXX" ON "T_GX_GWXX" 
		("GWBH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_ZZQKM"
------------------------------------------------
 

CREATE TABLE "T_KJ_ZZQKM"  (
		  "KMBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "YXJGMC" VARCHAR(200) , 
		  "TJKMBH" VARCHAR(20) , 
		  "TJKMMC" VARCHAR(60) , 
		  "KMMC" VARCHAR(60) , 
		  "KMJC" INTEGER , 
		  "KMLX" VARCHAR(30) , 
		  "JDBZ" VARCHAR(4) , 
		  "JFYE" DECIMAL(20,2) , 
		  "DFYE" DECIMAL(20,2) , 
		  "BZ" CHAR(3) , 
		  "CJRQ" CHAR(8) )   
		 IN "ZZKJTSS" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KJ_TJKMKJ"
------------------------------------------------
 

CREATE TABLE "T_KJ_TJKMKJ"  (
		  "TJKMBH" VARCHAR(20) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "TJKMMC" VARCHAR(60) , 
		  "GBKJ" VARCHAR(2000) , 
		  "KJSM" VARCHAR(2000) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KJ_NBKMKJ"
------------------------------------------------
 

CREATE TABLE "T_KJ_NBKMKJ"  (
		  "KMBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "KMMC" VARCHAR(60) , 
		  "GBKJ" VARCHAR(2000) , 
		  "KJSM" VARCHAR(2000) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KJ_GRDCFZ"
------------------------------------------------
 

CREATE TABLE "T_KJ_GRDCFZ"  (
		  "DQCKZH" VARCHAR(60) , 
		  "GRKHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "MXKMMC" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "BZ" CHAR(3) , 
		  "TJKMBH" VARCHAR(20) , 
		  "ZHMC" VARCHAR(200) , 
		  "GRDQCKZHLX" VARCHAR(60) , 
		  "CKQX" VARCHAR(20) , 
		  "LL" DOUBLE , 
		  "FLZHLX" VARCHAR(30) , 
		  "FLZH" VARCHAR(60) , 
		  "BZJZHBZ" VARCHAR(4) , 
		  "KHJE" DECIMAL(20,2) , 
		  "CKYE" DECIMAL(20,2) , 
		  "KHRQ" CHAR(8) , 
		  "XHRQ" CHAR(8) , 
		  "DQR" CHAR(8) , 
		  "ZHZT" VARCHAR(60) , 
		  "SCDHRQ" CHAR(8) , 
		  "CHLB" VARCHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "GRDHQTSS" ; 






-- 表上的索引的 DDL 语句 "T_KJ_GRDCFZ"

CREATE INDEX "T_KJ_GRDCFZ" ON "T_KJ_GRDCFZ" 
		("DQCKZH" ASC,
		 "BZ" ASC,
		 "CHLB" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_DGHCFZ"
------------------------------------------------
 

CREATE TABLE "T_KJ_DGHCFZ"  (
		  "HQCKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "TJKMBH" VARCHAR(20) , 
		  "BZ" CHAR(3) , 
		  "ZHMC" VARCHAR(200) , 
		  "DGHQCKZHLX" VARCHAR(60) , 
		  "BZJZHBZ" VARCHAR(4) , 
		  "LL" DOUBLE , 
		  "CKYE" DECIMAL(20,2) , 
		  "KHRQ" CHAR(8) , 
		  "XHRQ" CHAR(8) , 
		  "ZHZT" VARCHAR(60) , 
		  "SCDHRQ" CHAR(8) , 
		  "CHLB" VARCHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KJ_DGHCFZ"

CREATE INDEX "T_KJ_DGHCFZ" ON "T_KJ_DGHCFZ" 
		("HQCKZH" ASC,
		 "BZ" ASC,
		 "CHLB" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_DGDCFZ"
------------------------------------------------
 

CREATE TABLE "T_KJ_DGDCFZ"  (
		  "DQCKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "MXKMMC" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "BZ" CHAR(3) , 
		  "TJKMBH" VARCHAR(20) , 
		  "ZHMC" VARCHAR(200) , 
		  "DGDQCKZHLX" VARCHAR(60) , 
		  "CKQX" VARCHAR(20) , 
		  "LL" DOUBLE , 
		  "KHJE" DECIMAL(20,2) , 
		  "CKYE" DECIMAL(20,2) , 
		  "KHRQ" CHAR(8) , 
		  "XHRQ" CHAR(8) , 
		  "ZHZT" VARCHAR(60) , 
		  "SCDHRQ" CHAR(8) , 
		  "CHLB" VARCHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 






-- 表上的索引的 DDL 语句 "T_KJ_DGDCFZ"

CREATE INDEX "T_KJ_DGDCFZ" ON "T_KJ_DGDCFZ" 
		("KHTYBH" ASC)
		PCTFREE 10 
		 DISALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_NBFZ"
------------------------------------------------
 

CREATE TABLE "T_KJ_NBFZ"  (
		  "NBFHZZH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "ZHMC" VARCHAR(200) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "JDBZ" VARCHAR(4) , 
		  "BZ" CHAR(3) , 
		  "TJKMBH" VARCHAR(20) , 
		  "NBFHZZHLX" VARCHAR(60) , 
		  "JFYE" DECIMAL(20,2) , 
		  "DFYE" DECIMAL(20,2) , 
		  "JXBZ" VARCHAR(4) , 
		  "JXFS" VARCHAR(30) , 
		  "LL" DOUBLE , 
		  "KHRQ" CHAR(8) , 
		  "XHRQ" CHAR(8) , 
		  "ZHZT" VARCHAR(60) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KJ_NBFZ"

CREATE INDEX "T_KJ_NBFZ" ON "T_KJ_NBFZ" 
		("NBFHZZH" ASC,
		 "BZ" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_GRXFZ"
------------------------------------------------
 

CREATE TABLE "T_KJ_GRXFZ"  (
		  "DKFHZH" VARCHAR(60) , 
		  "XDJJH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "ZHMC" VARCHAR(200) , 
		  "BZ" CHAR(3) , 
		  "ZJHKRQ" CHAR(8) , 
		  "TJKMBH" VARCHAR(20) , 
		  "DKHTH" VARCHAR(100) , 
		  "XDYXM" VARCHAR(100) , 
		  "DKWJFL" CHAR(4) , 
		  "HKZH" VARCHAR(60) , 
		  "DKBJZE" DECIMAL(20,2) , 
		  "DKZCYE" DECIMAL(20,2) , 
		  "DKYQYE" DECIMAL(20,2) , 
		  "QXRQ" CHAR(8) , 
		  "KHRQ" CHAR(8) , 
		  "XHRQ" CHAR(8) , 
		  "ZHZT" VARCHAR(60) , 
		  "CJRQ" CHAR(8) )   
		 IN "GRXDTSS" ; 






-- 表上的索引的 DDL 语句 "T_KJ_GRXFZ"

CREATE INDEX "T_KJ_GRXFZ" ON "T_KJ_GRXFZ" 
		("DKFHZH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_DGXFZ"
------------------------------------------------
 

CREATE TABLE "T_KJ_DGXFZ"  (
		  "DKFHZH" VARCHAR(60) , 
		  "XDJJH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "ZHMC" VARCHAR(200) , 
		  "BZ" CHAR(3) , 
		  "ZJHKRQ" CHAR(8) , 
		  "TJKMBH" VARCHAR(20) , 
		  "DKHTH" VARCHAR(100) , 
		  "XDYXM" VARCHAR(100) , 
		  "DKWJFL" CHAR(4) , 
		  "HKZH" VARCHAR(60) , 
		  "DKBJZE" DECIMAL(20,2) , 
		  "DKZCYE" DECIMAL(20,2) , 
		  "DKYQYE" DECIMAL(20,2) , 
		  "QXRQ" CHAR(8) , 
		  "KHRQ" CHAR(8) , 
		  "XHRQ" CHAR(8) , 
		  "ZHZT" VARCHAR(60) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 






-- 表上的索引的 DDL 语句 "T_KJ_DGXFZ"

CREATE INDEX "T_KJ_DGXFZ" ON "T_KJ_DGXFZ" 
		("DKFHZH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KH_GRJCXX"
------------------------------------------------
 

CREATE TABLE "T_KH_GRJCXX"  (
		  "KHTYBH" VARCHAR(60) , 
		  "ZJHM" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "LYXT" VARCHAR(100) , 
		  "KHXM" VARCHAR(100) , 
		  "KHYWXM" VARCHAR(200) , 
		  "ZJLB" VARCHAR(30) , 
		  "GJ" VARCHAR(30) , 
		  "MZ" VARCHAR(30) , 
		  "XB" VARCHAR(10) , 
		  "XL" VARCHAR(30) , 
		  "CSRQ" CHAR(8) , 
		  "GZDWMC" VARCHAR(200) , 
		  "GZDWDZ" VARCHAR(400) , 
		  "GZDWDH" VARCHAR(30) , 
		  "ZY" VARCHAR(30) , 
		  "JTZZ" VARCHAR(400) , 
		  "TXDZ" VARCHAR(400) , 
		  "JTDH" VARCHAR(30) , 
		  "YDDH" VARCHAR(30) , 
		  "GRYSR" DECIMAL(20,2) , 
		  "JTYSR" DECIMAL(20,2) , 
		  "HYQK" VARCHAR(30) , 
		  "POXM" VARCHAR(100) , 
		  "POLXDH" VARCHAR(30) , 
		  "POYDDH" VARCHAR(30) , 
		  "PODYKHH" VARCHAR(60) , 
		  "BXYGBZ" VARCHAR(4) , 
		  "SBXHMDBZ" VARCHAR(4) , 
		  "SHMDRQ" CHAR(8) , 
		  "SHMDYY" VARCHAR(400) , 
		  "YZBM" CHAR(6) , 
		  "DWXZ" VARCHAR(30) , 
		  "ZC" VARCHAR(30) , 
		  "SFNH" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KH_GRJCXX"

CREATE INDEX "T_KH_GRJCXX" ON "T_KH_GRJCXX" 
		("KHTYBH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;

-- 表上的索引的 DDL 语句 "T_KH_GRJCXX"

CREATE INDEX "T_KH_GRJCXX_ZJHM" ON "T_KH_GRJCXX" 
		("ZJHM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KH_GRKHGXXX"
------------------------------------------------
 

CREATE TABLE "T_KH_GRKHGXXX"  (
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "DYGRKHTYBH" VARCHAR(60) , 
		  "SHGX" VARCHAR(30) , 
		  "DYGRKHXM" VARCHAR(100) , 
		  "DYGRKHGZDWMC" VARCHAR(200) , 
		  "DYGRKHGZDWDZ" VARCHAR(400) , 
		  "DYGRKHGZDWDH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KH_GDXX"
------------------------------------------------
 

CREATE TABLE "T_KH_GDXX"  (
		  "KHTYBH" VARCHAR(60) , 
		  "ZZJGDM" VARCHAR(40) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "GDMC" VARCHAR(200) , 
		  "GDZJLB" VARCHAR(30) , 
		  "GDZJHM" VARCHAR(60) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KH_GDXX"

CREATE INDEX "T_KH_GDXX_GDZJHM" ON "T_KH_GDXX" 
		("GDZJHM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KH_GLGX"
------------------------------------------------
 

CREATE TABLE "T_KH_GLGX"  (
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "GLRKHTYBH" VARCHAR(60) , 
		  "KHSBM" VARCHAR(60) , 
		  "KHLB" VARCHAR(30) , 
		  "GLRSBM" VARCHAR(60) , 
		  "GLRMC" VARCHAR(200) , 
		  "GLRLB" VARCHAR(30) , 
		  "GXLX" VARCHAR(300) , 
		  "LRSJ" CHAR(16) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KH_GLGX"

CREATE INDEX "T_KH_GLGX_KHSBM" ON "T_KH_GLGX" 
		("KHSBM" ASC,
		 "GLRSBM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_SJD_XMDKXX"
------------------------------------------------
 

CREATE TABLE "T_SJD_XMDKXX"  (
		  "XDHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JKRMC" VARCHAR(200) , 
		  "XMMC" VARCHAR(100) , 
		  "XMLX" VARCHAR(100) , 
		  "SFYT" VARCHAR(4) , 
		  "XMZTZ" DECIMAL(20,2) , 
		  "ZBJ" DECIMAL(20,2) , 
		  "XMDKJE" DECIMAL(20,2) , 
		  "XMDKQX" VARCHAR(30) , 
		  "PWWH" VARCHAR(60) , 
		  "LXPW" VARCHAR(60) , 
		  "GHXKZBH" VARCHAR(60) , 
		  "JSYDXKZBH" VARCHAR(60) , 
		  "HPXKZBH" VARCHAR(60) , 
		  "SGXKZBH" VARCHAR(60) , 
		  "QTXKZ" VARCHAR(60) , 
		  "QTXKZBH" VARCHAR(60) , 
		  "KGRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_PJPMXX"
------------------------------------------------
 

CREATE TABLE "T_SJD_PJPMXX"  (
		  "PJHM" VARCHAR(60) , 
		  "CPRBH" VARCHAR(60) , 
		  "FKXDM" VARCHAR(30) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "PJLX" VARCHAR(30) , 
		  "CPRQC" VARCHAR(200) , 
		  "CPRZH" VARCHAR(60) , 
		  "FKXMC" VARCHAR(200) , 
		  "BZ" CHAR(3) , 
		  "PMJE" DECIMAL(20,2) , 
		  "QFRQ" CHAR(8) , 
		  "PJDQRQ" CHAR(8) , 
		  "SKRMC" VARCHAR(200) , 
		  "SKRZH" VARCHAR(60) , 
		  "SKRKHX" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_BHYWXX"
------------------------------------------------
 

CREATE TABLE "T_SJD_BHYWXX"  (
		  "XDHTH" VARCHAR(100) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "KHTYBH" VARCHAR(60) , 
		  "JKRMC" VARCHAR(200) , 
		  "BHYWPZ" VARCHAR(60) , 
		  "BZJBZ" CHAR(3) , 
		  "BZJJE" DECIMAL(20,2) , 
		  "SYRMC" VARCHAR(200) , 
		  "DKLL" DOUBLE , 
		  "SXFL" DOUBLE , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_MYRZYXX"
------------------------------------------------
 

CREATE TABLE "T_SJD_MYRZYXX"  (
		  "DGXDJJH" VARCHAR(100) , 
		  "XDHTH" VARCHAR(30) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JKRMC" VARCHAR(200) , 
		  "ZZJGDM" VARCHAR(40) , 
		  "MYRZPZ" VARCHAR(60) , 
		  "MYHTH" VARCHAR(100) , 
		  "BZ" CHAR(3) , 
		  "MYHTZJE" DECIMAL(20,2) , 
		  "YXGJYWBH" VARCHAR(30) , 
		  "SYFPHM" VARCHAR(200) , 
		  "SYFPBZ" CHAR(3) , 
		  "SYFPJE" DECIMAL(20,2) , 
		  "XYZCDX" VARCHAR(200) , 
		  "FFTZL" VARCHAR(30) , 
		  "XYZBH" VARCHAR(30) , 
		  "XYZBZ" CHAR(3) , 
		  "XYZJE" DECIMAL(20,2) , 
		  "XYZKZRQ" CHAR(8) , 
		  "XYZQXLX" VARCHAR(30) , 
		  "XYZXQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_YTDK"
------------------------------------------------
 

CREATE TABLE "T_SJD_YTDK"  (
		  "XDHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "XYLX" VARCHAR(60) , 
		  "ZBXXH" VARCHAR(30) , 
		  "CDXXH" VARCHAR(30) , 
		  "DLXXH" VARCHAR(30) , 
		  "ZBXXM" VARCHAR(200) , 
		  "CDXXM" VARCHAR(200) , 
		  "DLXXM" VARCHAR(200) , 
		  "DLCDBZ" VARCHAR(60) , 
		  "JKRMC" VARCHAR(200) , 
		  "SQDKZE" DECIMAL(20,2) , 
		  "CDDKJE" DECIMAL(20,2) , 
		  "SJCDDKJE" DECIMAL(20,2) , 
		  "YFFDKJE" DECIMAL(20,2) , 
		  "YFFCDDKJE" DECIMAL(20,2) , 
		  "CDSYDKJE" DECIMAL(20,2) , 
		  "JLXYXJGDM" VARCHAR(30) , 
		  "XYQSRQ" CHAR(8) , 
		  "XYZZRQ" CHAR(8) , 
		  "XYZT" VARCHAR(60) , 
		  "FHGY" VARCHAR(100) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_SJD_YTDK"

CREATE INDEX "T_SJD_YTDK" ON "T_SJD_YTDK" 
		("XDHTH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_SJD_WTDK"
------------------------------------------------
 

CREATE TABLE "T_SJD_WTDK"  (
		  "XDJJH" VARCHAR(100) , 
		  "XDHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "WTRKHMC" VARCHAR(200) , 
		  "WTJJKHXH" VARCHAR(30) , 
		  "WTJJKHXMC" VARCHAR(200) , 
		  "WTJJZH" VARCHAR(60) , 
		  "WTZHLX" VARCHAR(30) , 
		  "WTJE" DECIMAL(20,2) , 
		  "SFSX" VARCHAR(4) , 
		  "SXFFS" VARCHAR(60) , 
		  "SXFJE" DECIMAL(20,2) , 
		  "XYQSRQ" CHAR(8) , 
		  "XYDQRQ" CHAR(8) , 
		  "JBRXM" VARCHAR(100) , 
		  "JBJGMC" VARCHAR(200) , 
		  "XYZT" VARCHAR(60) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_XYDHT"
------------------------------------------------
 

CREATE TABLE "T_SJD_XYDHT"  (
		  "DBHTH" VARCHAR(100) , 
		  "BZRKHTYBH" VARCHAR(60) , 
		  "JRXKZH" VARCHAR(30) , 
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "DBLX" VARCHAR(30) , 
		  "DBHTLX" VARCHAR(30) , 
		  "BZRLB" CHAR(4) , 
		  "BZRMC" VARCHAR(200) , 
		  "ZJLB" VARCHAR(30) , 
		  "ZJHM" VARCHAR(60) , 
		  "BZRJZC" DECIMAL(20,2) , 
		  "DBQSRQ" CHAR(8) , 
		  "DBDQRQ" CHAR(8) , 
		  "DBHTZT" VARCHAR(30) , 
		  "DBHTQDRQ" CHAR(8) , 
		  "DBHTSXRQ" CHAR(8) , 
		  "DBHTDQRQ" CHAR(8) , 
		  "DBBZ" CHAR(3) , 
		  "DBZJE" DECIMAL(20,2) , 
		  "DBWPXH" VARCHAR(30) , 
		  "JLYGH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_XYDGX"
------------------------------------------------
 

CREATE TABLE "T_SJD_XYDGX"  (
		  "DBHTH" VARCHAR(100) , 
		  "BDBHTH" VARCHAR(100) , 
		  "BZRKHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "DBLX" VARCHAR(30) , 
		  "DBJE" DECIMAL(20,2) , 
		  "DBQSRQ" CHAR(8) , 
		  "DBDQRQ" CHAR(8) , 
		  "DBZT" CHAR(4) , 
		  "JLDBYGH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_XYZDYW"
------------------------------------------------
 

CREATE TABLE "T_SJD_XYZDYW"  (
		  "ZHDYWBH" VARCHAR(60) , 
		  "DBHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "ZHDYWMC" VARCHAR(100) , 
		  "ZHDYWLX" VARCHAR(300) , 
		  "ZHDYWZMJZ" DECIMAL(20,2) , 
		  "BZ" CHAR(3) , 
		  "YXRDJZ" DECIMAL(20,2) , 
		  "PGJZ" DECIMAL(20,2) , 
		  "PGRQ" CHAR(8) , 
		  "PGJGMC" VARCHAR(200) , 
		  "ZHDYL" DOUBLE , 
		  "DYWSYQRMC" VARCHAR(200) , 
		  "YDYJZ" DECIMAL(20,2) , 
		  "DJRQ" CHAR(8) , 
		  "DJJG" VARCHAR(30) , 
		  "CZJG" VARCHAR(30) , 
		  "DBQSRQ" CHAR(8) , 
		  "DBDQRQ" CHAR(8) , 
		  "ZYPZZH" VARCHAR(60) , 
		  "ZYPZLX" VARCHAR(60) , 
		  "ZYPZHM" VARCHAR(300) , 
		  "ZYPZQFJG" VARCHAR(30) , 
		  "BXDH" VARCHAR(60) , 
		  "HBRQ" CHAR(8) , 
		  "HBRYXM" VARCHAR(100) , 
		  "HBREXM" VARCHAR(100) , 
		  "QZDJHM" VARCHAR(300) , 
		  "QZMC" VARCHAR(200) , 
		  "QZYXDQRQ" CHAR(8) , 
		  "DJYXZZRQ" CHAR(8) , 
		  "SFNRBWHS" VARCHAR(4) , 
		  "BWHSKSRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KP_JJKXX"
------------------------------------------------
 

CREATE TABLE "T_KP_JJKXX"  (
		  "KH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "ZJLB" VARCHAR(30) , 
		  "ZJHM" VARCHAR(60) , 
		  "JJKCPMC" VARCHAR(200) , 
		  "KPZT" VARCHAR(30) , 
		  "YGBZ" VARCHAR(4) , 
		  "KKRQ" CHAR(8) , 
		  "KKGYH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KP_CZXX"
------------------------------------------------
 

CREATE TABLE "T_KP_CZXX"  (
		  "CZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "ZJLB" VARCHAR(30) , 
		  "ZJHM" VARCHAR(60) , 
		  "CZLX" VARCHAR(8) , 
		  "CZZT" VARCHAR(30) , 
		  "YGBZ" VARCHAR(4) , 
		  "QYRQ" CHAR(8) , 
		  "QYGYH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 






-- 表上的索引的 DDL 语句 "T_KP_CZXX"

CREATE INDEX "T_KP_CZXX" ON "T_KP_CZXX" 
		("CZH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;

-- 表上的索引的 DDL 语句 "T_KP_CZXX"

CREATE INDEX "T_KP_CZXX_ZJHM" ON "T_KP_CZXX" 
		("ZJHM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KP_XYKXX"
------------------------------------------------
 

CREATE TABLE "T_KP_XYKXX"  (
		  "KH" VARCHAR(60) , 
		  "XYKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "ZJLB" VARCHAR(30) , 
		  "ZJHM" VARCHAR(60) , 
		  "KPMC" VARCHAR(200) , 
		  "KPJB" VARCHAR(60) , 
		  "KPZT" VARCHAR(30) , 
		  "KDQNY" CHAR(6) , 
		  "KHZHJYRQ" CHAR(8) , 
		  "YGKBZ" VARCHAR(4) , 
		  "FSKBZ" VARCHAR(4) , 
		  "ZKH" VARCHAR(60) , 
		  "NFBZ" VARCHAR(4) , 
		  "BBXYED" DECIMAL(20,2) , 
		  "WBXYED" DECIMAL(20,2) , 
		  "WBBZ" CHAR(3) , 
		  "BBXJZQED" DECIMAL(20,2) , 
		  "WBXJZQED" DECIMAL(20,2) , 
		  "ZKRQ" CHAR(8) , 
		  "SLRQ" CHAR(8) , 
		  "SLYGH" VARCHAR(30) , 
		  "KKRQ" CHAR(8) , 
		  "KKYGH" VARCHAR(30) , 
		  "XKRQ" CHAR(8) , 
		  "XKYGH" VARCHAR(30) , 
		  "ZHZT" VARCHAR(60) , 
		  "BBQXJE" DECIMAL(20,2) , 
		  "BBXFJE" DECIMAL(20,2) , 
		  "BBTZJE" DECIMAL(20,2) , 
		  "WBXFJE" DECIMAL(20,2) , 
		  "WBQXJE" DECIMAL(20,2) , 
		  "WBTZJE" DECIMAL(20,2) , 
		  "BBYE" DECIMAL(20,2) , 
		  "WBYE" DECIMAL(20,2) , 
		  "DJYE" DECIMAL(20,2) , 
		  "BLJE" DECIMAL(20,2) , 
		  "BNLJXFJE" DECIMAL(20,2) , 
		  "LSED" DECIMAL(20,2) , 
		  "DQQFJE" DECIMAL(20,2) , 
		  "DBLX" VARCHAR(30) , 
		  "DBSM" VARCHAR(400) , 
		  "DKWJFL" CHAR(4) , 
		  "DQTZLX" DECIMAL(20,2) , 
		  "ZHDHJYRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KP_XYKXX"

CREATE INDEX "T_KP_XYKXX" ON "T_KP_XYKXX" 
		("KH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;

-- 表上的索引的 DDL 语句 "T_KP_XYKXX"

CREATE INDEX "T_KP_XYKXX_ZJHM" ON "T_KP_XYKXX" 
		("ZJHM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_XG_SXXX"
------------------------------------------------
 

CREATE TABLE "T_XG_SXXX"  (
		  "SXXYH" VARCHAR(30) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "FSRQ" CHAR(8) , 
		  "KHMC" VARCHAR(200) , 
		  "SXZL" VARCHAR(30) , 
		  "SXXYMC" VARCHAR(200) , 
		  "EDJE" DECIMAL(20,2) , 
		  "BZ" CHAR(3) , 
		  "SXRQ" CHAR(8) , 
		  "SXZT" CHAR(4) , 
		  "SXKSRQ" CHAR(8) , 
		  "SXDQRQ" CHAR(8) , 
		  "JCDYJ" VARCHAR(400) , 
		  "ZZSPR" VARCHAR(30) , 
		  "SFXHED" VARCHAR(4) , 
		  "SFLSED" VARCHAR(4) , 
		  "SXYGH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 






-- 表上的索引的 DDL 语句 "T_XG_SXXX"

CREATE INDEX "T_XG_SXXX" ON "T_XG_SXXX" 
		("SXXYH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_XG_DKHX"
------------------------------------------------
 

CREATE TABLE "T_XG_DKHX"  (
		  "XDJJH" VARCHAR(100) , 
		  "XDHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "KMGSJG" VARCHAR(30) , 
		  "SHDKBJ" DECIMAL(20,2) , 
		  "SHBNLX" DECIMAL(20,2) , 
		  "SHBWLX" DECIMAL(20,2) , 
		  "HXRQ" CHAR(8) , 
		  "HXSHBJ" DECIMAL(20,2) , 
		  "HXSHBNLX" DECIMAL(20,2) , 
		  "HXSHBWLX" DECIMAL(20,2) , 
		  "HXHXJLX" DECIMAL(20,2) , 
		  "SHHXHLX" DECIMAL(20,2) , 
		  "SHBZ" VARCHAR(4) , 
		  "HXSHGYH" VARCHAR(30) , 
		  "HXSHRQ" CHAR(8) , 
		  "BZH" VARCHAR(200) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_XG_DKZQ"
------------------------------------------------
 

CREATE TABLE "T_XG_DKZQ"  (
		  "DKZQBH" VARCHAR(60) , 
		  "XDJJH" VARCHAR(100) , 
		  "XDHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "ZQRQ" CHAR(8) , 
		  "ZQDQRQ" CHAR(8) , 
		  "ZQJE" DECIMAL(20,2) , 
		  "YLL" DOUBLE , 
		  "ZQLL" DOUBLE , 
		  "YHTH" VARCHAR(100) , 
		  "YJJH" VARCHAR(100) , 
		  "JYGYH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 






-- 表上的索引的 DDL 语句 "T_XG_DKZQ"

CREATE INDEX "T_XG_DKZQ" ON "T_XG_DKZQ" 
		("DKZQBH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_XG_XDZCZR"
------------------------------------------------
 

CREATE TABLE "T_XG_XDZCZR"  (
		  "ZRHTH" VARCHAR(100) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JYDSBH" VARCHAR(30) , 
		  "JYDSMC" VARCHAR(200) , 
		  "XDJYLX" VARCHAR(60) , 
		  "JYZCLX" VARCHAR(30) , 
		  "ZRDKBJZE" DECIMAL(20,2) , 
		  "ZRDKLXZE" DECIMAL(20,2) , 
		  "ZRSXF" DECIMAL(20,2) , 
		  "ZRZJ" DECIMAL(20,2) , 
		  "HGLL" DOUBLE , 
		  "ZRJGRQ" CHAR(8) , 
		  "HGJZRQ" CHAR(8) , 
		  "ZRHTQSRQ" CHAR(8) , 
		  "ZRHTDQRQ" CHAR(8) , 
		  "JYDSZZH" VARCHAR(60) , 
		  "JYDSZZZHHM" VARCHAR(200) , 
		  "JYDSXH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_XG_XDZCZR"

CREATE INDEX "T_XG_XDZCZR" ON "T_XG_XDZCZR" 
		("ZRHTH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_XG_ZZRGX"
------------------------------------------------
 

CREATE TABLE "T_XG_ZZRGX"  (
		  "ZRHTH" VARCHAR(100) , 
		  "YXJGDM" VARCHAR(30) , 
		  "DGXDJJH" VARCHAR(100) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 






-- 表上的索引的 DDL 语句 "T_XG_ZZRGX"

CREATE INDEX "T_XG_ZZRGX" ON "T_XG_ZZRGX" 
		("ZRHTH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_XG_DKWXB"
------------------------------------------------
 

CREATE TABLE "T_XG_DKWXB"  (
		  "TZRQ" CHAR(8) , 
		  "XDJJH" VARCHAR(100) , 
		  "XDHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "YMXKMBH" VARCHAR(60) , 
		  "YWJXT" CHAR(4) , 
		  "XMXKMBH" VARCHAR(60) , 
		  "XWJXT" CHAR(4) , 
		  "ZRJE" DECIMAL(20,2) , 
		  "ZCJE" DECIMAL(20,2) , 
		  "KHMC" VARCHAR(200) , 
		  "JBGYH" VARCHAR(30) , 
		  "TZGYH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "SPGYH" VARCHAR(30) , 
		  "BDFS" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_XG_DHJCB"
------------------------------------------------
 

CREATE TABLE "T_XG_DHJCB"  (
		  "JCFSRQ" CHAR(8) , 
		  "XDJJH" VARCHAR(100) , 
		  "XDHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "BQCWBBRQ" CHAR(8) , 
		  "SQCWBBRQ" CHAR(8) , 
		  "YWPZ" VARCHAR(60) , 
		  "JE" DECIMAL(20,2) , 
		  "BZ" CHAR(3) , 
		  "DKHTYDFFRQ" CHAR(8) , 
		  "HTDQRQ" CHAR(8) , 
		  "ZYDBFS" VARCHAR(30) , 
		  "DKYT" VARCHAR(400) , 
		  "JCDD" VARCHAR(400) , 
		  "JCNR" VARCHAR(400) , 
		  "YJRYXM" VARCHAR(100) , 
		  "YJRYZW" VARCHAR(60) , 
		  "YYZZNJRQ" CHAR(8) , 
		  "SWDJZNJRQ" CHAR(8) , 
		  "DKKNJRQ" CHAR(8) , 
		  "HBAQSCNJRQ" CHAR(8) , 
		  "XKZNJRQ" CHAR(8) , 
		  "SXCKYE" DECIMAL(20,2) , 
		  "DKCKYE" DECIMAL(20,2) , 
		  "YPCKYE" DECIMAL(20,2) , 
		  "SPTXCKYE" DECIMAL(20,2) , 
		  "MYRZCKYE" DECIMAL(20,2) , 
		  "BHCKYE" DECIMAL(20,2) , 
		  "QTCKYE" DECIMAL(20,2) , 
		  "XMTZJE" DECIMAL(20,2) , 
		  "ZBJDWJE" DECIMAL(20,2) , 
		  "DKDWJE" DECIMAL(20,2) , 
		  "QTZJDWJE" DECIMAL(20,2) , 
		  "XMZBJBL" DOUBLE , 
		  "ZBJDWBL" DOUBLE , 
		  "DKDWBL" DOUBLE , 
		  "QTZJDWBL" DOUBLE , 
		  "XMZJZTPJ" VARCHAR(400) , 
		  "XMJD" DOUBLE , 
		  "XMJSQKPJ" VARCHAR(400) , 
		  "XMKXSMJ" DECIMAL(20,2) , 
		  "XMYXSMJ" DECIMAL(20,2) , 
		  "XSJJ" DECIMAL(20,2) , 
		  "XMXSQK" VARCHAR(400) , 
		  "KHJLGH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_XG_DHJCB"

CREATE INDEX "T_XG_DHJCB" ON "T_XG_DHJCB" 
		("JCFSRQ" ASC,
		 "XDJJH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_ZFSN_ZFKTJ"
------------------------------------------------
 

CREATE TABLE "T_ZFSN_ZFKTJ"  (
		  "JRJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "TJKMBH" VARCHAR(20) , 
		  "TJKMMC" VARCHAR(60) , 
		  "TJKMJE" DECIMAL(20,2) , 
		  "TJRQ" CHAR(8) , 
		  "BZ" CHAR(3) , 
		  "DQMC" VARCHAR(60) , 
		  "XZQHDM" CHAR(6) , 
		  "CJRQ" CHAR(8) )   
		 IN "ZCFZTSS" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_ZFSN_SNTJ"
------------------------------------------------
 

CREATE TABLE "T_ZFSN_SNTJ"  (
		  "JRJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "TJKMBH" VARCHAR(20) , 
		  "TJKMMC" VARCHAR(60) , 
		  "TJKMJE" DECIMAL(20,2) , 
		  "QXLX" VARCHAR(4) , 
		  "TJRQ" CHAR(8) , 
		  "BZ" CHAR(3) , 
		  "DQMC" VARCHAR(60) , 
		  "XZQHDM" CHAR(6) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS2" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KFX_KHJBXX"
------------------------------------------------
 

CREATE TABLE "T_KFX_KHJBXX"  (
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "KHDM" VARCHAR(30) , 
		  "KHMC" VARCHAR(200) , 
		  "FDDBRXM" VARCHAR(100) , 
		  "FDDBRZJLB" VARCHAR(30) , 
		  "FDDBRZJHM" VARCHAR(60) , 
		  "FRZCD" VARCHAR(400) , 
		  "XZQHDM" CHAR(6) , 
		  "ZCZE" DECIMAL(20,2) , 
		  "FZZE" DECIMAL(20,2) , 
		  "SFSSGS" VARCHAR(30) , 
		  "KHLX" VARCHAR(30) , 
		  "SXED" DECIMAL(20,2) , 
		  "DKYE" DECIMAL(20,2) , 
		  "BWYWYE" DECIMAL(20,2) , 
		  "FXYJXH" VARCHAR(200) , 
		  "TJRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KFX_KHJBXX"

CREATE INDEX "T_KFX_KHJBXX" ON "T_KFX_KHJBXX" 
		("KHDM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KFX_GDJGL"
------------------------------------------------
 

CREATE TABLE "T_KFX_GDJGL"  (
		  "KHDM" VARCHAR(30) , 
		  "KHMC" VARCHAR(200) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "DYDGDZJLB" VARCHAR(30) , 
		  "DYDGDDM" VARCHAR(60) , 
		  "DYDGDMC" VARCHAR(200) , 
		  "DEDGDZJLB" VARCHAR(30) , 
		  "DEDGDDM" VARCHAR(60) , 
		  "DEDGDMC" VARCHAR(200) , 
		  "DSDGDZJLB" VARCHAR(30) , 
		  "DSDGDDM" VARCHAR(60) , 
		  "DSDGDMC" VARCHAR(200) , 
		  "DIDGDZJLB" VARCHAR(30) , 
		  "DIDGDDM" VARCHAR(60) , 
		  "DIDGDMC" VARCHAR(200) , 
		  "DWDGDZJLB" VARCHAR(30) , 
		  "DWDGDDM" VARCHAR(60) , 
		  "DWDGDMC" VARCHAR(200) , 
		  "ZYGLQYYDM" VARCHAR(60) , 
		  "ZYGLQYYMC" VARCHAR(200) , 
		  "ZYGLQYEDM" VARCHAR(60) , 
		  "ZYGLQYEMC" VARCHAR(200) , 
		  "ZYGLQYSDM" VARCHAR(60) , 
		  "ZYGLQYSMC" VARCHAR(200) , 
		  "ZYGLQYIDM" VARCHAR(60) , 
		  "ZYGLQYIMC" VARCHAR(200) , 
		  "ZYGLQYWDM" VARCHAR(60) , 
		  "ZYGLQYWMC" VARCHAR(200) , 
		  "TJRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KFX_GDJGL"

CREATE INDEX "T_KFX_GDJGL" ON "T_KFX_GDJGL" 
		("YXJGDM" ASC,
		 "KHDM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KFX_DKMX"
------------------------------------------------
 

CREATE TABLE "T_KFX_DKMX"  (
		  "KHDM" VARCHAR(30) , 
		  "KHMC" VARCHAR(200) , 
		  "DKFFX" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "XDYWZL" VARCHAR(100) , 
		  "DKLSHM" VARCHAR(30) , 
		  "DKJE" DECIMAL(20,2) , 
		  "WJFLFXZK" CHAR(4) , 
		  "DBLX" VARCHAR(30) , 
		  "DYDBRDM" VARCHAR(30) , 
		  "DYDBRMC" VARCHAR(200) , 
		  "DEDBRDM" VARCHAR(30) , 
		  "DEDBRMC" VARCHAR(200) , 
		  "DKTXXY" VARCHAR(60) , 
		  "SFGJXZXY" VARCHAR(4) , 
		  "FFRQ" CHAR(8) , 
		  "DQRQ" CHAR(8) , 
		  "TJRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KFX_DKMX"

CREATE INDEX "T_KFX_DKMX" ON "T_KFX_DKMX" 
		("KHDM" ASC,
		 "DKLSHM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KFX_BWYWMX"
------------------------------------------------
 

CREATE TABLE "T_KFX_BWYWMX"  (
		  "KHDM" VARCHAR(30) , 
		  "KHMC" VARCHAR(200) , 
		  "YWBLX" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "BWYWZL" VARCHAR(30) , 
		  "BWYWLSH" VARCHAR(30) , 
		  "BWYWJE" DECIMAL(20,2) , 
		  "BZJJE" DECIMAL(20,2) , 
		  "FSRQ" CHAR(8) , 
		  "BWYWDQRQ" CHAR(8) , 
		  "SFFSDK" VARCHAR(4) , 
		  "TJRQ" CHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KFX_BWYWMX"

CREATE INDEX "T_KFX_BWYWMX" ON "T_KFX_BWYWMX" 
		("KHDM" ASC,
		 "BWYWLSH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_GRHCFZMX"
------------------------------------------------
 

CREATE TABLE "T_KJ_GRHCFZMX"  (
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "HQCKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "HXJYRQ" CHAR(8) , 
		  "HXJYSJ" CHAR(6) , 
		  "BZ" CHAR(3) , 
		  "JYLX" VARCHAR(60) , 
		  "JYJE" DECIMAL(20,2) , 
		  "ZHYE" DECIMAL(20,2) , 
		  "DFZH" VARCHAR(60) , 
		  "DFHM" VARCHAR(200) , 
		  "DFXH" VARCHAR(30) , 
		  "JYQD" VARCHAR(60) , 
		  "XZBZ" VARCHAR(4) , 
		  "JYGYH" VARCHAR(30) , 
		  "GYLSH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "ZY" VARCHAR(400) , 
		  "CBMBZ" VARCHAR(4) , 
		  "JDBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "GRDHQTSS" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KJ_GRDCFZMX"
------------------------------------------------
 

CREATE TABLE "T_KJ_GRDCFZMX"  (
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "DQCKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "HXJYRQ" CHAR(8) , 
		  "HXJYSJ" CHAR(6) , 
		  "BZ" CHAR(3) , 
		  "JYLX" VARCHAR(60) , 
		  "JYJE" DECIMAL(20,2) , 
		  "ZHYE" DECIMAL(20,2) , 
		  "DFZH" VARCHAR(60) , 
		  "DFHM" VARCHAR(200) , 
		  "DFXH" VARCHAR(30) , 
		  "JYQD" VARCHAR(60) , 
		  "XZBZ" VARCHAR(4) , 
		  "BFTQZQBZ" VARCHAR(4) , 
		  "JYGYH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "ZY" VARCHAR(400) , 
		  "CBMBZ" VARCHAR(4) , 
		  "JDBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "GRDHQTSS" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KJ_GRHCFZ"
------------------------------------------------
 

CREATE TABLE "T_KJ_GRHCFZ"  (
		  "HQCKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "TJKMBH" VARCHAR(20) , 
		  "BZ" CHAR(3) , 
		  "ZHMC" VARCHAR(200) , 
		  "GRHQCKZHLX" VARCHAR(60) , 
		  "FLZHLX" VARCHAR(30) , 
		  "FLZH" VARCHAR(60) , 
		  "BZJZHBZ" VARCHAR(4) , 
		  "LL" DOUBLE , 
		  "CKYE" DECIMAL(20,2) , 
		  "KHRQ" CHAR(8) , 
		  "XHRQ" CHAR(8) , 
		  "ZHZT" VARCHAR(60) , 
		  "SCDHRQ" CHAR(8) , 
		  "CHLB" VARCHAR(8) , 
		  "CJRQ" CHAR(8) )   
		 IN "GRDHQTSS" ; 






-- 表上的索引的 DDL 语句 "T_KJ_GRHCFZ"

CREATE INDEX "T_KJ_GRHCFZ" ON "T_KJ_GRHCFZ" 
		("HQCKZH" ASC,
		 "BZ" ASC,
		 "CHLB" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_DGHCFZMX"
------------------------------------------------
 

CREATE TABLE "T_KJ_DGHCFZMX"  (
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "HQCKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "HXJYRQ" CHAR(8) , 
		  "HXJYSJ" CHAR(6) , 
		  "JYLX" VARCHAR(60) , 
		  "JYJE" DECIMAL(20,2) , 
		  "ZHYE" DECIMAL(20,2) , 
		  "DFZH" VARCHAR(60) , 
		  "DFHM" VARCHAR(200) , 
		  "DFXH" VARCHAR(30) , 
		  "JYQD" VARCHAR(60) , 
		  "BZ" CHAR(3) , 
		  "XZBZ" VARCHAR(4) , 
		  "JYGYH" VARCHAR(30) , 
		  "GYLSH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "ZY" VARCHAR(400) , 
		  "CBMBZ" VARCHAR(4) , 
		  "JDBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KJ_DGDCFZMX"
------------------------------------------------
 

CREATE TABLE "T_KJ_DGDCFZMX"  (
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "DQCKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "HXJYRQ" CHAR(8) , 
		  "HXJYSJ" CHAR(6) , 
		  "BZ" CHAR(3) , 
		  "JYLX" VARCHAR(60) , 
		  "JYJE" DECIMAL(20,2) , 
		  "ZHYE" DECIMAL(20,2) , 
		  "DFZH" VARCHAR(60) , 
		  "DFHM" VARCHAR(200) , 
		  "DFXH" VARCHAR(30) , 
		  "JYQD" VARCHAR(60) , 
		  "XZBZ" VARCHAR(4) , 
		  "BFTQZQBZ" VARCHAR(4) , 
		  "JYGYH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "ZY" VARCHAR(400) , 
		  "CBMBZ" VARCHAR(4) , 
		  "JDBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_XDHT"
------------------------------------------------
 

CREATE TABLE "T_SJD_XDHT"  (
		  "XDHTH" VARCHAR(100) , 
		  "ZHTH" VARCHAR(100) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "KHMC" VARCHAR(200) , 
		  "CPMC" VARCHAR(200) , 
		  "DKXGZL" VARCHAR(30) , 
		  "XDYWZL" VARCHAR(100) , 
		  "BZ" CHAR(3) , 
		  "JE" DECIMAL(20,2) , 
		  "HTYDRQ" CHAR(8) , 
		  "HTDQRQ" CHAR(8) , 
		  "LL" DOUBLE , 
		  "LLFD" DOUBLE , 
		  "ZYDBFS" VARCHAR(30) , 
		  "GHJLGH" VARCHAR(30) , 
		  "DKQX" INTEGER , 
		  "FKFS" CHAR(8) , 
		  "ZJLY" VARCHAR(60) , 
		  "DKYT" VARCHAR(400) , 
		  "DKTXXY" VARCHAR(60) , 
		  "SFGJXZXY" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_SJD_XDHT"

CREATE INDEX "T_SJD_XDHT" ON "T_SJD_XDHT" 
		("XDHTH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KJ_GRXFZMX"
------------------------------------------------
 

CREATE TABLE "T_KJ_GRXFZMX"  (
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "DKFHZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "XDJJH" VARCHAR(100) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "HXJYRQ" CHAR(8) , 
		  "HXJYSJ" CHAR(6) , 
		  "JYLX" VARCHAR(60) , 
		  "JDBZ" VARCHAR(4) , 
		  "JYJE" DECIMAL(20,2) , 
		  "ZHYE" DECIMAL(20,2) , 
		  "DFZH" VARCHAR(60) , 
		  "DFHM" VARCHAR(200) , 
		  "DFXH" VARCHAR(30) , 
		  "JYQD" VARCHAR(60) , 
		  "BZ" CHAR(3) , 
		  "ZY" VARCHAR(400) , 
		  "CBMBZ" VARCHAR(4) , 
		  "JYGYH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "XZBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "GRXDTSS" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KJ_DGXFZMX"
------------------------------------------------
 

CREATE TABLE "T_KJ_DGXFZMX"  (
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "DKZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "XDJJH" VARCHAR(100) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "HXJYRQ" CHAR(8) , 
		  "HXJYSJ" CHAR(6) , 
		  "JYLX" VARCHAR(60) , 
		  "JDBZ" VARCHAR(4) , 
		  "JYJE" DECIMAL(20,2) , 
		  "ZHYE" DECIMAL(20,2) , 
		  "DFZH" VARCHAR(60) , 
		  "DFHM" VARCHAR(200) , 
		  "DFXH" VARCHAR(30) , 
		  "JYQD" VARCHAR(60) , 
		  "BZ" CHAR(3) , 
		  "ZY" VARCHAR(400) , 
		  "CBMBZ" VARCHAR(4) , 
		  "JYGYH" VARCHAR(30) , 
		  "SQGYH" VARCHAR(30) , 
		  "XZBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "DGTSS" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_KH_DGKHXX"
------------------------------------------------
 

CREATE TABLE "T_KH_DGKHXX"  (
		  "KHTYBH" VARCHAR(60) , 
		  "ZZJGDM" VARCHAR(40) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "KHMC" VARCHAR(200) , 
		  "KHYWMC" VARCHAR(200) , 
		  "FRDB" VARCHAR(30) , 
		  "FRDBZJLB" VARCHAR(30) , 
		  "FRDBZJHM" VARCHAR(60) , 
		  "JBCKZH" VARCHAR(60) , 
		  "JBZHKHXMC" VARCHAR(200) , 
		  "ZCZB" DECIMAL(20,2) , 
		  "ZCDZ" VARCHAR(400) , 
		  "LXDH" VARCHAR(30) , 
		  "YYZZH" VARCHAR(60) , 
		  "YYZZYXJZRQ" CHAR(8) , 
		  "JYFW" VARCHAR(400) , 
		  "CLRQ" CHAR(8) , 
		  "SSXY" VARCHAR(30) , 
		  "KHLB" VARCHAR(30) , 
		  "DKZH" VARCHAR(60) , 
		  "GSZH" VARCHAR(60) , 
		  "DSZH" VARCHAR(60) , 
		  "MGSKHTYBH" VARCHAR(60) , 
		  "TYSXBZ" VARCHAR(4) , 
		  "SXED" DECIMAL(20,2) , 
		  "YYED" DECIMAL(20,2) , 
		  "SSGSBZ" VARCHAR(4) , 
		  "XYDJBH" VARCHAR(30) , 
		  "ZCZBBZ" CHAR(3) , 
		  "SSZBBZ" CHAR(3) , 
		  "SSZB" DECIMAL(20,2) , 
		  "ZZC" DECIMAL(20,2) , 
		  "JZC" DECIMAL(20,2) , 
		  "NSR" DECIMAL(20,2) , 
		  "SCJLXDGXNY" CHAR(6) , 
		  "YZBM" CHAR(6) , 
		  "CZHM" VARCHAR(30) , 
		  "YGRS" INTEGER , 
		  "XZQHDM" CHAR(6) , 
		  "KHLX" VARCHAR(30) , 
		  "FXYJXH" VARCHAR(200) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_KH_DGKHXX"

CREATE INDEX "T_KH_DGKHXX" ON "T_KH_DGKHXX" 
		("KHTYBH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;

-- 表上的索引的 DDL 语句 "T_KH_DGKHXX"

CREATE INDEX "T_KH_DGKHXX_FRDBZJHM" ON "T_KH_DGKHXX" 
		("FRDBZJHM" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_SJD_DGBSY"
------------------------------------------------
 

CREATE TABLE "T_SJD_DGBSY"  (
		  "XDJJH" VARCHAR(100) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "KHTYBH" VARCHAR(60) , 
		  "XDHTH" VARCHAR(100) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMBH" VARCHAR(60) , 
		  "MXKMMC" VARCHAR(60) , 
		  "YWLX" VARCHAR(60) , 
		  "BZ" CHAR(3) , 
		  "JE" DECIMAL(20,2) , 
		  "YE" DECIMAL(20,2) , 
		  "DKQX" INTEGER , 
		  "SFDF" VARCHAR(4) , 
		  "DKSJFFRQ" CHAR(8) , 
		  "DKYSDQRQ" CHAR(8) , 
		  "DKSJDQRQ" CHAR(8) , 
		  "ZJRQ" CHAR(8) , 
		  "DKWJFL" CHAR(4) , 
		  "SXFJE" DECIMAL(20,2) , 
		  "BZJBL" DOUBLE , 
		  "BZJBZ" CHAR(3) , 
		  "BZJJE" DECIMAL(20,2) , 
		  "BZJZH" VARCHAR(60) , 
		  "PJHM" VARCHAR(60) , 
		  "PMJE" DECIMAL(20,2) , 
		  "XDYGH" VARCHAR(30) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_SJD_GXYJJ"
------------------------------------------------
 

CREATE TABLE "T_SJD_GXYJJ"  (
		  "XDJJH" VARCHAR(100) , 
		  "DKFHZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "XDHTH" VARCHAR(100) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "XDYWZL" VARCHAR(100) , 
		  "BZ" CHAR(3) , 
		  "JKJE" DECIMAL(20,2) , 
		  "JKYE" DECIMAL(20,2) , 
		  "DKQX" INTEGER , 
		  "ZQCS" INTEGER , 
		  "ZQS" INTEGER , 
		  "DQQS" INTEGER , 
		  "DKSJFFRQ" CHAR(8) , 
		  "DKYSDQRQ" CHAR(8) , 
		  "DKSJDQRQ" CHAR(8) , 
		  "BNQXYE" DECIMAL(20,2) , 
		  "BWQXYE" DECIMAL(20,2) , 
		  "DKZT" VARCHAR(100) , 
		  "ZJRQ" CHAR(8) , 
		  "DKLX" VARCHAR(100) , 
		  "DKRZZH" VARCHAR(60) , 
		  "DKWJFL" CHAR(4) , 
		  "JZLL" DOUBLE , 
		  "LLFDBL" DOUBLE , 
		  "HKFS" VARCHAR(40) , 
		  "HKZH" VARCHAR(60) , 
		  "HKQD" VARCHAR(100) , 
		  "JXFS" VARCHAR(30) , 
		  "BZJBL" DOUBLE , 
		  "BZJBZ" CHAR(3) , 
		  "BZJJE" DECIMAL(20,2) , 
		  "BZJZH" VARCHAR(60) , 
		  "XDYXM" VARCHAR(100) , 
		  "XDYYGH" VARCHAR(30) , 
		  "XZBZ" VARCHAR(4) , 
		  "LJQKQS" INTEGER , 
		  "LXQKQS" INTEGER , 
		  "STZFBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_SJD_GXYJJ"

CREATE INDEX "T_SJD_GXYJJ" ON "T_SJD_GXYJJ" 
		("XDJJH" ASC,
		 "DKFHZH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_SJD_DXYJJ"
------------------------------------------------
 

CREATE TABLE "T_SJD_DXYJJ"  (
		  "XDJJH" VARCHAR(100) , 
		  "DKFHZH" VARCHAR(60) , 
		  "KHTYBH" VARCHAR(60) , 
		  "XDHTH" VARCHAR(100) , 
		  "YXJGDM" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "YXJGMC" VARCHAR(200) , 
		  "MXKMMC" VARCHAR(60) , 
		  "XDYWZL" VARCHAR(100) , 
		  "BZ" CHAR(3) , 
		  "JKJE" DECIMAL(20,2) , 
		  "JKYE" DECIMAL(20,2) , 
		  "DKQX" INTEGER , 
		  "ZQCS" INTEGER , 
		  "ZQS" INTEGER , 
		  "DQQS" INTEGER , 
		  "DKSJFFRQ" CHAR(8) , 
		  "DKYSDQRQ" CHAR(8) , 
		  "DKSJDQRQ" CHAR(8) , 
		  "BNQXYE" DECIMAL(20,2) , 
		  "BWQXYE" DECIMAL(20,2) , 
		  "DKZT" VARCHAR(100) , 
		  "ZJRQ" CHAR(8) , 
		  "DKLX" VARCHAR(100) , 
		  "DKRZZH" VARCHAR(60) , 
		  "DKWJFL" CHAR(4) , 
		  "JZLL" DOUBLE , 
		  "LLFDBL" DOUBLE , 
		  "HKFS" VARCHAR(40) , 
		  "HKZH" VARCHAR(60) , 
		  "HKQD" VARCHAR(100) , 
		  "JXFS" VARCHAR(30) , 
		  "BZJBL" DOUBLE , 
		  "BZJBZ" CHAR(3) , 
		  "BZJJE" DECIMAL(20,2) , 
		  "BZJZH" VARCHAR(60) , 
		  "PJHM" VARCHAR(60) , 
		  "PMJE" DECIMAL(20,2) , 
		  "XDYXM" VARCHAR(100) , 
		  "XDYGH" VARCHAR(30) , 
		  "XZBZ" VARCHAR(4) , 
		  "LJQKQS" INTEGER , 
		  "LXQKQS" INTEGER , 
		  "STZFBZ" VARCHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 






-- 表上的索引的 DDL 语句 "T_SJD_DXYJJ"

CREATE INDEX "T_SJD_DXYJJ" ON "T_SJD_DXYJJ" 
		("XDJJH" ASC,
		 "DKFHZH" ASC)
		PCTFREE 10 
		 ALLOW REVERSE SCANS;
------------------------------------------------
-- 表的 DDL 语句 "T_KP_XYKZJYMX"
------------------------------------------------
 

CREATE TABLE "T_KP_XYKZJYMX"  (
		  "XYKZH" VARCHAR(60) , 
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "BZ" CHAR(3) , 
		  "JYJZRQ" CHAR(8) , 
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "KPJYLX" VARCHAR(60) , 
		  "CHLB" VARCHAR(4) , 
		  "XZBZ" VARCHAR(4) , 
		  "JYPZH" VARCHAR(60) , 
		  "JDBZ" VARCHAR(4) , 
		  "JYJE" DECIMAL(20,2) , 
		  "KHSXFJE" DECIMAL(20,2) , 
		  "QKGHCX" VARCHAR(30) , 
		  "JYQXRQ" CHAR(8) , 
		  "JYFSRQ" CHAR(8) , 
		  "JYZDRQ" CHAR(8) , 
		  "DFZH" VARCHAR(60) , 
		  "FQFKBZ" VARCHAR(10) , 
		  "JYQD" VARCHAR(60) , 
		  "JYSJ" CHAR(6) , 
		  "JYGYH" VARCHAR(30) , 
		  "JYJGH" VARCHAR(30) , 
		  "GZZXZ" VARCHAR(30) , 
		  "GZZBH" VARCHAR(30) , 
		  "ZY" VARCHAR(400) , 
		  "BZH" VARCHAR(200) , 
		  "CJRQ" CHAR(8) )   
		 IN "EASTSS1" ; 





------------------------------------------------
-- 表的 DDL 语句 "T_JL_JYLS"
------------------------------------------------
 

CREATE TABLE "T_JL_JYLS"  (
		  "HXJYLSH" VARCHAR(60) , 
		  "ZJYLSH" VARCHAR(30) , 
		  "BCXH" INTEGER , 
		  "JYRQ" CHAR(8) , 
		  "YXJGDM" VARCHAR(30) , 
		  "NBJGH" VARCHAR(30) , 
		  "JRXKZH" VARCHAR(30) , 
		  "MXKMBH" VARCHAR(60) , 
		  "JYSJ" CHAR(6) , 
		  "JZRQ" CHAR(8) , 
		  "JZSJ" CHAR(6) , 
		  "JYJGMC" VARCHAR(200) , 
		  "JYZH" VARCHAR(60) , 
		  "JYHM" VARCHAR(200) , 
		  "JYXTMC" VARCHAR(200) , 
		  "DFXH" VARCHAR(30) , 
		  "DFJGMC" VARCHAR(200) , 
		  "DFZH" VARCHAR(60) , 
		  "DFHM" VARCHAR(200) , 
		  "JYJE" DECIMAL(20,2) , 
		  "JDBZ" VARCHAR(4) , 
		  "XZBZ" VARCHAR(4) , 
		  "BZ" CHAR(3) , 
		  "YWLX" VARCHAR(60) , 
		  "JYLX" VARCHAR(60) , 
		  "JYQD" VARCHAR(60) , 
		  "JYJZMC" VARCHAR(4) , 
		  "JYJZH" VARCHAR(30) , 
		  "CZGYH" VARCHAR(30) , 
		  "GYLSH" VARCHAR(30) , 
		  "FHGYH" VARCHAR(30) , 
		  "ZY" VARCHAR(400) , 
		  "ZPZZL" VARCHAR(30) , 
		  "ZPZH" VARCHAR(60) , 
		  "FPZZL" VARCHAR(30) , 
		  "FPZH" VARCHAR(60) , 
		  "CBMBZ" VARCHAR(4) , 
		  "SJC" CHAR(16) , 
		  "ZHBZ" CHAR(4) , 
		  "KXHBZ" CHAR(4) , 
		  "CJRQ" CHAR(8) )   
		 PARTITION BY RANGE("JYRQ") 
		 (PART "PART0" STARTING('20120101') ENDING('20120401') EXCLUSIVE IN "JYLSTSS1", 
		 PART "PART1" STARTING('20120401') ENDING('20120701') EXCLUSIVE IN "JYLSTSS2", 
		 PART "PART2" STARTING('20120701') ENDING('20121001') EXCLUSIVE IN "JYLSTSS3", 
		 PART "PART3" STARTING('20121001') ENDING('20130101') EXCLUSIVE IN "JYLSTSS4", 
		 PART "PART4" STARTING('20130101') ENDING('20130401') EXCLUSIVE IN "JYLSTSS1", 
		 PART "PART5" STARTING('20130401') ENDING('20130701') EXCLUSIVE IN "JYLSTSS2", 
		 PART "PART6" STARTING('20130701') ENDING('20131001') EXCLUSIVE IN "JYLSTSS3", 
		 PART "PART7" STARTING('20131001') ENDING('20140101') EXCLUSIVE IN "JYLSTSS4", 
		 PART "PART8" STARTING('20140101') ENDING('20140401') EXCLUSIVE IN "JYLSTSS1", 
		 PART "PART9" STARTING('20140401') ENDING('20140701') EXCLUSIVE IN "JYLSTSS2", 
		 PART "PART10" STARTING('20140701') ENDING('20141001') EXCLUSIVE IN "JYLSTSS3", 
		 PART "PART11" STARTING('20141001') ENDING('20150101') EXCLUSIVE IN "JYLSTSS4", 
		 PART "PART12" STARTING('20150101') ENDING('20150401') EXCLUSIVE IN "JYLSTSS1", 
		 PART "PART13" STARTING('20150401') ENDING('20150701') EXCLUSIVE IN "JYLSTSS2", 
		 PART "PART14" STARTING('20150701') ENDING('20151001') EXCLUSIVE IN "JYLSTSS3", 
		 PART "PART15" STARTING('20151001') ENDING('20160101') EXCLUSIVE IN "JYLSTSS4");  
