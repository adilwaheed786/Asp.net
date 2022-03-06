<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="AdminLoginpage.aspx.cs" Inherits="Shopping.AdminLoginpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <%-- <img  style="width:50%;" src="images/adm.png" />--%>
                            <i class="fas fa-user-shield logo"></i>
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3 class="heading">Admin Login</h3>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <b>
                                    <label class="labels">Admin Name:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox1" runat="server" placeholder="Admin Name...." Height="31px" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Name" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox1" ToolTip="Enter Name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                                <b>
                                    <label class="labels">Password:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox2" runat="server" placeholder="Password...." TextMode="Password" Height="31px" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Password" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox2" ToolTip="Password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-md letter" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" Font-Bold="True" />
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <%-----------------------------------------------------------------------%>

    <%-------------------------------------------------------------------------------%>
    <script>  
        function alertme() {
            swal("Invalid Crediential ", "Please provide Correct Information", "error");
        }
          </script>
</asp:Content>
