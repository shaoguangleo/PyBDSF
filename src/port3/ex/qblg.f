C$TEST QBLG
C TO RUN AS A MAIN PROGRAM REMOVE NEXT LINE
      SUBROUTINE QBLG
C***********************************************************************
C
C  EXAMPLE OF USE OF THE PORT PROGRAM QUAD
C
C***********************************************************************
      EXTERNAL F
      COMMON /COUNTS/NMEVAL
      INTEGER NMEVAL,IWRITE,I1MACH
      REAL ERROR,RESULT
C
C  INITIALIZE COUNT TO ZERO
      NMEVAL = 0
C
      CALL QUAD(F, 0.0, 1.0, 1.0E-4, RESULT, ERROR)
C
      IWRITE = I1MACH(2)
      WRITE (IWRITE, 10)
   10 FORMAT(11X, 48H THE INTEGRAL OF X**0.5(LOGX) BETWEEN 0 AND 1 IS)
      WRITE (IWRITE, 20) RESULT, ERROR
   20 FORMAT(1H0,10X, E15.7, 21H WITH ESTIMATED ERROR, 1PE9.2)
      WRITE (IWRITE, 30) NMEVAL
   30 FORMAT(1H0, 14X,1H(,I2,38H FUNCTION EVALUATIONS WERE REQUIRED TO
     1      /17X, 26H   PERFORM THE QUADRATURE) )
      STOP
      END
      REAL FUNCTION F(X)
      COMMON /COUNTS/NMEVAL
      INTEGER NMEVAL
      REAL X
C
C  COMPUTE THE INTEGRAND
      F = 0.0
      IF (X .NE. 0.0) F = SQRT(X)*ALOG(X)
C
C  COUNT THE NUMBER OF TIMES F WAS CALLED
      NMEVAL = NMEVAL + 1
      RETURN
      END
