

<%@ Control Language="c#" AutoEventWireup="false" CodeFile="ucRayon.ascx.cs" Inherits="TP_Spr.ASPNET.ucRayon" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="1" width="100%" border="0">
  <TR>
  <TD colspan=3 align=center>
        <asp:Label id="RayonLabelInfo" runat="server"></asp:Label>
  </TD>
  </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblName" runat="server" Width="100%" ForeColor="#000000">Район:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtName" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvName" runat="server" ErrorMessage="Fill this field" ControlToValidate="txtName"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD>
      </TD>
      <TD align="right">
        <asp:Button id="btnSave" runat="server" Text="Save" Width="88px"></asp:Button>
        <asp:Button id="btnCancel" runat="server" Text="Cancel" Width="88px" CausesValidation="false"></asp:Button>&nbsp;
      </TD>
      <TD></TD>
   </TR>
</TABLE>
<script language="javascript" type="text/javascript">

function RayonLoad()

{

    <%=GetOnLoadScript()%>

}

function ElementShow(elName)

{

 var el;

 el = document.getElementById(elName);

 if (el != null)

 {

   el.style.display = '';

 }

}

function ElementHide(elName)

{

 var el;

 el = document.getElementById(elName);

 if (el != null)

 {

   el.style.display = 'none';

 }

}

</script>




