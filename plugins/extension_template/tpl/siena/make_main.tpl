<!-- BEGIN: MAIN --><?PHP
/* ====================
{MMP_PLBEGIN}
Hooks=standalone
Tags=example.tpl:{EXAMPLE_TAG}
{MMP_PLEND}
==================== */

/**
 * {MMP_PLUGTITLE}
 *
 * @package {MMP_PLUGNAME}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}
 */

if (!defined('{MMP_CODEMARK}') && !defined('{MMP_SEDMARK}PLUG')) { die('{MMP_DIEMARK} ('.array_pop(explode("\\",__FILE__)).').'); }
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


?><!-- END: MAIN -->