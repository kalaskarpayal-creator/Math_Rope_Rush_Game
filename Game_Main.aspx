<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Game_Main.aspx.vb" Inherits="Math_Rope_Rush.Game_Main" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <style> 
        /* ============================ANSWER AREA=============================== */ 
 
        .answer-area { 
            width: 100%; 
            margin-top: 15px; 
            text-align: center; 
        } 
 
 
        /* =================ANSWER INPUT BOX========================= */ 
 
        .answer-input { 
            width: 90%; 
            height: 55px; 
            border-radius: 14px; 
            border: 3px solid #ddd; 
            background: #ffffff; 
            text-align: center; 
            font-size: 25px; 
            font-weight: 800; 
            color: #222; 
            margin-bottom: 15px; 
            box-shadow: 0 4px 10px rgba(0,0,0,0.08); 
        } 
 
 
        /* ======================NUMBER PAD================================ */ 
 
        .number-pad { 
            display: grid; 
            grid-template-columns: repeat(3, 1fr); 
            gap: 10px; 
            width: 90%; 
            max-width: 300px; 
            margin: auto; 
        } 
 
 
        /* ========================NUMBER BUTTON========================== */ 
 
        .number-btn { 
            height: 55px; 
            border: none; 
            border-radius: 14px; 
            background: #ffffff; 
            color: #222; 
            font-size: 23px; 
            font-weight: 800; 
            cursor: pointer; 
            box-shadow: 0 4px 8px rgba(0,0,0,0.12); 
            transition: 0.15s; 
        } 
 
        .number-btn:hover { 
            transform: translateY(-2px); 
        } 
 
        .number-btn:active { 
            transform: scale(0.95); 
        } 
 
 
        /* ====================CLEAR BUTTON========================= */ 
 
        .clear-btn { 
            background: #ffe4e4; 
            color: #d62828; 
        } 
 
 
        /* =======================SUBMIT BUTTON========================== */ 
 
        .submit-btn { 
            background: #22a447; 
            color: white; 
        } 
 
 
        /* ====================SCORE BOARD============================= */ 
 
        .battle-score-board { 
            width: 100%; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            gap: 25px; 
            margin-bottom: 15px; 
        } 
 
 
        .battle-team-score { 
            display: flex; 
            flex-direction: column; 
            align-items: center; 
            justify-content: center; 
            min-width: 100px; 
        } 
 
 
        .battle-team-score > span:first-child { 
            font-size: 17px; 
            font-weight: 800; 
            margin-bottom: 5px; 
        } 
 
 
        /* SCORE CIRCLE */ 
 
        .battle-score { 
            width: 55px; 
            height: 55px; 
            border-radius: 50%; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            background: #ffffff; 
            border: 4px solid #ddd; 
            font-size: 25px; 
            font-weight: 900; 
            box-shadow: 0 5px 12px rgba(0,0,0,0.15); 
        } 
 
 
        /* TEAM 1 SCORE */ 
 
        .team1-score .battle-score { 
            border-color: #2589ff; 
            color: #1673d1; 
        } 
 
 
        /* TEAM 2 SCORE */ 
 
        .team2-score .battle-score { 
            border-color: #ef4444; 
            color: #dc2626; 
        } 
 
 
        /* VS */ 
 
        .score-vs { 
            font-size: 18px; 
            font-weight: 900; 
            color: #777; 
        } 
 
 
        /* =======================GAME TIMER======================== */ 
 
        .game-timer { 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            gap: 8px; 
            margin: 10px auto 15px auto; 
            width: fit-content; 
            min-width: 120px; 
            padding: 8px 18px; 
            background: #ffffff; 
            border: 3px solid #ff9800; 
            border-radius: 30px; 
            box-shadow: 0 5px 12px rgba(0,0,0,0.12); 
        } 
 
        .timer-icon { 
            font-size: 22px; 
        } 
 
 
        .timer-text { 
            font-size: 28px; 
            font-weight: 900; 
            color: #e85c17; 
            min-width: 35px; 
            text-align: center; 
        } 
 
 
        .timer-unit { 
            font-size: 12px; 
            font-weight: 800; 
            color: #777; 
        } 
    
 
  
 
 
