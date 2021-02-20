<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Teacher Course.aspx.cs" Inherits="AD.Teacher_Course" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;COURSE_TEACHER&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;ROUTINE_ID&quot; = :ROUTINE_ID AND &quot;TEACHER_ID&quot; = :TEACHER_ID" InsertCommand="INSERT INTO &quot;COURSE_TEACHER&quot; (&quot;COURSE_ID&quot;, &quot;ROUTINE_ID&quot;, &quot;TEACHER_ID&quot;) VALUES (:COURSE_ID, :ROUTINE_ID, :TEACHER_ID)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE_TEACHER&quot; WHERE (&quot;COURSE_ID&quot; = :COURSE_ID)">
        <DeleteParameters>
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="COURSE_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;COURSES&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSES&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot;, &quot;COURSE_LEADER&quot;, &quot;CREDIT_HOUR&quot;) VALUES (:COURSE_ID, :COURSE_NAME, :COURSE_LEADER, :CREDIT_HOUR)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSES&quot;" UpdateCommand="UPDATE &quot;COURSES&quot; SET &quot;COURSE_NAME&quot; = :COURSE_NAME, &quot;COURSE_LEADER&quot; = :COURSE_LEADER, &quot;CREDIT_HOUR&quot; = :CREDIT_HOUR WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
        <DeleteParameters>
            <asp:Parameter Name="COURSE_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="COURSE_NAME" Type="String" />
            <asp:Parameter Name="COURSE_LEADER" Type="String" />
            <asp:Parameter Name="CREDIT_HOUR" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COURSE_NAME" Type="String" />
            <asp:Parameter Name="COURSE_LEADER" Type="String" />
            <asp:Parameter Name="CREDIT_HOUR" Type="Decimal" />
            <asp:Parameter Name="COURSE_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,ROUTINE_ID,TEACHER_ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-info" />
            <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
            <asp:BoundField DataField="ROUTINE_ID" HeaderText="ROUTINE_ID" ReadOnly="True" SortExpression="ROUTINE_ID" />
            <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" ReadOnly="True" SortExpression="TEACHER_ID" />
            <asp:TemplateField HeaderText="Teacher Name">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" Enabled="false" runat="server" DataSourceID="SqlDataSource4" DataTextField="STAFF_NAME" DataValueField="STAFF_ID" SelectedValue='<%# Bind("TEACHER_ID") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Title">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" Enabled="false" runat="server" DataSourceID="SqlDataSource4" DataTextField="JOB_TITLE" DataValueField="STAFF_ID" SelectedValue='<%# Bind("TEACHER_ID") %>'>
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
    <asp:FormView ID="FormView1" class="form-group" runat="server" DataKeyNames="COURSE_ID,ROUTINE_ID,TEACHER_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            COURSE_ID:
            <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
            <br />
            ROUTINE_ID:
            <asp:Label ID="ROUTINE_IDLabel1" runat="server" Text='<%# Eval("ROUTINE_ID") %>' />
            <br />
            TEACHER_ID:
            <asp:Label ID="TEACHER_IDLabel1" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" class="btn btn-info" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>COURSE ID:</label>
            <asp:DropDownList ID="DropDownList4" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>ROUTINE ID:</label>
            <asp:DropDownList ID="DropDownList5" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="ROUTINE_ID" DataValueField="ROUTINE_ID" SelectedValue='<%# Bind("ROUTINE_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>TEACHER ID:</label>
            <asp:DropDownList ID="DropDownList6" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="STAFF_NAME" DataValueField="STAFF_ID" SelectedValue='<%# Bind("TEACHER_ID") %>'>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-success" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
         <asp:LinkButton ID="NewButton" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" runat="server" CausesValidation="False" CommandName="New" Text="Assign Teacher" />
        </ItemTemplate>
    </asp:FormView>
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
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.STAFF_NAME, JOBS.JOB_TITLE FROM STAFF, STAFF_JOB, JOBS WHERE STAFF.STAFF_ID = STAFF_JOB.STAFF_ID AND STAFF_JOB.JOB_ID = JOBS.JOB_ID AND (STAFF.STAFF_ID IN (SELECT STAFF_ID FROM STAFF_JOB STAFF_JOB_1 WHERE (JOB_ID IN ('JB102', 'JB103'))))"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;ROUTINE&quot; WHERE &quot;ROUTINE_ID&quot; = :ROUTINE_ID" InsertCommand="INSERT INTO &quot;ROUTINE&quot; (&quot;ROUTINE_ID&quot;, &quot;TIME&quot;, &quot;DAY&quot;, &quot;ROOM&quot;) VALUES (:ROUTINE_ID, :TIME, :DAY, :ROOM)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;ROUTINE&quot;" UpdateCommand="UPDATE &quot;ROUTINE&quot; SET &quot;TIME&quot; = :TIME, &quot;DAY&quot; = :DAY, &quot;ROOM&quot; = :ROOM WHERE &quot;ROUTINE_ID&quot; = :ROUTINE_ID">
        <DeleteParameters>
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
            <asp:Parameter Name="TIME" Type="String" />
            <asp:Parameter Name="DAY" Type="String" />
            <asp:Parameter Name="ROOM" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TIME" Type="String" />
            <asp:Parameter Name="DAY" Type="String" />
            <asp:Parameter Name="ROOM" Type="String" />
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>