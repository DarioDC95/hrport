<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
</head>

<body>

    <div class="modal fade" id="quiz_failed_modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border border-2 border-danger">
                <div class="modal-header bg-danger-subtle">
                    <h1 class="modal-title fs-5 d-flex flex-row justify-content-start align-items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-exclamation-square-fill" viewBox="0 0 16 16">
                            <path
                                d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                        </svg>
                        <span class="m-2"></span>
                        Quiz Annullato
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        Hai provato a barare al quiz della zucchetti.<br><br>
                        Sei proprio un fallito
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-outline-danger text-dark" data-bs-dismiss="modal">
                        <h5 class="m-0">Chiudi</h5>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <section style="min-height: 100vh;" id="open_quiz_section">
        <div class="container-fluid p-4">
            <button type="button" class="btn btn-primary text-light" id="temp_open_quiz">
                <h5 class="m-0">Apri quiz</h5>
            </button>
        </div>
    </section>

    <script>
        let openquiz = document.querySelector('#temp_open_quiz');
        const failedQuizModal = new bootstrap.Modal('#quiz_failed_modal', {});

        openquiz.addEventListener('click', e => {
            let quizWindow = open('<%=request.getContextPath()%>/user/quiz', 'quiz_window', 'toolbar=no,scrollbars=no,resizable=no,top=0,left=0,width=40000,height=40000')
            quizWindow.focus();

            quizWindow.onload = function () {
                quizWindow.initTakeQuiz('1');
            };

            quizWindow.oncontextmenu = function () {
                return false;     // cancel default menu
            }

            quizWindow.addEventListener('blur', e => {
                if (quizWindow.document.querySelector('BODY').getAttribute('data-quiz-status') == "opened") {
                    quizWindow.close();
                    return;
                }
                quizClosed();
            });

            quizWindow.window.addEventListener('fullscreenchange', e => {
                if (!quizWindow.document.fullscreenElement) {
                    e.preventDefault();
                    quizClosed();
                }
            });

            quizWindow.window.addEventListener('mouseout', e => {
                if (quizWindow.document.querySelector('BODY').getAttribute('data-quiz-status') == "opened") return;
                e = e ? e : window.event;
                var from = e.relatedTarget || e.toElement;
                if (!from || from.nodeName == "HTML") {
                    quizClosed();
                }
            })

            function quizClosed() {
                let quizStatus = quizWindow.document.querySelector('BODY').getAttribute('data-quiz-status');
                quizWindow.close();

                if(quizStatus == "timeover"){
                    alert("TEMPO SCADUTO! Il quiz e' stato inviato correttamente.");
                }

                if(quizStatus == "started"){
                    failedQuizModal.show();
                }

                if(quizStatus == "usersubmitted"){
                    alert("Il quiz e' stato inviato correttamente.");
                }
            }
        });
    </script>

</body>

</html>