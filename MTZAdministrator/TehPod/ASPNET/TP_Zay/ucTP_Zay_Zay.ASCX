

<%@ Control Language="c#" AutoEventWireup="false" CodeFile="ucTP_Zay_Zay.ascx.cs" Inherits="TP_Zay.ASPNET.ucTP_Zay_Zay" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="1" width="100%" border="0">
  <TR>
  <TD colspan=3 align=center>
        <asp:Label id="TP_Zay_ZayLabelInfo" runat="server"></asp:Label>
  </TD>
  </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblNum" runat="server" Width="100%" ForeColor="#000000">Номер заявки :</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtNum" runat="server" Width="100%" MaxLength="0" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvNum" runat="server" ErrorMessage="Fill this field" ControlToValidate="txtNum"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblDataPriem" runat="server" Width="100%" ForeColor="#000000">Дата приема:</asp:Label>
      </TD>
      <TD width=40%>
<input id="changedDateDataPriem" type="hidden" value=0 name="changedDateDataPriem" runat="server">
<asp:textbox id="DateDataPriem" runat="server" Width="70px"></asp:textbox>
<A id='btnDataPriem'  href="javascript:ShowCalendar('DateEdBtnDataPriem','<%=this.DateDataPriem.ClientID%>','<%=this.changedDateDataPriem.ClientID.ToString()%>')" >
<img alt="Select Date" id=DateEdBtnDataPriem height=14  src="<%=Request.ApplicationPath%>/Include/Calendar/calendar.gif"  width=23 border=0></A>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvDataPriem" runat="server" ErrorMessage="Fill this field" ControlToValidate="DateDataPriem"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblFIO" runat="server" Width="100%" ForeColor="#000000">ФИО:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtFIO" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
          <asp:RequiredFieldValidator id="rfvFIO" runat="server" ErrorMessage="Fill this field" ControlToValidate="txtFIO"></asp:RequiredFieldValidator>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblTheOperator" runat="server" Width="100%" ForeColor="#000000">Оператор:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbTheOperator" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblAdres" runat="server" Width="100%" ForeColor="#000000">Адрес:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtAdres" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblRayon" runat="server" Width="100%" ForeColor="#000000">Район:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbRayon" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblMetro" runat="server" Width="100%" ForeColor="#000000">Метро:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbMetro" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblKonrLizo" runat="server" Width="100%" ForeColor="#000000">Контактное лицо:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtKonrLizo" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblKontTelefon" runat="server" Width="100%" ForeColor="#000000">Контактный телефон:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtKontTelefon" runat="server" Width="100%" MaxLength="100" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblKontEMAIL" runat="server" Width="100%" ForeColor="#000000">Контактный e-mail:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtKontEMAIL" runat="server" Width="100%" MaxLength="100" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblVremjaDljaSvjazi" runat="server" Width="100%" ForeColor="#000000">Время для связи:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtVremjaDljaSvjazi" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblGelData" runat="server" Width="100%" ForeColor="#000000">Желаемая дата визита инсталятора:</asp:Label>
      </TD>
      <TD width=40%>
<input id="changedDateGelData" type="hidden" value=0 name="changedDateGelData" runat="server">
<asp:textbox id="DateGelData" runat="server" Width="70px"></asp:textbox>
<A id='btnGelData'  href="javascript:ShowCalendar('DateEdBtnGelData','<%=this.DateGelData.ClientID%>','<%=this.changedDateGelData.ClientID.ToString()%>')" >
<img alt="Select Date" id=DateEdBtnGelData height=14  src="<%=Request.ApplicationPath%>/Include/Calendar/calendar.gif"  width=23 border=0></A>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblGelVremja" runat="server" Width="100%" ForeColor="#000000">Желаемое время визита инсталятора:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbGelVremja" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblPortref" runat="server" Width="100%" ForeColor="#000000">Порт:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbPortref" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblKoordin" runat="server" Width="100%" ForeColor="#000000">Координатор:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbKoordin" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblIngener" runat="server" Width="100%" ForeColor="#000000">Инженер:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbIngener" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblVidanModemSer" runat="server" Width="100%" ForeColor="#000000">Выданный модем серийник:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtVidanModemSer" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblTarif" runat="server" Width="100%" ForeColor="#000000">Тариф:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbTarif" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblFIOdogovor" runat="server" Width="100%" ForeColor="#000000">ФИО в договоре:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtFIOdogovor" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblDataInstall" runat="server" Width="100%" ForeColor="#000000">Дата инсталяции:</asp:Label>
      </TD>
      <TD width=40%>
