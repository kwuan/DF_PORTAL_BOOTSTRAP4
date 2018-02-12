</section>
		</div>
		<footer class="main-footer">
			<strong>
				Copyright &copy;2017 Depthfirst Co.,Ltd. 
			</strong> All right reserved.
		</footer>
		<div class="control-sidebar-bg"></div>
	</div>

	
<% }catch(Exception _exception){ logger.error(request.getRequestURI(), _exception);_exception.printStackTrace(); } %></td></tr>
<!--end container-->
<%@ include file="/include/_responseMessage.jsp" %>
<%@ include file="/include/_locationPicker.jsp" %>
<!--end footer-->


	<script language="JavaScript">
		<!--	
		createErrorPane(getForm());
		// -->

		$('.datepicker').datepicker({language:'th-th',format:'dd/mm/yyyy',keyboardNavigation: true})
		$('body').on('click', '.day', function(){
			jQuery('.datepicker-dropdown').remove();
		});
		
		/*** Use Select2 */
		$('.select2').select2();
		
		/*** tooltip */
		$('[data-toggle="tooltip"]').tooltip();
	</script>
</body>
</html>