/* ========================================================= 
   CHARACTERS GROUP 
   ========================================================= */ 
 
        .battle-characters { 
            position: absolute; 
            bottom: 0; 
            height: 270px; 
            display: flex; 
            align-items: flex-end; 
            z-index: 5; 
        } 
        /* ================= ANSWER RESULT ================= */ 
 
        .answer-correct { 
            border: 3px solid #22a447 !important; 
            background-color: #dcfce7 !important; 
            color: #15803d !important; 
            animation: answerVibrate 0.4s; 
        } 
 
        .answer-wrong { 
            border: 3px solid #dc2626 !important; 
            background-color: #fee2e2 !important; 
            color: #dc2626 !important; 
            animation: answerVibrate 0.4s; 
        } 
 
        @keyframes answerVibrate { 
            0% { 
                transform: translateX(0); 
            } 
 
            20% { 
                transform: translateX(-8px); 
            } 
 
            40% { 
                transform: translateX(8px); 
            } 
 
            60% { 
                transform: translateX(-6px); 
            } 
 
            80% { 
                transform: translateX(6px); 
            } 
 
            100% { 
                transform: translateX(0); 
            } 
        } 
        .battle-center-line { 
            position: absolute; 
            left: 50%; 
            top: 50%; 
            transform: translate(-50%, -50%); 
            width: 90%; 
            text-align: center; 
            z-index: 1; 
            pointer-events: none; 
        } 
 
            .battle-center-line span { 
                font-size: 45px; 
                font-weight: 900; 
                letter-spacing: 8px; 
                color: #555; 
            } 
            /* ================================ 
   TUG OF WAR IMAGE AREA 
   ================================ */ 
 
        .character-battle-stage { 
            width: 100%; 
            max-width: 760px; 
            height: 285px; 
            margin: 8px auto 5px auto; 
            position: relative; 
            overflow: visible; 
        } 
 
 
/* ================================ 
   CHARACTER IMAGE 
   ================================ */ 
 
.tug-battle-image { 
    position: absolute; 
 
     
    left: 50%; 
    top: 50%; 
 
    width: 600px; 
    height: 260px; 
 
    object-fit: contain; 
 
     
    transform: translate(-50%, -50%); 
 
    z-index: 1; 
 
    /* Smooth movement */ 
    transition: transform 0.6s ease-in-out; 
} 
/* =========================
   WINNER CELEBRATION POPUP
   ========================= */

/* =====================================================
   WINNER BACKGROUND OVERLAY
   ===================================================== */

.winner-overlay {
    display: none;

    position: fixed;
    inset: 0;

    background: rgba(0, 0, 0, 0.55);

    backdrop-filter: blur(7px);
    -webkit-backdrop-filter: blur(7px);

    z-index: 9998;
}


/* =====================================================
   WINNER POPUP
   ===================================================== */

.winner-message {

    display: none;

    position: fixed;

    top: 50%;
    left: 50%;

    transform: translate(-50%, -50%);

    width: 520px;
    max-width: 88vw;

    min-height: 330px;

    padding: 45px 35px;

    box-sizing: border-box;

    background:
        linear-gradient(
            145deg,
            #fffdf0,
            #ffffff,
            #eef8ff
        );

    border: 6px solid #ffd700;

    border-radius: 35px;

    text-align: center;

    font-size: 38px;
    font-weight: 900;

    color: #222;

    box-shadow:
        0 0 0 10px rgba(255, 215, 0, 0.15),
        0 20px 70px rgba(0, 0, 0, 0.45);

    z-index: 9999;

    animation: winnerPopup 0.7s ease-out;
}

/* =====================================================
   SCORE
   ===================================================== */

.winner-message small {

    display: block;

    margin-top: 15px;

    font-size: 24px;

    font-weight: 800;

    color: #555;
}


/* =====================================================
   POPUP ANIMATION
   ===================================================== */

