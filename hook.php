#!/usr/bin/php
<?php
@ob_end_clean();

$bundle = $argv[1];
$version = $argv[2];
$logs = $argv[3];

if ($bundle === 'CoreBundle') {
    $release = __DIR__ . '/release.sh';
    //shell_exec("sh $release master > $logs");
    shell_exec("sh $release min > $logs");
    shell_exec("sh $release full > $logs");
}
