<?php
/* ====================
[BEGIN_COT_EXT]
Code=extension_template
Name=Extension template
Category=development-maintenance
Description=Generates sample (template) files for extension development
Version=1.3.0
Date=2016-mar-10
Author=Andrey Matsovkin
Copyright=Copyright (c) 2008-2013, Andrey Matsovkin
Notes=If your enjoy my plugin please consider donating to help support future developments. mailto: macik.spb@gmail.com   Thanks!
Auth_guests=
Lock_guests=W2345A
Auth_members=
Lock_members=12345
[END_COT_EXT]

[BEGIN_COT_EXT_CONFIG]
version=01:string::1.0.0:Initial version of plugin
author=02:string::Your Name:Author name
email=03:string::your_email@example.com:Your E-mail
licence=04:select:MIT,GPL,BSD,CC-BY-SA:BSD:Licence type
outputdir=05:string::datas\created\:Folder for output files
md_outside=06:radio:0,1:0:Place *.md files outside plugin folder
[END_COT_EXT_CONFIG]
==================== */

/**
 * Extension template plugin for Cotonti CMF
 *
 * @package extension_template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2013
 * @license Distributed under BSD License.
*/

defined('COT_CODE') or header('HTTP/1.1 '.$m='403 Forbidden') . die($m);


