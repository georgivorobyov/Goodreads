<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Poetry.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageBodyTitle" runat="server">
    <h4>Latest poems...</h4>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <div class="content-section-b">
        <asp:Repeater ID="RepeaterPoems" runat="server">
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-lg-offset-1 col-sm-push-2 col-sm-6">
                            <hr class="section-heading-spacer">
                            <div class="clearfix"></div>
                            <div class="section-heading">
                                <h2>
                                    <a href='/Poem.aspx?id=<%# DataBinder.Eval(Container.DataItem, "PoemId") %>'>
                                        <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                    </a>
                                </h2>
                                <span class="additional-info">By: <%# DataBinder.Eval(Container.DataItem, "Author") %></span>
                                <span class="additional-info"><%# DataBinder.Eval(Container.DataItem, "PublishDate") %></span>
                            </div>
                            <pre class="poem"><%# DataBinder.Eval(Container.DataItem, "Content") %></pre>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
