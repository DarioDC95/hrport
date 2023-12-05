<%@ page contentType="text/html;charset=UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TalentBridge</title>
<link href="/hrport/resources/css/custom/custom.css" rel="stylesheet">
<link
	href="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.css"
	rel="stylesheet">
	<script type="text/javascript" src="/hrport/resources/js/bootstrap.bundle.min.js"></script>

</head>

<body class="bg-body-tertiary">

	<jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>

	<jsp:include page='../view-common/admin_header.jsp'>
		<jsp:param name="activeLinkId" value="posizioni" />
	</jsp:include>

	<section style="min-height: 100vh;">
		<div class="container-fluid p-4">
			<h1>Posizione</h1>
			<hr>

			<div class="modal fade" id="expanded_image" tabindex="-1"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content border border-2 border-primary">
						<div class="modal-header bg-body-tertiary">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Immagine
								posizione</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body bg-dark">
							<img id="modal_expanded_image" class="w-100 h-100 rounded">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Chiudi</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-5">
					<h2 class="mb-3">Dati posizione</h2>
					<div class="card" style="width: 100%;">
						<div class="rounded shadow-sm mb-1 bg-dark" style="width: 100%; height: 220px; background-position: center center; background-size: cover; background-repeat: no-repeat; aspect-ratio: 5/4;" id="position_propic">
                        </div>
						<div id="updateForm" class="card-body">
							<div class="row mb-3">
								<label for="input_id_posizione" class="col-sm-3 col-form-label">ID
									Posizione</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="input_id_posizione"
										value="<%=request.getAttribute("idPosizione")%>" readonly
										disabled>
								</div>
							</div>
							<div class="row mb-3">
								<label for="input_nome_posizione"
									class="col-sm-3 col-form-label">Nome</label>
								<div class="col-sm-9">
									<input type="text" class="form-control"
										id="input_nome_posizione">
								</div>
							</div>
							<fieldset class="row mb-3">
								<legend class="col-form-label col-sm-3 pt-0">Stato</legend>
								<div class="col-sm-9">
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="input_stato" id="input_stato_aperta" value="aperta">
										<label class="form-check-label" for="input_stato_aperta">
											Aperta </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="input_stato" id="input_stato_chiusa" value="chiusa">
										<label class="form-check-label" for="input_stato_chiusa">
											Chiusa </label>
									</div>
								</div>
							</fieldset>
							<hr>
							<div class="row mb-3">
								<label for="input_id_foto_url" class="col-sm-3 col-form-label">URL
									Immagine</label>
								<div class="col-sm-9">
									<input type="file" class="form-control" id="input_id_foto_url">
								</div>
							</div>
							<div class="row mb-3 d-flex justify-content-end p-2"></div>
							<div class="row mb-3">
								<label for="input_descrizione" class="col-sm-3 col-form-label">Descrizione</label>
								<div class="col-sm-9">
									<textarea class="form-control" id="input_descrizione"
										style="height: 400px;"></textarea>
								</div>
							</div>
							<hr class="mb-4">
							<div
								class="d-flex flex-row justify-content-between align-items-center p-2 mb-4">
								<!-- <a href="#" class="m-0 link-danger">Elimina posizione</a> -->
								<button type="submit" id="eliminaPositionBtn"
									class="m-0 link-danger" onclick="deletePosizione()">
									<h5 class="m-0">Elimina posizione</h5>
								</button>
								<button id="updatePositionBtn"
									class="btn btn-primary text-light" onclick="updatePosizione()">
									<h5 class="m-0">Salva</h5>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-7">
					<h2 class="mb-3">Candidati Posizione</h2>
					<div class="card bg-white">
						<div class="card-body">
							<table id="myTable" class="table table-striped">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nome</th>
										<th>Cognome</th>
										<th>Punteggio</th>
										<th>Profilo</th>
									</tr>
								</thead>
								<tbody id="profiles-data">
									<!-- Lista di profili -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<jsp:include page='../view-common/footer.jsp'></jsp:include>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.bootstrap5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.js"></script>
	<script
		src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.js"></script>
		<script>
                                    let inputFotoUrl = document.querySelector('#input_id_foto_url');
                                    let fotoUrlExample = document.querySelector('#foto_url_example');
                                    let modalFotoUrlExample = document.querySelector('#modal_expanded_image');
                                    inputFotoUrl.addEventListener('keyup', loadExamplePic);
                                    loadExamplePic();

                                    function loadExamplePic() {
                                        fotoUrlExample.style.backgroundImage = "url('<%=request.getContextPath()%>/app/getImage?imgPath=" + inputFotoUrl.value + "')";
                                        modalFotoUrlExample.src = "<%=request.getContextPath()%>/app/getImage?imgPath=" + inputFotoUrl.value;
                                    }
                                </script>
	<script>
        	
      	//Object from database
        let JSPposizione = `<%=request.getAttribute("dataPos")%>`;
        let JSPcandidati = `<%=request.getAttribute("candidati")%>`;
        

		//Object Json
        let JsonPosizione = JSON.parse(JSPposizione);
		let JsonCandidati = JSON.parse(JSPcandidati);
		
		
		
		//Generate position data detail
		var inputNamePosition = document.getElementById("input_nome_posizione");
		var inputIdPosition = document.getElementById("input_id_posizione");
		var radioAperta = document.getElementById("input_stato_aperta");
		
		inputIdPosition.value = JsonPosizione.idPos;
		inputNamePosition.value = JsonPosizione.nome;
		radioAperta.checked = true;
		
		
	
		//Generate table candidati list
		var tableBody = document.getElementById("profiles-data");
		
		JsonCandidati.forEach(function (candidato) {
		
			if(candidato.position.idPos === JsonPosizione.idPos){
	          	
	            var row = document.createElement("tr");
	
	            var idCell = document.createElement("td");
	            idCell.textContent = candidato.idCand;
	
	            var nomeCell = document.createElement("td");
	            nomeCell.textContent = candidato.user.nome;
	
	            var cognomeCell = document.createElement("td");
	            cognomeCell.textContent = candidato.user.cognome;
	
	            var posizioneCell = document.createElement("td");
	            posizioneCell.textContent = candidato.punteggioTot;
	
	            var linkCell = document.createElement("td");
	            var linkElement = document.createElement("a");
	            linkElement.textContent = "Profilo";
	            linkElement.href = "http://localhost:8080/hrport/admin/profilo/" + candidato.user.idUtente;
	
	            linkCell.appendChild(linkElement);
	
	            row.appendChild(idCell);
	            row.appendChild(nomeCell);
	            row.appendChild(cognomeCell);
	            row.appendChild(posizioneCell);
	            row.appendChild(linkCell);
	
	            tableBody.appendChild(row);
	            
			}

        });
        let fotoUrl = "http://localhost:8080/hrport/app/getAttachment/immagini_posizioni?imgPath=" + JsonPosizione.fotoUrl;

   		let anagraficaWidgetProPic = document.querySelector('#position_propic');

   		anagraficaWidgetProPic.style.backgroundImage = "url('" + fotoUrl + "')";
			
        //console.log(JsonPosizione);
        
        async function updatePosizione() {
            
            let form = document.getElementById('updateForm');
            let idPosizione = form.querySelector('#input_id_posizione').value;
            let nomePosizione = form.querySelector('#input_nome_posizione').value;
            let stato = form.querySelector('input[name="input_stato"]:checked').value === "aperta" ? true : false;
            let idFotoUrl = form.querySelector('#input_id_foto_url');
            let descrizione = form.querySelector('#input_descrizione').value;
            
			
            let positionData = {
            		idPos: JsonPosizione.idPos,
            		nome: nomePosizione === "" ? JsonPosizione.nome : nomePosizione,
            		aperta: stato === "" ? JsonPosizione.aperta : stato,
            		descrizione: descrizione === "" ? JsonPosizione.descrizione : descrizione
            		
            }
            
    	    const file = idFotoUrl.files[0];
    		console.log("entro")
    	
    	    const formData = new FormData();
    		formData.append('idPos', positionData.idPos);
			formData.append('nome', positionData.nome);
			formData.append('aperta', positionData.aperta);
			formData.append('descrizione', positionData.descrizione);
    	    if (file) {
    	    	
    	        formData.append('file', file);
    	    }    
                     
            //Update posizione
            await fetch('http://localhost:8080/hrport/admin/update-posizione', {
	            method: 'POST',
	            body: formData
	        }).then((response) => {

				const result = response.text();
				console.log(result);
			
				if (response.ok) {
					
					console.log("success")
					window.location.href = "http://localhost:8080/hrport/admin/posizioni"
				}
			});
        }
        
        //Delete posizione
        function deletePosizione() {
			fetch('http://localhost:8080/hrport/admin/delete-posizione/' + JsonPosizione.idPos, {
				method: 'DELETE',
				headers: {
				'Content-Type': 'application/json',
			},
			})
				.then(response => response.json())
				.then(data => {
				alert("Position Deleted");
				window.location.href = "http://localhost:8080/hrport/admin/posizioni";
			})
				.catch(error => {
				alert("error" + error);
				console.error('Error:', error);
			});
				window.location.href = "http://localhost:8080/hrport/admin/posizioni";
		}
            let table = new DataTable('#myTable', {
                dom: "PlftipB",
                buttons: [
                    {
                        extend: 'pdf',
                        text: 'Save current page',
                        exportOptions: {
                            modifier: {
                                page: 'current'
                            }
                        }
                    }
                ],
                "oLanguage": {
                    "sLengthMenu": "Mostra _MENU_ risultati per pagina",
                    "sZeroRecords": "Nessun candidato trovato per questa posizione",
                    "sInfo": "Mostrando i record da _START_ a _END_. Totale: _TOTAL_",
                    "sInfoEmpty": "Nessun record da mostrare",
                    "sInfoFiltered": "(filtrati tra _MAX_ record)"
                }
            });
        </script>
</body>

</html>