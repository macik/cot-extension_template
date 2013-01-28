<!-- BEGIN: MAIN --><?php
/* ====================
{MMP_PLBEGIN}
Hooks=tools
{MMP_PLEND}
==================== */

/**
 * Administration panel for {MMP_PLUGTITLE}
 *
 * @package {MMP_PLUGNAME}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}
 * Made with «Extension Template» (https://github.com/macik/cot-extension_template)
 */

(defined('{MMP_CODEMARK}') && defined('{MMP_SEDMARK}ADMIN')) or die('Wrong URL.');

$plug_name = '{MMP_PLUGNAME}';
$base_path = $cfg['plugins_dir']."/$plug_name";

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', $plug_name);
cot_block($usr['isadmin']);

$adminhelp = $L['plu_help_comments'];

$plugin_body .= 'Admin part of {MMP_PLUGFILE}.<br/>';

// addition code goes here....

?><!-- END: MAIN -->