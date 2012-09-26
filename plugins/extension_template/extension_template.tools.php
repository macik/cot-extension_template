<?PHP
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
 * @copyright Copyright (c) 2008-2012
 * @license Distributed under BSD License.
 */

if (!defined('COT_CODE') && !defined('COT_PLUG')) { die('Wrong URL ('.array_pop(explode("\\",__FILE__)).').'); }
//require_once cot_incfile('extension_template', 'plug');

$plug_name = 'extension_template';
$base_path = $cfg['plugins_dir']."/$plug_name";

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', $plug_name);
cot_block($usr['isadmin']);

$scriptname = cot_url('admin','m=other&p=extension_template');

$base_path = $cfg['plugins_dir']."/$plug_name";
$inc_path  = "$base_path/inc";
$tpl_path  = "$base_path/tpl";
$ajax_link = "plug.php?r=$plug_name";

//require_once($cfg['lib_dir']."mck/common.php");
require_once cot_incfile($plug_name, 'plug');

switch ($a) {
    case 'step2': // generates files with given params
    	$keys = array_keys($tpl_arr);
        foreach ($_POST as $k => $v) { // gets all params starts with PRM
            if (substr($k,0,3)=='prm') {
                $tpl_arr[$keys[substr($k,4)-1]] = $v;
            }
        }
        $plf = $_POST['plf'];
        $plugin_body .= $L['mplug_creating'].'<br /><br />';
        $base_folder = $cfg['plugins_dir']."/$plug_name/created/";
        $main_folder = $base_folder.$tpl_arr['MMP_PLUGNAME'].'/';
        //$struct_folders = array('inc','js','tpl')
        if (file_exists($main_folder) || @mkdir($main_folder,0777,true)) { // makes Extension base folder
            if ($plf['makedirs']) { // if subfolders туувув
                $dirs = explode(',',$plf['dirsname']);
                if ($mode=='cot') {
                	array_push($dirs,'setup');
                }
                foreach ($dirs as $dirname) {
                    if (!file_exists("$main_folder/$dirname/")) {mkdir("$main_folder/$dirname/");}
                }
            }
            if ($plf['lang']) { // for lang files
                $lng_folder = "$main_folder/lang/";
                if (file_exists($lng_folder) || mkdir($lng_folder,0777,true)) {
                    $langs = explode(',',$plf['langlist']);
                    foreach ($langs as $lng) { // for languages
                        if (preg_match("/[A-Z]/i", $lng)) {
                            $lang_tpl = new XTemplate($cfg['plugins_dir']."/$plug_name/tpl/$mode/make_lang.tpl");
                            $tpl_arr['MMP_PLUGLANG'] = $lng;
                            foreach ($tpl_arr as $k => $v) { $lang_tpl->assign($k,$v); }
                            $lang_tpl->parse('MAIN');
                            $lng_filename =$tpl_arr['MMP_PLUGNAME'].'.'.$lng.'.lang.php';
                            $plugin_body .= $L['mplug_written'].file_put_contents($lng_folder.$lng_filename,$lang_tpl->text('MAIN')).$L['mplug_bytes'].$lng_filename.'</b><br />';
                        }
                    }
                } else $plugin_body .= $L['mplug_err1'].$lng_folder.'<br />';
            }
            $plug_files = array('main','setup'); // makes main files
            foreach ($plug_files as $part_name) {
                if ($plf[$part_name]) {
                    $part_tpl = new XTemplate($cfg['plugins_dir']."/$plug_name/tpl/$mode/make_$part_name.tpl");
                    foreach ($tpl_arr as $k => $v) { $part_tpl->assign($k,$v); }
                    if ($part_name=='setup') {$part_tpl->parse('MAIN.CONF_VAR'); }
                    $part_tpl->parse('MAIN');
                    //$lsetup=  $part_tpl->text('MAIN');
                    $file_name =$tpl_arr['MMP_PLUGNAME'].(($part_name=='main')?'':'.'.$part_name).'.php';
                    $plugin_body .= $L['mplug_written'].file_put_contents($main_folder.$file_name,$part_tpl->text('MAIN')).$L['mplug_bytes'].$file_name.'</b><br />';
                }
            }
            $plug = $_POST['plug'];
            foreach ($plug as $k1 => $v1) { // makes addintion files with related templates
                if ($v1['used']) {
                    $pl_file[$k1]['name'] = $v1['name'];
                    $tplname = strtolower($v1['name']);
                    if (preg_match("/ajax/i",$tplname)) {
                        $tplname = 'ajax';
                    }
                    $tpl_arr['MMP_PLUGFILE'] = $tpl_arr['MMP_PLUGNAME'].'.'.$v1['name'];
                    $tpl_arr['MMP_PLUGPART'] = $v1['name'];

                    if (@file_exists($cfg['plugins_dir']."/$plug_name/tpl/$mode/make_$tplname.tpl") && $tplname) {
                        $tpl_file = $cfg['plugins_dir']."/$plug_name/tpl/$mode/make_$tplname.tpl";
                    } else $tpl_file = $cfg['plugins_dir']."/$plug_name/tpl/$mode/make_dump.tpl";

                    $xtpl = new XTemplate($tpl_file);
                    foreach ($tpl_arr as $k => $v) { $xtpl->assign($k,$v); }
                    $xtpl->parse('MAIN');
                    $file_name = $tpl_arr['MMP_PLUGNAME'].'.'.$v1['name'].'.php';
                    $plugin_body .=  $L['mplug_written'].file_put_contents($main_folder.$file_name,$xtpl->text('MAIN')).$L['mplug_bytes'].$main_folder.$file_name.'</b><br />';
                }
            }

            if ($mode=='siena' && is_array($plf['siena'])) { // makes Siena specified files
                foreach ($plf['siena'] as $k=>$v) {
                    if ($v) {
                        $tpl_file = $cfg['plugins_dir']."/$plug_name/tpl/$mode/".$k.'.tpl';
                        if (@file_exists($tpl_file)){
                            $xtpl = new XTemplate($tpl_file);
                            foreach ($tpl_arr as $k1 => $v1) { $xtpl->assign($k1,$v1); }
                            $xtpl->parse('MAIN');
                            $res_file= $tpl_arr['MMP_PLUGNAME'].'.'.$k;
                            if (in_array($k[0],array('c','i','u')) ) {// these files we placed in «setup» folde
                                $folder = $main_folder.'setup/';
                            } else {
                                $folder = $main_folder.'inc/';
                            }
                            if (!file_exists($folder)) {@mkdir($folder);}
                            $plugin_body .=  $L['mplug_written'].file_put_contents($folder.$res_file,$xtpl->text('MAIN')).$L['mplug_bytes'].$folder.$res_file.'</b><br />';
                        }
                    }
                }
            }

        } else $plugin_body .=  '<div class="error">'.$L['mplug_err1'].$main_folder.'</div><br />';
        $plugin_body .= '<br /><a href="'.$scriptname.'">'.$L['mplug_back'].'</a>';
        break;

    default: // generate form with extension params
        $count =0;
        foreach ($tpl_modes as $k => $v) { // Mode (version) selection
            $count++;
            $in['id']=$count;
            $in['typ']=$k;
            $in['desc']=$v;
            $in['check']= ($count==2) ? ' checked="checked"': '';
            $tpl -> assign('in',$in);
            $tpl->parse('MAIN.INPUT_TYP');
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
        $tpl->parse('MAIN');
        $plugin_body .= $tpl->text('MAIN');
        break;
}

?>