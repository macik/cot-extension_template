<!-- BEGIN: MAIN --><?php
/**
 * Installs {MMP_PLUGTITLE} into other modules
 *
 * @package {MMP_PLUGNAME}
 * @author {MMP_AUTHOR_NAME}
 * @copyright {MMP_COPYRIGHT}
 * @license {MMP_LICENSE}
 */

defined('COT_CODE') or die('Wrong URL');

/*

global $cfg;

if (!defined('COT_UPGRADE')){
	if (!file_exists($cfg['cache_dir'] . '/{MMP_PLUGNAME}'))
	{
		@mkdir($cfg['cache_dir'] . '/{MMP_PLUGNAME}', $cfg['dir_perms'], true);
	}
}

require_once cot_incfile('extrafields');
require_once cot_langfile('{MMP_PLUGNAME}', 'plug');
cot::$db->registerTable('users');
cot_extrafields_register_table('users');

// adding Extrafield to pages
$ef = array(
				'name' => '{MMP_PLUGNAME}_exf1',
				'type' => 'input',
				'html' => '<input type="text" name="{$name}" value="{$value}"  />',
				'variants' => '',
				'params' => '',
				'description' => '{MMP_PLUGNAME} extra field',
				'default' => '',
				'required' => true,
				'parse' => 'HTML',
				'noalter' => false,
				'enabled' => 1
);

if (cot_extrafield_add(cot::$db->users, $ef['name'], $ef['type'], $ef['html'], $ef['variants'], $ef['default'], $ef['required'], $ef['parse'], $ef['description'], $ef['params'], $ef['enabled'], $ef['noalter']))
{
	cot_message('adm_extrafield_added');
}
else
{
	cot_error('adm_extrafield_not_added');
}
*/


// Modules list to implant into their root config
//$com_modules_list = array('polls');
// Module list to implant into their structure config
//$com_modules_struct_list = array('page');


/*// Add options into module configs
foreach ($com_modules_list as $mod_name){
  if (cot_extension_installed($mod_name) && !cot_config_implanted($mod_name, 'comments'))  {
    cot_config_implant($mod_name, $com_options, false, 'comments');
  }
}

// Add options into module structure configs
foreach ($com_modules_struct_list as $mod_name){
  if (cot_extension_installed($mod_name) && !cot_config_implanted($mod_name, 'comments'))  {
    cot_config_implant($mod_name, $com_options, true, 'comments');
  }
}
*/
<!-- END: MAIN -->