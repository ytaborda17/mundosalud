<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - Spa';
$imagenes = array_diff( scandir(Yii::app()->params['fwPath'].'/assets/rotadorSpa/'), array('..', '.') );


?>
<br>
<br>
<br>
<div class="horizontalCenter">
	<h2>¡EL PLACER DE VERTE Y SENTIRTE BIEN!</h2>
</div>
<div class="rotador-extra mar80">
	<?php foreach ($imagenes as $i => $img): ?>
		<?php echo CHtml::image(Yii::app()->request->baseUrl."/assets/rotadorSpa/".$img, "#".($i+1));?>
	<?php endforeach; ?>
</div>
<div class="nav mar80 horizontalCenter" style="margin-top:20px;"></div>

<div class="mar80" style="margin-top:60px;">
	<div class="globoAfiliate afiliateSpa"></div>
	<div class="tratamientoDesc">
		<h3>PIEL CANELA SPA</h3>
		<br>
		<p class="justify">
			Somos una estética, con excelentes profesionales y equipos de avanzada tecnologia, en el cual con la calidez de nuestro ambiente y la atención personalizada de nuestros masoterapeutas obtienes un excelente bienestar físico, mental, emocional y espiritual, luces más fresco y de excelente presencia. Nuestros servicios están dirigidos a que cada cliente logre una mayor calidad de vida, por lo cual los tratamientos no sólo están enfocados en la belleza física sino también en que cada uno alcance el equilibrio mental y espiritual que corresponde.
		</p>
		<br>
		<p class="justify">
			Ofrecemos un servicio integral de tratamientos estéticos corporales y faciales como limpieza facial, radiofrecuencia, ultra cavitación, carboxiterapia, vacumterapia, manta térmica, masajes relajantes, entre otros estos últimos combaten el estrés, el insomnio, estabilizan el sistema nervioso, contribuyen al mejoramiento de contracturas musculares, además también terapias alternativas como  depilación.
		</p>
		<br>
		<p class="justify">
			La atención es personalizada, con la privacidad necesaria y por cita para mayor comodidad del cliente. Por eso te invitamos a visitarnos y disfrutar del placer de verte y sentirte bien.
		</p>
	</div>
</div>


<script type="text/javascript">$(document).ready(function(){$('#logoSpa').fadeIn("slow");})</script>