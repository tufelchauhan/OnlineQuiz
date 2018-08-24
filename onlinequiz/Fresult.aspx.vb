
Partial Class Fresult
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("fid") = 0 Then
            MsgBox("Please Login As Faculty To View Student Result", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("VLogin.aspx")
        End If
    End Sub
End Class
