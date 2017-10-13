<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RollCall.aspx.cs" Inherits="StudentSystem.RollCall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding-top: 3.5rem;
            padding-left: 8%;
        }
    </style>
    <script>
        //var a = prompt("請輸入數字", "0");
        //if (a > 0) document.write("正數");
        function fun(name) {
            document.write("我叫"+name+"</br>");
        }
        fun("123");
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
