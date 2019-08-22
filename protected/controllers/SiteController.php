<?php

class SiteController extends Controller
{
	/**
	 * get menu array
	 */

	public function getFlatMenu() {
		$sql_link     = $this->dblink();
		
		$menuItems     =array();
		$qry = mysql_query("SELECT * from menu where estatus=1 order by id asc",$sql_link);
		while ( $row=mysql_fetch_assoc($qry) ) {
			array_push($menuItems, $row);
		}

		return $menuItems;
	}
	public function getOrderedMenu($lista, $padre = 0, $limite=0,$returnArray=array()){
		if($limite > 200) return '';

		for($i=0, $ni=count($lista); $i < $ni; $i++) if($lista[$i]['padre'] == $padre){

			array_push($returnArray,  array(
				'active' => ''/*$lista[$i]['url']*/, 
				'label' => CHtml::decode(strtoupper($lista[$i]['label'])), 
				'url' => $lista[$i]['url']!="" ? array("/".$lista[$i]['url']) : array(),
			));
			$subitems = $this->getOrderedMenu($lista, $lista[$i]['id'],$limite++);
	   	$prevI = count($returnArray)-1;
	   	if(!empty($subitems)) $returnArray[$prevI]['items'] = $subitems;
		}
		return $returnArray;
	}
	public function dblink() {
		$sql_link = mysql_connect(Yii::app()->params['db']['host'], Yii::app()->params['db']['user'], Yii::app()->params['db']['pass']);
		if (!$sql_link) {
			die('Error de Conexi&oacute;n (' . mysql_errno() . ') '. mysql_error());
		}
		mysql_select_db(Yii::app()->params['db']['name'],$sql_link);
		mysql_set_charset('UTF8',$sql_link);
		return $sql_link;
	}
	public function getHeader() {
		$sql_link     = $this->dblink();

		Yii::app()->session['menuItems']=$this->getOrderedMenu($this->getFlatMenu(),0);
		
		$qry = mysql_query("SELECT nombre, direccion, rif FROM empresa",$sql_link);
		Yii::app()->session['empresa']=mysql_fetch_assoc($qry);
		
		$qry = mysql_query("SELECT nombre, concat(url,user) as url, iconOff, iconOn from redes inner join redes_tipos on redes.tipo = redes_tipos.id order by redes.id",$sql_link);
		$redes=array();
		while ( $row=mysql_fetch_array($qry) ) { array_push($redes, $row); }
		Yii::app()->session['redes']=$redes;

		$qry = mysql_query("SELECT * FROM metadata where menu_id=1",$sql_link);
		$metaData=array();
		while ( $row=mysql_fetch_array($qry) ) { array_push($metaData, $row); }
		Yii::app()->session['metaData']=$metaData;
	}
	
