

<%@ Control Language="c#" AutoEventWireup="false" CodeFile="ucTP_MIN_DEF.ascx.cs" Inherits="TP_MIN.ASPNET.ucTP_MIN_DEF" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="1" width="100%" border="0">
  <TR>
  <TD colspan=3 align=center>
        <asp:Label id="TP_MIN_DEFLabelInfo" runat="server"></asp:Label>
  </TD>
  </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblTheDAte" runat="server" Width="100%" ForeColor="#000000">Дата акта:</asp:Label>
      </TD>
      <TD width=40%>
<input id="changedDateTheDAte" type="hidden" value=0 name="changedDateTheDAte" runat="server">
<asp:textbox id="DateTheDAte" runat="server" Width="70px"></asp:textbox>
<A id='btnTheDAte'  href="javascript:ShowCalendar('DateEdBtnTheDAte','<%=this.DateTheDAte.ClientID%>','<%=this.changedDateTheDAte.ClientID.ToString()%>')" >
<img alt="Select Date" id=DateEdBtnTheDAte height=14  src="<%=Request.ApplicationPath%>/Include/Calendar/calendar.gif"  width=23 border=0></A>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblActNum" runat="server" Width="100%" ForeColor="#000000">Номер акта:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtActNum" runat="server" Width="100%" MaxLength="80" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblClientReturns" runat="server" Width="100%" ForeColor="#000000">Возврат от абонентов:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbClientReturns" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvClientReturns" runat="server" ErrorMessage="Fill this field" ControlToValidate="cmbClientReturns"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblNDS" runat="server" Width="100%" ForeColor="#000000">Ставка НДС:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtNDS" runat="server" Width="100%" MaxLength="0" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvNDS" runat="server" ErrorMessage="Fill this field" ControlToValidate="txtNDS"></asp:RequiredFieldValidator>
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

function TP_MIN_DEFLoad()

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




