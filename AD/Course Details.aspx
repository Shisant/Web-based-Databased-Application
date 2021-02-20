<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Course Details.aspx.cs" Inherits="AD.Course_Details" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-info" />
            <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
            <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" />
            <asp:BoundField DataField="COURSE_LEADER" HeaderText="COURSE_LEADER" SortExpression="COURSE_LEADER" />
            <asp:BoundField DataField="CREDIT_HOUR" HeaderText="CREDIT_HOUR" SortExpression="CREDIT_HOUR" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;COURSES&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSES&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot;, &quot;COURSE_LEADER&quot;, &quot;CREDIT_HOUR&quot;) VALUES (:COURSE_ID, :COURSE_NAME, :COURSE_LEADER, :CREDIT_HOUR)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSES&quot;" UpdateCommand="UPDATE &quot;COURSES&quot; SET &quot;COURSE_NAME&quot; = :COURSE_NAME, &quot;COURSE_LEADER&quot; = :COURSE_LEADER, &quot;CREDIT_HOUR&quot; = :CREDIT_HOUR WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.STAFF_NAME, JOBS.JOB_TITLE FROM STAFF, STAFF_JOB, JOBS WHERE STAFF.STAFF_ID = STAFF_JOB.STAFF_ID AND STAFF_JOB.JOB_ID = JOBS.JOB_ID AND (STAFF.STAFF_ID IN (SELECT STAFF_ID FROM STAFF_JOB STAFF_JOB_1 WHERE (JOB_ID IN ('JB102'))))"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" class="form-group" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            COURSE_ID:
            <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
            <br />
            COURSE_NAME:
            <asp:TextBox ID="COURSE_NAMETextBox" runat="server" Text='<%# Bind("COURSE_NAME") %>' />
            <br />
            COURSE_LEADER:
            <asp:TextBox ID="COURSE_LEADERTextBox" runat="server" Text='<%# Bind("COURSE_LEADER") %>' />
            <br />
            CREDIT_HOUR:
            <asp:TextBox ID="CREDIT_HOURTextBox" runat="server" Text='<%# Bind("CREDIT_HOUR") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" class="btn btn-info" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" class="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>COURSE ID</label>
            <asp:TextBox ID="COURSE_IDTextBox" class="form-control" runat="server" Text='<%# Bind("COURSE_ID") %>' />
            <br />
            <label> COURSE NAME</label>
            <asp:TextBox ID="COURSE_NAMETextBox" class="form-control" runat="server" Text='<%# Bind("COURSE_NAME") %>' />
            <br />
           <label>COURSE LEADER:</label>
            <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="STAFF_NAME" DataValueField="STAFF_NAME" SelectedValue='<%# Bind("COURSE_LEADER") %>'>
            </asp:DropDownList>
            <br />
            <label>CREDIT HOUR:</label>
            <asp:TextBox ID="CREDIT_HOURTextBox" class="form-control" runat="server" Text='<%# Bind("CREDIT_HOUR") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"  class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" class="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" CausesValidation="False" CommandName="New" Text="Add New Course" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>



