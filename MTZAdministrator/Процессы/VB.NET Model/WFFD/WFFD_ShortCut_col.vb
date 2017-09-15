


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFFD
    Public Class WFFD_ShortCut_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFFD_ShortCut"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("StartMode", Gettype(System.string))
            dt.Columns.Add("DocName", Gettype(System.string))
            dt.Columns.Add("Folder_ID" , GetType(System.guid))
            dt.Columns.Add("Folder", Gettype(System.string))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFFD_ShortCut
        End Function
        Public Function GetItem( vIndex as object ) As WFFD.WFFD_ShortCut
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFFD.WFFD_ShortCut))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFFD.WFFD_ShortCut
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



