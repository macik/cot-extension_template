Code={MMP_PLUGNAME}
Name=<!-- IF {MMP_PLUGTITLE} -->{MMP_PLUGTITLE}<!-- ELSE -->{MMP_PLUGNAME}<!-- ENDIF -->
<!-- IF {PHP.plf.ext_cat} -->Category={PHP.plf.ext_cat}<!-- ENDIF -->
Description={MMP_PLUGDESC}
Version=<!-- IF {MMP_VERSION} -->{MMP_VERSION}<!-- ELSE -->0.1.0<!-- ENDIF -->
Date=<!-- IF {MMP_PLUGDATE} -->{MMP_PLUGDATE}<!-- ELSE -->{PHP|date("Y-M-d")}<!-- ENDIF -->
Author=<!-- IF {MMP_AUTHOR_NAME} -->{MMP_AUTHOR_NAME}<!-- ELSE -->John Doe<!-- ENDIF -->
Copyright=<!-- IF {MMP_COPYRIGHT} -->{MMP_COPYRIGHT}<!-- ENDIF --><!-- IF {MMP_AUTHOR_NAME} -->, {MMP_AUTHOR_NAME}<!-- ENDIF -->
Notes={MMP_NOTES}
Auth_guests={MMP_AUTHG}
Lock_guests={MMP_LOCKG}
Auth_members={MMP_AUTHM}
Lock_members={MMP_LOCKM}
Requires=<!-- IF {MMP_REQ_VERSION}  -->{MMP_REQ_VERSION} <!-- ENDIF -->
Recommends_plugins=
Requires_modules=
Requires_plugins=<!-- IF {MMP_REQUIRES_PLUG} -->{MMP_REQUIRES_PLUG}<!-- ENDIF -->
