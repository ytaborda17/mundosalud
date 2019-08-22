<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle=Yii::app()->name . ' - Planes';

?>

<h2 class="mar80">PLANES</h2>
<br>
<p class="justify mar80">
	Pensando en ti <span style="font-size:1.2em">MUNDO SALUD</span> pone a tu alcance estos planes de afiliación tanto para empresas como para particulares:
</p>
<br>
<br>
<br>
<div class="mar80">
	<?php foreach ($planes as $i => $plan): ?>
		<div class="span50" style="text-align:center;">
			<h4><?php echo nl2br($i) ;?></h4>
			<table class="tablePlan" width="90%" style="margin:15px auto">
				<tr>
					<?php foreach ($plan as $modalidad => $frecuencias): ?>
						<td>
							<b><?php echo strtoupper($modalidad) ;?></b>
							<?php foreach ($frecuencias as $f => $frec): ?>
								<div style="display:block;widht:100%;height:auto;clear:both;vertical-align:middle;">
									<div style="display:block;width:50%;line-height:25px;text-alaign:center;float:left;"><?php echo $frec['costo']!=0 ? ucfirst($f) : "&nbsp;" ;?></div>
									<div style="display:block;width:50%;line-height:25px;text-alaign:center;float:left;"><?php echo $frec['costo']!=0 ? Yii::app()->params['moneda']." ".number_format($frec['costo'],2,",",".") : "" ;?></div>
								</div>
							<?php endforeach; ?>
						</td>
					<?php endforeach; ?>
				</tr>
				
			</table>
		</div>
	<?php endforeach; ?>
	<?php foreach ($caracteristicas as $i => $plan): ?>
		<div class="span50" style="text-align:center;">
			<p class="mar40 colMor">El programa de  Deducción por Domiciliación Bancaria tendrá cobertura a las 48 horas siguientes de haberse confirmado  los datos de su solicitud de afiliación.</p>
			<br>
			<div class="enfasis mar80" style="padding:5px 8px;font-size:1em;">
				EL TITULAR PODRÁ INSCRIBIR A:
			</div>
			<br>
			<p class="colMor">HASTA <b style="font-size:1.2em"><?php echo "( ".$plan['miembros']." )" ;?></b> PERSONAS POR GRUPO</p>
			<br>
			<div class="enfasis mar80" style="padding:5px 8px;font-size:1em;">
				COMPONENTES DEL SERVICIO:
			</div>
			<br>
				<?php foreach ($plan['componentes'] as $comp): ?>
					<p class="colMor"><?php echo $comp ;?></p>
				<?php endforeach; ?>
			<br>
		</div>
	<?php endforeach; ?>
</div>