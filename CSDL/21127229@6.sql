USE QLDT1;

--Q58--
--EXCEPT--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
                                                                                         SELECT MACD
    FROM CHUDE
EXCEPT
    SELECT CD.MACD
    FROM CHUDE CD, THAMGIADT TG, DETAI DT
    WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT AND DT.MACD=CD.MACD
)

--NOT EXISTS--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
    SELECT CD.MACD
FROM CHUDE CD, DETAI DT, THAMGIADT TG
WHERE NOT EXISTS(
        SELECT CD.MACD
WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT AND DT.MACD=CD.MACD
    )
)

--COUNT--
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV, CHUDE CD, THAMGIADT TG, DETAI DT
WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT AND DT.MACD=CD.MACD
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(DISTINCT CD.MACD) = (SELECT COUNT(MACD)
FROM CHUDE)

--Q59--
--EXCEPT--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
                                                                                                                                                                                                                                                                                                                        SELECT GV.MAGV
    FROM GIAOVIEN GV
    WHERE GV.MABM='HTTT'
EXCEPT
    SELECT GV.MAGV
    FROM THAMGIADT TG, GIAOVIEN GV
    WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT
)

--NOT EXISTS--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
    SELECT MAGV
FROM GIAOVIEN GV
WHERE GV.MABM='HTTT' AND NOT EXISTS(
        SELECT MAGV
    FROM THAMGIADT TG
    WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT
    )
)

--COUNT--
SELECT DT.MADT, TENDT
FROM DETAI DT, GIAOVIEN GV, THAMGIADT TG
WHERE GV.MAGV=TG.MAGV AND GV.MABM='HTTT' AND TG.MADT=DT.MADT
GROUP BY DT.MADT,DT.TENDT
HAVING COUNT(DISTINCT GV.MAGV)= (SELECT COUNT(MAGV)
FROM GIAOVIEN GV
WHERE GV.MABM='HTTT')


--Q60--
--EXCEPT--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
                                                                                                                                                                                                                                                                                                                                                        SELECT GV.MAGV
    FROM GIAOVIEN GV, BOMON BM
    WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Hệ thống thông tin'
EXCEPT
    SELECT GV.MAGV
    FROM THAMGIADT TG, GIAOVIEN GV
    WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT
)

--NOT EXISTS--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
    SELECT MAGV
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Hệ thống thông tin' AND NOT EXISTS(
        SELECT MAGV
    FROM THAMGIADT TG
    WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT
    )
)

--COUNT--
SELECT DT.MADT, TENDT
FROM DETAI DT, GIAOVIEN GV, THAMGIADT TG, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Hệ thống thông tin'AND GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT
GROUP BY DT.MADT,DT.TENDT
HAVING COUNT(DISTINCT GV.MAGV)= (SELECT COUNT(MAGV)
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Hệ thống thông tin')

--Q61--
--EXCEPT--
SELECT MAGV
FROM GIAOVIEN GV
WHERE NOT EXISTS(
                                                                                                                                                                                                                                            SELECT MADT
    FROM DETAI DT
    WHERE DT.MACD='QLGD'
EXCEPT
    SELECT MADT
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV
)

--NOT EXISTS--
SELECT MAGV
FROM GIAOVIEN GV
WHERE NOT EXISTS(
    SELECT MADT
FROM DETAI DT
WHERE DT.MACD='QLGD' AND NOT EXISTS(
        SELECT MADT
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV AND TG.MADT=DT.MADT
    )
)

--COUNT--
SELECT GV.MAGV
FROM GIAOVIEN GV, THAMGIADT TG
WHERE TG.MAGV=GV.MAGV AND TG.MADT IN(SELECT MADT
    FROM DETAI DT
    WHERE DT.MACD='QLGD')
GROUP BY GV.MAGV
HAVING COUNT(DISTINCT TG.MADT) =(SELECT COUNT(MADT)
FROM DETAI DT
WHERE DT.MACD='QLGD')

--Q62--
--EXCEPT--
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV, GIAOVIEN TTH
WHERE TTH.HOTEN=N'Trần Trà Hương' AND GV.MAGV<>TTH.MAGV AND NOT EXISTS(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            SELECT MADT
        FROM THAMGIADT TG
        WHERE TTH.MAGV=TG.MAGV
    EXCEPT
        SELECT MADT
        FROM THAMGIADT TG
        WHERE TG.MAGV=GV.MAGV
)

--NOT EXISTS--
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV, GIAOVIEN TTH
WHERE TTH.HOTEN=N'Trần Trà Hương' AND GV.MAGV<>TTH.MAGV AND NOT EXISTS(
    SELECT *
    FROM THAMGIADT TG2
    WHERE TTH.MAGV=TG2.MAGV AND NOT EXISTS(
        SELECT *
        FROM THAMGIADT TG
        WHERE GV.MAGV=TG.MAGV AND TG2.MADT=TG.MADT
        
    )
)

--COUNT--

SELECT GV.MAGV, GV.HOTEN
FROM THAMGIADT TG , GIAOVIEN GV, GIAOVIEN TTH
WHERE TTH.HOTEN=N'Trần Trà Hương' AND GV.MAGV<>TTH.MAGV AND TG.MAGV=GV.MAGV AND TG.MADT IN(
    SELECT MADT
    FROM THAMGIADT TG
    WHERE TG.MAGV=TTH.MAGV
)
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(DISTINCT MADT)= (
    SELECT COUNT(DISTINCT TG.MADT)
FROM THAMGIADT TG, GIAOVIEN TTH
WHERE TTH.MAGV=TG.MAGV AND TTH.HOTEN=N'Trần Trà Hương'
)

--Q63--
--EXCEPT--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
                                                                                                                                                                                                                SELECT GV.MAGV
    FROM GIAOVIEN GV, BOMON BM
    WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Hóa hữu cơ'
EXCEPT
    SELECT GV.MAGV
    FROM THAMGIADT TG, GIAOVIEN GV
    WHERE TG.MAGV=GV.MAGV AND DT.MADT=TG.MADT
)

