<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Student Course.aspx.cs" Inherits="AD.Student_Course" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" AutoPostBack="True">
    </asp:DropDownList>
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
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID,ASSIGNMENT_ID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-info"  />
            <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
            <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
            <asp:TemplateField HeaderText="Student Name">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" Enabled="false" runat="server" DataSourceID="SqlDataSource4" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ASSIGNMENT_ID" HeaderText="ASSIGNMENT_ID" ReadOnly="True" SortExpression="ASSIGNMENT_ID" />
            <asp:TemplateField HeaderText="Assignment Type">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList6" Enabled="false" runat="server" DataSourceID="SqlDataSource3" DataTextField="ASSIGNMENT_TYPE" DataValueField="ASSIGNMENT_ID" SelectedValue='<%# Bind("ASSIGNMENT_ID") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MARKS_OBTAINED" HeaderText="MARKS_OBTAINED" SortExpression="MARKS_OBTAINED" />
            <asp:BoundField DataField="YEAR_PASSED" HeaderText="YEAR_PASSED" SortExpression="YEAR_PASSED" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;STUDENT_COURSE&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID" InsertCommand="INSERT INTO &quot;STUDENT_COURSE&quot; (&quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;ASSIGNMENT_ID&quot;, &quot;MARKS_OBTAINED&quot;, &quot;YEAR_PASSED&quot;) VALUES (:STUDENT_ID, :COURSE_ID, :ASSIGNMENT_ID, :MARKS_OBTAINED, :YEAR_PASSED)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT_COURSE&quot; WHERE (&quot;COURSE_ID&quot; = :COURSE_ID)" UpdateCommand="UPDATE &quot;STUDENT_COURSE&quot; SET &quot;MARKS_OBTAINED&quot; = :MARKS_OBTAINED, &quot;YEAR_PASSED&quot; = :YEAR_PASSED WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID">
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
            <asp:Parameter Name="MARKS_OBTAINED" Type="Decimal" />
            <asp:Parameter Name="YEAR_PASSED" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="COURSE_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MARKS_OBTAINED" Type="Decimal" />
            <asp:Parameter Name="YEAR_PASSED" Type="String" />
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" class="form-group" runat="server" DataKeyNames="STUDENT_ID,COURSE_ID,ASSIGNMENT_ID" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            STUDENT_ID:
            <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
            <br />
            COURSE_ID:
            <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
            <br />
            ASSIGNMENT_ID:
            <asp:Label ID="ASSIGNMENT_IDLabel1" runat="server" Text='<%# Eval("ASSIGNMENT_ID") %>' />
            <br />
            MARKS_OBTAINED:
            <asp:TextBox ID="MARKS_OBTAINEDTextBox" runat="server" Text='<%# Bind("MARKS_OBTAINED") %>' />
            <br />
            YEAR_PASSED:
            <asp:TextBox ID="YEAR_PASSEDTextBox" runat="server" Text='<%# Bind("YEAR_PASSED") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" class="btn btn-info" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>STUDENT ID:</label>
            <asp:DropDownList ID="DropDownList3" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>COURSE ID:</label>
            <asp:DropDownList ID="DropDownList4" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>ASSIGNMENT ID:</label>
            <asp:DropDownList ID="DropDownList5" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="ASSIGNMENT_ID" DataValueField="ASSIGNMENT_ID" SelectedValue='<%# Bind("ASSIGNMENT_ID") %>'>
            </asp:DropDownList>
            <br />
            <label>MARKS OBTAINED:</label>
            <asp:TextBox ID="MARKS_OBTAINEDTextBox" class="form-control" runat="server" Text='<%# Bind("MARKS_OBTAINED") %>' />
            <br />
            <label>YEAR PASSED:</label>
            <asp:TextBox ID="YEAR_PASSEDTextBox" class="form-control" runat="server" Text='<%# Bind("YEAR_PASSED") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-success" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" class="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           <asp:LinkButton ID="NewButton" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" runat="server" CausesValidation="False" CommandName="New" Text="Add New Result" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;ASSIGNMENT&quot; WHERE &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID" InsertCommand="INSERT INTO &quot;ASSIGNMENT&quot; (&quot;ASSIGNMENT_ID&quot;, &quot;ASSIGNMENT_TYPE&quot;, &quot;ACADEMIC_YEAR&quot;, &quot;WEIGHTAGE&quot;) VALUES (:ASSIGNMENT_ID, :ASSIGNMENT_TYPE, :ACADEMIC_YEAR, :WEIGHTAGE)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;ASSIGNMENT&quot;" UpdateCommand="UPDATE &quot;ASSIGNMENT&quot; SET &quot;ASSIGNMENT_TYPE&quot; = :ASSIGNMENT_TYPE, &quot;ACADEMIC_YEAR&quot; = :ACADEMIC_YEAR, &quot;WEIGHTAGE&quot; = :WEIGHTAGE WHERE &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID">
        <DeleteParameters>
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_TYPE" Type="String" />
            <asp:Parameter Name="ACADEMIC_YEAR" Type="String" />
            <asp:Parameter Name="WEIGHTAGE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ASSIGNMENT_TYPE" Type="String" />
            <asp:Parameter Name="ACADEMIC_YEAR" Type="String" />
            <asp:Parameter Name="WEIGHTAGE" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" class="table" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ASSIGNMENT_ID" DataSourceID="SqlDataSource5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-info" />
            <asp:BoundField DataField="ASSIGNMENT_ID" HeaderText="ASSIGNMENT_ID" ReadOnly="True" SortExpression="ASSIGNMENT_ID" />
            <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="ASSIGNMENT_TYPE" SortExpression="ASSIGNMENT_TYPE" />
            <asp:BoundField DataField="ACADEMIC_YEAR" HeaderText="ACADEMIC_YEAR" SortExpression="ACADEMIC_YEAR" />
            <asp:BoundField DataField="WEIGHTAGE" HeaderText="WEIGHTAGE" SortExpression="WEIGHTAGE" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" DeleteCommand="DELETE FROM &quot;ASSIGNMENT&quot; WHERE &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID" InsertCommand="INSERT INTO &quot;ASSIGNMENT&quot; (&quot;ASSIGNMENT_ID&quot;, &quot;ASSIGNMENT_TYPE&quot;, &quot;ACADEMIC_YEAR&quot;, &quot;WEIGHTAGE&quot;) VALUES (:ASSIGNMENT_ID, :ASSIGNMENT_TYPE, :ACADEMIC_YEAR, :WEIGHTAGE)" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT * FROM &quot;ASSIGNMENT&quot;" UpdateCommand="UPDATE &quot;ASSIGNMENT&quot; SET &quot;ASSIGNMENT_TYPE&quot; = :ASSIGNMENT_TYPE, &quot;ACADEMIC_YEAR&quot; = :ACADEMIC_YEAR, &quot;WEIGHTAGE&quot; = :WEIGHTAGE WHERE &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID">
        <DeleteParameters>
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_TYPE" Type="String" />
            <asp:Parameter Name="ACADEMIC_YEAR" Type="String" />
            <asp:Parameter Name="WEIGHTAGE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ASSIGNMENT_TYPE" Type="String" />
            <asp:Parameter Name="ACADEMIC_YEAR" Type="String" />
            <asp:Parameter Name="WEIGHTAGE" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView2" class="form-group" runat="server" DataKeyNames="ASSIGNMENT_ID" DataSourceID="SqlDataSource5">
        <EditItemTemplate>
            ASSIGNMENT_ID:
            <asp:Label ID="ASSIGNMENT_IDLabel1" runat="server" Text='<%# Eval("ASSIGNMENT_ID") %>' />
            <br />
            ASSIGNMENT_TYPE:
            <asp:TextBox ID="ASSIGNMENT_TYPETextBox" runat="server" Text='<%# Bind("ASSIGNMENT_TYPE") %>' />
            <br />
            ACADEMIC_YEAR:
            <asp:TextBox ID="ACADEMIC_YEARTextBox" runat="server" Text='<%# Bind("ACADEMIC_YEAR") %>' />
            <br />
            WEIGHTAGE:
            <asp:TextBox ID="WEIGHTAGETextBox" runat="server" Text='<%# Bind("WEIGHTAGE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <label>ASSIGNMENT_ID:</label>
            <asp:TextBox ID="ASSIGNMENT_IDTextBox" class="form-control" runat="server" Text='<%# Bind("ASSIGNMENT_ID") %>' />
            <br />
            <label>ASSIGNMENT_TYPE:</label>
            <asp:TextBox ID="ASSIGNMENT_TYPETextBox" class="form-control" runat="server" Text='<%# Bind("ASSIGNMENT_TYPE") %>' />
            <br />
            <label>ACADEMIC_YEAR:</label>
            <asp:TextBox ID="ACADEMIC_YEARTextBox" class="form-control" runat="server" Text='<%# Bind("ACADEMIC_YEAR") %>' />
            <br />
            <label>WEIGHTAGE:</label>
            <asp:TextBox ID="WEIGHTAGETextBox" class="form-control" runat="server" Text='<%# Bind("WEIGHTAGE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-success" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" class="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           <asp:LinkButton ID="NewButton" runat="server" style="padding:10px; background: #23272B; border-radius: 5px; font-weight: bold; color:white;" CausesValidation="False" CommandName="New" Text="Assign New Assessment" />
        </ItemTemplate>
    </asp:FormView>
    </asp:Content>