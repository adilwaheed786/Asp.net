<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="UserLoginPage.aspx.cs" Inherits="Shopping.UserLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="row justify-content-center">
        <div id="myalert" class="alert alert-success collapse">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>Success</strong> You Have been Successfully Login!!
         
        </div>

    </div>
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                            <%--<img  style="width:50%;" src="images/user.ico" />--%>
                            <i class="fas fa-user logo"></i>
                            </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h3 class="heading">Log In</h3>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <%-- <hr class="line">--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">


                                    <b>
                                        <label class="labels">User Type:</label></b>
                                    <div class="form-group">
                                        <asp:DropDownList CssClass="form-control drop" ID="DropDownList1" runat="server" Font-Bold="True" Width="100%">
                                            <asp:ListItem Selected="True">Select Type</asp:ListItem>
                                            <asp:ListItem Value="Become A Seller">Become A Seller</asp:ListItem>
                                            <asp:ListItem Value="Become A Buyer">Become A Buyer</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Select User Type" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="DropDownList1" ToolTip="Name" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Type"></asp:RequiredFieldValidator>

                                    </div>


                                    <b>
                                        <label class="labels">User E-Mail:</label></b>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control text" ID="TextBox1" runat="server" placeholder="User E-mail...." Height="31px" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter E-mail Address" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox1" ToolTip="E-mail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Invalid Sysntax E-mail" ForeColor="Red" ToolTip="abc@gmail.com" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Invalid E-mail</asp:RegularExpressionValidator>                                
                                    </div>
                                    <b>
                                        <label class="labels">Password:</label></b>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control text" ID="TextBox2" runat="server" placeholder="Password...." TextMode="Password" Height="31px" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Password" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox2" ToolTip="Password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group " style="text-align: right">
                                        <a href="Forgetpassword.aspx" style="text-decoration: none">Forget Password?</a>
                                    </div>
                                    <%--<hr class="line">--%>
                                    <hr />
                                    <div class="form-group">
                                        <asp:Button CssClass="btn btn-success btn-block btn-md letter" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" Width="100%" Font-Bold="True" />
                                    </div>

                                    <%-- <div class="form-group">
                           <a style="text-decoration:none;width:100%;" href="usersignuppage.aspx">
                               <input  class="btn btn-primary btn-block btn-md letter"  id="Button2" type="button" value="Create Account" style="font-weight:bold" /></a>
                  </div>--%>
                                    <div class="form-group my-auto ">
                                        <center>
             <Label ID="Label1" runat="server" >Don't Have an Account?  <a href="usersignuppage.aspx" style="text-decoration:none">Sign Up</a></Label>
                             </center>

                                    </div>



                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script>  
            function alertme() {
                swal("Password Correct !", "Welcome User", "success");

            }
            function alertmewrong() {
                swal("Invalid Credential!", "Check Username & Password ", "error");
            }


          </script>
</asp:Content>
