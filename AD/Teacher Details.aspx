<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Teacher Details.aspx.cs" Inherits="AD.Teacher_Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.STAFF_NAME, JOBS.JOB_TITLE FROM STAFF, STAFF_JOB, JOBS WHERE STAFF.STAFF_ID = STAFF_JOB.STAFF_ID AND STAFF_JOB.JOB_ID = JOBS.JOB_ID AND (STAFF.STAFF_ID IN (SELECT STAFF_ID FROM STAFF_JOB STAFF_JOB_1 WHERE (JOB_ID IN ('JB102', 'JB103'))))" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource1" Width="1157px">
        <Columns>
            <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" ReadOnly="True" SortExpression="STAFF_ID" />
            <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" />
            <asp:BoundField DataField="JOB_TITLE" HeaderText="JOB_TITLE" SortExpression="JOB_TITLE" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;STAFF&quot; WHERE &quot;STAFF_ID&quot; = :STAFF_ID" InsertCommand="INSERT INTO &quot;STAFF&quot; (&quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;DOB&quot;) VALUES (:STAFF_ID, :STAFF_NAME, :CONTACT, :EMAIL, :DOB)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;STAFF&quot;" UpdateCommand="UPDATE &quot;STAFF&quot; SET &quot;STAFF_NAME&quot; = :STAFF_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL&quot; = :EMAIL, &quot;DOB&quot; = :DOB WHERE &quot;STAFF_ID&quot; = :STAFF_ID">
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
    <asp:GridView ID="GridView2" class="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource2" Width="1161px">
        <Columns>
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-info" ShowDeleteButton="True"  >
<ControlStyle CssClass="btn btn-info"></ControlStyle>
            </asp:CommandField>
            <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" ReadOnly="True" SortExpression="STAFF_ID" />
            <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" />
            <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" DataFormatString="{0:dd MMMM yyyy} " SortExpression="DOB" />
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
    <asp:FormView ID="FormView1"  class="form-group" runat="server" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            <label>STAFF ID:</label>
            <asp:Label ID="STAFF_IDLabel1"  class="form-control" runat="server" Text='<%# Eval("STAFF_ID") %>' />
            <br />
            <label>STAFF NAME:</label>
            <asp:TextBox ID="STAFF_NAMETextBox"  class="form-control" runat="server" Text='<%# Bind("STAFF_NAME") %>' />
            <br />
            <label>CONTACT:</label>
            <asp:TextBox ID="CONTACTTextBox"  class="form-control" runat="server" Text='<%# Bind("CONTACT") %>' />
            <br />
            <label>EMAIL:</label>
            <asp:TextBox ID="EMAILTextBox"  class="form-control" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            <label>DOB:</label>
            <asp:TextBox ID="DOBTextBox"  class="form-control" runat="server" Text='<%# Bind("DOB") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" class="btn btn-info" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            STAFF_ID:
            <asp:TextBox ID="STAFF_IDTextBox" class="form-control" runat="server" Text='<%# Bind("STAFF_ID") %>' />
            <br />
            STAFF_NAME:
            <asp:TextBox ID="STAFF_NAMETextBox" class="form-control" runat="server" Text='<%# Bind("STAFF_NAME") %>' />
            <br />
            CONTACT:
            <asp:TextBox ID="CONTACTTextBox" class="form-control" runat="server" Text='<%# Bind("CONTACT") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" class="form-control" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            DOB:
            <asp:TextBox ID="DOBTextBox" class="form-control" runat="server" Text='<%# Bind("DOB") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-success" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" class="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
         <asp:LinkButton ID="NewButton" runat="server" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" CausesValidation="False" CommandName="New" Text="Add New Staff" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;STAFF_JOB&quot; WHERE &quot;STAFF_ID&quot; = :STAFF_ID AND &quot;JOB_ID&quot; = :JOB_ID" InsertCommand="INSERT INTO &quot;STAFF_JOB&quot; (&quot;STAFF_ID&quot;, &quot;JOB_ID&quot;) VALUES (:STAFF_ID, :JOB_ID)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;STAFF_JOB&quot;">
        <DeleteParameters>
            <asp:Parameter Name="STAFF_ID" Type="String" />
            <asp:Parameter Name="JOB_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STAFF_ID" Type="String" />
            <asp:Parameter Name="JOB_ID" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView3" class="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="STAFF_ID,JOB_ID" DataSourceID="SqlDataSource3" Width="1166px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-info"  />
            <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" ReadOnly="True" SortExpression="STAFF_ID" />
            <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" ReadOnly="True" SortExpression="JOB_ID" />
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
    <asp:FormView ID="FormView2" class="form-group" runat="server" DataKeyNames="STAFF_ID,JOB_ID" DataSourceID="SqlDataSource3" OnPageIndexChanging="FormView2_PageIndexChanging">
        <EditItemTemplate>
            STAFF_ID:
            <asp:Label ID="STAFF_IDLabel1" runat="server" Text='<%# Eval("STAFF_ID") %>' />
            <br />
            JOB_ID:
            <asp:Label ID="JOB_IDLabel1" runat="server" Text='<%# Eval("JOB_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" class="btn btn-info" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>STAFF ID:</label>
            <asp:DropDownList ID="DropDownList1" class="form-control"  runat="server" DataSourceID="SqlDataSource2" DataTextField="STAFF_NAME" DataValueField="STAFF_ID" SelectedValue='<%# Bind("STAFF_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>JOB ID:</label>
            <asp:DropDownList ID="DropDownList2" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="JOB_TITLE" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>'>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-danger" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
          <asp:LinkButton ID="NewButton" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" runat="server" CausesValidation="False" CommandName="New" Text="Assign New Job" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;JOBS&quot; WHERE &quot;JOB_ID&quot; = :JOB_ID" InsertCommand="INSERT INTO &quot;JOBS&quot; (&quot;JOB_ID&quot;, &quot;JOB_TITLE&quot;) VALUES (:JOB_ID, :JOB_TITLE)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;JOBS&quot;" UpdateCommand="UPDATE &quot;JOBS&quot; SET &quot;JOB_TITLE&quot; = :JOB_TITLE WHERE &quot;JOB_ID&quot; = :JOB_ID">
        <DeleteParameters>
            <asp:Parameter Name="JOB_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="JOB_ID" Type="String" />
            <asp:Parameter Name="JOB_TITLE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="JOB_TITLE" Type="String" />
            <asp:Parameter Name="JOB_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView4" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource4" Width="1168px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-info" ShowDeleteButton="True" >
