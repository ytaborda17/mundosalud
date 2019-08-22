<?php

// This is the database connection configuration.
return array(
	'connectionString' => 'mysql:host=localhost;dbname=mundosal_page',
	// datos de produccion
	/*'username' => 'mundosal_admin',
	'password' => '-7k5}+_z(1EN',*/
	// datos para site.ytaborda.com
	/*'connectionString' => 'mysql:host=localhost;dbname=ytaborda_mundosalud_site',
	'username'         => 'ytaborda_site',
	'password'         => '!8Zn!v=ZTXCv',*/
	// datos para pruebas
	'username'         => 'root',
	'password'         => '',
	
	'class'            => 'CDbConnection',
	'emulatePrepare'   => true,
	'charset'          => 'utf8',
);