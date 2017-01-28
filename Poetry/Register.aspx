<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Poetry.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBodyTitle" runat="server">
    <h4>Become a part of the big family</h4>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <section class="body-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form runat="server" name="sentMessage" id="LoginForm" novalidate="">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <asp:Label ID="LabelUsername" runat="server" AssociatedControlID="TextBoxUsername" Text="Username"></asp:Label>
                                <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control" placeholder="Username" required="required"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsername" CssClass="text-error" ErrorMessage="The username field is required." />
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <asp:Label ID="LabelEmail" runat="server" AssociatedControlID="TextBoxEmail" Text="Email"></asp:Label>
                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" placeholder="Email" required="required"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="Invalid email address."></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEmail" CssClass="text-error" ErrorMessage="The email field is required." />
                            </div>
                        </div>

                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <asp:Label ID="LabelPassword" runat="server" AssociatedControlID="TextBoxPassword" Text="Password"></asp:Label>
                                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" required="required"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator" ControlToValidate="TextBoxPassword" ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,20}$" runat="server" ErrorMessage="The password should be between 6 and 20 symbols, containing at least one digit, lower and capital letter."></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <asp:Label ID="LabelConfirmPassword" runat="server" AssociatedControlID="TextBoxConfirmPassword" Text="Confirm password"></asp:Label>
                                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" required="required"></asp:TextBox>
                                <asp:CompareValidator runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" CssClass="text-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <asp:Button ID="ButtonRegister" runat="server" Text="Register" CssClass="btn btn-success btn-lg" OnClick="ButtonRegisterClick" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
