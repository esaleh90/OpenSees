*> \brief \b DLA_WWADDW adds a vector into a doubled-single vector.
*
*  =========== DOCUMENTATION ===========
*
* Online html documentation available at 
*            http://www.netlib.org/lapack/explore-html/ 
*
*> \htmlonly
*> Download DLA_WWADDW + dependencies 
*> <a href="http://www.netlib.org/cgi-bin/netlibfiles.tgz?format=tgz&filename=/lapack/lapack_routine/dla_wwaddw.f"> 
*> [TGZ]</a> 
*> <a href="http://www.netlib.org/cgi-bin/netlibfiles.zip?format=zip&filename=/lapack/lapack_routine/dla_wwaddw.f"> 
*> [ZIP]</a> 
*> <a href="http://www.netlib.org/cgi-bin/netlibfiles.txt?format=txt&filename=/lapack/lapack_routine/dla_wwaddw.f"> 
*> [TXT]</a>
*> \endhtmlonly 
*
*  Definition:
*  ===========
*
*       SUBROUTINE DLA_WWADDW( N, X, Y, W )
* 
*       .. Scalar Arguments ..
*       INTEGER            N
*       ..
*       .. Array Arguments ..
*       DOUBLE PRECISION   X( * ), Y( * ), W( * )
*       ..
*  
*
*> \par Purpose:
*  =============
*>
*> \verbatim
*>
*>    DLA_WWADDW adds a vector W into a doubled-single vector (X, Y).
*>
*>    This works for all extant IBM's hex and binary floating point
*>    arithmetics, but not for decimal.
*> \endverbatim
*
*  Arguments:
*  ==========
*
*> \param[in] N
*> \verbatim
*>          N is INTEGER
*>            The length of vectors X, Y, and W.
*> \endverbatim
*>
*> \param[in,out] X
*> \verbatim
*>          X is DOUBLE PRECISION array, dimension (N)
*>            The first part of the doubled-single accumulation vector.
*> \endverbatim
*>
*> \param[in,out] Y
*> \verbatim
*>          Y is DOUBLE PRECISION array, dimension (N)
*>            The second part of the doubled-single accumulation vector.
*> \endverbatim
*>
*> \param[in] W
*> \verbatim
*>          W is DOUBLE PRECISION array, dimension (N)
*>            The vector to be added.
*> \endverbatim
*
*  Authors:
*  ========
*
*> \author Univ. of Tennessee 
*> \author Univ. of California Berkeley 
*> \author Univ. of Colorado Denver 
*> \author NAG Ltd. 
*
*> \date September 2012
*
*> \ingroup doubleOTHERcomputational
*
*  =====================================================================
      SUBROUTINE DLA_WWADDW( N, X, Y, W )
*
*  -- LAPACK computational routine (version 3.4.2) --
*  -- LAPACK is a software package provided by Univ. of Tennessee,    --
*  -- Univ. of California Berkeley, Univ. of Colorado Denver and NAG Ltd..--
*     September 2012
*
*     .. Scalar Arguments ..
      INTEGER            N
*     ..
*     .. Array Arguments ..
      DOUBLE PRECISION   X( * ), Y( * ), W( * )
*     ..
*
*  =====================================================================
*
*     .. Local Scalars ..
      DOUBLE PRECISION   S
      INTEGER            I
*     ..
*     .. Executable Statements ..
*
      DO 10 I = 1, N
        S = X(I) + W(I)
        S = (S + S) - S
        Y(I) = ((X(I) - S) + W(I)) + Y(I)
        X(I) = S
 10   CONTINUE
      RETURN
      END