@keyframes winnerPopup {

    0% {
        transform:
            translate(-50%, -50%)
            scale(0.3);

        opacity: 0;
    }

    60% {
        transform:
            translate(-50%, -50%)
            scale(1.12);

        opacity: 1;
    }

    80% {
        transform:
            translate(-50%, -50%)
            scale(0.96);
    }

    100% {
        transform:
            translate(-50%, -50%)
            scale(1);
    }
}


/* =====================================================
   CELEBRATION
   ===================================================== */

@keyframes celebrationBounce {

    0%, 100% {
        transform: scale(1);
    }

    50% {
        transform: scale(1.18);
    }
}



/* =========================
   POPUP ANIMATION
   ========================= */

@keyframes winnerPopup {

    0% {
        transform: translate(-50%, -50%) scale(0.3);
        opacity: 0;
    }

    60% {
        transform: translate(-50%, -50%) scale(1.15);
        opacity: 1;
    }

    80% {
        transform: translate(-50%, -50%) scale(0.95);
    }

    100% {
        transform: translate(-50%, -50%) scale(1);
        opacity: 1;
    }
}


         /*=================
   SCORE INSIDE POPUP
   ========================= */
        .winner-message small {
            display: block;
            margin-top: 12px;
            font-size: 20px;
            font-weight: 800;
            color: #555;
        }    /* ========================= 
   TEAM PANELS ABOVE IMAGE 
   ========================= */ 
 
        .team-panel { 
            position: relative; 
            z-index: 20; 
        } 
 
/* ========================= 
   BATTLE AREA BELOW PANELS 
   ========================= */

        .battle-area {
            position: relative;
            z-index: 5;
        } 
 
 
/* ========================= 
   CHARACTER IMAGE 
   ========================= */

        .character-battle-stage {
            position: relative;
            z-index: 1;
            overflow: visible;
        }


        .tug-battle-image {
            position: absolute;
            left: 50%;
            top: 50%;
            width: 600px;
            height: 260px;
            object-fit: contain;
            transform: translate(-50%, -50%);
            z-index: 1;
            transition: transform 0.6s ease-in-out;
            pointer-events: none;
        } 
        /* =====================================================
   WINNER BUTTON AREA
   ===================================================== */

.winner-buttons {

    display: flex;

    justify-content: center;

    gap: 18px;

    margin-top: 30px;

    flex-wrap: wrap;
}


/* =====================================================
   WINNER BUTTON
   ===================================================== */

.winner-btn {

    min-width: 180px;

    height: 55px;

    padding: 0 22px;

    border: none;

    border-radius: 16px;

    font-size: 18px;

    font-weight: 900;

    cursor: pointer;

    box-shadow:
        0 6px 15px rgba(0,0,0,0.18);

    transition:
        transform 0.2s,
        box-shadow 0.2s;
}


.winner-btn:hover {

    transform: translateY(-3px);

    box-shadow:
        0 9px 20px rgba(0,0,0,0.25);
}


.winner-btn:active {

    transform: scale(0.95);
}


/* RESTART */

.restart-btn {

    background: #22a447;

    color: white;
}


/* HOME */

        .home-btn {
            background: #2589ff;
            color: white;
        }
    /* =====================================================
   PROFESSIONAL BLASTER CELEBRATION
   ===================================================== */

/* =====================================================
   PROFESSIONAL BLASTER CELEBRATION
   ===================================================== */

.blaster-celebration {
    display: none;
    position: fixed;
    inset: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    pointer-events: none;
    z-index: 10000;
}


/* =====================================================
   BLASTER CORE
   ===================================================== */

.blast {
    position: absolute;

    width: 18px;
    height: 18px;

    border-radius: 50%;

    background: #ffffff;

    box-shadow:
        0 0 8px #ffffff,
        0 0 20px currentColor,
        0 0 40px currentColor,
        0 0 70px currentColor;

    animation: professionalBlast 1.5s ease-out infinite;
}


/* =====================================================
   SPARK PARTICLES
   ===================================================== */

