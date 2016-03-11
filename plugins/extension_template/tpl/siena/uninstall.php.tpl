# setup/plugname.uninstall.php
<!-- BEGIN: MAIN -->
{PHP.TAG}
 /**
 * Removes all implanted configs
 *
{FILE "{PHP.cfg.plugins_dir}/{PHP.this}/tpl/siena/snippets/phpdoc.snippet.tpl"}
 */

defined('{MMP_CODEMARK}') or {FILE "{PHP.snippets}/die.snippet.tpl"}

global $L;

/*
require_once cot_incfile('extrafields');
require_once cot_langfile('{MMP_PLUGNAME}', 'plug');
cot::$db->registerTable('users');

// deleting extrafield from pages
if (cot_extrafield_remove(cot::$db->users,'{MMP_PLUGNAME}_exf1'))
{
	cot_message('adm_extrafield_removed');
}
else
{
	cot_error('adm_extrafield_not_removed');
}
*/

//global $db, $db_config;
//$db->delete($db_config, "config_donor = '{MMP_PLUGNAME}'");

<!-- END: MAIN -->