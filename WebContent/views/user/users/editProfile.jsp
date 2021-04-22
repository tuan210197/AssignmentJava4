<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col-8 offset-2">
	<form action="EditProfile" method="post">
		<div class="card mt-5">
			<div class="card-header">
				<b>Edit Profile</b>

			</div>
			<div class="card-body">
			<jsp:include page="/views/user/common/inform.jsp"></jsp:include>
				<div class="row">
				
					<div class="col">
					
						<div class="form-group">
							<label for="username">Username</label>
							 <input type="text" 
								class="form-control" name="username" id="username"
								value="${user.username }" readonly="readonly"
								aria-describedby="usernameHelpId" placeholder="Username">
							<small id="usernameHelpId" class="form-text text-muted"></small>
						</div>
						<div class="form-group">
							<label for="fullname">Fullname</label> <input type="text"
								class="form-control" name="fullname" id="fullname"
								value="${user.fullname }"
								aria-describedby="fullnameelpId" placeholder="Fullname">
							<small id="fullnameHelpId" class="form-text text-muted"></small>
						</div>
						
					</div>
					<div class="col">
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" name="password" id="password" value="${user.password }" 
								placeholder="Password">
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="text"
								class="form-control" name="email" id="email"
								value="${user.email }"
								aria-describedby="emailHelpId" placeholder="Email"> <small
								id="emailHelpId" class="form-text text-muted"></small>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted text-center">
				<button class="btn btn-success">Update</button>
			</div>
		</div>
	</form>
</div>