<ControlStyle CssClass="btn btn-info"></ControlStyle>
            </asp:CommandField>
            <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" ReadOnly="True" SortExpression="JOB_ID" />
            <asp:BoundField DataField="JOB_TITLE" HeaderText="JOB_TITLE" SortExpression="JOB_TITLE" />
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
    <asp:FormView ID="FormView3" class="form-group" runat="server" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource4">
        <EditItemTemplate>
            JOB_ID:
            <asp:Label ID="JOB_IDLabel1" runat="server" Text='<%# Eval("JOB_ID") %>' />
            <br />
            JOB_TITLE:
            <asp:TextBox ID="JOB_TITLETextBox" runat="server" Text='<%# Bind("JOB_TITLE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"  class="btn btn-info" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"  class="btn btn-danger" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>JOB ID:</label>
            <asp:TextBox ID="JOB_IDTextBox" class="form-control" runat="server" Text='<%# Bind("JOB_ID") %>' />
            <br />
            <label>JOB TITLE:</label>
            <asp:TextBox ID="JOB_TITLETextBox" class="form-control" runat="server" Text='<%# Bind("JOB_TITLE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-danger" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
          <asp:LinkButton ID="NewButton" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" runat="server" CausesValidation="False" CommandName="New" Text="Insert New Job" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>


