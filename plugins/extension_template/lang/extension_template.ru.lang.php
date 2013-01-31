<?php
/**
 * Localization file for Extension template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2012
 * @license Distributed under BSD License.
 */

defined('COT_CODE') or die('Wrong URL');

$plug_title = 'Создание шаблона плагина ';
$L['plu_title'] = 'Создание шаблона плагина';

$L['mplug_part'] = 'Раздел';
$L['mplug_stage1'] = 'Раздел 1: Выбор названия плагина и файлов для создания';
$L['mplug_stage2'] = 'Раздел 2: Выбор параметров плагина';
$L['mplug_name'] = 'Название плагина';
$L['mplug_name2'] = '(в одно слово, латинскими буквами, допустим символ "_")';
$L['mplug_lang'] = 'Создать файлы языковых настроек';

$L['mplug_main'] = 'Основной файл плагина (plugin_name.php)';
$L['mplug_setup'] = 'Файл установки и настройки плагина (plugin_name.setup.php)';
$L['mplug_addon'] = 'Дополнительные файлы плагина';
$L['mplug_goto2'] = 'Создать шаблон-макет плагина';

$L['mplug_log'] = 'Создан файл <b>{$1}</b> ({$0 байт})';
$L['mplug_creating'] = 'Создаем файлы.';
$L['mplug_err1'] = 'Ошибка при создании каталога  {$1}';
$L['mplug_back'] = 'Вернуться к выбору параметров и создать еще один плагин';
$L['mplug_params'] = 'Уточните параметры для шаблона';

$L['mplug_select'] = 'Выберите версию Cotonti для которой необходимо создать файлы';
$L['mplug_folders'] = 'Создать дополнительные каталоги';
$L['mplug_subfolders'] = '(перечислите через запятую названия вложенных каталогов)';
$L['mplug_langdesc'] = '(перечислите через запятую обозначения языков, например: ru,en)';
$L['mplug_common'] = 'Общие файлы плагина';

$L['mplug_mdfiles'] = 'Дополнительные файлы ';
$L['mplug_mddesc'] = 'Файл Markdown с описанием плагина';
$L['mplug_mdvers'] = 'Файл истории изменения версий';

$L['mplug_wrongmode'] = 'Ошибка выбора режима: ';

$L['info_desc'] ='Генератор шаблонных файлов (заготовки) для разработки Расширения'; // plugin description

$L['cfg_author'] =array('Автор плагина');
$L['cfg_email'] =array('Эл.адрес автора');
$L['cfg_licence'] =array('Тип лицензии','может быть изменен в параметрах при создании шаблона');


?>