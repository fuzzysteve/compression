<?php
$basedir="/home/web/fuzzwork/htdocs/compression/";

require_once $basedir.'/includes/db.inc.php';
require_once($basedir.'/includes/sum.php');




$stmt = $dbh->prepare($sql);

$mineralid=array(34,35,36,37,38,39,40,11399);



    $sql="select invTypes.typeid,typename,volume*portionSize volume from evesupport.compression 
    join invTypes on (compression.typeid=invTypes.typeid) order by id asc";

    $innersql="select quantity from invTypeMaterials where typeid=:typeid and materialtypeid=:material";

    $innerstmt =$dbh->prepare($innersql);
    $stmt = $dbh->prepare($sql);
    $stmt->execute();
    $modules=array();
while ($row = $stmt->fetchObject()) {
    $module=array();
    $module[0]=$row->typename;
    $module[18]=$row->volume;

    $id=1;
    $total=0;
    foreach ($mineralid as $min) {
        $innerstmt->execute(array(':typeid'=>$row->typeid,':material'=>$min));
        $irow = $innerstmt->fetchObject();
        $module[$id]=$irow->quantity ?: 0;
        $total=$total+$irow->quantity;
        $module[$id+1]=floor($irow->quantity/$row->volume);
        $id=$id+2;
    }
    $module[17]=floor($total/$module[18]);
    $modules[]=$module;
}


require_once('includes/head.php');

$smarty->assign('modules', $modules);
$smarty->display('blueprints.tpl');
