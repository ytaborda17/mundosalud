$(function() {
	
	/* Rotador de promociones
	 */
	// redefine Cycle's updateActivePagerLink function 
	/*$.fn.cycle.updateActivePagerLink = function(pager, currSlideIndex) { 
	    $(pager).find('li').removeClass('activeLI') 
	        .filter('li:eq('+currSlideIndex+')').addClass('activeLI'); 
	}; */
	$.fn.cycle.updateActivePagerLink = function(pager, currSlideIndex) { 
		$(pager).find('li').removeClass('activeLI') .filter('li:eq('+currSlideIndex+')').addClass('activeLI'); 
	}; 
	$('.rotar-promos').cycle({ 
		fx: 'scrollHorz',
		speed: 600,
		pager:  '.nav',
		cleartypeNoBg: true,
		pagerAnchorBuilder: function(idx, slide) { 
			return '<li><a href="#"><span class="invisible">' + idx + '</span></a></li>'; 
		},
	});
	$('.rotador-principal,.rotar-tratamiento').cycle({ 
		fx: 'fade',
		speed: 300,
	});
	$('.rotar-tratamiento,.rotador-extra').cycle({ 
		fx: 'fade',
		speed: 300,
		pager:  '.nav',
		cleartypeNoBg: true,
		pagerAnchorBuilder: function(idx, slide) { 
			return '<li><a href="#"><span class="invisible">' + idx + '</span></a></li>'; 
		},
	});
	/* Efecto de globo flotando
	 */
	function antiGrav(ele) { // anti-gravity floating on an element ;)
		var distance = 10;
		$(ele).animate({
			'top': "+="+distance+"px"
		},1500,"swing",function(){
			$(ele).animate({
				'top': "-="+distance+"px"
			},1300,"swing",function(){
				antiGrav(ele);
			});
		});
	}
	antiGrav('.globo-principal');

});
