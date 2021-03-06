/* ****************************************************************** **
**    OpenSees - Open System for Earthquake Engineering Simulation    **
**          Pacific Earthquake Engineering Research Center            **
**                                                                    **
**                                                                    **
** (C) Copyright 2001, The Regents of the University of California    **
** All Rights Reserved.                                               **
**                                                                    **
** Commercial use of this program without express permission of the   **
** University of California, Berkeley, is strictly prohibited.  See   **
** file 'COPYRIGHT'  in main directory for information on usage and   **
** redistribution,  and for a DISCLAIMER OF ALL WARRANTIES.           **
**                                                                    **
** Developed by:                                                      **
**   Frank McKenna (fmckenna@ce.berkeley.edu)                         **
**   Gregory L. Fenves (fenves@ce.berkeley.edu)                       **
**   Filip C. Filippou (filippou@ce.berkeley.edu)                     **
**                                                                    **
** Reliability module developed by:                                   **
**   Terje Haukaas (haukaas@ce.berkeley.edu)                          **
**   Armen Der Kiureghian (adk@ce.berkeley.edu)                       **
**                                                                    **
** ****************************************************************** */

// $Revision: 1.1 $
// $Date: 2008-02-29 19:43:53 $
// $Source: /usr/local/cvs/OpenSees/SRC/reliability/analysis/telm/InitialStaticAnalysis.h,v $
                                                                     


#ifndef InitialStaticAnalsysis_h
#define InitialStaticAnalsysis_h

#include <ReliabilityDomain.h>
#include <TaggedObjectStorage.h>
#include <Domain.h>
#include <fstream>
#include <iomanip>
#include <iostream>

using std::ifstream;
using std::ofstream;
using std::ios;
using std::setw;
using std::setprecision;

class InitialStaticAnalysis
{
public:
	InitialStaticAnalysis(ReliabilityDomain*, Domain*, bool);
	virtual ~InitialStaticAnalysis();
	virtual void activateSensitivity(void)=0;
	virtual void inactivateSensitivity(void)=0;
	virtual void analyze(Vector x=0)=0;
	virtual void analyzeMean(void)=0;
	virtual void constLoads(double)=0;
	virtual void resetconstLoads(double)=0;
	virtual void recoverLoads(void)=0;
	virtual void constandrecoverLoads(double)=0;
	void printResult(void);

protected:
	ReliabilityDomain*	theReliabilityDomain;
	ofstream output;
	void printSelected(void);
	Domain* theDomain;
	bool print;

private:

};

#endif
