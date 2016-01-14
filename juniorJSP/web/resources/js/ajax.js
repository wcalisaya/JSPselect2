function postAdd() {
    var accion = $('#accion').val();
    var nombre = $('#txtname').val();
    var cargo = $('#txtcargo').val();
    var user = $('#txtuser').val();
    var pass = $('#txtpass').val();
    $.ajax({
        url: 'jsp/dao/guilleDao.jsp',
        type: 'POST',
        data: 'nombre=' + nombre + '&cargo=' + cargo + '&user=' + user + '&pass=' + pass + '&accion=' + accion
    }).done(function () {
        if (true) {
            $('#exito').show(200).delay(2500).hide(200);
            $('#form')[0].reset();
            $('#lista').reset();
        } else {
            //alert(accion + ' ' + nombre + ' ' + cargo + ' ' + user + ' ' + pass);
        }
    });
}