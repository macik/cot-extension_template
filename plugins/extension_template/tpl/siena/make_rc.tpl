<!-- BEGIN: MAIN --><?PHP
/* ====================
{MMP_PLBEGIN}
Hooks=rc
{MMP_PLEND}
==================== */

/**
 * Header file for {MMP_PLUGTITLE} plugin
 *
 * @package {MMP_PLUGNAME}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}
 */

if (!defined('{MMP_CODEMARK}') && !defined('{MMP_SEDMARK}PLUG')) { die('{MMP_DIEMARK} ('.array_pop(explode("\\",__FILE__)).').'); }

global $pl_cfg;
$pl_cfg = $cfg['plugin']['{MMP_PLUGNAME}'];

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

?><!-- END: MAIN -->