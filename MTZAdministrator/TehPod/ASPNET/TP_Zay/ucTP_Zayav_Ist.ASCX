

<%@ Control Language="c#" AutoEventWireup="false" CodeFile="ucTP_Zayav_Ist.ascx.cs" Inherits="TP_Zay.ASPNET.ucTP_Zayav_Ist" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="1" width="100%" border="0">
  <TR>
  <TD colspan=3 align=center>
        <asp:Label id="TP_Zayav_IstLabelInfo" runat="server"></asp:Label>
  </TD>
  </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblImenStatys" runat="server" Width="100%" ForeColor="#000000">Изменён статус:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtImenStatys" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvImenStatys" runat="server" ErrorMessage="Fill this field" ControlToValidate="txtImenStatys"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblData" runat="server" Width="100%" ForeColor="#000000">Дата и время изменения:</asp:Label>
      </TD>
      <TD width=40%>
<input id="changedDateData" type="hidden" value=0 name="changedDateData" runat="server">
<asp:textbox id="DateData" runat="server" Width="70px"></asp:textbox>
<A id='btnData' alt="Select date" href="javascript:ShowCalendar('DateEdBtnData','<%=this.DateData.ClientID%>','<%=this.changedDateData.ClientID.ToString()%>')" >
<img id=DateEdBtnData height=14  src="<%=Request.ApplicationPath%>/Include/Calendar/calendar.gif"  width=23 border=0></A>
<asp:textbox id="TimeData" runat="server" Width="50px"></asp:textbox>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvData" runat="server" ErrorMessage="Fill this field" ControlToValidate="DateData"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblFIO" runat="server" Width="100%" ForeColor="#000000">Изменил(ФИО):</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtFIO" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblKomment" runat="server" Width="100%" ForeColor="#000000">Комментарий:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtKomment" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
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

function TP_Zayav_IstLoad()

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




