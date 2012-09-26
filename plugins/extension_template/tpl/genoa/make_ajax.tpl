<!-- BEGIN: MAIN --><?PHP
/* ====================
{MMP_COPYRIGHT}, {MMP_AUTHOR_NAME}
All rights reserved. {MMP_LICENSE}

{MMP_PBEGIN}
Code={MMP_PLUGNAME}
Part={MMP_PLUGPART}
File={MMP_PLUGFILE}
Hooks=ajax
Order={MMP_PLUGORDER}
{MMP_PEND}
==================== */

if (!defined('{MMP_CODEMARK}') && defined('SED_AJAX')) { die('{MMP_DIEMARK} ('.array_pop(explode("\\",__FILE__)).').'); }
define('{MMP_PLUGNAME}_AJAX',TRUE);
$plug_name = '{MMP_PLUGNAME}';
$base_path = $cfg['plugins_dir']."/$plug_name ";
$pl_cfg = $cfg['plugin'][$plug_name];

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = sed_auth('plug', $r);
sed_block($usr['auth_read']);

$lang_file = "$base_path/lang/$plug_mark.$lang.lang.php";
$lang_file_def = "$base_path/lang/$plug_mark.ru.lang.php";
switch (strtolower($lang)) {
    case 'ru':
    case 'en': if (file_exists($lang_file)) {$file_to_load = $lang_file;} else {$file_to_load = $lang_file_def;}
        break;
    default: $file_to_load = $lang_file_def;
        break;
}
if (file_exists($file_to_load)) {require_once($file_to_load);}

header("Content-type: text/html; charset=utf-8");
if ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') {
    echo 'Test result. AJAX query OK.';
} else {
    echo 'Test result. NaAQ (not an ajax query)';
}
?><!-- END: MAIN -->