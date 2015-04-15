// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui.min.js
//= require jquery_ujs
//= require datepickered.js
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require_tree .

$(document).ready(function() {
	
	//Función para ocultar las alertas automáticamente
	$("#timer-alert").fadeTo(2000, 500).slideUp(500, function(){
	    $("#timer-alert").alert('close');
	});

	//Función para habilitar las datatables y su traducción a español.
	$('.datatable').DataTable({
		"bScrollCollapse": true,
    	"bPaginate": true,
    	"bRetrieve": true,
    	"iDisplayStart": 10, 	//empieza en la primer página. Con 20 en la segunda, etc.
    	"sPaginationType": "full_numbers",
    	"oLanguage": {
    		"sProcessing":   "Procesando...",
    		"sLengthMenu":   "Mostrar _MENU_ ",
    		"sZeroRecords":  "No se encontraron resultados",
    		"sInfo":         "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros",
    		"sInfoEmpty":    "Mostrando desde 0 hasta 0 de 0 registros",
    		"sInfoFiltered": "(filtrado de _MAX_ registros en total)",
    		"sInfoPostFix":  "",
    		"sSearch":       "Buscar: ",
    		"sUrl":          "",
    		"oPaginate": {
    			"sFirst":    "Primero",
    			"sPrevious": "Anterior",
    			"sNext":     "Siguiente",
    			"sLast":     "Último"
    		}
    	}
	});

    //Función para generar el datepicker
    $( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd'})
       $.datepicker.regional['es'] = {
           closeText: 'Cerrar',
           prevText: '&#x3c;Ant',
           nextText: 'Sig&#x3e;',
           currentText: 'Hoy',
           monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
                        'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
           monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
                            'Jul','Ago','Sep','Oct','Nov','Dic'],
           dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
           dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
           dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
           weekHeader: 'Sm',
           dateFormat: 'dd/mm/yy',
           firstDay: 1,
           isRTL: false,
           showMonthAfterYear: false,
           yearSuffix: ''
           
       };

   //Funciones por default del datepicker (región, fecha)
   $.datepicker.setDefaults($.datepicker.regional['es']);
   $(".datepicker").datepicker("setDate", new Date());
   $(".datepicker").datepicker({ constrainInput: true });

    //Función para generar el datepicker sin valores por default
    $( ".datepickered" ).datepicker({ dateFormat: 'yy-mm-dd'})
       $.datepicker.regional['es'] = {
           closeText: 'Cerrar',
           prevText: '&#x3c;Ant',
           nextText: 'Sig&#x3e;',
           currentText: 'Hoy',
           monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
                        'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
           monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
                            'Jul','Ago','Sep','Oct','Nov','Dic'],
           dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
           dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
           dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
           weekHeader: 'Sm',
           dateFormat: 'dd/mm/yy',
           firstDay: 1,
           isRTL: false,
           showMonthAfterYear: false,
           yearSuffix: ''
           
       };

});

//Función que valida de lado del cliente si el text_field :email está vacío en el formulario de restablecer contraseña al capturar el correo.
function validar(){
	if(document.NombreForm.email.value==''){
		alert('Debe de capturar su cuenta de correo electrónico para restablecer la contraseña.');
		document.NombreForm.email.focus();
		return false;
	}
}

//Función para posicionar el cursor en el text_field indicado para comenzar la captura de datos.
onload = function(){
    document.getElementById('first_field').contentEditable = 'true';
    document.getElementById('first_field').focus();
}
