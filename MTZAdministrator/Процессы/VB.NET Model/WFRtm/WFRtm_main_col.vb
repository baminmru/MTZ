


Option Explicit On

Imports MKSNManager
Imports System
Imports System.xml
Imports System.Data

Namespace WFRtm
    Public Class WFRtm_main_col
        Inherits MKSNManager.Document.DocCollection_Base

        Public Overrides Function ChildPartName() As String
            ChildPartName = "WFRtm_main"
        End Function

        Protected Overrides Function CreateDataTable() As System.Data.DataTable
            Dim dt As DataTable
            dt = New DataTable
            dt.Columns.Add("ID", GetType(System.guid))
            dt.Columns.Add("Brief", Gettype(System.string))
            dt.Columns.Add("Moderator_ID" , GetType(System.guid))
            dt.Columns.Add("Moderator", Gettype(System.string))
            dt.Columns.Add("BasedOn_ID" , GetType(System.guid))
            dt.Columns.Add("BasedOn", Gettype(System.string))
            dt.Columns.Add("ProcessState_VAL" , Gettype(System.Int16))
            dt.Columns.Add("ProcessState", Gettype(System.string))
            dt.Columns.Add("the_Description", Gettype(System.string))
            dt.Columns.Add("Attachment", GetType(System.object))
            return dt
        End Function

        Protected Overrides Function NewItem() As MKSNManager.Document.DocRow_Base
            NewItem = New WFRtm_main
        End Function
        Public Function GetItem( vIndex as object ) As WFRtm.WFRtm_main
            on error resume next
            GetItem = Convert.ChangeType(mybase.Item(vIndex), GetType(WFRtm.WFRtm_main))
        End Function
        Public Shadows Function Item( vIndex as object ) As WFRtm.WFRtm_main
            on error resume next
            return GetItem(vIndex)
        End Function
    End Class
End Namespace



