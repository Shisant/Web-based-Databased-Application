<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Teacher Student.aspx.cs" Inherits="AD.Teacher_Student" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="STAFF_NAME" DataValueField="STAFF_ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;TEACHER_STUDENTS&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;TEACHER_ID&quot; = :TEACHER_ID" InsertCommand="INSERT INTO &quot;TEACHER_STUDENTS&quot; (&quot;STUDENT_ID&quot;, &quot;TEACHER_ID&quot;) VALUES (:STUDENT_ID, :TEACHER_ID)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.STAFF_NAME, JOBS.JOB_TITLE FROM STAFF, STAFF_JOB, JOBS WHERE STAFF.STAFF_ID = STAFF_JOB.STAFF_ID AND STAFF_JOB.JOB_ID = JOBS.JOB_ID AND (STAFF.STAFF_ID IN (SELECT STAFF_ID FROM STAFF_JOB STAFF_JOB_1 WHERE (JOB_ID IN ('JB102', 'JB103'))))">
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="STUDENT_ID,TEACHER_ID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True"  ControlStyle-CssClass="btn btn-info" />
            <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
            <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" ReadOnly="True" SortExpression="TEACHER_ID" />
            <asp:TemplateField HeaderText="Student Name">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" Enabled="False" runat="server" DataSourceID="SqlDataSource4" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:FormView ID="FormView1" class="form-group" runat="server" DataKeyNames="STUDENT_ID,TEACHER_ID" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            STUDENT_ID:
            <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
            <br />
            TEACHER_ID:
            <asp:Label ID="TEACHER_IDLabel1" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>STUDENT ID:</label>
            <asp:DropDownList ID="DropDownList3"  class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>TEACHER ID:</label>
            <asp:DropDownList ID="DropDownList4"  class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="STAFF_NAME" DataValueField="STAFF_ID" SelectedValue='<%# Bind("TEACHER_ID") %>'>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-success" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" class="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           <asp:LinkButton ID="NewButton" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" runat="server" CausesValidation="False" CommandName="New" Text="Assign Students" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;TEACHER_STUDENTS&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;TEACHER_ID&quot; = :TEACHER_ID" InsertCommand="INSERT INTO &quot;TEACHER_STUDENTS&quot; (&quot;STUDENT_ID&quot;, &quot;TEACHER_ID&quot;) VALUES (:STUDENT_ID, :TEACHER_ID)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;TEACHER_STUDENTS&quot; WHERE (&quot;TEACHER_ID&quot; = :TEACHER_ID)">
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="TEACHER_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;STAFF&quot; WHERE &quot;STAFF_ID&quot; = :STAFF_ID" InsertCommand="INSERT INTO &quot;STAFF&quot; (&quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;DOB&quot;) VALUES (:STAFF_ID, :STAFF_NAME, :CONTACT, :EMAIL, :DOB)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;STAFF&quot;" UpdateCommand="UPDATE &quot;STAFF&quot; SET &quot;STAFF_NAME&quot; = :STAFF_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL&quot; = :EMAIL, &quot;DOB&quot; = :DOB WHERE &quot;STAFF_ID&quot; = :STAFF_ID">
        <DeleteParameters>
            <asp:Parameter Name="STAFF_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STAFF_ID" Type="String" />
            <asp:Parameter Name="STAFF_NAME" Type="String" />
            <asp:Parameter Name="CONTACT" Type="Decimal" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STAFF_NAME" Type="String" />
            <asp:Parameter Name="CONTACT" Type="Decimal" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="STAFF_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;STUDENTS&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENTS&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;ADDRESS&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :ADDRESS, :CONTACT, :EMAIL)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENTS&quot;" UpdateCommand="UPDATE &quot;STUDENTS&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;ADDRESS&quot; = :ADDRESS, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL&quot; = :EMAIL WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="STUDENT_NAME" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENT_NAME" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
