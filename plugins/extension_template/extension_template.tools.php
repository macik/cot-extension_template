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

if (!defined('COT_CODE') && !defined('COT_PLUG')) {
	die('Wrong URL ('.array_pop(explode("\\",__FILE__)).').');
}

/*
 * TODO: Extended plugin
*  ? save settings as profiles
*  + add controls to set setup file variables
*  + add support to make modules
*
* DONE:
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
$inc_path  = "$base_path/inc";
$tpl_path  = "$base_path/tpl";
$ajax_link = (function_exists('cot_url')) ? cot_url('index',"r=$plug_name") : "plug.php?r=$plug_name";
$et_cfg = $cfg['plugin'][$plug_name];
//XTemplate::init(false); // debug only
require_once cot_incfile($plug_name, 'plug');

switch ($a) {
	case 'step2': // generates files with given params
		$log_tpl = new XTemplate(cot_tplfile($plug_name, 'plug'));

		$keys = array_keys($tpl_arr);
		foreach ($_POST as $k => $v) { // gets all params starts with PRM
			if (substr($k,0,3)=='prm') {
				$tpl_arr[$keys[substr($k,4)-1]] = cot_import($k,'P','TXT');
			}
		}
		$plf = cot_import('plf','P','ARR');//$_POST['plf'];
		$tpl_arr['MMP_PLUGNAME'] = preg_replace('/[^a-z_]+/i', '', $tpl_arr['MMP_PLUGNAME']);
		$base_folder = $et_cfg['outputdir'] ? $et_cfg['outputdir'] : $cfg['plugins_dir']."/$plug_name/created/";
		$base_folder = str_replace('\\','/',$base_folder);
		$base_folder .= $base_folder[strlen($base_folder)-1]=='/' ? '' : '/';
		$main_folder = $base_folder.$tpl_arr['MMP_PLUGNAME'].'/'; // for ex. plugins/extension_template/created/plugname/

		if (checkDir($main_folder)) { // makes Extension base folder
			copy($cfg['plugins_dir']."/$plug_name/img/icon.png","$main_folder{$tpl_arr['MMP_PLUGNAME']}.png");
			if ($mode=='siena' && $plf['makedirs']) { // if subfolders needed
				$dirs = explode(',',$plf['dirsname']);
				if ($mode=='cot') {
					array_push($dirs,'setup');
				}
				$dirs = array_unique($dirs);
				foreach ($dirs as $dirname) {
					if (checkDir($main_folder.$dirname)) {
						$source_folder = $cfg['plugins_dir']."/$plug_name/tpl/$mode/$dirname/";
						if ($dirname == 'tpl') {
							$source = $source_folder.'make.css';
							$target = "$main_folder$dirname/{$tpl_arr['MMP_PLUGNAME']}.css";
							if (file_exists($source)) {
								copy($source,$target);
								$tpl_file = file_get_contents($cfg['plugins_dir']."/$plug_name/tpl/$mode/tpl/make.tpl");
								$tpl_file = "# main TPL file for {$tpl_arr['MMP_PLUGTITLE']} plugin\n".$tpl_file;
								file_put_contents("$main_folder$dirname/{$tpl_arr['MMP_PLUGNAME']}.tpl", $tpl_file);
							} else {
								toLog($L['mplug_error'].cot_rc($L['mplug_nofile'],array('folder'=>$source)));
							}
						} else {

						}
						toLog(cot_rc($L['mplug_newfolder'],array(1=>$dirname)));
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
							toLog(cot_rc('mplug_log',array(makeFile($lng_folder.$lng_filename),$lng_filename)));
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
					toLog(cot_rc('mplug_log',array(makeFile($main_folder.$file_name),$file_name)));
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
					toLog(cot_rc('mplug_log',array(makeFile($main_folder.$file_name),$file_name)));
				}
			}

			if ($mode=='siena' && is_array($plf['siena'])) { // makes Siena specified files
				foreach ($plf['siena'] as $k=>$v) {
					if ($v) {
						$ex_tpl = getTemplate($mode, $k, '');
						if ($ex_tpl) {
							$res_file= $tpl_arr['MMP_PLUGNAME'].'.'.$k;
							if (in_array($k[0],array('c','i','u')) ) {// these files we placed in «setup» folde
								$folder = $main_folder.'setup/';
							} else {
								$folder = $main_folder.'inc/';
							}
							if (checkDir($folder)) {
								toLog(cot_rc('mplug_log',array(makeFile($folder.$res_file),$res_file)));
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
							foreach ($langs as $lng) { // for languages
								$lng = strtolower($lng);
								if (preg_match("/[A-Z]{2}/i", $lng)) {
									$k = 'README'.($lng!='en'?'_'.$lng:'').'.md';
									$ex_tpl = getTemplate('misc', $k, '');
									if ($ex_tpl) toLog(cot_rc('mplug_log',array(makeFile($md_folder.$k),$k)));
								}
							}
							continue;
						}
						$ex_tpl = getTemplate('misc', $k, '');
						if ($ex_tpl) toLog(cot_rc('mplug_log',array(makeFile($md_folder.$k),$k)));
					}
				}
			}
		} else {
			toError($main_folder);
		}
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
			foreach ($tpl_modes as $k => $v) { // Mode (version) selection
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
				$in['val']=$v;
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

