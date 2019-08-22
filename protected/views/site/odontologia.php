<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - Odontologia';
$imagenes = array_diff( scandir(Yii::app()->params['fwPath'].'/assets/rotadorOdo/'), array('..', '.') );

?>
<br>
<br>
<br>
<div class="horizontalCenter">
	<div class="mar80">
		<h2>LE BRINDAMOS EL SERVICIO INTEGRAL DE ODONTOLOGÍA, CON EQUIPOS DE AVANZADA TECNOLOGIA Y ADAPTADOS PARA PRESTAR SERVICIO A NUESTROS PACIENTES</h2>
	</div>
</div>
<div class="rotador-extra mar80">
	<?php foreach ($imagenes as $i => $img): ?>
		<?php echo CHtml::image(Yii::app()->request->baseUrl."/assets/rotadorOdo/".$img, "#".($i+1));?>
	<?php endforeach; ?>
</div>
<div class="nav mar80 horizontalCenter" style="margin-top:20px;"></div>

<div class="mar80 horizontalCenter" style="margin-top:60px;">
	<h3>PLAN BÁSICO ODONTOLÓGICO GRATIS:</h3>
	<br>
</div>

<div class="mar120" style="padding-left:60px;">
	<div class="span50" style="font-size:1.2em">
		<ul>
			<li>Fisioterapia oral (detección de placa bacteriana)</li>
			<li>Enseñanza de las técnicas de cepillado</li>
			<li>Profilaxis dental (limpieza)</li>
			<li>Sellantes de puntos y fisuras</li>
			<li>Resinas fotocuradas en dientes anteriores y posteriores</li>
		</ul>
	</div>
	<div class="span45" style="font-size:1.2em;margin-left:">
		<ul>
			<li>Examen Clínico</li>
			<li>Exodoncias simples (extracción)</li>
			<li>Reconstrucción de pernos y resinas</li>
			<li>Tratamiento de conducto</li>
			<li>Blanqueamiento</li>
			<li>Exodoncias cordales</li>
		</ul>
	</div>
</div>
<div class="mar80 horizontalCenter">
	<div class="globoAfiliate afiliateOdo" style="margin: 40px 364px;"></div>
</div>
<script type="text/javascript">$(document).ready(function(){$('#logoOdo').fadeIn("slow");})</script>