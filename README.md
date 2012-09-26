Extension templates generator
=============================

Plugin for Cotonti CMF. 
Allow to fast generate template (files) for Cotonti Extension for further development.

Description
-----------

It's simply creates standard set of Extension files with recommended folder structure and 
necessary file format. It's maked to help Extension developers fast create plugins and 
not to waste the time for filling standard parameters.

Features
--------

* Both of Cotonti branch are supported (Genoa and Siena versions)
* Highly configurable throug templates and parameters
* Unlimited parts for plugin supported
* Creates folder structure with Cotonti development guidelines

Requirements
------------

Works with Cotonti Siena (0.9.x branch).

Demo page
---------

No demo page available. Install it to use.

Version info
------------

Current version 1.0 required [jQueryUI](http://www.jqueryui.com) (included in plugin bundle).

### Comments

Original idea and most part of code was born several years ago for Genoa. So code are ugly.
Some refactoring are done just to convert it for Siena.


### How extension works

Main controls is accessible after install in Admin section of plugin 

To create a simple pack of plugin files just select Cotonti branch, enter plugin name and
check these files you are needed. Then press «Create Extension template files» button.
Generated files can be found in «created» subfolder.


Install
-------

* Unpack, copy files to root folder of your site.
* Install via Admin → Extensions menu (`Administration panel → Extensions`)
* If you already use jQueryUI in your project than correct filepath to it in 
[extension_template.rc.php](https://github.com/macik/cot-extension_template/blob/master/plugins/extension_template/extension_template.rc.php) file.

### Comments

After install you can change settings (author name and e-mail) then goto Admin → Tools page
to work with it (`Administration panel → Extensions → Extension template → Administration`).

References
----------

* [Cotonti.com](http://Cotonti.com/) -- Home of Cotonti CMF


