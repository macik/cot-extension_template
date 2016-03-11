<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=tools
[END_COT_EXT]
==================== */

/**
 * Administration panel for Extension template
 *
 * @package extension_template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2013
 * @license Distributed under BSD License.
 */

defined('COT_CODE') or header('HTTP/1.1 '.$m='403 Forbidden') . die($m);

/*
 * TODO: Extended plugin
*  ? save settings as profiles
*  + add Forbidden ext names list
*  + add controls to set setup file variables
*  + add support to make modules
*  + add links to add addition parts (ajax, tools, rc)
*  + close accordion on «generate» press
*
* DONE:
*  + add output total size of all files
 * + do not clear setting after plugin created
 * + fix Siena/Genao mode switching
*  + added LOG view without settings reset
*  + add support for Bootstrap themes accordion support (Foster theme and Bootstrap theme)
*  + add support for Priori support
*  + refactoring
*  + add cot_import
*  + add custom part creating with using hook name parsed from filename
*  + add sample plugin icon
*  + make default CSS and TPL file creation on TPL folder
*  + added sample markdown files for readme and versions
*  + design structure table on creation LOG page
*
**/

$plug_name = 'extension_template';
$base_path = $cfg['plugins_dir']."/$plug_name";
$ext_name_re = '/[^a-z0-9_\-]+/i';

switch ($cfg['admintheme']) {
	case 'foster':
	case 'bootstrap':
		$et_thememode = 1;
		break;
	case 'priori':
		$et_thememode = 2;
		break;
}

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', $plug_name);
cot_block($usr['isadmin']);

$scriptname = cot_url('admin','m=other&p=extension_template');

$base_path = $cfg['plugins_dir']."/$plug_name";
$snippets = $cfg['plugins_dir'].'/extension_template/tpl/siena/snippets';
$inc_path  = "$base_path/inc";
$tpl_path  = "$base_path/tpl";

$TAG = '<?php';
$ajax_link = (function_exists('cot_url')) ? cot_url('index',"r=$plug_name") : "plug.php?r=$plug_name";
$et_cfg = $cfg['plugin'][$plug_name];
//XTemplate::init(false); // debug only
require_once cot_incfile($plug_name, 'plug');

$forbidden_module_names = array(
'mysqlport', 'mysqldb', 'mysqlcharset', 'mysqlcollate', 'mainurl',
'multihost', 'site_id', 'secret_key', 'defaulttheme', 'defaultscheme',
'defaulticons', 'defaultlang', 'enablecustomhf', 'cache', 'cache_drv',
'xtpl_cache', 'cache_index', 'cache_page', 'cache_forums', 'check_updates',
'display_errors', 'redirmode', 'xmlclient', 'ipcheck', 'authcache',
'customfuncs', 'new_install', 'avatars_dir', 'cache_dir', 'lang_dir',
'modules_dir', 'pfs_dir', 'photos_dir', 'plugins_dir', 'system_dir',
'thumbs_dir', 'themes_dir', 'extrafield_files_dir', 'icons_dir', 'dir_perms',
'file_perms', 'debug_mode', 'debug_logpath', 'shield_force',
'useremailduplicate', 'version', 'dbversion', 'forcedefaultlang',
'defaulttimezone', 'adminemail', 'clustermode', 'hostip', 'maintenance',
'maintenancereason', 'devmode', 'parser', 'redirbkonlogin', 'redirbkonlogout',
'maxrowsperpage', 'easypagenav', 'confirmlinks', 'jquery', 'turnajax',
'topline', 'banner', 'bottomline', 'menu1', 'menu2', 'menu3', 'menu4',
'menu5', 'menu6', 'menu7', 'menu8', 'menu9', 'freetext1', 'freetext2',
'freetext3', 'freetext4', 'freetext5', 'freetext6', 'freetext7', 'freetext8',
'freetext9', 'gzip', 'headrc_consolidate', 'headrc_minify', 'jquery_cdn',
'cookiedomain', 'cookiepath', 'cookielifetime', 'captchamain',
'captcharandom', 'forcedefaulttheme', 'homebreadcrumb', 'separator',
'disablesysinfos', 'keepcrbottom', 'showsqlstats', 'msg_separate',
'maintitle', 'subtitle', 'metakeywords', 'title_users_details',
'title_header', 'title_header_index', 'subject_mail', 'body_mail',
'forcerememberme', 'timedout', 'plugin', 'referercheck', 'shieldzhammer',
'shieldtadjust', 'shieldenabled', 'hashfunc', 'default_show_installed',
	);
