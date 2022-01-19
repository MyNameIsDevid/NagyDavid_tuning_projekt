let arr = [];
document.getElementById("gomb").disabled = true;
document.getElementById("motor").disabled = true;
    document.getElementById("kategoria").disabled = true;
    document.getElementById("alkatresz").disabled = true;
    document.getElementById("gomb").disabled = true;
    fetch("http://localhost/projekt/server/getMarkaFromDB.php")
    .then(data => data.json())
    .then(data => {
        
        let a = "<option selected>Válasszon márkát...</option>";
        
        data.forEach(x => {
            a += `<option value=${x["marka"]}>${x["marka"]}</option>`;
        });
        //document.getElementById("marka").innerHTML += a;

        setSelect("marka", a);

    })
    .catch(err => console.log(err));


    function setMotor(){
        let select = document.getElementById("marka");

        var marka = select.options[select.selectedIndex].value;

        if(select.selectedIndex > 0){
//console.log(marka);
        fetch(`http://localhost/projekt/server/getMotorFromDB.php?marka=${marka}`)  
        .then(res => res.json())
        .then(data => {
            
            let x = "<option selected>Válasszon motort...</option>";
            
            data.forEach(y => {
                    x += `<option value=${y["motor"]}>${y["motor"]}</option>`;
                    
            })

            setSelect("motor", x);
            
        })
        .catch(err => console.log(err));
        }else{
            let v = document.getElementById("motor");
            v.disabled = true;
            v.innerHTML = "<option>Válasszon motort...</option>";
            setKategoria();
        }
    }

    function setKategoria() {
        let select = document.getElementById("motor");
        var motor = select.options[select.selectedIndex].value;
        
        //console.log(select.selectedIndex);

        if(select.selectedIndex > 0){
            fetch(`http://localhost/projekt/server/getKategoriaFromDB.php?motor=${motor}`)
            .then(res => res.json())
            .then(data => {
            //console.log(data);
            let x = "<option selected>Válasszon kategóriát...</option>";
            
            data.forEach(y => {
                    x += `<option value=${y}>${y}</option>`;
                    
            })

            setSelect("kategoria", x);
            
        })
        .catch(err => console.log(err));
        }else{
            let v = document.getElementById("kategoria");
            v.disabled = true;
            v.innerHTML = "<option selected>Válasszon kategóriát...</option>";
            let a = document.getElementById("alkatresz");
            a.disabled = true;
            a.innerHTML = "<option selected>Válasszon alkatrészt...</option>";
            enableButton();
        }
    }

    function setAlkatresz(){
        let select = document.getElementById("kategoria");
        let kategoria = select.options[select.selectedIndex].value;

        if(select.selectedIndex > 0){

            fetch(`http://localhost/projekt/server/getAlkatreszFromDB.php?kategoria=${kategoria}`)
            .then(res => res.json())
            .then(data => {
                let x = "<option selected>Válasszon alkatrészt...</option>";

                data.forEach(y => {
                    x += `<option value=${y["nev_bg"]}>${y["nev"]}</option>`;
                })

                setSelect("alkatresz", x);
            })
            .catch(err => console.log(err));
        }else{
            let v = document.getElementById("alkatresz");
            v.disabled = true;
            v.innerHTML = "<option selected>Válasszon alkatrészt...</option>";
        
            //enableButton();
        }
        

    }

    function List(){
        let x = document.getElementById("motor");
        let motor = x.options[x.selectedIndex].value;
        x = document.getElementById("alkatresz");
        let alkatresz = x.options[x.selectedIndex].value;
      
        let content = document.getElementById("content");
        content.innerHTML = "";
        fetch(`http://localhost/projekt/server/getListFromDB.php?motor=${motor}&alkatresz=${alkatresz}`)
        .then(res => res.json())
        .then(data => {
            arr = [...data];
            //minden kártyának egy sorban kell lennie
            let i = 0;
            data.forEach(y => {
                let html = `<div class='col-lg-3 col-md-4 col-sm-6 col-12 mb-2 feher_hatter'>`;
                html += `<div class='card'>`;
                html += `<img src='../kepek/${y["kep"]}' class='img-fluid'>` + 
                `<div class='card-body'>` + 
                `<h6 class='card-title text-justify'>${y["nev"]}</h6>` + 
                `<p class='card-text'>Ár: ${y["ar"]}Ft</p> <button type="button" class="btn btn-primary" data-index=${i} data-target="#exampleModal" data-toggle="modal">Több</button> </div></div></div>`;
                content.innerHTML += html;
                i++;
                //console.log(html);
            })

        })
        .catch(err => console.log(err));
    }

    
    function enableButton() {
        let v = document.getElementById("gomb");
        let select = document.getElementById("alkatresz");

        if(select.selectedIndex > 0){
            v.disabled = false;
        }else{
            v.disabled = true;
        }

    }

    function setSelect(id, option){
        let x = document.getElementById(id);
        x .innerHTML = "";
        x.innerHTML = option;
        x.disabled = false;
    }

    $("#exampleModal").on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); 
        var index = button.data('index') * 1; 
        var modal = $(this);
        modal.find('.modal-title').text(arr[index]["nev"]);
        modal.find('.modal-kep').attr('src', "../kepek/" + arr[index]["kep"]);
        modal.find('.modal-leiras').text(arr[index]["leiras"]);
        modal.find('.modal-ar').text("Ár: " + arr[index]["ar"] + "Ft");
      })