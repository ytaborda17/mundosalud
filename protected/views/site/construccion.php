<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle=Yii::app()->name . ' - Contacto';

?>

<h2 class="mar80">EN CONSTRUCCIÓN</h2>
<br>
<div style="display:block;text-align:center;width:100%;height:auto;">
	<?php 
		echo CHtml::image(
			Yii::app()->request->baseUrl."/images/construccion.gif",
			"En construcción",
			 array('width'=>'399px','height'=>'330px')
		);
	?>
</div>