	/**
	 * Declares class-based actions.
	 */
	public function actions() {
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex() {
		
		$sql_link     = $this->dblink();
		$this->getHeader();
		
		$links        =array();
		$qry = mysql_query(
			"SELECT label,url,concat(id,pic) as imagen
			from menu
			where padre=0 and estatus=0
			order by id"
		,$sql_link);
		while ( $row=mysql_fetch_array($qry) ) {
			array_push($links, $row);
		}
	
		/*$links = Yii::app()->db->createCommand()
			->select("label,url,concat(id,pic) as imagen")
			->from("menu")
			->where("padre=0")
			->andwhere("estatus=0")
			->order("id")
			->queryAll()
		;*/
				
		$this->render('index',array('links'=>$links));
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError() {
		$sql_link     = $this->dblink();
		$this->getHeader();

		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else
				$this->render('error', $error);
		}
	}

	/**
	 * Contactanos
	 */
	public function actionContacto() {	
		$sql_link     = $this->dblink();
		$this->getHeader();


		$qry = mysql_query(
			"SELECT valor,titulo,etiqueta
			from contacto
			inner join contacto_tipos on contacto.tipo_id = contacto_tipos.id
			inner join contacto_grupos on contacto.grupo_id = contacto_grupos.id
			where contacto.activo=1
			order by contacto_grupos.id,contacto_tipos.id"
		,$sql_link);

		while ( $row=mysql_fetch_array($qry) ) {
			$contactData[$row['titulo']][$row['etiqueta']]=$row['valor']; 
		}
		/*$sql = Yii::app()->db->createCommand()
			->select("")
			->from("")
			->join("")
			->join("")
			->where("")
			->order("contacto_grupos.id,contacto_tipos.id")
			->queryAll()
		;
		foreach ($sql as $i => $row) { 
			$contactData[$row['titulo']][$row['etiqueta']]=$row['valor']; 
		}*/
		
		$this->render('contacto',array('contactData'=>$contactData));
	}
	/**
	 * Empresa / Quienes somos
	 */
	public function actionQuienes_somos() {	
		$this->layout='column23';
		$sql_link     = $this->dblink();
		$this->getHeader();


		$qry      = mysql_query( "SELECT somos,mision,vision from empresa ",$sql_link);

		while ( $row=mysql_fetch_array($qry) ) {
			$somos=$row['somos'];
			$mision=$row['mision'];
			$vision=$row['vision'];
		}

		/*$sql = Yii::app()->db->createCommand()
			->select("somos,mision,vision ")
			->from("empresa")
			->queryRow()
		;

		$somos=$sql['somos'];
		$mision=$sql['mision'];
		$vision=$sql['vision'];*/

		$this->render('empresa',array('somos'=>$somos,'mision'=>$mision,'vision'=>$vision,));
	}
	/**
	 * Planes
	 */
	public function actionPlanes() {
		// $sql_link     = $this->dblink();
		$this->getHeader();


		/*$qry      = mysql_query( 
			"SELECT planes.titulo as plan, planes_modalidad.nombre as modalidad, planes_frecuencia.nombre as frecuencia, costo, miembros, group_concat(planes_componentes.descripcion SEPARATOR '|;') as componentes
		 	from planes 
		 	inner join planes_costos on planes_costos.plan_id = planes.id
		 	inner join planes_modalidad on planes_costos.modalidad_id = planes_modalidad.id
		 	inner join planes_frecuencia on planes_costos.frecuencia_id = planes_frecuencia.id
		 	inner join planes_componentes_group on planes.id = planes_componentes_group.plan_id
		 	inner join planes_componentes on planes_componentes_group.componente_id = planes_componentes.id
		 	group by planes.id, planes_modalidad.id, planes_frecuencia.id
		 	order by planes.id, planes_modalidad.id, planes_frecuencia.id
		 	",$sql_link);

		while ( $row=mysql_fetch_array($qry) ) {
			$planes[$row['plan']][$row['modalidad']][$row['frecuencia']]['costo']=$row['costo'];
			$caracteristicas[$row['plan']]['miembros']=$row['miembros'];
			$caracteristicas[$row['plan']]['componentes']=explode("|;", $row['componentes']);
		}*/

		/*$sql = Yii::app()->db->createCommand()
			->select("planes.titulo as plan, planes_modalidad.nombre as modalidad, planes_frecuencia.nombre as frecuencia, costo, miembros, group_concat(planes_componentes.descripcion SEPARATOR '|;') as componentes")
			->from("planes")
			->join("planes_costos", "planes_costos.plan_id = planes.id")
			->join("planes_modalidad", "planes_costos.modalidad_id = planes_modalidad.id")
			->join("planes_frecuencia", "planes_costos.frecuencia_id = planes_frecuencia.id")
			->join("planes_componentes_group", "planes.id = planes_componentes_group.plan_id")
			->join("planes_componentes", "planes_componentes_group.componente_id = planes_componentes.id")
			->group("planes.id, planes_modalidad.id, planes_frecuencia.id")
			->order("planes.id, planes_modalidad.id, planes_frecuencia.id")
			->queryAll()
		;
		$planes=array();
		foreach ($sql as $i => $row) {
			$planes[$row['plan']][$row['modalidad']][$row['frecuencia']]['costo']=$row['costo'];
			$caracteristicas[$row['plan']]['miembros']=$row['miembros'];
			$caracteristicas[$row['plan']]['componentes']=explode("|;", $row['componentes']);
		}*/
		$this->render('planes'/*,array('planes'=>$planes,'caracteristicas'=>$caracteristicas)*/);
	}
	/**
	 * Tratamientos
	 */
	public function actionTratamientos()
	{
		$id=Yii::app()->request->getParam('td');
		
		$sql_link     = $this->dblink();
		$this->getHeader();


		$qry      = mysql_query( 
			"SELECT titulo, descripcion, lista_etiqueta, lista_elementos, group_concat(concat(tratamiento_id,'-',tratamientos_imagenes.id,pic) separator '|->') as imagenes
			from tratamientos 
			inner join tratamientos_imagenes on tratamientos_imagenes.tratamiento_id = tratamientos.id
			where tratamientos.id='$id'
			group by tratamientos.id
			",$sql_link
		);
		$tratamiento=mysql_fetch_assoc($qry);
		if(empty($tratamiento) or !is_numeric($id) or $id==""){
			$qry      = mysql_query( 
				"SELECT titulo, descripcion, lista_etiqueta, lista_elementos, group_concat(concat(tratamiento_id,'-',tratamientos_imagenes.id,pic) separator '|->') as imagenes
				from tratamientos 
				inner join tratamientos_imagenes on tratamientos_imagenes.tratamiento_id = tratamientos.id
				tratamientos.id='$id'
				where tratamientos.id = 1
				group by tratamientos.id
				",$sql_link
			);
			$tratamiento=mysql_fetch_assoc($qry);
		}
		/*$tratamiento = Yii::app()->db->createCommand()
			->select("titulo, descripcion, lista_etiqueta, lista_elementos, group_concat(concat(tratamiento_id,'-',tratamientos_imagenes.id,pic) separator '|->') as imagenes")
			->from("tratamientos")
			->join("tratamientos_imagenes", "tratamientos_imagenes.tratamiento_id = tratamientos.id")
			->where("tratamientos.id='".$id."'")
			->group("tratamientos.id")
			->queryRow()
		;
		if(empty($tratamiento) or !is_numeric($id) or $tratamiento==""){
			$tratamiento = Yii::app()->db->createCommand()
				->select("titulo, descripcion, lista_etiqueta, lista_elementos, group_concat(concat(tratamiento_id,'-',tratamientos_imagenes.id,pic) separator '|->') as imagenes")
				->from("tratamientos")
				->join("tratamientos_imagenes", "tratamientos_imagenes.tratamiento_id = tratamientos.id")
				->where("tratamientos.id='1'")
				->group("tratamientos.id")
				->queryRow()
			;
		}
		*/

		$this->render('tratamientos',array('tratamiento'=>$tratamiento));
	}
	/**
	 * Spa
	 */
	public function actionSpa() {
		$sql_link     = $this->dblink();
		$this->getHeader();


		$this->render('spa');
	}
	/**
	 * MedicosCasa
	 */
	public function actionMedicosCasa() {
		$sql_link     = $this->dblink();
		$this->getHeader();


		$this->render('medicoscasa');
	}
	/**
	 * Odontologia
	 */
	public function actionOdontologia() {
		$sql_link     = $this->dblink();
		$this->getHeader();


		$this->render('odontologia');
	}
}