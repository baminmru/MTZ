

<%@ Control Language="c#" AutoEventWireup="false" CodeFile="ucTP_MIN_LINE.ascx.cs" Inherits="TP_MIN.ASPNET.ucTP_MIN_LINE" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="1" width="100%" border="0">
  <TR>
  <TD colspan=3 align=center>
        <asp:Label id="TP_MIN_LINELabelInfo" runat="server"></asp:Label>
  </TD>
  </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblMtype" runat="server" Width="100%" ForeColor="#000000">Тип модема:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbMtype" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvMtype" runat="server" ErrorMessage="Fill this field" ControlToValidate="cmbMtype"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblQuantity" runat="server" Width="100%" ForeColor="#000000">Количество модемов:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtQuantity" runat="server" Width="100%" MaxLength="0" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvQuantity" runat="server" ErrorMessage="Fill this field" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblIsBroken" runat="server" Width="100%" ForeColor="#000000">Неисправные:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbIsBroken" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvIsBroken" runat="server" ErrorMessage="Fill this field" ControlToValidate="cmbIsBroken"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblPriceNDS" runat="server" Width="100%" ForeColor="#000000">Цена  с НДС:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtPriceNDS" runat="server" Width="100%" MaxLength="0" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
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

function TP_MIN_LINELoad()

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




