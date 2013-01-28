<!-- BEGIN: MAIN --><?php
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
Recommends_modules=
Recommends_plugins=
Requires_modules=
Requires_plugins=
{MMP_PLEND}

{MMP_PBEGIN}
{MMP_PEND}
==================== */

/**
 * {MMP_PLUGTITLE} plugin for Cotonti CMF
 *
 * @package {MMP_PLUGNAME}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}
 * Made with «Extension Template» (https://github.com/macik/cot-extension_template)

<!-- BEGIN: CONF_VAR -->
 *
Allowed Var types:
var1=11:select:0,1,2,3,4,5,6:3:Description
var2=12:radio:0,1:1:Enable this
var3=13:string::test:Test string
var4=14:callback:cot_get_editors():markitup:Simple callback
var5=15:separator:::Separator
var6=16:range:0,5:1:Range
var7=17:text:0,5:1,2:Text
var8=18:custom:user_func():def_value:Description
<!-- END: CONF_VAR -->
 *
 */

defined('{MMP_CODEMARK}') or die('Wrong URL.');


?><!-- END: MAIN -->