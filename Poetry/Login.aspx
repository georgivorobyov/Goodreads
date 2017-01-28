<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Poetry.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBodyTitle" runat="server">
    <h4>Login</h4>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <section class="body-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form runat="server" name="sentMessage" id="LoginForm" novalidate="">
                        <div runat="server" id="ErrorContainer" visible="false" class="alert alert-warning alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <asp:Label ID="ValidationError" runat="server" />
                        </div>

                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <asp:Label ID="LabelUsername" runat="server" AssociatedControlID="TextBoxUsername" Text="Username"></asp:Label>
                                <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control" placeholder="Username" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <asp:Label ID="LabelPassword" runat="server" AssociatedControlID="TextBoxPassword" Text="Password"></asp:Label>
                                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="btn btn-success btn-lg" OnClick="Login_Click" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
