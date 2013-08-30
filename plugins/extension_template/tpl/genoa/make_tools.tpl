<!-- BEGIN: MAIN --><?php
/* ====================
{MMP_COPYRIGHT}, {MMP_AUTHOR_NAME}
All rights reserved. {MMP_LICENSE}

{MMP_PBEGIN}
Code={MMP_PLUGNAME}
Part={MMP_PLUGPART}
File={MMP_PLUGFILE}
Hooks=tools
Order={MMP_PLUGORDER}
{MMP_PEND}
==================== */

/**
 * Administration panel - {MMP_PLUGTITLE}
 * @package Cotonti
 */

defined('{MMP_CODEMARK}') or die('Wrong URL.');

$plug_name = '{MMP_PLUGNAME}';
$base_path = $cfg['plugins_dir']."/$plug_name";

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = sed_auth('plug', $plug_name);
sed_block($usr['isadmin']);

$adminhelp = $L['plu_help_comments'];

$plugin_body .= 'Admin part of {MMP_PLUGFILE}.<br/>';

// addition code goes here....

?><!-- END: MAIN -->