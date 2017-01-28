<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" Inherits="Poetry.Oops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBodyTitle" runat="server">
    <h4>Oops, something went wrong.</h4>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <h4 class="error-message">Something horrible happened. We couldn't serve your request. <br />
        Let's keep this as our little secret.</h4>
</asp:Content>
