<div class="row mt-5">
    <div class="col-lg p-2 feher-hatter">
        <form action="" class="form-inline">
            <label for="marka">Márka: </label>
            <select id="marka" class="form-control m-2" onchange="setMotor();">
                <option selected>Válasszon márkát...</option>
            </select>

            <label for="motor">Motor: </label>
            <select id="motor" class="form-control m-2" onchange="setKategoria();">
                <option selected>Válasszon motort...</option>
            </select>

            <label for="kategoria">Kategória: </label>
            <select id="kategoria" class="form-control m-2" onchange="setAlkatresz();">
                <option selected>Válasszon kategóriát...</option>
            </select>

            <label for="alkatresz">Alkatrész: </label>
            <select id="alkatresz" class="form-control m-2" onchange="enableButton();">
                <option selected>Válasszon alkatrészt...</option>
            </select>

            <button id="gomb" type="button" class="btn btn-success mb-2" onclick="List();">Ok</button>
        </form>
    </div>
</div>
<div class="row mt-5" id="content">
    
</div>
<div id="">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container mb-4">
                        <div class="row">
                            <div class="col-md col-lg col-sm">
                                <img class="img-fluid modal-kep"  src="">
                            </div>
                        </div>
                    </div>
                    
                    <p class="modal-leiras"></p>
                    <p class="modal-ar"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Bezárás</button>
                    <button type="button" class="btn btn-success" data-dismiss="modal">Kosárhoz add</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/alkatreszek.js"></script>