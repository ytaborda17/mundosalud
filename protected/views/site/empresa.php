<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle=Yii::app()->name . ' - Quiénes somos';
?>

<br>
<br>
<div class="mar80">
	<div class="span45">
		<h3>MUNDO SALUD </h3>
		<br>
		<p class="justify">
			<?php echo nl2br($somos) ;?>
		</p>
	</div>
	<div class="span45">
		<h3>MISIÓN</h3>
		<br>
		<p class="justify">
			<?php echo nl2br($mision) ;?>
		</p>
		<br>
		<h3>VISIÓN</h3>
		<br>
		<p class="justify">
			<?php echo nl2br($vision) ;?>
		</p>
	</div>
</div>
<div class="mar80" style="margin-top:20px;">
	<div class="span45">
		<div class="logoMedCasa" style="margin-left:20px"></div>
	</div>
	<div class="span45">
		<div class="logoSpa" style="margin-left:-10px"></div>
	</div>
</div>

