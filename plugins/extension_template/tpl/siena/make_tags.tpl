# plugname.sometag.php
<!-- BEGIN: MAIN -->
{PHP.TAG}
/* ====================
{MMP_PLBEGIN}
Hooks=example.hook,example2.hook
Tags=index.tpl:{EXAMPLE_TAG},page.tpl:{EXAMPLE_TAG}
{MMP_PLEND}
==================== */

/**
 * {MMP_PLUGTITLE}
 *
{FILE "{PHP.snippets}/phpdoc.snippet.tpl"}
 */

defined('{MMP_CODEMARK}') or {FILE "{PHP.snippets}/die.snippet.tpl"}

$plug_name = '{MMP_PLUGNAME}';
$base_path = $cfg['plugins_dir']."/$plug_name";
//$inc_path  = "$base_path/inc";
//$js_path   = "$base_path/js";
//$tpl_path  = "$base_path/tpl";
//$ajax_link = "plug.php?r=$plug_name";
//$pl_cfg = $cfg['plugin'][$plug_name];

//require cot_incfile('{MMP_PLUGNAME}', 'plug', 'common');
//$t = new XTemplate(cot_tplfile('{MMP_PLUGNAME}', 'plug'));
//$t = new XTemplate(cot_tplfile('{MMP_PLUGNAME}.edit', 'plug'));


$plugin_body .= 'Plugin installed (file {MMP_PLUGFILE}).<br/>';


<!-- END: MAIN -->