--NOT EXISTS--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
    SELECT *
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Hóa hữu cơ' AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV AND TG.MADT=DT.MADT
    )
)

--COUNT--
SELECT TENDT
FROM DETAI DT, GIAOVIEN GV, THAMGIADT TG , BOMON BM
WHERE TG.MADT=DT.MADT AND GV.MAGV=TG.MAGV AND GV.MABM=BM.MABM AND BM.TENBM=N'Hóa hữu cơ'
GROUP BY DT.MADT,DT.TENDT
HAVING COUNT(DISTINCT GV.MAGV )=(SELECT COUNT(GV.MAGV)
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Hóa hữu cơ' )



--Q64--
--EXCEPT--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
                                                                                                                                                                                                            SELECT MADT, SOTT
    FROM CONGVIEC CV
    WHERE CV.MADT='006'
EXCEPT
    SELECT TG.MADT, TG.STT
    FROM THAMGIADT TG
    WHERE GV.MAGV=TG.MAGV
)

--NOT EXISTS--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
    SELECT *
FROM CONGVIEC CV
WHERE CV.MADT='006' AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV AND TG.MADT=CV.MADT AND TG.STT=CV.SOTT
    )
)

--COUNT--
SELECT HOTEN
FROM GIAOVIEN GV, CONGVIEC CV, THAMGIADT TG
WHERE CV.MADT='006' AND GV.MAGV=TG.MAGV AND TG.MADT=CV.MADT AND TG.STT=CV.SOTT
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(*) =(SELECT COUNT(*)
FROM CONGVIEC CV
WHERE CV.MADT='006')



--Q65--
--EXCEPT--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
                                                                                                                                                                                        SELECT MADT
    FROM DETAI DT, CHUDE CD
    WHERE DT.MACD=CD.MACD AND CD.TENCD=N'Ứng dụng công nghệ'
EXCEPT
    SELECT MADT
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV
)

--NOT EXISTS--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
    SELECT *
FROM DETAI DT, CHUDE CD
WHERE DT.MACD=CD.MACD AND CD.TENCD=N'Ứng dụng công nghệ' AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV AND DT.MADT=TG.MADT
    )
)

