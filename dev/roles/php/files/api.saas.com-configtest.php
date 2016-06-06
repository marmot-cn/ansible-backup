<?php
return [
	//database
    'database.host'     => 'dbw',
    'database.port'     => 3306,
    'database.dbname'   => 'saas_test',
    'database.user'		=> 'root',
    'database.passwod'	=> '123456',
    'database.tablepre' => 'pcore_',
    //cookie
    'cookie.domain'		=>	'',
    'cookie.path'		=>	'/',
    //memcached
    'memcached.serevice'=>[['memcached_1',11211],['memcached_2',11211]],
    //file upload
    'file.attachDir'    => 'Global/attachment/',
    'file.uploadDirType' => 'date',
    'file.siteUrl'      => isset($_SERVER['HTTP_HOST']) ? 'http://'.$_SERVER['HTTP_HOST']. '/' : ''
];
?>

