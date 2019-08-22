<?php
$fwPath = preg_replace('/\W\w+\s*(\W*)$/', '$1', dirname(__FILE__).DIRECTORY_SEPARATOR);

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'          =>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'              =>'Mundo Salud C.A.',
	'theme'             =>'mundosalud',
	'sourceLanguage'    =>'es', 	//language for messages and views
	'language'          =>'es', 	// user language (for Locale)
	'charset'           =>'utf-8',	// charset to use
	'defaultController' =>'site',
	'preload'           =>array('log'), // preloading 'log' component
	'timeZone'          =>'America/Caracas',
	'behaviors'         =>array(
		'class'=>'application.components.VisitorRegistration',
	),

	'import'=>array( // autoloading model and component classes
		'application.models.*',
		'application.components.*',
	),

	'modules'=>array(
		/*'gii'=>array( // uncomment the following to enable the Gii tool
			'class'     =>'system.gii.GiiModule',
			'password'  =>'LVdEOqBFr8',
			'ipFilters' =>array('127.0.0.1','::1'), // If removed, Gii defaults to localhost only. Edit carefully to taste.
		),*/
	),

	// application components
	'components'=>array(
		'user'=>array(
			'allowAutoLogin'=>true, // enable cookie-based authentication
		),
		'urlManager'=>array( // uncomment the following to enable URLs in path-format
			'urlFormat'      =>'path',
			'showScriptName' =>false,
			'urlSuffix'      =>'',
			'rules'=>array(
				''=>'site/index',
				'<controller:\w+>/<id:\d+>'              =>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>' =>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'          =>'<controller>/<action>',
				'<action:[\w\-]+>'                       => 'site/<action>', // usar cuando tenga un solo controlador && 'defaultController' =>'site',
			),
		),
		'db'=>require(dirname(__FILE__).'/database.php'), // database settings are configured in database.php
		'errorHandler'=>array(
			'errorAction'=>'site/error', // use 'site/error' action to display errors
		),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),
	'params'=>array( // application-level parameters that can be accessed using Yii::app()->params['paramName']
		'adminEmail' => 'taborda.web@gmail.com', // this is used in contact page // nataliapb25@att.net, admmundosalud@hotmail.com
		'dominio'    => 'www.mundosalud.com.ve',
		'sitio'      => 'mundosalud',
		'moneda'     => 'Bs.',
		'theme'      => 'mundosalud',
		'fwPath'     => preg_replace('/\W\w+\s*(\W*)$/', '$1', $fwPath),

		'resourcesSitePath' => $_SERVER['DOCUMENT_ROOT'].'/'.$sitioName.'/resources/',
		'resourcesSite' => '/'.$sitioName.'/resources/',
		'visitorRegistration' => true, // cambiar a true al instalar en el servidor de produccion
		'db' => array(
			'host' => 'localhost',
			'name' => 'mundosal_page',
			// 'user' => 'mundosal_admin',
			// 'pass' => '-7k5}+_z(1EN',
			/*'name' => 'ytaborda_mundosaludsite',
			'user' => 'ytaborda_site',
			'pass' => '!8Zn!v=ZTXCv',*/
			'user' => 'root',
			'pass' => '',
		),
	),
);