# plugname.admin.conf.php
<!-- BEGIN: MAIN -->
{PHP.TAG}
/* ====================
{MMP_PLBEGIN}
Hooks=admin.config.edit.loop
{MMP_PLEND}
==================== */

/**
 * Part for extend {MMP_PLUGTITLE} settings screen.
 *
{FILE "{PHP.snippets}/phpdoc.snippet.tpl"}
 */

(defined('{MMP_CODEMARK}') && defined('{MMP_SEDMARK}ADMIN')) or {FILE "{PHP.snippets}/die.snippet.tpl"}
$plug_name = '{MMP_PLUGNAME}';

$dem_cfg = $cfg['plugin'][$plug_name];
if ($config_cat==$plug_name && $config_type == 0) { // extending COT_CONFIG_TYPE_TEXT parameters

/*	$config_owner = $o;
	$config_cat = $p;
	$config_subcat = $row['config_subcat'];
	$config_name = $row['config_name'];
	$config_value = $row['config_value'];
	$config_default = $row['config_default'];
	$config_type = $row['config_type'];
	$config_title = $L['cfg_'.$config_name][0];
	$config_text = htmlspecialchars($row['config_text']);
	$config_more = $L['cfg_'.$config_name][1];
*/
	// $config_input = cot_textarea($config_name, $config_value, 8, 56, $attr);
/*	$config_input .= 'works!';
	$t->assign('ADMIN_CONFIG_ROW_CONFIG' ,$config_input);
*/
}

<!-- END: MAIN -->