$forbidden_plugin_names = array(
	''
);


switch ($a) {
	case 'step2': // generates files with given params
		$log_tpl = new XTemplate(cot_tplfile($plug_name, 'plug'));

		$keys = array_keys($tpl_arr);
		foreach ($_POST as $k => $v) { // gets all params starts with PRM
			if (substr($k,0,3)=='prm') {
				// need some escape magic for NOTE parameter (ID:#12)
				$val = cot_import($k,'P',($k == 'prm_12') ? 'HTM' : 'TXT');
				if ($k == 'prm_12') $val = str_replace("'","\'",$val);
				$tpl_arr[$keys[substr($k,4)-1]] = $val;
			}
		}
		$plf = cot_import('plf','P','ARR');//$_POST['plf'];
		$tpl_arr['MMP_PLUGNAME'] = preg_replace($ext_name_re, '', $tpl_arr['MMP_PLUGNAME']);
		$base_folder = $et_cfg['outputdir'] ? $et_cfg['outputdir'] : $cfg['plugins_dir']."/$plug_name/created/";
		$base_folder = str_replace('\\','/',$base_folder);
		$base_folder .= $base_folder[strlen($base_folder)-1]=='/' ? '' : '/';
		$main_folder = $base_folder.$tpl_arr['MMP_PLUGNAME'].'/'; // for ex. plugins/extension_template/created/plugname/

		if (checkDir($main_folder)) { // makes Extension base folder
			// copying plugin sample icon
			$source = $cfg['plugins_dir']."/$plug_name/img/icon.png";
			$target = $main_folder.$tpl_arr['MMP_PLUGNAME'].'.png';
			if ($mode=='siena') copyFile($source, $target);

			if ( $plf['makedirs']) { // if subfolders needed // $mode=='siena' &&
				$dirs = explode(',',$plf['dirsname']);
/*				if ($mode=='cot') {  проверить назначение
					array_push($dirs,'setup');
				}  */
				$dirs = array_unique($dirs);
				foreach ($dirs as $dirname) {
					if (checkDir($main_folder.$dirname)) {
						$source_folder = $cfg['plugins_dir']."/$plug_name/tpl/$mode/$dirname/";
						//toLog(cot_rc($L['mplug_newfolder'],array(1=>$dirname)));
						if ($dirname == 'tpl') {
							if ($mode=='siena') {
								// copying css file
								$source = $source_folder.'make.css';
								$target = "$main_folder$dirname/{$tpl_arr['MMP_PLUGNAME']}.css";
								copyFile($source, $target);
								// copying tpl sample file
								$source = $cfg['plugins_dir']."/$plug_name/tpl/$mode/tpl/make.tpl";
								$target = "$main_folder$dirname/{$tpl_arr['MMP_PLUGNAME']}.tpl";
								copyFile($source, $target, "# main TPL file for {$tpl_arr['MMP_PLUGTITLE']} plugin\n");
							}
						}
					} else {
						toLog(cot_rc('mplug_cantcreate',array(1=>$main_folder.$dirname)));
					}
				}
			}
			if ($plf['lang']) { // for lang files
				$lng_folder = $main_folder.'lang/';
				if (checkDir($lng_folder)) {
					$langs = explode(',',$plf['langlist']);
					foreach ($langs as $lng) { // for languages
						if (preg_match("/[A-Z]{2}/i", $lng)) {
							$ex_tpl = getTemplate($mode,'lang');
							$tpl_arr['MMP_PLUGLANG'] = $lng;
							$lng_filename =$tpl_arr['MMP_PLUGNAME'].'.'.$lng.'.lang.php';
							makeFile($lng_folder.$lng_filename, $ex_tpl);
						}
					}
				} else toError($lng_folder);
			}
			$plug_files = array('main','setup'); // makes main files
			foreach ($plug_files as $part_name) {
				if ($plf[$part_name]) {
					$ex_tpl = getTemplate($mode, $part_name);
					$ex_tpl->assign($tpl_arr);
					if ($part_name == 'setup') {
						$ex_tpl->parse('MAIN.CONF_VAR');
					}
					$file_name =$tpl_arr['MMP_PLUGNAME'].(($part_name=='main')?'':'.'.$part_name).'.php';
					makeFile($main_folder.$file_name, $ex_tpl);
				}
			}
			$plug = cot_import('plug','P','ARR');
			foreach ($plug as $k1 => $v1) { // makes addintion files with related templates
				if ($v1['used']) {
					$pl_file[$k1]['name'] = $v1['name'];
					$tplname = strtolower($v1['name']);
					if (preg_match("/ajax/i",$tplname)) {
						$tplname = 'ajax';
					}
					$tpl_arr['MMP_PLUGFILE'] = $tpl_arr['MMP_PLUGNAME'].'.'.$v1['name'];
					$tpl_arr['MMP_PLUGPART'] = $v1['name'];

					// if we have own template for certain filename
					$ex_tpl = getTemplate($mode, $tplname);
					if (!$ex_tpl) { // otherway use dump tpl with custom hook
						$tpl_arr['MMP_TAGS'] = '';
						$tpl_arr['MMP_HOOK'] = strtolower($tplname).PHP_EOL;
						$ex_tpl = getTemplate($mode, 'dump');
					}

					$file_name = $tpl_arr['MMP_PLUGNAME'].'.'.$v1['name'].'.php';
					makeFile($main_folder.$file_name, $ex_tpl);
				}
			}

			if ($mode=='siena' && is_array($plf['siena'])) { // makes Siena specified files
				foreach ($plf['siena'] as $k=>$v) {
					if ($v) {
						$ex_tpl = getTemplate($mode, $k, '');
						if ($ex_tpl) {
							$res_file= $tpl_arr['MMP_PLUGNAME'].'.'.$k;
							if (in_array($k[0],array('c','i','u')) ) {// these files we placed in «setup» folde
								$folder = $main_folder.'setup';
							} else {
								$folder = $main_folder.'inc';
							}
							if (checkDir($folder)) {
								makeFile($folder.'/'.$res_file, $ex_tpl);
							}
						}
					}
				}
			}
			$md_folder = $et_cfg['md_outside'] ? $base_folder : $main_folder;
			if (is_array($plf['misc'])) {
				foreach ($plf['misc'] as $k=>$v) {
					if ($v) {
						if ($k == 'readme.md') {
							if (!is_array($langs)) $langs[] = 'en';
							foreach ($langs as $lng) { // for languages
								$lng = strtolower($lng);
								if (preg_match("/[A-Z]{2}/i", $lng)) {
									$k = 'README'.($lng!='en'?'_'.$lng:'').'.md';
									$ex_tpl = getTemplate('misc', $k, '');
									makeFile($md_folder.$k, $ex_tpl);
								}
							}
							continue;
						}
						$ex_tpl = getTemplate('misc', $k, '');
						makeFile($md_folder.$k, $ex_tpl);
					}
				}
			}
		} else {
			toError($main_folder);
		}
		toLog(cot_rc('mplug_size',array($extpl_total_size)));
		toLog(cot_rc('mplug_targetdir',array($main_folder.$dirname)));
		$log_tpl->parse('LOG');
		if ($cfg['turnajax']) {
			echo $log_tpl->text('LOG');
			exit;
		} else {
			$plugin_body = $log_tpl->text('LOG');
		}
		break;

	default: // generate form with extension params
		if ($cfg['jquery']) {
			$count =0;
			$ext_cat = getExtensionCategories();
			$ext_cat_selector = cot_selectbox('', 'plf[ext_cat]', array_keys($ext_cat),array_map(html_entity_decode,array_values($ext_cat)),true);
			foreach ($tpl_modes as $k => $v) { // Mode (version) selection: Genoa / Siena
				$count++;
				$in['id']=$count;
				$in['typ']=$k;
				$in['desc']=$v;
				$in['check']= ($count==2) ? ' checked="checked"': '';
				$tpl -> assign('in',$in);
				$tpl->parse('MAIN.JQUERY.INPUT_TYP');
			}
			$count =0;
			foreach ($tpl_arr as $k => $v) { // отрисовка форм параметров
				$count++;
				$in['num']=$count;
				$in['val']=str_replace('"',"'",$v);
				$in['text']= (in_array($k,$bold_tag)) ? "<b>$k</b>" : $k;
				$tpl -> assign('in',$in);
				$tpl->parse('PRM.INPUT_PRM');
			}
			$tpl->parse('PRM');
			$tpl->assign('PRM',$tpl->text('PRM'));
			$tpl->parse('MAIN_CFG');
			$tpl->assign('MAIN_CFG',$tpl->text('MAIN_CFG'));
			$tpl->parse('MAIN.JQUERY');
		} else {
			$tpl->parse('MAIN.NOJQUERY');
		}
		$tpl->parse('MAIN');
		$plugin_body .= $tpl->text('MAIN');
		break;
}