.blast-particles {
    position: absolute;

    left: 50%;
    top: 50%;

    width: 7px;
    height: 7px;

    border-radius: 50%;

    background: currentColor;

    box-shadow:
        0 -95px 0 currentColor,
        25px -90px 0 currentColor,
        50px -75px 0 currentColor,
        72px -50px 0 currentColor,
        90px -20px 0 currentColor,
        95px 10px 0 currentColor,
        80px 40px 0 currentColor,
        55px 70px 0 currentColor,
        25px 90px 0 currentColor,
        0 100px 0 currentColor,

        -25px 90px 0 currentColor,
        -55px 70px 0 currentColor,
        -80px 40px 0 currentColor,
        -95px 10px 0 currentColor,
        -90px -20px 0 currentColor,
        -72px -50px 0 currentColor,
        -50px -75px 0 currentColor,
        -25px -90px 0 currentColor;

    animation: professionalParticles 1.5s ease-out infinite;
}


/* =====================================================
   BLASTER POSITIONS
   ===================================================== */

.blast-1 {
    left: 8%;
    top: 25%;
    color: #00b7ff;
}

.blast-2 {
    left: 92%;
    top: 25%;
    color: #ff1744;
    animation-delay: 0.25s;
}

.blast-3 {
    left: 10%;
    top: 65%;
    color: #ffd600;
    animation-delay: 0.5s;
}

.blast-4 {
    left: 90%;
    top: 65%;
    color: #00e676;
    animation-delay: 0.75s;
}

.blast-5 {
    left: 50%;
    top: 10%;
    color: #ff9100;
    animation-delay: 1s;
}


/* =====================================================
   BLASTER FLASH
   ===================================================== */

.blast::before {
    content: "";

    position: absolute;

    left: 50%;
    top: 50%;

    width: 25px;
    height: 25px;

    border-radius: 50%;

    border: 3px solid currentColor;

    transform:
        translate(-50%, -50%)
        scale(0);

    animation: blastFlash 1.5s ease-out infinite;
}


/* =====================================================
   OUTER RING
   ===================================================== */

.blast::after {
    content: "";

    position: absolute;

    left: 50%;
    top: 50%;

    width: 12px;
    height: 12px;

    border-radius: 50%;

    border: 2px solid currentColor;

    transform:
        translate(-50%, -50%)
        scale(0);

    animation:
        blastRing 1.5s ease-out infinite;
}


/* =====================================================
   MAIN BLAST
   ===================================================== */

@keyframes professionalBlast {

    0% {
        transform: scale(0);
        opacity: 0;
    }

    8% {
        transform: scale(0.5);
        opacity: 1;
    }

    18% {
        transform: scale(2);
        opacity: 1;
    }

    35% {
        transform: scale(1);
        opacity: 0.9;
    }

    60% {
        transform: scale(0.7);
        opacity: 0.5;
    }

    100% {
        transform: scale(0);
        opacity: 0;
    }
}


/* =====================================================
   FLASH EFFECT
   ===================================================== */

@keyframes blastFlash {

    0% {
        transform:
            translate(-50%, -50%)
            scale(0);

        opacity: 1;
    }

    20% {
        transform:
            translate(-50%, -50%)
            scale(5);

        opacity: 0.8;
    }

    50% {
        transform:
            translate(-50%, -50%)
            scale(9);

        opacity: 0;
    }

    100% {
        transform:
            translate(-50%, -50%)
            scale(9);

        opacity: 0;
    }
}


/* =====================================================
   OUTER RING
   ===================================================== */

@keyframes blastRing {

    0% {
        transform:
            translate(-50%, -50%)
            scale(0);

        opacity: 1;
    }

    40% {
        transform:
            translate(-50%, -50%)
            scale(8);

        opacity: 0.8;
    }

    100% {
        transform:
            translate(-50%, -50%)
            scale(15);

        opacity: 0;
    }
}


/* =====================================================
   PARTICLE EXPLOSION
   ===================================================== */

