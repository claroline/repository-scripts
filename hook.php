#!/usr/bin/php
<?php
@ob_end_clean();

$bundle = $argv[1];
$version = $argv[2];

if ($bundle === 'CoreBundle') {
    $release = __DIR__ . '/release.sh';
    shell_exec("sh $release min > scripts.log");
    shell_exec("sh $release full > scripts.log");
}
