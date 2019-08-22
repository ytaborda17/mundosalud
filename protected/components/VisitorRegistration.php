<?php
/**
 * Registro de visitas al sitio
 */
class visitorRegistration extends CBehavior{       
	
	public function events() {
		return  array(
			'onBeginRequest'=>'registerVisitor',
		);
	}
	public function registerVisitor() {
		$hasVisited='ho_me'.str_replace(" ", "", ucfirst(Yii::app()->name));
		if ( Yii::app()->params['visitorRegistration']===true ) {
			if ( !isset(Yii::app()->session[$hasVisited]) ) {  // Si la variale de sesion no existe, es una nueva visita
				Yii::app()->session[$hasVisited] = "Yes";

			 	$ipAddress = Yii::app()->request->userHostAddress; // get IP
				$geoData = unserialize(file_get_contents('http://www.geoplugin.net/php.gp?ip='.$ipAddress)); // get Geolocation Data

				// save to DB
				/*$command = Yii::app()->db->createCommand();
				$command->insert('visitas', array(
					'timeStamp'          => date('Y-m-d H:m:s',time()),
					'ipAddress'          => $ipAddress,
					'status'             => $geoData['geoplugin_status'],
					'city'               => $geoData['geoplugin_city'],
					'region'             => $geoData['geoplugin_region'],
					'countryName'        => $geoData['geoplugin_countryName'],
					'countryCode'        => $geoData['geoplugin_countryCode'],
					'latitude'           => $geoData['geoplugin_latitude'],
					'longitude'          => $geoData['geoplugin_longitude'],
				));
				$command->reset();*/

				$sql_link = mysql_connect(Yii::app()->params['db']['host'], Yii::app()->params['db']['user'], Yii::app()->params['db']['pass']);
				if (!$sql_link) {
					die('Error de Conexi&oacute;n (' . mysql_errno() . ') '. mysql_error());
				}
				mysql_select_db(Yii::app()->params['db']['name'],$sql_link);
				mysql_set_charset('UTF8',$sql_link);

				mysql_query("INSERT INTO visitas (timeStamp,ipAddress,status,city,region,countryName,countryCode,latitude,longitude)
								 VALUES (
								 	'".date('Y-m-d H:m:s',time())."',
									'".$ipAddress."',
									'".$geoData['geoplugin_status']."',
									'".$geoData['geoplugin_city']."',
									'".$geoData['geoplugin_region']."',
									'".$geoData['geoplugin_countryName']."',
									'".$geoData['geoplugin_countryCode']."',
									'".$geoData['geoplugin_latitude']."',
									'".$geoData['geoplugin_longitude']."'"
				.")",$sql_link);
			}
		}
	}
}

