<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Poem.aspx.cs" Inherits="Poetry.Poem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBodyTitle" runat="server">
    <h4><%= PoemModel.Title %></h4>
    <span class="subtitle">By <%= PoemModel.Author %></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <section class="body-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">

<pre class="main-poem">
<%= PoemModel.Content %>
</pre>

                </div>
            </div>
        <asp:Repeater ID="RepeaterComments" runat="server">
           <ItemTemplate>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 comment-body">
                        <p><%# DataBinder.Eval(Container.DataItem, "Content") %></p>
                        <span class="additional-info">From: <%# DataBinder.Eval(Container.DataItem, "Author") %></span>
                        <span class="additional-info">Date: <%# DataBinder.Eval(Container.DataItem, "Date") %></span>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form runat="server" name="sentComment" id="CommentForm" novalidate="">
                        <asp:LoginView ID="LoginView" runat="server">
                            <AnonymousTemplate>
                                <div class="not-logged-in">Login or register to post comments</div>
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <div runat="server" id="ErrorContainer" visible="false" class="alert alert-warning alert-dismissable">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <asp:Label ID="ValidationError" runat="server" />
                                </div>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <asp:Label ID="LabelContent" runat="server" AssociatedControlID="TextBoxContent" Text="Content"></asp:Label>
                                        <asp:TextBox TextMode="multiline" Rows="3" ID="TextBoxContent" runat="server" CssClass="form-control" placeholder="Type your comment here." required="required"></asp:TextBox>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group col-xs-12">
                                        <asp:Button ID="ButtonComment" runat="server" Text="Comment" CssClass="btn btn-success btn-lg" OnClick="ButtonCommentClick" />
                                    </div>
                                </div>
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </form>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
