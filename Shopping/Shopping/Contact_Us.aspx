<%@ Page Title="" Language="C#" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="Contact_Us.aspx.cs"  Inherits="Shopping.Contact_Us" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            
                <div class="col-md-12 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                          <i class="fas fa-address-card logo"></i>                           
                           
                           <h3 class="heading">Contact Us</h3>
                        </center>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6 text-justify">

                                    <img class="img-fluid" src="Images%20Web/Contact1.jpg" alt="contact" />
                                    <%--  <center>
                          
                                 <h3 class=""><b>How may I help You?</b></h3>
                        </center>--%>
                                </div>

                                <div class="col-md-6">
                                    <b>
                                        <label class="labels">User Name:</label></b>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control text" ID="TextBox1" runat="server" placeholder="User Name...." Height="31px" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter User Name" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox1" ToolTip="Name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                    <b>
                                        <label class="labels">Phone No:</label></b>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control text" ID="TextBox2" runat="server" placeholder="Phone Number...." TextMode="Number" Height="31px" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Number 123 etc" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox2" ToolTip="Number" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>

                                    <b>
                                        <label class="labels">E-Mail:</label></b>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control text" ID="TextBox3" runat="server" placeholder="example@gmail.com....." Height="31px" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Bold="True" Font-Names="Times New Roman" ErrorMessage="Please Provide E-Mail" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ToolTip="Please Provide E-Mail">*Required</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Invalid Sysntax E-mail" ForeColor="Red" ToolTip="abc@gmail.com" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Invalid E-mail</asp:RegularExpressionValidator>
                                    </div>
                                    <b>
                                        <label class="labels">Message</label></b>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control text" ID="TextBox5" runat="server" placeholder="Message here....." Width="100%" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                    <%--<hr class="line">--%>
                                    <hr />
                                    <div class="form-group">
                                        <asp:Button CssClass="btn btn-primary btn-block btn-md letter" ID="Button1" runat="server" Text="Submit" Width="100%" Font-Bold="True" />
                                    </div>

                                    <div class="form-group my-auto ">
                                        <center>
             <Label ID="Label1" runat="server" >Back To  <a href="userloginpage.aspx" style="text-decoration:none">Log In</a></Label>
                             </center>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    <hr />
    </asp:Content>
