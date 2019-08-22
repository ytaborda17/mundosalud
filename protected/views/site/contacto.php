<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle=Yii::app()->name . ' - Contáctanos';

?>
<div class="contactBanner"></div>
<div></div>
<h2 class="mar80">CONTÁCTANOS</h2>
<br>
<p class="justify mar80">
	Para nosotros es un placer atenderte. Por eso, te ofrecemos estos medios para responder a cada una de tus solicitudes de la manera que más rápida y eficaz.
</p>
<br>
<br>
<br>
<div class="horizontalCenter line-15">
<?php foreach ($contactData as $titulo => $datos): ?>
	<h3><?php echo $titulo ;?></h3>
	<?php foreach ($datos as $tipo => $value): ?>
		<p>
			<span class="<?php echo $tipo;?>"></span><?php echo $value ;?>
		</p>
	<?php endforeach; ?>
	<br>
<?php endforeach; ?>
</div>