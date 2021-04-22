<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="offset-3 col-6 mt4">
	<form action="" method="post">
		<div class="card">
			<div class="card-header">Change PassWord</div>
			<div class="card-body">
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="username">username</label> <input type="text"
								class="form-control" name="username" id="username"
								aria-describedby="usernameHelpId" placeholder="Username">
							<small id="helpId" class="form-text text-muted">Username
								is required!</small>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" name="password" id="password"
								placeholder="Password">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="currentpassword">Current Password</label> <input
								type="password" class="form-control" name="currentpassword"
								id="currentpassword" placeholder="Current Password">
						</div>
						<div class="form-group">
							<label for="comfirmpassword">Comfirm Password</label> <input
								type="password" class="form-control" name="comfirmpassword"
								id="comfirmpassword" placeholder="Comfirm Password">
						</div>
					</div>

				</div>
			</div>
			<div class="card-footer text-muted text-center">
				<button class="btn btn-success">Change Password</button>
			</div>
		</div>

	</form>
</div>