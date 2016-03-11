# plugname.ajax.php
<!-- BEGIN: MAIN -->
{PHP.TAG}
/* ====================
{MMP_PLBEGIN}
Hooks=ajax
{MMP_PLEND}
==================== */

/**
 * {MMP_PLUGTITLE} Ajax interaction back-end
 *
{FILE "{PHP.snippets}/phpdoc.snippet.tpl"}
 */

defined('{MMP_CODEMARK}') or {FILE "{PHP.snippets}/die.snippet.tpl"}

// plug.php?r={MMP_PLUGNAME}
define('{MMP_PLUGNAME}_AJAX',TRUE);
$plug_name = '{MMP_PLUGNAME}';
$ajax_link = cot_url('plug',array('r'=>$plug_name));
list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', $r);
cot_block($usr['auth_read']);
//require cot_incfile('{MMP_PLUGNAME}', 'plug', 'common');

//header("Content-type: text/html; charset=utf-8");
header("Content-type: application/json; charset=utf-8");
if ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' || (strtolower($_SERVER['SERVER_NAME'])=='localhost') ) {
    echo 'Test result. AJAX query OK.';
} else {
    echo 'Test result. NaAQ (not an ajax query)';
}
<!-- END: MAIN -->