@keyframes professionalParticles {

    0% {
        transform:
            translate(-50%, -50%)
            scale(0)
            rotate(0deg);

        opacity: 0;
    }

    10% {
        transform:
            translate(-50%, -50%)
            scale(0.7)
            rotate(30deg);

        opacity: 1;
    }

    35% {
        transform:
            translate(-50%, -50%)
            scale(1)
            rotate(100deg);

        opacity: 1;
    }

    65% {
        transform:
            translate(-50%, -50%)
            scale(1.2)
            rotate(220deg);

        opacity: 0.8;
    }

    100% {
        transform:
            translate(-50%, -50%)
            scale(0.3)
            rotate(360deg);

        opacity: 0;
    }
}
/* =====================================================
   WINNER POPUP - MORE PROFESSIONAL
   ===================================================== */

.winner-message {
    position: fixed;

    top: 50%;
    left: 50%;

    transform: translate(-50%, -50%);

    width: 520px;
    max-width: 88vw;
    min-height: 330px;

    padding: 45px 35px;

    box-sizing: border-box;

    background:
        linear-gradient(
            145deg,
            #ffffff,
            #f4f8ff
        );

    border: 5px solid #ffd700;

    border-radius: 30px;

    text-align: center;

    font-size: 38px;
    font-weight: 900;

    color: #222;

    box-shadow:
        0 0 0 6px rgba(255, 215, 0, 0.15),
        0 0 35px rgba(255, 215, 0, 0.55),
        0 20px 70px rgba(0, 0, 0, 0.55);

    z-index: 10001;

    animation: winnerPopup 0.7s ease-out;
}


/* IMPORTANT:
   Remove emoji decorations completely
*/

.winner-message::before,
.winner-message::after {
    content: none !important;
}


/* =========================
   WINNER SCORE
   ========================= */

.winner-message small {
    display: block;

    margin-top: 18px;

    font-size: 22px;

    font-weight: 800;

    color: #555;
}


/* =========================
   WINNER POPUP ANIMATION
   ========================= */

