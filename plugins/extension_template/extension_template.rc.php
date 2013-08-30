<?php
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
 * @copyright Copyright (c) 2008-2013
 * @license Distributed under BSD License.
 */

if (!defined('COT_CODE') && !defined('COT_PLUG')) { die('Wrong URL ('.array_pop(explode("\\",__FILE__)).').'); }

if ($cfg['jquery'] && defined('COT_ADMIN') && $_GET['m']=='other' && $_GET['p']=='extension_template') {

	$rc_link_func = 'cot_rc_link_footer';
	// tracks default Admin template without {FOOTER_RC} tag
	// if version of Cotonti < 0.9.8
	if (version_compare($cfg['version'], '0.9.8') < 0 ) {
		$rc_link_func = 'cot_rc_add_file';
	}

}

cot_rc_add_file($cfg['plugins_dir'] . '/extension_template/tpl/extension_template.css');

