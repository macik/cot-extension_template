<!-- BEGIN: MAIN --><?PHP
/* ====================
{MMP_PLBEGIN}
Code={MMP_PLUGNAME}
Name={MMP_PLUGTITLE}
Description={MMP_PLUGDESC}
Version={MMP_VERSION}
Date={MMP_PLUGDATE}
Author={MMP_AUTHOR_NAME}
Copyright={MMP_COPYRIGHT}, {MMP_AUTHOR_NAME}
Notes={MMP_NOTES}
Auth_guests={MMP_AUTHG}
Lock_guests={MMP_LOCKG}
Auth_members={MMP_AUTHM}
Lock_members={MMP_LOCKM}
{MMP_PLEND}

{MMP_PBEGIN}
{MMP_PEND}
==================== */

/**
 * {MMP_PLUGTITLE} plugin for Cotonti CMF
 *
 * @package {MMP_PLUGNAME}
 * @version {MMP_VERSION}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}

<!-- BEGIN: CONF_VAR -->
var1=11:select:0,1,2,3,4,5,6:3:Description
var2=12:radio:0,1:1:Enable this
var3=13:string::test:Test string
var4=14:callback:cot_get_editors():markitup:Simple callback
var5=15:separator:::Separator
var6=16:range:0,5:1:Range
var7=17:text:0,5:1,2:Text
<!-- END: CONF_VAR -->

 */

if (!defined('{MMP_CODEMARK}')) { die('{MMP_DIEMARK} ('.array_pop(explode("\\",__FILE__)).').'); }


?><!-- END: MAIN -->