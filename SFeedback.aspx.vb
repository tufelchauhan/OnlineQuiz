Imports System.Data.SqlClient
Partial Class SFeedback
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim str As String
        str = "insert into Feedback values('" & TextBox1.Text & "','" & Today & "'," & Session("sid") & ")"
        Dim cmd As New SqlCommand(str, cnn)
        cnn.Open()
        cmd.ExecuteNonQuery()
        cnn.Close()
        MsgBox("Feedback Posted Successfully", MsgBoxStyle.Information, "Online Quiz")
        Response.Redirect("SFeedback.aspx")
    End Sub
End Class
