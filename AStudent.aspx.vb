
Partial Class AStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("aid") = 0 Then
            MsgBox("Please Login As Admin To View Student Details", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("VLogin.aspx")
        End If
    End Sub
End Class
