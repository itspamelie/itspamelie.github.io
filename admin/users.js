// Selecciona todos los formularios con la clase 'modal-form'
document.querySelectorAll('.modal-form').forEach(form => {
  form.addEventListener('submit', function (event) {
    event.preventDefault(); // Evita el envío por defecto del formulario
    event.stopPropagation(); // Detiene la propagación del evento

    // Validar el formulario
    if (!form.checkValidity()) {
      // Si no es válido, agrega los mensajes de error
      form.classList.add('was-validated');
    } else {
      // Si es válido, muestra un mensaje de éxito con SweetAlert
      Swal.fire({
        title: '¡Guardado!',
        text: 'Se han guardado los datos correctamente..',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        customClass: {
          confirmButton: 'btn btn-custom'
        },
        buttonsStyling: false
      });


      $('.modal').on('hidden.bs.modal', function () {
        if ($('.modal:visible').length) {
            $('body').addClass('modal-open');
        }
    });
    

      // Reinicia el formulario y cierra el modal (opcional)
      form.reset();
      form.classList.remove('was-validated');
      const modal = bootstrap.Modal.getInstance(form.closest('.modal'));
      modal.hide();
    }
  });
});


function eliminarCampos(campo) {
  Swal.fire({
      title: '¿Estás seguro de eliminar los campos?',
      text: "¡Esta acción no se puede deshacer!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar',
      customClass: {
          confirmButton: 'btn btn-custom me-3', // Clase personalizada
          cancelButton: 'btn btn-secondary ms-4'
      },
      buttonsStyling: false // Desactiva los estilos predeterminados de SweetAlert
  }).then((result) => {
      if (result.isConfirmed) {
          // Si el usuario confirma, mostramos la alerta de éxito
          Swal.fire({
              title: 'Eliminado!',
              text: 'Se han eliminado correctamente.',
              icon: 'success',
              customClass: {
                  confirmButton: 'btn btn-custom me-3', // Igual al de la primera alerta
              },
              buttonsStyling: false // Desactiva los estilos predeterminados de SweetAlert
          });
          console.log('Datos borrados correctamente.');
      }
  });
}


   // Asignamos el evento click a todos los botones con la clase .btnEliminar
   document.querySelectorAll('.btnEliminar').forEach(button => {
       button.addEventListener('click', function() {
           const campo = this.getAttribute('data-campo');
           eliminarCampos(campo);
       });
   });

   