--COUNT--
SELECT HOTEN
FROM GIAOVIEN GV, THAMGIADT TG, DETAI DT, CHUDE CD
WHERE GV.MAGV=TG.MAGV AND DT.MACD=CD.MACD AND TG.MADT=DT.MADT AND CD.TENCD=N'Ứng dụng công nghệ'
GROUP BY GV.HOTEN,GV.MAGV
HAVING COUNT(DISTINCT TG.MADT) =(SELECT COUNT(DISTINCT MADT)
FROM DETAI DT, CHUDE CD
WHERE DT.MACD=CD.MACD AND CD.TENCD=N'Ứng dụng công nghệ')

--Q66--
--EXCEPT--
SELECT GV.HOTEN
FROM GIAOVIEN GV, GIAOVIEN TTH
WHERE TTH.HOTEN =N'Trần Trà Hương'AND GV.MAGV<>TTH.MAGV AND NOT EXISTS(
                                                                                                                                                                                                                                                                                                                SELECT MADT
        FROM DETAI DT
        WHERE DT.GVCNDT=TTH.MAGV
    EXCEPT
        SELECT MADT
        FROM THAMGIADT TG
        WHERE TG.MAGV=GV.MAGV)


--NOT EXISTS--
SELECT GV.HOTEN
FROM GIAOVIEN GV, GIAOVIEN TTH
WHERE TTH.HOTEN =N'Trần Trà Hương'AND GV.MAGV<>TTH.MAGV AND NOT EXISTS(
    SELECT *
    FROM DETAI DT
    WHERE DT.GVCNDT=TTH.MAGV AND NOT EXISTS(
        SELECT *
        FROM THAMGIADT TG
        WHERE TG.MAGV=GV.MAGV AND TG.MADT=DT.MADT
    )
)

--COUNT--
SELECT GV.HOTEN
FROM GIAOVIEN GV, GIAOVIEN TTH, THAMGIADT TG, DETAI DT
WHERE TTH.HOTEN =N'Trần Trà Hương'AND GV.MAGV<>TTH.MAGV AND DT.GVCNDT=TTH.MAGV AND TG.MAGV =GV.MAGV AND TG.MADT = DT.MADT
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(DISTINCT TG.MADT ) =(SELECT COUNT(MADT)
FROM DETAI DT, GIAOVIEN TTH
WHERE DT.GVCNDT=TTH.MAGV AND TTH.HOTEN =N'Trần Trà Hương')

--Q67--
--EXCEPT--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
                                                                                                                        SELECT GV.MAGV
    FROM GIAOVIEN GV, BOMON BM
    WHERE GV.MABM=BM.MABM AND BM.MAKHOA='CNTT'
EXCEPT
    SELECT MAGV
    FROM THAMGIADT TG
    WHERE DT.MADT=TG.MADT 
)

--NOT EXISTS--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
    SELECT *
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.MAKHOA='CNTT' AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MADT =DT.MADT AND TG.MAGV =GV.MAGV
    )
)

--COUNT--
SELECT TENDT
FROM DETAI DT, THAMGIADT TG, GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.MAKHOA='CNTT' AND TG.MAGV=GV.MAGV AND DT.MADT=TG.MADT
GROUP BY DT.MADT,DT.TENDT
HAVING COUNT(DISTINCT TG.MAGV)=(SELECT COUNT(MAGV)
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM AND BM.MAKHOA='CNTT' )

--Q68--
--EXCEPT--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
                                                                                                                        SELECT CV.MADT, SOTT
    FROM CONGVIEC CV, DETAI DT
    WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Nghiên cứu tế bào gốc'
EXCEPT
    SELECT TG.MADT, TG.STT
    FROM THAMGIADT TG
    WHERE GV.MAGV=TG.MAGV 
)

--NOT EXISTS--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
    SELECT *
FROM CONGVIEC CV, DETAI DT
WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Nghiên cứu tế bào gốc' AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV AND TG.MADT=CV.MADT AND TG.STT=CV.SOTT
    )
)

--COUNT--
SELECT HOTEN
FROM GIAOVIEN GV, THAMGIADT TG, DETAI DT, CONGVIEC CV
WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Nghiên cứu tế bào gốc' AND TG.MAGV=GV.MAGV AND TG.MADT=CV.MADT AND TG.STT=CV.SOTT
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(*) =(SELECT COUNT(*)
FROM CONGVIEC CV, DETAI DT
WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Nghiên cứu tế bào gốc')

--Q69--
--EXCEPT--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
                                                                                                                        SELECT MADT
    FROM DETAI DT
    WHERE DT.KINHPHI>100
EXCEPT
    SELECT MADT
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV
)

