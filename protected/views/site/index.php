<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;

$dir_promociones = array_diff( scandir(Yii::app()->params['fwPath'].'/assets/promociones/'), array('..', '.') );
$dir_rotador = array_diff( scandir(Yii::app()->params['fwPath'].'/assets/rotadorIndex/'), array('..', '.') );
?>
<div class="container" style="margin:-10px;">
	<div class="column1">
		<div class="rotar-promos">
			<?php foreach ($dir_promociones as $i => $file): ?>
				<?php if ( substr($file,strlen($file)-3,3)=="jpg" || substr($file,strlen($file)-3,3)=="jpeg" || substr($file,strlen($file)-3,3)=="png" || substr($file,strlen($file)-3,3)=="gif" ) : ?>
					<?php echo CHtml::image(Yii::app()->request->baseUrl."/assets/promociones/".$file, "#".($i+1));?>
				<?php endif; ?>
			<?php endforeach; ?>
		</div><!-- promociones -->
		<!-- <div class="enfasis noSlct"></div> -->
   	<div class="nav" style="padding-top:20px;background:none"></div>
   	<div class="span50"><div class="logoSpa"></div></div>
   	<div class="span50"><div class="logoMedCasa" style="margin-leftt:10px;border-left:2px #812780 solid;"></div></div>
	</div>
	<div class="column2 last">
		<div class="rotador-principal">
			<?php foreach ($dir_rotador as $i => $file): ?>
				<?php if ( substr($file,strlen($file)-3,3)=="jpg" || substr($file,strlen($file)-3,3)=="jpeg" || substr($file,strlen($file)-3,3)=="png" || substr($file,strlen($file)-3,3)=="gif" ) : ?>
					<?php echo CHtml::image(Yii::app()->request->baseUrl."/assets/rotadorIndex/".$file, "#".($i+1));?>
				<?php endif; ?>
			<?php endforeach; ?>
		</div>
		<?php foreach ($links as $i => $link) {
			$img= CHtml::image(
				Yii::app()->request->baseUrl."/resources/links/".$link['imagen'], 
				$link['label']
			);
			$label='<span>'.strtoupper($link['label']).'</span>';
			echo CHtml::link($img.$label,array($link['url']),array('class'=>'links-principal','target'=>'_self'));
		} ?>
		<div class="globo-principal"></div>
	</div>
</div>