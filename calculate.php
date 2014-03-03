<?php
$basedir="/home/web/fuzzwork/htdocs/compression/";

require_once $basedir.'/includes/db.inc.php';
require_once($basedir.'/includes/sum.php');




$vars=array('trit','pye','mex','iso','nocx','zyd','mega','morp');

foreach ($vars as $type) {
    if (isset($_POST[$type]) and is_numeric($_POST[$type])) {
        $requirements[]=(int)$_POST[$type];
    } else {
        $requirements[]=(int)0;
    }
    if (isset($_POST[$type.'extra']) and is_numeric($_POST[$type.'extra'])) {
        $overage[]=(int)$_POST[$type.'extra'];
    } else {
        $overage[]=(int)0;
    }
}

#$requirements=array(200000000,200000000,0,0,0,0,0,0);
#$overage=array(10000000,100000000,2000000,1000000,500000,50000,5000,1000);


$sql='
select id-1 id,(volume*portionsize) volume from evesupport.compression 
join invTypes on (compression.typeid=invTypes.typeid) order by id asc
';

$stmt = $dbh->prepare($sql);
$stmt->execute();
$volume=array();
$blueprints=1;
while ($row = $stmt->fetchObject()) {
    $volume[$row->id]=(float)$row->volume;
    $blueprints++;
}
$lp = lpsolve('make_lp', 0, $blueprints);
lpsolve('set_verbose', $lp, IMPORTANT);

$max=array_map("sum", $requirements, $overage);

$ret = lpsolve('set_obj_fn', $lp, $volume);

foreach (range(1, 21) as $col) {
    lpsolve('set_int', $lp, $col, 1);
}

$sql='select id,coalesce(quantity,0) quantity from evesupport.compression
left join invTypeMaterials on (compression.typeid=invTypeMaterials.typeid and materialtypeid=:mineral) order by id asc';

$stmt = $dbh->prepare($sql);

$mineralid=array(34,35,36,37,38,39,40,11399);


$x=1;
foreach (range(0, 7) as $min) {
    $numbers=array();
    $stmt->execute(array(":mineral"=>$mineralid[$min]));
    while ($row = $stmt->fetchObject()) {
        $numbers[$row->id-1]=(int)$row->quantity;
    }
    $ret = lpsolve('add_constraint', $lp, $numbers, GE, $requirements[$min]);
    if ($overage[$min]>=0) {
        $ret = lpsolve('add_constraint', $lp, $numbers, LE, $max[$min]);
    }
}

$ret = lpsolve('set_lowbo', $lp, array_fill(0, $blueprints, 0));
$ret = lpsolve('set_upbo', $lp, array_fill(0, $blueprints, Infinite));
$solution = lpsolve('solve', $lp);
$x = lpsolve('get_variables', $lp);

$totalvolume=0;
$modules=array();
if ($solution == 0) {

    $sql="select id-1 id,typename from evesupport.compression 
    join invTypes on (compression.typeid=invTypes.typeid) order by id asc";
    $names=array();
    $stmt = $dbh->prepare($sql);
    $stmt->execute();
    while ($row = $stmt->fetchObject()) {
        $names[$row->id]=$row->typename;
    }


    foreach ($x[0] as $key => $value) {
        if ($value>0) {
            echo $key;
            $modules[]=array($names[$key], $value, $volume[$key]*$value);
            $totalvolume+=$volume[$key]*$value;
        }
    }
}
#lpsolve('write_lp', $lp, 'a.lp');
lpsolve('delete_lp', $lp);
require_once('includes/head.php');

$smarty->assign('volume', $totalvolume);
$smarty->assign('modules', $modules);
$smarty->assign('solution', $solution);
$smarty->assign('requirements', $requirements);
$smarty->assign('overage', $overage);

#var_dump($modules);
$smarty->display('calculate.tpl');
