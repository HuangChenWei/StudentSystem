<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Human-ComputerInteractionDesign.aspx.cs" Inherits="StudentSystem.Human_ComputerInteractionDesign" %>

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

    <script type="text/javascript">
        //function AddStudentData() {
        //        document.getElementById("tr2").innerHTML =
        //        document.getElementById("tr2").innerHTML
        //}
        //function foo() {
        //    $('#div').append('<tr><th>ID</th><th>系名</th> <th>班級</th> <th>學號</th><th>姓名</th></tr>');
        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="HidValue" runat="Server" />
    <div>
        <ul class="nav">
            <li class="nav-item">
                 <a class="nav-link" href="/Human-ComputerInteractionDesign.aspx">學生</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/TA_List.aspx">助教</a>
            </li>
        </ul>
    </div>
    <div class="container-fluid">
        <%--        <table class="table">
            <caption>基本的表格布局</caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>系名</th>
                    <th>班級</th>
                    <th>學號</th>
                    <th>姓名</th>
                </tr>
            </thead>
            <tbody id="div">
            </tbody>
        </table>--%>
        <div class="container">
            <div class="col align-self-center">
                <h3>人機互動設計</h3>
            </div>
        </div>
        <div>
            <strong>學生清單</strong>
        </div>
        <div style="padding: 10px 5px">
            <asp:GridView ID="CourseInformationGridView" runat="server" Style="width: 100%;" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"></asp:GridView>
        </div>
        <div style="padding: 10px 5px">
            <asp:GridView ID="StudentListGridView" runat="server" Style="width: 100%;" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"></asp:GridView>
        </div>
        <div class="container">
            <div class="col align-self-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</asp:Content>
