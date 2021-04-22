<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="offset-4 col-4">
	<form action="" method="post">
		<div class="card">
			<div class="card-header">
				<b>Login To System</b>
			</div>
			<div class="card-body">
			<jsp:include page="/views/user/common/inform.jsp"></jsp:include>
				<div class="form-group">
					<label for="">Username</label> <input type="text"
						class="form-control" name="username" id="username"
						aria-describedby="helpId" placeholder="Username"> <small
						id="usernameHelpId" class="form-text text-muted"></small>
				</div>
				 <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                          </div>
				<div class="form-check form-check-inline">

					<label> <input type="checkbox" class="form-check-inut"
						name="remember">Remember me?

					</label>

				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-success">Login</button>
			</div>
		</div>

	</form>
</div>