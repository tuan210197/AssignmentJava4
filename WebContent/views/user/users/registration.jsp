<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col-8 offset">
	<form action="" method="post">

		<div class="card">
			<div class="card-header">
				<b>Registration</b>
			</div>
			<div class="card-body">
			<c:if test="${not empty message }">
			<div class="row">
				<div class="col">			
					<div class="alert alert-success">${message }</div>
					
				</div>
			</div>
			</c:if>
			<c:if test="${not empty error }">
			<div class="row">
				<div class="col">			
					
					<div class="alert alert-danger">${error }</div>
				</div>
			</div>
			</c:if>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="fullname">Username</label> 
							<input type="text"
								class="form-control" name="username" id="username" value="${user.username }"
								aria-describedby="helpId" placeholder="Username"> <small
								id="usernameHelpId" class="form-text text-muted">Username
								is required!</small>
						</div>
						<div class="form-group">
							<label for="fullname">Fullname</label> <input type="text"
								class="form-control" name="fullname" id="fullname"
								aria-describedby="helpId" placeholder="Fullname" value="${user.fullname }"> <small
								id="fullnameHelpId" class="form-text text-muted">Fullname
								is required!</small>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" name="password" id="password"
								placeholder="password">
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="text"
								class="form-control" name="email" id="email"
								aria-describedby="helpId" placeholder="Email" value="${user.email }"> <small
								id="emailHelpId" class="form-text text-muted">Email is
								required!</small>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-success">Sign Up</button>
			</div>
		</div>
	</form>
</div>