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



$sql='
select id-1 id, volume,typename from evesupport.compressedOre 
join invTypes on (compressedOre.typeid=invTypes.typeid) order by id asc
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

foreach (range(1, 16) as $col) {
    lpsolve('set_int', $lp, $col, 1);
}

$sql='select id,coalesce(quantity,0) quantity,valueInt skill from evesupport.compressedOre
join dgmTypeAttributes on (compressedOre.typeid=dgmTypeAttributes.typeid and attributeID=790)
left join invTypeMaterials on (compressedOre.typeid=invTypeMaterials.typeid and materialtypeid=:mineral)
order by id asc';

$stmt = $dbh->prepare($sql);

$mineralid=array(34,35,36,37,38,39,40,11399);


$x=1;
$refinebase=1*($_POST['facility']/100)
    *(($_POST['skill-3385']*0.03)+1)
    *(($_POST['skill-3389']*0.02)+1)
    *(($_POST['implant']/100)+1);
foreach (range(0, 7) as $min) {
    $numbers=array();
    $stmt->execute(array(":mineral"=>$mineralid[$min]));
    while ($row = $stmt->fetchObject()) {
        $numbers[$row->id-1]=floor(((int)$row->quantity)*$refinebase*(($_POST['skill-'.$row->skill]*0.02)+1));
    }
    $ret = lpsolve('add_constraint', $lp, $numbers, GE, $requirements[$min]);
    if ($overage[$min]>=0) {
        $ret = lpsolve('add_constraint', $lp, $numbers, LE, $max[$min]);
    }
}


$orelimit= array_fill(0, $blueprints, Infinite);
if ($_POST['oretype']=='highsec') {
    $orelimit=[0,0,0,0,0,0,0,Infinite,0,Infinite,0,Infinite,Infinite,Infinite,Infinite,0];
} elseif ($_POST['oretype']=='lns') {
    $orelimit=[Infinite,Infinite,Infinite,Infinite,Infinite,Infinite,Infinite,0,Infinite,0,Infinite,0,0,0,0,Infinite];
} elseif ($_POST['oretype']=='nullsec') {
    $orelimit=[Infinite,Infinite,Infinite,Infinite,0,0,0,0,Infinite,0,Infinite,0,0,0,0,Infinite];
}



$ret = lpsolve('set_lowbo', $lp, array_fill(0, $blueprints, 0));
$ret = lpsolve('set_upbo', $lp, $orelimit);
$solution = lpsolve('solve', $lp);
$x = lpsolve('get_variables', $lp);
$totalvolume=0;
$modules=array();
$actual=array();
if ($solution == 0) {

    $sql="select id-1 id,typename,valueInt skill from evesupport.compressedOre
    join dgmTypeAttributes on (compressedOre.typeid=dgmTypeAttributes.typeid and attributeID=790)
    join invTypes on (compressedOre.typeid=invTypes.typeid) order by id asc";
    $names=array();
    $skill=array();
    $stmt = $dbh->prepare($sql);
    $stmt->execute();
    while ($row = $stmt->fetchObject()) {
        $names[$row->id]=$row->typename;
        $skill[$row->id]=$row->skill;
    }


    $sql=<<<EOS
select materialtypeid,floor(quantity*:quantity*:refine) quantity 
from eve.invTypeMaterials itm 
join evesupport.compressedOre co 
where itm.typeid=co.typeid and id=:type+1
EOS;
    $stmt = $dbh->prepare($sql);
    foreach ($x[0] as $key => $value) {
        if ($value>0) {
            #echo $key;
            $modules[]=array(
                $names[$key],
                $value,
                $volume[$key]*$value,
                $refinebase*(($_POST['skill-'.$skill[$key]]*0.02)+1)
            );
            $totalvolume+=$volume[$key]*$value;
            $stmt->execute(array(':type'=>$key,':quantity'=>$value,':refine'=>$refinebase*(($_POST['skill-'.$skill[$key]]*0.02)+1)));
            while ($materialval = $stmt->fetchObject()) {
                if (!isset($actual[$materialval->materialtypeid])) {
                    $actual[$materialval->materialtypeid]=0;
                }
                $actual[$materialval->materialtypeid]+=$materialval->quantity;
            }
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
$smarty->assign('actual', $actual);
#var_dump($modules);
$smarty->display('calculate.tpl');
