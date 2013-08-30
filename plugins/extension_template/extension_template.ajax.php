<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=ajax
[END_COT_EXT]
==================== */

/**
 * Ajax file for Extension template plugin
 *
 * @package extension_template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2013
 * @license Distributed under BSD License.
 */

if (!defined('COT_CODE') && !defined('COT_PLUG')) { die('Wrong URL'); }

define('extension_template_AJAX',TRUE);
$plug_name = 'extension_template';
$ajax_link = cot_url('plug',array('r'=>$plug_name));
list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', $r);
cot_block($usr['isadmin']);

header("Content-type: text/html; charset=utf-8");
if ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' || (strtolower($_SERVER['SERVER_NAME'])=='localhost') ) {
	if ($mode) {
		require_once cot_incfile($plug_name, 'plug');
		$count =0;
		foreach ($tpl_arr as $k => $v) { // отрисовка форм параметров
			$count++;
			$in['num']=$count;
			$in['val']=$v;
			$in['text']= (in_array($k,$bold_tag)) ? "<b>$k</b>" : $k;
			$tpl -> assign('in',$in);
			$tpl->parse('PRM.INPUT_PRM');
		}
		$tpl->parse('PRM');
		echo $tpl->text('PRM');
	} else {
		echo '';
	}
} else {
    echo 'Test result. NaAQ (not an ajax query)';
}
