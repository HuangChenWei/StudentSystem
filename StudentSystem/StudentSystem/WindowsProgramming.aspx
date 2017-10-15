<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WindowsProgramming.aspx.cs" Inherits="StudentSystem.WindowsProgramming" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding-top: 5%;
            padding-left: 25%;
            padding-right: 20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h3>視窗程式設計</h3>
    </div>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
</asp:Content>
