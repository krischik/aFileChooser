::#!
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: {{{1 :::::::^::::
:: Copyright © 2013 Martin Krischik
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: $Author$
:: $Revision$
:: $Date$
:: $Id$
:: $HeadURL$
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }}}1 :::::::::::
@ECHO OFF

SETLOCAL
    SET PATH=%PATH%;C:\opt\Git\bin
    SET PATH=%PATH%;C:\opt\Scala\2.10.0\bin
    SET Scala_Library="${WORK}/Repositories/Local/net/sourceforge/uiq3/Calculator-Script/${CALCULATOR_VERSION}/Calculator-Script-${CALCULATOR_VERSION}.jar"

    PUSHD "AndroidAnnotations"
	CALL scala -classpath %Scala_Library% -save ..\Maven-Deploy.cm %*
    POPD
ENDLOCAL

GOTO :eof
::!#

import scala.sys.process._
import net.sourceforge.uiq3.Maven.mvn
import net.sourceforge.uiq3.Shell.Err_Exit_Call

val Maven_Deploy = System.getenv ("MAVEN_DEPLOY")
val Project_Name = System.getenv ("PROJECT_NAME")
val Maven_Name	 = Project_Name +" Maven Repository"

Err_Exit_Call (mvn :::
    "versions:display-plugin-updates" ::
    "versions:display-dependency-updates" ::
    "versions:display-property-updates" ::
    Nil )

// vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
// vim: set textwidth=0 filetype=scala foldmethod=marker nospell :
