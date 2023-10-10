<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
window.onload = function(){
	swal({
		  title: "아리아리",
		  text: "${msg}",
		})
		.then((willDelete) => {
			if (willDelete) {
	            location.href = '${url}';
	          }
		});
}
</script>