<?php
/**
 * Extension template plugin API
 * @package extension_template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2013
 * @license Distributed under BSD License.
 */

defined('COT_CODE') or die('Wrong URL');
require_once cot_langfile('extension_template', 'plug');
$plug_name = 'extension_template';

/**
 * Parses text for key => value pairs and makes Array
 * @param str $text - text to pare
 * @param str $delimiter - key-value delimiter
 * @param str $linebreak - lines delimiter
 */
function parseParams($text,$delimiter='>>',$linebreak=PHP_EOL){
    $arr = explode($linebreak, $text);
    $tpl_arr = array();
    foreach ($arr as $value) {
        list($mrk,$str) = explode($delimiter, $value);
        $tpl_arr[trim($mrk)]=trim($str);
    }
    return $tpl_arr;
}

/**
 * Check for propper template file depends on Name and Mode and return
 * initialized XTemplate
 * @param string $mode - Mode for templates
 * @param string $name - Name of template
 * @param string $type - Default prefix for template name
 * @return XTemplate|boolean
 */
function getTemplate($mode,$name,$type='make_'){
	global $cfg, $plug_name;
	if (empty($name)) return false;
	$tpl_filename = $cfg['plugins_dir']."/$plug_name/tpl/$mode/{$type}{$name}.tpl";
	if (file_exists($tpl_filename)) return new XTemplate($tpl_filename);
	return false;
}

/**
 * Creates file with template
 * Uses global $ex_tpl template if other not specified
 * @param string $filename - Filename (with path) to create file
 * @param XTemplate $tpl - Template
 * @return integer|boolean - Number of bytes written or false otherwise
 */
function makeFile($filename,$tpl=null){
	global $ex_tpl, $tpl_arr;
	if ($filename) {
		if (is_null($tpl)) $tpl = $ex_tpl;
		$tpl->assign($tpl_arr);
		$tpl->parse('MAIN');
		return file_put_contents($filename,$tpl->text('MAIN'));
	}
	return false;
}

/**
 * Adds line to Log output
 * @param string $str
 */
function toLog($str=''){
	global $log_tpl;
	if ($str) {
		$log_tpl->assign('logline',$str);
		$log_tpl->parse('LOG.LINE');
	}
}

/**
 * Add Error msg line to Log output
 * @param string $msg - Folder name cause Error
 */
function toError($msg=''){
	global $log_tpl;
	if ($str) {
		$log_tpl->assign('err_msg',cot_rc('mplug_err1','err='.$msg));
		$log_tpl->parse('LOG.ERROR');
	}
}

/**
 * Check Folder is exists and trying to create it otherwise.
 * @param string $dir_path Path to folder
 * @return boolean - TRUE on folder exists or created, FALSE otherwise.
 */
function checkDir($dir_path){
	global $cfg;
	return (file_exists($dir_path) || @mkdir($dir_path, $cfg['dir_perms'], true));
}

$mode = cot_import('mode','G','ALP') ? cot_import('mode','G','ALP') : (cot_import('plugtyp','P','ALP') ? cot_import('plugtyp','P','ALP') : 'SIENA');

$pfname = 'plug_filename';

$tpl = new XTemplate(cot_tplfile($plug_name, 'plug'));

// setting up different params depend on mode (Genoa version or Siena)
$tpl->parse('TPL_MODES');
$tpl_modes = parseParams($tpl->text('TPL_MODES'));
if (!array_key_exists($mode, $tpl_modes)) {
    echo $L['mplug_wrongmode'].$mode;
    exit;
}
$mode_block = 'TPL_MARKS_'.strtoupper($mode);
// init array of tokens for selected mode (version)
$tpl->parse($mode_block);
$tpl_arr = parseParams($tpl->text($mode_block ));

$bold_tag = array('MMP_PLUGNAME','MMP_PLUGDATE','MMP_VARPREFIX','MMP_PLUGFILE','MMP_HOOK','MMP_PLUGPART','MMP_TAGS','MMP_PLUGTITLE','MMP_PLUGDESC');

$mode= strtolower($mode);

