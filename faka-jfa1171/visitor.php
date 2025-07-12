<?php
$counter_file = './FK/'.$_GET['wz'].'.log';
if(!file_exists($counter_file)) {
  $counter = 0;
  file_put_contents($counter_file, $counter);
} else {
  $counter = file_get_contents($counter_file);
}
$counter++;
file_put_contents($counter_file, $counter);
echo $counter;
?>