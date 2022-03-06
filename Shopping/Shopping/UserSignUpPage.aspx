<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="UserSignUpPage.aspx.cs" Inherits="Shopping.UserSignUpPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <%-- <img  style="width:50%;" src="images/new user.ico" />--%>
                                    <i class="fas fa-user-plus logo" ></i>
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3 class="heading">Create Account</h3>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <%--<hr class="line">--%>
                                <b>
                                    <label class="labels">Account Type:</label></b>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control drop" ID="DropDownList1" runat="server" Width="100%" Font-Bold="True">
                                        <asp:ListItem Selected="True">Select Account Type </asp:ListItem>
                                        <asp:ListItem Value="Become A Seller">Become A Seller</asp:ListItem>
                                        <asp:ListItem Value="Become A Buyer">Become A Buyer</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Select Account Type" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="DropDownList1" ToolTip="Name" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Account Type"></asp:RequiredFieldValidator>

                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <b>
                                    <label class="labels">User Name:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox1" runat="server" placeholder="User Name....." Height="31px" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please Provide Name" ControlToValidate="TextBox1" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True" ToolTip="Please Provide Name">Required</asp:RequiredFieldValidator>
                                </div>
                                <b>
                                    <label class="labels">E-Mail:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox3" runat="server" placeholder="example@gmail.com....." Height="31px" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Bold="True" Font-Names="Times New Roman" ErrorMessage="Please Provide E-Mail" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ToolTip="Please Provide E-Mail">*Required</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Invalid Sysntax E-mail" ForeColor="Red" ToolTip="abc@gmail.com" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Invalid E-mail</asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="!Email Already Exists" Font-Bold="True" Display="Dynamic" Font-Names="Times New Roman" ControlToValidate="TextBox3" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate1"></asp:CustomValidator>
                                
                                </div>
                                <b>
                                    <label class="labels">Password:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox2" runat="server" placeholder="Password....." TextMode="Password" Height="31px" Width="100%"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Provide Password" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True" ToolTip="Please Provide Password">Required</asp:RequiredFieldValidator>

                                </div>
                                <b>
                                    <label class="labels">Confirm Password:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox4" runat="server" placeholder="Confirm Password....." TextMode="Password" Height="31px" Width="100%"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Match " Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox4" Display="Dynamic" ForeColor="Red" ControlToCompare="TextBox2" SetFocusOnError="True"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="*Please Fill!!" ForeColor="Red" Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True">Please Provide Confirm Password</asp:RequiredFieldValidator>
                                </div>
                                <b>
                                    <label class="labels">Address</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox5" runat="server" placeholder="Text here....." Width="100%" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <%--<hr class="line">--%>
                                <hr />
                                <div class="form-group">

                                    <asp:Button CssClass="btn btn-primary btn-block btn-md letter" ID="Button1" runat="server" Text="SIGN UP" OnClick="Button1_Click" Width="100%" Font-Bold="True" />

                                </div>

                                <div class="form-group my-auto ">
                                    <center>
                 <Label ID="Label1" runat="server" >You Have an Already Account?  <a href="userloginpage.aspx" style="text-decoration:none">Sign In</a></Label>
                             </center>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- New FORM --%>
    <hr />


    <%-- New FORm END --%>
    <script>  
        function alertme() {
            var a = document.getElementById('<%=TextBox1.ClientID %>').value;
            var email = document.getElementById('<%=TextBox3.ClientID %>').value;
            swal(
             "Welcome " + a + " !","Account Created \n Plaese Verify Your Account Click Ok", "success"     
            ).then(function()             
            {
                window.location.href = "Register/Activation.aspx?emailadd=" + email;
                }
                )
        };
        
         function alertmeException() {
            swal(
             "Warning !","Some Exception: ", "error"     
            ).then(function()             
                {
                    window.location.href = "usersignuppage.aspx";
                }
                )
        };
          </script>
</asp:Content>
