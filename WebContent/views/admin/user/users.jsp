<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col mt-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="userEditing-tab" data-toggle="tab"
			href="#userEditing" role="tab" aria-controls="userEditing"
			aria-selected="true">User Editing</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="userlist-tab" data-toggle="tab" href="#userlist" role="tab"
			aria-controls="userlist" aria-selected="false">User List</a></li>

	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="userEditing"
			role="tabpanel" aria-labelledby="userEditing-tab">
			<form action="" method="post">
				<div class="card">

					<div class="card-body">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="username">Username</label> <input type="text"
										class="form-control" name="username" id="username"
										aria-describedby="usernameHelpId" placeholder="Username">
									<small id="usernameHelpId" class="form-text text-muted">Username
										is required!</small>
								</div>
								<div class="form-group">
									<label for="fullname">Fullname</label> <input type="text"
										class="form-control" name="fullname" id="fullname"
										aria-describedby="fullnameHelpId" placeholder="Fullname">
									<small id="fullnameHelpId" class="form-text text-muted">Fullname
										is required!</small>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="password">Password</label> <input type="text"
										class="form-control" name="password" id="password"
										aria-describedby="passwordHelpId" placeholder="Password">
									<small id="passwordHelpId" class="form-text text-muted">Password
										is required!</small>
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input type="text"
										class="form-control" name="email" id="email"
										aria-describedby="emailHelpId" placeholder="Email"> <small
										id="emailHelpId" class="form-text text-muted">Email is
										required!</small>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted text-center">
						<button class="btn btn-success">Create</button>
						<button class="btn btn-warning">Update</button>
						<button class="btn btn-danger">Delele</button>
						<button class="btn btn-info">Clear</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="userlist" role="tabpanel"
			aria-labelledby="userlist-tab">

			<table class="table table-strip">

				<tr>

					<td>Username</td>
					<td>Fullname</td>
					<td>Email</td>
					<td>Role</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>123</td>
					<td>java</td>
					<td>doanvantuan197bg@gamil.com</td>
					<td>Admin</td>
					<td><a href="" class="pr-2"><i class="fa fa-edit"
							aria-hidden="true"></i>Edit</a> <a href=""><i class="fa fa-trash"
							aria-hidden="true"></i>Delete</a></td>
				</tr>
			</table>
		</div>

	</div>
</div>