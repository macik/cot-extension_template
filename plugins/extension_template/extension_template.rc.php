<?PHP
/* ====================
[BEGIN_COT_EXT]
Hooks=rc
[END_COT_EXT]
==================== */

/**
 * Header file for Extension template plugin
 *
 * @package extension_template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2012
 * @license Distributed under BSD License.
 */

if (!defined('COT_CODE') && !defined('COT_PLUG')) { die('Wrong URL ('.array_pop(explode("\\",__FILE__)).').'); }

if ($cfg['jquery'] && defined('COT_ADMIN') && $_GET['m']=='other' && $_GET['p']=='extension_template') {

	$rc_link_func = 'cot_rc_link_footer';
	$version = str_replace('.','',$cfg['version']);
	// tracks template without {FOOTER_RC} tag
	if ($version<98) {
		$rc_link_func = 'cot_rc_add_file';
	}

    $rc_link_func('./js/jquery_ui/jquery-ui-1.8.23.full.min.js');
    cot_rc_add_file('./js/jquery_ui/css/redmond/jquery-ui-1.8.23.full.css');
    cot_rc_add_file($cfg['plugins_dir'] . '/extension_template/tpl/extension_template.css');
}


?>