@keyframes winnerPopup {

    0% {
        transform:
            translate(-50%, -50%)
            scale(0.3);

        opacity: 0;
    }

    60% {
        transform:
            translate(-50%, -50%)
            scale(1.12);

        opacity: 1;
    }

    80% {
        transform:
            translate(-50%, -50%)
            scale(0.96);
    }

    100% {
        transform:
            translate(-50%, -50%)
            scale(1);

        opacity: 1;
    }
}


  </style> 
 
 
    <script> 

        /* =================NUMBER PAD========================= */

        function addNumber(number, textboxId) {

            var textbox = document.getElementById(textboxId);

            if (textbox) {
                textbox.value += number;
            }
            return false;
        }


        /* ===================CLEAR / BACKSPACE==================== */

        function clearAnswer(textboxId) {
            var textbox = document.getElementById(textboxId);

            if (textbox) {
                textbox.value = textbox.value.slice(0, -1);
                textbox.focus();
            }

            return false;
        }
        function showCorrect(textboxId) {

            var textbox = document.getElementById(textboxId);

            if (textbox) {

                textbox.classList.remove("answer-wrong");
                textbox.classList.add("answer-correct");

                setTimeout(function () {

                    textbox.value = "";
                    textbox.classList.remove("answer-correct");

                    // New question trigger
                }, 700);
            }
        }


        function showWrong(textboxId) {

            var textbox = document.getElementById(textboxId);

            if (textbox) {

                textbox.classList.remove("answer-correct");
                textbox.classList.add("answer-wrong");

                setTimeout(function () {

                    textbox.value = "";
                    textbox.classList.remove("answer-wrong");

                    // New question trigger

                }, 700);
            }
        }
        function setBattleImagePosition(position) {

            var image =
                document.getElementById('<%= imgBattle.ClientID %>');

            if (!image)
                return;

            image.style.transform =
                "translate(calc(-50% + " + position + "px), -50%)";

            // Store latest position for timer/winner 
            var hiddenPosition =
                document.getElementById('<%= hfImagePosition.ClientID %>');

            if (hiddenPosition) {
                hiddenPosition.value = position;
            }
        }


        /* ===================================================== 
     GAME TIMER - 30 SECONDS 
     TIMER WILL NOT RESET ON POSTBACK 
     ===================================================== */

        var gameTimerInterval = null;
        var gameFinished = false;

        function startGameTimer() {

            var timerLabel = document.getElementById('<%= lblTimer.ClientID %>');

            if (!timerLabel)
                return;

            var endTime = localStorage.getItem("TugOfWarEndTime");

            if (!endTime) {

                endTime = new Date().getTime() + (30 * 1000);

                localStorage.setItem(
                    "TugOfWarEndTime",
                    endTime
                );
            }

            if (gameTimerInterval !== null) {
                clearInterval(gameTimerInterval);
            }

            function updateTimer() {

                if (gameFinished)
                    return;

                var now = new Date().getTime();

                var remaining =
                    Math.ceil((parseInt(endTime) - now) / 1000);

                if (remaining < 0)
                    remaining = 0;

                timerLabel.innerText = remaining;

                // Last 5 seconds
                if (remaining <= 5) {

                    timerLabel.style.color = "#dc2626";

                } else {

                    timerLabel.style.color = "#e85c17";
                }

                // TIME OVER
                if (remaining <= 0) {

                    clearInterval(gameTimerInterval);
                    gameTimerInterval = null;

                    localStorage.removeItem("TugOfWarEndTime");

                    finishGame();

                    return;
                }
            }

            updateTimer();

            gameTimerInterval =
                setInterval(updateTimer, 250);
        }

        /* ===================================================== 
           GAME FINISH 
           ===================================================== */

        function finishGame() {

            if (gameFinished)
                return;

            gameFinished = true;


            // =========================
            // GET POPUP ELEMENTS
            // =========================

            var winner =
                document.getElementById("winnerPopup");

            var winnerText =
                document.getElementById("winnerText");

            var overlay =
                document.getElementById("winnerOverlay");


            if (!winner || !winnerText)
                return;


            // =========================
            // GET FINAL SCORES
            // =========================

            var scoreElement1 =
                document.getElementById(
            '<%= lblScoreTeam1.ClientID %>'
        );

           var scoreElement2 =
               document.getElementById(
            '<%= lblScoreTeam2.ClientID %>'
        );


    var team1Score =
        parseInt(scoreElement1.innerText) || 0;

    var team2Score =
        parseInt(scoreElement2.innerText) || 0;


    // =========================
    // WINNER
    // =========================

    if (team1Score > team2Score) {

        winnerText.innerHTML =
            "🏆 🔵 TEAM 1 WINS!<br>" +
            "<small>Score: " +
            team1Score +
            " - " +
            team2Score +
            "</small>";

    }
    else if (team2Score > team1Score) {

        winnerText.innerHTML =
            "🏆 🔴 TEAM 2 WINS!<br>" +
            "<small>Score: " +
            team2Score +
            " - " +
            team1Score +
            "</small>";

    }
    else {

        winnerText.innerHTML =
            "🤝 MATCH DRAW!<br>" +
            "<small>Score: " +
            team1Score +
            " - " +
            team2Score +
            "</small>";
    }


    // =========================
    // SHOW POPUP
    // =========================

            if (overlay)
                overlay.style.display = "block";

            var blaster =
                document.getElementById("blasterCelebration");

            if (blaster)
                blaster.style.display = "block";

            winner.style.display = "block";


    // =========================
    // DISABLE SUBMIT BUTTONS
    // =========================

    var btn1 =
        document.getElementById(
            '<%= btnSubmitTeam1.ClientID %>'
        );

    var btn2 =
        document.getElementById(
            '<%= btnSubmitTeam2.ClientID %>'
        );


           if (btn1)
               btn1.disabled = true;

           if (btn2)
               btn2.disabled = true;
       }
 
        /* ===================================================== 
           START TIMER WHEN PAGE LOADS 
           ===================================================== */ 
 
        window.addEventListener("load", function () { 
 
            startGameTimer(); 
 
        }); 
 
       
     
    </script> 
 
