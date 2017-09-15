

<%@ Control Language="c#" AutoEventWireup="false" CodeFile="ucTabTP_Spr_Oper.ascx.cs" Inherits="TP_Spr.ASPNET.ucTabTP_Spr_Oper" %>
<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v6.2, Version=6.2.20062.34, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>
<asp:HyperLink id="HyperLinkAddNew" runat="server"></asp:HyperLink><br>
 <igtbl:ultrawebgrid id="DataGrid_TP_Spr_Oper" runat="server" Width="100%" Height="350px"><Bands>
<igtbl:UltraGridBand>
<AddNewRow View="NotSet" Visible="NotSet"></AddNewRow>
<FilterOptions EmptyString="" AllString="" NonEmptyString="" AllowRowFiltering="OnClient">
<FilterDropDownStyle BorderWidth="1px" BorderColor="Silver" BorderStyle="Solid" Font-Size="11px" Font-Names="Verdana,Arial,Helvetica,sans-serif" BackColor="White" Width="200px" CustomRules="overflow:auto;">
<Padding Left="2px"></Padding>
</FilterDropDownStyle>
<FilterHighlightRowStyle ForeColor="White" BackColor="#151C55"></FilterHighlightRowStyle>
</FilterOptions>
</igtbl:UltraGridBand>
</Bands>
<DisplayLayout ViewType="OutlookGroupBy" Version="4.00" AllowSortingDefault="OnClient" AllowColSizingDefault="Free" HeaderClickActionDefault="SortSingle" Name="ctl00xDataGrid_TP_Spr_Oper" BorderCollapseDefault="Separate" RowSelectorsDefault="No" RowHeightDefault="20px" AllowColumnMovingDefault="OnServer" SelectTypeRowDefault="Single">
<GroupByBox>
<Style BorderColor="Window" BackColor="ActiveBorder"></Style>
</GroupByBox>
<GroupByRowStyleDefault BorderColor="Window" BackColor="Control"></GroupByRowStyleDefault>
<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
</FooterStyleDefault>

<RowStyleDefault BorderWidth="1px" BorderColor="Silver" BorderStyle="Solid" BackColor="Window">
<BorderDetails ColorTop="Window" ColorLeft="Window"></BorderDetails>

<Padding Left="3px"></Padding>
</RowStyleDefault>

<FilterOptionsDefault EmptyString="(Empty)" AllString="(All)" NonEmptyString="(NonEmpty)">
<FilterDropDownStyle BorderWidth="1px" BorderColor="Silver" BorderStyle="Solid" Font-Size="11px" Font-Names="Verdana,Arial,Helvetica,sans-serif" BackColor="White" Width="200px" CustomRules="overflow:auto;">
<Padding Left="2px"></Padding>
</FilterDropDownStyle>

<FilterHighlightRowStyle ForeColor="White" BackColor="#151C55"></FilterHighlightRowStyle>
</FilterOptionsDefault>

<HeaderStyleDefault HorizontalAlign="Left" BorderStyle="Solid" BackColor="LightGray">
<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
</HeaderStyleDefault>

<EditCellStyleDefault BorderWidth="0px" BorderStyle="None"></EditCellStyleDefault>

<FrameStyle BorderWidth="1px" BorderColor="InactiveCaption" BorderStyle="Solid" Font-Size="8.25pt" Font-Names="Microsoft Sans Serif" BackColor="Window" Width="100%"></FrameStyle>

<Pager>
<Style BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
</Style>
</Pager>

<AddNewBox>
<Style BorderWidth="1px" BorderColor="InactiveCaption" BorderStyle="Solid" BackColor="Window">
<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
</Style>
</AddNewBox>
</DisplayLayout>
</igtbl:ultrawebgrid>
<%=ClientScript()%>
<script language="javascript" type="text/javascript">

function TP_Spr_OperLoad()

{

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




