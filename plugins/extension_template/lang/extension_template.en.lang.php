<?php
/**
 * Localization file for Extension template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2013
 * @license Distributed under BSD License.
 */

defined('COT_CODE') or die('Wrong URL');

$L['plu_title'] = 'Extension templates'; //
$plug_title = 'Extension template generator ';

$L['mplug_part'] = 'Section';
$L['mplug_stage1'] = 'Section 1: Main';
$L['mplug_stage2'] = 'Section 2: Misc';
$L['mplug_name'] = 'Plugin name';
$L['mplug_category'] = 'Plugin category';
$L['mplug_name2'] = '(with one word, required only A..Z letters and unerscore symbol )';
$L['mplug_lang'] = 'Create LANG files (2 file for ru,en)';

$L['mplug_main'] = 'Extension «standalone» file (plugin_name.php)';
$L['mplug_setup'] = 'Setup file (plugin_name.setup.php)';
$L['mplug_addon'] = 'Addition files';
$L['mplug_goto2'] = 'Create Extension template files';

$L['mplug_size'] = 'Total files size {$0} bytes';
$L['mplug_targetdir'] = 'Plugin files located in `{$0}` folder.';
$L['mplug_log'] = 'Wrote {$0} bytes in file <b>{$1}</b>';
$L['mplug_creating'] = 'Files creation log';
$L['mplug_err1'] = 'Error creating folder: {$1}';
$L['mplug_back'] = 'Back to configuration and creates another one template';
$L['mplug_params'] = 'Check Extension params';

$L['mplug_select'] = 'Select target version of CMF';
$L['mplug_folders'] = 'Make addition folder';
$L['mplug_subfolders'] = '(comma separated subfolders)';
$L['mplug_langdesc'] = '(comma separated lang codes, e.g.: ru,en)';
$L['mplug_common'] = 'Shared extension files ';

$L['mplug_mdfiles'] = 'Other files ';
$L['mplug_mddesc'] = 'Description file for plugin';
$L['mplug_mdvers'] = 'Сhanges log file';

$L['mplug_error'] = 'Error: ';
$L['mplug_nofolder'] = 'Error: Folder "{$folder}" not exists';
$L['mplug_nofile'] = 'Error: File "{$file}" not exists';
$L['mplug_newfolder'] = 'Creating new folder: {$1}';
$L['mplug_cantcreate'] = 'Error: Can not create Folder "{$folder}". Check write permission for it.';

$L['mplug_nojquery'] = 'Sorry, this extension works only with javascript enables and jQuery library. You can turn it on on <a href="'.cot_url('admin','m=config&n=edit&o=core&p=performance').'" title="Performance settings">settings page</a>.';

$L['mplug_wrongmode'] = 'Wrong Mode settings: ';

$L['info_desc'] ='Generates Extension files (template) for further development';

$L['cfg_author'] =array('Author of plugin');
$L['cfg_email'] =array('E-mail of author');
$L['cfg_licence'] =array('Licence type','you can change it in parameters while creating template');
$L['cfg_md_outside'] =array('Place *.md files outside plugin folder','if selected it will be places in `created` folder');


