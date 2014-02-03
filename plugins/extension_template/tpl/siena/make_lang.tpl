<!-- BEGIN: MAIN --><?php
/**
 * Localization file for {MMP_PLUGTITLE}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}
 * Made with «Extension Template» (https://github.com/macik/cot-extension_template)
*/

defined('COT_CODE') or die('Wrong URL');

$L['plu_title'] = '{MMP_PLUGTITLE}'; // Title for stand alone

$L['info_desc'] ='{MMP_PLUGDESC}'; // plugin description
if (version_compare($cfg['version'], '0.9.12') > 0) // still buggy in Siena 0.9.12
	$L['info_notes'] = '{MMP_NOTES}'; 

$L['cfg_VAR'] =array('Param name','description'); // cfg l10n
$L['cfg_VAR_params'] = array(1,2,3);

// $L[$extrafield['field_name'] . '_' . $var  пример $L['extrafieldname_1']

$adminhelp1 = '';

<!-- END: MAIN -->