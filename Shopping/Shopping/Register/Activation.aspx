<%@ Page Title="" Language="C#" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="Activation.aspx.cs" Inherits="Shopping.Register.Activation" %>
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
                           <h3 class="heading">Email Verification</h3>
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
                                <asp:Label ID="Label2" runat="server" Text="text" ForeColor="#009900"></asp:Label>
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
                                    <label class="labels">Activation Code::</label></b>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text" ID="TextBox3" runat="server" placeholder="Code.." Height="31px" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Bold="True" Font-Names="Times New Roman" ErrorMessage="Please Provide E-Mail" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ToolTip="Please Provide E-Mail">*Required</asp:RequiredFieldValidator>                                
                                </div>
                                <hr />
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-primary btn-block btn-md letter" ID="Button1" runat="server" Text="Activate Email" Width="100%" Font-Bold="True" OnClick="Button1_Click" />
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
    <script>  
        function alertme() {
         
            swal(
             "Welcome !","Your E-mail Has Been Verified \n Please Login Your Account Click Ok", "success"     
            ).then(function()             
            {
                window.location.href = "UserLoginPage.aspx";
                }
                )
        };
        function alertmewrong() {
                swal("Invalid Credential!", "Incorrect Activation Code Please Check Your E-Mail", "error");
            }
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
