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
// adding Extrafield to pages
$field = array(
				'{MMP_PLUGNAME}_exf1',
				'field_type' => 'input',
				'field_html' => '<input type="text" name="{$name}" value="{$value}"  />',
				'field_variants' => '',
				'field_params' => '',
				'field_description' => '{MMP_PLUGNAME} extra field',
				'field_default' => '',
				'field_required' => true,
				'field_parse' => 'HTML',
				'field_noalter' => false,
				'field_enabled' => 1
);

if (cot_extrafield_add($db_x.'pages', $field['field_name'], $field['field_type'], $field['field_html'], $field['field_variants'], $field['field_default'], $field['field_required'], $field['field_parse'], $field['field_description'], $field['field_params'], $field['field_enabled'], $field['field_noalter']))
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