
private sub MakeReport(Response as object)
Response.OutNL "<html>"
Response.OutNL " <head>"
Response.OutNL " </head>"
Response.OutNL " <body>"
Response.OutNL " <table>"
Response.OutNL "  <tr>"
Response.OutNL "  <td><h3>��� �������� �������������� ��������</h3>"
Response.OutNL "  </td>"
Response.OutNL "  <td><h2>������"
Response.OutNL "   </h2>"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  <tr>"
Response.OutNL "  <td colSpan=""2"">���� �������� �____� ____________ 200_�."
Response.OutNL "   <BR>"
Response.OutNL "  <tr>"
Response.OutNL "  <td>"
Response.OutNL "   �������� � ������������ ����������������"
Response.OutNL "   <br>"
Response.OutNL "   ��������� �������������� �������� �"
Response.OutNL "   <br>"
Response.OutNL "   107140, �.������, ������������� ���., �.7; ��� 7708501984;"
Response.OutNL "   <br>"
Response.OutNL "   ��� 770801001"
Response.OutNL "   <br>"
Response.OutNL "   �/� 40702810100000000713 � ��� ��� ������-����<br>"
Response.OutNL "   �/� 30101810900000000848; ��� 044525848; �������.���. /095/207-07-26"
Response.OutNL "   <br>"
Response.OutNL "   URL: <u>www.postec.ru</u>"
Response.OutNL "  </td>"
Response.OutNL "  <td vAlign=""top"">"
Response.OutNL "   <P align=""left"">"
Response.OutNL "   �� �������� �_____ �� �____�______________<br>"
Response.OutNL "   �____� ________________200_ �.</P>"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  </tr></table>"
Response.OutNL "  <BR>����� ���������� ��������� � �������� ������ ���������� ������� �� �������"
Response.Out "  <BR>"

 trtype 
Response.Out "  <br> �������������� ���� �������� "

 SendDate 
Response.OutNL "  <table border=""1"">"
Response.OutNL "  <tr>"
Response.OutNL "  <td>�</td>"
Response.OutNL "  <td>"
Response.OutNL "   ������/ ������. ������</td>"
Response.OutNL "  <td>"
Response.OutNL "   ������� ���������� ��������� ������</td>"
Response.OutNL "  <td>������� �������� �������� �����������</td>"
Response.OutNL "  <td>"
Response.OutNL "   ������������ ����������/ �����������</td>"
Response.OutNL "  <td>"
Response.OutNL "   �������� �������� �����������</td>"
Response.OutNL "  <td>���-�� �������� �����������</td>"
Response.OutNL "  <td>"
Response.OutNL "   ����� �������� �����������</td>"
Response.OutNL "  <td>��� �������� �����������</td>"
Response.OutNL "  <td>����� (� ���)</td>"
Response.OutNL "  <td>����� (� ���)</td>"
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
Response.OutNL "  <td>�"
Response.OutNL "  </td>"
Response.OutNL "  <td>�������������� ������</td>"
Response.OutNL "  <td>���-��</td>"
Response.OutNL "  <td>����� (� ���)</td>"
Response.OutNL "  <td>����� (� ���)"
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
Response.OutNL "  <td>�����: ����� (� ���)"
Response.OutNL "  </td>"
Response.OutNL "  <td>� ��� ����� ���"
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
Response.OutNL "   ������:</td>"
Response.OutNL "  <td>"
Response.OutNL "   �����������:"
Response.OutNL "  </td>"
Response.OutNL "  </tr>"
Response.OutNL "  <tr>"
Response.OutNL "  <td>"
Response.OutNL "   � ���������� �� �������� ����������,<br>"
Response.OutNL "   ������������� �������� ���<br>"
Response.OutNL "   <table>"
Response.OutNL "   <tr>"
Response.OutNL "    <td>"
Response.OutNL "    ����: ��� ""���"""
Response.OutNL "    <br>"
Response.OutNL "    <br>"
Response.OutNL "    ""___"" ______________ 200_ �."
Response.OutNL "    <br>"
Response.OutNL "    </td>"
Response.OutNL "    <td>"
Response.OutNL "    ������� __________________________"
Response.OutNL "    <br>"
Response.OutNL "    <br>"
Response.OutNL "    ������� ______________ �.�.<br>"
Response.OutNL "    </td>"
Response.OutNL "   </tr>"
Response.OutNL "   </table>"
Response.OutNL "  </td>"
Response.OutNL "  <td>"
Response.OutNL "   <table>"
Response.OutNL "   <tr>"
Response.OutNL "    <td>"
Response.OutNL "    ������: _____________________<br>"
Response.OutNL "    <br>"
Response.OutNL "    ""___"" ________________ 200_ �."
Response.OutNL "    <br>"
Response.OutNL "    </td>"
Response.OutNL "    <td>"
Response.OutNL "    ������� ____________________"
Response.OutNL "    <br>"
Response.OutNL "    <br>"
Response.OutNL "    ������� __________ �.�."
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

