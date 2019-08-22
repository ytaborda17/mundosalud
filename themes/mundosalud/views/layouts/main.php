<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<title><?php echo CHtml::decode($this->pageTitle); ?></title>
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->
	<?php
		// CARGANDO ESTILOS Y JAVASCRIPT
		$baseUrl    = Yii::app()->baseUrl; 
		$cs         = Yii::app()->getClientScript();
		$cssexclude = array('ver-detalle.css');
		$jsexclude  = array();
		$fwPath     = Yii::app()->params['fwPath']; 
		$theme      = Yii::app()->params['theme'];

		echo "<link type=\"image/ico\" href=\"".Yii::app()->baseUrl."/images/favicon.ico\" rel=\"icon\">";
		$cs->registerCoreScript('jquery');
		$cs->registerCoreScript('jquery.ui');

		// Cargando java script del tema
		$dir = array_diff( scandir($fwPath.'/themes/'.$theme.'/js/'), array('..', '.') );
		foreach ($dir as $i => $file) if ( substr($file,strlen($file)-2,2)=="js" && in_array($file, $jsexclude)===false ) { 
			$cs->registerScriptFile(Yii::app()->theme->baseUrl.'/js/'.$file); 
		}
		// Cargando estilos del tema
		$dir = array_diff( scandir($fwPath.'/themes/'.$theme.'/css/'), array('..', '.') );
		foreach ($dir as $i => $file) if ( substr($file,strlen($file)-3,3)=="css" && in_array($file, $cssexclude)===false ) { 
			$cs->registerCssFile(Yii::app()->theme->baseUrl.'/css/'.$file); 
		}
		
		// CARGANDO MetaData del sitio
		if ( isset(Yii::app()->session['metaData']) and !empty(Yii::app()->session['metaData']) ) foreach (Yii::app()->session['metaData'] as $i => $tag) {
			echo "<meta ".$tag['prop_name']."=\"".$tag['prop_name_value']."\" content=\"".$tag['content']."\">";
		}

		// CARGANDO EL MENU DESDE LA BASE DE DATOS PDO
		/*$activeItem = $this->route;
		$menuList = Yii::app()->db->createCommand("SELECT * from menu where padre=0 and estatus=1 order by id desc")->queryAll();
		$items=array();
		foreach ($menuList as $i => $menu) {
			$model = Menu::model()->findByPk($menu['id']);
			array_push($items, $model->getListed($activeItem));
		}*/
		
		// CARGANDO EL MENU DESDE LA BASE DE DATOS
		$items=array();
		$items = Yii::app()->session['menuItems'];

		// CARGADON DATOS DE LA EMPRESA
		$empresa = Yii::app()->session['empresa'];
		$footAddress = implode(" | ", $empresa);

		// CARGANDO DATOS DE LAS REDES SOCIALES
		$redes = Yii::app()->session['redes'];
	?>
</head>

<body>
	<div class="bgFix"></div>
	<div id="page">
		<dis id="wrap">
			<div id="header">
				<?php echo CHtml::link('', array('/index'), array('id' => 'logo','title'=>'Inicio'));;?>
				<div id="logoSpa"></div>
				<div id="logoMed"></div>
				<div id="logoOdo"></div>
				<h1 class="invisible"><?php echo CHtml::encode(Yii::app()->name); ?></h1>
			</div><!-- header -->
			<div id="main">
				<div id="mainMenu">
						<?php
					// <div style="margin:0 65px;">
							$this->widget('zii.widgets.CMenu', array(
								'items' => $items, 
								'activeCssClass'=>'active',
							));
					//</div>
						?>
				</div><!-- mainmenu -->
				<?php if(isset($this->breadcrumbs)):?>
					<?php $this->widget('zii.widgets.CBreadcrumbs', array(
						'links'=>$this->breadcrumbs,
						'homeLink'=>''
					)); ?><!-- breadcrumbs -->
				<?php endif?>

				<div id="mainContent">
					<?php echo $content; ?>
				</div>
			</div>
		</div>
		<div id="footer">
			<div class="footNetwork">
				<?php foreach ($redes as $i => $socialNetwork): ?>
					<a href="<?php echo $socialNetwork['url'] ;?>" class="<?php echo $socialNetwork['nombre'] ;?>" title="<?php echo $socialNetwork['nombre'] ;?>" target="_blank">
						<?php echo CHtml::image(
							Yii::app()->request->baseUrl."/resources/redes/".$socialNetwork['iconOff'], 
							$socialNetwork['nombre'], 
							$socialNetwork['iconOn']!="" ? array(
								'onmouseover'=>"this.src='".Yii::app()->request->baseUrl."/resources/redes/".$socialNetwork['iconOn']."';",
								'onmouseout'=>"this.src='".Yii::app()->request->baseUrl."/resources/redes/".$socialNetwork['iconOff']."';",
							) : array()
						);?>
					</a>
				<?php endforeach; ?>
			</div>
			<div class="footAddress">
				<?php echo $footAddress ;?>
			</div>
		</div><!-- footer -->

	</div><!-- page -->
</body>
</html>
