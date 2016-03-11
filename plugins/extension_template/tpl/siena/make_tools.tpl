# plugname.tools.php
<!-- BEGIN: MAIN -->
{PHP.TAG}
/* ====================
{MMP_PLBEGIN}
Hooks=tools
{MMP_PLEND}
==================== */

/**
 * Administration panel for {MMP_PLUGTITLE}
 *
{FILE "{PHP.snippets}/phpdoc.snippet.tpl"}
 */

(defined('{MMP_CODEMARK}') && defined('{MMP_SEDMARK}ADMIN')) or {FILE "{PHP.snippets}/die.snippet.tpl"}

/*
$plug_name = '{MMP_PLUGNAME}';
$base_path = $cfg['plugins_dir']."/$plug_name";

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', $plug_name);
cot_block($usr['isadmin']);

$adminhelp = $L['plu_help_{MMP_PLUGNAME}'];
*/

$plugin_body .= 'Admin part of {MMP_PLUGFILE}.<br/>';

// addition code goes here....

<!-- END: MAIN -->