</asp:Content> 
 
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> 
 
 
    <!-- ===================GAME HEADER======================== --> 
 
    <div class="game-title-area"> 
 
        <asp:Label ID="lblGameTitle" runat="server" CssClass="game-main-title" Text="🧠 MATH TUG BATTLE"></asp:Label> 
    </div> 
 
     <!-- ======================GAME BOARD================== --> 
 
    <div class="game-board"> 
        <!-- ====================TEAM 1========================= --> 
        <asp:HiddenField ID="hfImagePosition" runat="server" Value="0" /> 
        <div class="team-panel team-blue"> 
            <!-- TEAM HEADER --> 
 
            <div class="team-header"> 
                <asp:Label ID="lblTeam1" runat="server" CssClass="team-name" Text="🔵 TEAM 1"></asp:Label> 
            </div> 
              
            <!-- QUESTION --> 
            <div class="question-card"> 
                <asp:Label ID="lblQuestionTitle1" runat="server" CssClass="question-label" Text=""></asp:Label> 
                <asp:Label ID="lblQuestionTeam1" runat="server" CssClass="question-text" Text="7 + 4 = ?"></asp:Label> 
            </div> 
                      
            <!-- ANSWER AREA --> 
 
            <div class="answer-area"> 
                <!-- ANSWER BOX --> 
                <asp:TextBox ID="txtAnswerTeam1" runat="server" CssClass="answer-input" placeholder="Enter the Answer here..."></asp:TextBox> 
 
                <!-- NUMBER PAD --> 
              <div class="number-pad"> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('1','<%= txtAnswerTeam1.ClientID %>');">1</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('2','<%= txtAnswerTeam1.ClientID %>');">2</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('3','<%= txtAnswerTeam1.ClientID %>');">3</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('4','<%= txtAnswerTeam1.ClientID %>');">4</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('5','<%= txtAnswerTeam1.ClientID %>');">5</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('6','<%= txtAnswerTeam1.ClientID %>');">6</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('7','<%= txtAnswerTeam1.ClientID %>');">7</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('8','<%= txtAnswerTeam1.ClientID %>');">8</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('9','<%= txtAnswerTeam1.ClientID %>');">9</button> 
 
    <button type="button" class="number-btn clear-btn" 
        onclick="return clearAnswer('<%= txtAnswerTeam1.ClientID %>');">⌫</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('0','<%= txtAnswerTeam1.ClientID %>');">0</button> 
 
    <asp:Button ID="btnSubmitTeam1" 
        runat="server" 
        Text="✓" 
        CssClass="number-btn submit-btn" 
        OnClick="btnSubmitTeam1_Click" /> 
 
</div> 
            </div> 
            
 
           
 
        </div> 
 
                <!-- ========================CENTER BATTLE AREA================================= --> 
 
        <div class="battle-area"> 
            <!-- ===================SCORE BOARD=============================== --> 
            <div class="battle-score-board"> 
                <!-- TEAM 1 SCORE --> 
 
                <div class="battle-team-score team1-score"> 
                    <asp:Label ID="lblBattleTeam1" runat="server" Text="🔵 TEAM 1"></asp:Label> 
                    <asp:Label ID="lblScoreTeam1" runat="server" CssClass="battle-score" Text="0"></asp:Label> 
                </div> 
                 <!-- VS --> 
 
                <div class="score-vs"> 
                    VS 
                </div> 
 
                <!-- TEAM 2 SCORE --> 
                <div class="battle-team-score team2-score"> 
                    <asp:Label ID="lblBattleTeam2" runat="server" Text="🔴 TEAM 2"></asp:Label> 
                    <asp:Label ID="lblScoreTeam2" runat="server" CssClass="battle-score" Text="0"></asp:Label> 
                </div> 
            </div> 
 
             <!-- =====================TIMER=============================== --> 
 
            <div class="game-timer"> 
                <span class="timer-icon">⏱️</span> 
                <asp:Label ID="lblTimer" runat="server" CssClass="timer-text" Text="30"></asp:Label> 
                <span class="timer-unit">SEC</span> 
            </div> 
 
            <!-- ===============TUG OF WAR CHARACTERS====================== --> 
 
 
    <div class="character-battle-stage">

    <div class="battle-center-line">
        <span>---</span>
    </div> 
   <img id="imgBattle" runat="server" 
     src="Images/character_PIC.png" 
     class="tug-battle-image" 
     alt="Tug of War Characters"/> 
    
