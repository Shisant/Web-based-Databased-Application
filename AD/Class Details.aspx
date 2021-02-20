<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Class Details.aspx.cs" Inherits="AD.Class_Details" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;ROUTINE&quot; WHERE &quot;ROUTINE_ID&quot; = :ROUTINE_ID" InsertCommand="INSERT INTO &quot;ROUTINE&quot; (&quot;ROUTINE_ID&quot;, &quot;TIME&quot;, &quot;DAY&quot;, &quot;ROOM&quot;) VALUES (:ROUTINE_ID, :TIME, :DAY, :ROOM)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;ROUTINE&quot;" UpdateCommand="UPDATE &quot;ROUTINE&quot; SET &quot;TIME&quot; = :TIME, &quot;DAY&quot; = :DAY, &quot;ROOM&quot; = :ROOM WHERE &quot;ROUTINE_ID&quot; = :ROUTINE_ID">
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
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ROUTINE_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-info"  />
            <asp:BoundField DataField="ROUTINE_ID" HeaderText="ROUTINE_ID" ReadOnly="True" SortExpression="ROUTINE_ID" />
            <asp:BoundField DataField="TIME" HeaderText="TIME" SortExpression="TIME" />
            <asp:BoundField DataField="DAY" HeaderText="DAY" SortExpression="DAY" />
            <asp:BoundField DataField="ROOM" HeaderText="ROOM" SortExpression="ROOM" />
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
    <asp:FormView ID="FormView1" class="form-group" runat="server" DataKeyNames="ROUTINE_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            ROUTINE_ID:
            <asp:Label ID="ROUTINE_IDLabel1" runat="server" Text='<%# Eval("ROUTINE_ID") %>' />
            <br />
            TIME:
            <asp:TextBox ID="TIMETextBox" runat="server" Text='<%# Bind("TIME") %>' />
            <br />
            DAY:
            <asp:TextBox ID="DAYTextBox" runat="server" Text='<%# Bind("DAY") %>' />
            <br />
            ROOM:
            <asp:TextBox ID="ROOMTextBox" runat="server" Text='<%# Bind("ROOM") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" class="btn btn-info" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>ROUTINE ID:</label>
            <asp:TextBox ID="ROUTINE_IDTextBox" class="form-control" runat="server" Text='<%# Bind("ROUTINE_ID") %>' />
            <br />
            <label>TIME:</label>
            <asp:TextBox ID="TIMETextBox" class="form-control" runat="server" Text='<%# Bind("TIME") %>' />
            <br />
            <label>DAY:</label>
            <asp:TextBox ID="DAYTextBox" class="form-control" runat="server" Text='<%# Bind("DAY") %>' />
            <br />
            <label>ROOM:</label>
            <asp:TextBox ID="ROOMTextBox" class="form-control" runat="server" Text='<%# Bind("ROOM") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-success" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" runat="server" CausesValidation="False" CommandName="New" Text="Create New Routine" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;CLASSES&quot; WHERE &quot;ROUTINE_ID&quot; = :ROUTINE_ID" InsertCommand="INSERT INTO &quot;CLASSES&quot; (&quot;COURSE_CODE&quot;, &quot;ROUTINE_ID&quot;, &quot;CLASS_TYPE&quot;) VALUES (:COURSE_CODE, :ROUTINE_ID, :CLASS_TYPE)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;CLASSES&quot;" UpdateCommand="UPDATE &quot;CLASSES&quot; SET &quot;COURSE_CODE&quot; = :COURSE_CODE, &quot;CLASS_TYPE&quot; = :CLASS_TYPE WHERE &quot;ROUTINE_ID&quot; = :ROUTINE_ID">
        <DeleteParameters>
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_CODE" Type="String" />
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
            <asp:Parameter Name="CLASS_TYPE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COURSE_CODE" Type="String" />
            <asp:Parameter Name="CLASS_TYPE" Type="String" />
            <asp:Parameter Name="ROUTINE_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="ROUTINE_ID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-info"  />
            <asp:BoundField DataField="COURSE_CODE" HeaderText="COURSE_CODE" SortExpression="COURSE_CODE" />
            <asp:TemplateField HeaderText="Course Name">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" Enabled="false" runat="server" DataSourceID="SqlDataSource3" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_CODE") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ROUTINE_ID" HeaderText="ROUTINE_ID" ReadOnly="True" SortExpression="ROUTINE_ID" />
            <asp:BoundField DataField="CLASS_TYPE" HeaderText="CLASS_TYPE" SortExpression="CLASS_TYPE" />
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
   
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;COURSES&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSES&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot;, &quot;COURSE_LEADER&quot;, &quot;CREDIT_HOUR&quot;) VALUES (:COURSE_ID, :COURSE_NAME, :COURSE_LEADER, :CREDIT_HOUR)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSES&quot;" UpdateCommand="UPDATE &quot;COURSES&quot; SET &quot;COURSE_NAME&quot; = :COURSE_NAME, &quot;COURSE_LEADER&quot; = :COURSE_LEADER, &quot;CREDIT_HOUR&quot; = :CREDIT_HOUR WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
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
    <asp:FormView ID="FormView2" class="form-group" runat="server" DataKeyNames="ROUTINE_ID" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            <label>COURSE CODE:</label>
            <asp:TextBox ID="COURSE_CODETextBox" class="form-control" runat="server" Text='<%# Bind("COURSE_CODE") %>' />
            <br />
            <label>ROUTINE ID</label>:
            <asp:Label ID="ROUTINE_IDLabel1" class="form-control" runat="server" Text='<%# Eval("ROUTINE_ID") %>' />
            <br />
            <label>CLASS TYPE:</label>
            <asp:TextBox ID="CLASS_TYPETextBox" class="form-control" runat="server" Text='<%# Bind("CLASS_TYPE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>COURSE CODE:</label>
            <asp:DropDownList ID="DropDownList2" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_CODE") %>'>
            </asp:DropDownList>
            <br />
            <label>ROUTINE ID:</label>
            <asp:DropDownList ID="DropDownList3"  class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="ROUTINE_ID" DataValueField="ROUTINE_ID" SelectedValue='<%# Bind("ROUTINE_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>CLASS TYPE:</label>
            <asp:TextBox ID="CLASS_TYPETextBox"  class="form-control" runat="server" Text='<%# Bind("CLASS_TYPE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-danger" CommandName="Cancel" Text="Cancel" />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM &quot;ROUTINE&quot;"></asp:SqlDataSource>
        </InsertItemTemplate>
        <ItemTemplate>
           <asp:LinkButton ID="NewButton" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" runat="server" CausesValidation="False" CommandName="New" Text="New Course Schedule" />
        </ItemTemplate>
    </asp:FormView>
   
    </asp:Content>

