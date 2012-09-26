<!-- BEGIN: MAIN --><?PHP
/* ====================
{MMP_PLBEGIN}
Hooks=ajax
{MMP_PLEND}
==================== */

/**
 * {MMP_PLUGTITLE} Ajax interaction back-end
 *
 * @package {MMP_PLUGNAME}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}
 */

if (!defined('{MMP_CODEMARK}') && !defined('{MMP_SEDMARK}PLUG')) { die('{MMP_DIEMARK} ('.array_pop(explode("\\",__FILE__)).').'); }
// plug.php?r={MMP_PLUGNAME}
define('{MMP_PLUGNAME}_AJAX',TRUE);
$plug_name = '{MMP_PLUGNAME}';
$ajax_link = cot_url('plug',array('r'=>$plug_name));
list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', $r);
cot_block($usr['auth_read']);
require cot_incfile('{MMP_PLUGNAME}', 'plug', 'common');
require cot_langfile('{MMP_PLUGNAME}','plug');

header("Content-type: text/html; charset=utf-8");
if ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' || (strtolower($_SERVER['SERVER_NAME'])=='localhost') ) {
    echo 'Test result. AJAX query OK.';
} else {
    echo 'Test result. NaAQ (not an ajax query)';
}
?><!-- END: MAIN -->