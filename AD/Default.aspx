<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AD._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" 
    
    
    
    
    
    
    
    
    
    ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background: rgb(189,16,55);
background: linear-gradient(0deg, rgba(189,16,55,0.6702031154258579) 13%, rgba(81,10,26,0.6365896700477065) 71%, rgba(6,6,6,0.8914916308320203) 93%);
"
        >
        <h1>&nbsp;</h1>
        <h1>Medhavi College</h1>
        <p class="lead">Medhavi College thrives on providing quality education to its students and the Industry expert Lecturers and Tutors have helped the college achieve that. We boast on the diversity of expertise we have as faculties, who have hands-on experience as well as degrees from prestigious universities abroad.</p>
        <p>Medhavi College has developed many leaders and entrepreneurs. It assures that every student is technically competent and are possessed with all the necessary skills that an individual requires to achieve success. The updated courses and skills cultured shall help students to develop ideas that benefit society. Students are guided throughout their journey in terms of maximizing potentiality and fulfilling ambitions.</p>
    </div>

    <div class="jumbotron" 
        style="background: rgb(103,108,108); background: linear-gradient(0deg, rgba(103,108,108,0.9475140397956058) 6%, rgba(144,72,88,0.6842087176667542) 15%, rgba(158,36,64,0.7094188017003676) 60%, rgba(189,16,55,0.6702031154258579) 86%);">
    <div class="row">
        <div class="col-md-4" 
            style="background-color:cornflowerblue; width:200px; box-shadow: 3px 3px 3px; border:2px groove #808080; margin: 10px 35px">
            <h2>STAFFS<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT COUNT(*) AS EXPR1 FROM STAFF"></asp:SqlDataSource>
            </h2>
            <p>
                <asp:DropDownList ID="DropDownList1" Enabled="false"   style="-webkit-appearance: none; border:none; background-color:cornflowerblue; " runat="server" DataSourceID="SqlDataSource1" DataTextField="EXPR1" DataValueField="EXPR1" Height="50px" Width="173px">
                </asp:DropDownList>
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4" style="background-color:cornflowerblue; width:200px; box-shadow: 3px 3px 3px; border:2px groove #808080; margin: 10px 35px">
            <h2>COURSES</h2>
            <p>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT COUNT(*) AS EXPR1 FROM COURSES"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList2" Enabled="false"   style="-webkit-appearance: none; border:none; background-color:cornflowerblue; " runat="server" DataSourceID="SqlDataSource2" DataTextField="EXPR1" DataValueField="EXPR1" Height="50px" Width="175px">
                </asp:DropDownList>
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4" style="background-color:cornflowerblue; width:200px; box-shadow: 3px 3px 3px; border:2px groove #808080; margin: 10px 35px">
            <h2>STUDENTS</h2>
            <p>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT COUNT(*) AS EXPR1 FROM STUDENTS"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList3" Enabled="false"   style="-webkit-appearance: none; border:none; background-color:cornflowerblue; " runat="server" DataSourceID="SqlDataSource4" DataTextField="EXPR1" DataValueField="EXPR1" Height="52px" Width="173px">
                </asp:DropDownList>
            </p>
            <p>
                &nbsp;</p>
        </div>
         <div class="col-md-4" style="background-color:cornflowerblue; width:200px; box-shadow: 3px 3px 3px; border:2px groove #808080; margin: 10px 35px">
            <h2>Teachers</h2>
            <p>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:new Connect %>" ProviderName="<%$ ConnectionStrings:new Connect.ProviderName %>" SelectCommand="SELECT COUNT(*) AS EXPR1 FROM STAFF_JOB WHERE (JOB_ID IN ('JB102', 'JB103'))"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList4" Enabled="false"   style="-webkit-appearance: none; border:none; background-color:cornflowerblue; " runat="server" DataSourceID="SqlDataSource3" DataTextField="EXPR1" DataValueField="EXPR1" Height="50px" Width="175px">
                </asp:DropDownList>
            </p>
             <p>
                 &nbsp;</p>
        </div>
    </div>
  
    </div>

</asp:Content>
