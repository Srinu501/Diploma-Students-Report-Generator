<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				$("#year").change(
						function() {

							$.ajax({

								url : "./forwardPage.jsp?sem="
										+ $("#sem").val() + "&branch="
										+ $("#branch").val() + "&year="
										+ $("#year").val(),

								success : function(result) {

									$("#subj").html(result);

								}

							});

						});

			});
	$(document).ready(
			function() {

				$("#sem").change(
						function() {

							$.ajax({

								url : "./forwardPage.jsp?sem="
										+ $("#sem").val() + "&branch="
										+ $("#branch").val() + "&year="
										+ $("#year").val(),

								success : function(result) {

									$("#subj").html(result);

								}

							});

						});

			});
	$(document).ready(
			function() {

				$("#branch").change(
						function() {

							$.ajax({

								url : "./forwardPage.jsp?sem="
										+ $("#sem").val() + "&branch="
										+ $("#branch").val() + "&year="
										+ $("#year").val(),

								success : function(result) {

									$("#subj").html(result);

								}

							});

						});

			});
	function myNewFunction(sel) {
		/* alert(sel.options[sel.selectedIndex].text); */
		document.getElementsByName('sub')[0].value = sel.options[sel.selectedIndex].text;
	}
	function myNewFunction1(sel) {
		/* alert(sel.options[sel.selectedIndex].text); */
		document.getElementsByName('branchname')[0].value = sel.options[sel.selectedIndex].text;
	}
	function myNewFunction2(sel) {
		/* alert(sel.options[sel.selectedIndex].text); */
		document.getElementsByName('semname')[0].value = sel.options[sel.selectedIndex].text;
	}
</script>
	
</head>
<body>
<form action="swr.jsp" method="get">
	<center>	<table>

			<tr>
				<td><select name="sem" id="sem"
					onChange="myNewFunction2(this);">
						<option>--Select Sem--</option>
						<option value="1">First Sem</option>
						<option value="2">Second Sem</option>
						<option value="3">Third Sem</option>
						<option value="4">Fourth Sem</option>
						<option value="5">Fifth Sem</option>
						<option value="6">Overall</option>
				</select></td>
				<td> <select name="branch" id="branch"
						onChange="myNewFunction1(this);">
							<option>---Select Branch---</option>
							<option value="M">DME</option>
							<option value="EE">DEE</option>
							<option value="EC">DEC</option>
					</select></td>
				<td><select name="year" id="year">
							<option>---Select Year---</option>
							<%
								try {
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/diploma", "root", "");
									PreparedStatement pst1 = con.prepareStatement("select distinct year from subjects");
									ResultSet rs1 = (ResultSet) pst1.executeQuery();
									while (rs1.next()) {
							%>
							<option value=<%=rs1.getString(1)%>><%=rs1.getString(1)%></option>
							<%
								}
									con.close();
								} catch (SQLException e) {
									System.out.println(e);
								}
							%>
					</select></td>
					<td><select id="subj" name="subj"
						onChange="myNewFunction(this);"></select></td>
						<input type="hidden" name="sub">
						<input type="hidden" name="semname">
				        <input type="hidden" name="branchname">
				        <td><input type="submit"></td></tr>
		</table>
		</center>
		</form>
</body>
</html>