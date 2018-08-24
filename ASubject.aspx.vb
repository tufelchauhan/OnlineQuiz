Imports System.Data.SqlClient
Partial Class ASubject
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim str As String
        str = "insert into subject values('" & TextBox1.Text & "'," & DropDownList1.SelectedValue & ")"
        Dim cmd As New SqlCommand(str, cnn)
        cnn.Open()
        cmd.ExecuteNonQuery()
        cnn.Close()
        MsgBox("Subject Added Successfully", MsgBoxStyle.Information, "Online Quiz")
        Response.Redirect("ASubject.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("aid") = 0 Then
            MsgBox("Please Login As Admin To Add Subject", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("VLogin.aspx")
        End If
    End Sub
End Class
