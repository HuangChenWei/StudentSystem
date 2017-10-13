<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="StudentSystem._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- Bootstrap CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        <!--後端呼叫Modal-->
    function showModal() {
        $('#myModal').modal('show')
    }
    </script>
    <style>
        body {
            padding: 10px;
            font-family: 'Varela Round';
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        #signintxt {
            color: #198da8;
            margin-bottom: 10px;
            margin-top: 30%;
        }

        #loginbtn {
            width: 280px;
            color: #fff;
            background-color: #198da8;
            border-color: #53A3CD;
            margin-bottom: 10px;
        }

        .form-group {
            width: 280px;
        }

        .table_a {
            margin-left: 10%;
            width: 80%;
        }

        .form-control {
            margin-bottom: 10px;
        }

        #TextBox5 {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server" class="form-signin" name="form_name">
            <h3 id="signintxt">使用者登入</h3>
            <div class="form-group">
                <asp:Label for="useremail" runat="server">帳號</asp:Label>
                <asp:TextBox type="text" class="form-control" ID="userid" placeholder="輸入帳號" runat="server"  maxlength="8" KeyPress="userid_KeyPress" required/>
            </div>
            <div class="form-group">
                <asp:Label for="userpasswd" runat="server">密碼</asp:Label>
                <asp:TextBox type="password" class="form-control" ID="userpasswd" placeholder="輸入密碼" runat="server" KeyPress="userpasswd_KeyPress" required/>
            </div>
            <asp:Button ID="loginbtn" type="button" Text="登入" runat="server" CssClass="btn btn-primary" OnClick="loginbtn_Click"></asp:Button>
            <!--alert
            <button type="button" class="btn btn-secondary" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                Popover on top
            </button>
            <script>
                $(document).ready(function () {
                    $('[data-toggle="popover"]').popover(
                        );
                })
            </script>
                -->
            <div>
                <span class="forgotpswd"><a href="/JoinMember.aspx">忘記密碼</a></span>
                <span class="joinmember">還不是用戶? <a data-toggle="modal" href="#exampleModal">建立用戶</a></span>
            </div>

            <!-- Modal 登入失敗-->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabe1" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="H1">錯誤</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            帳號或密碼輸入錯誤
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal 建立帳戶 頭-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">建立助教用戶</h5>
                            <button type="button" class="auto-style1" data-dismiss="modal" aria-label="Close">
                                &times;
                            </button>
                        </div>
                        <div class="modal-body" runat="server">
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
                                                <asp:TextBox ID="FullNameTextBox" type="text" class="form-control" placeholder="輸入姓名" runat="server"/>
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
                                                <asp:TextBox ID="UserNameTextBox" type="text" class="form-control" maxlength="8" placeholder="輸入帳號" runat="server" />
                                            </td>
                                        </tr>
                                        <%--<tr>
                                            <th>密碼
                                                <small class="text-muted">Password</small>
                                                <small class="text-danger">*必須填寫</small>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TextBox3" class="form-control" type="password" placeholder="輸入密碼" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>密碼確認
                                                <small class="text-muted">Comfirm Password</small>
                                                <small class="text-danger">*必須填寫</small>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TextBox4" class="form-control" type="password" placeholder="確認密碼" runat="server"></asp:TextBox>
                                                <p class="point err" id="chkpwderr" style="display: none">輸入錯誤，請重新輸入</p>
                                            </td>
                                        </tr>--%>
                                        <%--<tr>
                                            <th>電子郵件
                                                <small class="text-muted">Your E-mail</small>
                                                <small class="text-danger">*必須填寫</small>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TextBox5" type="email" class="form-control" placeholder="輸入電子郵件" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>--%>
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
                                                        <option value="碩一">碩一</option>
                                                        <option value="碩二">碩二</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
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
                                        </tr>
                                        <%--<tr>
                                            <th>電話(手機)
                                                <small class="text-muted">Phone Number</small>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TextBox6" type="tel" class="form-control" placeholder="確認密碼" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>性別
                                                <small class="text-muted">Gender</small>
                                                <small class="text-danger">*必須填寫</small>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>
                                                    <select id="Gender" runat="server" class="form-control">
                                                        <option value="">請選擇</option>
                                                        <option value="男">男</option>
                                                        <option value="女">女</option>
                                                    </select>
                                                    <script>
                                                        //  $("#Gender").empty();
                                                    </script>
                                                </div>
                                            </td>
                                        </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button type="button" class="btn btn-secondary" data-dismiss="modal" Text="取消" runat="server"></asp:Button>
                            <asp:Button ID="Button2" type="button" class="btn btn-primary" Text="確定" runat="server" OnClick="Button2_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal 建立帳戶 尾-->
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>

