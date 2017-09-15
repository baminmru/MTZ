
private sub MakeReport(Response as object)
Response.OutNL "<html>"
Response.OutNL " <head>"
Response.OutNL " </head>"
Response.OutNL " <body>"
Response.OutNL " <table>"
Response.OutNL "  <tr>"
Response.OutNL "  <td><h3>ООО Почтовая Экспедиционная Компания</h3>"
Response.OutNL "  </td>"
Response.OutNL "  <td><h2>ЗАЯВКА"
Response.OutNL "   </h2>"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  <tr>"
Response.OutNL "  <td colSpan=""2"">Дата отправки «____» ____________ 200_г."
Response.OutNL "   <BR>"
Response.OutNL "  <tr>"
Response.OutNL "  <td>"
Response.OutNL "   Общество с ограниченной ответственностью"
Response.OutNL "   <br>"
Response.OutNL "   «Почтовая Экспедиционная Компания »"
Response.OutNL "   <br>"
Response.OutNL "   107140, г.Москва, Краснопрудный пер., д.7; ИНН 7708501984;"
Response.OutNL "   <br>"
Response.OutNL "   КПП 770801001"
Response.OutNL "   <br>"
Response.OutNL "   р/с 40702810100000000713 в ОАО АКБ «Связь-Банк»<br>"
Response.OutNL "   к/с 30101810900000000848; БИК 044525848; Контакт.тел. /095/207-07-26"
Response.OutNL "   <br>"
Response.OutNL "   URL: <u>www.postec.ru</u>"
Response.OutNL "  </td>"
Response.OutNL "  <td vAlign=""top"">"
Response.OutNL "   <P align=""left"">"
Response.OutNL "   По договору №_____ от «____»______________<br>"
Response.OutNL "   «____» ________________200_ г.</P>"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  </tr></table>"
Response.OutNL "  <BR>Прошу обеспечить перевозку в почтовом вагоне партионных посылок по системе"
Response.Out "  <BR>"

 trtype 
Response.Out "  <br> Предполагаемая дата отправки "

 SendDate 
Response.OutNL "  <table border=""1"">"
Response.OutNL "  <tr>"
Response.OutNL "  <td>№</td>"
Response.OutNL "  <td>"
Response.OutNL "   поезда/ почтов. вагона</td>"
Response.OutNL "  <td>"
Response.OutNL "   Маршрут следования почтового вагона</td>"
Response.OutNL "  <td>Станция доставки почтовых отправлений</td>"
Response.OutNL "  <td>"
Response.OutNL "   Наименование получателя/ получателей</td>"
Response.OutNL "  <td>"
Response.OutNL "   Характер почтовых отправлений</td>"
Response.OutNL "  <td>Кол-во почтовых отправлений</td>"
Response.OutNL "  <td>"
Response.OutNL "   Объём почтовых отправлений</td>"
Response.OutNL "  <td>Вес почтовых отправлений</td>"
Response.OutNL "  <td>Тариф (с НДС)</td>"
Response.OutNL "  <td>Сумма (с НДС)</td>"
Response.OutNL "  </tr>"
Response.OutNL "  <tr>"
Response.OutNL "  <td>1</td>"
Response.Out "  <td>"

Trainno
Response.OutNL "   /"
Response.Out "   "

 vagonNo 
Response.OutNL "  </td>"
Response.Out "  <td>"

 direction 
Response.OutNL "  </td>"
Response.Out "  <td>"

 deststation 
Response.OutNL "</td>"
Response.OutNL "  <td>"
Response.Out "   "

receiver 
Response.OutNL "  </td>"
Response.Out "  <td>"

 description 
Response.OutNL "</td>"
Response.Out "  <td>"

pponum 
Response.OutNL "</td>"
Response.Out "  <td>"

 ppovol 
Response.OutNL "</td>"
Response.Out "  <td>"

 ppoweight 
Response.OutNL "</td>"
Response.Out "  <td>"

 suptrf 
Response.OutNL "</td>"
Response.Out "  <td>"

 supsummnds 
Response.OutNL "</td>"
Response.OutNL "  </tr>"
Response.OutNL " </table>"
Response.OutNL " <table border=""1"">"
Response.OutNL "  <tr>"
Response.OutNL "  <td>№"
Response.OutNL "  </td>"
Response.OutNL "  <td>Дополнительные услуги</td>"
Response.OutNL "  <td>Кол-во</td>"
Response.OutNL "  <td>Тариф (с НДС)</td>"
Response.OutNL "  <td>Сумма (с НДС)"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  <tr>"
Response.Out "  <td>"

 i 
Response.OutNL "  </td>"
Response.Out "  <td>"

srv 
Response.OutNL "</td>"
Response.Out "  <td>"

quantity 
Response.OutNL "</td>"
Response.Out "  <td>"

suptrf 
Response.OutNL "</td>"
Response.OutNL "  <td>"
Response.Out "   "

supsumnds 
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL " </table>"
Response.OutNL " <table border=""1"">"
Response.OutNL "  <tr>"
Response.OutNL "  <td>Итого: Сумма (с НДС)"
Response.OutNL "  </td>"
Response.OutNL "  <td>В том числе НДС"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  <tr>"
Response.OutNL "  <td>"
Response.Out "   "

itogNDS 
Response.OutNL "</td>"
Response.Out "  <td>"

NDS 
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL " </table>"
Response.OutNL " <table border=""1"">"
Response.OutNL "  <tr>"
Response.OutNL "  <td>"
Response.OutNL "   Клиент:</td>"
Response.OutNL "  <td>"
Response.OutNL "   Исполнитель:"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  <tr>"
Response.OutNL "  <td>"
Response.OutNL "   С положением об отправке ознакомлен,<br>"
Response.OutNL "   недозволенных вложений нет<br>"
Response.OutNL "   <table>"
Response.OutNL "   <tr>"
Response.OutNL "    <td>"
Response.OutNL "    Сдал: ООО ""ПЭК"""
Response.OutNL "    <br>"
Response.OutNL "    <br>"
Response.OutNL "    ""___"" ______________ 200_ г."
Response.OutNL "    <br>"
Response.OutNL "    </td>"
Response.OutNL "    <td>"
Response.OutNL "    Фамилия __________________________"
Response.OutNL "    <br>"
Response.OutNL "    <br>"
Response.OutNL "    Подпись ______________ М.П.<br>"
Response.OutNL "    </td>"
Response.OutNL "   </tr>"
Response.OutNL "   </table>"
Response.OutNL "  </td>"
Response.OutNL "  <td>"
Response.OutNL "   <table>"
Response.OutNL "   <tr>"
Response.OutNL "    <td>"
Response.OutNL "    Принял: _____________________<br>"
Response.OutNL "    <br>"
Response.OutNL "    ""___"" ________________ 200_ г."
Response.OutNL "    <br>"
Response.OutNL "    </td>"
Response.OutNL "    <td>"
Response.OutNL "    Фамилия ____________________"
Response.OutNL "    <br>"
Response.OutNL "    <br>"
Response.OutNL "    Подпись __________ М.П."
Response.OutNL "    <br>"
Response.OutNL "    </td>"
Response.OutNL "   </tr>"
Response.OutNL "   </table>"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL " </table>"
Response.OutNL " </body>"
Response.OutNL "</html>"
Response.OutNL ""




end sub

