<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<body>
    <nav class="navbar navbar-dark bg-primary">
        <h2 style="color: white">Gestion des étudients de la classe E :</h2>
    </nav>

    </hr>
    <div class="row">
        <div class="col-sm-4">
            <div class="container">
                <form id="frmEtudiant" name="frmEtudiant">
                    <div class="form-group">
                        <label>Nom</label>
                        <input type="text" name="nom" id="nom" class="form-control" placeholder="Nom de l'étudiant" size="30px" required>
                    </div>
                    <div class="form-group">
                        <label>Cours</label>
                        <input type="text" name="cours" id="cours" class="form-control" placeholder="Cours" size="30px" required>
                    </div>
                    <div class="form-group">
                        <label>frais</label>
                        <input type="text" name="frais" id="frais" class="form-control" placeholder="Frais" size="30px" required>
                    </div>
                    <div class="form-group" align="right">
                        <button type="button" class="btn btn-info" id="save" onclick="addEtudiant()" >Ajouter</button>
                        <button type="button" class="btn btn-warning" id="reset" onclick="reSet()" >Clean</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-student" class="table table-bordered" cellpadding="0" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.19.0/jquery.validate.min.js"></script>
    <script src="http://cdn.syncfusion.com/js/assets/external/jsrender.min.js"></script>
    <script src="http://cdn.syncfusion.com/16.4.0.52/js/web/ej.web.all.min.js"></script>
    <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="ajax.js" type="text/javascript"></script>
</body>
</html>