<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle=Yii::app()->name . ' - Tratamientos: '.ucfirst(strtolower($tratamiento['titulo']));
$imagenes = explode("|->", $tratamiento['imagenes']);

$lista_etiqueta = $tratamiento['lista_etiqueta'];
if ($lista_etiqueta!="") {
	$lista_elementos = explode("|->", $tratamiento['lista_elementos']);
}
?>
<br>
<h2 class="mar80"><?php echo $tratamiento['titulo'] ;?></h2>
<div class="rotar-tratamiento mar80" style="margin-top:20px;">
	<?php foreach ($imagenes as $i => $img): ?>
		<?php echo CHtml::image(Yii::app()->request->baseUrl."/resources/tratamientos/".$img, "#".($i+1));?>
	<?php endforeach; ?>
</div>
<div class="nav mar80 horizontalCenter" style="margin-top:20px;"></div>


<div class="mar80" style="margin-top:60px;">
	<div class="globoAfiliate"></div>
	<div class="tratamientoDesc">
		<p class="justify">
			<?php echo CHtml::decode(nl2br($tratamiento['descripcion'])) ;?>
		</p>
		<?php if ($lista_etiqueta!=""): ?>
			<br>
			<div class="colMor" style="font-size:1.2em;"><?php echo $lista_etiqueta ;?></div>
			<ul>
				<?php foreach ($lista_elementos as $i => $elem): ?>
					<li><?php echo $elem ;?></li>
				<?php endforeach; ?>
			</ul>
		<?php endif; ?>
	</div>
</div>
<script type="text/javascript">$(document).ready(function(){$('#logoSpa').fadeIn("slow");})</script>