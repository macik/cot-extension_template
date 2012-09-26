<!-- BEGIN: MAIN --><?PHP
/* ====================
{MMP_COPYRIGHT}, {MMP_AUTHOR_NAME}
All rights reserved. {MMP_LICENSE}

{MMP_PBEGIN}
Code={MMP_PLUGNAME}
Part={MMP_PLUGPART}
File={MMP_PLUGFILE}
Hooks=standalone
Tags=example.tpl:{EXAMPLE_TAG}
Order={MMP_PLUGORDER}
{MMP_PEND}
==================== */
if (!defined('{MMP_CODEMARK}')) { die('{MMP_DIEMARK} ('.array_pop(explode("\\",__FILE__)).').'); }
$plug_name = '{MMP_PLUGNAME}';
$base_path = $cfg['plugins_dir']."/$plug_name";
//$inc_path  = "$base_path/inc";
//$js_path   = "$base_path/js";
//$tpl_path  = "$base_path/tpl";
//$ajax_link = "plug.php?r=$plug_name";
//$pl_cfg = $cfg['plugin'][$plug_name];

$plugin_body .= 'Plugin installed (file {MMP_PLUGFILE}).<br/>';


?><!-- END: MAIN -->