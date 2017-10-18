<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TA_List.aspx.cs" Inherits="StudentSystem.TA_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function showModal() {
            $('#exampleModal').modal('toggle')
        }
        function aaa() {
            alert("測試");
        }

    </script>
    <style>
        .table_a {
            margin-left: 10%;
            width: 80%;
        }

            .table_a .form-control {
                margin-bottom: 10px;
            }

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
                <a class="nav-link active" href="/CourseStList.aspx">學生</a>
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
    <%--<div class="container-fluid">
        <div style="padding: 10px 5px">
            <strong>新增課堂助教</strong>
        </div>
        <div>
            <div class="row" style="padding: 5px 20px">
                <div>
                    <asp:TextBox type="text" class="form-control" ID="SearchTxt" placeholder="輸入學號" runat="server" MaxLength="8" Style="height: 79%" />
                </div>
                <div>
                    <asp:Button ID="SearchBtn" type="button" class="btn btn-outline-dark btn-sm" Text="Search" runat="server"></asp:Button>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="container-fluid">
        <div class="row" style="padding-top: 20px">
            <div class="col-md-5">
                <strong style="font-size: 20px">助教清單</strong>
            </div>
            <div class="col-md-4" style="padding:0px">
                <asp:TextBox type="text" class="form-control" ID="StIDTxt" placeholder="新增助教的學號" runat="server" MaxLength="8" style="height: 80%;" />
            </div>
            <div class="col-md-3">
                <asp:Button ID="SearchIDBtn" class="btn btn-outline-dark btn-sm" Text="新增助教" runat="server" OnClick="SearchIDBtn_Click"></asp:Button>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div style="padding: 10px 5px">
            <asp:GridView ID="GridView1" runat="server" Style="width: 100%;" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"></asp:GridView>
        </div>
    </div>
    <!-- Button trigger modal -->
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">新增助教</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table_a">
                            <tbody>
                                <tr>
                                    <th>姓名
                                                <small class="text-muted">FullName</small>
                                        <small class="text-danger">*必須填寫</small>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="FullNameTextBox" type="text" class="form-control" placeholder="輸入姓名" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>會員帳號/學號
                                                <small class="text-muted">UserName</small>
                                        <small class="text-danger">*請填寫學號，密碼也是學號喔!</small>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="UserNameTextBox" type="text" class="form-control" MaxLength="8" placeholder="輸入帳號" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>系級
                                                <small class="text-muted">Department</small>
                                        <small class="text-danger">*必須填寫</small>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <select id="DepartmentSelect" runat="server" class="form-control">
                                                <option value="">請選擇</option>
                                                <option value="資工系">資工系</option>
                                                <option value="資管系">資管系</option>
                                                <option value="資傳系">資傳系</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>班級
                                                <small class="text-muted">Class</small>
                                        <small class="text-danger">*必須填寫</small>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <select id="ClassSelect" runat="server" class="form-control">
                                                <option value="">請選擇</option>
                                                <option value="1A">碩一</option>
                                                <option value="2A">碩二</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <th>修課
                                                <small class="text-muted">Course</small>
                                        <small class="text-danger">*必須填寫</small>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <select id="CourseSelect" runat="server" class="form-control">
                                                <option value="">請選擇</option>
                                                <option value="視窗程式設計">視窗程式設計</option>
                                                <option value="程式設計(一)">程式設計(一)</option>
                                                <option value="人機互動設計">人機互動設計</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button3" type="button" class="btn btn-secondary" data-dismiss="modal" Text="取消" runat="server"></asp:Button>
                    <asp:Button ID="Button2" class="btn btn-primary" Text="確定" runat="server" OnClientClick="aaa();"></asp:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