</div> 
     
     
</div> 
        <!-- TEAM 2 --> 
            <!-- ===================BATTLE TITLE============================== --> 
            <asp:Label ID="lblBattleTitle" runat="server" CssClass="battle-label" Text="🪢 TUG OF WAR"></asp:Label>  
 
           
     <!-- ================= WINNER OVERLAY ================= -->

<!-- ================= WINNER OVERLAY ================= -->

<div id="winnerOverlay" class="winner-overlay"></div>


<!-- ================= BLASTER CELEBRATION ================= -->

<div id="blasterCelebration" class="blaster-celebration">

    <div class="blast blast-1">
        <div class="blast-particles"></div>
    </div>

    <div class="blast blast-2">
        <div class="blast-particles"></div>
    </div>

    <div class="blast blast-3">
        <div class="blast-particles"></div>
    </div>

    <div class="blast blast-4">
        <div class="blast-particles"></div>
    </div>

    <div class="blast blast-5">
        <div class="blast-particles"></div>
    </div>

</div>


<!-- ================= WINNER POPUP ================= -->

<div id="winnerPopup" class="winner-message">

    <div id="winnerText"></div>

    <div class="winner-buttons">

        <asp:Button ID="btnRestartGame"
            runat="server"
            Text="🔄 RESTART GAME"
            CssClass="winner-btn restart-btn"
            OnClick="btnRestartGame_Click" />

        <asp:Button ID="btnHome"
            runat="server"
            Text="🏠 HOME"
            CssClass="winner-btn home-btn"
            OnClick="btnHome_Click" />

    </div>

</div>
        <div class="team-panel team-red"> 
 
     <!-- TEAM HEADER --> 
     <div class="team-header"> 
         <asp:Label ID="lblTeam2" runat="server" CssClass="team-name" Text="🔴 TEAM 2"></asp:Label> 
     </div> 
 
     <!-- QUESTION --> 
     <div class="question-card"> 
         <asp:Label ID="lblQuestionTitle2" runat="server" CssClass="question-label" Text=""></asp:Label> 
         <asp:Label ID="lblQuestionTeam2" runat="server" CssClass="question-text" Text="9 + 6 = ?"></asp:Label> 
     </div> 
 
     <!-- ANSWER AREA --> 
     <div class="answer-area"> 
 
         <!-- ANSWER BOX --> 
         <asp:TextBox ID="txtAnswerTeam2" runat="server" CssClass="answer-input" placeholder="Enter the Answer here..."></asp:TextBox> 
 
         <!-- NUMBER PAD --> 
        <div class="number-pad"> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('1','<%= txtAnswerTeam2.ClientID %>');">1</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('2','<%= txtAnswerTeam2.ClientID %>');">2</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('3','<%= txtAnswerTeam2.ClientID %>');">3</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('4','<%= txtAnswerTeam2.ClientID %>');">4</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('5','<%= txtAnswerTeam2.ClientID %>');">5</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('6','<%= txtAnswerTeam2.ClientID %>');">6</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('7','<%= txtAnswerTeam2.ClientID %>');">7</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('8','<%= txtAnswerTeam2.ClientID %>');">8</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('9','<%= txtAnswerTeam2.ClientID %>');">9</button> 
 
    <button type="button" class="number-btn clear-btn" 
        onclick="return clearAnswer('<%= txtAnswerTeam2.ClientID %>');">⌫</button> 
 
    <button type="button" class="number-btn" 
        onclick="return addNumber('0','<%= txtAnswerTeam2.ClientID %>');">0</button> 
 
    <asp:Button ID="btnSubmitTeam2" 
        runat="server" 
        Text="✓" 
        CssClass="number-btn submit-btn" 
        OnClick="btnSubmitTeam2_Click" /> 
 
</div> 
 
     <!-- PLAYERS --> 
     
 </div> 
        </div> 
        <!-- ===================TEAM 2=========================== --> 
       </div> 
 
 
</asp:Content>       