--NOT EXISTS--
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(
    SELECT *
FROM DETAI DT
WHERE DT.KINHPHI>100 AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV AND DT.MADT=TG.MADT
    )
)

--COUNT--
SELECT HOTEN
FROM GIAOVIEN GV, THAMGIADT TG, DETAI DT
WHERE DT.KINHPHI>100 AND DT.MADT=TG.MADT AND TG.MAGV=GV.MAGV
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(DISTINCT TG.MADT)=(SELECT COUNT(MADT)
FROM DETAI
WHERE DETAI.KINHPHI>100)

--Q70--
--EXCEPT--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
                                                                                                                        SELECT GV.MAGV
    FROM GIAOVIEN GV, BOMON BM, KHOA K
    WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Sinh học'
EXCEPT
    SELECT MAGV
    FROM THAMGIADT TG
    WHERE DT.MADT=TG.MADT 
)

--NOT EXISTS--
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(
    SELECT *
FROM GIAOVIEN GV, BOMON BM, KHOA K
WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Sinh học' AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MADT =DT.MADT AND TG.MAGV =GV.MAGV
    )
)

--COUNT--
SELECT TENDT
FROM DETAI DT, THAMGIADT TG, GIAOVIEN GV, BOMON BM, KHOA K
WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Sinh học' AND TG.MAGV=GV.MAGV AND DT.MADT=TG.MADT
GROUP BY DT.MADT,DT.TENDT
HAVING COUNT(DISTINCT TG.MAGV)=(SELECT COUNT(MAGV)
FROM GIAOVIEN GV, BOMON BM, KHOA K
WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Sinh học' )

--Q71--
--EXCEPT--
SELECT GV.MAGV, HOTEN, NGSINH
FROM GIAOVIEN GV
WHERE NOT EXISTS(
                                                                                                                        SELECT CV.MADT, SOTT
    FROM CONGVIEC CV, DETAI DT
    WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Ứng dụng hóa học xanh'
EXCEPT
    SELECT TG.MADT, TG.STT
    FROM THAMGIADT TG
    WHERE GV.MAGV=TG.MAGV 
)

--NOT EXISTS--
SELECT GV.MAGV, HOTEN, NGSINH
FROM GIAOVIEN GV
WHERE NOT EXISTS(
    SELECT *
FROM CONGVIEC CV, DETAI DT
WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Ứng dụng hóa học xanh' AND NOT EXISTS(
        SELECT *
    FROM THAMGIADT TG
    WHERE TG.MAGV=GV.MAGV AND TG.MADT=CV.MADT AND TG.STT=CV.SOTT
    )
)

--COUNT--
SELECT GV.MAGV, HOTEN, NGSINH
FROM GIAOVIEN GV, THAMGIADT TG, DETAI DT, CONGVIEC CV
WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Ứng dụng hóa học xanh' AND TG.MAGV=GV.MAGV AND TG.MADT=CV.MADT AND TG.STT=CV.SOTT
GROUP BY GV.MAGV,GV.HOTEN,GV.NGSINH
HAVING COUNT(*) =(SELECT COUNT(*)
FROM CONGVIEC CV, DETAI DT
WHERE CV.MADT=DT.MADT AND DT.TENDT=N'Ứng dụng hóa học xanh')

--Q72--
--EXCEPT--
SELECT GV.MAGV, GV.HOTEN, BM.TENBM, GVQL.HOTEN AS [TEN GVQL]
FROM GIAOVIEN GV, GIAOVIEN GVQL, BOMON BM
WHERE GV.GVQLCM=GVQL.MAGV AND GV.MABM=BM.MABM AND NOT EXISTS(
                                                                                                                                                                                        SELECT MADT
        FROM DETAI DT, CHUDE CD
        WHERE DT.MACD=CD.MACD AND CD.TENCD=N'Nghiên cứu phát triển'
    EXCEPT
        SELECT MADT
        FROM THAMGIADT TG
        WHERE TG.MAGV=GV.MAGV
)

