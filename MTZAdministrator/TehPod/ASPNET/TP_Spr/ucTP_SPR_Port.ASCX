

<%@ Control Language="c#" AutoEventWireup="false" CodeFile="ucTP_SPR_Port.ascx.cs" Inherits="TP_Spr.ASPNET.ucTP_SPR_Port" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="1" width="100%" border="0">
  <TR>
  <TD colspan=3 align=center>
        <asp:Label id="TP_SPR_PortLabelInfo" runat="server"></asp:Label>
  </TD>
  </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblName" runat="server" Width="100%" ForeColor="#000000">Название:</asp:Label>
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

function TP_SPR_PortLoad()

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




