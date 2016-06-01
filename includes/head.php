<?php

$basedir="/home/web/fuzzwork/htdocs/compression/";

require_once $basedir.'/vendor/autoload.php';

$smarty = new SmartyBC();

$smarty->setTemplateDir($basedir.'/templates');
$smarty->setCompileDir($basedir.'/templates_c');
$smarty->setCacheDir($basedir.'/cache');
$smarty->setConfigDir($basedir.'/configs');
$smarty->trusted_dir=array('/home/web/fuzzwork/htdocs/compression/');
$smarty->setCaching(Smarty::CACHING_LIFETIME_SAVED);
