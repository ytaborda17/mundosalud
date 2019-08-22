<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - Medicos en casa';
$imagenes = array_diff( scandir(Yii::app()->params['fwPath'].'/assets/rotadorMed/'), array('..', '.') );

?>
<br>
<br>
<br>
<div class="horizontalCenter">
	<div class="mar80">
		<h2>¿QUISIERA UN DOCTOR  QUE FUERA A SU CASA ATENDIÉNDOLO A  USTE D Y A SU FAMILIAR  CÓMODAMENTE, CON TODOS LOS MEDICAMENTOS Y MATERIALES PARA ASISTIRLOS?</h2>
	</div>
</div>
<div class="rotador-extra mar80">
	<?php foreach ($imagenes as $i => $img): ?>
		<?php echo CHtml::image(Yii::app()->request->baseUrl."/assets/rotadorMed/".$img, "#".($i+1));?>
	<?php endforeach; ?>
</div>
<div class="nav mar80 horizontalCenter" style="margin-top:20px;"></div>

<div class="mar120" style="margin-top:60px;font-size:1.2em;">
	<p class="justify">
		Médicos en su casa es la membresía familiar de acceso a beneficios exclusivos con ahorros diarios en salud, que le permite ser atendido en la comodidad de su casa  u oficina por un Médico General, optimizando el uso del tiempo y asegurando la correcta evolución del paciente y su entorno cercano.
	</p>
</div>
<div class="horizontalCenter">
	<br>
	<br>
	<br>
	<h3>LOS PROCEDIMIENTOS A REALIZAR EN DOMICILIO PUEDEN SER:</h3>
	<br>
</div>

<div class="mar120" style="padding:0 20px;">
	<div class="span45" style="font-size:1.2em">
		<ul>
			<li>Citas programadas</li>
			<li>Procedimientos de enfermería</li>
			<li>Terapias respiratorias</li>
			<li>Aplicación de medicamentos: Analgésicos soluciones endovenosas</li>
			<li>Manejo del dolor</li>
			<li>Estabilización del paciente</li>
		</ul>
	</div>
	<div class="span45" style="font-size:1.2em;margin-left:">
		<ul>
			<li>Otitis, amigdalitis</li>
			<li>Tratamiento para enfermedades infecciosas en general</li>
			<li>Atención a niños, adultos y personas de la tercera edad</li>
			<li>Incluye medicamentos utilizados durante la consulta</li>
		</ul>
	</div>
</div>
<div class="mar80 horizontalCenter">
	<div class="globoAfiliate afiliateMed" style="margin: 40px 364px;"></div>
</div>
<script type="text/javascript">$(document).ready(function(){$('#logoMed').fadeIn("slow");})</script>