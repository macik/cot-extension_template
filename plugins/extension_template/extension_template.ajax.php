<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=ajax
[END_COT_EXT]
==================== */

/**
 * Ajax requests processing for Extension template plugin
 *
 * @package extension_template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2012
 * @license Distributed under BSD License.
 */

if (!defined('COT_CODE') && !defined('COT_PLUG')) { die('Wrong URL ('.array_pop(explode("\\",__FILE__)).').'); }

$plug_name = 'extension_template';
//$base = './plugins/';

header("Content-type: text/html; charset=utf-8");
if ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') {
	$ajax_link = "plug.php?r=$plug_name";

	require_once cot_incfile($plug_name, 'plug');

	$count = 0;
	foreach ($tpl_arr as $k => $v) { // makes form
		$count++;
		$in['num']=$count;
		$in['val']=$v;
		$in['text']= (in_array($k,$bold_tag)) ? "<b>$k</b>" : $k;
		$tpl -> assign('in',$in);
		$tpl->parse('PRM.INPUT_PRM');
	}
	$tpl->parse('PRM');

	echo $tpl->text('PRM');
	exit;
} else {
	echo 'Test result. NaAQ (not an ajax query)';
}



?>