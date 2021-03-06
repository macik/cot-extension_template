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

defined('COT_CODE') or header('HTTP/1.1 '.$m='403 Forbidden') . die($m);

if ($cfg['jquery'] && defined('COT_ADMIN') && $_GET['m']=='other' && $_GET['p']=='extension_template') {

	// if version of Cotonti < 0.9.8
	$rc_link_func = (version_compare($cfg['version'], '0.9.8') <= 0 || ($cfg['headrc_consolidate'] && $cache)) ? 'cot_rc_add_file' : 'cot_rc_link_footer';
}

cot_rc_add_file($cfg['plugins_dir'] . '/extension_template/tpl/extension_template.css');

