<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ComputerProgramming(I).aspx.cs" Inherits="StudentSystem.ComputerProgramming_I_" %>

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
        <h3>程式設計(一)</h3>
    </div>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
</asp:Content>
