# plugname.php
<!-- BEGIN: MAIN -->
{PHP.TAG}
/* ====================
{MMP_PLBEGIN}
Hooks=standalone
Tags=example.tpl:{EXAMPLE_TAG}
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

//require cot_incfile('{MMP_PLUGNAME}', 'plug', 'common');
//$t = new XTemplate(cot_tplfile('{MMP_PLUGNAME}', 'plug'));

$plugin_body .= 'Plugin installed (file {MMP_PLUGFILE}).<br/>';


<!-- END: MAIN -->