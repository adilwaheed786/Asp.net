<%@ Page Title="" Language="C#" MasterPageFile="~/Shooping.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Shopping.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                            <%--<img  style="width:50%;" src="images/user.ico" />--%>
                            <i class="fas fa-key logo"></i>
                            <%--<i class="fas fa-unlock logo"></i>--%>
                            
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3 class="heading">Forget Password</h3>
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
                                    <label class="labels">E-Mail:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox3" runat="server" placeholder="example@gmail.com....." Height="31px" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Bold="True" Font-Names="Times New Roman" ErrorMessage="Please Provide E-Mail" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ToolTip="Please Provide E-Mail">*Required</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Invalid Sysntax E-mail" ForeColor="Red" ToolTip="abc@gmail.com" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Invalid E-mail</asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*Email Does Not Exists In Our System" Font-Bold="True" Display="Dynamic" Font-Names="Times New Roman" ControlToValidate="TextBox3" ForeColor="Red" ></asp:CustomValidator>
                                
                                </div>

                               <%-- <b>
                                    <label class="labels">User Name:</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox1" runat="server" placeholder="User Name...." Height="31px" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter User Name" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="TextBox1" ToolTip="Name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>--%>

                                <%--<hr class="line">--%>
                                <%--<hr class="line">--%>
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
</asp:Content>