<input id="changedDateDataInstall" type="hidden" value=0 name="changedDateDataInstall" runat="server">
<asp:textbox id="DateDataInstall" runat="server" Width="70px"></asp:textbox>
<A id='btnDataInstall'  href="javascript:ShowCalendar('DateEdBtnDataInstall','<%=this.DateDataInstall.ClientID%>','<%=this.changedDateDataInstall.ClientID.ToString()%>')" >
<img alt="Select Date" id=DateEdBtnDataInstall height=14  src="<%=Request.ApplicationPath%>/Include/Calendar/calendar.gif"  width=23 border=0></A>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblSrochDogovor" runat="server" Width="100%" ForeColor="#000000">Срок договора:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbSrochDogovor" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblDocPolych" runat="server" Width="100%" ForeColor="#000000">Документы получены:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbDocPolych" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblDataSZT" runat="server" Width="100%" ForeColor="#000000">Дата передачи в СЗТ:</asp:Label>
      </TD>
      <TD width=40%>
<input id="changedDateDataSZT" type="hidden" value=0 name="changedDateDataSZT" runat="server">
<asp:textbox id="DateDataSZT" runat="server" Width="70px"></asp:textbox>
<A id='btnDataSZT'  href="javascript:ShowCalendar('DateEdBtnDataSZT','<%=this.DateDataSZT.ClientID%>','<%=this.changedDateDataSZT.ClientID.ToString()%>')" >
<img alt="Select Date" id=DateEdBtnDataSZT height=14  src="<%=Request.ApplicationPath%>/Include/Calendar/calendar.gif"  width=23 border=0></A>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblVklVReestr" runat="server" Width="100%" ForeColor="#000000">Включена в реестр для оплаты:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbVklVReestr" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblOtkaz" runat="server" Width="100%" ForeColor="#000000">Отказ:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbOtkaz" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblOpisProblem" runat="server" Width="100%" ForeColor="#000000">Описание проблемы:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtOpisProblem" runat="server" Width="100%" MaxLength="0" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblOtprVKEY" runat="server" Width="100%" ForeColor="#000000">Отправлено в КЭУ:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbOtprVKEY" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblDataOtpravVKEY" runat="server" Width="100%" ForeColor="#000000">Дата отправки в КЭУ:</asp:Label>
      </TD>
      <TD width=40%>
<input id="changedDateDataOtpravVKEY" type="hidden" value=0 name="changedDateDataOtpravVKEY" runat="server">
<asp:textbox id="DateDataOtpravVKEY" runat="server" Width="70px"></asp:textbox>
<A id='btnDataOtpravVKEY'  href="javascript:ShowCalendar('DateEdBtnDataOtpravVKEY','<%=this.DateDataOtpravVKEY.ClientID%>','<%=this.changedDateDataOtpravVKEY.ClientID.ToString()%>')" >
<img alt="Select Date" id=DateEdBtnDataOtpravVKEY height=14  src="<%=Request.ApplicationPath%>/Include/Calendar/calendar.gif"  width=23 border=0></A>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblDopSogl" runat="server" Width="100%" ForeColor="#000000">Дополнительное соглашение:</asp:Label>
      </TD>
      <TD width=40%>
<asp:DropDownList id="cmbDopSogl" runat="server" Width="100%"></asp:DropDownList>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblNumDogovor" runat="server" Width="100%" ForeColor="#000000">Номер договора:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtNumDogovor" runat="server" Width="100%" MaxLength="255" Text=""></asp:TextBox>
      </TD>
      <TD width=40%>
      </TD>
    </TR>
  <TR>
      <TD width=20%>
        <asp:Label id="lblKomment" runat="server" Width="100%" ForeColor="#000000">Комментарий:</asp:Label>
      </TD>
      <TD width=40%>
          <asp:TextBox id="txtKomment" runat="server" Width="100%" MaxLength="0" Text=""></asp:TextBox>
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

function TP_Zay_ZayLoad()

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




