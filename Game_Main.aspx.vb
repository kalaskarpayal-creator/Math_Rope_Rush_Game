Imports System.Data.SqlClient
Imports System.Configuration

Public Class Game_Main
    Inherits System.Web.UI.Page
    Private currentAnswer As Integer
    Protected Sub Page_Load(
    ByVal sender As Object,
    ByVal e As System.EventArgs
) Handles Me.Load

        If Not IsPostBack Then

            ViewState("Team1Score") = 0
            ViewState("Team2Score") = 0

            ViewState("ImagePosition") = 0

            lblScoreTeam1.Text = "0"
            lblScoreTeam2.Text = "0"

            hfImagePosition.Value = "0"

            GenerateQuestionTeam1()
            GenerateQuestionTeam2()

        Else

            Dim position As Integer = 0

            If ViewState("ImagePosition") IsNot Nothing Then

                position =
                Convert.ToInt32(
                    ViewState("ImagePosition")
                )

            End If

            hfImagePosition.Value =
            position.ToString()

            ScriptManager.RegisterStartupScript(
            Me,
            Me.GetType(),
            "restoreBattleImage",
            "setBattleImagePosition(" &
            position &
            ");",
            True
        )

        End If

    End Sub
    Private Sub GenerateQuestionTeam1()

        Dim random As New Random()

        Dim number1 As Integer = random.Next(1, 10)
        Dim number2 As Integer = random.Next(1, 10)

        Dim answer As Integer = number1 + number2

        ViewState("Team1Answer") = answer

        lblQuestionTeam1.Text = number1.ToString() & " + " & number2.ToString() & " = ?"

    End Sub
    Private Sub GenerateQuestionTeam2()

        Dim random As New Random()

        Dim number1 As Integer = random.Next(1, 10)
        Dim number2 As Integer = random.Next(1, 10)

        ViewState("Team2Answer") = number1 + number2

        lblQuestionTeam2.Text = number1.ToString() & " + " & number2.ToString() & " = ?"

    End Sub
    Protected Sub btnSubmitTeam1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmitTeam1.Click

        Dim correctAnswer As Integer = Convert.ToInt32(ViewState("Team1Answer"))
        Dim playerAnswer As Integer

        If Integer.TryParse(txtAnswerTeam1.Text, playerAnswer) Then

            If playerAnswer = correctAnswer Then

                ' SCORE +1
                Dim score As Integer = Convert.ToInt32(ViewState("Team1Score"))
                score += 1
                ViewState("Team1Score") = score
                lblScoreTeam1.Text = score.ToString()
                ' MOVE CHARACTER IMAGE
                MoveBattleImage()

                ' GREEN + VIBRATE
                ScriptManager.RegisterStartupScript(
                Me,
                Me.GetType(),
                "team1correct",
                "showCorrect('" & txtAnswerTeam1.ClientID & "');",
                True
            )

            Else

                ' RED + VIBRATE
                ScriptManager.RegisterStartupScript(
                Me,
                Me.GetType(),
                "team1wrong",
                "showWrong('" & txtAnswerTeam1.ClientID & "');",
                True
            )

            End If
            GenerateQuestionTeam1()

        End If

    End Sub
    Protected Sub btnSubmitTeam2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmitTeam2.Click

        Dim correctAnswer As Integer = Convert.ToInt32(ViewState("Team2Answer"))
        Dim playerAnswer As Integer

        If Integer.TryParse(txtAnswerTeam2.Text, playerAnswer) Then

            If playerAnswer = correctAnswer Then

                ' TEAM 2 SCORE +1
                Dim score As Integer = Convert.ToInt32(ViewState("Team2Score"))
                score += 1

                ViewState("Team2Score") = score
                lblScoreTeam2.Text = score.ToString()
                ' MOVE CHARACTER IMAGE
                MoveBattleImage()

                ' GREEN + VIBRATE
                ScriptManager.RegisterStartupScript(
                    Me,
                    Me.GetType(),
                    "team2correct",
                    "showCorrect('" & txtAnswerTeam2.ClientID & "');",
                    True
                )

            Else

                ' RED + VIBRATE
                ScriptManager.RegisterStartupScript(
                    Me,
                    Me.GetType(),
                    "team2wrong",
                    "showWrong('" & txtAnswerTeam2.ClientID & "');",
                    True
                )

            End If

            ' Generate next question
            GenerateQuestionTeam2()

        End If
    End Sub


    Private Sub MoveBattleImage()

        Dim team1Score As Integer =
        Convert.ToInt32(ViewState("Team1Score"))

        Dim team2Score As Integer =
        Convert.ToInt32(ViewState("Team2Score"))

        ' TEAM 1 / BLUE = LEFT
        ' TEAM 2 / RED = RIGHT

        Dim position As Integer =
        (team2Score - team1Score) * 40

        ' Maximum movement limit
        If position > 300 Then
            position = 300
        End If

        If position < -300 Then
            position = -300
        End If

        ViewState("ImagePosition") = position

        hfImagePosition.Value = position.ToString()

        ScriptManager.RegisterStartupScript(
        Me,
        Me.GetType(),
        "moveBattleImage",
        "setBattleImagePosition(" & position & ");",
        True
    )

    End Sub
    Private Sub ClearGame()

        ' Reset Score
        ViewState("Team1Score") = 0
        ViewState("Team2Score") = 0

        ' Reset Position
        ViewState("ImagePosition") = 0

        lblScoreTeam1.Text = "0"
        lblScoreTeam2.Text = "0"

        hfImagePosition.Value = "0"

        ' New Questions
        GenerateQuestionTeam1()
        GenerateQuestionTeam2()

    End Sub
    Protected Sub btnRestartGame_Click(
    ByVal sender As Object,
    ByVal e As EventArgs
) Handles btnRestartGame.Click

        ClearGame()

        ScriptManager.RegisterStartupScript(
        Me,
        Me.GetType(),
        "restartGame",
        "localStorage.removeItem('TugOfWarEndTime');" &
        "setBattleImagePosition(0);" &
        "startGameTimer();",
        True
    )

    End Sub
    Protected Sub btnHome_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnHome.Click

    End Sub
End Class