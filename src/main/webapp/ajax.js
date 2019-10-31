    //Pour la liste des données
    getAll();
    var isNew = true;
    var etudiantid = null;

    function addEtudiant()
    {
      if($("#frmEtudiant").valid())
      {
        var url="";
        var data="";
        var method;

        if(isNew == true)
        {
            url = 'add.jsp';
            data = $("#frmEtudiant").serialize();
            method = 'POST'
        }
        else
        {
            url = 'update.jsp';
            data = $("#frmEtudiant").serialize() + "&etudiantid=" + etudiantid;
            method = 'POST';
        }

        $.ajax({
            type: method,
            url : url,
            dataType: 'JSON',
            data : data,

            success:function(data)
            {
                getAll();
                reSet();
            }

        })
      }
    }

    function reSet()
    {
         $('#nom').val("");
         $('#cours').val("");
         $('#frais').val("");
    }

    function getAll()
    {
        $('#tbl-student').dataTable().fnDestroy();
        $.ajax({
            url: "all_student.jsp",
            type: "GET",
            dataType: "JSON",

            success:function(data)
            {
                $('#tbl-student').dataTable({
                    "aaData":data,
                    "scrollX": true,
                    "aoColumns":
                        [
                            {"sTitle": "Etudiant", "mData":"nom"},
                            {"sTitle": "Cours", "mData":"cours"},
                            {"sTitle": "Frais", "mData":"frais"},

                            {
                                "sTitle": "Modification",
                                "mData":"id",
                                "render": function(mData,type,row,meta)
                                {
                                    return '<button class="btn btn-success" onclick="details('+mData+')">Modifiez</button>';
                                }
                            },
                            {
                                "sTitle": "Suppression",
                                "mData":"id",
                                "render": function(mData,type,row,meta)
                                {
                                    return '<button class="btn btn-danger" onclick="doDelete('+mData+')">Supprimez</button>';
                                }
                            }
                        ]

                });
            }

        });
    }

    function details(id)
    {
        $.ajax({
            type: "POST",
            url: "edit_return.jsp",
            data: {"id": id},

            success: function(data)
            {
                isNew = false;
                var obj = JSON.parse(data);
                etudiantid = obj[0].id
                $('#nom').val(obj[0].nom);
                $('#cours').val(obj[0].cours);
                $('#frais').val(obj[0].frais);
            }
        })

    }

    function doDelete(id)
    {
        $.ajax({
            type: 'POST',
            url: 'delete.jsp',
            dataType: 'JSON',
            data:{"id": id},

            success:function(data)
            {
                getAll();
                alert("Inscription supprimée");
            }

        })
    }

 