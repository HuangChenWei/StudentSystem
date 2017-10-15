<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TA_List.aspx.cs" Inherits="StudentSystem.TA_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding-top: 2%;
            padding-left: 25%;
            padding-right: 20%;
        }

        .gvStyle {
            border: 2px solid #CCC;
        }
            /*Header 標題*/
            .gvStyle th {
                background-color: #E2EAF2;
                font-weight: lighter;
                border: 1px solid #ccc;
                height: 25px;
                text-align: center;
            }
            /*OnMouseOver 滑鼠移過列表時, 背景色變更*/
            .gvStyle tr:hover {
                background-color: #FFF4DA;
            }
            /*Rows 列表顏色*/
            .gvStyle td {
                border: 1px solid #ccc;
                height: 25px;
                text-align: center;
            }
            /*Change Rows 如果想要有單、雙列不同顏色替換, 在這裡更換*/
            .gvStyle .alt {
                background-color: #efefef;
                border: 1px solid #ccc;
                height: 25px;
            }
            /*Page 分頁顏色*/
            .gvStyle .pgr table {
                margin-left: auto;
                margin-right: auto;
            }

            .gvStyle .pgr td {
                background-color: #E2EAF2;
                border-width: 0px;
                padding: 0px 3px 0px 3px;
            }

            .gvStyle .pgr a {
                color: #666;
                text-decoration: underline;
                padding: 0px 3px 0px 3px;
            }

                .gvStyle .pgr a:hover {
                    color: #FF0000;
                    text-decoration: none;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link active" href="/Human-ComputerInteractionDesign.aspx">學生</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/TA_List.aspx">助教</a>
            </li>
        </ul>
    </div>
    <div class="container-fluid">
        <div style="padding: 10px 5px">
            <asp:GridView ID="CourseInformationGridView" runat="server" Style="width: 100%;" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"></asp:GridView>
        </div>
    </div>
</asp:Content>
