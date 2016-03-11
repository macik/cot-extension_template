# plugname.rc.php
<!-- BEGIN: MAIN -->
{PHP.TAG}
/* ====================
{MMP_PLBEGIN}
Hooks=rc
{MMP_PLEND}
==================== */

/**
 * Header file for {MMP_PLUGTITLE} plugin
 *
{FILE "{PHP.snippets}/phpdoc.snippet.tpl"}
 */

defined('{MMP_CODEMARK}') or {FILE "{PHP.snippets}/die.snippet.tpl"}

global $pl_cfg;
$pl_cfg = $cfg['plugin']['{MMP_PLUGNAME}'];

/*
if ($_GET['e']=='{MMP_PLUGNAME}') {
    define('PLUGMARK',true);
    // cot_rc_add_file($cfg['plugins_dir'] . '/{MMP_PLUGNAME}/tpl/{MMP_PLUGNAME}.css');
    // cot_rc_add_file($cfg['plugins_dir'] . '/{MMP_PLUGNAME}/js/{MMP_PLUGNAME}.js');
    // cot_rc_add_file($cfg['plugins_dir'] . '/{MMP_PLUGNAME}/lib/jquery.sample.min.js');
}

if ($cfg['jquery'] && $cfg['turnajax']){
    // cot_rc_add_file($cfg['plugins_dir'] . '/{MMP_PLUGNAME}/lib/jquery.sample.css');
    // cot_rc_add_embed('autocomplete', '$(document).ready(function(){ alert('ok');});');
} else {

}
*/

<!-- END: MAIN -->