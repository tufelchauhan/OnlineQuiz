Imports System.Data.SqlClient
Partial Class AFaculty
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("aid") = 0 Then
            MsgBox("Please Login As Admin To View Faculty Details", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("VLogin.aspx")
        End If
    End Sub



    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        Dim lb As Label
        lb = e.Item.FindControl("faculty_idLabel")
        If e.CommandName = "del" Then
            Dim str As String
            str = "delete from faculty where faculty_id=" & lb.Text & ""
            Dim cmd As New SqlCommand(str, cnn)
            cnn.Open()
            cmd.ExecuteNonQuery()
            cnn.Close()
            MsgBox("Record Deleted Successfully", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("AFaculty.aspx")
        End If
    End Sub
End Class
