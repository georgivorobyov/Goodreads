<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PublishPoem.aspx.cs" Inherits="Poetry.PublishPoem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBodyTitle" runat="server">
    <h3>Give wings to your masterpiece</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
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
                                <asp:Label ID="LabelTitle" runat="server" AssociatedControlID="TextBoxTitle" Text="Title"></asp:Label>
                                <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="form-control" placeholder="Title" required="required" maxlength="255"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <asp:Label ID="LabelContent" runat="server" AssociatedControlID="TextBoxContent" Text="Content"></asp:Label>
                                <asp:TextBox TextMode="multiline" Rows="20" ID="TextBoxContent" runat="server" CssClass="form-control" placeholder="Content" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <asp:Button ID="ButtonPublish" runat="server" Text="Publish" CssClass="btn btn-success btn-lg" OnClick="ButtonPublishClick" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
