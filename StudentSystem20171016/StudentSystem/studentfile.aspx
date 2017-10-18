<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="studentfile.aspx.cs" Inherits="StudentSystem.studentfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding-top: 5%;
            padding-left: 25%;
            padding-right: 20%;
        }
    </style>
    <script type="text/javascript">
        //視窗程式設計
        var value1 = '<%=str1 %>'
        //程式設計(一)
        var value2 = '<%=str2 %>'
        //人機互動設計
        var value3 = '<%=str3 %>'
        function addCourse() {
            //新增視窗程式設計的label
            document.getElementById("addcourse").innerHTML =
                    document.getElementById("addcourse").innerHTML
                    + '<tr><td>1061</td><td>'
                    + '<asp:Label class="text-secondary" runat="server" Text="'
                    + value1 + '"></asp:Label></td></tr>'
        }
        //新增程式設計(一)的label
        function addCourse2() {
            document.getElementById("addcourse").innerHTML =
                    document.getElementById("addcourse").innerHTML
                    + '<tr><td>1061</td><td>'
                    + '<asp:Label class="text-secondary" runat="server" Text="'
                    + value2 + '"></asp:Label></td></tr>'
        }
        //新增人機互動設計的label
        function addCourse3() {
            document.getElementById("addcourse").innerHTML =
                    document.getElementById("addcourse").innerHTML
                    + '<tr><td>1061</td><td>'
                    + '<asp:Label class="text-secondary" runat="server" Text="'
                    + value3 + '"></asp:Label></td></tr>'
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row" style="padding-bottom: 5%">
            <div class="col-md-9">
                <h2 class="text-dark">
                    <asp:Label ID="FullName" runat="server"></asp:Label></h2>
            </div>
            <div class="col-md-3">
                <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#exampleModal" style="margin-right: 0%">修改密碼</button>
            </div>
        </div>
    </div>
    <table class="table table-bordered" style="width: 100%">
        <colgroup>
            <col style="width: 20%" />
            <col style="width: 80%" />
        </colgroup>
        <thead class="thead-inverse">
            <tr>
                <th>摘要</th>
                <th>類別</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>系級</th>
                <td>
                    <asp:Label ID="Department" class="text-secondary" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>班級</th>
                <td>
                    <asp:Label ID="classtxt" class="text-secondary" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>學號</th>
                <td>
                    <asp:Label ID="StudentID" class="text-secondary" runat="server"></asp:Label></td>
            </tr>
        </tbody>
    </table>
    <table class="table table-bordered" style="width: 100%">
        <colgroup>
            <col style="width: 20%" />
            <col style="width: 80%" />
        </colgroup>
        <thead class="thead-inverse">
            <tr>
                <th>學期</th>
                <th>修課</th>
            </tr>
        </thead>
        <tbody id="addcourse">
        </tbody>
    </table>
    <!-- 修改密碼的Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">修改密碼</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="container-fluid">
                    <div class="modal-body">
                        <table>
                            <tbody>
                                <tr>
                                    <th>舊密碼</th>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col">
                                            <asp:TextBox ID="oldpwd" type="password" class="form-control" placeholder="請輸入原始密碼" runat="server" required></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>新密碼</th>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col">
                                            <asp:TextBox ID="newpwd" type="password" class="form-control" placeholder="請輸入新密碼" runat="server" required></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>再輸入一次新密碼</th>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col">
                                            <asp:TextBox ID="checkpwd" type="password" class="form-control" placeholder="請再輸入一次新密碼" runat="server" required></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button type="button" class="btn btn-primary" Text="修改密碼" runat="server" OnClick="UpdatePassword_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