--NOT EXISTS--
SELECT GV.MAGV, GV.HOTEN, BM.TENBM, GVQL.HOTEN AS [TEN GVQL]
FROM GIAOVIEN GV, GIAOVIEN GVQL, BOMON BM
WHERE GV.GVQLCM=GVQL.MAGV AND GV.MABM=BM.MABM AND NOT EXISTS(
    SELECT *
    FROM DETAI DT, CHUDE CD
    WHERE DT.MACD=CD.MACD AND CD.TENCD=N'Nghiên cứu phát triển' AND NOT EXISTS(
        SELECT *
        FROM THAMGIADT TG
        WHERE TG.MAGV=GV.MAGV AND DT.MADT=TG.MADT
    )
)

--COUNT--
SELECT GV.MAGV, GV.HOTEN, BM.TENBM, GVQL.HOTEN AS [TEN GVQL]
FROM GIAOVIEN GV, THAMGIADT TG, DETAI DT, CHUDE CD, GIAOVIEN GVQL, BOMON BM
WHERE GV.GVQLCM=GVQL.MAGV AND GV.MABM=BM.MABM AND GV.MAGV=TG.MAGV AND DT.MACD=CD.MACD AND TG.MADT=DT.MADT AND CD.TENCD=N'Nghiên cứu phát triển'
GROUP BY GV.HOTEN,GV.MAGV,BM.TENBM,GVQL.HOTEN
HAVING COUNT(DISTINCT TG.MADT) =(SELECT COUNT(DISTINCT MADT)
FROM DETAI DT, CHUDE CD
WHERE DT.MACD=CD.MACD AND CD.TENCD=N'Nghiên cứu phát triển')


--Q73--
--COUNT--
SELECT GV.HOTEN, GV.NGSINH, K.TENKHOA, TK.HOTEN
FROM GIAOVIEN GV, GIAOVIEN NHA, THAMGIADT TG1, THAMGIADT TG2 , BOMON BM, KHOA K, GIAOVIEN TK
WHERE NHA.HOTEN=N'Nguyễn Hoài An' AND TG1.MAGV=NHA.MAGV AND TG1.MADT=TG2.MADT AND TG2.MAGV=GV.MAGV AND GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND TK.MAGV=K.TRUONGKHOA AND GV.MAGV<>NHA.MAGV
GROUP BY GV.HOTEN,GV.NGSINH,K.TENKHOA,TK.HOTEN
HAVING COUNT(DISTINCT TG2.MADT)=(SELECT COUNT(DISTINCT TG1.MADT))


--Q74--
--COUNT--
SELECT GV.HOTEN, GV.MAGV
FROM GIAOVIEN GV, (SELECT *
    FROM KHOA K
    WHERE K.TENKHOA=N'Công nghệ thông tin') CNTT,
    (SELECT BM.TRUONGBM, GV.MABM
    FROM GIAOVIEN GV, BOMON BM, KHOA K
    WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Công nghệ thông tin'
    GROUP BY GV.MABM,BM.TRUONGBM
    HAVING COUNT(*)>=ALL (SELECT COUNT(*)
    FROM GIAOVIEN GV, BOMON BM, KHOA K
    WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Công nghệ thông tin'
    GROUP BY GV.MAGV)) BMDN, BOMON BM, GIAOVIEN TBM, THAMGIADT TG, DETAI DT, CONGVIEC CV
WHERE GV.MABM=BM.MABM AND BM.MAKHOA=CNTT.MAKHOA AND TBM.MAGV=BMDN.TRUONGBM AND TBM.MAGV=DT.GVCNDT AND CV.MADT=DT.MADT AND GV.MAGV=TG.MAGV AND TG.STT=CV.SOTT AND TG.MADT=CV.MADT
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(*)=(SELECT COUNT(*)
FROM (SELECT BM.TRUONGBM, GV.MABM
    FROM GIAOVIEN GV, BOMON BM, KHOA K
    WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Công nghệ thông tin'
    GROUP BY GV.MABM,BM.TRUONGBM
    HAVING COUNT(*)>=ALL (SELECT COUNT(*)
    FROM GIAOVIEN GV, BOMON BM, KHOA K
    WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Công nghệ thông tin'
    GROUP BY GV.MAGV)) BMDN, BOMON BM, GIAOVIEN TBM, DETAI DT, CONGVIEC CV
WHERE TBM.MAGV=BMDN.TRUONGBM AND TBM.MAGV=DT.GVCNDT AND CV.MADT=DT.MADT)


